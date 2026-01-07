Return-Path: <linux-arm-msm+bounces-87912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFF0CFE2F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 15:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F024030B08A9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 14:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F0332A3C5;
	Wed,  7 Jan 2026 14:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iSNboE4c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BeQCoNn8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1942432AAA9
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 14:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767794629; cv=none; b=NDznDAK0o/rSHvBMxaZVbqTFBBmhxyKKHPSN9VQgybeBmTnWKsaknd2jDP0NcZgs839QcU/+Y+ZpoBRcy4x1O5jiIPsmmbr6Q0WHg5S3iEbVKTk8FlGDwBBeZ1l7hpMJK95xZMcpcOyEALXGy8epHLABJiUK+O+aq31lCeQeybM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767794629; c=relaxed/simple;
	bh=+eBgn1FXDfynTOWRPQJQcXgChNeUrZJfwmqaclXZWmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vFyAkOPJSchY1mgf/EnSE6vATOQQFFbU4NTWANO+QkLwkCTjBGMHQrE+v+8ysANp0FA9SjAWXX5Vw1CeajtZBIh4tiyfBd/1IaQ4t0ryL/Wkwkc+++Sds0Xk6O+9JUQtbnG3Zh/ph4cnfKg02Qrrc+F2Z5fotW8Lzl1brOgMQ+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iSNboE4c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BeQCoNn8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6076tXkN2379374
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 14:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZGUEfPXYzSComK/4z89HH9yCe+htm7JQCogZL+pmhcU=; b=iSNboE4cXnSfjv6Q
	T9IeoddUr7lZJW8JimTlQkX8C++dWLYVbrQ3iI8zPng6hDQm7HKgCdwBej/yd8UP
	DdT4+bAvoTp3Jj+n+IElHDSqe2QA9boZVBngHYuDdp15iYidSpx59EPsmBOpwjmD
	L4eEBIWgi4TPqLnRfUqZyphcvWM85J/1bkwbon5pN2YoSeZvpFF3ocYNh5Clos7i
	Y/+ckUU78QqaWvGIjZSSUtWe5olAFd96RWRQZ5/tqdDRPVW2OT0nz8x0oumcz1To
	4dzl9vRKocCBRkcKmeHZxmvdS236A4GGd8wjXQElzTrQ29gcf/RDtEqWNXTzXpNI
	DMkEdQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhjn4s95w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 14:03:44 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-64475bee138so528044d50.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 06:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767794622; x=1768399422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZGUEfPXYzSComK/4z89HH9yCe+htm7JQCogZL+pmhcU=;
        b=BeQCoNn85dpOdRPpdu5Kj/HNnppYqNZ8jbVakwqbyxUaxNAqs/8Z9fAjHytgcl/y4B
         XIVpVvoodBQKXxIIeUh1g4oucWKDGP8tOexD3+VdbiAPZiMpQiv98Pp5AZhgtnqhEV3C
         fBlqMT05KIzxboZ11feNiz9IPFc4baUMeA94yX/XCMSWnER4SUI0qq4J4pPtQaPE4Mlu
         4oLVldvV3jA9Y0neTV1DMogS31G/DyaIdC/jEfh1sc5d7gK0rDcCa1QkmXLo5WjP3ich
         HhlxfAqJwv6eaiVZ0rer8jxMMn9xm11Lx7hvEP/ETZAPPepGaDiXiNxJWk8EwtBcIci3
         fedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767794622; x=1768399422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGUEfPXYzSComK/4z89HH9yCe+htm7JQCogZL+pmhcU=;
        b=J056ARk4JgFTw48HrZmowhbC8BbarSb9GN7kyIUprJG+thbaBe9JU6DMC5t0b6RwYa
         mMbOv/0wlJKmoHl57WCenv8B0rBQia3C1grDTLkr5U7bqjgQlhv0cWT8Y2rJAt6Vp1qk
         cl7JI5HNCYNJt8GoMG01SFC6VXAOr7u1GaHo3uMniOmBFNB6jM2WZSrRlzfYvqW3ZmFZ
         tYIA5D/17PTXDZRB9buAtqFUVgJrtI9GE3rDoDEVHvOIPR2UOoN3Qun1JlAom6Hr1tvs
         aRQfP5r+M2lrnEBImOAqtPlkeOum/tMq+HK1TbaWJ0cxc+lNmPz+VWoHoWpJIlxxtMCW
         TMZA==
X-Forwarded-Encrypted: i=1; AJvYcCXZrGlqDRdxWXSt5t87+7c6pRKiukfcj4CA+B/tm45n7ehdvOhtfwgShQpi4s7MNtsy+FDIbJyZzDfJugUT@vger.kernel.org
X-Gm-Message-State: AOJu0YxtQIYahlZfVzA0etAknGPbhTb407mJp6PYNVaMGOpeQTQTvql1
	RQbm/J9Y0pRuBSLumQO/0K19JqNAbXF9xelTIEGK7yTeUgvO7/OBoKbGcYDUuPCNbZ2JLytX5Vh
	RRbi3E666fgDxTpYf1nJ+aQ7mv0w3cICbRr1zd3Er2ccxxaxhEWmy4KT2qo74lZj3oLb1
X-Gm-Gg: AY/fxX6GrUu2D0WgqHdBFPEai6vW7tFrpDGJCdwa0WX5JnwPfUgWDOY16YB0k5Wm6Vw
	aALkR5ndS9Ntm4ucXKb/s2KIRsD2q9fUXhcXYZecOoYxY+H8jeRtcOLY6JtxZGrJZhC/tKviKGB
	U1k1VpqOZMD0YWe1s6ojSZXAUGcnyJZWpkpXpqLQKuAe5VOik1tpnu82nDRbpm5UjLKACz7+Emk
	xqADG1X6thEpEATBZkdVaCLVx+QGptAXq1t2BV4phO1tYQO51ho1G5ZCF+CXnpYaCoMzngMMyc7
	PuhAAQ2u5DB3XdkX1SnU5RHPTOPTXNE6Yts1qE7/u34vfvT+Bf1llfTl8uFN/+V8ekdJhUAHvSb
	YIveZFtjSy8HzyzOOyG1ttKwJssqXggwDLnQOxHQSMmdu+L02gxmPCo5Zez0V/wYcCQI=
X-Received: by 2002:a05:690e:1486:b0:646:5127:ad64 with SMTP id 956f58d0204a3-64716c9291fmr1920184d50.8.1767794622205;
        Wed, 07 Jan 2026 06:03:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+yD6IwhCJBS0M0IdpMAihYXZ2W52QH5LWTaJGmcGDkAkN6V6xxs4QcaIu2Pf8pk26NxzbQA==
X-Received: by 2002:a05:690e:1486:b0:646:5127:ad64 with SMTP id 956f58d0204a3-64716c9291fmr1920088d50.8.1767794620266;
        Wed, 07 Jan 2026 06:03:40 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d4c89sm4571078a12.10.2026.01.07.06.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 06:03:39 -0800 (PST)
Message-ID: <bfa54cfd-b5cd-47c6-b941-3bb5673d19f6@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 15:03:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8950
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
        Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
        Eugene Lepshy <fekz115@gmail.com>,
        Gianluca Boiano <morf3089@gmail.com>,
        Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
 <20260107-pmi8950-wled-v1-1-5e52f5caa39c@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-pmi8950-wled-v1-1-5e52f5caa39c@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LJhrgZW9 c=1 sm=1 tr=0 ts=695e67c0 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=WZtaUWDQifwC2z0g4SgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEwOCBTYWx0ZWRfX9laUhaE2xQuA
 CHuPN0oYlSAuwFEoh6ZEEPoc5GIH/4U/8uvvNl3A1OUuDDp3PuKtwPxlg9BJPKfXqyANplVK1m2
 88VbUz+7XhXkFvWfrRvS6TKTCz63MvzdBzKWOfnONJWd71+vaOjlwByP3/KmU61oIKDnGnNs/6t
 El7y1oBWdoW6iZLecgbI9st3SBdZaeB+5GcpM6UwlsBi31jywqaSzrFf4gNAL3cv4Qh2nS8metZ
 HWcLzKWePGzNk3SL3iu6NpUA7iLJ4rkXEZN61PSLsOjhwxOb8v92k9BRFQiz6qE+bUEabDC+Gua
 8hN5xhru2YyuujqI/pbyjNXzyYzJXvJ8UvaytO89VEKZzein0FcFvVI2o1Rip0oRr8bPOvh077c
 t4XVdM67AUngImkJ7gZs7wi6PcW8nZefOCKZl3Ti0/M/SVN4FtN8fmQ4lrtwAsezGhJcPQ8LUDX
 PY6auSYbL6pkou86jCg==
X-Proofpoint-GUID: QGWhbZrs3Z21E8YeI96m3PxiFgksunda
X-Proofpoint-ORIG-GUID: QGWhbZrs3Z21E8YeI96m3PxiFgksunda
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070108

On 1/7/26 2:31 PM, Barnabás Czémán wrote:
> Document ovp values supported by wled found in PMI8950.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.yaml           | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> index a8490781011d..306fb6642617 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> @@ -98,8 +98,6 @@ properties:
>      description: |
>        Over-voltage protection limit. This property is for WLED4 only.
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [ 18100, 19600, 29600, 31100 ]
> -    default: 29600
>  
>    qcom,num-strings:
>      description: |
> @@ -239,6 +237,24 @@ allOf:
>            minimum: 0
>            maximum: 4095
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,pmi8950-wled
> +
> +    then:
> +      properties:
> +        qcom,ovp-millivolt:
> +          enum: [ 17800, 19400, 29500, 31000 ]
> +          default: 29500
> +
> +    else:
> +      properties:
> +        qcom,ovp-millivolt:
> +          enum: [ 18100, 19600, 29600, 31100 ]
> +          default: 29600

Out of the supported ones:

{ .compatible = "qcom,pmi8950-wled", .data = (void *)4 },
{ .compatible = "qcom,pmi8994-wled", .data = (void *)4 },
{ .compatible = "qcom,pmi8998-wled", .data = (void *)4 },
{ .compatible = "qcom,pm660l-wled", .data = (void *)4 },

I can confirm both allowed and default values for PMI8950/98/PM660L

I could not find any data for PMI8994 (or PMI8996, the essentially
PMI8994-revbump), but it's very probable that 8950 is an oddball,
so:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

