Return-Path: <linux-arm-msm+bounces-88280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BF2D0A5E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 14:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DBD1F30158E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 13:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AC335BDA8;
	Fri,  9 Jan 2026 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GM5AFeFk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8RLVuiV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0500835B13F
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 13:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767964103; cv=none; b=V5BgbxXKX2RfzFMqDTw+jukqRPlG5C+P7TiVjdtewGyrakxTfQTy8xEMuTNn8ALpQqP87fBCS68AkKSKhgRGRYwMv9mjt+bLVeOL6s6PEZim9AQf9rva8ubSDms+RbwDiqUhFrma7Qw5OTXVegtKZg+gdf98vur2Ta3z4V4SQ4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767964103; c=relaxed/simple;
	bh=aTqnsOs5bn6A6Nnpp0ffV6MM2S3aqPJx+zAt34d1QpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCpp0OcJUguTTgrhJDl+fctfVyF35ZjGwfaGYSCcDa4Xhb1muSdN4f7/MS+bba8PK5lXoHJJ5MdJJwIHSRIcmUT6V+4wLe18tb69hstW583u+qYJqzRbJdkrzIiQNDIayHSjrwL8mKsZbHWEYlSfTeshluBqVIL7Vd1dPkWa9Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GM5AFeFk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8RLVuiV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6096PYR03142436
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 13:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rYxmcgjAaPH5f3Joad06AAEs
	zFSwf1T+AckoT8boG/4=; b=GM5AFeFk08QzSSRT+XLnxcNKM1oQxOXQvaKaD95/
	h8JHQWL3tido895fnLFF8mUwa7K9WSyBmf7tpp0dqrQ6Gi7yQZHgz1yzuYanb4O7
	z6gSbPdhcGvsjpShEw0rtUjgFTZvEXUv3ar/eawcOQgwPZHuHZ3z0FhHak+B0YNE
	dXtLaQDGyJB6lXJQUrmke1qe0Na2ZVpCs/bPY1Y5CQo5+RHtngxBvO5fIaPDN7Xb
	QplAanTS9ytYFUEdC2BAqw7WIN5EBKf7df5g8ghOHNYIHcAQo0Tjc+ldlFLxDyEA
	fq7AR5XbwGVjuYwzu0C2EhGOrmUV1QaXg57Y+m97wFoQ7Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j2qey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 13:08:20 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56366d9ed8dso456835e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 05:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767964100; x=1768568900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rYxmcgjAaPH5f3Joad06AAEszFSwf1T+AckoT8boG/4=;
        b=e8RLVuiV+u2rzaRg9sLNP97g44h2Nb/I6E4dYe83m7u7j452+eVSCi2m07EuXRZzTS
         zexuI8NBt4YcWmkh8Ay00ARHuS4hHSrvp8ox6k/0oi4ax/uazhvRUQnkul+Z2OPUnYLU
         PsFsrxiERtEgqFm+XiTPVdy7HR7HF9r5YFOKyKSZ2FKIdgwo6Il1eeQLeO4eyMfndgJg
         E3gKZhhp8stL8ktzKPN3ep7i1TEd3E05KvmURtE7miLNcAgdNMJTskpvGxj8mQfp37LO
         CRd2nkIEyv8+hqNSaOhrpwJ3NwngaAk0ofshmYQkvcywew05i9YkJqDETTb7wHrQHBw0
         JG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767964100; x=1768568900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYxmcgjAaPH5f3Joad06AAEszFSwf1T+AckoT8boG/4=;
        b=mAAM/cswGor50uNJkDyqeBkvUtEQ7YhYSB2PKciPovb3BSCOi/99GC8swWVEMlZizP
         4qomKEbvEkY7pIskH1TkgTeYnLsUk+mViP3kAnGvj16m/o5XLXthsHO+jarSvWrLWmPs
         plQ8AMq3IWqRAObx+oSTNS9Iix3pn6zLDKhA4pUrywE/9fk0L4BGfb26i0XJvPAIsQn4
         R6LdhlNzwLuPvx/Pm7hiDybCE3INvuwk6Ii0lEk0gtQlsU9ymGwZSpe7LrDYqaU/TiZs
         fybguVwNrQuBBYlARyUd/hNaPyBTo4c6tPa7qNVtTPtyWUUoOY0j/SZ9ScBHpbIjI7uO
         61eA==
X-Forwarded-Encrypted: i=1; AJvYcCXP8EWDUU65Cx9y1j/ZkOXta58pZ7PSlg0fhbK0PZsxRW+R6AprV1bRB/zt24cnQEVts/Ar4EbPqKnRpxaI@vger.kernel.org
X-Gm-Message-State: AOJu0YxOAlMgPV3BjQ1WDAecSY2gvZRkaFfCwN6WRgEyzCrD/zjnZ8x/
	3M/4PWgUZarfmvKCnuQws+71bfBO0c70jwzdmhSYthYL5yTFH5UeEInlmLhlFfg1XBW6AM5MUG+
	QBo0T6eWLHnyX5pPN/2HaC/m8zsL64yK8ohddxG+y0/qPPGnPfQzZV8l4R+ZknSoDBMDZ
X-Gm-Gg: AY/fxX43Z8n7UC727247lfOTEL/u0P/ey9CPLod00sQP0oS+L/NScm/FJBwRCmhCnqq
	1gSBJxmnXzVGAGoS/z3TKrWlX/e17bLWX9dOH3snXX1uzEcWKmEqxtddlbsNAeicOtlJUpzFvxR
	5KkrKjoeKE2c3l9SJoZmd1JsvVJ2P2ivoMK1fs51V5ZE5Lx7FPy8kbHCOVtTbflUSbLGPFGaVjQ
	aKFG5SIsyeKA5oeb+3IVbK9jEXm33UA5iSWq36TGiwuLAA9Yh3nFqTWe3Y69UH1QFv7qDDbE3/W
	+WwcigEBFrDU9YavuVj75tifbrD0KSiQBHZ7Ykp+6jTJiZc9QCvcokqoeKnmmQx3UxIiU1UJYYV
	V7i3GYvHwqXW0vqkQWqFmyisbak9XRWpFc2PNsONAgAgbH0Sim6eOH/HZctIaAt5x7ETlUyoF+M
	h4C2dymeVh7Tj/6am9hJaJ9SE=
X-Received: by 2002:a05:6102:6046:b0:5ed:6e3:2e31 with SMTP id ada2fe7eead31-5ed06e3309emr3029880137.45.1767964099781;
        Fri, 09 Jan 2026 05:08:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHALK7BJoUm7oZ2urRmssWrAnK7wGTj1a1eN5oUzSC5pVQM8bdSD0PoS8vDugwZTQGXpy2+/Q==
X-Received: by 2002:a05:6102:6046:b0:5ed:6e3:2e31 with SMTP id ada2fe7eead31-5ed06e3309emr3029843137.45.1767964099227;
        Fri, 09 Jan 2026 05:08:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-383140e641dsm7743091fa.50.2026.01.09.05.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 05:08:18 -0800 (PST)
Date: Fri, 9 Jan 2026 15:08:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 1/5] phy: qcom: qmp-pcie: Skip PHY reset if already up
Message-ID: <nmle3y6nb4kjcwstzqxkqzaokeyjoegg6lxtmji57kxwh5snxa@p76v6dr7rgsg>
References: <20260109-link_retain-v1-0-7e6782230f4b@oss.qualcomm.com>
 <20260109-link_retain-v1-1-7e6782230f4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-link_retain-v1-1-7e6782230f4b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5NyBTYWx0ZWRfX8J1lG+pBJhcF
 Y+Abz6grsDlzk3zb+r+uYNojn1xANIC+LopmC3gq1oF3jXH8AF8QLihGGANzeRDW67IFPyJvMl8
 wvlQPnbH5v+t/6C/Cxs8fuZ4HCW7NgyCG8t3YQs+AFhnJ1pSm3hR9s91L9mtweQKKEDWx57A6hF
 oexPKBjfXS8EqRAcnRd3JisrDiuwJJ6PM+FZ4vz0ygyl/vvI29fByvxbyaomtSPRG7jR9vwrZJU
 GFuGlZVy2Ci95N/Nvmiv3SzFqZXaQOjM0Zx/2cMrQMAqAxStJQ7HjJqmqEycV2CE9Zl5qHiEPQT
 aINw1dSG/SpvNGcQL1jghsZiWXYthN1fQVVQqaLbyx4UkrzA5eM2iWJ0rCsTjQOCKnZriGIzwZv
 GYXDxaIxMIFxH7Nvsg049tGd43pIxk0N25KYmTctTWHOx7djO92r+6ENvcBeVLFGMty66l4IT8n
 BV/G7ETzMGPB1kfpTXg==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=6960fdc4 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=oGCaagtNXkZHtvXD5hMA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: ZVChOwDYaWrf22bDuQvR-6RCul_yP-6H
X-Proofpoint-ORIG-GUID: ZVChOwDYaWrf22bDuQvR-6RCul_yP-6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090097

On Fri, Jan 09, 2026 at 12:51:06PM +0530, Krishna Chaitanya Chundru wrote:
> If the bootloader has already powered up the PCIe PHY, doing a full
> reset and waiting for it to come up again slows down boot time.

How big is the delay caused by it?

> 
> Add a check for PHY status and skip the reset steps when the PHY is
> already active. In this case, only enable the required resources during
> power-on. This works alongside the existing logic that skips the init
> sequence.

Can we end up in a state where the bootloader has mis-setup the link? Or
the link going bad because of any glitch during the bootup?

> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 86b1b7e2da86a8675e3e48e90b782afb21cafd77..c93e613cf80b2612f0f225fa2125f78dbec1a33f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -3153,6 +3153,7 @@ struct qmp_pcie {
>  	const struct qmp_phy_cfg *cfg;
>  	bool tcsr_4ln_config;
>  	bool skip_init;
> +	bool skip_reset;
>  
>  	void __iomem *serdes;
>  	void __iomem *pcs;
> @@ -4537,6 +4538,9 @@ static int qmp_pcie_init(struct phy *phy)
>  		qphy_checkbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START) &&
>  		qphy_checkbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], cfg->pwrdn_ctrl);
>  
> +	qmp->skip_reset = qmp->skip_init && !qphy_checkbits(pcs, cfg->regs[QPHY_PCS_STATUS],

It is definitely not a long-term state, there is no need to store it in
qmp_pcie struct.

> +							    cfg->phy_status);
> +
>  	if (!qmp->skip_init && !cfg->tbls.serdes_num) {
>  		dev_err(qmp->dev, "Init sequence not available\n");
>  		return -ENODATA;
> @@ -4560,13 +4564,15 @@ static int qmp_pcie_init(struct phy *phy)
>  		}
>  	}
>  
> -	ret = reset_control_assert(qmp->nocsr_reset);
> -	if (ret) {
> -		dev_err(qmp->dev, "no-csr reset assert failed\n");
> -		goto err_assert_reset;
> -	}
> +	if (!qmp->skip_reset) {
> +		ret = reset_control_assert(qmp->nocsr_reset);
> +		if (ret) {
> +			dev_err(qmp->dev, "no-csr reset assert failed\n");
> +			goto err_assert_reset;
> +		}
>  
> -	usleep_range(200, 300);
> +		usleep_range(200, 300);
> +	}
>  
>  	if (!qmp->skip_init) {
>  		ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
> @@ -4641,10 +4647,12 @@ static int qmp_pcie_power_on(struct phy *phy)
>  	if (ret)
>  		return ret;
>  
> -	ret = reset_control_deassert(qmp->nocsr_reset);
> -	if (ret) {
> -		dev_err(qmp->dev, "no-csr reset deassert failed\n");
> -		goto err_disable_pipe_clk;
> +	if (!qmp->skip_reset) {
> +		ret = reset_control_deassert(qmp->nocsr_reset);
> +		if (ret) {
> +			dev_err(qmp->dev, "no-csr reset deassert failed\n");
> +			goto err_disable_pipe_clk;
> +		}
>  	}
>  
>  	if (qmp->skip_init)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

