Return-Path: <linux-arm-msm+bounces-91478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMIZFuGBgGnE8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:52:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D166CB39E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2128D300A330
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D403596E8;
	Mon,  2 Feb 2026 10:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWDmjFgW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MV5/hSCP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019AC357737
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029524; cv=none; b=M6blYpci1/Osqps8XQVuzUDxj9quOKJztzmADFjNo9Dna7ilto+Pc+7x2ZtnEbDIuDy9cdIFyzSlmVuBUtpZkXbdkPoGPcr0ZnCmA9y4GKGoXyXf+mYtIHAY71/iPOmrAYP7i38SRHrX4c/jDFC82AlafenDz5TKb2sBGdSkHD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029524; c=relaxed/simple;
	bh=Kc7RpvO2p9800NM2B8CF++WyOv9JXZrDM9tlk4xzcm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=svRIJ4JOeZvczS9hAgYOg8/4l8bjdYIZJubQUkmfClAHIdMTk/tbGzUurXyIdoaErwJEEImxf7oFzzEn7JOtJ4PyjBu0E4WJslNcDxHdUbPCIFTK1VfTrs8i/wHVpm0iucK+v4IsiAPuLwkmx9xLyo28WGm6XFU8eUFHGCuOH2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWDmjFgW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MV5/hSCP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61287RUV721506
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 10:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R802QrSbqggRkvhWchXNMQ2bLskXi/9f6yPPn3WgdbA=; b=JWDmjFgWXGRa/e8c
	jv8R55oyCF3Gq/SNgIWYtWnFgUfTwN+ISwR0c2yuixkF5aHR642aYTyPBy0V7KYW
	Sk/z84uofVU24FwIzHibkvz+Q7Gea0dGDjocCFEDgoluZ/C6Jxr5wbxgw12MJ0D8
	MCak22gVhrfZVgVaDk9P6qVtUoeFHfN7gdVw5FXjV57UQOnfQ5FgfDOmh0Sscbag
	UzI2bU8zkYfTpDWN3XHez5aTxolYaMR1J8EFZvfgx9r2C88dwWQMFHFGf00cEROu
	XTFjKs6VMQuAJmFn125Y7i2FFYV6UBa4cugZhjWv7MYRXvnVhmvnBIh2yk1kUb8J
	segFOg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ared2sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:51:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8946c23cf90so17500846d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770029515; x=1770634315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R802QrSbqggRkvhWchXNMQ2bLskXi/9f6yPPn3WgdbA=;
        b=MV5/hSCPna9ynvZovSwIE4++37oOQSB+hWgxOALiSCZyX1Og/U/WzuyyTkXibiYX3p
         lD1BBQ4GOVTBs9BHVBFrMUKeR6JInCaebQq36OHf7aucMooN7PEFj3uyQVHzuFhZky9l
         QCB4bjopdc8HMyUm8zvZwrkPXdYQDVmGhKUKp2Qs96NB1LOp7gtkEnkmFXcwZV5kN+vI
         5aWy//3lTywX2mHBbb3GzhOs2r/RWET61b2X4XPNIp8tVSFlOHQ2TbPcBh9HPqeylF/7
         SmM3ilftZ8KseLTmqN3H+SLVWt1rznrorTEQn4lGtA9K8SWshy3fFTg+vy/rP7YA08IV
         E/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770029515; x=1770634315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R802QrSbqggRkvhWchXNMQ2bLskXi/9f6yPPn3WgdbA=;
        b=ancT0xHAtv5HZ8sgP9CkfI3dCS+cL10SoR78UQVBU3b4S9F0apOQuQpq5bdWgJXaJ5
         6WeBKep6RZA8y208H0F6G1+EL38+yiPBcSEo15iAu1+8lxMhuUgFUdCd68FlLkDgLtCo
         deBFVRTyfiQ4duic4WtvJ47IpW2vlhmnAs9rYrr2kMX8eo+fVtqnZEzOtB9jB2CCwdTo
         55vxi39BiL3iDjYr61dcfXi67ObGqPurXJ/4GPh5VJ23Fd/KoiDME1TY2mM1gvR+YbKW
         3XvtRzZ28tZJEOfTXU5yGu0igOWmaTfYIrySAUs/HueVKgeaPhLdTiDiSx/k0zMvH4uR
         5nqA==
X-Forwarded-Encrypted: i=1; AJvYcCVlESdjn1iAoHD/LBDZUfaS5E2UJjLCGfkgI8XMHPwHwV/Lq79cdFuHc+59VZdcIk4BBBhqnGOCRKNeMY2i@vger.kernel.org
X-Gm-Message-State: AOJu0YyFb7rScwP2C7Y0m8lIqK4mxRvahTCtCby27c4fG8FKDPdsCSIA
	SBxtL5ecjrOcFbsHswLk9Wl5lhTgp+jZ8efFP7/b1E/uVOoCF/pd+eAxVBddhJykq1TeVa00Rmn
	leytojSHG2xvA1iPd0wsFmNCQ1zJMemOUiSoTJbTowaw61ayx3sFdpwG20NAQzf9aFH+M
X-Gm-Gg: AZuq6aK/c0euEcgsINzNiUuQ5NlW58oP3tjqakzI+a7upT5I5+KHbKKELk0Gf4oHrwt
	eWu2hONvKFgIOmDBlFAkR21aT/D8cwnmZyu2+BrYzr5d7LpX+ZLFx4adEivN206dPu6XGIS3zSL
	UZf8NBJv84x7PVrnRY/MCm9P13TK6ZI5MIj6Sim17boh6fkHdXRLKvQmRTfED7+0bG86P0y1aav
	fWI8LKYM3QvX+r+eXuR1GBsXXEHH02AzJbphN+YPRlYM6nQKALjBosMJtLws9Ob3zbbs5LMjAoW
	6KftnzOwiUMhjgb5vs5VEC8LER3uNSxG6Anus1G60szcTbrOUlghWJ2sqTbnH8bTFKQFqiieNgG
	o4feB6XRVwkqlD6rqUe3X0bw/e1zhqfEYcggwWgp8q86TwAcdLE1FBbXvL/rgbra9aGg=
X-Received: by 2002:a05:620a:1998:b0:8ca:27f:3a70 with SMTP id af79cd13be357-8ca027f4ab1mr576184985a.2.1770029515016;
        Mon, 02 Feb 2026 02:51:55 -0800 (PST)
X-Received: by 2002:a05:620a:1998:b0:8ca:27f:3a70 with SMTP id af79cd13be357-8ca027f4ab1mr576183485a.2.1770029514501;
        Mon, 02 Feb 2026 02:51:54 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4453094sm7423905a12.14.2026.02.02.02.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:51:53 -0800 (PST)
Message-ID: <eec7aa76-bdef-4c61-8138-1cf111378afb@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:51:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: ice: Stop probe deferring once ICE isn't
 detected
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh+dt@kernel.org,
        abelvesa@kernel.org, mani@kernel.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260202082534.121042-1-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202082534.121042-1-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NNfYOk6g c=1 sm=1 tr=0 ts=698081cb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7uNGO-3vnjYwkWKPlv4A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: TeyIgFY1jqGih2YSF1mWnS2gNlL3GzlE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NyBTYWx0ZWRfX4etep2sbIc47
 oG/89wBl5KcRnYJI/XDJGvUiTcgV9gTL5GxdrHup/LyVkgspmdSyzq34JoPFxjJpyAUum/ZluvY
 YQkYRJQqkXwjPXUlUFXzSnWEMEyUESKCAPlz2RyGsaI38gw/htDlG/CDHKxBd43rUGzftuYbB9F
 /TnfbzgW90tXlroLNTomLWeSbiPdfeJtGQmafAOKKIIPOIMNuUKHfTAgCTb7Y/0ExUcEqjNIzBD
 0+mApPyNFeCUHDvFGnoFaGJ7K9rZ7tRyAivXV9LRh28ZB2Fb3S9IsEVEaztLAZzLV0DwGJA+RwN
 G+k3wvqSDO5DUN0V4AIAr+nwvMu2xXFlZT+b3Abpunk6rp8EeejVQLo+/7bLIAgANSNmH309nmR
 sXzokhTumTWO9qqoBznoSXZOZWH2/C7KF3CfhJHVqK1Zy+q2Tl+pzrhlf6w8LrYTAEsqUCtDOte
 uLf1sDB3Tx+wpPTuDWg==
X-Proofpoint-ORIG-GUID: TeyIgFY1jqGih2YSF1mWnS2gNlL3GzlE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91478-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D166CB39E
X-Rspamd-Action: no action

On 2/2/26 9:25 AM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> ICE related SCM calls may not be supported in every TZ environment like
> OP-TEE or a no-TZ environment too. So let's try to stop probe deferring
> when it's known that ICE feature isn't supported.
> 
> This problem only came to notice after the inline encryption drivers were
> enabled in the arm64 defconfig by: commit 5f37788adedd ("arm64: defconfig:
> Enable SCSI UFS Crypto and Block Inline encryption drivers").
> 
> Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
> 
> Changes in v2:
> - Keep the probe deferring intact but stop it once it's know ICE SCM
>   calls aren't supported by the TZ firmware.
> 
>  drivers/soc/qcom/ice.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index b203bc685cad..5a630c9010ee 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -559,7 +559,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>  
>  	if (!qcom_scm_ice_available()) {
>  		dev_warn(dev, "ICE SCM interface not found\n");
> -		return NULL;
> +		return ERR_PTR(-EOPNOTSUPP);
>  	}
>  
>  	engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
> @@ -648,11 +648,14 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
>  	}
>  
>  	ice = platform_get_drvdata(pdev);
> -	if (!ice) {
> +	if (IS_ERR_OR_NULL(ice)) {
>  		dev_err(dev, "Cannot get ice instance from %s\n",
>  			dev_name(&pdev->dev));
>  		platform_device_put(pdev);
> -		return ERR_PTR(-EPROBE_DEFER);
> +		if (PTR_ERR(ice) == -EOPNOTSUPP)
> +			return NULL;

The consumer drivers check specifically for -EOPNOTSUPP, let's
just return that

> +		else
> +			return ERR_PTR(-EPROBE_DEFER);
>  	}
>  
>  	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
> @@ -726,7 +729,7 @@ static int qcom_ice_probe(struct platform_device *pdev)
>  	}
>  
>  	engine = qcom_ice_create(&pdev->dev, base);
> -	if (IS_ERR(engine))
> +	if (IS_ERR(engine) && PTR_ERR(engine) != -EOPNOTSUPP)
>  		return PTR_ERR(engine);

This essentially says "probe succeeded, device not operational",
I have mixed feelings.. That said I'm not sure about the lifecycle
of a platform_device, i.e. can we set the drvdata and return an error
in .probe anyway?

Konrad

>  
>  	platform_set_drvdata(pdev, engine);

