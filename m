Return-Path: <linux-arm-msm+bounces-72005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDCEB43684
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 11:03:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6539D1BC3113
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 09:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF47F2D5C95;
	Thu,  4 Sep 2025 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IAaXnSLZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AB5286D57
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 09:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756976595; cv=none; b=So+vo7SJ9OLW27pgYDRII/VAAw5SmN40YPsLmTkhb7pTGirmeqQEMtcqWj4pLhW/ZFFHeLxS0MjRhN/fQk60Apc9gAdrKR804XAPbFirqrDk0riN3gci9KEBUWjGh82ib/Vuhem37mVXSHnH3t/J8jTJcJ+aXRzoP8snvOITtdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756976595; c=relaxed/simple;
	bh=PpYWG0Bjw7Xcz83Fr7zQIEJIntOwcuHatKNx6YBA8Rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AOZ+qhnPN1+Y21jqkO1lmCVy25w7q1SPJNNVjqVHfOo0PSlZUZ9uiAwmQ7XcYBsbm+K79zTxFlBhWFqU19pVi/qnbRl0CsWwjSdrOkaHLWr3I+F6bGO0WvG58jl2BJRxHu79dnu7co00f2BSHWxFVc7lFAqrOwQqO+J0Ej4KVP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IAaXnSLZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840wVUV004166
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 09:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GOkHmK1X6utHVg6lksjhhYY3cmPafHwC8mul7BxpLiA=; b=IAaXnSLZl73fvOj7
	4OnTx8g28FrJ634V1uzwdIr13148t2fLHCp7NsmGVMQWP27gnLUrc9ECpkDbtIUG
	Q320qjCI9d2lxgnAv6hCV66I4fQPirejPeIUBBGY77EsvS0TOAjJ+t5OhMIHRfx6
	f+mnTiZUNz2nym42n7J0wxgobt7No8fdv6rNPW06brhHXpwxeE/I+2CRHzMq5ZzT
	Pj5EjPCJaE2TZVwCQGm6GPVp8oBnTkbOmgXMR5N47poN1rTkS3m+xapmEr/+MG3h
	A/X+ftgvnRYjWQZTEeewL1/m8niYhOgCQnQyrlQJ/Z/IopkRbN2mcedycnRoVgxS
	lcRh1g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8xsyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 09:03:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b48f648249so2392501cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 02:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756976592; x=1757581392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GOkHmK1X6utHVg6lksjhhYY3cmPafHwC8mul7BxpLiA=;
        b=aAMJUO/OQ9UXcZ+R3I+w32yso+3vu5BrUO6P1d00mmyszcCwdN333w5xQZocqKYrRS
         /nlWF8SUA/qXBsJJmlZySqhZaOXN5xbOKE/yDeO9t5SZ+dSZ1sjQq25u0QZw4NZ/R8X+
         vEgi4Wr7Rtz8fRkoKLQnp99HuNgr9nTZWwl41bpcV4i+WzOAF0Av4Mff2tzgbL1U4Zma
         wQd58B1sDBh64LvdpsfEyy5sUxwKFH45kHA5uDLcnfa0J8mGbbduW0ao8wwfsc2rfiV0
         BL3GTluJd+9U7gd+fOIQKaeWY1WVfrHqpHqDYh/3AcynJHoTiI0YLXo0nBxQXPofUMvG
         v1+w==
X-Forwarded-Encrypted: i=1; AJvYcCUCiiLSjwAdG0oygSezFohB6UVyfOJtKkVDtnkYWlxb/u6YLnGp5gRRjsCx5pOBMCf4fxvK1DKQCl5CqxsF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2XoqJUuxdwAoZH0gOvmqd7WB2lrRs+l0jkdHiXqd0Fb8CVytL
	9xudNtF2qFfGoI4SrcO4ofjpiOsA2LiGAZ5ePkASSdPzzvI0ya9dLdgjisVUv1vCkfHf5Is04eX
	PHOf+/68iaAu28fHdjfz6UAVIF1wYonoKN5NBHyE2915Xooxq88bjqSKzi7UTp/iiyf0t
X-Gm-Gg: ASbGncuBRzJMcdfBwYD1GM/PRPHdf8qR42FwavCCNaiYCQbDCZ69Bz6r+IKqunn4fOg
	Srfd039kb1VYHgCb3GodZwsNUNOJ1r+LR6FJ7D5X1JTtyTHSZjqFGjtVjyXBQ46lO3xiQLNp/wE
	ppnkMwyTqDfHVeKpyQSopo4c08Hdf/H9HhKGN04k41y7lYTmAKvyJJeeO7F7XT/A005Z5VBqag9
	vE/y/s3Fdw82VMPSOB4LYWM2zk8q+01RPnDVz2dNvk2oVYQ9k0ws4qPt4EKLANwN0Cc7UfB9nXZ
	q+A2b0cmh1iN/kF7zovbNffHQpKwEoi9/rl9yRIAW53qJ77OyaALRFPmP2xLrMGz1iOMqujJu7G
	GdIO48neMA/U2FAgPRR28HQ==
X-Received: by 2002:a05:622a:15c7:b0:4b5:d5d7:ffc7 with SMTP id d75a77b69052e-4b5d5d80f37mr20681351cf.13.1756976592337;
        Thu, 04 Sep 2025 02:03:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPxfQPnRd4aV7IvxsGAOnP8Ip3eXmSuLZ1CLc+OJVlpcJMCuVjxhIyH9GSvmMLrOySYJM5dw==
X-Received: by 2002:a05:622a:15c7:b0:4b5:d5d7:ffc7 with SMTP id d75a77b69052e-4b5d5d80f37mr20681131cf.13.1756976591919;
        Thu, 04 Sep 2025 02:03:11 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b042c7b3671sm951424866b.42.2025.09.04.02.03.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 02:03:11 -0700 (PDT)
Message-ID: <fc6a0a18-ea29-4588-83d6-2f162b343177@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 11:03:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: apq8016-sbc: Correct HDMI bridge
 #sound-dai-cells
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250904084421.82985-3-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904084421.82985-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TPyibkEpaY7Uc_iw1PthY52amiU6iGGx
X-Proofpoint-GUID: TPyibkEpaY7Uc_iw1PthY52amiU6iGGx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfXxg/QRZY1q00f
 FVlNeAELUcjYy0Uyws4OsOfP4HWpdoSTjCx9ZaJxybJvzeN5/IJQj+bJNQN5HmMmdSGgGWIxraw
 2Bf+5aNDr9TIKUBqWWQMlTDF2bWSzcbQ5T5riNoWLH53lqqqcQpVQoVvOczQr9DHRGs0AlEsQ82
 XIoEIj1lFMkBhT5wsPkln2dWgYEe2vKRJ52I4+bQ/w6miPRh8AHOkKYfpgLLvuSVk9HKDVoFTFc
 U2oXsrXjWw6vzPwCCp15LwGVpceZFUEw78U5lAvCh899f+4YbNmfO/Xm8YJQa94wZOZcv3G8aSl
 FLCi7PRD+OkWm72Rq2jM1yTzPj1aJttAwxtT+CEuUCGwce+XLQEmfuC5ZTMsDRFaqKNp1nzgBS7
 TzUTo5/k
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b955d1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=y9CducrL600We7hCCaYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

On 9/4/25 10:44 AM, Krzysztof Kozlowski wrote:
> HDMI bridge has only one sound DAI and bindings already expect that
> (dtbs_check):
> 
>   apq8016-sbc.dtb: bridge@39 (adi,adv7533): #sound-dai-cells: 0 was expected
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

