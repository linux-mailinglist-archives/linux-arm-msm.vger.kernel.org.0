Return-Path: <linux-arm-msm+bounces-55515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6D1A9B8D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 22:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38EE17A9E1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 20:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6EF1F866B;
	Thu, 24 Apr 2025 20:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMsspUme"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56C11F4621
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 20:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745525323; cv=none; b=kNc9vVkpC6tL8MGBGlQ9Q1CQrXfhHMH8vOlBS82scMzeqqS7rV0q2Noe9kJ8nuI3tAfyUlaFAtDwyQ3JSZ+do52aOsdhqu2NpZafLNyeZoSh8JZwhUsPQBSgiI05f2juT9RTmhSBJcQX+2Smew6OoSpqsmO0ZgeOYggss7vx3y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745525323; c=relaxed/simple;
	bh=V3f6aXPJbQijd6ipBPnSJT6DHy2KjZMx3Pjb2cb1lhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LLBteDoBlnDF5xKXK7mVfxjr2VE9/hwlScjMC460Y2dtaoRxiGQr6CRRLE5QOKCdmrPPZFJVVxxiM6xzb6Ia/X02nLQsWkTJuLex74ahPpzqgbKJlp0BzpoWdH5//UG/hfEldyEelaYaTv4NHBEpsDNj7CgcJPOtUiQGoQjS9s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMsspUme; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJn428008723
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 20:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G9NkZBB78ocYZoBuxIUW+E3P4tAq4xlMh9aXpLYJZmU=; b=AMsspUmeDDTr6fVs
	Zjc0G+CMRC0lqCwsh5MYoS3ndPg/wnpPgW/yQ6tV+H1CNUnOE6gzirWDXz0FSgoz
	fz/AChZ8VmFt5vqzIbNi5QGeLIEp9TBsnHNT9KnDKhxXd+ERhVTRcgSEhpnAkaCZ
	l3JIOVdpdGqZZssYB9IX6NuqWT6pfBKA6b4hNlaBHZnXODmIcEFSmCY1GYbFIccP
	i4VWrbvJhY/GU+K5Go0sA1Wpso9MOdkJyUaFgzTV9NXpV4nB5Y/AFKym9O50tygz
	VouZvcBUoITRLWpgWZUGkqed3vY6g7BKgOqGm98mYss+KpPqYYIvTjblpPgZVTnL
	F3mt3w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3prh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 20:08:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54be4b03aso29158585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 13:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745525319; x=1746130119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9NkZBB78ocYZoBuxIUW+E3P4tAq4xlMh9aXpLYJZmU=;
        b=I6OIG2F38RPzVl4/Y7SMpcRguYvWeYhIdjJaA8Gp1RG8N58EZUxV2yzja6YH4VxRXT
         W4hbkglG2+KajmIJa+Mo60QOItdJQ3Za38jQe/IFUIWYBJRs/BLWUu6yy7cotxCLau6E
         +qwXWrloI9S059NEhew2JUGXXeO7t96SpApTZzNrbVf6LIbYUyyORZGZYTR1ta3em36t
         uwJYBmj9zRDZs0A4sy1iM4tu0XfescNIsPLy/uKffyPBHDH80T/CWnVuXkYSDoK4iFOa
         d9znif5IIqv+sGEqJTxm1/A4VvK/Y+l+6/pzP8LX+hBDiUwQkKbHqhKXXEai3PHTqZtS
         Xm2g==
X-Gm-Message-State: AOJu0YzRDFzUrUDJz2+DlocZv83fUWPiJ2CtzZnkJVj6c9Fk3MWYuwi/
	bAKqyrefelmimR11Dsx8yruXSwt+MVMYD7f6vOQ3ANV75eiw+wihRgnTi5Z9YgaZuXOMmmdnos2
	o1llwxOfws6CkT6c64IxrrtNpWJTpm80NGp4NCsetItyIWruZB65ln5/8jgcFdAU5
X-Gm-Gg: ASbGnctyZKiTfQu8Qxwrz3oA0CuJCud+CiuHURq8dG8zmDBh78i0Of6o9LZo+vludMB
	vlnOkXW0L9g+FYkrfW7DM/szJgjubbtNvF+8CZm+tK7p8ErgGRHlFu2229slLem8IOz54V0OGuw
	nj3VdLGcbZaR5UpcxVAnKIOr7+gD7eD6s040y70mKc0vaxvG+FYFHpzVAmXmaBi5KYs2msE9KsX
	tX4TZ6uexj8ZoWr3DX8ZVdc1AgiKfAodAJmoyh0F2nBKPYl/9iF3t+QYD4roqVYrHCsd50/zdE2
	pNKO28c/nxhz3KDFAQw1vneUNIvGXhzpfdlg+QWZCm6oTjQCvjEsORsSM4pYfw/u+DE=
X-Received: by 2002:a05:620a:2952:b0:7c5:ac06:af8 with SMTP id af79cd13be357-7c958375c68mr215663085a.9.1745525319581;
        Thu, 24 Apr 2025 13:08:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMmWKDcjybgaESS6WVurym3NYqKuP+fE4ZJpZgER8xsvh0anBTaORqzLN+6oFTx6wsgHq8Uw==
X-Received: by 2002:a05:620a:2952:b0:7c5:ac06:af8 with SMTP id af79cd13be357-7c958375c68mr215660285a.9.1745525319127;
        Thu, 24 Apr 2025 13:08:39 -0700 (PDT)
Received: from [192.168.65.221] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41c71csm15120766b.4.2025.04.24.13.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 13:08:38 -0700 (PDT)
Message-ID: <d0958f7e-db81-4e4f-93e5-24ba0cd853fd@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 22:08:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
 <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
 <6a4ec36c-c003-4ce8-9433-8c12ed3188ee@linaro.org>
 <d97194a7-2b7d-4a76-998b-92da495e8bd2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d97194a7-2b7d-4a76-998b-92da495e8bd2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: K8M76t7dd8eqSeAZv5ZZkyQLFUSu8ROn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE0MSBTYWx0ZWRfXwvljbB3S+mcF +59L90b8D+lfNEk/WcgdBsTkf5q9kQCqQsvJb2yL1EHW34cIgaDT0YWepM23JNaWbGDbUW1vgfb Zn8695siP8NluQGKtSH/1GC3784aOVrxitfX5NISqhwARr4pJHHSEa5OiyCm3trT8hpgTN9nSQP
 YbLvEw/Z8lkHkH31U53LSeW2H52GYfkIlu60JWBQ4ntLFBouM1gQU/ziSFSSDtIrXIa/TDwnEwI d8Q5rHjagfbItZvTvvl+viAI7CK8mpvwEctI/GcC2skn8qjrhsyslMhXw4mvR05MidoSHkNhzCs Ar2PtfsXYZdk06kzEqSGCZ90u8e6Xc+Ife8hSJmBOriE2x5jpTgcc1EIcWCPeNBqIoUdWlQJQaz
 VUD103PpouBerOB26wnap/fTs5A9VOs6WdY1WA+cKTxaQw4SNFiWVwvOsHxG9Wt7sN4Qc2r5
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a9a48 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=Wno-CeEu7Fx5tZoO0NsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: K8M76t7dd8eqSeAZv5ZZkyQLFUSu8ROn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240141

On 4/24/25 6:13 PM, Bryan O'Donoghue wrote:
> On 24/04/2025 16:54, Krzysztof Kozlowski wrote:
>> On 24/04/2025 12:17, Bryan O'Donoghue wrote:
>>> On 24/04/2025 11:07, Krzysztof Kozlowski wrote:
>>>> On 24/04/2025 11:34, Bryan O'Donoghue wrote:
>>>>> On 24/04/2025 07:40, Krzysztof Kozlowski wrote:
>>>>>>> +  vdd-csiphy-0p8-supply:
>>>>>> Same comment as other series on the lists - this is wrong name. There
>>>>>> are no pins named like this and all existing bindings use different name.
>>>>>
>>>>> The existing bindings are unfortunately not granular enough.
>>>>>
>>>>> I'll post s series to capture pin-names per the SoC pinout shortly.
>>>> How are the pins/supplies actually called?
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>> I don't think strictly algning to pin-names is what we want.
>>>
>>> Here are the input pins
>>>
>>> VDD_A_CSI_0_1_1P2
>>> VDD_A_CSI_2_4_1P2
>>> VDD_A_CSI_0_1_0P9
>>> VDD_A_CSI_2_4_0P9
>>>
>>> I think the right way to represent this
>>>
>>> yaml:
>>> csiphy0-1p2-supply
>>> csiphy1-1p2-supply
>>
>> But there is no separate supply for csiphy0 and csiphy1. Such split
>> feels fine if you have separate CSI phy device nodes, which now I wonder
>> - where are they?
>>
>> Best regards,
>> Krzysztof
> 
> The main hardware argument for it is probably these PHYs do live inside of the TITAN_TOP_GDSC power-domain, which is the same collapsible power-domain that all of the other CAMSS components live inside of.
> 
> As I recall we had a four way - albeit long discussion on this in Dublin, you, me, Vlad and Neil and my memory was we would implement multiple rails in the existing CAMSS PHY structure and then look at how to model the PHYs differently in DTS.
> 
> The Test Pattern Generators - TPGs would then also fit into this new model for the PHYs.

Maybe we could consider modeling various camss subdevices as separate DT nodes,
perhaps on some sort of a `camss` simple-pm-bus or something alike

Konrad

