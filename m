Return-Path: <linux-arm-msm+bounces-67881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8109DB1C400
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 12:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F5257A205B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 10:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D93221FBF;
	Wed,  6 Aug 2025 10:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5UKKG95"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902BB1F03FB
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 10:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754474648; cv=none; b=pUwH16iY8jo9W3L6Ttq60+ah1ZtZ8xoR6uAMvGZ3XaQPbTodqJgq8nifN76nvX7liHIbTa0iU0aI/eCk7qlpuxbuAxVCIEE8mac5IPb+wRMUvbQViGyp6IFY4h2EtmnlZkS+4d844kq3zcoU/7/aTtHckZCtWqrBT3GM1FTtYAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754474648; c=relaxed/simple;
	bh=Nfg8ZV5S9dd/rRMBz2rWxYkRdNNUygm0/QvzT0BF+uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HriZ4totkCmUzYLJFafF4HDgeK2eSoMUaMPePGAoyPfDmoxPXa4Yc19CI3yy99yk/WZ8GRHa9xoRpTKqB0iQi+xxkNiu9eeBslYT1qi8YB5c4hq3A5GPJIKTgMkm9W0zrpOsugI6URUhfj1BgJ8L8Ek0mizq8Z6tIrkAa/C5XoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5UKKG95; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765iqKN028204
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 10:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oH0wyHvL/nCeJrABEE6IBIqEp4r0L7EIKpUAEvO9+wo=; b=o5UKKG95Q5yUM+mz
	NZuWdcHD3OvOB4UZ5PNhLVK9C404h6tZmbkL70mxsguk7R4Ir5vlDlyHDDmdm/DS
	sWd0viLicRTNFVKGiZn/2FsdgTDK8OhVy7G4PjL0qjVhW8i/X4BD7mKUnF5dopvM
	PKydHHasD6GYBGESX506yd0I4VtR7KN3sSS72jFBj5QrG1p1HdGzgvKUupadUnd7
	2sSrUb+f4udAd7DMwQYwZCjtm4x5Hj9NCljepjBwyxADM2FymZtbQq1AUk5rK2Nc
	UeASzRfcErIfFE5ManV+p1sJYUh0JI8i9oypzgF+Ipt2pKY4EFDxm9unwEhsDbwP
	8bqfLQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvxtdhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 10:04:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7073ec538e2so22107306d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 03:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754474645; x=1755079445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oH0wyHvL/nCeJrABEE6IBIqEp4r0L7EIKpUAEvO9+wo=;
        b=twkzoJ5/QGzPlXO8uJj1nI/K/rsHF4CCBWuZ3SUJQtwuJPJWLJuP77I7cgbYMl3XYr
         yala2rx42LFSFZok1tu232yUHvGmYx88okBznxyoegEipX1lvlOD0o+cF19681u9XHgn
         k66z9EaqCFot7pE09jD6+Sjlt67BS9fu+nllUP/nJKvan/Kn4JeeqVp8fZLFGmQhbbyC
         wt8UGUHq9zaLdk/V47VK0SyRmJH9LslCUkTsYGMOQLNA9cgJk2bPrcQM05QONIum+MvK
         YrPOWMFJL4UmeiPRpSd0LaWmdhulsp7gUvO31XWsBRSq+dg2JTzv4rW5YngMw9FldawK
         IiBA==
X-Forwarded-Encrypted: i=1; AJvYcCWQukHVzKSu+h/wZ9pmdnJ04Gzb8ZuSUCeV8mIZFBVQlq3jDEDyV48FK5oCwCdqYfi35gzSxYTGjIvHYjtL@vger.kernel.org
X-Gm-Message-State: AOJu0YyM3BVCOvm2wsLjLpzgIeEUTeoAZ1V8jOo35hpwBblR5iLnBTYf
	B5is/z6wBUigv9v0z7lxaYThOQB5ShazE1LQQRap8K2BOOoLrFEK6312DS45GFAEkmR7kMlJ+Kl
	qnAixZC1Z7+nPQy0m+uTeuRbsSqFSxbMMIow0mFPmR8lGpFkMRZ40lDZDKNckT3RIwijQ
X-Gm-Gg: ASbGncvtH/W5uH+PJTpzMBex7Q4claOHMHTCM+ilAUe22Kw7X02JfSzpPMJdkJp3Y6L
	Q283yAMGskjmRqcxxRhAiVFzrML5AS7r8rbDCXl/ein5cYl8BT0MAb2IgTs+qhEUXHwZpQ7QI5s
	sqM9TX7SNI+5+MIQrrSz24g4LbnyEDvIJVPVx2vxlvwY5COv8+3284CD6u5LsEddk8F4EPxc2rg
	6Ab1fOkhhDIJOUp3NNGbZgjP4V3FKUnb7x3Sc2sZhLZESrI1xIJd6jLoecMOri+5ypT84pc2W6R
	ra3CZr1nub1FVcbEA6t/hGkKUdchcYNSwfUo0yo9baY3SaRKioCy0BY3hu5WdGRS4tZ0kx+CJLC
	cueg3SRRrpeEAPMzsdA==
X-Received: by 2002:ac8:5888:0:b0:4b0:8a0b:5dc1 with SMTP id d75a77b69052e-4b09141c634mr13322121cf.7.1754474644626;
        Wed, 06 Aug 2025 03:04:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCC204sGp2lAh4JdpyVcbNWgkbVjvoq6ZF9ArXM/l5nXMta/9k4mQLlGTUdhT1lX3+nZ0M8Q==
X-Received: by 2002:ac8:5888:0:b0:4b0:8a0b:5dc1 with SMTP id d75a77b69052e-4b09141c634mr13321711cf.7.1754474643981;
        Wed, 06 Aug 2025 03:04:03 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af994cbb883sm86231066b.28.2025.08.06.03.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 03:04:03 -0700 (PDT)
Message-ID: <9e3b4706-c61a-4d69-be84-a5b6fc90eb35@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 12:04:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] clk: qcom: Add TCSR clock driver for Glymur
To: Taniya Das <taniya.das@oss.qualcomm.com>, Abel Vesa <abel.vesa@linaro.org>
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c2f39786-5780-4124-9e41-6971428aa267@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX3PD8CA9PuElr
 duB7KYD1POflelySYcXLT7R+kHGSFbjZqvu83qs7Y8+EWbGs9TMqK6z9FAZWJSLCALhOiY71BWa
 xDYEK1lvlszwP0yL2orF8A9eS1KT47KHnuFGpEr/ulRLz4oMK/zhfC6n5TWrpk1lo4q6UHfG7ik
 MbHbjncpJSg8Zh0GPIZA/tPu1FLdS0PUrF8lOG1V15OMjuyM3YpmUjBUW+FUtXOerRs+43tlUUV
 BXBNqgNZcfHJZkE57WvcuEn1lyhcKLj1H5YiyQ/cUp1qWU152C7Vq2wymT129+8ewRfsremGDRp
 9SDSIoCbHsCaeYJHKDQm8shFqnIizGQQlyHTLu7HyrDdUGWxGkgMtRHbeD7FCoJDNG/SG8OgNBG
 +yEPvZnw
X-Proofpoint-ORIG-GUID: hdZXwwLy48FdQZ_SC2TlQXRv1DtxbU1B
X-Proofpoint-GUID: hdZXwwLy48FdQZ_SC2TlQXRv1DtxbU1B
X-Authority-Analysis: v=2.4 cv=U5WSDfru c=1 sm=1 tr=0 ts=68932895 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=pLAVxPC-hiG7cL8D95sA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/4/25 4:21 PM, Taniya Das wrote:
> 
> 
> On 8/4/2025 6:40 PM, Konrad Dybcio wrote:
>> On 8/4/25 11:00 AM, Taniya Das wrote:
>>>
>>>
>>> On 8/1/2025 5:24 PM, Konrad Dybcio wrote:
>>>> On 8/1/25 7:31 AM, Abel Vesa wrote:
>>>>> On 25-08-01 10:02:15, Taniya Das wrote:
>>>>>>
>>>>>>
>>>>>> On 7/30/2025 4:55 PM, Abel Vesa wrote:
>>>>>>> On 25-07-29 11:12:37, Taniya Das wrote:
>>>>>>>> Add a clock driver for the TCSR clock controller found on Glymur, which
>>>>>>>> provides refclks for PCIE, USB, and UFS.
>>>>>>>>
>>>>>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>  drivers/clk/qcom/Kconfig         |   8 ++
>>>>>>>>  drivers/clk/qcom/Makefile        |   1 +
>>>>>>>>  drivers/clk/qcom/tcsrcc-glymur.c | 257 +++++++++++++++++++++++++++++++++++++++
>>>>>>>>  3 files changed, 266 insertions(+)
>>>>>>>>
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>> +
>>>>>>>> +static struct clk_branch tcsr_edp_clkref_en = {
>>>>>>>> +	.halt_reg = 0x1c,
>>>>>>>> +	.halt_check = BRANCH_HALT_DELAY,
>>>>>>>> +	.clkr = {
>>>>>>>> +		.enable_reg = 0x1c,
>>>>>>>> +		.enable_mask = BIT(0),
>>>>>>>> +		.hw.init = &(const struct clk_init_data) {
>>>>>>>> +			.name = "tcsr_edp_clkref_en",
>>>>>>>> +			.ops = &clk_branch2_ops,
>>>>>>>
>>>>>>> As discussed off-list, these clocks need to have the bi_tcxo as parent.
>>>>>>>
>>>>>>> Otherwise, as far as the CCF is concerned these clocks will have rate 0,
>>>>>>> which is obviously not the case.
>>>>>>>
>>>>>>> Bringing this here since there is a disconnect between X Elite and
>>>>>>> Glymur w.r.t this now.
>>>>>>
>>>>>>
>>>>>> The ref clocks are not required to be have a parent of bi_tcxo as these
>>>>>> ideally can be left enabled(as a subsystem requirement) even if HLOS
>>>>>> (APSS) goes to suspend. With the bi_tcxo parent the ARC vote from
>>>>>> HLOS/APSS will not allow APSS to collapse.
>>>>>
>>>>> Is there a scenario where the APSS is collapsed and still the ref clock
>>>>> needs to stay enabled ? Sorry, this doesn't make sense to me.
>>>>
>>>> MDSS is capable of displaying things from a buffer when the CPU is off,
>>>> AFAICU
>>>>
>>>> We can do CXO_AO instead to have it auto-collapse if it's just Linux
>>>> requesting it to stay on, I think.
>>>>
>>>
>>> Thanks Konrad for adding the display use case.
>>> Abel, we earlier also had some PCIe, USB use cases where we had to leave
>>> the ref clocks ON and APSS could collapse.
>>
>> XO votes will prevent CX collapse, not APSS collapse. CX also powers
>> USB and PCIe so that only makes sense.
>>
>> I think it's fair to just stick XO as the parent of every refclock
>> today and think about the what-ifs (such as the mdss case I mentioned
>> above) later - especially since we have no infra to take full advantage
>> of it today (non-APSS RSCs etc.)
>>
> 
> When ref clock have been part of GCC, then also they didn't have any xo
> as the parent, similar design we kept when it was moved to TCSR as well.

Perhaps we've been running on luck (i.e. XO votes being cast through
another device / clock as a second order effect) all this time.. I'd
happily move towards formal correctness.

Konrad

