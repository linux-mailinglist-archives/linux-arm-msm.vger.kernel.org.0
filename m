Return-Path: <linux-arm-msm+bounces-79560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA1BC1E64C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 06:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B2FC18951B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 05:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE66309EF4;
	Thu, 30 Oct 2025 05:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CFdXuMa+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FfjhIbD8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B473B2D8DB9
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 05:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761800838; cv=none; b=rutQJ6F+IpCf3JJeyF/pmEAlbj2n1j5zWgTjGW/CYbnwdK4wucxxI2+SxMaIwJgeFs9P4OkEtjInylAWYQoyhyInbL566kAY7jbTCO3neCHUDLIKs4NOrqNqwhCGrWei+fQuS0HcsVlASHHoyfBF4mtnLz9FtP2WE3n4yaz2ABo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761800838; c=relaxed/simple;
	bh=2lp1dpBpdb+VIBhALkPgOJTcU6kbV3cHuAM06I08Z5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZGNwNYlef9IBQSdGOkzbNWF7AK2uTofyKPWuQpA1zy/vLL4OMJK+gwcxAIGD27OWuMBIvhDCX7bUG3KqLCt6dHPTo5vn3RgmccjXArGa0HeYyxIuAfR3CmDymdWqyGEk52jdeCai2/VwsPFdEzWzuAHGhds9wsMncPpbPEgDRCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CFdXuMa+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FfjhIbD8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TIs5gQ1325181
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 05:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBRGR3fYkDhVv3wALMPkIO3OdzVQ9GPRP/byh44YZiA=; b=CFdXuMa+S+r9kCC1
	EashrTEWQ9vGzmUE9Lolf7Mu8fnPHiY8jnJ1hcUWjEst2fmZP64kDMXZSFU0nuT7
	Qh6h5RZM4F7TIIbMcuuWTcHgjkP1QAo/lmkwWPwOuG4SkXZUhqSr2c7FBVoxuslm
	xuQOVFyRhaV9uqZZcGKfQmPAizZx0qKsrJYNfMhad2LR/x5FTdcdC+cuAK1j5efd
	kEyVMg9geBqaUXpVflAvgl15YAsIETZGR1BSOiyHakIPZzcR2KuOK+K9SLLl7EH3
	4ugH8pqH33SKYPdkTB6IBDkVknxvN10ukWlvdinAdrllAx5PbkUDqgdpe3sziWoZ
	0W2p5g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3rkusgwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 05:07:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6ce25bea3eso438803a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 22:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761800834; x=1762405634; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBRGR3fYkDhVv3wALMPkIO3OdzVQ9GPRP/byh44YZiA=;
        b=FfjhIbD8yBNpCtzux6X28P7W5SvT8SzUbGDxLRmzIb74iwIAz7E3bjYcqvb8TGxtG4
         P9q3w96+gOIMV6nFxmYvBcRYP0+FkX5ZhLMBH6aF6cM9A1pBVXytvoooeBCD2x4s94ag
         1j2+ObATOf44eYlGDo/hDNK29P5jRoOIpXNeL9LAkUntn6fGUfbth34XmLMsEBp72u8T
         6lGxJq7OGi1WYRKsAjT/ziYIc8vl4jf5W6NvSFDK6y6MSprd6noVANgyO9vnZ+SiKlSe
         Y1DFjndTgflTc3xihDqBVmCK0B7KK/YyrC/+nBkRuVjBz6Z6wU2JeAabjStW7GE3CzdR
         o/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761800834; x=1762405634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBRGR3fYkDhVv3wALMPkIO3OdzVQ9GPRP/byh44YZiA=;
        b=s7L7tvKsAzAiihfkk5q5Hw9vmSp0g2DO05x0m27HmLq/3SJQ7DshM4/xBQLLPLUCdM
         OtxR5n4Ham3DxO7139cOZ8iMsj/pEGkmSvzeFygORIawMCzpfZCyNzfBZEyIhO2oB5W1
         T2a1TuceaS1bukHrfIMTZ8l+thwikSMPF2P0QVcihbAqILsK60qvlZHrbAa7zWDshgFk
         2pFw5I86+IAyOHZ2EkSluyuR2B77saGsdztKb21ZWKMhYxUinxGwSG8hc6efiYj3xtwI
         FHCEmvxDEsbBSgpGV4vUy0tJbrsstDHiW2/P/uPVjfQR3HlzyZiO1N8NfITy6kSLaGof
         49Bw==
X-Gm-Message-State: AOJu0Yyu9NKWQ/ySgiH9I4F9yJaWXjgZCTp0p0MYK2WtlwzdXdxXqaox
	8Iwtn6it8agsa8T2XWmwy0mkYXCMCS3J9ltsAuT9r5MyFxdy/3e7V8lrEGd7OOgm/VdyHAqsMrQ
	kY/1td8fzBk9bVMTkFX4sSvxmrIxdHQtBneZYjrLyvEvuuWTenuA5ykZ90lC88t4Mkslq
X-Gm-Gg: ASbGncuqB0mPaPwytQvNzPNCRelk2+d/M4j4d1Xn0WQkMh0R5xENOGkp/d1fmh7s3Nb
	5tQVkUOT5Al1WKMlui7VGfypESq9tf7K2ylzP1nbmLIG++i/l55yWLfv1schKJQMXxHVYD3T/8D
	v7KEioG//TMt3UGpYhmM6wIQNRrVUxHl7NNZt+hqJlYNK/LqSe6MhI//YeU7gHlx05lrbwCPnnJ
	gXEy06RDC3I8+bpJrV5QiX+gXsgI3cbARX5UES8NAVq+BZfTYC8IMMo+vAApjXTsxO1r6W4P/Ot
	oHhFERw+hzVNp2IrPc52yHoRIla/RLnEDfYMFdudygXLFlksgklgoSlyr7HFeFQzkVYArmjIkWD
	4ZOeWCI9srSZSXenickrjbkS2QA==
X-Received: by 2002:a05:6a20:7d8b:b0:344:a607:5548 with SMTP id adf61e73a8af0-346558e31a1mr7679722637.58.1761800833633;
        Wed, 29 Oct 2025 22:07:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIAPrNETa0XpbAVLslde0fVNWgcT16R6XsCvHpD0bc5qutcP0FWjIL3nluvW3altB5Ks3mPw==
X-Received: by 2002:a05:6a20:7d8b:b0:344:a607:5548 with SMTP id adf61e73a8af0-346558e31a1mr7679690637.58.1761800833131;
        Wed, 29 Oct 2025 22:07:13 -0700 (PDT)
Received: from [10.218.35.249] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34050992e91sm995306a91.7.2025.10.29.22.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 22:07:12 -0700 (PDT)
Message-ID: <eeaa5b62-c4c7-4a30-ab88-729e0d17b027@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 10:37:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] clk: qcom: branch: Extend invert logic for branch2
 mem clocks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com>
 <20251024-sm8750-videocc-v2-v3-1-6286bbda3c8e@oss.qualcomm.com>
 <fbab492a-e279-4ab1-91ad-2b4000f7229a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <fbab492a-e279-4ab1-91ad-2b4000f7229a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bPyz_QaZG5LLniAZ_Gt7ChnOKUvSsF5h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAzOSBTYWx0ZWRfX293fnOyLOFzc
 fzj8Cnf1ErDVmViXUHC0gC545umKvSg7VcR8NNdxAf6CrGIS4qGADGksiPu29L5gu5VWnwKwl8h
 k7VAvSoG2SD7hn6+KoukcOpA2b8GbC9/fWS08+Jb0TU083JOWGVUiiE4ivUWghY9BSFyRXH6hi1
 uO++aLDJ7Co+902Qw938MXbhCTnRCq/G2eSIQ0cgBPJ88v4xl7zQPlgsTuZ8kLjwhRQmevGztfl
 WOruUMLKFiaGZiKgzOkr2rXNHwR8HyslS1W/RCsR8awYBCSRAgh9wcoM3XyGVXzFuR/P2dID9XK
 xHFBVEtsGMHNmAbvmVnc3kMOg5EBuKovfGDOg5mde+2KVXl9zltTan95tW9JhrwdykneGfZcrcb
 YPn+M/oXLMoLhpl3Tic0kKTD2XfvvQ==
X-Proofpoint-GUID: bPyz_QaZG5LLniAZ_Gt7ChnOKUvSsF5h
X-Authority-Analysis: v=2.4 cv=adZsXBot c=1 sm=1 tr=0 ts=6902f282 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hXX6ih-wtv-b7etiIDcA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300039



On 10/24/2025 2:09 PM, Konrad Dybcio wrote:
> On 10/24/25 6:24 AM, Taniya Das wrote:
>> Some clock branches require inverted logic for memory gating, where
>> disabling the memory involves setting a bit and enabling it involves
>> clearing the same bit. This behavior differs from the standard approach
>> memory branch clocks ops where enabling typically sets the bit.
>>
>> Introducing the mem_enable_invert to allow conditional handling of
>> these sequences of the inverted control logic for memory operations
>> required on those memory clock branches.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/clk-branch.c | 10 ++++++----
>>  drivers/clk/qcom/clk-branch.h |  4 ++++
>>  2 files changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
>> index 0f10090d4ae681babbdbbb1b6c68ffe77af7a784..4094ffc53d0c91dfa9e4263134c3a996100ad078 100644
>> --- a/drivers/clk/qcom/clk-branch.c
>> +++ b/drivers/clk/qcom/clk-branch.c
>> @@ -141,9 +141,10 @@ static int clk_branch2_mem_enable(struct clk_hw *hw)
>>  	struct clk_branch branch = mem_br->branch;
>>  	u32 val;
>>  	int ret;
>> +	bool en_val = (mem_br->mem_enable_invert ? false : true);
> 
> " = !mem_br->mem_enable_invert"

will take care in the next patch set.

>>  
>> -	regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
>> -			   mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);
>> +	regmap_assign_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
>> +						mem_br->mem_enable_mask, en_val);
>>  
>>  	ret = regmap_read_poll_timeout(branch.clkr.regmap, mem_br->mem_ack_reg,
>>  				       val, val & mem_br->mem_enable_ack_mask, 0, 200);
>> @@ -158,9 +159,10 @@ static int clk_branch2_mem_enable(struct clk_hw *hw)
>>  static void clk_branch2_mem_disable(struct clk_hw *hw)
>>  {
>>  	struct clk_mem_branch *mem_br = to_clk_mem_branch(hw);
>> +	bool en_val = (mem_br->mem_enable_invert ? true : false);
> 
> This value is a boolean already, you can inline it below
> 

Will fix this in the next patch.

-- 
Thanks,
Taniya Das


