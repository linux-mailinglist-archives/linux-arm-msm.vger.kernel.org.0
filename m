Return-Path: <linux-arm-msm+bounces-89013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAA3D1F384
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 14:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B28843110AA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 13:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369C425A62E;
	Wed, 14 Jan 2026 13:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XdwEtMvf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmiR8MNR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB89721D3CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 13:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768398483; cv=none; b=oMzZTKpljN1jErp3jPLxRXDFw7Djma/vkYWoj8M4Rw2kSQnobrFOiIOrwAkGfyq4xXpszAg7NN9KMfE6H66jIRHHE/nbHUv5iccsPmURBnDf3UVVnCkDtROqn2TB1BSpLeCQaVC1275i8bTCz1vJZa/ETVIShqWHTQUaNuqrRts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768398483; c=relaxed/simple;
	bh=OJnaGhQ3AXA6LbUhBRNtnwnP2GRPC5cLcKLMx3QXlKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MWXVu3LCs9WmuF1MV4EGaeTfkbY443plvcYyJaKpXrP8vewtuONcWY1GFJNTlJsM//ugHVCXuMM3G2/39Cz+DXw2ZNxZjHhUUkYXlWNCnakW1yYlndiN8zqmrldUSW0KmBiPpWd9D4JbAueNXz3lFHaiF9hShihBUQ5mAIJPkDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XdwEtMvf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmiR8MNR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7jOtG148005
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 13:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GnnsopietkT4fOXsECLe39qdZbiBMkIaHBNHn2AFNyw=; b=XdwEtMvfiY4Wr+F+
	sHnt9djyEFdSAz0XcauZ54JYliT6Kkmn9OQpQiFVOPNPUElUtZb26tLvHdmYc1KD
	VMBsaOPoXljnaRo+wl2w9ezWEr+c4cNGYMjm73R05v7gUmwD7epHVLkBvpORuZZo
	klGQPh973JpLALTPhFkID91eH1Um7K5lGS67xJnYCKsLVSWG2G4QfXlTga20w4WD
	O++UCRFQBP8C1DwgJFvCBDrdxoiahVDAIDyEDTdJ/4bZW7bk4PuT/D027IOL9xcD
	tT4cGSw3RrKSYcovdpsJQc6HRyGswhBnyZxLNtyYFCZcwMEa98sX5BAau9V2Y3t2
	t+eRUQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp6raha9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 13:48:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bedacab1e0so241489785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 05:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768398480; x=1769003280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GnnsopietkT4fOXsECLe39qdZbiBMkIaHBNHn2AFNyw=;
        b=UmiR8MNR4YProYrLW3UXlZ592z1iFrwJrL6nrpaqN3A88zjWqAmrb9/3y7eIQhhKqq
         Qof7EwhwjV5jeDfOkg5m6qyJyHX/p49hnWaFh/VzzFrIiSZHnhRLDF9kkHvUg8vtBYx+
         ztwwAZmL4SF6+sgqZoFQNLXFhEqODIuKRRBf33AQCK404iB4/U30Gb9oiURDCFwyb8ym
         oBcSI5e/xN08MOvryeCweo/yeK639O7lh97uFPYkFsBawLZpuEfYbld5Fx4/fMvbYYC7
         YjlwlApw0qRyMECWsz1wnM4JRJwh2dyxCszz+o67dyQdInVVfOx9ug954feuA58gocJM
         pLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768398480; x=1769003280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnnsopietkT4fOXsECLe39qdZbiBMkIaHBNHn2AFNyw=;
        b=J45pr5AJODX/ygJqn7yAEC+kM2hnSFSnsqQ1LqRGHxLXLeM4PE8ZFDGE3dt61uCX+I
         dMOslcd/SSla7qRwVilvLH3zBQ+RCSuUcGNBGh8S/5w4Cpai9ESiB1EBrUNn7UUzjaY7
         /sf7M6nTTNvJDgqaKedI/VmIGIm8lyvQNsHsDwcoe5niYGH20sqXBCOdFebrSx46k2jl
         EtyGCjvGUE4Sa/6+Ewzr1v45Ic7IQ1+0ZHwHygVbLSspVk0enq3/nxdHvdzxo3EnB2Z8
         MaLxjwuWccA/49qOtxqMK1nK9y+ferTzHmxllVs6rDOOvPxqVfqcTi3fkIwlAy2k3CJG
         3hag==
X-Forwarded-Encrypted: i=1; AJvYcCWnZ7RJrWsH0z6hsoJLhPokiF80bXseIh088F0cZ6z4kO5SgiVfGtgHStLj0ReiWFpS5kgaq6J45mvO5+JD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd/gHZdaap0nv+XtEExzEMZ8bra0R9xmfhSy4cVo5TpzdixOwe
	No0idrcefuakI/sWTImBUqywZuLvQ1atTnK1zp/ueRLsxApq5WVPAznd5vuyurwsyIPE6LZe53F
	CCFpTn1kAe5xnLXCx1atTORthYH/G6VNFny2Ri3NWsY5oJDWzUBRwrU0XB6ZvMpdPH1a1
X-Gm-Gg: AY/fxX69nt0Hr8tab3AG7UkGR0WxApV2Haa6hwSM6qKKSBtovPIaNpuD5ZiOcuJosQj
	nUwRHd10A6OVXA8orQjsdqcHlYMiaCSwK8J6fQ4bCnO6JwwVsMsQGqFefYBpZUCsV5dZ6RnBXlr
	CA6fA13fAdz51h4jIhz3suNzUXjbcbMrqPcoP9fFXUvkPwuUxzAzX3zOog3ks0Mqb6bz0l+Frzj
	dqsaRSst3AaCY9Nh+9MZQH1crU4D/bna04sHABQFpqcRMHN1PhO6FE9GmxtOKxUIoNdly/n2Wy2
	4y7dlqXZnNvqUZLilP1Q3yE6ezdLXMN95N9D18utdN3Cllis9wJr5LWnCfrtAYKM34pnjK1g3Rg
	XsOvYuaVHrozHmTjAhWfxsApUEDGlEID+UnieBs1gfaIOx9z+U0tBRLH4zGdkrey5Ry4=
X-Received: by 2002:a05:620a:410d:b0:8c5:2b02:83ee with SMTP id af79cd13be357-8c52fbdaadfmr295396185a.6.1768398480105;
        Wed, 14 Jan 2026 05:48:00 -0800 (PST)
X-Received: by 2002:a05:620a:410d:b0:8c5:2b02:83ee with SMTP id af79cd13be357-8c52fbdaadfmr295392385a.6.1768398479581;
        Wed, 14 Jan 2026 05:47:59 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86fc303d7esm1399217166b.2.2026.01.14.05.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 05:47:59 -0800 (PST)
Message-ID: <5cd1f4f5-808d-46cf-a44a-ee5428987727@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 14:47:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: Introduce Glymur base dtsi
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260112-upstream_v3_glymur_introduction-v4-0-8a0366210e02@oss.qualcomm.com>
 <20260112-upstream_v3_glymur_introduction-v4-3-8a0366210e02@oss.qualcomm.com>
 <h5psb3hw7wqdrqpok6facoefptdfd2qw2ojymk6k64d77a5ie5@iwy2nxmu6l6b>
 <ad105956-3192-4559-9d53-3b526f2fa361@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ad105956-3192-4559-9d53-3b526f2fa361@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDExNSBTYWx0ZWRfX8mx8Q8Ekf07I
 B8rNR6cNslfco8QOlqf0ztnyGqMkVQ0Bju15rZgGx19L7+AT+bJZHPS9qzugGhuCuRK5d3wUw5E
 9UE9aNq/330mo+SYERZz39+ZWyA+xezlImlYI9hMGq4KyLNr4yodIJNZ/oC8pJR/hdD/NGvP5vf
 hFG8GITxdHhkiZbZe3Sjz75Zdcc6ta0BXDUAi3ExZbIMDZWY2LRr8yGMYbWWYLawCZKYmUO41QF
 oRoEdxPbfxw+1CDCQyGlx289iB9l3RujDu5xp+mxo/NPlojmUjJIkD9ox9X0pWEi6bjQiAxC/EW
 diyEttQoWD65pVzI9k/k31IDbx/JgMLYTe8kMgEC2CjX7oOJF8YB63QfUAvkhvx3FIaZEfm1n7m
 RoitA0rJsWUOG3WsmsmsDlh/tjock51vevuQwxjepYY3ixHrEKT0hT2jrHWKd7rt3ekUrJzvWll
 /bAqw9Rfk/UGfeZ5yaQ==
X-Proofpoint-GUID: Mpnqc0u0ebGZNDtdBca5ie4tOSwpkpHU
X-Proofpoint-ORIG-GUID: Mpnqc0u0ebGZNDtdBca5ie4tOSwpkpHU
X-Authority-Analysis: v=2.4 cv=L/EQguT8 c=1 sm=1 tr=0 ts=69679e91 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=5tyqGv89VatObklNbhcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140115

On 1/14/26 11:29 AM, Pankaj Patil wrote:
> On 1/14/2026 9:47 AM, Bjorn Andersson wrote:
>> On Mon, Jan 12, 2026 at 05:52:36PM +0530, Pankaj Patil wrote:
>>> Introduce the base device tree support for Glymur – Qualcomm's
>>> next-generation compute SoC. The new glymur.dtsi describes the core SoC
>>> components, including:
>>>
>>> - CPUs and CPU topology
>>> - Interrupt controller and TLMM
>>> - GCC,DISPCC and RPMHCC clock controllers
>>> - Reserved memory and interconnects
>>> - APPS and PCIe SMMU and firmware SCM
>>> - Watchdog, RPMHPD, APPS RSC and SRAM
>>> - PSCI and PMU nodes
>>> - QUPv3 serial engines
>>> - CPU power domains and idle states, plus SCMI/ SRAM pieces for CPU DVFS
>>> - PDP0 mailbox, IPCC and AOSS
>>> - Display clock controller
>>> - SPMI PMIC arbiter with SPMI0/1/2 buses
>>> - SMP2P nodes
>>> - TSENS and thermal zones (8 instances, 92 sensors)
>>>
>>> Add dtsi files for PMH0101, PMK8850, PMCX0102, SMB2370, PMH0104,
>>> PMH0110 along with temp-alarm and GPIO nodes needed on Glymur
>>>
>>> Enabled PCIe controllers and associated PHY to support boot to
>>> shell with nvme storage,
>>> List of PCIe instances enabled:
>>>
>>> - PCIe3b
>>> - PCIe4
>>> - PCIe5
>>> - PCIe6
>>>
>>
>> Why didn't you run "make qcom/glymur-crd.dtb CHECK_DTBS=1" before
>> sending patches to the mailing list?!
>>
>> It would taken you 30 seconds to conclude that I can't do anything with
>> these patches.
>>
>> Regards,
>> Bjorn
> 
> I've ran the bindings check, dt-bindings specified as dependencies will fix the errors
> Additionally, I'll drop qup-memory from interconnects for serial and spi in next rev,
> which cause the bindings errors, this was missed

The SPI flavor of QUPs is definitely DMA-capable and I don't see how it
could error out with the current bindings definition

Konrad

