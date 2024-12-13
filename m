Return-Path: <linux-arm-msm+bounces-42201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 825A29F1B23
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 01:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9250165BD1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 00:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536821EE01D;
	Fri, 13 Dec 2024 23:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVbq75gX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83961EE00E
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 23:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734134164; cv=none; b=a5WIgKn2QPhTm7i8VPpGP36Mh0DodXXH9EFrCp0vKoAVKgBVuM57aN4hv15thVAuyZtgeRRvQ62ZI74glss1mGWYwbHU1MkxXhKW+1IDjbuSwSbE+NUTsELHASrPdtO33AyYeokJKQIYOOPBmBgYz52HnivZivwggtbWbgiOQW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734134164; c=relaxed/simple;
	bh=eB5hO81qvELqW1QVwzwykvukceZ8/b4PMpblBqb8Ec8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IsFsFKtj30TRqMqTskxlMZSNwuksMoq/X1pe7NClat5nN0TwrRploBhEafeoFvgjXg51e6VrmbG3VslEEG6OV6K6reCBMh5J6xJBgQR/f1PBs+leTk0gQ3sfR65R5DA7srP6LOppfzTLsjFmSKEZFKnmKjlqUWydWp2vM12tsxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVbq75gX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDNX46g017372
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 23:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mBfG/0PIjoHp4oAUPd3vdYoV7y4Iyy6FP/GMZ3kUMk0=; b=oVbq75gX0Jdii2f4
	hT+6nR8fNoBzXancBaX8SEhqeAl4EMEkRs6CvwDvUVcWDxPoOT8GUV0d7HiRMr8h
	5W+i6W21IsiTyJVUluDc/xaXKFpi56XDvSLdqdFEyJIPmk1r6P9IgACME/1Gg/82
	yTgC8BCtWbTfw+ZQGU957AnCos6j0gZABaytXAs1Sl2HHRMxyFaIP24Emk+0dlqN
	Wxh9ze0lVUbfCT9Jzd2Lp+4tFvF9y6e1d+KAF6R6QKyBUV4JEI7CwfvUxbK/f3Tr
	eXr6+Teullg45G3mz+03g0c7SO0zXZIaQkEBPWx1ILveCoQHZtUZra2ur+At5Mi+
	SeuyEg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjmt1x60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 23:56:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-46792962c90so3025841cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 15:56:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734134161; x=1734738961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mBfG/0PIjoHp4oAUPd3vdYoV7y4Iyy6FP/GMZ3kUMk0=;
        b=BsRh9MWtvUd36h3CX3jMM/SODBFkiUe++DyjkbXufYF5VC7ukCOzvCrLiK8c1wMzQX
         otzFV9bfB3JV1wHgn8ZfzlhcyxhEDg8vqYHIr9b9QDYP0t42rWv5PrDPsq1czMuPXbSv
         8uH8Z1EVvRJsUJxswwSDFANaszk6OWtWySv7tLRLxT7+1kGRPRIIt9Gk1npCz17stWNb
         y00CxPCLjEPzwOusrrScbr7icnuHb9Mz+N/RkDU8pUsszIiLvWDLyROOJ4RCxTHLUShp
         8Q8abJ72HlhyJReyeZ8D0EoFTby5edwVAcWpSfuOEcpRG+FFEW4WE6WBT0qYuHzfm8QH
         54QA==
X-Gm-Message-State: AOJu0YztDeWCsXVodUZuODG+x/atlqArT9hF3yApBpn1rZGwUh8aUa/v
	fi4wUrBJXpyW5QB9ZHLLzv+qth1ap3VKnawVFFJOZ/MWFKrhk1OqtunPKEkPRLEDndeXXFewgO+
	q81p81u4mgdcrblrhkjIEHZFuZlnp6r3pPl5ZlVJzcBrZD9czXkZ7jlQ0amn91olw
X-Gm-Gg: ASbGncsAakqP5IAtanY43MJcRi9WfOJIWt35DeEHLXug8CWPE7iHenPt/HGoOsOgYUd
	z8M+HTinSuihorFYyzaMPM7YxBahidY1l6jkVCdWWiC0yb0fKwG9fravB/7PiL+jdq4mBWIpBAy
	bFbt2QiYcU4A0A0Vo6c+PDfoXaGtRE5IjekM0UJNOzisa0drWv8gNJWGg9hXmLmYSJOXVDuv2Fu
	7whtqo+gfZPEGEn+ih3FEH1Agu2kpZs2He1V9Hl7OztXcKRwyHwALn4kFHoFoCJb7IwESmiL5fY
	y3H7Y3rXchj87gvjCDawynedTzzP6cmsO18=
X-Received: by 2002:a05:620a:191c:b0:7b6:c597:fb4d with SMTP id af79cd13be357-7b6fbee75e0mr249125785a.5.1734134160891;
        Fri, 13 Dec 2024 15:56:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkQ+V4mTkhQO2bVQpzfTauk0x3WapSTTM9VWOMeUP6/EPzzWU8xSQnJaVWpSSlnYUHGIC8pQ==
X-Received: by 2002:a05:620a:191c:b0:7b6:c597:fb4d with SMTP id af79cd13be357-7b6fbee75e0mr249124285a.5.1734134160575;
        Fri, 13 Dec 2024 15:56:00 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96006c3asm26507266b.19.2024.12.13.15.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 15:55:59 -0800 (PST)
Message-ID: <a106e659-1ab0-4eeb-bac9-ec882766094a@oss.qualcomm.com>
Date: Sat, 14 Dec 2024 00:55:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/14] arm64: dts: qcom: sdm845-starqltechn: add
 display PMIC
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
 <20241209-starqltechn_integration_upstream-v8-10-ec604481d691@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-10-ec604481d691@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xEmFXPoKRvb8rUTyHdkI7GbNrQkAmqn9
X-Proofpoint-ORIG-GUID: xEmFXPoKRvb8rUTyHdkI7GbNrQkAmqn9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=780 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412130170

On 9.12.2024 1:09 PM, Dzmitry Sankouski wrote:
> Add support for s2dos05 display / touchscreen PMIC
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

