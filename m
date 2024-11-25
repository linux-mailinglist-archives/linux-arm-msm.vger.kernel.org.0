Return-Path: <linux-arm-msm+bounces-39146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 558DB9D8E7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 23:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37272B261AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 22:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48EAC1C3F36;
	Mon, 25 Nov 2024 22:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l2Ac0jde"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7AE13C80E
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 22:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732573767; cv=none; b=k2UM18SgOOf19CnoOBRlnXs2SB/VouPHrzY/WwwOr39kVe2jsskEaYhusAM9RPtrPn4NifNAHTCvQnOUvQpheThYgP6XQxQ/y6PLcL6jSGnlKQEc9a2vLK2e4YddnLBxVdvkCTeVM75k48XY1ERzsXlFnpUUsAKBAib8wKoYJ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732573767; c=relaxed/simple;
	bh=Zv4igQKh76pMJsT32dZiQKJumIdYGyMxWxv5i5Cxj9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5roDY86sYFjD6JtBkgDLaPZP1EJ2oHIIgu6pNyPxzZ1nvbXcF70b5O40vhhfUAhdO8L/oa9QcEVQP8nQf2vGTfZUQKmMyLIY+j6/H3y0uO6FZyerf+JZ2ON04wdWEzt10Jp2d4UOjauHVk4NJvZcpAx5paK5culqJOnWN1NCuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l2Ac0jde; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ffa12ad18cso56606781fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 14:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732573764; x=1733178564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k7Mjha7mt7/m4DZzh3o0nA7+a6qpYNJG+dFaWFBEpuk=;
        b=l2Ac0jde0jeC41MCjc8QCwIq90/JFKSDJb2ftEezKaI6cQmG5Z5QFaZgyV/3B3dGDH
         B8yutOie+QwbvoKx7C+F6ZIVxfvhS6L7G160yUrvyGxaybZ1IsovD2S+en+honukDhDG
         +OwrEm9isWzYwNv5CcHua+adyQkxz/5gzyeEsBmqeHaS794ks6kydsZpbdUtzilzN0H0
         Ku+Rx1yN3EdVLdA/L+hau4SI+tp5y2emz+ldU4pI5XRPTox6EqdPQ8hVOhUeH23kXXDE
         lLhxjhBiG/jPn9/O5itZKVXiWh+PfwlIDdUwN85e/f/LOAAnLUMWJDa9nQjsEWj8x/7F
         g5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732573764; x=1733178564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7Mjha7mt7/m4DZzh3o0nA7+a6qpYNJG+dFaWFBEpuk=;
        b=m1/3X87wqg0NgQKtq8gUVz5Xeh6VPM4zc6MsNf7MD4Y2KLNkGpZF/AMp4RjFqXjiC3
         8ImGRQsB+LK73FY3PeE5PYEcNnYFJ0skHZKiAQOLfPVZr/lq9MehjtLEbH2tTYaeMppi
         LoNblgEaRrPP/NCpxhIYv97EL1XRh3iPqcJoMr+6dESqcu+SCuYMDEVFX3ESfWUZTKL3
         zeD9vu1xmgmS+VAS0EyXNK9IYlSeObEnoUfbds12x7ST8J6cKRz4jF8RUoeUrek2EHy7
         FsK9QAAj5RY6km/KsLfXtA/NJo6uZ+JFxPcNS1KRdFTtoVk+7xZvlEAvlIwQ39BVfDHJ
         Rs9w==
X-Forwarded-Encrypted: i=1; AJvYcCVkvyi982I2bGEMob8ilx91UI10z6yfGrfl7rS60Zh58N4DlsOQPgSgLPncahShw/IrbwJ4tMs80dQkTnWi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu76wttkk9lRSxLt3R3mnR/IMn5pomDLCV/t/lOyJ4GyT7mTKV
	nWZv6kI+U9QJK0ngREZ+i7QmqdwpFFmIDPRhjW6S1TUl1ogyD7QD7+fbFy9lPJY=
X-Gm-Gg: ASbGncsJEb5VJM9aKMzv54BwsUEhEfJ93kaAsN5c8L7w2kYf1LSgRbTTR5FLDMge9wt
	ZKmYcwGTpE2tM1RFxiwyIHc/Oz88YGAf1Ly5n+mj+NKQO3ZpN7kU3Z13B2I02tPelFxKnl1DLLN
	nXOXvlNW8pvIwdGzj2FtOKhRVqyRG8cZCdZxesnvQ2ofd6XF7JrNrxDREmRqrSLCGALnqAGqr5s
	IDNdlS8dxfQ/VYU6qzXHAQesjSx1U11v1QAmGnbK0y7BmnRIIATNIu2L/ZEdevGRX+KFB2yCILU
	rvIFGxLhDXgvyKMWXDuw1Rcbfd7Mhg==
X-Google-Smtp-Source: AGHT+IH1IKpz08cjmxxXUbJM5uXr9tgTCebrKIjGwrE87znYHiTuxb+ZVdM3K1db1okc65pMOPjqoQ==
X-Received: by 2002:a05:6512:3a8e:b0:53d:a58c:c5a4 with SMTP id 2adb3069b0e04-53dd39b0e4cmr6366883e87.40.1732573763643;
        Mon, 25 Nov 2024 14:29:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2496ae0sm1820105e87.239.2024.11.25.14.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 14:29:22 -0800 (PST)
Date: Tue, 26 Nov 2024 00:29:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: maud_spierings@hotmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: x1e80100-vivobook-s15: Add
 bluetooth
Message-ID: <7mmnvrgzmqujse4bz2eosdnqmogyvfdi3ei5ez3es562qncks3@yqre7fakszbb>
References: <20241125-asus_qcom_display-v4-0-61a4da162406@hotmail.com>
 <20241125-asus_qcom_display-v4-3-61a4da162406@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125-asus_qcom_display-v4-3-61a4da162406@hotmail.com>

On Mon, Nov 25, 2024 at 08:11:19PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> Add bluetooth for the asus vivobook s15
> Describe wlan configuration
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 164 +++++++++++++++++++++
>  1 file changed, 164 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

