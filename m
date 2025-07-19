Return-Path: <linux-arm-msm+bounces-65741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A3CB0B11C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 19:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8E11179FC8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 17:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E4E9476;
	Sat, 19 Jul 2025 17:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oL1WctaN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CAB284B4F
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 17:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752946681; cv=none; b=c05NQPbQ7uypzD24Zs/aT7sNA/f6ulDXqGE7dpj5X0V2OOQxBpgH2IRxnd+jO9S/wKsRi7Az1KyHq0FexM1VJOOmdQ1aFrYGvMVuumS3Ssshb61iWk4QCOlbt5/6e6VlwZTwaGddpZiJwEexqN6lGe4jO33cDNEZrcr1LdnDCmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752946681; c=relaxed/simple;
	bh=l9pWszHcvlWae0ybRVxovXrxHNxxC2htd+6q7MexnJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qpW8nVW3eLNoY8PQpo0IUtFIrz3G2Tlf0HHnNaCYEYEMjqGr+2G39Gv40EQVRnN0sICiRCANLDmWmwm1M4m/ruZqtjekJasteqoeBRRyXi41sSxKYPCWA6TCiyowcHgQ5fQ+/sFIo/obsKabjqW9FrdD3oxIFHTTtX7jlrJBU5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oL1WctaN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56JEeav7020556
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 17:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FZljlJT2qbBwi7FRDYe/gjY8HI2+8fcJAaiOiTqbESQ=; b=oL1WctaNTr2hoM1R
	AQtzwh9PTmZV6rRngkX7LxxhiA3DOUH87RckIoI4QMw/oPasgyI7m70T2RVOvSPa
	g3xFlS4+l8RN4ADGonFuWdYl9Wybvhun//i18RHqHxoXJUObrtse/7BjggXRbbmf
	LFFieVicZm5vOzmnXW7DoxphK+cWSiNSSj9EdX9rvnu0yrk84wXCyhhERHKILDi6
	D0ee9GJuqCZLZ4Piscbm4yFs4tlQwFij5TVMY+kQEqCa0BARtWVqyCqb+MdU0wYG
	LKbB/DTaXMEl/2lFRfJO31y8nW2IdPHbyf1/4nPQrjNBCqMtBYU/L1F1jdK35Yd8
	IwXtdA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048rs0q9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 17:37:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2369dd58602so23859785ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 10:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752946677; x=1753551477;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZljlJT2qbBwi7FRDYe/gjY8HI2+8fcJAaiOiTqbESQ=;
        b=DohyBwoHaxuJna6Sd2PUfZATJ16VmVWtDksBYmegKHXH0ME6GV0aP5eojMxYUGGwOI
         8MIGhyGFNxrg8IkB/jJkTgILcW/FzEdiGY0aFFRF5BxT3Y4QdCMrboyO2x2Pa5d+qa+L
         BZWZPCBiNaA3vaPdxEifhJAKkTDdVjW6VHodH+Ff3kNnDm09xs3x2LYLAWEYPo+mXOU8
         rGfmaguK/gBa0ClV+QGniuPKXaYLYdUJmJn9eZgjP/neEAiQ8qPEhqh7VLauM1vP4KqM
         G6f1X7nFH4FUUaA2Dr2gwBq9ec/PXaH2Fyx9Nh/RqsuU+8IWnu0Ao9DWousrykEMrthB
         O09A==
X-Forwarded-Encrypted: i=1; AJvYcCVNwsaSPEgY3qJ4ZZ6efS3R20p5VGZFl/xO6CCttVmoVLGuW0yGgKOlOAv9E1Z+2Io4LA6gFuU1WnsZ0NwD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+0cjNhmQ1zHftwGRYzQcJNXR+8TEGbaDxjapMpY/kQxe61wGm
	C4PKj0RsDb96S/jr/qsDgLLquWnHd+noUr5mlMX4rA/AntCXRAW9j5hXEAeONunsk7xZLjy+jQ/
	5cCKqSwfUfV0eCUnxJL6cmOgLHS0CLaclH8/l2Vq7teOZ8NaSgYd0qUB807xJ199QDT4a
X-Gm-Gg: ASbGncu8JouQdHpNeHgTnxZ8tvupRenZ58kVZAgcRltop39+lCAWqpNeuUzjAx9F/uA
	k9WkcMsY0SO9xuUldjJpM1emBuZPu6SQtOsCDXkYR3Axl2mvE1SbAwhUkcYm8NujR3J0CL4K3xU
	cE0ojghz7PXxUl/5aCx3BZluokXcT7oMJYlwNbx0mPt4MyYymVk9Aegi4duEHLC9AgTaL77ZQM2
	sPFurvkYyn+QNphh7HOBUFVJfU4ZE41D6hN+ADXH5PsJznnSEfOkqhjiiIRr5kXzsVgWiMpmPAW
	7/R6c3q2HvffPXDbQLU1GRNTBwZit0nOPhb/nez3SlhYv8GZnoHSrjMM0E3yp029pV04gnWN0jE
	L
X-Received: by 2002:a17:903:1a45:b0:234:c2e7:a102 with SMTP id d9443c01a7336-23e2576c1bfmr203194125ad.43.1752946677272;
        Sat, 19 Jul 2025 10:37:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmsqS+oyiroy7F7asjC+RhuXy5jbyXwVyJMviTpt16hI2w+2DRxkm7tSvxqRyFMSouRG3FRQ==
X-Received: by 2002:a17:903:1a45:b0:234:c2e7:a102 with SMTP id d9443c01a7336-23e2576c1bfmr203193755ad.43.1752946676803;
        Sat, 19 Jul 2025 10:37:56 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.231.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e2d7asm31792585ad.1.2025.07.19.10.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Jul 2025 10:37:56 -0700 (PDT)
Message-ID: <1653597d-4d6b-a771-fbd8-c129c630ac0a@oss.qualcomm.com>
Date: Sat, 19 Jul 2025 23:07:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v11 2/8] power: reset: reboot-mode: Add support for 64 bit
 magic
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
 <20250717-arm-psci-system_reset2-vendor-reboots-v11-2-df3e2b2183c3@oss.qualcomm.com>
 <6vlm3ybjpy2jq3cr2pzj4vcmqwoissdml2xmhfzlulfbrpzakt@xrepu6c5zykb>
 <713b2cc8-1bc7-a8b7-678b-5fc7fe25615a@oss.qualcomm.com>
 <8d4a42b6-657f-4c30-8e25-4213d8d53a89@lunn.ch>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <8d4a42b6-657f-4c30-8e25-4213d8d53a89@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDE3NCBTYWx0ZWRfXxbTAehOkgVpB
 qLR+0weLKGidfilGg6VxDVQiqIEjL3lR33KVuGrUO/scKhXu4xZ80UnQ8+r2IqC1d+P/e7jfYcK
 910n0VHlCVg3PWnEW4ZcnnaZfObsJUnaGexdrn1CC7VPNO+xGLJEFdN4x43DSPY/79jLNFLntMg
 u4diNhhww8l5WD+XAB9EbSAuHwNNxyS+KcO5dpyOJ3NI/JUtMNxUQqtpkIZAf/nXZdNZVLcrwcK
 dB5DaEwgcbv3XTgJSEDBx4EZwYnLVfsb3SGRUrIgX/IkgjhLpSpLSA03NLzw4SQyswc/DhlL1PU
 Uf9QS2ybvGKcEjy2ak++IbxeOnrFgyFRvw4SlfDWozNGQV7tUsc394a6NXf0xyOOn/AKUd1Et68
 wQ+1tiJSizl49P4zgNAn13/n8DfFnMjKcB4UybFOhxvht6FjbJpfJ5QlyowOtC8fA4pAk2sQ
X-Proofpoint-ORIG-GUID: N-1rfm9j0KdPdSa3VWDLl4l6IV41RuSG
X-Proofpoint-GUID: N-1rfm9j0KdPdSa3VWDLl4l6IV41RuSG
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687bd7f6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=PsbcbGlCJbaar3GLNM5paQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=vijFQojot4H3nP37T3UA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=724 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507190174



On 7/19/2025 10:27 PM, Andrew Lunn wrote:
>>>> +static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>>>>  {
>>>>  	struct qcom_pon *pon = container_of
>>>>  			(reboot, struct qcom_pon, reboot_mode);
>>>> @@ -37,7 +36,7 @@ static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
>>>>  	ret = regmap_update_bits(pon->regmap,
>>>>  				 pon->baseaddr + PON_SOFT_RB_SPARE,
>>>>  				 GENMASK(7, pon->reason_shift),
>>>> -				 magic << pon->reason_shift);
>>>> +				 ((u32)magic) << pon->reason_shift);
> 
> As a general rule of thumb, code with casts is poor quality code. Try
> to write the code without casts.
> 
> Maybe something like
> 
>       If (magic > MAX_U32)
>       	   return -EINVAL;
> 
>       magic_32 = magic;
sure will update it. And in above, should it be recommended to add a explicit
cast(for any avoiding any compiler complains)?
 like: magic_32 = (u32)magic;
> 
> You might be able to go further, and validate that magic actually fits
> into the field when you consider the << pon->reason_shift.
will add a check to see make sure the value is in range after "<< pon->reason_shift".

- thanks.
> 
> 	Andrew

