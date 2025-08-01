Return-Path: <linux-arm-msm+bounces-67293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC271B17BCA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 06:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12B8F1C266C2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 04:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEDF1E9B1A;
	Fri,  1 Aug 2025 04:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PdC2tAoB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929C41E3787
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 04:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754022319; cv=none; b=HLb4yDI2NzJt3Lb6iu0ZtqOoq9R/klhLVCwTvwl+n1G4G2ZNjSZCkKm0nit9FqEzB/zH5wf3HF4hayBQu0eqoc5n0csjVxIgZ1RovyMz2wENRuYWBLqPnxUWudfPGSoAjYDLglV37YByg0iVNJpjQYy92/8yBw30DBiEg9HZNys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754022319; c=relaxed/simple;
	bh=uBlorlwIYp1hcEgGWzhSFeKrBrorhnWYZjy/YHECfXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rhKpZJl0u1MJW1UiHORt4TmZZ6hzcOrewVeQPMG9UqC7SGh6TLZ1C+KcZWiq/ENyUdB77Om3X80Y/QqdsmoMGJlyb0xdZUxE9IAnBb6msW2fox0PQQtIxQ9IIgh2ralOiU7CsKa/N9+zWt8ETuGb+EenHvZi4hpLNvtrgxtbk0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PdC2tAoB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5710rn3e022226
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 04:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zxRRtXcN5asqDedioHABDaioEx42PozHmsddFvNpWDw=; b=PdC2tAoBbSyWFYWM
	rw5Lpp581108vLB9AQws2QgTh/eSPipVej45NFsUmRGzJ6tFyEXfcmswa88EsCq2
	4EOszvfsXOQnHHcHBVVCFLhQ5BxUlPJNmXxO0S1R2DziK0LcLxt778KCSkBnJJq3
	ijPWIpu7tlvmdkWbEsuPfK+AK62CCG0cUqKYxakY/NAC0NAlYS5xjB74v/py+57K
	HeW2cbobabX4iWoriuZsgoCYy6o82hq20HOE9oMOhDM5fQ6qNk1RTX83D0o06CeA
	fl8r6PuWmEhF6MRwqZT4FMAJlDFv8Qw8AwDxER87Is3Pv5czgIOpqm+O+9Pm0Z3J
	dSumuA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcrjj7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 04:25:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23fd8f85dd2so10014035ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 21:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754022315; x=1754627115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zxRRtXcN5asqDedioHABDaioEx42PozHmsddFvNpWDw=;
        b=N/smO8CP1AoAQLitIAvvUTWncyC7Ku6Zc5I/BGjZvGptq6tkAxLwxTmNKV3JHuQDDT
         0oHHehBh3EOiBuxuyfPIDbzDB0ZE7vsC37l03stFKOtDnT0jXDiF9BPzvTcr62qm5KS8
         NVGB/5ArIhKtx6X2KNkRbn9cOi+TDEMPx7a7lVTgbD9piEdMjUHxwQiu0+dXVnQHVJx+
         GMk2gWELEWnSMobSP/4REt4coBLhcxMqwdI1HrKiN8hulWX+8DsbbWLvHQg36v08AVZD
         zo6Rq8KOnktqZ64qndFnGpJos//vgBntsxX7lPpSfHq274QS/fHqGKOXDW6aEKsw4DdS
         uZvw==
X-Forwarded-Encrypted: i=1; AJvYcCVIDpcN73MJ0kfcjMNDp563agdHLskRA4Z4uFNFFIjkpBWTWJpjmf//mr/qSrC2pM7Ku/j9/AdhXvt2kkgX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa6rUwl05NQ1Zx8UK8D1BlVRytu208jGglJ19EdyETOl0RZoVE
	up5uy8cWoKZs40Vpdng3qyhIeL+n6rO+fxGQzDMZu2ov4QQToRlM8Ob1/PHH7vuw08/IxoBgn0s
	VDFB4sza91LEXR2TQVTUYsLebeLcJNh7QUOG3Q2B9XHucNrCyLR/05Xh/VRAMni7NKIVe
X-Gm-Gg: ASbGncvxIGlVnv9UhuAd/AHalJDcYfWXrTtWWDL2V9hEIpkOQleiqRIj09Xp8ES6B5j
	YRJANpsCrYzYh6riKTr5TaS5lsLrtK3+LIBZq6LA/i2jwGxviDf1c1ldhzOkQaorlznuUp6cQN2
	fjM9JBH2zKEzX+nP6IdgADTtv3GTgf4LtWQRUdEXsD4+MNPEMgj4mW8K01K85SYeo3fweWsgbeX
	jYXWYCJtdLHVSA3SoihsfOuNJZYFz3nXDV09Psi38G7K16tlwEzssNCo6LTrQ0ptCFV5TMcVBLp
	y6qXtsEbCH/q9lHmw0p+p1bWpb/3mZu1jtqtv0nxAkkslCLfUc7OacSBVgqbWZO0ulE=
X-Received: by 2002:a17:902:e810:b0:23e:3bdf:e3bd with SMTP id d9443c01a7336-24096abfe73mr152705965ad.22.1754022315087;
        Thu, 31 Jul 2025 21:25:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzY+vcz3mT6FLuRg3s6hOjW8qEGzR7nQiQB6+tGHCmk4xO2hr0y7gSoPjaDxIHjG9/RlVWqg==
X-Received: by 2002:a17:902:e810:b0:23e:3bdf:e3bd with SMTP id d9443c01a7336-24096abfe73mr152705565ad.22.1754022314647;
        Thu, 31 Jul 2025 21:25:14 -0700 (PDT)
Received: from [10.217.216.26] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a917sm31713485ad.116.2025.07.31.21.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 21:25:14 -0700 (PDT)
Message-ID: <2b802703-5214-4103-a1ab-e4c26a18ebb7@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 09:55:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-7-227cfe5c8ef4@oss.qualcomm.com>
 <25uelsjuw4xxfopvfn4wvlj2zgivwbjprm74if5ddwvht4ibfz@yctc2kvfmxyw>
 <8b30c83f-5f35-49d5-9c37-4002addf519a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <8b30c83f-5f35-49d5-9c37-4002addf519a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDAyNyBTYWx0ZWRfX8qbfzeMBY9M8
 0t0G+TdB1uTvIsK0YbQWBqn6ljzdXXR09qGuQt1s/4CYxkLAGdbWU3h7eAxmLz/f3Pry/N6fjPq
 SM/N5+JHLkpz61rjG8TNlSo3DD/TdL+ZF9ahCMv8a9jZ1OTByZ0Hlqpea+Jh2O1Cu0i+tgvEiXV
 AaQQTb+qFsY0peNr1svjPI2eQfM7n9dFDM0yqbZzJ9rgSSHz4Ia9AAOSJxSO2OYT40uZgJ816gL
 G621ZpNUt8Ddnib8xJj9jElQbSmVxu/GXq97ahUYcXj40XAcFjWule7stVh+NYOPRD2iGWdyrTj
 OcDTyL8LL3B+KVYV3JkykQiukkS4ChlAOtWXaUX+AnWFvHmZ2aLfWs6x5MUSnG2fFIt1/DvjFSP
 ZCrRgwwBJu/mQz8O/r+9n80cwlVjzRCgJVIPM3Q474vEdGIjyYomG8FRBC+jVmdM9UMTtCnT
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=688c41ac cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=-exJQLPiCZ_865CLFvcA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Iz_kCXzpy1bzCA1Hn1zG7YsXV6UIvrmo
X-Proofpoint-ORIG-GUID: Iz_kCXzpy1bzCA1Hn1zG7YsXV6UIvrmo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_04,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010027



On 7/29/2025 4:19 PM, Konrad Dybcio wrote:
> On 7/29/25 12:48 PM, Dmitry Baryshkov wrote:
>> On Tue, Jul 29, 2025 at 11:12:41AM +0530, Taniya Das wrote:
>>> Add support for Global clock controller for Glymur platform.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>>  drivers/clk/qcom/Kconfig      |    9 +
>>>  drivers/clk/qcom/Makefile     |    1 +
>>>  drivers/clk/qcom/gcc-glymur.c | 8623 +++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 8633 insertions(+)
>>>
>>> +static void clk_glymur_regs_configure(struct device *dev, struct regmap *regmap)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
>>> +				       ARRAY_SIZE(gcc_dfs_clocks));
>>
>> Why are you doing this manually instead of using
>> qcom_cc_driver_data.dfs_rcgs ?
> 
> I guess that has been merged last week or so, so yeah, please rebase
> 

Yes, sure I will rebase on the latest changes.

-- 
Thanks,
Taniya Das


