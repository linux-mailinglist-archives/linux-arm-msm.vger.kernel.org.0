Return-Path: <linux-arm-msm+bounces-72186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FBDB44EAE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 09:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75BC41896AAF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 07:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CFE2D46B2;
	Fri,  5 Sep 2025 07:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1UCHN8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74A632F76C
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 07:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757055835; cv=none; b=W3oOYvoWwFC7mJ6xwOzr7bZuMDXhYGqL7QkRz/jDnqd4NJ26TWIdH93KjrJufRlQd6xfaTHHGFCgfu13orJ9zBdGWJ28UqAnqtUl/iFE365YJRrKStL3a62VW7+s362xOJ0GrJjhSnZthecNT6OB2EAzS07j7oiqg0rWGkzLVvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757055835; c=relaxed/simple;
	bh=VM0nKVBbJC3EXcL+2r1nh5KaJBUzAyVK/5lsmjwQ2TI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZyO7h8HLDUG4uWwylP2/KFz9DrCKOqoLyAb8lBObgmjwIuaFmO8SpKl0sr3qX7umTl+qw5FDbbMSKSKC434/wntPwsvzqC5k6qzyARxiAfKSPSLVJg3r+BJajkESBZglLfIBMTpw6TFocJfyXKpi4l0luJmmwTtxZHCPkMJuNmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1UCHN8W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IgG9C007841
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 07:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uh0zHPqensMvXDsKJ/9Mhe+pmsC/EijM0tWsWvi8kEQ=; b=O1UCHN8WC97vjYZZ
	HQDZWIFmZIQ4qKqGMXT5X6HeLjpiPQPpx5JctW96J4S4dEenQjD/UXfLN6gaBOAO
	8gkxhFeptvAr0AWXVActyILCKrNApNne09l4WZWh7n1hbWoHLRuSfaV54jvmHNjS
	nrp7MeNseUepje+n/GuywGdDlYSahWdn4CC8EAkFdBtJIBMHe98Po9JPS2NdQjLY
	9oxW+WGXgIJNOAPelHTFWUWxUoNNANnMmYxvyH+oJHGzvjE5O4JD+dx7/YNxtXIS
	cFCWyGEKilV4X3TAArof6gNI5lhNzYgVlPkuXXMkJmqJrTKVeflcSkaj/b87+fX2
	Hvkk8Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura9237p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 07:03:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b32fe42b83so30700021cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 00:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757055832; x=1757660632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uh0zHPqensMvXDsKJ/9Mhe+pmsC/EijM0tWsWvi8kEQ=;
        b=vG37eb9f49DcJ37fquNHcTFM/bz5HfXzjjzRX8Y2GkZIZCEievvlGs1n1TlpptCBcL
         QVEoY3WDAS/QrANl08J/8IrluMvQVYTjAuSjOIfS8y/CSS0Cn0VMqNuNg0fIGepVqbEP
         ihh0gshhwGtQbouB8N64EFmylfV2MjIYGumHjdgBJz9viDlop7E1T3Bmqfvyxgw9nuXM
         SmxyJxdgQ//oCyuoodTY8Z8lEkZj/g6ssU8fj6GiKtmtAdbi4TS9ackxexw3zXND3JIH
         8qfAlcM/h1O6D4ww/dW5edE6IkEi2bnwGJ8ASbOe+yfoKCoxb6+MdNOJW8Qpa2F7MPDQ
         q+0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxLxLybbbzdCWe60qLNL5RERy+oDBOvf/bTDyxAogpI7dsD/i6PkAWzp/ox15qHDXScNjkCSQGAiRsI1o+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4b13FK5vB7CtTC4irK5MNt3ypjp0kDkqDS9ENwFp2J7rCbJQg
	8/YYqvQZbXJGTDnyd8i+yTfhTm9kNp9j21xTArDibWFpwPUsmwJqdDIkntBx2c1cwIwf0rFxRoj
	hoSprST9bzayZWDvjIHOpq9iZmjWwcxfAn/iLy3uZlC1hnhGzntC4oaTW3kKR8wt4CydH
X-Gm-Gg: ASbGncs7zhujroX2/7tWqzmZEMNIFch9jNBklUwkr08JXjQAbjrvcDKb/q4TjfGNGyT
	b53PKCL+wAVE2rsOpplfhTxqBaHKCODh2l9K+W1vOShWt0DFbF5al2vafMzkT4zB8xFN20lc7A3
	OvSbLUg7A9Pf7zLswDMEhxfVZsAAvh/9nkYLCog9Sd3e+WiYd5CU+OyC4B6Porn9Uh5f+YKZMy2
	OPd2n47XkDR8azASVjYNdNPK94kQIIJtTxL6pVsEXQVX5fUMsqzsmfm/Ro/4cIbXf6uCBygAG7d
	AXSXbbanOVOvw5VFGOn9iCKDlM4/tHNGiVpH35NOKr8b4u8qlD7I2TvF9lV4S52R0CI=
X-Received: by 2002:a05:622a:8ca:b0:4b3:4fdb:f2a4 with SMTP id d75a77b69052e-4b34feb3e21mr151706451cf.73.1757055831893;
        Fri, 05 Sep 2025 00:03:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG2WGOBevUmbvF6L6SlA1g/1cS0fHSL6yPVxAnOVTWc4dOXAnkfXOBDdkJYebg/JKqxCflAg==
X-Received: by 2002:a05:622a:8ca:b0:4b3:4fdb:f2a4 with SMTP id d75a77b69052e-4b34feb3e21mr151706061cf.73.1757055831200;
        Fri, 05 Sep 2025 00:03:51 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b8f2d3c88sm183965295e9.19.2025.09.05.00.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 00:03:50 -0700 (PDT)
Message-ID: <f6a631bb-d17d-4eba-adfc-4db08540f5a0@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 08:03:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] ASoC: codecs: wcd: add common helper for wcd
 codecs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org
References: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250822104927.2621866-3-srinivas.kandagatla@oss.qualcomm.com>
 <kmm4e5bg7uehmlsgrfhzo4agr6ga6d5gxtpxq5sg4t3wql5p6m@llwyz4kzsj7y>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <kmm4e5bg7uehmlsgrfhzo4agr6ga6d5gxtpxq5sg4t3wql5p6m@llwyz4kzsj7y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Fs4Ou9kC_tRW2OxfFkMQZs-p81QU2paL
X-Proofpoint-GUID: Fs4Ou9kC_tRW2OxfFkMQZs-p81QU2paL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX3C7mB0S18vMM
 kzf/S+JTem8yewO00oWNB40ftr8XhxZqdPUK7BNQShHp4tST3xXIcqaOINan9FvdjYaJq6H6im7
 1K7769+kTY1Fo02/q8eApi+vpRn/dUxFe3LOvw/yMofEGF3jyiu50zak6otful0zx1TOAmQEftU
 dNi6MDFVE1iRnIyR424t0HstpYt1KVK998hP5udbe3B/YH0oBkSrinnVKrfiuf66c3vVqKGO2AP
 EW1sGRF7ZVy7OThpYZb2Pu7SNrLXZvb1qHQusOolVf8yfYqJM6m+/So6NgSpVrpYnRgln74U4qV
 Db0MLVRMQyS6/bSJzLn4yLmLfw30Jdc5mzPpQm30xO/jXPQmXHxfUi0Z03HJ6r+uBt0JVLcOBfQ
 dweaQenC
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68ba8b58 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Jf94gfbLdGj3VxC-8ggA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

Sorry for some reason I did not notice this email!.

On 8/22/25 12:18 PM, Dmitry Baryshkov wrote:
>> + */
>> +
>> +#ifndef __WCD_COMMON_H__
>> +#define __WCD_COMMON_H___
>> +
>> +#define WCD_MIN_MICBIAS_MV	1000
>> +#define WCD_DEF_MICBIAS_MV	1800
>> +#define WCD_MAX_MICBIAS_MV	2850
> These do not belong to a public header.


All the wcd codecs have same MICBIAS circuitry, this is the internal
micbias circuit we are talking about here.

Actual micbias value comes from device tree, but these are min/max
ranges that are supported by all WCD codecs.

Why do you think it should not be part of common header?

--srini
> 
>> +#define WCD_MAX_MICBIAS		4
>> +
>> +struct wcd_common {
>> +	struct device *dev;
>> +	int max_bias;
>> +	u32 micb_mv[WCD_MAX_MICBIAS];
>> +	u32 micb_vout[WCD_MAX_MICBIAS];
>> +};
>> +
>> +int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv);
>> +int wcd_dt_parse_micbias_info(struct wcd_common *common);
>> +
>> +#endif /* __WCD_COMMON_H___  */


