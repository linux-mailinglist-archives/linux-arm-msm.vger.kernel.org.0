Return-Path: <linux-arm-msm+bounces-58809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 858DBABE61D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 23:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA0DB1884C4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1191251791;
	Tue, 20 May 2025 21:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZeP1pZjg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114AC242D89
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 21:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747776721; cv=none; b=p6rmvUdhNYUUq675p1treeggO037ls8xot3AxUfsrqn0u74YDLGjycoflwP7tsGJAmAFtkDTPXjSEnHhkfWPN9hLz7eNySVxAXAOD8g99fbe+JBSbi8V52dkkCMBZob99+avjN+KQczGE8QgIERpbo4ZLOqo8gjCrozbGffbQ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747776721; c=relaxed/simple;
	bh=HrumOK1lD/TxRKWp4CXD9ZjpAsCHHBFPGhttXykXyuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3oRKTpk+uqB6XvZHJzcCqwEo6xWC4SRW85B6fWlBjiajMYHeW5n3tZhhKEbOOCNDFICZyygg6vo/jlceJmHLz+8FVXOelxm6gFeLypMqWB2zoJcVq3w+EJBhXDg9CwRhRCCC86HpDexdZOrnmjBJdSAMEl0V7oTncy5QPnR5IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZeP1pZjg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGe0hR000737
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 21:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	228HrrCuuX1HRGPycnehYOiQbNMU4YvNE3lwMK2PIuE=; b=ZeP1pZjglGeCXCsC
	pcpScdyBaTyMp40+3IZODWiRD4PAdP6gWw2rRpKWmhL861inMfSQ9r2+OA0zhpc8
	HLWCpY+2DDHpXVeuleMTqFaUMb+7+BjzFZ9fKJpTWZqVYcNaZtAFg7ODRFwsLW0M
	IZuu6MpT8NX/Kk0uJia/22UYZR3VzTbKqCQGNZfXAZUY7KVI25b4w0ZQhFjtu1Nz
	cZD1wFG3Gm4GektXQt2Gy1sT9CPCEDfKxBq7xBBYsg54ZdaraCXnnuu0e2ZhjlMT
	o+K5PFk+1rw0mc5e4z0Ta1XLhcfvobShPVMwux5KuaNSbz09BuUlf9i15lsmjN61
	TPf3jw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4rnfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 21:31:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8aaba2f62so114473596d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 14:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747776718; x=1748381518;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=228HrrCuuX1HRGPycnehYOiQbNMU4YvNE3lwMK2PIuE=;
        b=f8bjHbl0rjx+Kgy/EI6zmNVWdGrm72sArvA1JV03deUKxWAba7ksfXo97lMbpMQitu
         JtWpMPNAFxvzcotUrJvfZ1IFcdEFJwqVCuWH/zRk18nU0viSHziKtKRubgRTxGzrsDCy
         rbk6enWwnYnV8IzYQ8L3jsEvVo7EshMm6Pe3NJfot+6Xqe4A0kERPdYLsVJVI7+NNCoq
         9RadpS0FDDBCUjHT8N8bwTItK7tGmMvDKKmNmpSnf1J/D8zQL9AI7BPzS0ABZAcPaVoE
         CBfR+PA07T6q18oU+UhbnyiCXMGrvUGnYTryoe6C9A79+27kVCt05DhpsQ9uGOyhFj12
         eXKg==
X-Forwarded-Encrypted: i=1; AJvYcCXLhmF69bnFgSvP4CEaOR5CP10p05MkhcHckHNycelxho0tJR6pXzpZsP+mgOJzDItpbSarZ5k5NQLjYdCi@vger.kernel.org
X-Gm-Message-State: AOJu0YwpEGTpZUoxQ8YkWUnY89Wp9mzqPyTOTAr3/BORnXW5FktKwu0u
	+X06ZI3BjVH9HqtVZsPJaZQQFoT3TwEYc920kEhoDpPyEbXjwOGIHqDMCNNpRiIX0Usna8RladU
	IeEY44QoU2b+gX5T8ALilYDif/+hxeOsUqv2EANOOcHADorZOtIh4e4SYwfYkPFdOXyCq
X-Gm-Gg: ASbGncvZXTI2af6BGdIdN8kFFv7npu4zvFnBU9Y9/MX1WnbvpEOO3N0ia8NMZdtrcAT
	QYDHahuPzMR1yeO1VSPkjviyqjPfE2VOLR1Sudjxw5e1qBWZg6CNNo4Y2/u2WIt6XWgenJAj8eD
	dk0q0+nu3xK56TXS3LkAj8Ni8lhHJdsbCwP1rX1ZYuEemJcJp1qyCX9FVWis+jJ7Oze/DhTSQAJ
	Mno8cxH/lAdkM7VZaGeBvIthrBkYknteW4dNcAZXndit2U71da/6qfBHG2DKKFVaGLgMYdtQ92c
	Jz/gp5w+iuipvJq8ETVQNRq7lezFtF42mJahLcL9rGse7t9N7AwUeeKGdIH7SmSTqKh50Q9wiK8
	=
X-Received: by 2002:a05:6214:20c2:b0:6f8:cbaf:468b with SMTP id 6a1803df08f44-6f8cbaf4afcmr206722846d6.9.1747776717854;
        Tue, 20 May 2025 14:31:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzGFw0ReLy0rYNMlKSRzU7jDAyhoHTDEg4/RZ+gRpFWj1CnjjsVCutbb0+HA7GYlp4CuOmBA==
X-Received: by 2002:a05:6214:20c2:b0:6f8:cbaf:468b with SMTP id 6a1803df08f44-6f8cbaf4afcmr206722386d6.9.1747776717461;
        Tue, 20 May 2025 14:31:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085edc14sm24746141fa.107.2025.05.20.14.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:31:55 -0700 (PDT)
Date: Wed, 21 May 2025 00:31:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taeyoung Kwon <xoduddk12345@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taeyoung Kwon <Taeyoung.Kwon@telit.com>
Subject: Re: [PATCH v1] power: reset: qcom-pon: Rename variables to use
 generic naming
Message-ID: <uwkqsapadx62dvuauuiqx2bmy32sbiebrszyliksbcjhn2jcr3@o6qevejpn4u2>
References: <20250520212740.2729-1-Taeyoung.Kwon@telit.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250520212740.2729-1-Taeyoung.Kwon@telit.com>
X-Proofpoint-GUID: nciE4dwUygq0-oXGj3Y6auchFMw_UGeW
X-Proofpoint-ORIG-GUID: nciE4dwUygq0-oXGj3Y6auchFMw_UGeW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE3MyBTYWx0ZWRfXyRCUaSJfn+Ec
 Jax6oVBH0JoYSebiE7THEpv8jLSihOP6RQrORikawvL78abVCYmGnI59+QHe754381EG2mZZNOq
 Ojapcyuz6MN3wCVVmkFi7qFYchviwMZuyIqGNF7fB9J4KMOWLZJdE5FdFnnKmum19zvua/DFO2p
 51b6Orl/pHkIOUUYWcFPib+78abOxZHhiBExfXoreVUYosPlpiQm+NTw0daoJQriRR7tTZFcVXs
 yrnmVPNDEHLDrCzfRaxIOHGruy0NyKIde16zYyRwgrzNS3sqnGVru10AA12GYdUU2YgdcQ+55dH
 7r62SrYE7SqvFMPKhyLQ3pd6h6uBdq4J9h6F6wxT0NP3KGOfZRAZx9+kzQJhdYdKuf1rOUPoaFc
 zesd58R3b+BrSnsXOj6Nh/ZrZRhlHMC8Dnfj8i0PN/Pd0fN3fV/SOpi7zjxTOl/OT4n8UUFD
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682cf4ce cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=8xVn4GeRAAAA:8 a=Npgqdn6Q5xmw3uMjWK4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=By6hKCY_mHIbKsINY6vW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200173

On Tue, May 20, 2025 at 09:27:20PM +0000, Taeyoung Kwon wrote:
> The qcom-pon driver was originally implemented for the PM8916 PMIC, and
> as a result, several internal variable names still refer to 'pm8916'.
> However, the driver has since been extended to support other PMICs as
> well.
> 
> This patch renames those variables to use more generic and consistent
> names, improving clarity and reducing confusion for non-PM8916 devices.
> 
> Signed-off-by: Taeyoung Kwon <Taeyoung.Kwon@telit.com>
> ---
> From: Taeyoung Kwon <Taeyoung.Kwon@telit.com>

I'm sorry for not being clear enough. This should be the first line of
the commit message text (with an empty line afterwards).

> 
> Changes in v1:
> - Moved explanation under the '---' line
> 
> Since my company email automatically adds a footer signature,
> I’m sending this patch from my personal Gmail account.
> Is this acceptable, or should I resend the patch using
> an email that matches the Signed-off-by line?
> 
>  drivers/power/reset/qcom-pon.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
> index 1344b361a475..7e108982a582 100644
> --- a/drivers/power/reset/qcom-pon.c
> +++ b/drivers/power/reset/qcom-pon.c
> @@ -19,7 +19,7 @@
>  
>  #define NO_REASON_SHIFT			0
>  
> -struct pm8916_pon {
> +struct qcom_pon {
>  	struct device *dev;
>  	struct regmap *regmap;
>  	u32 baseaddr;
> @@ -27,11 +27,11 @@ struct pm8916_pon {
>  	long reason_shift;
>  };
>  
> -static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
> +static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
>  				    unsigned int magic)
>  {
> -	struct pm8916_pon *pon = container_of
> -			(reboot, struct pm8916_pon, reboot_mode);
> +	struct qcom_pon *pon = container_of
> +			(reboot, struct qcom_pon, reboot_mode);
>  	int ret;
>  
>  	ret = regmap_update_bits(pon->regmap,
> @@ -44,9 +44,9 @@ static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
>  	return ret;
>  }
>  
> -static int pm8916_pon_probe(struct platform_device *pdev)
> +static int qcom_pon_probe(struct platform_device *pdev)
>  {
> -	struct pm8916_pon *pon;
> +	struct qcom_pon *pon;
>  	long reason_shift;
>  	int error;
>  
> @@ -72,7 +72,7 @@ static int pm8916_pon_probe(struct platform_device *pdev)
>  	if (reason_shift != NO_REASON_SHIFT) {
>  		pon->reboot_mode.dev = &pdev->dev;
>  		pon->reason_shift = reason_shift;
> -		pon->reboot_mode.write = pm8916_reboot_mode_write;
> +		pon->reboot_mode.write = qcom_pon_reboot_mode_write;
>  		error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
>  		if (error) {
>  			dev_err(&pdev->dev, "can't register reboot mode\n");
> @@ -85,7 +85,7 @@ static int pm8916_pon_probe(struct platform_device *pdev)
>  	return devm_of_platform_populate(&pdev->dev);
>  }
>  
> -static const struct of_device_id pm8916_pon_id_table[] = {
> +static const struct of_device_id qcom_pon_id_table[] = {
>  	{ .compatible = "qcom,pm8916-pon", .data = (void *)GEN1_REASON_SHIFT },
>  	{ .compatible = "qcom,pm8941-pon", .data = (void *)NO_REASON_SHIFT },
>  	{ .compatible = "qcom,pms405-pon", .data = (void *)GEN1_REASON_SHIFT },
> @@ -93,16 +93,16 @@ static const struct of_device_id pm8916_pon_id_table[] = {
>  	{ .compatible = "qcom,pmk8350-pon", .data = (void *)GEN2_REASON_SHIFT },
>  	{ }
>  };
> -MODULE_DEVICE_TABLE(of, pm8916_pon_id_table);
> +MODULE_DEVICE_TABLE(of, qcom_pon_id_table);
>  
> -static struct platform_driver pm8916_pon_driver = {
> -	.probe = pm8916_pon_probe,
> +static struct platform_driver qcom_pon_driver = {
> +	.probe = qcom_pon_probe,
>  	.driver = {
> -		.name = "pm8916-pon",
> -		.of_match_table = pm8916_pon_id_table,
> +		.name = "qcom-pon",
> +		.of_match_table = qcom_pon_id_table,
>  	},
>  };
> -module_platform_driver(pm8916_pon_driver);
> +module_platform_driver(qcom_pon_driver);
>  
> -MODULE_DESCRIPTION("pm8916 Power On driver");
> +MODULE_DESCRIPTION("Qualcomm Power On driver");
>  MODULE_LICENSE("GPL v2");
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

