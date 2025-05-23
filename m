Return-Path: <linux-arm-msm+bounces-59207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E1CAC214D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 12:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E29BE9E4A5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF172288E3;
	Fri, 23 May 2025 10:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHeciPz9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F7F2288C6
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747996968; cv=none; b=dEIayVWChb0FT3WejShXPJa+7ixY42ZdIyvt77+3w/5/UDjqyf9SeHGUmxSrHMDzARZqijwydBTz9FzXxCgaGI4gb2CrGviY7FgmA94vhkmuUlqVhnI0AzT7lbK0zoZrLVuVGt2p329OGUer+a442+fTMo395nZ+JpEYMKadvvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747996968; c=relaxed/simple;
	bh=456kWQgMQiXthflQvHRvF7kbUDd02oZHHsitcEetP38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8+Zt1nKoocp9F7YCy6SDEFU+S0EdTJi62orHpd5wmcamSpd9K8o1FRvZgCfpJBTP9+p5nJNpDgc9XF4QWfz+CdJ8I5T70PUAT9YsyUsi9ZOJi3xRuT+No4Kr78GxN55nXMUgXjXfVz/AoIxsyUcvucfJx1QG/kF1djNWDhm+qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHeciPz9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N40FAf024849
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LCAeZFLp82SExSfCYAPh+KpsalxdX3ZnKotmtE0jVds=; b=ZHeciPz9YmkKjKg9
	rWkXERx217f2DSRGoeo4sCxABuVTH5XJ3IjqclFHV8Xm31yirAVgk3ySaFVH3XPL
	D1b2Tq8pE5Y1hr7JOzHGx5LjfAnEMB3D43IgS3lxmWf4NccaLJYfOjbaJlL8mM+8
	xo6st78Y2voZnjkc2L4+Y/5BUX8320oR7/dwGY3Fqqd7QxvIy/SrqMK5sf7Dv6CM
	RxLFzt/Gr/tPKeKMBPt0W5hgocUFnG0porJNMZ5mPoS1lSwszMr+OCHjT5l+bBuf
	uQJuUn7M17b1ckuzjzkieTEgbsGWGm070fYm7gtUtOgn3cGQeUhgm7yi2Pp0VlHu
	f/tobQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf51mqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:42:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8aa327049so4730186d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 03:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747996965; x=1748601765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LCAeZFLp82SExSfCYAPh+KpsalxdX3ZnKotmtE0jVds=;
        b=UXilKhRL5Nf9siamMJMVASqSyOVLqovb31J/ZOBq7TzDY/IkAtEo7+RdFYPlW5cq6p
         Vyt9K5wAD54jcNmKhPyeg0nUbj0KoC3uPrpOKXbKiZ0NVoQMVHcL0YiDAl7CeScb1t/F
         GfDUgTKgsaMo8wJLlAoMr2UNWyihM0lrwIUDpovgZUTQl9g4me2o0ruPXTQtmmWeBwZ+
         yKQNao00AK7cYDjcpNmQ4yApRJ035yDHgIrpwfz1kwcWKdHolRa/I2k5VunRNr+gDW14
         H2ffDCCJagh6g3TRvjWRbF1i1ofHW97LxLxqP+9v9xQciPiNp9SuHIEEHkQ2Y3k8LeQ7
         ww6w==
X-Gm-Message-State: AOJu0YwR/3tGlOICi8Tg7P+UDny0Q4kNvi93+E6vwxUiaFckj9TtIYCW
	x3xsuyfCHVraoM/jYKY+7Ynt9d77Yemx58wPFzwLpJiJ4hH0fstl49Dt2QaiLsiBc0FLCr//jyN
	JDJXwKq3XEvG0yq1vKgnQoMi/OTjIMuIQWxmcuTjvSHBTOgecRjR9WRy74QE0bkReSxQj
X-Gm-Gg: ASbGncvvOC64aUT7UsAMLVWcuPXGMt6mMQQNviyw2DFnDb9bvj6bYrtxYlACEafpOjy
	TrtbTrS3V6BHaHGMB3yMFsWrB02mgeF0N9ocWFWCjeofdWc0THDMgq4qJw67Qm/rho2eRlgmGD3
	F2dV1lowZF8D6mQiRI4PEeN61f/WWjx95+OftzCH//UQh5usEDjS0Pi/iacA7lry9x202WCChsI
	tPsYR1goN4kqewS0E75cXGTjPo2jxbZsMTYEbS5wxf27Rgc37Ka1MnghnfMSIB1Ld+K+vLLNXaf
	3CbwBkF8RfHrkygkfHGYhNA6YZZwZ1n3QiOCKGbYRoAuqukyQn/QG6m1lozDkooB7g==
X-Received: by 2002:ac8:5893:0:b0:494:b4c4:8d7e with SMTP id d75a77b69052e-49e316c9d81mr12126391cf.12.1747996965167;
        Fri, 23 May 2025 03:42:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq2kM7kdp58c5VQQxWsvt4Fk8p9sTB5Vk0qJ9v0IYSVdBujAZqX9KngW23ZFp2R9/vvMDpoA==
X-Received: by 2002:ac8:5893:0:b0:494:b4c4:8d7e with SMTP id d75a77b69052e-49e316c9d81mr12126231cf.12.1747996964760;
        Fri, 23 May 2025 03:42:44 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-601f1c598c2sm7287366a12.78.2025.05.23.03.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 03:42:44 -0700 (PDT)
Message-ID: <e9760d43-58a1-44a0-971e-8dae68f920f8@oss.qualcomm.com>
Date: Fri, 23 May 2025 12:42:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine:
 remove camcc status property
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250523092313.2625421-1-vladimir.zapolskiy@linaro.org>
 <20250523092313.2625421-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250523092313.2625421-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vrgS5_25l5xlVjqlCqP2VuGq5G105GY4
X-Proofpoint-ORIG-GUID: vrgS5_25l5xlVjqlCqP2VuGq5G105GY4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA5NSBTYWx0ZWRfX331WAUVBvM5Q
 Wa6gLibQjZ9w5JmnQ7QyzWchE5+x5ySZ2UVLqOe0clZYdO4G9eHfuMUMBoo6zMADyyAe5RLj4XK
 esi4zT7wc7tetPGESwPIXeHU3Hy5MlMC92fi+Hb4q5gsGyxCRZbowyVC2c9P0wHaLzchO7Pxpck
 yGOGbswOBzRU1xP+RN6tuR9Ks2fqdeJ0GpFRRsU7vGBPZZHW2lJmh5DkmK6jBrHpgvhxr2PawrY
 xSAjFAcKnGZ0Pc3m8NS4bNy08TS/LlrQMjtglWIgvUvFTeNWqQESB7KxwH6voXZXYDhjNvbF7KH
 Y7mTytSVSyObfAKHV+9eZPJP0RaKaZEj5ZvoYk10W0DWyxXbtWXrwNmLGU7gZOL4o7J9SX/MPRz
 LWcx/z1ZgYTYiayHIQnWa7NyGKp/Zi/7Ak93U9ubqRkH8rHiHAYZS/63RFjiJwFNqsOd1lRd
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=68305126 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=sPE8S47I3oryDVgBse4A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=904 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230095

On 5/23/25 11:23 AM, Vladimir Zapolskiy wrote:
> After a change enabling camera clock controller for all Qualcomm SM8250
> boards the explicit control of the clock controller status can be removed
> from the RB5 vision mezzanine dts overlay file.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

