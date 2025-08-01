Return-Path: <linux-arm-msm+bounces-67344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C738DB18154
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 13:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F42C627EEC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 11:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1A921858E;
	Fri,  1 Aug 2025 11:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jp/hcV3q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7B21E5B9A
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 11:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754049271; cv=none; b=aBdlO/lX5pW1Nxpf+aCEjAD2VzNMThuSmh6pf1HJHQ/viIjWFJ4Vcb+Lu8sCGig/+o50WRO6k2mofuYDr/4k7EBKNOKarjUCjD9vPvQ3/b6qxd08nhHrC147sD63A6HKS1fUC7u9dAkSPp6t12xM+6rmv2cBsWp8UQ00lAhDkj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754049271; c=relaxed/simple;
	bh=L1ffq+YnAjiE6H9FN6/GOqUbgu3aX3Qw0xclYiGdav0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wm7xqJOITdT+zwi0yo2avqiOv+yZKohRp0jHYBkBOu5EmFi85mxiV5VGfgKGVkWIYjDHH46kxXplrYwTgV3CwRALT+aDAeIijTFLCLSYNo3iRk2tRx+d2nPLyqtEBEtnmSAHdVTmSH0xHlK6L81dKJk5JtivPk3cv2eA2M1/eIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jp/hcV3q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57191fV3002617
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 11:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y0yAyctewBGcrkhnpcRUCf+/nTscTMEDN7WOB2NFG1k=; b=Jp/hcV3qVABDrEwv
	WDncH6TBNkGa64/U7vm+13+Z/WyxPjKJMzJNHKHOcYsi/iVnshw+P6XueQPQTSvj
	JxD1bPC+L2URM7wjdGd2cFKPLJr4hsqJo3llLkwuvkGuwB4BPz/Vi7DvJd0tQThw
	8Vo1Evho5Xa4eFoMfQuIY3jYXAhwgDHPVbp5XGh8VXdey0N7rbtSFTruAGPPhGhc
	2SY2lwxv5HcS1iMpBl+M8vv+au3hBrggXhoim/EvWP8CnbRUoJWjn7qGwCha7dfe
	SFNBLsrlfSLZeRD+FWD7hp9P6Zx20v25Q5Vec6fZj7NQBj6wu9RTWqblzLim5CRK
	uG1xrg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbmbhfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 11:54:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab3f1d1571so4582031cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 04:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754049268; x=1754654068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y0yAyctewBGcrkhnpcRUCf+/nTscTMEDN7WOB2NFG1k=;
        b=SeM89//C33gVLKq3Yiq0WaSZJFk1epVWQ88Z9jHh7YfqPZyiwqfrjPTP2K37aT4MYY
         axUyo3gDG7UfZfYuK2cC2qlx5h15B3vT6ACpCXH38LZLk/Ass0CiFHANat0RR9FZHWbT
         syGVzrmj4oupzwSnWeVVreY0hc4VMintM7ZQnr0VZx5vHkleLHKken1VAN0tyC5e6u0b
         xA0b8AqsdwAvpNdAJPtRrIYghvz2kakJVWs9M/Ix6KF7zA+4poQeDRDHhfK66csudNtj
         Q+/vu6L1cqcsna6+Ikowov0zAfvxXtBkGbkpzpEkyPt99R/l+uwPDMHr198vkMkiAE30
         M4SA==
X-Forwarded-Encrypted: i=1; AJvYcCWX+ovJU/SBU/3wfM+wEdqg9ogsrMp8+c817KTbHeBlOzPuLaZiP0oZ3nQrygB9To9+Kx5lnsQAI9z99xLW@vger.kernel.org
X-Gm-Message-State: AOJu0Yyafq4gWdBDODIWFDg3MKom9IfICZdCL5vjhaLr7BZSB5y7QFdR
	0AjWE/740w1zJo6ukfH37WFI685N1Lc1lYqQTG0AoHlkwG/ZiwKRnsF3dQuDyv9GnHmAqRtIT80
	fF9lVGMRV44y9LkPT5tZ+fhIx+UXPbXC836g3fhWvBnJacWz05QWJLM6vjnKboDX8hIbV
X-Gm-Gg: ASbGncsx4sNCQOZZ+mE133jvQi/S298JVF1x3f0tgzl7D+o05/JCUyKZx2APqEpqSk9
	ExugB0APEkUrCK1mCQ8QpwoXpT2gXlavb+EIUFrZ2wywh2gxuNOZ/grIOlgOKCk2UDKsDbP3VRa
	6LIJ7XXYc6fx4974JAAIs8/bpxx50DrbgpR+DJSrklF7k04dhrRdDAwRtrNJGnEOMRuew5R8bmx
	mHzzFcEYKEmtAUFATw9yAHiv/LqKiD0JQtmvGnYIE3KnBjNM4DPe7gYNpjmuxeGFK2gAXz1LTzW
	cfsNflSTAdk5zPENSZrs+SGY4OxOCefHX5/DWuAqqrXkcnPO6oBx4HnZ4fkRsuqEG0B8oNJYO51
	EUdanCT2zN1iOmkenNg==
X-Received: by 2002:ac8:7f8f:0:b0:494:b722:141a with SMTP id d75a77b69052e-4aedbc28da8mr7053121cf.13.1754049268019;
        Fri, 01 Aug 2025 04:54:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCLWAyERKRPjTr99qlj++Pgz2FeFXYlRWohtNL2x48UgquA0olCovFHymfIyPzxvQjxQn5kA==
X-Received: by 2002:ac8:7f8f:0:b0:494:b722:141a with SMTP id d75a77b69052e-4aedbc28da8mr7052851cf.13.1754049267571;
        Fri, 01 Aug 2025 04:54:27 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c10asm277886566b.116.2025.08.01.04.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 04:54:26 -0700 (PDT)
Message-ID: <d2c17575-f188-4154-bb63-e0b1b89d8100@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 13:54:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] clk: qcom: Add TCSR clock driver for Glymur
To: Abel Vesa <abel.vesa@linaro.org>, Taniya Das <taniya.das@oss.qualcomm.com>
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aIxRKHKdBHDefDs2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=688caaf4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=pJtBvqx0UPjT60PkLbkA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA4NyBTYWx0ZWRfX7vnjCJ49K4Ne
 0J7w+gL7DEAI4ntct8neXhS7jcCalC0pXGyUKBsCeubRUQdMR5gEM1ddifQGxu8BMKdpvjebD/J
 eWFnH92Vp9qSVkc64w/d/QAaZT4BJA6n43JwJx+iVdRjgqy1XvpRmDGR6Y0xBHOCuT4YNLUZ7F8
 g/MkWcO0c/R1irq9ZTZUgIXLEqdu//Nse0HcXb3Bc0EWY5g7B6YjzJamTGkyC9BIEGHm9MuLQ6t
 CFjSLSHIAAFoMYZS6p902TSzzsR+0EPE2s2lLaTK9maUD4O42c1Yn6DwhOSzDFu67xul9rQobaZ
 spOjmRMNQqlkCCnbi71fb4Pt9S9e9wPto07Caeo7qLcIUapjnU6tqCqtunXv5vBBBfzrjgBTUZK
 KtEfCZACTbUv3Mr9R3FKIkCcZF4McjJ0FYQW+TabFJlWgur7El0r+Vq9eqe1Zvmxu2sVP6gX
X-Proofpoint-ORIG-GUID: 34k8Z2biAHJF4qRfdpNqpoTmrUcPufki
X-Proofpoint-GUID: 34k8Z2biAHJF4qRfdpNqpoTmrUcPufki
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010087

On 8/1/25 7:31 AM, Abel Vesa wrote:
> On 25-08-01 10:02:15, Taniya Das wrote:
>>
>>
>> On 7/30/2025 4:55 PM, Abel Vesa wrote:
>>> On 25-07-29 11:12:37, Taniya Das wrote:
>>>> Add a clock driver for the TCSR clock controller found on Glymur, which
>>>> provides refclks for PCIE, USB, and UFS.
>>>>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>>>  drivers/clk/qcom/Kconfig         |   8 ++
>>>>  drivers/clk/qcom/Makefile        |   1 +
>>>>  drivers/clk/qcom/tcsrcc-glymur.c | 257 +++++++++++++++++++++++++++++++++++++++
>>>>  3 files changed, 266 insertions(+)
>>>>
>>>
>>> [...]
>>>
>>>> +
>>>> +static struct clk_branch tcsr_edp_clkref_en = {
>>>> +	.halt_reg = 0x1c,
>>>> +	.halt_check = BRANCH_HALT_DELAY,
>>>> +	.clkr = {
>>>> +		.enable_reg = 0x1c,
>>>> +		.enable_mask = BIT(0),
>>>> +		.hw.init = &(const struct clk_init_data) {
>>>> +			.name = "tcsr_edp_clkref_en",
>>>> +			.ops = &clk_branch2_ops,
>>>
>>> As discussed off-list, these clocks need to have the bi_tcxo as parent.
>>>
>>> Otherwise, as far as the CCF is concerned these clocks will have rate 0,
>>> which is obviously not the case.
>>>
>>> Bringing this here since there is a disconnect between X Elite and
>>> Glymur w.r.t this now.
>>
>>
>> The ref clocks are not required to be have a parent of bi_tcxo as these
>> ideally can be left enabled(as a subsystem requirement) even if HLOS
>> (APSS) goes to suspend. With the bi_tcxo parent the ARC vote from
>> HLOS/APSS will not allow APSS to collapse.
> 
> Is there a scenario where the APSS is collapsed and still the ref clock
> needs to stay enabled ? Sorry, this doesn't make sense to me.

MDSS is capable of displaying things from a buffer when the CPU is off,
AFAICU

We can do CXO_AO instead to have it auto-collapse if it's just Linux
requesting it to stay on, I think.

Konrad

