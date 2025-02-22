Return-Path: <linux-arm-msm+bounces-49009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F1DA40487
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 02:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5193B17B1BD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 01:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF2A15A868;
	Sat, 22 Feb 2025 01:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKr4YQz7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2B7132103
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Feb 2025 01:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740186486; cv=none; b=sIaX8c4Biw3lDrjsLAbOQw6yYZ7Zlyi1eGeaDiOnzdI3UNPEIJWwElgQVK3c9EVMlV0axjLXzLhu7df+b1nZqF01RIial26oilS/vhIs/JBbf3dor/G7OWZ7jx/spukOGzcl266qXpHnumBYxQgzlncS+d+E6/nNwsTEPtmu2L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740186486; c=relaxed/simple;
	bh=kcM168HKI5Jed1r4nVUAyCHhMXa/UH7cpDzt4jG6/0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NlP101HqfHcJbp3tPqrs4/m3Cn/RfrK0cdxYTmrVcWJhvD4lkPUkawYy7UvgwkxYGrRr95NUvBBLGIOiGJuGQf3l3ImIqH0ol0V3a5Sdwm0PN1Ri1fOe4MYUmDxyiG8dU6k4jDGjypMXtxdBMVcqfMWIxKNWH6pvOvqQJakPzAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKr4YQz7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LDvsWk018792
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Feb 2025 01:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I+TCfbgcqE/1oBoYAt4RCN0sS63NXiTuGZp5HOUUOoE=; b=BKr4YQz7LliFUlku
	LcCW9f9R09vIJd9kmTsrUvkKi6cFLFnKKVHHC4hhjS6FCuFDnTEOoYz/774Hmc5g
	DNVBNE76qodVK50k1AE76/U83UcjLRFBlbu1aDpfew1RUDIKYTUdqF3EuYlh4J32
	JYhOWL8pZAFoVep6ZLmMV8LjbCilaCTcX1V7eFeNaz1fL/8lWR4CcKIZnjjAWPZZ
	rbi4Kun5YSUd1R/fbl+LyWDu1NmjffoUcy4qIkgH8C1vi15n1tcIp0UjhiFzWULM
	UIB6M7vPD5wbxkoH6IMXns+aoKlUqMx4MtMracpoVCg7B5Ba93WRG6+iR7aK8mpm
	++Ijzw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44xm3rjw7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Feb 2025 01:08:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0a70510d2so48499885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 17:08:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740186482; x=1740791282;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+TCfbgcqE/1oBoYAt4RCN0sS63NXiTuGZp5HOUUOoE=;
        b=HUHoK30xnRQz61uIOYY5MmREZqkw2SYlNpKKcfTU1igEB2PeZ6mXjt8ymZK7Fp5RF1
         xOIGwqQCkjm0JhH5i1qu/GXQOwKp1KBWEjmZWo5zEVdfv/cauxJPEedslkJefjX68sb9
         ocYaR5p4JiS58ELFkojCysV9JSQ9t3k2Ye8/zKBTQMBSMTVOo+pRYt5eN2NL1Uk4gtVW
         nY/tuEy6YaSZ5QUTPymHHyPdrcWTnlMZe9Xcx752K2cwuFWasHza+EMZxotkIYGpaSk+
         79uLI9SFiJeip1oItrA0vgGzBUbGKTynGHrZvhTvf58hUy0r1V7WNmAkvu+dSgtDcn/o
         k6yw==
X-Gm-Message-State: AOJu0Yzx9jF68bVLBjm7wrIbBTZIiMAHUiFX/EiZ2C67mOTLYWR47nAi
	kT2yAXQXZw811di5iDRz0Ihpxk6VF2C/63B7gO7CF8Xg008X4ql7nt3j18yprLi3Z8ElGisiGvd
	yCYdbiKVQyT++q/jIsvocRM7KBZSzcuEriOrCVLEWD4UEqJ/KkjsIPDQ6wdOwEKD/
X-Gm-Gg: ASbGncvUhOb0NwnPQq5fjASOjnJVSB7VHxh+5YHMtV6ksyX9dY/TOaQooEDGTzVOAg0
	+2K04aIiXDzEIIFvLKKSBzGGBEOwxoISOl7lk84oCRJ61YFhGEW+tqXoIER83YhbOQLXJGoRAGq
	rWJ2ClFF9kyQpCYIIhKrq75tOyBkmwKaWmh8c4O+LPJD85p72LlzJwziEO4EzyesBTZtD7tViGb
	RujtBxyNf3WuNwtyA4koNVajky2KEMdcmOkmp92+u+r/Puv4rrN22Dj+ZMK59ZM6kAdf3ZblT3g
	Vln0b4GhjIKhlKNkH4+0Xj4uAvE4ZpNCCwsOq5C73bzhpBaiObuEqS2bLkKowQazDRRb9g==
X-Received: by 2002:a05:620a:2620:b0:7c0:c2ec:e560 with SMTP id af79cd13be357-7c0cef6c8bemr300407185a.15.1740186482353;
        Fri, 21 Feb 2025 17:08:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGSlx+o7PycgVPhhbvjZgQJlB+2/vJecp+ZwAE1CaGp8FDGTYUWBZmppwJ75uZfZwTQOsWXA==
X-Received: by 2002:a05:620a:2620:b0:7c0:c2ec:e560 with SMTP id af79cd13be357-7c0cef6c8bemr300406085a.15.1740186481963;
        Fri, 21 Feb 2025 17:08:01 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e8dsm14342801a12.14.2025.02.21.17.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 17:08:00 -0800 (PST)
Message-ID: <60b4da8d-ac1b-4122-9dbb-2450b0f5b6de@oss.qualcomm.com>
Date: Sat, 22 Feb 2025 02:07:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-db845c: enable sensors DSP
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250222-rb3-rb5-slpi-v1-0-6739be1684b6@linaro.org>
 <20250222-rb3-rb5-slpi-v1-1-6739be1684b6@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250222-rb3-rb5-slpi-v1-1-6739be1684b6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3bAAW5yrck0K3tUM12y-6hsQwTVR44lG
X-Proofpoint-GUID: 3bAAW5yrck0K3tUM12y-6hsQwTVR44lG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=802 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502220006

On 22.02.2025 1:43 AM, Dmitry Baryshkov wrote:
> Enable SLPI, sensors DSP, on the Qualcomm Robotics RB3 platform. The
> firmware for the DSP is a part of linux-firmware repository.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

