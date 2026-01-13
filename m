Return-Path: <linux-arm-msm+bounces-88763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33164D186D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 12:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6302130A5E94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 11:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3980636CDFC;
	Tue, 13 Jan 2026 11:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GedOwv1V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1Eilhza"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50CF38A706
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 11:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302793; cv=none; b=O+l+fFlawtCMSWK+W+5bfin/Lv7ciEd5o1qcqmOpbYesQf2B+zI/MxfltgNV8cqJ/eOtFznG83uwMqpKMSjyODQzBQI6rbHucWBBgTA2mKSBgHIbb/Rp7OPucOQp+UXLKtKmzcuHq3CMGssfqauIu6JcW4UtXt+GQ+3VwSLCPo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302793; c=relaxed/simple;
	bh=PDavS90hUEFfszRgEwSXLUkXH0ilscgPc0vJIf89Epk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vw7SXcsv5f5r66frTrWmgk+3gRZUHbWdf/n4X59JDeYIDIcEkToYFI+in7xcnn9HLdEjCtwbmuYJzpSGc7lRWe5DuyRTn4bQ2Zuq8CrYZD03V6p03Oz48v0UjCW+mqMACbzrU6ZWRvmSFMTgucDSVi/5pobCqeoaUjbJ67uioCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GedOwv1V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1Eilhza; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5gqTr3810630
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 11:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZAOeX4n+oBxdWTfJxCSFfny5St8rR/AsbKjH131FUnU=; b=GedOwv1VXbSrlQCC
	qrXTxu7tvKao4KVa8GsjGn6BbfZQOsjoPKzX/BeIkyg1q7yw5k1v1xVLGVg5Ohhy
	KdcR3/HsKmssWUz+Zdu/5DVI0ompdsUg5jXZjpNXEWH/9/70ooXl3DtSNSvVuQK7
	KZZyATmWYBV5QuoLCloCE+au1n1NYWao0Ep5+mH6zQukxwRLIuHe1lr7CklRxqs0
	+wewQFkgEzmsD2InSIefzToDA5e6f1X9BmbyJAFagFB2aGFAJHYv3JVhC8ggMt0W
	K6zdGi/+fdCBVgYlX+Oh3h6QF6eoLYGS102Xj8g01ZE3S9+rsnuXQ7el0Jp2jUWe
	vQBGIQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng55s266-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 11:13:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bbb6031cfdso244126885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 03:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768302790; x=1768907590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZAOeX4n+oBxdWTfJxCSFfny5St8rR/AsbKjH131FUnU=;
        b=C1EilhzaPPJsT7iHoXEM9y8UN9OQnCqiR9mnJvyACK6NA36IhXYfl13gk+19lHJiw/
         5/e0txMTlHduPcDMm8UM2YAtM6+IIPzAR7N3kb3OZsAsUosx/xTaIXg12f9fpRmSD1v4
         gu7A33a54ip3g2W9NHnRAWhlT+0rrHcQATouDlukwloNybGXmhsrlKwvpA8dBVb9xlZF
         CpG/vt/Iv+hXPE6bIWoEqRoc2CRBwd2ldmePSydU5NF+834BJHIPOTn34hMrJJ+KFgWR
         qWp1qHWx9Lb/Ln7DH4a3uJZD9yVdAjJsa9ptPAovtd/yGpjXTaeGFPSuPxQj+rdkuES6
         KRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768302790; x=1768907590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZAOeX4n+oBxdWTfJxCSFfny5St8rR/AsbKjH131FUnU=;
        b=J2B0vbj9KrjPdpc7EVNG+ObuzfB9WKAKs9flHCjhIA40nmF2sWRQlTQ+yJGMQCcbgf
         yNRrcLIL9U/glgAsh/A09rG6rlxFa+btMGvX9uPDkCSqh+Wn+tzOXUQX4BIJn3ww2Clm
         CG9ba4iaIjihCVkNR3XimL/f2U1CZsQMmGaHcmU1uyiAvza4XNQik23tTEl/l+0PonAc
         HBskJuSoADhczx3VkBmgaSdKc4xuaXT5n1d1Lt2pkHPTqbSG5QQb9PoLcYv5pmV+p9bl
         SpPr0recpnKCF907ENgDQDHY57S9JnwBXNt2b8fxIxySzm88iWrXxKqgRD0EkpohnvnC
         5scg==
X-Forwarded-Encrypted: i=1; AJvYcCWmKlCxI/FeUkU+H9rY8vOUNNHl5JUQUSMJ92Jy+UKamWppMyXqZPErHZvRv5R5mrKZBstGQWxyLuJ4Pt1A@vger.kernel.org
X-Gm-Message-State: AOJu0YxJMlFbMtvxkyov0PlEtMNOlafgmc8oD0+GQpG6iFh+UEPvyYdi
	7kXEq2fIAQJPprRtNu0VXKROyc2pF/XWb/U3s+BvgHaA3ric3CvcbJuK8eJEB2FB0AfmvL7k506
	fTHK2CrtcNsZbSAlGUbyi5e5zEoUNeFAN5Y+9ITSPu7R7mnkRIYLVa4vSuelhljtssUcU
X-Gm-Gg: AY/fxX6r1RMYe/LVJn1UySX9Rau4QEgUoFrPt4fozk1RG4Xo3EIkP3+xqs2rP/ufICo
	eLv0DUl1KXD5aofV+bofEUoD2cEfLjMGiX5FNIfWBniFmRLPtvhhTLZwCLLaCDbKN1fjSf4YEuh
	OLROVTQ3+BG1LeR/H3EHx5VZMD7S53yZaVQaCOuoWq0TaSPY97t6TIBdaQkDLzOGa7FvoeTAJIO
	AcoZ12NhfAFxbWD6vt98gzmv8TIaoBsr9JVBEoDqQeXv1pqdN/Y+onyS7seUgrwrXRACWe/PGL2
	mTzV1hc9In/YWM0FSmDYVIhuJOCwoILSesktJAc9kgdZL3L5z820h2+UKwI49YgCBul+iJRKHtL
	EBqK7iOJjhnt8YsmE3wh8x1UAm5W/R3GOD8MjAW+koGltwrsKkyXx1dDCOS5H95rfl9Y=
X-Received: by 2002:a05:620a:f15:b0:8b2:efb6:5ce8 with SMTP id af79cd13be357-8c389410414mr1907218885a.11.1768302789855;
        Tue, 13 Jan 2026 03:13:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAKAFpGE/APckeyZBkps0xBADh43KNlPgtm5cix9GOlwpx5+j2l/7Qpo8z3SnIe+GwTLKuAw==
X-Received: by 2002:a05:620a:f15:b0:8b2:efb6:5ce8 with SMTP id af79cd13be357-8c389410414mr1907216085a.11.1768302789049;
        Tue, 13 Jan 2026 03:13:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb3a02e3sm45306481fa.10.2026.01.13.03.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 03:13:08 -0800 (PST)
Message-ID: <beb63598-a7fc-4e77-a68e-8622fbd93972@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:13:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/7] qcom-tgu: Add TGU decode support
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-5-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109021141.3778421-5-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aFpWLppo7_8JgmNgHvjZxFrTvTVRiQl6
X-Proofpoint-ORIG-GUID: aFpWLppo7_8JgmNgHvjZxFrTvTVRiQl6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5NSBTYWx0ZWRfX12gwle4MZ4xg
 +7cZmTvdA0HWtQLoeFjDyWDCScWDJfiA7Mp4OEsBSqYyX9v8A61c8Z0GPq0O/XTB3LNidoghiPu
 Sx9MM9aMuVQZIQjU/VG9M4GxxkPft8HI9ccle4t+NdT2bWSAa2j4NbSiDbdpNtobKXQ/L39XDf9
 I3O/iWkWpBSVAqp5oIotcVwjfnsfEqwyIttFtV8q9PSnIdLU+D4TVGL4fNWWAp4Qld3p8IKT91W
 rLClYJ4FyMb17Z1S0RW/dj/eiipc1hM5YMMJ/CvCwLICboRglNy7jgOvVpqlzEC0080y8jBiDtN
 cwS4UnhwdgcmxHGgp6EXJZQwjTab+u7MvMOgxfH6gXwg+bY6g5ZGJ/iOYrF71IQ5Sd9g7DY8lGQ
 yv3Oarkrpc/u5lYpY4OvDuBdxcMPckkuk2+5ae+Ko0cwCLDbnJ2SC0LSprqBytAICA7Kb3PXOUx
 QrdE//EmJdrJfFaybXQ==
X-Authority-Analysis: v=2.4 cv=IIsPywvG c=1 sm=1 tr=0 ts=696628c6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CBdMip5UwVPz19tR0hoA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130095

On 1/9/26 3:11 AM, Songwei Chai wrote:
> Decoding is when all the potential pieces for creating a trigger
> are brought together for a given step. Example - there may be a
> counter keeping track of some occurrences and a priority-group that
> is being used to detect a pattern on the sense inputs. These 2
> inputs to condition_decode must be programmed, for a given step,
> to establish the condition for the trigger, or movement to another
> steps.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---

[...]

> @@ -18,8 +18,36 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
>  				   int step_index, int operation_index,
>  				   int reg_index)
>  {
> -	return operation_index * (drvdata->max_step) * (drvdata->max_reg) +
> -		step_index * (drvdata->max_reg) + reg_index;

I think this type of calculations could use a wrapper

> +	int ret = -EINVAL;
> +
> +	switch (operation_index) {
> +	case TGU_PRIORITY0:
> +	case TGU_PRIORITY1:
> +	case TGU_PRIORITY2:
> +	case TGU_PRIORITY3:
> +		ret = operation_index * (drvdata->max_step) *
> +			(drvdata->max_reg) +
> +			step_index * (drvdata->max_reg) + reg_index;
> +		break;
> +	case TGU_CONDITION_DECODE:
> +		ret = step_index * (drvdata->max_condition_decode) +
> +			reg_index;
> +		break;
> +	default:
> +		break;
> +	}
> +	return ret;

The only thing your switch statement is assign a value to ret and break
out. Change that to a direct return, and drop 'ret' altogether


> +}
> +
> +static int check_array_location(struct tgu_drvdata *drvdata, int step,
> +				int ops, int reg)
> +{
> +	int result = calculate_array_location(drvdata, step, ops, reg);
> +
> +	if (result == -EINVAL)
> +		dev_err(drvdata->dev, "%s - Fail\n", __func__);

Avoid __func__.

The error message is very non-descriptive

[...]

>  static int tgu_enable(struct device *dev)
>  {
>  	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret = 0;
>  
>  	guard(spinlock)(&drvdata->lock);
>  	if (drvdata->enable)
>  		return -EBUSY;
>  
> -	tgu_write_all_hw_regs(drvdata);
> +	ret = tgu_write_all_hw_regs(drvdata);
> +
> +	if (ret == -EINVAL)

stray \n
> +		goto exit;
> +
>  	drvdata->enable = true;
>  
> -	return 0;
> +exit:
> +	return ret;

ret = tgu_write_all_hw_regs(drvdata);
if (!ret)
	drvdata->enable = true;

return ret

Konrad

