Return-Path: <linux-arm-msm+bounces-65264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96182B077ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 16:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C74B1C25A08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5FF1C5D44;
	Wed, 16 Jul 2025 14:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WBo7xE1i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E236C1D61AA
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 14:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752675726; cv=none; b=R4Mv3zFu8kpRY/lHhKEqZLAw06K7CbG07+p0NEi6DFHmPEYEI2bWlRFD7U25WliOoZDrPUDD+9DNT8rDgTBuSbvr/jyVszjHq5cAOxVHPSPAuxwjyAUtcs72hbVwZMFI7+V1pzdy4PZyuGXdxh0bAmy5zpNiyJ3DzH7DCCKx384=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752675726; c=relaxed/simple;
	bh=qaZ1U+EgInwMaLZWb6rGxEaSX9h3KvSTvEqAi3ZlncE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+8fk4UwvcEIyU67scGZEIoCKu9UvYMzWxYJQhN4vTx2cUwnO4MfQklY+xxDFkJgFNzaOgSXI/BXAuw/F1KJkEuugeicl93DcImyPTb0UKptQeHNt0ZSavIhM9Z6Jaof7QC0BiYNqC2ht6JY/dsk5eQ8muU+g20CGb07+FE/prc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WBo7xE1i; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2352400344aso60592345ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 07:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752675724; x=1753280524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mz5RRhyfwITv33oCf/7iVVV0cKwknfvfP+MVHktAv/o=;
        b=WBo7xE1ivf6G6ItX1SwfpS0fPH79RS7eWvu/YvQM1NFRoMcwH1u8C1MYrWEM6zulhw
         1AjuyA7hHu4sNm34kgqGdVKhFkTzKw9iI8FrIp92OUE7i6ETa1xl+yIBCLhsRWlthUoT
         0lB1kmVs8xH5Y15h+8x9qyWX/dWdOZlcLc+Rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752675724; x=1753280524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mz5RRhyfwITv33oCf/7iVVV0cKwknfvfP+MVHktAv/o=;
        b=ZbCmVf4KIMUoHka8qVV6FBa9QCVMHDsG3FFi+L69Le4W0kkDKJpvx/iBGhm4rTNcPq
         0uylE/5J+Z99/5F4LQfge9TDImKUCK2SxxTXj8DgAJ2C3UTClNVP487f1pQ3Qyo6poc0
         eypQDfyQyk9zj4BKTxkZKjThrgipHfI0bD8CAzPxZOVbKIVnUTfyZhfHHi6ZyPokerOI
         TlrzCbl+RoXyoTE/vT0zDBdFaKAE8UvseSu4E2N4OkN4BJwl9laBFlBZ4Zer6wpuI3gc
         /8pH6Dn1uaPqU2kuP5eiIN97GQexgtUsH9Jj7Np9u0rNTXShwOfr1xeT5/N4XoURGcPX
         E3lA==
X-Forwarded-Encrypted: i=1; AJvYcCW/OWQMSmGaQC5hNuBFmGdDjPffpsCIBU9phYKI1VawYA2IgIAuTXmx4O7TkeD5YWyqiQ/RK+P4mn+sNh2A@vger.kernel.org
X-Gm-Message-State: AOJu0YyJprACEshMpcdUG4NSoszs7FM93iqzaVxPoWeohLTXQkeHfDyi
	3gL9jBFHIZkZh+SofwAQ397I1LAHWBVoqPk9wKtntCv3IaogBa9twI+bjwX4tP2R5iBfKG15fYz
	fE7A=
X-Gm-Gg: ASbGncsTwAE1VpkGU0aQG2vBbC6Mtmy79P1cg1BPUemN6UUIsmPsp1IjE+ZF4ixmvtq
	uYK/v6SYR0CKiaWT0bQ8YEkIsooLLmrAHSFp0dyo9iUwjEmG54XzFT4odcYdnyfRRfxjLrOhkVF
	bQGHgYLO67j6dDxogeK+gf3g4zR+Axa2WxLnczTLwxanv7O8770o7lDf0deN+JZUTBewKu5Eq+q
	3h1TnCdPI1p9ERVci9TQMHX7WfZE7dnrTG4ltUQne0rGdNgW1p3GwwUaPcpjGMrAK+CCLaxxpnv
	DcsJc5nQHVu26WfXHMtpuhP2nMRrAe1y8/utOAg+X8s/vmvD8kY2ENYy+WLjSoxINd/dEFRDbk4
	vW0k9AWc2C0evD4AQxPqJViZ3MOs4MbrPbymQDNCylrDPwa7LRSVKm1uhm1QlrhD97A==
X-Google-Smtp-Source: AGHT+IFPr3kpmB2YQzvQPHx5Oovdn4AOzkVv5B6jONqMSEy5Nk81bMFCGpXifDYw4HYsq+soxwtPqQ==
X-Received: by 2002:a17:902:e550:b0:235:e8da:8d6 with SMTP id d9443c01a7336-23e24f363a0mr48647365ad.2.1752675724177;
        Wed, 16 Jul 2025 07:22:04 -0700 (PDT)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com. [209.85.215.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322776sm127519755ad.132.2025.07.16.07.21.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 07:22:03 -0700 (PDT)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b3bdab4bf19so3700379a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 07:21:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8afmlMtSC/ZHJ67u6/Q72iy9Jp5H8cypf0yO7md/8nIPhDDZbQootlBAwY2otKlItAc2uI0rGiNHJMamm@vger.kernel.org
X-Received: by 2002:a17:90b:1646:b0:2fe:85f0:e115 with SMTP id
 98e67ed59e1d1-31c9e77cfe5mr4368025a91.26.1752675712704; Wed, 16 Jul 2025
 07:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
 <20250716-topic-goodnight_cheza-v2-2-6fa8d3261813@oss.qualcomm.com>
In-Reply-To: <20250716-topic-goodnight_cheza-v2-2-6fa8d3261813@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Jul 2025 07:21:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wj=J0-3rpjEsdLzgHzY3nXw0CWaCTHfbkNnu5H=VCPgQ@mail.gmail.com>
X-Gm-Features: Ac12FXzTw0wKAIsfrwSNsVdCEfNSNshL9d8ykTsLQev02btB00hc45WqX4Wa3pM
Message-ID: <CAD=FV=Wj=J0-3rpjEsdLzgHzY3nXw0CWaCTHfbkNnu5H=VCPgQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: qcom: Remove sdm845-cheza
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robin.clark@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 16, 2025 at 3:16=E2=80=AFAM 'Konrad Dybcio' via
cros-qcom-dts-watchers <cros-qcom-dts-watchers@chromium.org> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Cheza was a prototype board, used mainly by the ChromeOS folks.
>
> Almost no working devices are known to exist, and the small amount of
> remaining ones are not in use anymore.
>
> Remove the compatible strings reserved for it, as, quite frankly, Cheza
> is no more.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 3 ---
>  1 file changed, 3 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

