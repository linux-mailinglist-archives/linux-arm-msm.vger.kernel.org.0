Return-Path: <linux-arm-msm+bounces-52206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EE5A6BCFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BE567A59A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 14:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E0D19CC20;
	Fri, 21 Mar 2025 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5/rvATV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9EC150980
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742567523; cv=none; b=OIhSz2A4LHfekvwE/Y1DXjMMh/Sub6Xwe+IVqUWy2DncnimOHhi4yfSy3WDK+LvzPQvpyMes+EW40vuawCyPB4ga6KqAAoAerURT+pLOCvE8y/tbyH3YyHpzzV615LoB0ClpM4kDOon8o6pOSsbAJuHQFgEt7vtRuPeCqeM2XcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742567523; c=relaxed/simple;
	bh=3+9SMCGB8E/DBcXN+tcP4KhITSCqumJyj1HanzSlz3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLy7DNRT1wviCF+1UEoov76R42aWEMZPK+aNBIBDA9fy00TutwlMHXYmEwHpbYUI7zG+4CS9u+jEPyEiZXpnqOtp/+vD5lb4gLgJhnY+OPhxOVdgnWYECFF7OAPZyGew9McPNfh1J9GKH+o7fwnlIu0CTZFxVOQMGfLVCmlQxvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5/rvATV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATBnQ022207
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ASbCVF6IGoyY2N0TjxdPMAgZ
	r4dHNvrD/QqrVeipMWU=; b=j5/rvATVRl6e8otFJk7TbSloKEolYfxdsRjzEMzg
	ahv0NV3EzON7+NlL2LG+x07BVD1G8E2LXmCAqs6xepVXisQWj5WOYaNhCE9+uC+7
	2QdprtEUMU1KEes4JYdCFKdWDiOKqjBIfgD7cTX/4jBIq5s3o6gXIWFciWpsoRaV
	hgeIjdTpqO+YtrYjBBhgbamNBdrIRLQVDtUuCuni2MOCH9fk1zCfI1xQYPYov8gO
	I/yYtk099O770kxqToSM5yJuDhflwyBv34Z4q7gg4yRaXHFSiRqwS56wjKrP08/E
	BIO4BQrb1UG+nx+sT9ArT0tL9Oc1Nd9XF3BpCXJOGohTLg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4wpgytd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:32:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c548e16909so196113685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 07:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567519; x=1743172319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASbCVF6IGoyY2N0TjxdPMAgZr4dHNvrD/QqrVeipMWU=;
        b=igYWYTYmPmQuI0arQ1viIXoAkjJCBqtZTkZN8ib9II9iV8sBf0iD5ZYA61fbwWstkl
         NqDm9m9aMhQ12mUsIJQSWfS3mf4DtxuMoD4w3kF/k8jRQjpEdfvN6T5SK9S/Ig3SQDJx
         m8POcp/3yqLEuuecgQ0rYqY2yyihJ8673SYzBEwNEsUZlgWx8pYGT2TFhaQWt4+KrFib
         z6wISu3MoBgsGDaHl1CYUVldIy9qu4WLEo+D0YhhvdRC9s5T67pw8mthuaJY6lB1wB6r
         7Pgl1Dd78uaXAvctbx3jvRZcHkFEEHlXW3OFhtSDv5WjEuomH0lySOKnmEK+dTBs3aQG
         UySQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtP26ej56m0NKahQuDu+YoC2XEXu8sl8jFECHYNpqP501BzkVsqbQJopBp8UbxApkDM8R6kenS6PsyFz9U@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu+lwy5VV94kEntLZCyfFeE+NF1clDhs+jG8yJnXTV1hlnUmX7
	RtofRyvKl6sl64AITPYOA8dr2l4k9BvzBmkEC3uNKmxEQq03q9nOepiYGmDdaYog1eXIye5ULkX
	NNneG669w5bWUjTxV4qfY93We6hAqoYUd3pq76U2HOmmWHkeqkyOBJ9ihN5wwzedQ
X-Gm-Gg: ASbGnct1sI2U5wZh5kv3ZRVvuRPi4VDo9aqVGFXPPfrWEIwPZyxTv8JWUVZkrQPbjJH
	1wLj3Q/42rvdriAZT0H23mcz4AtWUNZMw8MZ+pLNJBGFuWrBatHG+0ncXdrMiS/ycFe5KvdOrjZ
	yEhZMyptJxKUDCXd4ASiAwvds53euGvZx3f4DbxDvxzchtkPhm8rx2YtWV5CSHsZZfr4ZK4LaZJ
	hCJxDfW7UICh4Ju3yQVVAEk938nalUAdolrP1K4tVV3picbL6PPn6q0ZmDmG7VO8UnVRLAu7Cxz
	PAhmLSP7QcHVdnQO+OM8q0yEoVFtfa1YYvinUMUDV2CoAnLRwnD3j2gWsL4Q6G9Wi7Yuaxhv7bX
	7G8A=
X-Received: by 2002:a05:620a:461f:b0:7c5:5e5b:2fdb with SMTP id af79cd13be357-7c5ba211392mr509660185a.41.1742567519261;
        Fri, 21 Mar 2025 07:31:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTvGJ85KG70hDc3USgHc+qZKoWAZnYtaXcPyp6rUDakGGGOGIHCJQh/uHXW8DEKPu0mfBeXA==
X-Received: by 2002:a05:620a:461f:b0:7c5:5e5b:2fdb with SMTP id af79cd13be357-7c5ba211392mr509654385a.41.1742567518714;
        Fri, 21 Mar 2025 07:31:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad646bd42sm194861e87.26.2025.03.21.07.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:31:56 -0700 (PDT)
Date: Fri, 21 Mar 2025 16:31:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 05/10] phy: phy-snps-eusb2: split phy init code
Message-ID: <7v3xkvldjnpqakrndwl6wb6vdsl3idbirlhddpqhwtt3ddadzr@kjafi3updcsb>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321135854.1431375-6-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321135854.1431375-6-ivo.ivanov.ivanov1@gmail.com>
X-Proofpoint-ORIG-GUID: kObl74xgQWgqPUFGnyHOZnfNv6T_UfNJ
X-Proofpoint-GUID: kObl74xgQWgqPUFGnyHOZnfNv6T_UfNJ
X-Authority-Analysis: v=2.4 cv=ZN3XmW7b c=1 sm=1 tr=0 ts=67dd7860 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XJ2MQsQTle-X_OudA-YA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210105

On Fri, Mar 21, 2025 at 03:58:49PM +0200, Ivaylo Ivanov wrote:
> The current phy init consists of hardware power-up, as well as
> QCOM-specific eUSB2 init code. Split it into two parts, to make room
> for such non-QCOM init code.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/phy/phy-snps-eusb2.c | 96 +++++++++++++++++++++++-------------
>  1 file changed, 63 insertions(+), 33 deletions(-)
> 
> @@ -378,6 +401,11 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>  	if (!phy)
>  		return -ENOMEM;
>  
> +	drv_data = of_device_get_match_data(dev);
> +	if (!drv_data)
> +		return -EINVAL;
> +	phy->data = drv_data;

Nit and completely bikeshedding, but this looks simpler:

	phy->data = of_device_get_match_data(dev);
	if (!phy->data)
		return -EINVAL;


Anyway:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +
>  	phy->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(phy->base))
>  		return PTR_ERR(phy->base);
> @@ -424,8 +452,10 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
> -	{ .compatible = "qcom,sm8550-snps-eusb2-phy", },
> -	{ },
> +	{
> +		.compatible = "qcom,sm8550-snps-eusb2-phy",
> +		.data = &sm8550_snps_eusb2_phy,
> +	}, { },
>  };
>  MODULE_DEVICE_TABLE(of, snps_eusb2_hsphy_of_match_table);
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

