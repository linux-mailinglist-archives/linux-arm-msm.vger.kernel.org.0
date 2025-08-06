Return-Path: <linux-arm-msm+bounces-67882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5277FB1C423
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 12:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D8D016EF13
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 10:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B4C28A71C;
	Wed,  6 Aug 2025 10:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFs2chKE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AA128A705
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 10:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754475712; cv=none; b=nRQC/yd/3ddqUQ7CLNOOpbJq7Ta6aEnyknM1PMitZKuJvaDfgDKHq7HCAN5dsqfx9UMh7GO22O5k30AURpAXh2t//4f6Yp8UBY0L59Lac9jAN3g8283NyvyHM/Akxfa1GkyZUXdRotGhtLj5SdhRSgq7EboU5RWnB3tFuaHXq9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754475712; c=relaxed/simple;
	bh=Vx+Qg0xbNvJrFhBrsrJXY1zmN75V5/PJ+Qk+ctRkfuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gfcrwvOjHm40BF7nLaV8g0olw4EAUKAAYxrQD40xtaCZy5UmDaF/u1If649xxeSX0AgT1MzogI/STwBoBdExV/AvoMqnKoBL3dCHBbPeg4JKd0qeH+OXHiDqsNqH4OQAC0+16SHYmkKS9Q/+wxVh67sNQ3bSppEuC2vyk2BjDBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lFs2chKE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5766RG3L019548
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 10:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	maMdfnpIgAbmJajtAO/s5Dg7V7mDrcNXJHl2QuXtG/c=; b=lFs2chKEsc8IHcXe
	0hRZm0x7gPIrATW4vgxoTF+VsNZXdlU6xL0+tuVXZwVdLexwQ4nCubX5sBWJWmsY
	W0DZ95PYYo6ILIRzLliIQU9O1KkOOR4q/NKLh66VHdk/iDBVzdYbx89SjU3lTZz5
	VnIWg7y0sNT6mKtzjYKUPX3UvARtj9ABLRDA1fMCicgkBDA9a8Yn1OJBvIOOJ5qv
	xBF776B24Tt+DKbymSJkZ1GfTj7WSF+T4wIfMnYv2c9A8+C9c2kBRwEC8nmp8VY4
	LMV1XfIVn4W3j6zQvpyGbUC8pks7JkyOOH6VRSssKVhgC3fikd34fXfju7aLEhrR
	P5Ptjg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy6ta33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 10:21:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76bc9259f63so5805148b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 03:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754475709; x=1755080509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=maMdfnpIgAbmJajtAO/s5Dg7V7mDrcNXJHl2QuXtG/c=;
        b=LL9jF90iNjkBoo3FqjzC9soorVlz1XqDAwgq69ABiv/mX5mYvGutC+rheAxBYIuSU+
         fjEdn5LQHREANmZVI80+pQVnDV3byp2Y+jgzYWwJWv7GPJUJyBupNGVwQt/T3LXt3kcd
         JcPESqFvTyfjFpNe+OLnAYisrIDtEas15Ya69E7DpxjN6PNSlJvVbdt4nGUCQwu/b+i5
         nQpvrdRx4C+Y2PFdtbpdcnR7RIYEl1dkodp+7JK7+jAUKY3Mr2bVlVLEHztYIvtj5z55
         kWFqs+mQ2xYPYRFyQGJ7daRvaf/55hvjZ5u/TdF40oUpn2VMHkyu0sjEahNea7M0yeW7
         qo6g==
X-Forwarded-Encrypted: i=1; AJvYcCXG+HwTXbTvtOUySD3socjnywIuJVgFOLhXsHCFT072G3QtMHlus4/PWMaODG3G6WBvp0O8K8H4EMsD6EA/@vger.kernel.org
X-Gm-Message-State: AOJu0YxKu6Zk+cQICv34MBxKkVQ077ADdQ8a5vsBfcnsloF5ra0mt0Hi
	q5byDjAzNtyU+U66VR3KUKKsId7QRZS4+jq6HXA+RBCk+N/8CdrB2afTZgUR/RFL8dN5RVuh6vA
	EbHJvbf8xJfAKyddCl0HzGmCVrZOqB7K6vPPDvzhAYZn3vn2ggKQ+jFgh53VEA6HSC4d7
X-Gm-Gg: ASbGncuR7hqHoqGXRVMNPO7mWfAs//NQtiGX6Ih10rHCm4EMysTW/ykusxEVp49P5rR
	6WqIw1MbSZL35cSaV2MMdZ9g/Hc3//NJvIxuZ6hdfNGd5kSvfT0Q3NyR1coueprHOh2Gg7la5Q7
	MY3Iit+E47+h+y2bkfw/A9wxzwNCqzVXiFdJEOhaokv621pvxKWwZ88ljblGVNH/5IbAhWnaRKH
	yKVU667MKoVLmLFuhl49c3u7D+mHQoqocTtqd2s8o8s7Sh0qsr8uVem+PdbwyOau6Lqh0B9soHV
	JzFeGUtRHNh3zAy5H13ThxWC55AvEfYo835gy2g7sul74UI5h0qs1khCdCqbXsoWtDo=
X-Received: by 2002:a05:6a00:21cc:b0:76b:f16b:b186 with SMTP id d2e1a72fcca58-76c2b00506bmr2574609b3a.17.1754475709254;
        Wed, 06 Aug 2025 03:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTKqHYf0s4xNLUVrvUtUmMVpKYxo7AnBKsVVS0NjaKjwOresU2P1m4/qqw3+J47JBXSXVmOA==
X-Received: by 2002:a05:6a00:21cc:b0:76b:f16b:b186 with SMTP id d2e1a72fcca58-76c2b00506bmr2574586b3a.17.1754475708781;
        Wed, 06 Aug 2025 03:21:48 -0700 (PDT)
Received: from [10.217.216.26] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd7d1sm15188844b3a.80.2025.08.06.03.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 03:21:48 -0700 (PDT)
Message-ID: <462b4010-fd79-4682-b9d2-31ffdd53b75a@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 15:51:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] clk: qcom: Add TCSR clock driver for Glymur
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-3-227cfe5c8ef4@oss.qualcomm.com>
 <aIoBFeo00PPZncCs@linaro.org>
 <784545d0-2173-4a8b-9d5d-bee11226351e@oss.qualcomm.com>
 <aIxRKHKdBHDefDs2@linaro.org>
 <d2c17575-f188-4154-bb63-e0b1b89d8100@oss.qualcomm.com>
 <b2f219d6-d441-45d0-a168-b2cdbc01b852@oss.qualcomm.com>
 <3fc425fd-39fa-4efc-bc98-da86a88bfb1a@oss.qualcomm.com>
 <c2f39786-5780-4124-9e41-6971428aa267@oss.qualcomm.com>
 <9e3b4706-c61a-4d69-be84-a5b6fc90eb35@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <9e3b4706-c61a-4d69-be84-a5b6fc90eb35@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: B0pGbY8CqO6hvgqz0jn2MM1BHSlptqcx
X-Proofpoint-GUID: B0pGbY8CqO6hvgqz0jn2MM1BHSlptqcx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXxRtGVE5FxE0Y
 hiGfqlDP2nBMnZ/mGwTQBUp8qCYuJn5NlFRFFImG+4Ny4wtVmnv8h3sMGAAMOEq1f0YM7XTuJ9t
 4mAhFiPdfz1QlGVGGakBTsP14m4+yytkh7PYsEkEEJDoMzK9ikkh+nCbhBAh5opcSIOCbbgNSm+
 xtAq1IimXE5O3pgerUCrr/vYy9w7aMjsfCxVHvZba5IxOM0rSSdEDiLenVt9U17o8WCTAxs8vSv
 S0KNC4XXMdJesustiljbDFKiGNWI8pqFN5LKXEZNL5n1vBlMk5VeizqIYjCLaEt7h7nL/APYbnO
 y9b59BsShquOagLzhYWMk7a949jkfjUQ6Y1rwyPPMpmZT+cs9TAXqsMDfx491Peew9SQ9gRCkoz
 mv7fh3BV
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=68932cbe cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=6OsRm2FtRiLRZBPAYcoA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009



On 8/6/2025 3:34 PM, Konrad Dybcio wrote:
> On 8/4/25 4:21 PM, Taniya Das wrote:
>>
>>
>> On 8/4/2025 6:40 PM, Konrad Dybcio wrote:
>>> On 8/4/25 11:00 AM, Taniya Das wrote:
>>>>
>>>>
>>>> On 8/1/2025 5:24 PM, Konrad Dybcio wrote:
>>>>> On 8/1/25 7:31 AM, Abel Vesa wrote:
>>>>>> On 25-08-01 10:02:15, Taniya Das wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 7/30/2025 4:55 PM, Abel Vesa wrote:
>>>>>>>> On 25-07-29 11:12:37, Taniya Das wrote:
>>>>>>>>> Add a clock driver for the TCSR clock controller found on Glymur, which
>>>>>>>>> provides refclks for PCIE, USB, and UFS.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>>  drivers/clk/qcom/Kconfig         |   8 ++
>>>>>>>>>  drivers/clk/qcom/Makefile        |   1 +
>>>>>>>>>  drivers/clk/qcom/tcsrcc-glymur.c | 257 +++++++++++++++++++++++++++++++++++++++
>>>>>>>>>  3 files changed, 266 insertions(+)
>>>>>>>>>
>>>>>>>>
>>>>>>>> [...]
>>>>>>>>
>>>>>>>>> +
>>>>>>>>> +static struct clk_branch tcsr_edp_clkref_en = {
>>>>>>>>> +	.halt_reg = 0x1c,
>>>>>>>>> +	.halt_check = BRANCH_HALT_DELAY,
>>>>>>>>> +	.clkr = {
>>>>>>>>> +		.enable_reg = 0x1c,
>>>>>>>>> +		.enable_mask = BIT(0),
>>>>>>>>> +		.hw.init = &(const struct clk_init_data) {
>>>>>>>>> +			.name = "tcsr_edp_clkref_en",
>>>>>>>>> +			.ops = &clk_branch2_ops,
>>>>>>>>
>>>>>>>> As discussed off-list, these clocks need to have the bi_tcxo as parent.
>>>>>>>>
>>>>>>>> Otherwise, as far as the CCF is concerned these clocks will have rate 0,
>>>>>>>> which is obviously not the case.
>>>>>>>>
>>>>>>>> Bringing this here since there is a disconnect between X Elite and
>>>>>>>> Glymur w.r.t this now.
>>>>>>>
>>>>>>>
>>>>>>> The ref clocks are not required to be have a parent of bi_tcxo as these
>>>>>>> ideally can be left enabled(as a subsystem requirement) even if HLOS
>>>>>>> (APSS) goes to suspend. With the bi_tcxo parent the ARC vote from
>>>>>>> HLOS/APSS will not allow APSS to collapse.
>>>>>>
>>>>>> Is there a scenario where the APSS is collapsed and still the ref clock
>>>>>> needs to stay enabled ? Sorry, this doesn't make sense to me.
>>>>>
>>>>> MDSS is capable of displaying things from a buffer when the CPU is off,
>>>>> AFAICU
>>>>>
>>>>> We can do CXO_AO instead to have it auto-collapse if it's just Linux
>>>>> requesting it to stay on, I think.
>>>>>
>>>>
>>>> Thanks Konrad for adding the display use case.
>>>> Abel, we earlier also had some PCIe, USB use cases where we had to leave
>>>> the ref clocks ON and APSS could collapse.
>>>
>>> XO votes will prevent CX collapse, not APSS collapse. CX also powers
>>> USB and PCIe so that only makes sense.
>>>
>>> I think it's fair to just stick XO as the parent of every refclock
>>> today and think about the what-ifs (such as the mdss case I mentioned
>>> above) later - especially since we have no infra to take full advantage
>>> of it today (non-APSS RSCs etc.)
>>>
>>
>> When ref clock have been part of GCC, then also they didn't have any xo
>> as the parent, similar design we kept when it was moved to TCSR as well.
> 
> Perhaps we've been running on luck (i.e. XO votes being cast through
> another device / clock as a second order effect) all this time.. I'd
> happily move towards formal correctness.
> 

I would like to stay with no XO linkage to TCSR. Any driver has specific
XO requirement should vote for the rpmhcc XO or XO_AO.


-- 
Thanks,
Taniya Das


