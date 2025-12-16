Return-Path: <linux-arm-msm+bounces-85363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B79CC31F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 14:16:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92E1A304B71D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 13:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53938221F17;
	Tue, 16 Dec 2025 13:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OthlPQCh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OEi42swY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3D4146A66
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765890000; cv=none; b=FNxitsonTp8GO0vvOWhKpaX5nvwAtemNLPC4FZKoZiPAq8Vo0QIJj88I6fwII+TUdjhJXTwTBa0maNXfDDLHG+xJP1CHtrXKJUkuP1PelA3HSWFnlaB+hwJD61laK8nNPv4ROVmNz+blLUQi+qdkAUXu1fIWWIXfgGoD/OJUTx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765890000; c=relaxed/simple;
	bh=qOrRa3rfvpiWBt/UrG7LT0Q9AK62MI8WJAXbGBHoyPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBPYnunzvLedjJUdjpNk2hZk8s1ZWoSxEZdii1lf72nNio40veS0i+FiLaXs0to6/k9XA0/rlQ5WXa/ATs8dPUX5yQboSI2YG2rO/Xz3fpZ/bJFvfVzdIp31GU6EBO2iAlo6XKUF/Vhb/cC3n4IOXMQXkCsubtTfyvLzUNw+MxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OthlPQCh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OEi42swY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG9bcaP2516186
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VLyCRdpC7Kkqe3x0p1dKJLucoLYUqdZvJDXBbuOg7ZY=; b=OthlPQChgZf8ibpq
	1Wd16tFKZMJxcxTXCfQsJdNE+3NL4MdE8n0kovAH0VC6ZJ8CMii+FnF73fY4CCFs
	HKlF8I0At2V3ji3ioTLE3mE4mXdx1wosl2XNxjzLuSxYqycwx1V3PAxbAyEedFui
	mIeX6ipfeRwMkmq+bbWaLiJRb/KZjgDOPuP5aj+bLpsvprajvVG8QUm588tNYAW7
	gKqn0aATJmemd1e3LAlgbUiY0bqKhBTtp3hHGVqmL7t8Q2mefnWBSHQEcGLYfBdk
	MSbNZISvAVG6MEVubW3FwSbcem3Q3HUaj+ukfZScxzfGiUa89h/tdwGnLoeWTUgJ
	7qn3Ag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b34y80qw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:59:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edaa289e0dso18302111cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 04:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765889997; x=1766494797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VLyCRdpC7Kkqe3x0p1dKJLucoLYUqdZvJDXBbuOg7ZY=;
        b=OEi42swYhJI5SlNB3UfyZ+/jionZiP8Fem++VfN4APIKgbpX83RHQoZFauaCY3JD+N
         cNVWRCYjKqqcHgv5ddZ/AS/C5L/OUGs/w9ch/6oZHx5vgeIj0HHHfx5/Yl3izj4+NOkB
         HakblX7YMjSar1EKOsw6cCWyO82K4OgdNFfM2wxkhzAsj8zvYFHp/6AGbIlv7tzEDABP
         OhsWsqcAkKb167TvGOPiSK5z12KwEUVqGp4woCxjojJt9vg5nd70Ee0l5fg6jwleY49r
         8UWx3Ll+Vx3qeU/yYVV630HIL4LrRGNaLg8A6R99iyEnfTYzIcvngZQbzM26x+BQQYm1
         cWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765889997; x=1766494797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VLyCRdpC7Kkqe3x0p1dKJLucoLYUqdZvJDXBbuOg7ZY=;
        b=w/GSBtYhkrLBJ41+8F+LqHjtlNFSVy3hEJcD0pO0NY663jrMo1I2d0QqCG7kKFppeM
         k4Vujh37Eck9ZNtkriLfgfje6tMMJ0EoLPkoI+mHiCPS36pWd0AHim174kNQJIn63pS7
         Cuaw5MduN3i0EmDj49+MRjmFRBy3GuzhHT3ZPgZJX/rNVW1+xH/Fp1JKp36nuDufQ8iY
         0HSGv6ILJK7s5YQKHmB8P5TIa+00y8TyKeIbS+FHGKV9GNbAo4eQHgUnkUYohHvZgw7N
         xmpQQlYpsOljsoZ+tCqO6FUHFJvDtWd5nCUwXmY0xN1V49i6kVPK2PWHY2beN6pc3HCQ
         /ETA==
X-Gm-Message-State: AOJu0YzK0QXFgp13aGkYCtq7Mqx0A/x+AivDWtY1tGRoqsseq0eHYX8D
	5eT27wmn3H1gmA+r5AeOQqPONYsaEmE0iGqpWnssQ4jn9Rz9hU0S5Onm/rVmwjsa2hR2pyM4XBV
	OwNt0kG/wAr1waPkpjsfPgsOY6Mui1pYpgXQ+8V5hFQYUkk0n5tvFexcwAdeRc9eI3LsO
X-Gm-Gg: AY/fxX5fp+NolcZMotU2og/cNdqheFN9zRMDpxriEszKhIl8VuGPosyPuP5aWJZ1WId
	lJKTMDV65XXSflRLltJvRx16icjbGJ1bmdgtK5Krmlo9jqJExySbSG+W1NMQP+araZQmmpdsANT
	CNJV0R/UXx7HiJqq9AbIOukavWgOwX8LMNJcNcDG25bA/HcLLwnDRozNdpcoUUh+Q//IxvroYUj
	mqu2rAYq46disY7SoO4B0cMK+WkRWExm2qayaXl/jUAg5va+0YmKX/QNgufSci2Ia4qWjCLmlZO
	t4WJj6ZmIzOp/bLF92Sm9Z5XfsSZLkVHYVb/gL1GMbWiWG9oSmZG75zo5YLXGGy5HGnX7R5ylqk
	0/a6h7YP07YoR6Xo224yURvpHTDGePS35mEwvuypds7wu08hNj/9syW7kJjREGCCpiA==
X-Received: by 2002:ac8:5ac1:0:b0:4f1:96c5:eb29 with SMTP id d75a77b69052e-4f1d05e599fmr126349191cf.6.1765889996958;
        Tue, 16 Dec 2025 04:59:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeL6H68gsTZbbYmAGGK9Fy81KcuxgkRz3vVrgG7v7FQGCH9AcVVTs2x0lt0igajFVr4MImew==
X-Received: by 2002:ac8:5ac1:0:b0:4f1:96c5:eb29 with SMTP id d75a77b69052e-4f1d05e599fmr126348941cf.6.1765889996561;
        Tue, 16 Dec 2025 04:59:56 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5cf210sm1690070366b.60.2025.12.16.04.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 04:59:56 -0800 (PST)
Message-ID: <97d9d942-236c-4f8a-902e-0ad2ab684a76@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:59:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: expressatt: Add
 coreriver,tc360-touchkey
To: Rudraksha Gupta <guptarud@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, beomho.seo@samsung.com,
        jcsing.lee@samsung.com
References: <20251205-expressatt-touchkey-v1-1-1444b927c9f3@gmail.com>
 <532531d2-8f26-4ffa-9355-7821a4d64200@oss.qualcomm.com>
 <1e74b956-a45a-4d3e-b7fa-e4d5dc0390db@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1e74b956-a45a-4d3e-b7fa-e4d5dc0390db@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LrCfC3dc c=1 sm=1 tr=0 ts=694157cd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OQN141zOAAAA:20 a=hD80L64hAAAA:8
 a=p4wIlNlvIX5_iJHwrH4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: VLd-9V-WRFKU987Yf3a8LOmrznXWFAi0
X-Proofpoint-GUID: VLd-9V-WRFKU987Yf3a8LOmrznXWFAi0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwOSBTYWx0ZWRfXwDo4OuagQogo
 pYGVBTfdAkDWksw8nJSeddVYFiUUIU/7xuuOB9+le+iQsFPrMMuFa9sq8FNFoKOK3gERpRKc6ln
 2OaGnVsMUSrvnFlRlkxHla9UX9ChWAACgWFSUg3lIMf1B8Nfk332N4G7I1c4qIkB6dGuewhFNau
 UKY72KmQGSHXyNWihDo0eggcsuLK2u+a4jm4mNffbMUX8B5thVJXEtQD1jtKuZXbrIEL8vendhj
 snTEqdcgTGykwIZtR6igKhYUnWP7o0x7a37VWPl4hZ8+nQL9WoBpBEhMgkZ8Lxv3LlnYftqQKd0
 oeAo7o4sfgWp61kblaKbOZOUOOJUHX4k0KmaOQZ1vX1+UzyIsXEW8Lfj3BIIfbWlBKSI0acutta
 TfRZecxkmatBGf0+Rm6AwyI0JwVn9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160109

On 12/9/25 8:10 AM, Rudraksha Gupta wrote:
>>> Add the tc360 touchkey. It's unknown if this is the actual model of the
>>> touchkey, as downstream doesn't mention a variant, but this works.
>>>
>>> Link:
>>> https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/input/keyboard/cypress_touchkey_236/Makefile#L5
>> This driver mentions a register called CYPRESS_MODULE_VER - maybe
>> it could help confirm the model?
>>
>> Konrad

[...]

> When run on mainline, this is what was outputted:
> 
> samsung-expressatt:~$ cat /sys/bus/i2c/devices/0-0020/module_version
> 0x06
> samsung-expressatt:~$ cat /sys/bus/i2c/devices/0-0020/fw_version
> 0x09
> 
> 
> fw_version matches downstream ClockworkMod Recovery dmesg:
> 
> ~ # dmesg | grep "FW Ver"
> <3>[    2.201312] cypress_touchkey 16-0020: Touchkey FW Version: 0x09
> <3>[    2.206317] cypress_touchkey 16-0020: Touchkey FW Version: 0x09, system_rev: 8
> 
> 
> Unfortunately, I'm not to sure what the other variant versions are, so I will CC the driver's maintainers:
> 
> MODULE_AUTHOR("Beomho Seo <beomho.seo@samsung.com>");
> MODULE_AUTHOR("Jaechul Lee <jcsing.lee@samsung.com>");

Sounds like the best idea, I have no clue either

Konrad

