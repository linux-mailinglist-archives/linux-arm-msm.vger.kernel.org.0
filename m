Return-Path: <linux-arm-msm+bounces-27715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D76594495B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 12:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF64A1C21136
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 10:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0D3184539;
	Thu,  1 Aug 2024 10:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IDatmGVa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3C313D626
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 10:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722508422; cv=none; b=NGXxTuVk4Gw+7PDpKN6bzogHkyTiS4K3ZO+fEiAdCj6Sz73rn77T9Nx8KJE6mp05TwflNCDGkF1R0D/AIAx+mPgm7c4flJUdU9XlV6jKyh36AtTRs8egWPnFoXt8fbxHw2RZoldbdaeFoHPYyP9vMhHfZEh2W0fTKezBJbyARR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722508422; c=relaxed/simple;
	bh=bjhQLQz9r+qgUE5nGLyvNJrXOF+KlCK1fhgEuPnhK74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiTwOKCaMIw+Zl+WcXS7H73ga1LwiTTigdVBgQs1tpDOo31MLoN1kgR9Mx1ls5t5Tc+8cE4Grmu1hE2sgp+HOb1ipFQaw+cM3Mq+Kkp2AHOzjC95bKLGPSjec1cbafQMrEmB8Cddc1/RfYxq65VhqOgSgt7ecBaOMgsq+fkCZdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IDatmGVa; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4281ca54fd3so36593145e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 03:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722508419; x=1723113219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2DZ9JRnL0e7KpbgL/FSZ6b64iFFZz5Rvxbediv3ijJ8=;
        b=IDatmGVaUic9Og7PO9OwK4tO/hOQhNPY/gJBcOtKopo7LHq3Dfsq1/mYqztxYr+Wfx
         44V8fY4ds+G9hMfZ4G7x/kLWffWRjV462lFbPxH+Ct23I6ftofUfnjTjf2hT/IaNeCNE
         OTeOuXpBochlU2ygo7fl59npq3PzlqOksCBXCiKsXlkfrHzWeW/WSuMguqxgDcjAyzA8
         Chr0JxwDETjMpKFiqoOHNPeJuYQLkjt7dU0H8gn/bl1yCg+aR40rMthG0IVj/dCEiSNU
         q/JanwOAIoj/dSJSB79rSaLEUb1wvraZQNkuXgylf8ELspW3Gr2Z9hd9yJ6H1TrHW0xS
         pqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722508419; x=1723113219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DZ9JRnL0e7KpbgL/FSZ6b64iFFZz5Rvxbediv3ijJ8=;
        b=M+fZIvCnmz1K78l1WkBdIUZ2SxD2973InfBV6CNb1c0uAuo3V+tUgVnv+0zQ0zdyeo
         xali2F8ZeJrTxBvAgNwO7hZ010gcivnHdMf7+LuiIcasarnaSoxG+oMBFQmAvRCsC3dR
         FyXMSHMFie++nFcbvIMGcexbWlL0k4UJ030DBjLbCWbNqLESAomzJJAFAuYiGttrNAMX
         uR5eoEmucu6Yzv0+GzdJoW9IRP3qtZuB0ieX39BhB+Cfjbh4Lq95El4CSaQOLrRVDGdU
         MH7sLDxJz3gxb9WXM2op50jbWeKTRHnyoJmbC8esI0U1Uq66+poIfYiU8IUT2XpV1zkJ
         9e0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvdqsCnJxLjAMOhbCgD5GMkHZILpytNQAzp22YpZotFmm5Dn4xn6QkT3fW/lRv8+/2vzzAPB8j50nDecGeqm+3vygeFJpgQcgmrcFiwA==
X-Gm-Message-State: AOJu0YzyDAN+46062Z7m/YClyJm5hXe6FE1w/+/Vn+GgSBJa8XTWuIEc
	3uKvaNE4ZxYfPz5KpWBtcuvpU0YMJ6jyeD8KFM9Qekk7eb3qOmDr4melSIpWQWU=
X-Google-Smtp-Source: AGHT+IEQgVTcNKj105V6VOej2nknnx4vup+h7CU4av90EuoPVBm6nZUMtPvjq53uwkUNQcyJVXl21g==
X-Received: by 2002:a05:600c:3ca7:b0:428:150e:4f13 with SMTP id 5b1f17b1804b1-428b4ae2222mr14059125e9.33.1722508418390;
        Thu, 01 Aug 2024 03:33:38 -0700 (PDT)
Received: from linaro.org ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428240b2d65sm44538315e9.0.2024.08.01.03.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 03:33:37 -0700 (PDT)
Date: Thu, 1 Aug 2024 13:33:36 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qmp-pcie: Fix X1E80100 PCIe Gen4 PHY
 initialisation
Message-ID: <ZqtkgPf+JOP+im1s@linaro.org>
References: <20240726-x1e80100-phy-qmp-pcie-fix-config-v1-1-b569f03c0c48@linaro.org>
 <ZqOysDk0LqwxG4OF@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqOysDk0LqwxG4OF@hovoldconsulting.com>

On 24-07-26 16:29:04, Johan Hovold wrote:
> On Fri, Jul 26, 2024 at 10:16:56AM +0300, Abel Vesa wrote:
> > Update the PCIe Gen4 PHY init sequence with the latest based on internal
> > Qualcomm documentation.
> 
> Any hints about what these updates imply?

Usually, there is an updated variant of the same document.
I've been told that this values are fine-tuned over time.
I'm assuming these updates should help with link stability, but it's
just a guess.

> 
> > Fixes: 606060ce8fd0 ("phy: qcom-qmp-pcie: Add support for X1E80100 g3x2 and g4x2 PCIE")
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 23 ++++++++++++++++-------
> >  1 file changed, 16 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > index 5b36cc7ac78b..8b624afbf014 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> 
> >  static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x2_pcie_tx_tbl[] = {
> > @@ -1286,12 +1287,15 @@ static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x2_pcie_rx_tbl[] = {
> >  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_DFE_1, 0x01),
> >  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_DFE_2, 0x01),
> >  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_DFE_3, 0x45),
> > -	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_VGA_CAL_MAN_VAL, 0x0b),
> > +	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_20_RX_VGA_CAL_MAN_VAL, 0x0A, 1),
> > +	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_20_RX_VGA_CAL_MAN_VAL, 0x0B, 2),
> 
> Please use lower-case hex consistently.

Sure. Will fix in v2.

> 
> > +	QMP_PHY_INIT_CFG(QSERDES_V6_20_VGA_CAL_CNTRL1, 0x00),
> >  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_GM_CAL, 0x0d),
> >  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_EQU_ADAPTOR_CNTRL4, 0x0b),
> >  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_SIGDET_ENABLES, 0x1c),
> >  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_PHPRE_CTRL, 0x20),
> > -	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
> > +	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_20_RX_DFE_CTLE_POST_CAL_OFFSET, 0x3A, 1),
> > +	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_20_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38, 2),
> 
> Ditto.
> 
> Johan

