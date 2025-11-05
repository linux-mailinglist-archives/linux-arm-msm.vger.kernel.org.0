Return-Path: <linux-arm-msm+bounces-80441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20061C354B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 12:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F3F018C1C20
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 11:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D5730DEB1;
	Wed,  5 Nov 2025 11:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhZcKs5x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALI6BUMZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC352C15B0
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 11:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762340998; cv=none; b=TU7iYl6hYrqqxkmON6SPlb6oRL61N1fBuFL6oO2tJUhxjxLX/jGGR5pfq16tmRgZ0SnNKSHGJOPbm8367FOKpFm4/bruqsdq24dmaX5RsiS4SQru72VxT84c9LeqLz20uC8REzqdtzoEtKhDKyBXd+5+PYVegf9bEoCLAHBF1Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762340998; c=relaxed/simple;
	bh=ZwvDVSI1zx4JT1ANDds+QA8nPLF0exfSM4yWnHi1FVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r0iPnN6aNrDGLzNvEm4iRO5veM8Gplql3XrZb0+kjE4RyrHqUHPoPV1U2US/HogSZb0s0X0qYpnacLZC/G7Ytrbz8Zd0Riees8zDL0Jgeo/tlPQ5JkpfMbd/wq6vD8ImAdbQFWZ/s1QXeLRxJKf+d9VHEgeKSPk8YNizJnIHm6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LhZcKs5x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ALI6BUMZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5B31jP655018
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 11:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0tH5XZ93hy8sXj0+utUXHuQm3iN9TCJLOBOzCtJoRBA=; b=LhZcKs5xOnCd3ppZ
	wkiRndIMyHGmXYpc+3rRfi1SNRjqF6mrp58mkmDRt3lupKol9wkfqSKZaQbN1kYy
	BoZvE1RzCkmTiyB4KEUhLsm+NjLxvGMYpfna6gdI+kT34khahdTU1lK9q8iGo0Uf
	VRUNZzZoyS1j10kpvRqHtc+Nx0LhrDcgQrblWdi/aN48vpQ9bcUmgU3rgtV3vCMw
	m1/fiGipb5y64iLOA7VsyiNWs/SkqmRfDg01IeaAI7w5znq2KilA+Y6UNskx5YL3
	WQbZXMYUIenYg2TvHv67x2p1DimSSooCj20fhB0IU2YOlEEu/FIj7ubpHnGl29Oz
	RpuABw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a85c8g0ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 11:09:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1be0fdfe1so52937285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 03:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762340995; x=1762945795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0tH5XZ93hy8sXj0+utUXHuQm3iN9TCJLOBOzCtJoRBA=;
        b=ALI6BUMZoXiyr6fVNQJNKzcCgUodxEEXqFn3ctf7Iv+UaDtHu92BRrVj9rsR+kVvLi
         We8asoK7iWh35+U2TXQ2mL07Ys8JCeIgPTzWB/lTLs36lM6f5I2yn+gPSIyd+rsoOwId
         amtu1JA6+xrgR81pr099yyjvrchBVUCBx4A93S1kNt0DEVB++eHNxGxBIi4aicG/slq7
         F0X7Jc76DaRMxEVjHQiGVtKcsPv/asvqtEbtTuUckV6uvMpG16Lqvqih4Y5QPTBGNXlF
         2/cR7l4YDwJ0wbW77WhbwnbVcOTPRJXxj7LPaKm4MwaFoRjp1V26MykZi8E+InDr0Q/a
         8A8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762340995; x=1762945795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0tH5XZ93hy8sXj0+utUXHuQm3iN9TCJLOBOzCtJoRBA=;
        b=FYhGCZW2UBqxRLDe6PsU1W/vUWlEZSnXnC23p4Oyp0Q/SuzwO8hTo29ESeD+bx983E
         pwXFNE7exrS2kLMgnrwzUZKh7uuW78T3rJJ0PIMutDPdZYQ3I8l6QXQLE+XrRxjykHA4
         7GISqipmQmw7JO/jtYbzSC3lKMbVpoEeXvev0ujYBnxFbatRVoxOULZ0+UMD1sX44P83
         Sr/6nKZDRiksid4GkWONTrZlWaqmOJFTSGyNCMQbF2fUs6HV4Q47MM1BLs1ldcmxnqeq
         fibn2YbrPUSIYNU4lHVnObt+Dpu68NIEtIwx2Xv6yVe2FxdNV5GE6sZSjDnbBYXGwmMU
         BL0w==
X-Forwarded-Encrypted: i=1; AJvYcCU8y6hBI+xG7L8kr5A0xKR9aRSzI/aUBql88NNkGgtcWLjACv9ZqlyHZ8HQhLaiuZNMCT0IqMWfp5oyXKX6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy14KJYTePcOKXGdmC3dpD2buTtVTXSv61hPH4wc7gDNVCkgoei
	COIhjXQOyq+OnfCUJ/bsE+hBhfw983/JY8Di6AivHDyD/AVlq5o1CW/7XLViwW3O6f3cPfie9tZ
	/mPsjoeZAN5ciqoSmhDZhactRsXP65baIC8NVsBaKhX5LfNl6WmKZjIVREPB+eULLJqUe
X-Gm-Gg: ASbGncsaYlABiowUJNVCx9x4P1dNA9Q/H0sph9M0G7m2HWnnzFm1ElDbwsZxoQ2OaT1
	5tlwnCzgmJKwngRy4Ky1byDnc+zRX/KVtHyMuXX2tzqJDs1GTfkFjTeZBiJt4SQRH7wO4l9q/Iv
	aM9EkuQ1uzZ1uDa9H1nW8VtdgpZxVS3q4GkOgg4AINhfUtqexhEmRt5ix0QeW5imvwSzGepiR4Y
	mjSMt7izBiiPJPHA+Pu2U1GDN68DpeHjo/PHW0o/PlDp5T+sw059p2+qb6ogbBvmg6Bf4ZlUbKY
	yI0unSAdLDiRjIuJaeT95DKb2LcUaLCq8c7lb8KBFeduxAOlU14dogxA9mTjeq2Tf7csKJu/Ida
	eQTWF/JOaJDJWVEkJ/tWA/kHqYwZjnr2u8STVN1h9907PB4SXU35hNsV6
X-Received: by 2002:a05:622a:18a6:b0:4ed:1869:6c05 with SMTP id d75a77b69052e-4ed72338594mr24630631cf.5.1762340994803;
        Wed, 05 Nov 2025 03:09:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrCfI0cYdylTfSH44+2MJ+p0GI1ii+6uTsfxuQd2W1YncRj4eophcDOjK1NGj5VeTLzOTJ/Q==
X-Received: by 2002:a05:622a:18a6:b0:4ed:1869:6c05 with SMTP id d75a77b69052e-4ed72338594mr24630411cf.5.1762340994360;
        Wed, 05 Nov 2025 03:09:54 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723db0f1besm458938766b.31.2025.11.05.03.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 03:09:53 -0800 (PST)
Message-ID: <c2b91dd0-1b0c-43bc-ad3e-5e4b136c75c9@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 12:09:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Tessolve Upstream <tessolveupstream@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251104125126.1006400-1-tessolveupstream@gmail.com>
 <20251104125126.1006400-3-tessolveupstream@gmail.com>
 <27f51013-9276-4e41-b57d-fb0baaec5bc6@oss.qualcomm.com>
 <4e3b01fa-174b-4de3-a5ef-67f51f0b2033@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4e3b01fa-174b-4de3-a5ef-67f51f0b2033@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8b9-0FiANlUvaVX8taZcYJ6WLipB_VlO
X-Proofpoint-GUID: 8b9-0FiANlUvaVX8taZcYJ6WLipB_VlO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA4MyBTYWx0ZWRfX7+US41GJHoVH
 kxvIpkxJjnlT7ZEcN2Auy79MMZylrSWUeRCQxEr1YuqoqdFaA3FH6WTJdYLnQgDZ6YddCODbSs1
 C1QYP4vE8dIEaXfJ9mBMQ0x4uz9urRsEaMsMwifHkACqPqdoEeH7WtQSMSui6vhm0/LA0ylStU1
 lssvaxz1fYO6NB3PQN+Rbz66nOUPHXwY7Y+W83MH6DEnai9oRCkn+CEnqwheielBXmlgHrh17jj
 xIHJ7xc4T0xIqMyocg8VAqQPswkaa6mu6DGUiQtyvFqP/4HC3E1lc4geWNkd78Owj6jDiSFKJyo
 MvLS0k7w9WXd0F19dlBILjg1bxpOB8gYTJdtb9OdJ2gNTTKEhUdwtkGK+sGna8LQgQjEhuHH3am
 6gBifCwgVbrB5bytbCBMdsjzdoDX6g==
X-Authority-Analysis: v=2.4 cv=apS/yCZV c=1 sm=1 tr=0 ts=690b3083 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qJVbOpFieQqE12gzr-oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050083

On 11/5/25 11:01 AM, Tessolve Upstream wrote:
> 
> 
> On 04/11/25 19:57, Konrad Dybcio wrote:
>> On 11/4/25 1:51 PM, Sudarshan Shetty wrote:
>>> Introduce the device tree support for the QCS615-based talos-evk
>>> platform, which follows the SMARC (Smart Mobility ARChitecture)
>>> standard. The platform is composed of two main hardware
>>> components: the talos-evk-som and the talos-evk carrier board.
>>
>> How is the carrier board a separate entity from the "talos-evk.dts"?
> 
> The talos-evk platform follows a modular SoM + carrier design.
> In our current implementation:
> talos-evk-som.dtsi — describes SoM-specific components.
> talos-evk-cb.dtsi — represents the carrier board and includes the
> SoM file, adding carrier-specific interfaces (micro SD, power button etc.).
> talos-evk.dts — includes both the SoM and CB DTSIs and enables HDMI 
> display configuration.
> talos-evk-lvds.dts — also includes both the SoM and CB DTSIs but enables 
> LVDS instead of HDMI.
> 
> HDMI and LVDS share the same DSI output and cannot be used simultaneously.
> Therefore, we provide separate top-level DTS files (talos-evk.dts for HDMI
> and talos-evk-lvds.dts for LVDS), while keeping common board
> logic in talos-evk-cb.dtsi.
> 
> Hence, layer looks as below:
> 
> talos-evk-som.dtsi
> ├── talos-evk-cb.dtsi (includes som)
> │    ├── talos-evk.dts (HDMI)
> │    └── talos-evk-lvds.dts (LVDS)
> 
> This ensures modularity, and properly models mutually exclusive display
> configurations.

And are both the LVDS display and HDMI converter on separate add-in boards?

Konrad

