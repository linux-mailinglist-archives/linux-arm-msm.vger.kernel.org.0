Return-Path: <linux-arm-msm+bounces-89314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CBFD2CA80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 07:41:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7F123046438
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 06:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF78634DCDF;
	Fri, 16 Jan 2026 06:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2hY1Kkt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hc6SX9ZA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719D334E74B
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768545649; cv=none; b=eDv+n2oUemOdR2fdMbrZC9CaMsazLfvymmOvM/HEYjTPSZUB7Vk2KT/7pjxJiHZAkIEp6EGdZPx1eU9XUhTv7zcvnowsm0pdrOGPUxSo30ZHbSUwMVytcz01zIKkOs+rSmVtg1Tx1HVXDHqU8lGrGJ0zI0syv8HXOTu9GYZfHuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768545649; c=relaxed/simple;
	bh=3ntRQcVoJLYk0vfFuJajIYPeImGjJA4tZIU//yb3ZpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=geUVnzDN650eNI0fDoxHVpxN5Mzej+pb6eKjdzHxTABqAclRjn6HGFhI28BOsoHpikvKUFtVA91luuqC63Khjy7U2+rhUhKaRwlF2u8CmmINYrr3fpZF97lrBZAw/P7BcKh83tW0OyjR9fmRGTxWKisO3v5BCP/evhACHgeWF9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2hY1Kkt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hc6SX9ZA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMd27M2615385
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vYwGS057RmmXaJ0YKy4gmpd3L3CdyKWc2kqxAvz/sm8=; b=Q2hY1KktJ4NdQOTN
	rB7lRmY6CGq+VP8KFWO8y3nFY88x2+NvtIVxveT3doqikIeDKE9ZDgVdKPH6ZLu7
	/DxtEhd0EZL51NZ/o7N0nsujWyqNTIy1uRyLfw2JH4uwX14LY811RiV+A4DJRI7/
	gV4lKSOwvMzumNXnS//5XNnQjrF/dT69/QOtBczitfg5XLe6dIfGVzqckaCWxlrY
	80u/HICiFEo/l1Rl7i31EHDpy5xPW4lwd9+c1TBUshoI/US1MaDl4owXZOcIvmRT
	Upxi5SWQSQACbkg2aVigfRb9DiKvFCl9kB5f5CE62kEaLYeQ0uwBe8gutSQzUm03
	1z51eQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq977s4mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:40:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81ee4f90ef8so1558218b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 22:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768545646; x=1769150446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vYwGS057RmmXaJ0YKy4gmpd3L3CdyKWc2kqxAvz/sm8=;
        b=hc6SX9ZAJ3vICfSNIBAjB5xpP1g2fYqnjlCIyhE8DnR4TFzQ1Uo1q0SqmFbFuPMChg
         38Dl5KAOU9Tjq6UfuEJq0bO62okHPQkJLVCiEADApIcUzvta+7oUOvesB0RuqQmYQ4Hp
         VHTgSBUY1usz5eMjRTEk+v2BhEWyPiPl00ND3a127ChuKB76pIdAFKcL6wONARKXVTFA
         IyHm57uEyAEKfgpYC1gm6xv5Y77HcPjs1Yn+cpvCul4ptB7viMe83G6rQv/NX64ZMz8E
         wKRs/at1pAdpofr+SFF7YsD38SO3LQcigkQ6Qz/ArU55ZMDkDAV99MJWVYqjIfBKO0Tg
         nsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768545646; x=1769150446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vYwGS057RmmXaJ0YKy4gmpd3L3CdyKWc2kqxAvz/sm8=;
        b=mlCBCZQQD9Qu+HdqyuhM5edLMEDHApnqkGFrItVy+f4CG5InAO19nVCv6Ip97ALxRS
         RIIemGWHHIGCBFGvbsicXALQDuYSfhjhMNziE1R1SfxkiWMARkZKaWp9GYQHU3pQROiK
         gprggNPPmloGAuk+JkGD2hI6Z6spslyT22UPrPviBlxaz2x7eGYEHpPY6TpAJA6+DZCr
         XoBS9CNbGAaHnkJl20+ZC9yvo/rxCW4dHdRqZ/LHq1+2jhYMmltIyf2LH8hbdQzJVA1r
         rXw6PmvSUmGSNFUXokH/pwB8cmeCFX2faI5nr97S8XOIXx8zlINHNNkNAjDaHwy7HjFm
         DFzg==
X-Forwarded-Encrypted: i=1; AJvYcCWq28bvOVdHJzGxevnA3BS5TIO3/3XV/zFpLk/2LZYq/fauXUH2H4snWSkrhh4lRkaQU54jfc++JeZhhw3D@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqs0QxUbrf7PxZRNfI+W/WfEMOK2UIRLgDmMOjh43wO4ymf7V8
	IZ/26sHf097mImpOSH4ZlbtruhuHbNBcNTp6q0ACV92IJvLrL9bQezonypI0TcUphGx9ukMPRZC
	bDs4yTfbagcFI9svIeyqkUwNEPBKLFFBLjAq2dXXlOZU+sCe8ie7rNJCSTQowrDtjjLGT
X-Gm-Gg: AY/fxX6aI/Aghj21WvYi5fa80awB3KpWR+8nexj3RGfGlKpIVHtiSeEB0+emG0YCKoq
	/ZCPdl2kTijFGc4LaB0S1dIFt+Ju93PsT91PcVwrdPgH/pt+MdXJO2uN5K4lJZQ53EijHMbSmn0
	NezD05jcqMqtxNfASkQFqn/w5ScSREuxACAiH/sAJtoxV6WeLe1v9bg83UtXGRH6HHrgZXUB7N6
	5+mWzv1FRzcSiz90KbdBKNsoUA4hsbV4BRxl4iechuyoPwR8EWilMI1v6IXNBSCW+mxDUD3XTSH
	Frp3onj8wfPYcPIJbIWzBWI4Rq7AbakrQ8dhah7MUi4v+sshTAWIRymt2Zlqmcz9a1D3+wGvJ05
	39CPW8+n8sts5DAQHsVgUurguppvSVPTt/P48FHFAVAzrIuKa1cedicFV+xoeiDzyBWmIqnjYRI
	QKLp6RkQbiSqDtG+rsWMRE3CcqNBnm
X-Received: by 2002:a05:6a00:92a0:b0:81f:993e:ecf6 with SMTP id d2e1a72fcca58-81fa01ec723mr1831723b3a.33.1768545646393;
        Thu, 15 Jan 2026 22:40:46 -0800 (PST)
X-Received: by 2002:a05:6a00:92a0:b0:81f:993e:ecf6 with SMTP id d2e1a72fcca58-81fa01ec723mr1831699b3a.33.1768545645890;
        Thu, 15 Jan 2026 22:40:45 -0800 (PST)
Received: from [10.190.200.191] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa1277a15sm1121763b3a.42.2026.01.15.22.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 22:40:45 -0800 (PST)
Message-ID: <c3cd9769-4709-4be8-aa69-888455baed0b@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 12:10:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: Introduce Glymur base dtsi
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <5cd1f4f5-808d-46cf-a44a-ee5428987727@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <5cd1f4f5-808d-46cf-a44a-ee5428987727@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lxL1tV4qlmtyegs3P38ZZoTG2XA8Q6PW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1MiBTYWx0ZWRfX2LlLYxyosali
 e+FToQLnRBgHSfRb8Xl7O3sAYaigrm+Brj78IslRN5un9NeHcx6bdP4tvxryTULyAzkbDi1CnOc
 KGLOLHMrv26MtC4v30UBjRB9v1/xAzlSYnaEXGhCDkdHXtniZqu00J8RzLsnDAX0nADImyKcNUl
 RxMfW+p0nQbAZfhgcDwOmOpLd3bYS69BfP4iUwtXGnvuVl0Qq1+SX6KgPtZdmbk++2/UDj7RRoI
 aEbXwzjKXPjApj0YwTeGTZnroqO81/XtpBQSBG3Tdyh7dC8rOqWdyAEMTxdzTj0WYxoUBMlwIq8
 4224jktQ2xWYFhFKy8U5onHzrgioAXEF9FP4c6jhRvlcV8TC1NjXm0JgjAow5BqdjNhp1Ox3Co4
 USc6KLn4wNTLQ0o/TLK9M9aFgxLmZEs+3gB9JdtCEeac8+uQy+hH21uS2b2Idbp0VXEhKDN1aI0
 YGyA066u3SBd0WgMyZA==
X-Proofpoint-GUID: lxL1tV4qlmtyegs3P38ZZoTG2XA8Q6PW
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6969dd6f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=5tyqGv89VatObklNbhcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160052

On 1/14/2026 7:17 PM, Konrad Dybcio wrote:
> On 1/14/26 11:29 AM, Pankaj Patil wrote:
>> On 1/14/2026 9:47 AM, Bjorn Andersson wrote:
>>> On Mon, Jan 12, 2026 at 05:52:36PM +0530, Pankaj Patil wrote:
>>>> Introduce the base device tree support for Glymur – Qualcomm's
>>>> next-generation compute SoC. The new glymur.dtsi describes the core SoC
>>>> components, including:
>>>>
>>>> - CPUs and CPU topology
>>>> - Interrupt controller and TLMM
>>>> - GCC,DISPCC and RPMHCC clock controllers
>>>> - Reserved memory and interconnects
>>>> - APPS and PCIe SMMU and firmware SCM
>>>> - Watchdog, RPMHPD, APPS RSC and SRAM
>>>> - PSCI and PMU nodes
>>>> - QUPv3 serial engines
>>>> - CPU power domains and idle states, plus SCMI/ SRAM pieces for CPU DVFS
>>>> - PDP0 mailbox, IPCC and AOSS
>>>> - Display clock controller
>>>> - SPMI PMIC arbiter with SPMI0/1/2 buses
>>>> - SMP2P nodes
>>>> - TSENS and thermal zones (8 instances, 92 sensors)
>>>>
>>>> Add dtsi files for PMH0101, PMK8850, PMCX0102, SMB2370, PMH0104,
>>>> PMH0110 along with temp-alarm and GPIO nodes needed on Glymur
>>>>
>>>> Enabled PCIe controllers and associated PHY to support boot to
>>>> shell with nvme storage,
>>>> List of PCIe instances enabled:
>>>>
>>>> - PCIe3b
>>>> - PCIe4
>>>> - PCIe5
>>>> - PCIe6
>>>>
>>>
>>> Why didn't you run "make qcom/glymur-crd.dtb CHECK_DTBS=1" before
>>> sending patches to the mailing list?!
>>>
>>> It would taken you 30 seconds to conclude that I can't do anything with
>>> these patches.
>>>
>>> Regards,
>>> Bjorn
>>
>> I've ran the bindings check, dt-bindings specified as dependencies will fix the errors
>> Additionally, I'll drop qup-memory from interconnects for serial and spi in next rev,
>> which cause the bindings errors, this was missed
> 
> The SPI flavor of QUPs is definitely DMA-capable and I don't see how it
> could error out with the current bindings definition
> 
> Konrad

Yes, only serial nodes will error out, will drop for serial/uart nodes


