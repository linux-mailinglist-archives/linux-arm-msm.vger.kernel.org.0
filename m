Return-Path: <linux-arm-msm+bounces-58187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F60AB9846
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B3344A891E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 09:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3D1225A34;
	Fri, 16 May 2025 09:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZefljwAr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E6622E3FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747386114; cv=none; b=eh7OhyKv+c14E3ATQAm2YlA+R8QTOeGzr0cElpu4o7FhMFybQTkPioGeHnpfA1H0tSqZlzX5BayDpNwH38LdDndV8tppU9VSgADjXqqkUy//ApXvV3TlwsmuFzenJqMm7xHLvhslXMljEwnjVDcSLHik9k8+48uyJAbhr8Sjiw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747386114; c=relaxed/simple;
	bh=7bT7R25mgjoEOCenNMiog5d8jmrLGzIX7hwwnkSWCAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1FUpERPIGy600EOkMRLafIDxU5QlPxQHW7JYEzi0RHc8W7KHBhbfjyMjSy8k5uaBQFkfQtRwvF2I7KOAKDOMHOjvMszjXpSbzyWf1p4gl4nh6drxFfG4uFAo715QeChmuBYWnHUjsvE2fFO0/lpbhvmqyG/KbTU5XplECdqwLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZefljwAr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G6N72X027951
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 09:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	crwjkXwm2Mz61rb2CTsqxEUEHdKgDUcWAhJbvyh6c70=; b=ZefljwArl0RZ+5yA
	w/twY6QCR1H5umDn0PkBv5sUhppB/T+ozvB+9nkuEo+7ucBaPG/yQloNRcXXB0CG
	Ot9UEY77w0Al8sVTW/DiG+4uvsUA5xBOeP3ZEcWigvO1FLaIJWWYrjnUmXm/96nF
	fuEVH7f8Zb038p1KfmJOiira5Kynnybz6BU730VNT2FW4RepTi1ZZ2T3loXhJ8/H
	mCe+6ziA5qwTxojmKzqjwhcB2732QPxK2D2kScXSpH6bHs201ThuwZgq5RJ6bjDh
	O9rUuvGpoqRC8cY47Ke75h8JsWRXZSg7dT07QHuUEAuxMcM7sdrtG2TcjN7zH8c0
	jm7Kdg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p01n0ee3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 09:01:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5af539464so50672685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 02:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747386110; x=1747990910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=crwjkXwm2Mz61rb2CTsqxEUEHdKgDUcWAhJbvyh6c70=;
        b=pYhIHTZ8291WSWJzoNpqp4MVEsTwIZULuZKZzIxLvwet7XSB3VU1wkVE0SSgE5sKya
         26R0d9v98roOs91mjtpWwlCk2vhBIDIUIKeBmTNJyzDQ9hQX28UykoKZkr6zzcDglANj
         0iyJowc76yrk+OEvOu5iaESO5UnP3Bb85cNTi+hjzffeKzZiDByLDksg3Mb6W0eyuQmR
         qadM9ext/qPmXD3She2wvN1kKAHrOL1jRzQuhUnkuhw/fmbQ6PSVZH1xpy1I/QoSibLX
         XA4PnmpJKeCCEtvqlgG5dlTfhE5Idpr69Plzfl5Qn1fmpkyBmA3h6862Da0GcaQHs/bq
         OeWQ==
X-Gm-Message-State: AOJu0Yx2id9g8RfNsH/nRVO6oGDMbdxCfHQBcx/uBgoXr8t8qJwbQyiz
	9LKA+VlDVnGOdex96rA6mTtiXZYmRBq2vqmU4pj6+B8ubsxNlwwYzaN/yjubrorJCZoA2gEVwPs
	gsyEeXrkg/QW/6o2We3LKwCtEUPw1MrQqOmOoY7N88+KjKFD8QcaioI6GXc97sZN7PZjG
X-Gm-Gg: ASbGnctU7WtRNmWBEoD/KMIK8lqMeQNSZNZsb4w7Q8q63b/xBK9Vp0ECGwCY6S+gKLN
	c8tFsP6MGV16lRs7v4Q4zS1Mtg/RWbSsuZS+cDkwfefxGXg11DJH1+PDo/ORC60VUeYKFnepal6
	8fZJ+whCfA6z80ATUD8azv6PM/zo9U/nGPkd4ATAot4tc9rwjU8CXYteioIJ2pkrxsqi2YeN4+G
	3cfpUW0Xju4ruP+AEFvEF5lRZUFa8LSMITgPSDG28ntnam76+cPQal0cGfSCZ7FqnY4gwc5PyvQ
	pei0xm518mr5pVt1dFrq+ISX4+9gkqpITHoEcdmDjDCCEfhwWsi0teM6mI2SZvWt/w==
X-Received: by 2002:ac8:7c4e:0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-494ae373c48mr13480571cf.7.1747386110027;
        Fri, 16 May 2025 02:01:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk5/GJR09r13nfBtnkiEoEavjVSinfCHNYuKjToVdC/aopOQxGYHzKPdlMHftGKbnMw1zIxQ==
X-Received: by 2002:ac8:7c4e:0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-494ae373c48mr13480231cf.7.1747386109485;
        Fri, 16 May 2025 02:01:49 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e745fsm1094479a12.48.2025.05.16.02.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 02:01:48 -0700 (PDT)
Message-ID: <5190dc77-3ea5-492b-ac52-8523d8188ab8@oss.qualcomm.com>
Date: Fri, 16 May 2025 11:01:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] clk: qcom: ipq5018: keep XO clock always on
To: George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com>
 <20250506-ipq5018-cmn-pll-v2-1-c0a9fcced114@outlook.com>
 <a3c3dbe8-b73e-40a4-b86f-ff9f371b1a46@oss.qualcomm.com>
 <DS7PR19MB888370ACC69E0A1ABC46D3BB9D91A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DS7PR19MB888370ACC69E0A1ABC46D3BB9D91A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M4lNKzws c=1 sm=1 tr=0 ts=6826fefe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=f-fEU4NQkEpfBDf4STYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA4NCBTYWx0ZWRfXzKJEt/+VWIhC
 uubqBCtZvBXkPcTnBkcwCEXe8c0fLUoaeMtfJZ2fYMd1+davW93YhkWqojxhh+vKLp9+iT2pi9z
 RPMuRm3+2CnKQJnk7FSobkzjACBK2IWQ1hj4ITthFTh81jCf6zc6UxtEdwFJULCe832oZQlz/yr
 ALH2YnJI8ow8QetOvLQp7BBLCBbeghR/gOB4Eobqmr4bLzQu9AJKvMvKsrwnYvXXFT61v1csUXl
 8Ct0XOwYkJ87s0EyWbNWxV+H5VsOGW8NMXVe2TadLz90i3ZCT4U6xjZVjCnbi0pzLg1J2Gs7EWF
 5ip7ih2j83jTCisaYd4m19738JOQpn01ALmwmXYuTeJMBnXOMC2Fqic7v+lXGTkZQNvpG5ppJSJ
 yPV+rtreElr/yGfP+37kZwnthRNSFoR5yBdv0A96Jgk88bfdDy+XvOteqTmQEH01b50PJo6I
X-Proofpoint-ORIG-GUID: _tEqzLl7BStqInekk-x96Sq0GZyhbbV7
X-Proofpoint-GUID: _tEqzLl7BStqInekk-x96Sq0GZyhbbV7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=981
 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160084

On 5/14/25 10:04 AM, George Moussalem wrote:
> 
> 
> On 5/10/25 01:47, Konrad Dybcio wrote:
>> On 5/6/25 7:43 AM, George Moussalem via B4 Relay wrote:
>>> From: George Moussalem <george.moussalem@outlook.com>
>>>
>>> The XO clock must not be disabled to avoid the kernel trying to disable
>>> the it (when parenting it under the CMN PLL reference clock), else the
>>> kernel will panic and the below message will appear in the kernel logs.
>>> So let's enable the XO and its source CLK and keep them always on.
>>>
>>> [    0.916515] ------------[ cut here ]------------
>>> [    0.918890] gcc_xo_clk_src status stuck at 'on'
>>> [    0.918944] WARNING: CPU: 0 PID: 8 at drivers/clk/qcom/clk-branch.c:86 clk_branch_wait+0x114/0x124
>>> [    0.927926] Modules linked in:
>>> [    0.936945] CPU: 0 PID: 8 Comm: kworker/0:0 Not tainted 6.6.74 #0
>>> [    0.939982] Hardware name: Linksys MX2000 (DT)
>>> [    0.946151] Workqueue: pm pm_runtime_work
>>> [    0.950489] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>> [    0.954566] pc : clk_branch_wait+0x114/0x124
>>> [    0.961335] lr : clk_branch_wait+0x114/0x124
>>> [    0.965849] sp : ffffffc08181bb50
>>> [    0.970101] x29: ffffffc08181bb50 x28: 0000000000000000 x27: 61c8864680b583eb
>>> [    0.973317] x26: ffffff801fec2168 x25: ffffff800000abc0 x24: 0000000000000002
>>> [    0.980437] x23: ffffffc0809f6fd8 x22: 0000000000000000 x21: ffffffc08044193c
>>> [    0.985276] loop: module loaded
>>> [    0.987554] x20: 0000000000000000 x19: ffffffc081749278 x18: 000000000000007c
>>> [    0.987573] x17: 0000000091706274 x16: 000000001985c4f7 x15: ffffffc0816bbdf0
>>> [    0.987587] x14: 0000000000000174 x13: 000000000000007c x12: 00000000ffffffea
>>> [    0.987601] x11: 00000000ffffefff x10: ffffffc081713df0 x9 : ffffffc0816bbd98
>>> [    0.987615] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000057fa8
>>> [    1.026268] x5 : 0000000000000fff x4 : 0000000000000000 x3 : ffffffc08181b950
>>> [    1.033385] x2 : ffffffc0816bbd30 x1 : ffffffc0816bbd30 x0 : 0000000000000023
>>> [    1.040507] Call trace:
>>> [    1.047618]  clk_branch_wait+0x114/0x124
>>> [    1.049875]  clk_branch2_disable+0x2c/0x3c
>>> [    1.054043]  clk_core_disable+0x60/0xac
>>> [    1.057948]  clk_core_disable+0x68/0xac
>>> [    1.061681]  clk_disable+0x30/0x4c
>>> [    1.065499]  pm_clk_suspend+0xd4/0xfc
>>> [    1.068971]  pm_generic_runtime_suspend+0x2c/0x44
>>> [    1.072705]  __rpm_callback+0x40/0x1bc
>>> [    1.077392]  rpm_callback+0x6c/0x78
>>> [    1.081038]  rpm_suspend+0xf0/0x5c0
>>> [    1.084423]  pm_runtime_work+0xf0/0xfc
>>> [    1.087895]  process_one_work+0x17c/0x2f8
>>> [    1.091716]  worker_thread+0x2e8/0x4d4
>>> [    1.095795]  kthread+0xdc/0xe0
>>> [    1.099440]  ret_from_fork+0x10/0x20
>>> [    1.102480] ---[ end trace 0000000000000000 ]---
>>>
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---
>>
>> [...]
>>
>>> +    /* Keep some clocks always-on */
>>> +    qcom_branch_set_clk_en(regmap, 0x30018); /* GCC_XO_CLK_SRC */
>>
>> this clock is not a clk_branch2 - its control register is different and
>> this call is incorrect - you can drop it altogether, as if the XO source
>> clock isn't running, the system is dead
>>
>>> +    qcom_branch_set_clk_en(regmap, 0x30030); /* GCC_XO_CLK */
>>
>> This one actually is likely supposed to be always-on too - does removing
>> these two lines do any harm?
> 
> removing these lines AND the clock structs works AND updating the parents for clocks that reference the xo_clk_src works. There kernel is not complaining about anything. The other option is setting the CLK_IS_CRITICAL flag. What would your preference be?

Let's do critical after all

Konrad

