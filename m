Return-Path: <linux-arm-msm+bounces-51423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF6FA61415
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 15:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2064A3B6F94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800372010EF;
	Fri, 14 Mar 2025 14:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mksSY5yo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC42200112
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 14:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741963844; cv=none; b=RLHQy0VUCybzQmj7YmZYSEIFKSmL2wXPiLpb3QrzGyhxt/zEBPVHySPlDdi9UnNcvOm23cFw/4whqwW4z7eC5JxIsurgQ1hMmW5OkFeIbFt2bqHSiJ5DWnt7S1Qfk7cJMxsVs5zGY7J/ZEnRWc4BUr/YSvT7s5LRwXzJEnnyUPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741963844; c=relaxed/simple;
	bh=maO4VrlOA5Crgv/3qBCu9Kk+oUeartKpyLArd51qh7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2Be4AT6hi/kGx+JsMyebGRjFrrbxZJj4M8BmWRsVRgBA95IsivyvsRKkaolt+K4Czxcbav6oPASfeaaILFAk9lhyOfJKRtnMc3pOlZXh2/vjBTdjRwOlZ3T6K5TfCkKJEwBABhHFOv7W8fgy/bbVY/VVJTc3NbTKNRqzJQzz1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mksSY5yo; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-224341bbc1dso44597445ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 07:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741963841; x=1742568641; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7OrItOGYSNYN0heMZXm9O2Sd5YIsOC/lcspBLUrGTOo=;
        b=mksSY5yoJH4Tcp4rWXEzbFSEBM9Uco3ucM3ETh8xpcnQEugnJiob/Wz45hlEhsFZWn
         Hvew+7z4nw75/MOVQmuK3iOQsrNs7Odc3ZeF+BP197vSuU5gZfUWje0L+AHED5x0vyJP
         z2qHOEU5E8iRnhom4XZwPINW2qk6qrm/HPShoEYJpSe6nVgVAwxoXbfoz83tpF78rNCh
         IjLq7Gzvhy/VJHJkDXWNUkpBXCZ/OHIgqYwy5aQqSw/iLVdKFao3pr7gz4D2qLH6m56e
         pzj1wqaVN3jduVNJJ0bwh+omPAQZffjlzAa6o1C+s+pvP2r8IoN+rDfV5ayYA1wloSiU
         z2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741963841; x=1742568641;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7OrItOGYSNYN0heMZXm9O2Sd5YIsOC/lcspBLUrGTOo=;
        b=ZllyWuehU9tQmaVf/gjI2Y8XEbGVL/wGGAndSEksQSv1yM6afee5sJuKvXJaTiMFu7
         bcmEjakwhL1/W8WBOSj+0uVaTeUlr2pbqdG+D3Gi3aXn98R49+A9U25FCNQxR/Xoj26k
         5QfOrV2MVOkbfR9wczirAHbF66xv+DB2MOjCndC8gAD0xSGtrxginrhgyFOF9b3/nx3Z
         Vz2q9KHQO77kuZ5b8fwF5BYzpgi+z5caHs71JgsDb8E9DwWLjXLvUKuxY8sOe7nPK/Ew
         52r9gvoMGS5Zq6QR/RZ7EcqqFxerPkrFqexiACVFlwEY3LVcnZbpjqtyOi0JATBUAtM7
         b6JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrdb8a+WPTlmUuD4gTEVIBZlPhpmVhceCMSHVmjA31Zj9oVwi6c5cNX4RPVdg980nSSzD/3w3vwF+9t2h9@vger.kernel.org
X-Gm-Message-State: AOJu0YwceLb7d2/b0CED5DpsiWitZvbSSoToNWE0cfMjg+iMjDLgCoAk
	JFwxLni8pXT4ZKCf9OckzFaKZOgDzrTZ6YdzEdMbJ7CClUN5Dp37GqsMM2qPtw==
X-Gm-Gg: ASbGncvITvFzZg2zHS7ZnbIUlkChE66ZmncT/Gc7tXqZTOTp5FI04cjxzH2zwK/6ZLm
	ahL/TmgNw9EY6l/SUEAVXOgnXN7fsYv54F2SC51RcpuzcZ3e1kPI2vShMKGIaHGTL6Dhx0fZT5c
	sRGKFAzyK5fJMBm2S8QtyOkvCBnouUAzzfIwBLceUQCrG4Pr7/Rry5Z0CdvDSk1CmKkJ19bVOGZ
	wg6+L8sX7jYxkPLwKLz3Qut+4oFcbblFDTbF0NnQLUFYTAHZ+KYCCkU9iKhW5l18wupzdVAPFc0
	FGDrtxI5T6mgXQ3o665gw4okQtMNlucWskUUkwy2z0V0JsGffRnmrC9l
X-Google-Smtp-Source: AGHT+IHmY97xSOZQboXnoTB4b5k6xHHuACGBmQ9IazWwAK8CRME94eJLpOCS80qaR25WQuoGvR2UGA==
X-Received: by 2002:a17:903:98b:b0:21f:4c8b:c4de with SMTP id d9443c01a7336-225e0aeeabemr39677735ad.42.1741963840675;
        Fri, 14 Mar 2025 07:50:40 -0700 (PDT)
Received: from thinkpad ([120.56.195.144])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba734esm29357815ad.141.2025.03.14.07.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:50:40 -0700 (PDT)
Date: Fri, 14 Mar 2025 20:20:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de,
	dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
	quic_qianyu@quicinc.com, neil.armstrong@linaro.org,
	quic_devipriy@quicinc.com, konrad.dybcio@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
Message-ID: <20250314145035.h3nybvvko3ew37wl@thinkpad>
References: <20250226103600.1923047-1-quic_wenbyao@quicinc.com>
 <20250226103600.1923047-3-quic_wenbyao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250226103600.1923047-3-quic_wenbyao@quicinc.com>

On Wed, Feb 26, 2025 at 06:36:00PM +0800, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Some QCOM PCIe PHYs support no_csr reset. Unlike BCR reset which resets the
> whole PHY (hardware and register), no_csr reset only resets PHY hardware
> but retains register values, which means PHY setting can be skipped during
> PHY init if PCIe link is enabled in booltloader and only no_csr is toggled
> after that.
> 
> Hence, determine whether the PHY has been enabled in bootloader by
> verifying QPHY_START_CTRL register. If it's programmed and no_csr reset is
> available, skip BCR reset and PHY register setting to establish the PCIe
> link with bootloader - programmed PHY settings.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

One nit below.

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 69 ++++++++++++++++++++----
>  1 file changed, 59 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 219266125cf2..c3642d1807e4 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -2805,6 +2805,7 @@ struct qmp_pcie {
>  
>  	const struct qmp_phy_cfg *cfg;
>  	bool tcsr_4ln_config;
> +	bool skip_init;
>  
>  	void __iomem *serdes;
>  	void __iomem *pcs;
> @@ -3976,18 +3977,38 @@ static int qmp_pcie_init(struct phy *phy)
>  {
>  	struct qmp_pcie *qmp = phy_get_drvdata(phy);
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	void __iomem *pcs = qmp->pcs;
> +	bool phy_initialized = !!(readl(pcs + cfg->regs[QPHY_START_CTRL]));
>  	int ret;
>  
> +	qmp->skip_init = qmp->nocsr_reset && phy_initialized;
> +	/*
> +	 * We need to check the existence of init sequences in two cases:
> +	 * 1. The PHY doesn't support no_csr reset.
> +	 * 2. The PHY supports no_csr reset but isn't initialized by bootloader.
> +	 * As we can't skip init in these two cases.
> +	 */
> +	if (!qmp->skip_init && !cfg->tbls.serdes_num) {
> +		dev_err(qmp->dev, "no init sequences are available\n");

"Init sequence not available\n"

> +		return -EINVAL;

-ENODATA

- Mani

-- 
மணிவண்ணன் சதாசிவம்

