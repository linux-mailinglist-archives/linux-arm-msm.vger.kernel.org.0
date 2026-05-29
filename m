Return-Path: <linux-arm-msm+bounces-110239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IcjENJbGWoLvwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:26:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D687F5FFEA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4B9B30BCD34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD183BE165;
	Fri, 29 May 2026 09:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HBmZbytB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VW5SAnLX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42283BE621
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046643; cv=none; b=r8n3R0oSrFTaDLNBUNdOtnzHle9XMb/YWJErl1R1tbIGa2GayzBhjq8I8SQUuyyhx4l4TnYvnktMjw77faTiiCsy8yfsdg08isRS9cKPXjXBibAq9uSDK6LiNFlQbU5zibt3wkwewnv5PkKaExZEpmc5skNFnMK2MjwyOhsCthI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046643; c=relaxed/simple;
	bh=7WwBKS1M/wBUf4arKHMkA5omOSnWFfX2YFWcPtGUqkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ajxAP+eNjgwcePZq7kun813prsu3pzW8WjY0gxlrZ3zHOiLC6OEYg3pkNHAwP7TtaQ8ZttZH15zl5KaJh0fokeLIdf/pKuImlu4cCiNerHgRpMlEMH8ragtZeyNvAbVLJAAo+zzH1N2pkZ+I6NfnB70JIH2ljKNMle3dAq9nBB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HBmZbytB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VW5SAnLX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T7o4KC2258002
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lpeQPgTrvIhavHW0wtw/TbA0KBZFSR5xGJTjRObwYk=; b=HBmZbytBWouh+G3M
	kfq81FvTag64vH5+gVxDqV2kO1C+0H8gqFmDj1puKQV2JZ3JGLoZcct4iijKZvrX
	IolpGUXnBNausQDraXQbhrVjinGE9wgiPtsSC6MDvO/KUFu3em5qLi9+iug+uK62
	nZ3TCpdzqGe/rTen0M1e+l2Z4FpVi74itdMpkyLqGQbXDLVklYfxQjV2YjhsSTUl
	pOSgjTy7HXk3jh2WM/Lrwf7qZlztH1wmE61Dw627D4pEVfGthy0eEqnPydZjbiba
	L91Vb9McL78SPFNqJ207ftoEQ16YmRnqaOebWffNEkcATCTLznQ7fPM2SoKpixke
	s7PiXg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety53ae7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:23:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baedd2fd43so97922825ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 02:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780046633; x=1780651433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4lpeQPgTrvIhavHW0wtw/TbA0KBZFSR5xGJTjRObwYk=;
        b=VW5SAnLXa5jgCUttO6/J9ocQgTM81r2OBecDnxWFBVVG6URWUPNBiHEW/iv2b6K7zp
         AxjNzmbL/a9dpq8bJbK7PQXSu2h7KcPtP+JHH0Do4tj7EsweyNGJ9RR+nvK78eslW6g9
         kTcg4wnrazUz8LNEiM+fIFVhU+jY3cSZYffKn4rosPtFfFkkWPhKACWRgo6XHCTAk2mn
         BJTRTKUoWWtVhljcC6TKW5faIe07Fu+OLSi/NyGN2XbUQ0LsRfgZoPFNBpkwmpQBGePV
         zz7nNag3QgTMWnlu7kAHMj2/fiYdPFuiwy0DeVbx8m/4DD5M/NEy497xIihuYDVEgkul
         3d/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046633; x=1780651433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lpeQPgTrvIhavHW0wtw/TbA0KBZFSR5xGJTjRObwYk=;
        b=p1dWkF/9zFBEvyvcMG6CQpeyruv/h1/9G0RQwVnO9QHKS+6UH7mMlrD5FxxNTRr2pa
         iF7gPKIihZGN7KSQnu9EcvUAWLXxvT9jwkeLR70vV4nqSJ09db4mN5Bmx063Hui+8OlR
         +GI17ZgMO/ac04qa3pQBVyIFvzr+Y3m4lUXrJepS35S7mE+n1LzSlrftTWj43Kf9temK
         UClDqC0SUJyySEm4ai4bWTQljRoid1SLQ0vcGJXMYZt2Go4Mlf4UwVsInBrH0Kz7DKD7
         W8pkVwP69pA3DxQJ8i11DJTeeL6wGoINro6pwUFgnxOVPluoymIxUaiWQYTvEjG2/3fd
         FPXw==
X-Forwarded-Encrypted: i=1; AFNElJ/V8iVySUrseAoXpHgV5vxKjG6gOSDGwjf6KITom7tCl/Ne2CnhpwrNLI4iHkdQl8hGX3nSgaMocg1Gfm5r@vger.kernel.org
X-Gm-Message-State: AOJu0YxSATePY0Zi0g5peb/BMA6SVNq6XJ1u6NYdrjyroYih0I5G45SZ
	rHu50HR1OAjinK7N2V1+tGb10gGl/vrntFkHbUacgH++O6l2d8A40tF9GyHpzl/KdgDa84iX20U
	vhd3wVnJU6NWG412zl382ieDWzZwS2giC5UgYL2A7V5I5LXosgO9totnCpPGFfMW26pvH
X-Gm-Gg: Acq92OFJQEpV+rsebKYvHX9GcPt3vAd6cyVjEJNdjwyuAretcP0n9gM4HIHGK3dT7+2
	k8Dbpe+ZYuFvmy1Rv5S5G3tfsO8yYMfutES8iGh/bCm7gT5k44inJ/zrF6jktgwr8GXvG71GWJ8
	F3Gm/GkvO1lmMQ2405d3dnW7ksCELYwyqVaYuOqtZWOJq3k/jhtbTOBZ52dgaVbZwT5ajX9lYYB
	e8cUK/3od2OeTBv2fw7Je+FqVc2x1JwDJriZ1S7ZxTSNEM75bLAHizMyxMSvY0xnpYHG3bMJWG3
	lkgOiAvWPj8vZxlKa9t3XKGgBw8o+G7kTyWvLMqW+bXi36gYAyIihFKgCyuJjayMsyDmuSVkum2
	1brYlAqcCreMLZTfzJBPX9C0TuOngPsmtv9JRsuMQfyXiGl/gB4A6GqqmOjXrAw==
X-Received: by 2002:a17:902:cf03:b0:2bf:25a4:b6d8 with SMTP id d9443c01a7336-2bf25a4b7c9mr14838355ad.10.1780046633398;
        Fri, 29 May 2026 02:23:53 -0700 (PDT)
X-Received: by 2002:a17:902:cf03:b0:2bf:25a4:b6d8 with SMTP id d9443c01a7336-2bf25a4b7c9mr14838075ad.10.1780046632888;
        Fri, 29 May 2026 02:23:52 -0700 (PDT)
Received: from [192.168.1.2] ([117.192.250.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c5c772sm11927515ad.84.2026.05.29.02.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:23:52 -0700 (PDT)
Message-ID: <937bc3b3-bd38-4df4-bee9-c68e83de3ff6@oss.qualcomm.com>
Date: Fri, 29 May 2026 14:53:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] clk: qcom: dispcc-qcm2290: Add support for
 Qualcomm Shikra DISPCC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-4-953f246a0fbb@oss.qualcomm.com>
 <qumelrcom3wxzgcibou6vmw2jc5tushr4z2tvmudflgpiqin7w@raf436u5gksb>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <qumelrcom3wxzgcibou6vmw2jc5tushr4z2tvmudflgpiqin7w@raf436u5gksb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA5MiBTYWx0ZWRfX1WobexsbNjaV
 XkaPW5i7UDdFNPaLrXO7sIlozEDEkBjxhAn6SNovU6C25ZqwZGFWMJEA9R4rWrGyjQNN6EPcoTO
 5t4MOB61lpe0+rZXGOqRt3Msnxs1vE9F3dRZRFJXExie9bZkdIY/MKI8uq0D/K5ShobalnuMP1q
 zDcByHLgJlslckTqmBHTWaaCit3PdBal26nd1942juASBQ7+cIKOM/6B681rm9UusXb9lZWNMOr
 +r2HGNJ4QDK7PsOTeaQyd9cxndit7+hQqeALDxyAI1zq2Ci7myd9jCi4HkCSE9sgOJEpM8frgcp
 JEY74C+O4Fu0IHChS9SMDbFnod1SDqltbyO5v1VwmJRQ0qJ1/5r8SkCNfiEsAhrOB8YmiJCeVrk
 ioQP33lTxuGkwULUAVsWcJeJS+X/O79zKYJqKjbQOv8zGS2+2t+KU0O72401PAooYpWN3SIig/I
 cfyIRup9Eq+ZdvP22yA==
X-Proofpoint-GUID: vU6jQytsB6TonCQztzary45HQD0mNUkT
X-Authority-Analysis: v=2.4 cv=WaM8rUhX c=1 sm=1 tr=0 ts=6a195b2a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=MYhr4v4WboA43l5+MyccHQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=M2yKb8xwfWg0M4Fo7NUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: vU6jQytsB6TonCQztzary45HQD0mNUkT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290092
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110239-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D687F5FFEA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 28-05-2026 07:12 pm, Dmitry Baryshkov wrote:
> On Thu, May 28, 2026 at 03:37:05PM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
>> but has minor differences. Update the parent data of mdss ahb/mdp clocks
>> accordingly to the hardware clock plan and correct the GDSC *_wait_val and
>> flags which are applicable for both QCM2290 and Shikra SoC, and add the
>> support for DSI1 PHY source.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/dispcc-qcm2290.c | 18 +++++++++++++-----
>>   1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
>> index 6d88d067337fa132114b0d8666931b449f86de17..19c997f3fe9f197d2c252a9dd1e8169947200f5f 100644
>> --- a/drivers/clk/qcom/dispcc-qcm2290.c
>> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
>> @@ -2,6 +2,7 @@
>>   /*
>>    * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>>    * Copyright (c) 2021, Linaro Ltd.
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>    */
>>   
>>   #include <linux/clk-provider.h>
>> @@ -32,6 +33,8 @@ enum {
>>   	P_GPLL0_OUT_DIV,
>>   	P_GPLL0_OUT_MAIN,
>>   	P_SLEEP_CLK,
>> +	P_DSI1_PHY_PLL_OUT_BYTECLK,
>> +	P_DSI1_PHY_PLL_OUT_DSICLK,
>>   };
>>   
>>   static const struct pll_vco spark_vco[] = {
>> @@ -84,7 +87,7 @@ static const struct clk_parent_data disp_cc_parent_data_1[] = {
>>   
>>   static const struct parent_map disp_cc_parent_map_2[] = {
>>   	{ P_BI_TCXO_AO, 0 },
>> -	{ P_GPLL0_OUT_DIV, 4 },
>> +	{ P_GPLL0_OUT_MAIN, 4 },
> 
> Why?
> 
>>   };
>>   
>>   static const struct clk_parent_data disp_cc_parent_data_2[] = {
>> @@ -101,17 +104,19 @@ static const struct parent_map disp_cc_parent_map_3[] = {
>>   static const struct clk_parent_data disp_cc_parent_data_3[] = {
>>   	{ .fw_name = "bi_tcxo" },
>>   	{ .hw = &disp_cc_pll0.clkr.hw },
>> -	{ .fw_name = "gcc_disp_gpll0_clk_src" },
>> +	{ .fw_name = "gcc_disp_gpll0_div_clk_src" },
> 
> Do you realize that this is an undocumented ABI chance?
> 
>>   };
>>   
>>   static const struct parent_map disp_cc_parent_map_4[] = {
>>   	{ P_BI_TCXO, 0 },
>>   	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
>> +	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
>>   };
>>   
>>   static const struct clk_parent_data disp_cc_parent_data_4[] = {
>>   	{ .fw_name = "bi_tcxo" },
>>   	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
>> +	{ .fw_name = "dsi1_phy_pll_out_dsiclk" },
>>   };
>>   
>>   static const struct parent_map disp_cc_parent_map_5[] = {
>> @@ -153,8 +158,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
>>   
>>   static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
>>   	F(19200000, P_BI_TCXO_AO, 1, 0, 0),
>> -	F(37500000, P_GPLL0_OUT_DIV, 8, 0, 0),
>> -	F(75000000, P_GPLL0_OUT_DIV, 4, 0, 0),
>> +	F(37500000, P_GPLL0_OUT_MAIN, 8, 0, 0),
>> +	F(75000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
> 
> Why? It's not mentioned in the commit message.
> 

As per the HW clock plan, the ahb(parent_*_2)/mdp(parent_*_3) clock RCG 
parent must be GPLL0_OUT_MAIN (gcc_disp_gpll0_div_clk_src). Updated them 
accordingly and mentioned the same in the commit text below:

"Update the parent data of mdss ahb/mdp clocks accordingly to the 
hardware clock plan"

Will move these to indices approach, and add in a separate commit as you 
mentioned in the other patch comment.

>>   	{ }
>>   };
>>   
>> @@ -450,11 +455,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
>>   
>>   static struct gdsc mdss_gdsc = {
>>   	.gdscr = 0x3000,
>> +	.en_rest_wait_val = 0x2,
>> +	.en_few_wait_val = 0x2,
>> +	.clk_dis_wait_val = 0xf,
>>   	.pd = {
>>   		.name = "mdss_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> -	.flags = HW_CTRL,
>> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> 
> And this also needs explanation.
> 

Sure, will add these GDSC fixes in separate commit in next series.

Thanks,
Imran

>>   };
> 


