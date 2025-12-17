Return-Path: <linux-arm-msm+bounces-85505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EAACC7A82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18001304EDB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD4A3431E4;
	Wed, 17 Dec 2025 12:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Il1Xgg9l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B0l2zZfk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ADB342527
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765974843; cv=none; b=EWLx+YJHoQWWl6XLLC5gqq7m45z5qHnDhg0Mr/YCcZ7SZSbSJElTQPce9zw/zj96+y6X//OAGmnC+hrHAFkjxNJAyMeZWpITEyDPQL53R0b/3z8IQyIe4k2wWV417s5Ql4jjdFQAHhyKwnHWM6OkGmW0T7x3zckw2ObHk928DVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765974843; c=relaxed/simple;
	bh=eLDjS8KtFj1s3TVN22PHa9RzmMp+pxbj/rgY96bTAqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WyAthqIp/bE76lL0IsfxIJkAoq+Fi4tUxTKuBM0bGnluYTR+ijlLOPkoQK8FWkts2dMxHlGDmtUy8+45zF09g/c+pdxEULAavXAVc3GbDBYD0GdHDAbfnd2+UxE/WgxkZmokp4GOLYOqiwGMrnpsX0kZeGKnOIfNJ9QPu419ShA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Il1Xgg9l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0l2zZfk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKmpV3000449
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gt6CfewOeqHxuGPgc22OPlwiBeZF/gHQKLIVrkleS74=; b=Il1Xgg9lHPupWBZY
	oAOoGIid9RzdKsmZvmzmCH2FV4K8FjqfGkEdQMDiDaRHMseo1fhoPUpDNcBcaUV1
	kwWA2Nm5ZclB1YPGqj/6HO/ZHfkLyXVAzSkTVOJgySmO/YSKFFShRw2XXi19yXzl
	fYa7xC9ROQozjAQg5/kPSivg+9EEfTNu8C1Lv5KVVRHGzCQ7w/X3gWn8jFqYzBZM
	JdoqyLGenxVj6LDtVIDg6KGm8b+4dMzpxLT8c340oCQMlyHkgWCnImPAbuzLCB94
	35kRM8mhEhBiG8sqJ0DkVdg2f7G6dhLcAZiEM4X7QQv4ls2uZIrlp4EhDCKLGyWd
	+VAPAw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3n331jd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:34:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f34b9ab702so2978441cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 04:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765974840; x=1766579640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gt6CfewOeqHxuGPgc22OPlwiBeZF/gHQKLIVrkleS74=;
        b=B0l2zZfkIQzzGvHMgy4K5hci/4kBOuExwe27CGTSElqPMi5J231h3ZGAbLfZkEz9P4
         pg9cQFfVg0jcvDesMj22ZOqOUyl/mS9WAKtot5vilZwUlIxuG/J//bjHJ33afqiZE6q/
         gbmfailZhAE2YN3puJrRFwbFzfi7igYwP8jpQ/4wsFmBXeKbJ0a38edsxDJZdVoIGsba
         QVgkGud+9TDYPrNkcOxNRrA2telDYw5CwSCu/SFjouP1rVbYzP0jQhcyGtMS25MIllf4
         mqX0ExvCvzceENiyaCzTlTv5x3TWBlQ+NQdAvO1KrHCYSnMDIWTkFv11S6Y8rd+pa6Wb
         KASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765974840; x=1766579640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gt6CfewOeqHxuGPgc22OPlwiBeZF/gHQKLIVrkleS74=;
        b=OGzs0agF8XLd8L4huMaCcFVVLGfXfdDQYFGqL+LU7btP2XUIrngnMW4dPO7ifYCdXt
         ZT6Qf1C6zLM2fex3GVd5WlTrJ9nPx/HxUA9BKLOLXtCc1I0KOIJ/y843F85cphObBx6a
         XjQn0X4nytVXp5Kl5ErnFC1TNcVPN0cj+MYQdrhbGoRUVw3vS8OtEHlgoXVGNZQimgnj
         qQnlo11Vdi2L3XLfuinOC3pUQE19kcaXpDRkBXwWBxSFaMWOr4miYrMfFDY7bRZpZrfL
         YA3xcqqlyPWCr9PQ7zAwdI09YO8UXxI3iNdVRI7toLHtfYnNk+sPdHuLmcblWew0zRyN
         D7cA==
X-Forwarded-Encrypted: i=1; AJvYcCWV0+uFICCfKm2j0QoVntF1j1BNjGdVj/05H96ewNcAOCtDXsTAGYYgKx5r7nAVEeU+1xsTUpiB/xfQNY0U@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5xrmPGce4orjffNdcSOYXDKbtLVUU6neDlzZiEAuPuhtP/mYx
	QWc3MiyTfJIkH8p8zIhJVc3XylnuJ8ekyicyo7RwjPRWgOnzHZXlP+4Bl1VxrEfNPAtFGG+su61
	twFim8MRR4TRhS6egSKXnZQNHli3iQoJ98xeJPHLH3IsvCskGzj3FUMzsSA0lB8bWu29a
X-Gm-Gg: AY/fxX5RJ68yv+bep9v7kM7OIFI0HkTudkk7ra0HqTH2icoTiBUPICotMqKclHFMiis
	P0RdauVXtMsfKVWeR7wydeYXsnix3PWQTbz9UljG+4ABpXnH58GnDhsEEUm1mEBMexBkFYaldZs
	Cgs3c8Vk3KFYHtJSZm066y//BstrtHNvEa/1jCwLyMvQrus8SGTG0M4Q8XvKt3NV+d0JsQiXCtE
	QAnAXCjFjMC7fhsSfZtbzEjsWWzL9an7lfpelJ4q46yOXRZKuup3siWVEPayI24EwYMWY9kJpcC
	yQ3ZUT8QTwKZWSZpzsCLivqDCc5j4uWUMw/gqGJ24wQdKHtvkvfxhu5vYPqIsly0gy3xzpozcFe
	VI1zIQQARsgW4nQfeHrp6b4Hzagh0WNLm07prp4NCXTqYp1zJM1fnonMsKCpveUS11Q==
X-Received: by 2002:ac8:53d6:0:b0:4f1:d266:a4e0 with SMTP id d75a77b69052e-4f1d266a5b4mr135587331cf.0.1765974840030;
        Wed, 17 Dec 2025 04:34:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEURH6ZAyYC/GPJfsHoiUONjkmYtxmwlxziZaJGCuSCwbJINPBlZstoWSti2QgrSuYD9L96Cw==
X-Received: by 2002:ac8:53d6:0:b0:4f1:d266:a4e0 with SMTP id d75a77b69052e-4f1d266a5b4mr135587101cf.0.1765974839623;
        Wed, 17 Dec 2025 04:33:59 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f519571sm2324133a12.15.2025.12.17.04.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 04:33:59 -0800 (PST)
Message-ID: <4b7e2f6c-b744-49d2-b6cf-0d0ed1c16032@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 13:33:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: hamoa: Add sound DAI prefixes
 for DP
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251217120051.98198-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251217120051.98198-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5NyBTYWx0ZWRfX1Wk01o2R6tV7
 wiDFSj7RNpRY8zBTgA7V4IazvHNLFizQF3jAA8gUjGGmWHXmR6uXiipYBZfoVBn6aE8gaSL5FAH
 XyJyWRGkexmEWQE6GZ69HYHamUK23x58/vC3JTWtQUQk/Xs9gikYx4CKVUCZuT01Hnk0r79COeX
 k0dg58B6g+EmqwYfXSV0AvX3SXB1hhEho+A5m+xRBiucABhV4CPpr6tO/dGW5ACYr7JZ//nrXRz
 8RrNAX0OvE4LYnW9fEypVpc77VDfL2LVnJgLiFmWxKPM9U5h08s9RgzY28fGYqpEsh1OT7FOQVr
 QWCeaBDb2607kdRri8Z4lN3DEwPaivqKr3Th+ZOA41T7PmBSPDoKnfn0/xDW+GnZhRevfwAlnSN
 OI4dbWvKMS+XgZJf1w5L4bPtLkBK3g==
X-Proofpoint-GUID: n84B-awaVY9ykbVmMib_z2T3fhKL7H0X
X-Proofpoint-ORIG-GUID: n84B-awaVY9ykbVmMib_z2T3fhKL7H0X
X-Authority-Analysis: v=2.4 cv=U82fzOru c=1 sm=1 tr=0 ts=6942a338 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UpTyAFhicMDBmGaZp7IA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170097

On 12/17/25 1:00 PM, Krzysztof Kozlowski wrote:
> Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
> controller, need to add dedicated prefix for these mixers to avoid
> conflicts and to allow ALSA to properly configure given instance.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

