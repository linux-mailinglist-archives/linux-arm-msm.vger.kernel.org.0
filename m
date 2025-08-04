Return-Path: <linux-arm-msm+bounces-67648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0E5B19E18
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 11:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7F1F24E0F7F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 09:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3437123ABBB;
	Mon,  4 Aug 2025 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KI+qPv7l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EB1241679
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 09:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298053; cv=none; b=sQoe6KHidCsoYQM4yLQ1LNjDjOoOOsEGujyKuBvmTiu21HaL7RSL0FM0Kw/wAZ/3wPXiCuuaHN01YuvCF3S8AjndSRMXBohB7Du+uY4xYYNYLGjv2KHthbVvZ1b7MRFfLKC6SanMIcuqx87IIV/zXtVkAQe4eO4tI385BC7GkLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298053; c=relaxed/simple;
	bh=KCH1pCdiGwOBI5qtyR9u3CbnJsjZm2nAIh6QkzgzEH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aCMgkEWHcpNWsdZ4p7RQn3GdhnpAnb5qADMp0Mtf8mkEIOR6eCVtZhs9c+vWejEZsNa8z3FrVJZcGNzIeqq8PIo6yXx8prvP05kmflWB58iNw24PsGQgFnEDRlArUEdebNQ+Q1PRZweJ/F2zecvUNGh2Zg8mMfcInDhrwY2ze+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KI+qPv7l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5748MPvO005890
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 09:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLD6PUFRLMN+HbgpajUIIfX4iIztYiU2uFQ6pIPAkPo=; b=KI+qPv7ljAiWwRSm
	o+cTfcCfWGnY/0Y7m3Jfv2DmhiCiaDPeiJGy1xoHbXe2I3sC5W4LOuioQeqLGD7U
	qQrgnp+DSuOLR26mT4Cdj4Tj2Gkd/34BeEjQnYHQE7C8yb/MXz6ljYKuiVW6dz/i
	pi0GBqIClcvpgCBHTsvQ/1XgECoogSsx8i/9iD+lTGzojO5lKrj0+WZEmubfTO4B
	0i80RAGj6dzOuWyF8OPwe26bXlVxQ5dOwU/bfnGtiymAOpvgkaVu441P7QnHHe3z
	Z9C5zmZ4Ud69/2Qjea+n8RarwaDlQGbFEnVtxbe2+f91iE+3DJ9BcNxdk+p4HiSo
	brRGXQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489bek46je-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 09:00:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76bf73032abso1301074b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 02:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298008; x=1754902808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rLD6PUFRLMN+HbgpajUIIfX4iIztYiU2uFQ6pIPAkPo=;
        b=Zk7kXPC1/ODZOw38h7ZY3J19tU5FRIf2cbpzDPp5XMKUNNnz7/kzOgVy3/LXStmKsX
         /H5huC+VKXptaCJ/HgA5Sz3JZpYOgfnPxroc3atPPVMthAeK9Qgn7kLBQO+ZpDHKHvf1
         O/w490+SRDI/cCk80qCRaryKbtvZjo7+5QZ7gZnI/JBL7Y1g1YY63G2UUBC++hRjISPt
         MjNEzM4m/YMZmLm2GnN1ENz/N7vQMIOfebzNhrcwf7GxpP3KGWkuKKD63Gsvy68DgbTF
         Yio8CceX+2ScVeMf9NGEveK35+uNj4L0P/JwW53OxntUSoGmM9oZAwVOWG8NY2jmNbZa
         9bdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGiOPeq9I+cLDQpQ4mPLryKYXGvjZKc0YI6X3spic+keJ+ROEFDdGtpPgBHUh08LDKFd94+JEAOCo4F5Ct@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ0lldccFkHpt6Yeh7NRwjfEObULSIPKxvIHq6u/1OB73o1+6O
	KGUPnAPssqz8uFmSpNxFvrkB1ahzeYLDq7EDhKeIxJSEuaWVN4uI2muNGyv3jclTQCJ4rlQmwW2
	ZVw365CG4AqXDYZgk7PyZx1OqLHpIccOmksCutCcj4RphxqZEZx4VNnzZQiz3XVWgYoud
X-Gm-Gg: ASbGncvImLKWM+4nbIo0k+xivfA1758zOyIjkeCNXpBfeha3h/ifBHHKDQR1m19dXSn
	csHMyAQZU8ddC3w9NNG0Vh06+5cENz02TRK3mEfXEXDA7XSnTpy+HtQzLq6OZy8Z3OhI91MAetR
	n278ciCfksvrynpDSO/yxCMMIg0hRORSojjwEdnItwMOEk8ZRl15MioOjwV05joOb/5guFD3tzV
	VaRWxCkxJTshgW4M6eEtkN8tWfQmMHgvNcVaIX7nTMxluLnU0Ql+dm7grheDDcOxyrq0rlaXi7Z
	ZMzWyUtlhu80xuYh7SMtlnLYHbYv6hCpZlmsq2BCX7FvHhx+6BOGTk0pKsW1W8cr7uM=
X-Received: by 2002:a05:6a20:558f:b0:23f:f712:411c with SMTP id adf61e73a8af0-23ff71244dcmr6640454637.36.1754298007811;
        Mon, 04 Aug 2025 02:00:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdxtGwnA/c48xKrIO/+id4y5Pj73li5eoGe6GJBL7RnkEfq1PIi9CDpV3qk/9Rh+1G6mWGHw==
X-Received: by 2002:a05:6a20:558f:b0:23f:f712:411c with SMTP id adf61e73a8af0-23ff71244dcmr6640428637.36.1754298007371;
        Mon, 04 Aug 2025 02:00:07 -0700 (PDT)
Received: from [10.218.30.152] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c0a952525sm1455674b3a.79.2025.08.04.02.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 02:00:06 -0700 (PDT)
Message-ID: <b2f219d6-d441-45d0-a168-b2cdbc01b852@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 14:30:00 +0530
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
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d2c17575-f188-4154-bb63-e0b1b89d8100@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M7tNKzws c=1 sm=1 tr=0 ts=689076c2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=xkFCAPjOK7Wg2B_RzJ4A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA0OCBTYWx0ZWRfX9xo8mmTWj15g
 XebdDNt+zacEQqPq0KCJLWGiJvQMIHq5YijsncE8vSiNhBUaGtqOVdVvgwuiMsWvoXweIhs6nS2
 m868eWMgsVuGrTV2EwzeI4LEGwcRRh7IW+DU9c7NV1biiiRwQS60ZU5MSGj3y6hKd3c9uAecItk
 1ciMg01nV6LpbYcdiHBsLGQWSSvGeGPrSjI3vTujmEGVl1FxX7PVowcNcWFCmlw53lVg8i+yTXG
 qyUu0HD7Oj/KH2pS8t/Lkbv6JArlOsrFhGT8qX09EMCS55dqu/0s4ZOhPGzu2ubemyDgnRGWNyK
 sDFaDo09j/B6Evh9bCaVAxFf4agK2mi7aFnVmeueFpKwPLifhdVlpCEq16fbFzLlGnfx7+9buKl
 Bq1EQbCv+6sPCGMgVh+jQ8pAafITrxX+KAe2+I0nvTpdArVxzI+IiDPqZQN7A3oN1VeK1zCk
X-Proofpoint-ORIG-GUID: 1FAzBLUyRAWVGZblAUN7aYWjfqDgote0
X-Proofpoint-GUID: 1FAzBLUyRAWVGZblAUN7aYWjfqDgote0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040048



On 8/1/2025 5:24 PM, Konrad Dybcio wrote:
> On 8/1/25 7:31 AM, Abel Vesa wrote:
>> On 25-08-01 10:02:15, Taniya Das wrote:
>>>
>>>
>>> On 7/30/2025 4:55 PM, Abel Vesa wrote:
>>>> On 25-07-29 11:12:37, Taniya Das wrote:
>>>>> Add a clock driver for the TCSR clock controller found on Glymur, which
>>>>> provides refclks for PCIE, USB, and UFS.
>>>>>
>>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/clk/qcom/Kconfig         |   8 ++
>>>>>  drivers/clk/qcom/Makefile        |   1 +
>>>>>  drivers/clk/qcom/tcsrcc-glymur.c | 257 +++++++++++++++++++++++++++++++++++++++
>>>>>  3 files changed, 266 insertions(+)
>>>>>
>>>>
>>>> [...]
>>>>
>>>>> +
>>>>> +static struct clk_branch tcsr_edp_clkref_en = {
>>>>> +	.halt_reg = 0x1c,
>>>>> +	.halt_check = BRANCH_HALT_DELAY,
>>>>> +	.clkr = {
>>>>> +		.enable_reg = 0x1c,
>>>>> +		.enable_mask = BIT(0),
>>>>> +		.hw.init = &(const struct clk_init_data) {
>>>>> +			.name = "tcsr_edp_clkref_en",
>>>>> +			.ops = &clk_branch2_ops,
>>>>
>>>> As discussed off-list, these clocks need to have the bi_tcxo as parent.
>>>>
>>>> Otherwise, as far as the CCF is concerned these clocks will have rate 0,
>>>> which is obviously not the case.
>>>>
>>>> Bringing this here since there is a disconnect between X Elite and
>>>> Glymur w.r.t this now.
>>>
>>>
>>> The ref clocks are not required to be have a parent of bi_tcxo as these
>>> ideally can be left enabled(as a subsystem requirement) even if HLOS
>>> (APSS) goes to suspend. With the bi_tcxo parent the ARC vote from
>>> HLOS/APSS will not allow APSS to collapse.
>>
>> Is there a scenario where the APSS is collapsed and still the ref clock
>> needs to stay enabled ? Sorry, this doesn't make sense to me.
> 
> MDSS is capable of displaying things from a buffer when the CPU is off,
> AFAICU
> 
> We can do CXO_AO instead to have it auto-collapse if it's just Linux
> requesting it to stay on, I think.
> 

Thanks Konrad for adding the display use case.
Abel, we earlier also had some PCIe, USB use cases where we had to leave
the ref clocks ON and APSS could collapse.


-- 
Thanks,
Taniya Das


