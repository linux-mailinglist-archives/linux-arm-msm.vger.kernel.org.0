Return-Path: <linux-arm-msm+bounces-41002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 689B59E910C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D1EC280EF5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 10:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC951216E39;
	Mon,  9 Dec 2024 10:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o9sTKXLi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3619D194A53
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733741818; cv=none; b=TYCCeGAMkMvk93ucoALkR7THEeiugNeviZUtkQPGFETuVQ+h9RA3F+o7WHPb4ygNxGmvLbHNMOFC1O65PRQeoVfsQ/yg9xN7PDiyMJyE+7Vk7WnD53Jzr+na3jojsQaon9q0WRuyCxrkHLRTMhoQn6fmywHF1F3RUp9/Z9Nr2zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733741818; c=relaxed/simple;
	bh=+hIqe/S4QmDOQhbBqmZWXMgHf/K5HX6ZKx4rNqDaI+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXcjD7Qb60zwH2Qo96Yn2SQxs+sPuz2zvUdgIDB3sGZacUqBI+wiVhmRTLaGIP4c+LuHSlEGL4p9hew9oN6hSBPo3bvAuGfpWWmgXGkTSgryDBo493KBti/6q7TyNrBqAh1pF8VUdsSGtaRNqXX7mM5q7cfp9w/QBca/r4tkmqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o9sTKXLi; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3001e7d41c5so36364841fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 02:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733741815; x=1734346615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ujaAnVbj3AWarK9qtUD67P4FOEUURSL/PjGWuchpTYY=;
        b=o9sTKXLiYAY9D6gd+tBUC/DKVB1LSXHY77IFItaRz3YQACOwIi8PWrunjfnC4ZzISG
         baEpaAf7xWvTWqvKrCL3FNgDrrKuhKDBfqP+6QGy159jkX0qMSGuZ+pWWrCNhIYytPPA
         0inDWB6cDBbCv3gtF4nMXuE43+ZExKoWfY/h+vNJr64y0nv/4qm1ufJyT3T4tfE8Miac
         AaJ/YCvR2BJDPfibUmjlEt22horOEswtwINrJJCoWkmyHRcH2ioA8Gfhwx/AWjJbAk+h
         kJlCU4Kn2opYnLVqs8pQK4mljVLLHcGigNgdFQgp/nP5S5woZRkYW1T0r60HvymGWo0I
         EqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733741815; x=1734346615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujaAnVbj3AWarK9qtUD67P4FOEUURSL/PjGWuchpTYY=;
        b=ocrloGNEWzrL6VQAmWcFogehJTy5HOoGjyozf2mwnTStmbjRLZR3g4njMbBbqgJwP6
         e5xpnE+Q1qZMUWUZMFBleGqe7mkRApgMKyN72k9fgkjFIkb+uW+n3VcsC9VNVayypz/k
         F1KV9D2t/27lSceNogL4uZm++ZgmjdWRix9MgUAiwVU3RrtGHkDoGrXHBPNRkyH1B8Ad
         j/ZzYiMLRP/wz0dlg/Ohni1S3UhjyaT5wwobTRKoyHlUlWuC/wYLTG1LsN+8FNUkrZo4
         LjetUfg3xLMEoen/vdIa1nCa1pYMFAz3eILYsLOqtA7he3w5mK/i+TOo+0Fod/U7MCbg
         0NHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDL1l78IYYDIL3YdL1ZIvKabQZCbh01CLbmu8xb6fV19yuBnVvEfDixDxskRiAa227zjyAGh5McKW91BFO@vger.kernel.org
X-Gm-Message-State: AOJu0YyvCPwYnTqkH/Ctl/Sww7a16AoLAOCZ3vpIDHZ6VXIqNCuBmZTu
	Yj4M1VrJqhwk+QvMjaM7k1wRth+cf2GCernRVwqQ67VkjrmAcvvZoHXar2oO47c=
X-Gm-Gg: ASbGncsGaSt9q5Kx1hHNBWjZ8LdOo2X8JA4VtvIXY55qMdf7AKe1s4ZAj9A7791r1GG
	wwUIQ5q1mhkSA4OSABIHBsQiA9Ye8Gq89xDxVpiLb9Yv/tT1iKMQdC7UbxA/4vQUtILIAppwCbH
	kkR8IVZ3xDepX+bsIYCqJmubCqVha2XavON8Bk6WAhgkws7bEB3MrczAMb6ovnL9PRKSHLtwyq2
	qhf8xVrAyTAyMs0ClpkeVBplzrJyBiCh26pQ5DzjotNWMyidzfuCE3U1lphmL57ZZNL+x1enXnC
	4jaDwZNlT6HedNotQ95+aqvrb1A0dg==
X-Google-Smtp-Source: AGHT+IEe3E3bVz43C381ijw4BD9zV4cmUVA4lOxfc676Po+XiC+s2QUjs8LbA4yvZYwgljPHeTSG/A==
X-Received: by 2002:a05:6512:b15:b0:540:1ca7:4fe9 with SMTP id 2adb3069b0e04-540240c97b4mr13875e87.22.1733741814988;
        Mon, 09 Dec 2024 02:56:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54020269fdasm214549e87.182.2024.12.09.02.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 02:56:53 -0800 (PST)
Date: Mon, 9 Dec 2024 12:56:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, quic_mohamull@quicinc.com, 
	quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 3/4] Bluetooth: hci_qca: use the power sequencer for
 wcn6750
Message-ID: <heyjpkzb4cxomosg4v5rzco3gi5d32vyecuyfgu2au22p5utat@2db4a3mxtblg>
References: <20241209103455.9675-1-quic_janathot@quicinc.com>
 <20241209103455.9675-4-quic_janathot@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209103455.9675-4-quic_janathot@quicinc.com>

On Mon, Dec 09, 2024 at 04:04:54PM +0530, Janaki Ramaiah Thota wrote:
> Older boards are having entry "enable-gpios" in dts, we can safely assume
> latest boards which are supporting PMU node enrty will support power
> sequencer.
> 
> Signed-off-by: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
> ---
>  drivers/bluetooth/hci_qca.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

