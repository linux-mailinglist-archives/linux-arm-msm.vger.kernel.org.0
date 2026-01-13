Return-Path: <linux-arm-msm+bounces-88764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B4FD186E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 12:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E35F63067F5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 11:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D7A387566;
	Tue, 13 Jan 2026 11:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iEERgBlO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xlwr/tIP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25CF34EEE7
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 11:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302957; cv=none; b=OTliL6zCYG/VeqSh4jN7Z0RoIZaftZkOSFHQbO//ykSgohV7haTebPX9aexzVYzTzMkdBAX/QtR7X24DxV2Lpq7+VaeT2qvpPB30Y05BM4R3LLdbFM/JMi/LyhZER2Z/+XmEhxEKN2g2MnBMENfD9KFpJ9aAYvadWa+5wfW3IRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302957; c=relaxed/simple;
	bh=+bLGB6ZM3C0b7tjb3Ht87bo01YwecEOlYC0n6Dparmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rEzNg02Vgrd2UjH5xZD9AKRhP08TUruhL03Xlg4mtP9Gsglh/7Ui5vUxS9KFacnjCk0R4Dooo7FKKv8KRGdNMQpuKNoDkaA3faGwb2aXIBx3L+V5/baPrdqC1Csc6Iaf9Gnlzj/Me1n0TlkKFmLejtmtsdt8HyhC5JHW3f/4r+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iEERgBlO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xlwr/tIP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DBDXHt4164854
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 11:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WVz2cn3CkK/mIo0N8EVudxmtiUauPsvts9rJ0BtRZTc=; b=iEERgBlO108Jbnoe
	rdkZ08PB4PGIZn/o+lECpKt6YvxF949EuAE31JyvGK2l3ScuRaa1eYl3/0ateZ3W
	IboWh0dtqGduxGxPVv5sWLB8Nzn2bR4nPKrLvrHO1tosdnYFG0myuNSfI0jtSKR5
	ugE3JsnS718CZizEpv77l089ZZ1cskYb3jcIEFMxG3QewCm8z2hPjuY/+Knv9ikJ
	mM+MUZm16JRUyHpIFOyuL2Ys6hPr15V2ZBafo8irR34KWZVSS0w9KdKdMuk4GqwE
	f7Ger/7Zr5uYTzueuZbptj6DfzO1vE7GzpMtRCI4zLuWO9594mxTjGZFwslEDRum
	1VbbGg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnn06r08g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 11:15:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ede0bd2154so23153361cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 03:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768302954; x=1768907754; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WVz2cn3CkK/mIo0N8EVudxmtiUauPsvts9rJ0BtRZTc=;
        b=Xlwr/tIPfdEHm5AhrGf5sf9AgSEm1V/p8vdqxAv44fFDUWFMQlBZznZaf6VjFlNVVR
         d/vsD5eujPVZa9GfwsNhlNnwcCyFNHwdzpEEmaKJbNZRKTNluy/+6R6HF+fmOf0iWlT8
         67YoQLjR+SGfzpmEkC7+D+vPeXOpJdJFAxd5lM+anusPxt8vyRm7iy2Z79hlEHZO+B33
         hROosL7WJ+7bzpEghxAz3kuBk5zkO5MVSWsaH5O+iIQm6RXypd+ok4Zs0NmYIk2vVtJS
         6NMQti6piLwei+FrH3bWcXhspV7IC3V5pzsEagsRtVP48INxgajqXiOTi1dneDGT+GOA
         OasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768302954; x=1768907754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVz2cn3CkK/mIo0N8EVudxmtiUauPsvts9rJ0BtRZTc=;
        b=rIZN9Gsj/u++cFbrcLhAi1zrs9iBPpV/A6WPMPdlvee2zlLlkiydx15ShAn4bUeUyQ
         H3T50pL0I24TQK65GwSGY9YrfbkGQTzAOgRnpHA6LhUT87s7zdieGCh+B7NCUwt1DwUg
         0Dbsmf5CN+2RMrvUfDQgi9EDZcOsbjthmMM16GyCF8bh1mAPLPKt0I1/lZ2T4Zmz3FwM
         juqtF1LzdrrzNSQ5XaBwf2HbOg01qyH5znXHJamjqV3mB8qulkekUzyY0lsMFN96q2Xw
         A8e58dvZVfqePH4W1Pe9yNTnYx/Rc33siDzTm88q5MIJgErdOfxZwR5gfc1YeSHAoNAm
         ty+A==
X-Forwarded-Encrypted: i=1; AJvYcCUVab+ERnrtcAy7Bps3OJZ3txxrQQMscanRkwdyjJIa9AoyvqVhZ7OeZnp6yro3Dhqzh1DIrvVH9ramJ41u@vger.kernel.org
X-Gm-Message-State: AOJu0Yx25XdVqe77ck2ln/O692m7fO3/5X8T4EDxjbapFrksaR99rzId
	9HYwWzm0RMi1yPJyHt9Ho39wmzG3rWbkzsTrx5vB2sYTyjOeNSnRtiwUTgPIBOTNh5J5hHdp6KR
	y+NgmnLNXwPD1A7flCfyUSvFAvfw4q9SLKZcKU0XTWcgUlE9QYSCtasYvOjsilFasoUxg
X-Gm-Gg: AY/fxX7h4zUJyIgAcjRgiOZTib2SIGRizYYGAq7TwPBb233ydY+JKGTJdwqthP9zkya
	aOG/A2McfK0fY8voVk6Sap3TE2V3FCMjJo2j/m+alLmgufcn4LHzpQJTwC0B81GhljI8gFi2a/K
	kGWoNf9rkJeCJRn+EjgL6ms3kPDLTG4rzgGpftVG+rBpeVrkA623hoGK72rzXB6WiLv58VsXcFJ
	/dZWtqq82bDVTnyTyxWmlENGPiI/dRsfOXYJRQNG61iKpRrXcDr4Y0ehy2Oa+2xAKDyFx7/fLJS
	xzD1wJpD6Mapj60jFylDVbxocFnyvJt+fvl1yUhMqC27jQwGPWeKJWrNID54WCTAu9D/c2yImgH
	1jOfbUXB9xwiY4RiExMKDZ9vkKLFSMAEDT5FQWRHLzQ36bKGqHlsCUsBvLuZc4bF2ycY=
X-Received: by 2002:ac8:57d5:0:b0:4fc:989e:f776 with SMTP id d75a77b69052e-4ffb4861697mr246417941cf.4.1768302954145;
        Tue, 13 Jan 2026 03:15:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgvlL8JKDCb6sI78Mbz0Vz1WwN8iCeTN2tlWwmv6VllLm5D5BHEcNdQ6oG3pEEypulUcU1eQ==
X-Received: by 2002:ac8:57d5:0:b0:4fc:989e:f776 with SMTP id d75a77b69052e-4ffb4861697mr246417551cf.4.1768302953623;
        Tue, 13 Jan 2026 03:15:53 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4cfe60sm2185088966b.45.2026.01.13.03.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 03:15:53 -0800 (PST)
Message-ID: <f211054c-ecb7-4f90-b9ce-9fdd7710c8c4@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:15:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/7] qcom-tgu: Add support to configure next action
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-6-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109021141.3778421-6-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: F5whJzt3J7-NgkqICVkSjd30JtBbTVXe
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=6966296b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jWTz0FIqI1YCIfhA4ZQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: F5whJzt3J7-NgkqICVkSjd30JtBbTVXe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5NSBTYWx0ZWRfX3j6Mgs7SKZtc
 HVeew68nbMDSzfIRXDRp49X+zFNKJmTLeFniJA37tpRWvNvvnPukyIIhnQQISK8hF8LV3GEU/L4
 dr/JmVw4zLCUekPg1scvTMTRVhnlLVPxaR7PxrdmAQzS/o4A9NEcuvOlSul6dHagmQuecikPt+2
 F+K4sznAIJKtfTYV0X2TUYtzyhXZVOBtIqzU12ZgTlmKorNq/KZ+yD1VE2z12kTlIUUjKw06AK9
 m6D5jjt+Lff9ZmNIC33xvdK5zbEs00NE4xAqeITfISd87MbLNXnsU3kZ9cBAWNg3UTD18lkoz4q
 IOdbPMEJvnnn2lzK7vBKhHVUSFrxaveTTChLdd5RkvTFb+X6gDN/zoU8Fl/p+yRESgkNybFSy+Z
 80YVEMoX2ZXKHm8xaeFbhGHxAPt1u3aR9FVIu7ZhcU5pY3r8ZNK0Si5LzNr4mYYQiGhfG2t2Q1E
 n936/AEN6IlMdeDxchw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130095

On 1/9/26 3:11 AM, Songwei Chai wrote:
> Add "select" node for each step to determine if another step is taken,
> trigger(s) are generated, counters/timers incremented/decremented, etc.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---

[...]

> +		case TGU_CONDITION_SELECT:
> +		/* 'default' register is at the end of 'select' region */
> +			if (tgu_attr->reg_num ==
> +			    drvdata->max_condition_select - 1)
> +				attr->name = "default";
> +			ret = (tgu_attr->reg_num <
> +				drvdata->max_condition_select) ?
> +				attr->mode : 0;

similarly to my previous comments

[...]

> +	for (i = 0; i < drvdata->max_step; i++) {
> +		for (j = 0; j < drvdata->max_condition_select; j++) {
> +			index = check_array_location(drvdata, i,
> +						TGU_CONDITION_SELECT, j);
> +
> +			if (index == -EINVAL)

stray \n
> +				goto exit;
> +
> +			writel(drvdata->value_table->condition_select[index],
> +				drvdata->base + CONDITION_SELECT_STEP(i, j));
> +		}
> +	}
>  	/* Enable TGU to program the triggers */
>  	writel(1, drvdata->base + TGU_CONTROL);
>  exit:
> @@ -225,6 +258,8 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
>  
>  	devid = readl(drvdata->base + TGU_DEVID);
>  	drvdata->max_condition_decode = TGU_DEVID_CONDITIONS(devid);
> +	/* select region has an additional 'default' register */
> +	drvdata->max_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
>  }
>  
>  static int tgu_enable(struct device *dev)
> @@ -356,6 +391,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
>  	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
>  	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
>  	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(0),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(1),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(2),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(3),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(4),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
> +	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
>  	NULL,
>  };
>  
> @@ -363,8 +406,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>  {
>  	struct device *dev = &adev->dev;
>  	struct tgu_drvdata *drvdata;
> -	size_t priority_size, condition_size;
> -	unsigned int *priority, *condition;
> +	size_t priority_size, condition_size, select_size;
> +	unsigned int *priority, *condition, *select;
>  	int ret;
>  
>  	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -417,6 +460,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>  
>  	drvdata->value_table->condition_decode = condition;
>  
> +	select_size = drvdata->max_condition_select * drvdata->max_step *
> +		      sizeof(*(drvdata->value_table->condition_select));
> +
> +	select = devm_kzalloc(dev, select_size, GFP_KERNEL);
> +
> +	if (!select)

stray \n

> +		return -ENOMEM;
> +
> +	drvdata->value_table->condition_select = select;

I don't see a need for an intemediate variable here

[...]

>   * @max_condition_decode: Maximum number of condition_decode
> + * @max_condition_select: Maximum number of condition_select

Maximum value, perhaps? You haven't explained the feature very well
so I'm not sure what this is supposed to reflect

Konrad

