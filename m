Return-Path: <linux-arm-msm+bounces-39913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B169E087A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 17:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEAD917378F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1B913AA2D;
	Mon,  2 Dec 2024 15:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F6vuUL/d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436FA136352
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 15:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154500; cv=none; b=MXCQ8xHgch+fMRbjmzvsvfUF4ergzm1K/6g4FvHaXhV4hOIVWGqcFP3rxAb7ILBCI2k2RAedHugPEk/o5E5B9UL27+R2kpmas6q7VbPhyzZcZU2G6EYvj8GWRMpL9RlreS9HFzSt3UCAYKmTxjTKnWrfPNiiUh3Qe8+u8pjKfLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154500; c=relaxed/simple;
	bh=uHjedfVRrZ+e3sFGTNQ46N0aIuL9DX4TX/57voliHDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LiVC7owfzu34VIvBdxRPFAKUDQqlqFXfguqJU+yiTn0V1Scpd0EnIU1/ci65UfSHyhWjABqyBShrugAU3spHo+AV7BoKawjL2/S7L1D2phYsYoiCR7Kz+NqhXg6npz4VJK6kgAq8SdF9OgnJXWhFIpDziknUdwk+TaiuAsXzkWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F6vuUL/d; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53de92be287so6349129e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 07:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733154496; x=1733759296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xfHRG0ckbabpB5WkAOGLFC/tsNXMkX3A9rmcYDbuN4Y=;
        b=F6vuUL/dRzR82uF/XRVcmZTG8/Y4/wgxNwdZHxTWoxaPrEB/JZ5NMlnZqUdAjguM5F
         ohGJYa+nj0V6bBpWDRK8oCNmQvNxbMO0E83UPzy8W3jIm07MSd2Y2GHjjyGcrRSwmVLz
         d/GiO/N99sVuezwZ1NUljKwtaBCu+dB/SRoQyULOSEtSS4nh8JTtA6HLkZ4b6fjj3yJi
         P5qPiFNiHi22Jijmjhh7FKABnHUdk9AxF0+pSAJAbYJFv4HO3Q5/jcpssYErye59ipuK
         j5GWsnEJa9aqAy/r+N1BQ3y3Zakk2JqzN5NPScJyF/LPrwvoP1sFLYq16g9f1jIGMDFL
         xKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154496; x=1733759296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfHRG0ckbabpB5WkAOGLFC/tsNXMkX3A9rmcYDbuN4Y=;
        b=RxlQHZ5Mb6+xNZWdi8/7krVF8dnTv5GU5hvXvlVpYpsjV1RFD58iqlVvoKQqErmEJi
         BDy4gPMSADPMQAD45gOE4ARZozpfpuM3dzagX+VleS68doGhbIrZCm2r5jXbwyciUQBY
         n+XwseF7cSMHpVN55QEr8HIQ7DuFPPnhrjdJj9lRAgGHorY69DGvC/JHWEBI7IINgUPd
         PfK5iww5TwG4UF1U/f0srL6Npq4Kyz3yxjs9IxSiah3c+UzWS5TZQ5FzEH1xv48rl4Zu
         icDPSBflxov3f9nkvEbRr5qJmNp8g6RvAs1vam7Cc/+RU0PrIDoMWpUPJxkrnUtT+HCb
         BMNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkDVVAVDwQYVce9HevxLTRHOcFsEmDvtb/6ugklFqc4yvyAEcxg/sfKJRgNbNZGDCFiO/amq6dVI/SgIvV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmvy6V+k9LJ9WNPW3to45AbzwvHqMdZHbOPUuu/RN09Hl+Y8QQ
	nnk+ayhqWeYB2KZPtZfE+epNVQNJt1qeo69hi7PYvmCy7XrR1C1P6ouEEawt3tM=
X-Gm-Gg: ASbGncv5lA/6qgTc+C1X6tMAkB/AmB9uFTXRI9nlV23uecf6ACkqjzhOg40S1AJNYGa
	vJQVTQUqgNSFZbIC0XXOxyZb36Of9/pB9Yffbsb2/kV1kTuFuog0zzlhqeRwdJVUItXiI087hmL
	w2f8mrXsWkBEqEAnP1Gj7ozBGcVrqlgKxd4eqXCqV5L4HpYsCzuSGeptS5pWjEJgA+M+Q4B3e8O
	HRP2fRzHJkKWU5iRp12fhcfXUuFAg1xxagk5caR6eBqNW6bOn/4QPVolNkr4rk9XRApqa5iL4Vb
	NeEkuvyrJZq7Z0ccnyLYH/eeH+o/5Q==
X-Google-Smtp-Source: AGHT+IG0Q5k/W3ed0OQwMlkM6qlSogEM4cPmSjYiJhbwpudSDr/7EC5mlTOxyGWNLuXKmiBWsxS+wQ==
X-Received: by 2002:a05:6512:3b0d:b0:53d:ed95:9bfa with SMTP id 2adb3069b0e04-53df00a96d2mr17148818e87.7.1733154496365;
        Mon, 02 Dec 2024 07:48:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649f638sm1511742e87.239.2024.12.02.07.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:48:15 -0800 (PST)
Date: Mon, 2 Dec 2024 17:48:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com, quic_fangez@quicinc.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/8] phy: qcom: qmp-usbc: Add DP phy mode support on
 QCS615
Message-ID: <gnrdym5o345fsbtxmfis6ykep7mzvhkxxnizlj5xplrsaaijjq@5465y2oamqoh>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
 <b310587f-c6c3-41dd-83bf-6affbcc65730@kernel.org>
 <22600892-3b0d-4b0f-9c46-e74241960dda@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22600892-3b0d-4b0f-9c46-e74241960dda@quicinc.com>

On Mon, Dec 02, 2024 at 06:31:44PM +0800, Xiangxu Yin wrote:
> 
> 
> On 11/29/2024 4:18 PM, Krzysztof Kozlowski wrote:
> > On 29/11/2024 08:57, Xiangxu Yin wrote:
> >> +static int qmp_usbc_com_init(struct phy *phy)
> >>  {
> >>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
> >> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
> >> -	void __iomem *pcs = qmp->pcs;
> >> +	int num_vregs;
> >>  	u32 val = 0;
> >>  	int ret;
> >> +	unsigned int reg_pwr_dn;
> >>  
> >> -	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
> >> +	if (qmp->type == QMP_PHY_USBC_USB) {
> > 
> > 
> > Sorry, all this code is unreviewable. Organize your changes in logical,
> > reviewable chunks.
> > 
> Will create new patch list and seperate patchsets.

Please respond to the comment regarding the single PHY vs multiple PHYs
first.

> >> +		struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
> >> +
> >> +		num_vregs = cfg->num_vregs;
> >> +		reg_pwr_dn = cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL];
> >> +	} else {
> > 

-- 
With best wishes
Dmitry

