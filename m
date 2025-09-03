Return-Path: <linux-arm-msm+bounces-71808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAB2B41C76
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 12:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7F343B2508
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF8D2F90D6;
	Wed,  3 Sep 2025 10:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XL9JUpZ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7382F3616
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 10:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896888; cv=none; b=HWR7xv6UA8HLsA78iUl/0zz6rkWlAPF2QnBb5KQ5LxmcJTeuqCTpCU5Zleqi3E8bKP0rX0Iou/PdWCBCHVFnj3eZKaz847UQMp8bz/ZFzH5AMdl3EHA96LFzK6ZDZRatcLhkALKVIwmnae5WC2VV8i9dthZAWugVJSNOr4/pVPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896888; c=relaxed/simple;
	bh=Tm+ubvDpNij69TvVH7w3Pi5cDsVKJICM7WBgBpUCufU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2Mi4EN6kY+KfTEkWL3Fj25si856M48Be+Kl+6M8qsLdBk6rIkP3eDrsqZPqjxUt4ZKIumxOvpmdgpH5GHflfGppVxGPk7cZzDXN8DwV2evwlceWhAdyu2XggjXNzMt+NOBBf5HN9fpJEpe300qlGGlzxXlO38hImNWJAjb2z4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XL9JUpZ+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583AVrjP010157
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 10:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SN52Stku6irzzygye658oXiBDSvkmv+/53cdsuo8Qoc=; b=XL9JUpZ+VtDwPbNG
	R12bsrBYQgiEvFwu7M6IkEk0sHMwzQjPhmsvgvSX/rcv72V3Xad3TjVc4xMZFrrF
	ly+LStev01TlDrXqB3MUO8ipPdmAzrtcuQNmRAAbaeDH/pryFP357V7OITcmz8JU
	3vIpsQjTkFotg5EFcDTtAnwa1k5tvD5FVya2qjvL0oJXNtxA9FBg/eTxEQsTN6Eb
	yOTX7AI448QwROoEYzShuS5QdElPe1Yu7fjJWYMf37V9K8cW4eGYazkhN4NMIrrc
	yREXPskGTy6/7D9GWSAiCkdz57G50OTIGECgZ07VMftIU4bGD/kgJ+I530QXQiiO
	6W6O2w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ekg58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 10:54:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-726ac3f253dso697736d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 03:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756896885; x=1757501685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SN52Stku6irzzygye658oXiBDSvkmv+/53cdsuo8Qoc=;
        b=uemOa5iJiBJ8S5BBSnCqlzp+vRXZKmi6eS8ClkyOuO8VOSAyIsshBJLwF0U2N7Vsm8
         AH9gOKvr2eYnfj/Oj1hxDoeeNbMmD/RaWtAlQIX1c1FF/zFh2CoR2I69oSRDdZXiVEHC
         PeItuj6fzgmzwgZpr/VyEEEBXTqz3MNksHWT8cP9jEVmOjTcDg9S1++gQrIc8EgszXMc
         Z27xeGNgECULrFBBvQsTeGPAC2+cLfEwggPaPiX9eFM5SCaTEYfcw/CCsrmSvvepYUr4
         gs/cHbplU7TckjRkTKVIuzBXMcUpMTXjFihjsPsBrQbaHYERmVZJrsD4PzGT4fqqkvfa
         jAMA==
X-Gm-Message-State: AOJu0YykaCvauOsHIJbXAyE+CdexmbJE4UAwTAamueXRfdFLnDbHTK/D
	Dh6MUEvhUWLviaELwvb6M2Bqak9jqafEKFg43RjRki4UgF0llFGWXow8iizuW5OEv66UF9xJ/2e
	9VwapCggmv5PEBtMMqTQfPYvaMHOm8JHet7i4iJiXxcJrUP913mpqqE/5p2FA362sZFEF
X-Gm-Gg: ASbGncu+PRjwXIutdiQm6K5wM9HP/AwYoxFgp5DUnYRw5EJt3lpyWWdsktjFMzp7UBA
	/GeQXA6WJM24wykRvRGKO2Br09qI5W5cD71tE3d5rM32KKiuQ7iK9LJyI1Qj9jUet1zEQy9ev8f
	ii9kEcT9RCIOymLi/O62u4JFHG5TYGPuk824Nia2lkX6vaa0uylt/Df9BnuOi6KlgFaPZ1JUjj3
	PfnoC7SjtTE6KIviq2hS5WaGkCfHSR6ua3FMX/BZAeVgMCSSaLIw4AmQivkZsuwrJV44zQFzmTU
	S8ihWwC33vMVkMa0QIoXGQWeCwPalGpCOLRpq0p5kvAsgt32nqtYaYumeUR/GKQR8jLwARm7fwA
	Z2QJ8e1Bm9hSSYI0Mjt7BlQ==
X-Received: by 2002:ad4:5743:0:b0:707:4eab:2b5e with SMTP id 6a1803df08f44-70fa1d92d30mr148150736d6.4.1756896884454;
        Wed, 03 Sep 2025 03:54:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEetDZkFBnEZJ/kKVop60xaty004rw6FYmAAfEqO0MuEDwRglU3hRd6MaQX/oR3QxdMGUb85g==
X-Received: by 2002:ad4:5743:0:b0:707:4eab:2b5e with SMTP id 6a1803df08f44-70fa1d92d30mr148150266d6.4.1756896883912;
        Wed, 03 Sep 2025 03:54:43 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61ded4749aesm7462141a12.32.2025.09.03.03.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 03:54:43 -0700 (PDT)
Message-ID: <6083a6b2-c5cc-41f0-8026-e022f2f4eb38@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 12:54:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] arm64: dts: qcom: Add initial support for MSM8937
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, Dang Huynh <danct12@riseup.net>
References: <20250831-msm8937-v8-0-b7dcd63caaac@mainlining.org>
 <20250831-msm8937-v8-5-b7dcd63caaac@mainlining.org>
 <67aa2a1a-3adf-4c97-a7b8-865b5ca3b17e@oss.qualcomm.com>
 <EA8D417C-9B17-4AA0-A448-316F8904AF90@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <EA8D417C-9B17-4AA0-A448-316F8904AF90@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tCWvfTPJOwCOUdTxcr7iTLXcavjN_k04
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX+py+0kEJPgDI
 PAZrkll4qMxMwZW1M6zw01i0cUr0U6zBragALzFFBOfGuaXPvanpJ0COy9p9bNAOab5a/wBqz+3
 4yiPS98bhvDLXIco5J4iT1DaRqajMhyo2vqZRiuxnE25lEgFCsx7vC6bOpPOXT7dtxl/60mbXJV
 5SZJyZAeTzao7dNDC6mbnFdOFY9P60cY7+CRTxxBekZGpe0glhqXzPQcUL8sx9O+4xhF8Nk2zSd
 IGB0ZR1sJGJNFBZgi/uYQRN0BjmEwjFERScsNmcb2bti/RiDweYqNofiCyzihEuLuSrOge8xG0i
 hmAKTDjAls9Qb/BhQxqt8I7iV0TfmOjfqXpoAfua/wx5kVulVV+LdjkBdxy6SapS9EKz3MXds9c
 Gt6Cngfu
X-Proofpoint-ORIG-GUID: tCWvfTPJOwCOUdTxcr7iTLXcavjN_k04
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b81e76 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=bBqXziUQAAAA:8
 a=OuZLqq7tAAAA:8 a=G6GrHqeLqaT2Jh2KzrsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=BjKv_IHbNJvPKzgot4uq:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

On 9/3/25 12:47 PM, Barnabás Czémán wrote:
> 
> 
> On 3 September 2025 12:42:38 CEST, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 8/31/25 2:29 PM, Barnabás Czémán wrote:
>>> From: Dang Huynh <danct12@riseup.net>
>>>
>>> Add initial support for MSM8937 SoC.
>>>
>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>
>> [...]
>>
>>> +		qfprom: qfprom@a4000 {
>>> +			compatible = "qcom,msm8937-qfprom", "qcom,qfprom";
>>> +			reg = <0x000a4000 0x1000>;
>>
>> here you reserve 0x1000 for the qfprom
>>
>> [...]
>>
>>> +			gpu_speed_bin: gpu-speed-bin@601b {
>>> +				reg = <0x601b 0x1>;
>>
>> and here you make way for OOB accesses
> Ack
>>
>> Make qfprom length 0x3000 with the current base and the gpu
>> speed bin should be at base+0x201b, I *think* (the docs aren't
>> super clear on that)
>>
>> [...]
>>
>>> +		mdss: display-subsystem@1a00000 {
>>> +			compatible = "qcom,mdss";
>>> +			reg = <0x01a00000 0x1000>,
>>> +			      <0x01ab0000 0x1040>;
>>
>> In v5, I pointed out the size of vbif should be 0x3000.. and the random
> Where 0x3000 is come from downstream is using 0x1040 for vbif.

Hardware documentation.

Konrad

