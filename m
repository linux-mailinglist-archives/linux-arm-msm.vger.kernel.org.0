Return-Path: <linux-arm-msm+bounces-51930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92231A68948
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 11:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E34F0175849
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 10:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C88417A311;
	Wed, 19 Mar 2025 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLzs9K6O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EB0253342
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742379615; cv=none; b=FQYTbUxZCf7YnHMS0Xr3OgJx0h3vtZFbs5zK0j7DnHyBFoeNj73cS89eEunSH24QbAsiJ8V1cGtTrJVv5QbEFPWaTK4lZQAwJbhLjWpc7N+9KF7ib8oIVMLwUAVuVnAMGOL+a9U0I/mzMaO5KPRuPOG/LrSpnLSSqFcGOzzaeHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742379615; c=relaxed/simple;
	bh=RB2dcAfEJVk54GzPhYzgFg3kO5/IsebKBpi06Nj6C5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4Wr/J1TOYhjxrb2fQJTh6I8ISsJvCRl0SpHQLDfPvdPHfLe6OFXFAdjJluLTWCJdUic761F6nwn9Cc8wPYLdslVz7HndYN7UHiiIeG+wC7lWYqyUT5LJd1eniVbx0mJQ2lmgu4uIaycR5lI5l+w5LUr1SgH0GX68RynTr4Q/t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLzs9K6O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lkYO026931
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zSDknMN5As4J/WBF6m6Okwmi
	u2zvdRItiGG5o6Mrxbs=; b=iLzs9K6OR5bSG4jkdExY7bPXDKJs/mlEOzokoyWC
	P58EXN8Yi+wBkeex/UzZINhNOD6uf4OJi4WkBxmPPGJhyQEbvzCfXE00kBCPQOsJ
	x3zmRoahp8FWYnYnbxnHnonLTcE1P8NqcJwzVrFkle95+hYAwyHmJ3zyVBVIVOSz
	opU5FreRapXtI1Vink1/jb7GUFmtMI6XeV7fbTa+ILHX9bx1BxsFTYp5wEEKPzmG
	fU/SG5c94kSFFj0XxuyEAf7EeLyNyTrQpL9SwoLklcnraGlBOofjUu1rLc3upfI/
	dN1CmyqCFtoVBthcMlccfirJFxZIHuANaGw4m4LKVytgvw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45f91t32q3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:20:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4769a1db721so179645851cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 03:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742379611; x=1742984411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSDknMN5As4J/WBF6m6Okwmiu2zvdRItiGG5o6Mrxbs=;
        b=W+tZqd/BDBPpZ8hcwjma2B72iQZwqC3TjFckEiEQlBaasuIXaHg2RwCjFMNIUEsN8g
         W+r1MS9qWopNFwvTmuvVHNu4/WpJFqWKuMDJj7e/fA0/g0/5TxscSxjlZmIS8PRSO5+f
         aSTpJg2yNbbAnN+5s1Kbi19GpGrKvR3SHtU1GOVLt6wr+bNDKNUPoC2OnuVWHNSOOOHd
         75zf35bGcdksPvMoLVnqSlUuUh56EPXSuhtspfJoiERnxtO17U2f1y2m+3D8UC7W2lzp
         4UvxiER3oBejr3EZcyrbA9aCIn6aydXaFYo3a8qpQFiN5mBnSAA6SRuzSuvtQd7CODCX
         hBkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHlpe0F2BaZVZzl4FNQeL7SgaHsDftr3Rthsbwzv8WzOQfgFubx2bWur7NDz5FmN49+Au8HbDBDPUhzed3@vger.kernel.org
X-Gm-Message-State: AOJu0YzO/1HEA8Zh2/UFi+6SF2kGQVRYdDgbP7sIiLKsgH5aCXPItk78
	FHLp5H4/nYc0dCf3rTmWFI90BbWq3vCV1YXUxrrt/CBQ50xo/BAT59rDKKvD6T1dUWBa1ALkpCj
	KlJMcpX3FfRf/kcYe3FTFw6GMi+SPC7G1Ed9j++qvFPZ8SooJKS5sLBa0w8wC2V0F
X-Gm-Gg: ASbGncs0+xhowDZBWi0NlHqx+DKpOFQ7aOA7tIQBeEPVTeBxe8JUiGxYHGaSsd5TqYn
	/F2x6q4l8wjtikqAqUbG/9RhpIW2UNG63LFnMeG9cN49UA24v1cUiOhXd2EzFGLRzgxGM5AIuLu
	arqoDyeMutMr565RBGp3wzzxorzPHHXiXHfIbAT4D8SWXt1zQAI8gcM6L69O3y+aG/iarUgITk5
	23MacH8LY+GiPydHJAZD8f4W4uNiGR8mqMyExECQmoxEb0NuGr8hjhOtvxLWFeOCxuskHXUEyzJ
	xhlJno81hMMtEWQGNAmS5VJkPzTfAQsmqQZ959qw9ruF9FSDrxFaNNz/eB7kjvrdYbWeaVagtDy
	8Ue4=
X-Received: by 2002:a05:622a:58c6:b0:476:8fcb:9aa3 with SMTP id d75a77b69052e-4770831c5b0mr45277231cf.13.1742379611522;
        Wed, 19 Mar 2025 03:20:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9RzAEw1/ZnVam3afB+N6GWTqWyZBkCWAuOXlcPn+0/cRH8L2YZEzxU+pqqrdx3zDScY+I/A==
X-Received: by 2002:a05:622a:58c6:b0:476:8fcb:9aa3 with SMTP id d75a77b69052e-4770831c5b0mr45276621cf.13.1742379611000;
        Wed, 19 Mar 2025 03:20:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7bec74sm1990650e87.59.2025.03.19.03.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:20:10 -0700 (PDT)
Date: Wed, 19 Mar 2025 12:20:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: bjorn.andersson@oss.qualcomm.com
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] phy: qcom: phy-qcom-snps-eusb2: Make repeater
 optional
Message-ID: <6yykvszzbhonc3dkwhva55arsdvp4hv4p2fo2vv6ftwr46httm@wnofgs4jaqaa>
References: <20250318-xps13-fingerprint-v1-0-fbb02d5a34a7@oss.qualcomm.com>
 <20250318-xps13-fingerprint-v1-1-fbb02d5a34a7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-xps13-fingerprint-v1-1-fbb02d5a34a7@oss.qualcomm.com>
X-Proofpoint-GUID: UUjRXDFWBmvvT9s3NcUPyhr9YWhfK-DA
X-Authority-Analysis: v=2.4 cv=Xrz6OUF9 c=1 sm=1 tr=0 ts=67da9a5c cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=lyNVp9QpP5gxZ78EsksA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: UUjRXDFWBmvvT9s3NcUPyhr9YWhfK-DA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=939 clxscore=1015 mlxscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190071

On Tue, Mar 18, 2025 at 10:22:56PM -0500, Bjorn Andersson via B4 Relay wrote:
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> In a multiport configuration based on the SNPS eUSB2 PHY it's not
> necessary that all ports are connected to something.
> 
> While this is allowed by the Devicetree binding, the implementation
> current fails probing for such PHYs, which also prevents the multiport
> controller from probing.
> 
> The lack of repeater does not alter the fact that the PHY is there and
> attempts at describing only the used PHYs in Devicetree results in
> failures to initialize the USB controller.
> 
> Make the repeater optional, to allow the these PHYs to be described in
> the DeviceTree and for the associated multiport controller to operate
> the other ports.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-snps-eusb2.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c b/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
> index 1484691a41d59a7eaf257ef44300827c668bf7e0..8897d2072ccfcaa5b4a510c17761dcdeed5bad0f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
> @@ -401,9 +401,13 @@ static int qcom_snps_eusb2_hsphy_probe(struct platform_device *pdev)
>  				     "failed to get regulator supplies\n");
>  
>  	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
> -	if (IS_ERR(phy->repeater))
> -		return dev_err_probe(dev, PTR_ERR(phy->repeater),
> -				     "failed to get repeater\n");
> +	if (IS_ERR(phy->repeater)) {
> +		if (PTR_ERR(phy->repeater) == -ENODEV)
> +			phy->repeater = NULL;
> +		else
> +			return dev_err_probe(dev, PTR_ERR(phy->repeater),
> +					     "failed to get repeater\n");

Can you use devm_of_phy_optional_get() or devm_phy_optional_get()
instead?

> +	}
>  
>  	generic_phy = devm_phy_create(dev, NULL, &qcom_snps_eusb2_hsphy_ops);
>  	if (IS_ERR(generic_phy)) {
> 
> -- 
> 2.48.1
> 
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

