Return-Path: <linux-arm-msm+bounces-48994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3D3A40211
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 22:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D521425AD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 21:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32FBC253F1B;
	Fri, 21 Feb 2025 21:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQ8O886S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74340202F79
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 21:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740173641; cv=none; b=iT1XDwAqI+fU3m2b3jNBM9xDBbUDk37PvEKwhLn54tbDH0wpB8ImzBiPpIhRXXIAXTNWGD39OsZEPZHQ8qz9r3IvpMCwBfoiPMNHS/gCkhcMqmy0sdAm2S1DEJoC8sJFF36Tvu7HMSO42W5z7jWjDXe0smgi+8EZyPSvcCBhq4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740173641; c=relaxed/simple;
	bh=8tmdo/Ter+kdGrzmZv4+c1CC3FGOX+GbLELDtAoZByo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJMy1KYUS9FgZ9QcegeETDp70BFwc2o1eV6oQlpeHJjq7N9AWsMtWVsS8rbGzn9htz3OLi+DVmYsbnO45WaW/VMeQ5UODg1ZVKFsc55BWqGsOmAo+PhBBq2z4kMTyzH3sJsev6sT/+o2p590hl2oQn+i41fav+0DASFOoGdGicM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQ8O886S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LCxJOn008355
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 21:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ghn6L4mUBwXpawWqt2VB2BLTybot+6+x5e3CZnMiiBY=; b=TQ8O886SD//Mk5a8
	T3Xz0YYim+FzYQpLp1+NISKMF0Eu4sh4jDyBL0kCmmA6GR4jgy07JLlHDE3Ev7gC
	IghEuF+QLWar5EmBYPtCMI9AInB5t14smZKyO4Cl3whg6T3X9MX9EnG901Os6n+Z
	prjV/aWiVASujUuqDddQfNr4w1iqVD1/lLOHkJ7uNW+PQwhFey8rWVbM8m2JXmIo
	/rMzKH4Y0i1JiILKyEA6u+1qGgrdxtzaB0FRC5BcLe1L7bxf1wx2l0E+XfuU6H/X
	tcAMGhARTBBLciIqVi6tQChxXMHpKrDuBIqDzoo0n71h6ecx4mZep05R8PCjA60q
	/WzY+A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3karc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 21:33:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e67ac0f122so4438576d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 13:33:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740173636; x=1740778436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ghn6L4mUBwXpawWqt2VB2BLTybot+6+x5e3CZnMiiBY=;
        b=OsnfDNoXQjPVvGBzluSWUk2w0qTlLaXQNpJvKrOiufghOIGVCrqPso25AFQf5XMJ9i
         Va8RG/PzSmPg7v6xEYInEJsXveZVyr+g6LLI+HUYREcvCSkn9S8JKMwc9hIuE80Td4oV
         kmoSIPEB+wfVkgEXQXW6QWQirLsPLI5KWW75m2O3NIwJ3jWogqpJB4giS/oJLU1fuoOU
         NatcVTnHiXrDM70LEOnRqXDUv6by50m153phSkFvP+Xl6vFwkTx+FxvTIb8zaA7LmhWl
         BW8TO/nJjYrCBjEc4MVEE1xzuVD/oNDnSp54XR8aoROqbytXYzpvphks0dNlJ+Tl15cY
         h1MQ==
X-Forwarded-Encrypted: i=1; AJvYcCV86XKnQL6ZVVRUGi+22R01fYcpvkUsaRGGzdCVMsxmINZdlyG3sHNLGdssK50S65UR60YUzQQuaAJvL+u8@vger.kernel.org
X-Gm-Message-State: AOJu0YwLChLLE/44XpLB8yZMVqr42sMhFpodb0VkK6vN01QMtkERl+Cu
	4nlNYKw4vfhZgORXqcya2BYF/DgUBkx7R77Lx/HZ6aPIpzypShxJiKEjBUd6EThd7MB4oC9L1s/
	XyksVD/s01c0X673kOZgGZmjkyhvXBwHdjDJxka3Emn6ptvURpHQoxulS6gT13t8j
X-Gm-Gg: ASbGncuaHPB9C7OWpRqSN2gwyGtnjiYgeP9nwUoj9z+WHaOXJGXREKUhMCVeb3Vnbdf
	w6yU9+mk025NjYh7YqALSNhrGk0w7+K9hA/HU/q5k93sCsYchhUJYj2t8ITd1Iw4s2CnBGhRMTW
	xXBhpWu491Qps4lCzXlK80ALB2Jd/G33kHG0mcphHhaQTQgVD1hn+Ub/peKonHe5p4+nG9ZINpL
	jXCevfCXa7VnvouUWnHd3uyAq1f8eiIGU7y3X9VZpyXeVqyB+GWDdyePW0xr60vcDUvybkvGInt
	uxdzQzyWiOtBjNAbBSmGRhvB8fnocfJKYawXwVyxVskKkykBWrDLN3bN4fK8T9dMLwi0GA==
X-Received: by 2002:ac8:5710:0:b0:471:ef27:a30b with SMTP id d75a77b69052e-472229a8a3dmr25460841cf.13.1740173636384;
        Fri, 21 Feb 2025 13:33:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3eGXB/j6IzUtZrEuHEsUKdriBuCF9PZH69iEvZpR1z/0tsNN3yb6D7Tmo01aYFqwMf4Hx6Q==
X-Received: by 2002:ac8:5710:0:b0:471:ef27:a30b with SMTP id d75a77b69052e-472229a8a3dmr25460631cf.13.1740173635901;
        Fri, 21 Feb 2025 13:33:55 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb96fa4d79sm1069931966b.126.2025.02.21.13.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 13:33:55 -0800 (PST)
Message-ID: <752a6234-cf74-48f5-8836-343011b6eeaa@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 22:33:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] arm64: dts: qcom: Add initial support for MSM8937
To: barnabas.czeman@mainlining.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, Dang Huynh <danct12@riseup.net>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
 <20250211-msm8937-v1-8-7d27ed67f708@mainlining.org>
 <7664b71c-ed47-4765-9ac4-5dbe3ec80d3c@oss.qualcomm.com>
 <d4792e6323e2dd5392a0d9633df62174@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d4792e6323e2dd5392a0d9633df62174@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8mSS5qnHJTnkcqohG70xgd-rZpgaasE_
X-Proofpoint-GUID: 8mSS5qnHJTnkcqohG70xgd-rZpgaasE_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_08,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 mlxlogscore=852 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502210147

On 12.02.2025 5:20 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-02-12 14:07, Konrad Dybcio wrote:
>> On 11.02.2025 11:37 PM, Barnabás Czémán wrote:
>>> From: Dang Huynh <danct12@riseup.net>
>>>
>>> Add initial support for MSM8937 SoC.
>>>
>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>
>> So the computer tells me 8917 and 8937 are *very* similar. Have you
>> tried assessing how making 8937.dtsi an overlay atop 8917.dtsi would
>> work out?
> 
> They are similar but there are many small differences:
> - have two dsi
> - using adreno 505
> - different iommu it uses arm,smmu for gpu and qcom,iommu for applications
> - 8 cores
> - camss will be a different a bit
> - venus will be different a bit
> - have more i2c and spi
> - different mdp version
> 
> Maybe i can find more differences, originally it was based on msm8917.dtsi
> but we have decided to keep it separate, also it have different license from 8917.
> The plan is MSM8940 and SDM439 support will based on msm8937.dtsi in the future.

Alright, makes sense to keep them separate then

Konrad

