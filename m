Return-Path: <linux-arm-msm+bounces-110237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJENMvBbGWoLvwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:27:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEAA5FFED6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 137E5304AA00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC31E3BE641;
	Fri, 29 May 2026 09:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="niPMPmoR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aE0ht9vv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF0C3B8948
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046611; cv=none; b=uGz39G6B2JUHxEM2KmscDJEvMCnH1MVXKw7zJqRcSeFRwhbn61j8y38HKUraXCXSS6NgLL5/B/jByGAU69O6fvi8taNhfogPPXgYUIIRDeXlZ2RdvIrRPJpPlPWcKUDaHR73K3nsyB6PezTg6WQWLcNlwJc8snN1OQmW5nke1vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046611; c=relaxed/simple;
	bh=yt9kofHtXymnCD3EaxDm9NSlVafZFb9BX3Ubc3k6d+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZiyhwJXlN0YbRIEr1eTqh6bJPGLPQ7x5SM23KbLbXYpUrgVin/i6a/3gX6JAUkg9WDdhwPb42IBO8YwSueMQNPnnQPdS1z9sD53vqxd+sZh5KwdXnWt3t3E+4Pe9ndhx4i4hHf/FKMcfi3gMapOpqmJGwmpYstQLi9RfILRMQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=niPMPmoR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aE0ht9vv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T7394N1829458
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3zDoPS3x/Gc4pwXs4/RNUn0CZZ7DW6X64Lr58N9+UAc=; b=niPMPmoRauZBlTrv
	m8RfLSNlAgt7KOmoLDjYPPcT/w25mTt/xuN1Dfbvgj3lDJ8ayDRUpiwYU1BWjTxG
	vun7H9ateoEQNeJaxeiV5DR6SCKyr5HYUm2eZPLsfjFI6KCb1y0E8xJ0OMCxtreJ
	HhNbivdpJnvDNauPolteq+AzjNqDsC8jzD2CdOBDmByx2JrjH/zLprmfm10rLNqB
	ICbVDqr+9z0ptyQar8RZYs8+Psspol4CgU2ayJa3tylZ9ZhDFvGvbnKwnOQ/pf4Z
	NSa+CvenNiQqyfu3Jcn1U9DEttYgLpqe6amn4+khYDo9XxnGWDpZVUJb0Ecb430a
	lG9DOw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eex6m2hsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:23:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-835423c69ffso7287795b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 02:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780046606; x=1780651406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3zDoPS3x/Gc4pwXs4/RNUn0CZZ7DW6X64Lr58N9+UAc=;
        b=aE0ht9vvLWztZ8y0axGMIiyf+BR78iwR3CLv8tseCJ3f5Ma2jJwo4DzDcagNz1Wpap
         b6RoJBeZLH4sOY68rSvFftnXXlJwYfR7vk3JqR+lBjcV8T/5hqdl+5SlIpCaR6EsBb45
         mEYjVTjLeXG0r51TasJgJv0UIv1RxdpUDqtW3ONIZFHoVrYbKledbD+XiIDnSxFA4yM9
         AmdpbPZt1BS+DrE79O1ZR6pi55ZuoAFrgy13ees/ULxXYA+g+XSCAzPiYde6TLB7SRNA
         TRqk7vu/9+WwIbAuCKchRzFud4WEPzsPFfLyu3q0ekSV+3IgtUL80xFPkiqG245cLq0e
         x17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046606; x=1780651406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zDoPS3x/Gc4pwXs4/RNUn0CZZ7DW6X64Lr58N9+UAc=;
        b=kas79/UX6kE+hrqFCB23zaRjuSVIdxorBVDBrfQiqWX+l32g3TTFbZrs6gARRFNNdV
         wUplnLT8TewCD1Hj6Fo5HTR62A9I8LX4VaGwkfsQhD7m0ffba1p3yxzv/bg+0GgC1Iia
         1kvZhKOUtbuaY4Ubt/BfM5sOulcJoD/ZDRL0D+usn7kpVHC/UcCVoJgdreMoTIpDRkVg
         N90OcDFRT/24750qO0txbPzCfCwdMqeRzti+eUoJUuyGFaJ5jzZxzUiAk8uuWL9WZvHz
         ODt+7xIBr7MKFHuvCK3UStnXfRy3ksaMPgVQQwK0Qdc7Vg3csVfHldj2Rk1fTNCgvBc8
         jPLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VKOG5aK8VprWIacBuBp+SD9JGM8WjOiaxUeTjvq/TGeX9NT0NXhNgTOaNeQkSLbAJy2jnjF26/sZhHr8a@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5QqFylwVt63rsXhQD8T6kbQGUgDdX9cHUZF3yD/4n8BwNwQN/
	BzFnhweNc5L4jcWPzbQIZFpX8dzhDCJbAOmirbxQE8qZi8Jgq6dn6lw0xIaf9hsa5jndIYt+Sbe
	QYJF+EuO2S2pkBSTLpPYNe+GroS6Yf4BsGFmd7QgUk0GoYdtyCyNZSgoIDIUCtqFCIKX+
X-Gm-Gg: Acq92OHQBbsnfWMHEVF4K0v2BbMQC63qzbWBkhDZ1nXsQz8sixtNCGOIVv6rvdLGosO
	8VK6ECKjAn07FYxefYjU4KAAybR25OW0aTlfXOJ8owjS5Zl5eXm1Z1rjphQWI7KAPnKgxBcYVO1
	tIW0P+7mNI7zrwKKuzymIVTrFTRfoxtqhqbbh7UrA0mqlB+zVpVep/5D3WQzOZp2zBce8IFu7N0
	gmoYzMO1AXnY03wbmfVneDpyeK77hcR88wLuPmNabxWj5J6a+nGmLTUCiL12st3I12sCrIRGq1c
	gK0oSTcQOwuXNfK5BCSbuoGySYSoD4nYrqPZPF4b52bH5bmpYAaZALhWyzSSziOutrfLQDAFMBa
	0SI5fN93x6rpTxkdjpznEGq7idVNVZSZTpxct2LCFYhg3CSR5w2Qun29G0JzgOA==
X-Received: by 2002:a05:6a00:1742:b0:81f:9b4c:81c0 with SMTP id d2e1a72fcca58-84212d2ca6cmr2156401b3a.41.1780046606412;
        Fri, 29 May 2026 02:23:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:1742:b0:81f:9b4c:81c0 with SMTP id d2e1a72fcca58-84212d2ca6cmr2156359b3a.41.1780046605769;
        Fri, 29 May 2026 02:23:25 -0700 (PDT)
Received: from [192.168.1.2] ([117.192.250.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214affe29sm1240298b3a.3.2026.05.29.02.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:23:25 -0700 (PDT)
Message-ID: <8b911846-1001-4c20-908d-1384cc81e30b@oss.qualcomm.com>
Date: Fri, 29 May 2026 14:52:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] clk: qcom: gcc-qcm2290: Drop modelling of critical
 clocks
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
 <20260528-shikra-dispcc-gpucc-v2-1-953f246a0fbb@oss.qualcomm.com>
 <ro6xcalsh5vwsyxi4jyyk4iebmg2p626aqw5zobbfjj5noui6r@hsjyhdko2aca>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <ro6xcalsh5vwsyxi4jyyk4iebmg2p626aqw5zobbfjj5noui6r@hsjyhdko2aca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA5MiBTYWx0ZWRfX//0/ikmizMgv
 B3LO4Qu9P9gvnlhrLXjQnseGdOobqJL+oHqxfnxRq5C3BbzPCNUyWhNmy5gEn3glritoD6t5p9U
 4E7gQDYeVDSHhbTIdi5aHTyqjXarhWljvmCn9MKtsaLmN5p6K3vYo9PEVsVRzL+zUr/eca0rvpj
 +aIQZqpegy6J0W4XwsMZ6wpk8GBVco7V5nn9dWwbDcbqv/YZmuYJi329NRiWAqp7MG445eWVEZM
 QVDbHa8/5KBf4htR1AFPFc5JPyInIrv7N0WYAXt5ia/kjZsQMXs3z+Pc2w7a25/r70bLYeSNn2P
 l2a8E1unDsACnJbUgB/Z5ngG/aI1zUDssgCmEzxLU+Zap+X6JSEnZKCO+JDRUb0RcDo0D+kbA53
 i7mmxt2xQTCTnYLtVbfjO2d43rkxJuS2cJ5ZdssDa9UOD+kyM7GhubuRJp0mGbq5iViHu3+aF8J
 VC01pjtxTT4SYzn9IZg==
X-Authority-Analysis: v=2.4 cv=frnsol4f c=1 sm=1 tr=0 ts=6a195b0f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=MYhr4v4WboA43l5+MyccHQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RHQwGL2yU_3FcdO5I0oA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: oyhhPJThprueYchmJx_ITbjfnkP72l7o
X-Proofpoint-ORIG-GUID: oyhhPJThprueYchmJx_ITbjfnkP72l7o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290092
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110237-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1DEAA5FFED6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 28-05-2026 06:52 pm, Dmitry Baryshkov wrote:
> On Thu, May 28, 2026 at 03:37:02PM +0530, Imran Shaik wrote:
>> Drop the modelling of critical GCC clocks on QCM2290 SoC, and keep them
>> enabled from probe as per the latest convention. This helps to drop the
>> pm_clk handling in QCM2290 GPUCC driver, and the same can be re-used for
>> Shikra SoC.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/gcc-qcm2290.c | 153 +++--------------------------------------
>>   1 file changed, 11 insertions(+), 142 deletions(-)
>>
>> @@ -2012,19 +1936,6 @@ static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
>>   	},
>>   };
>>   
>> -static struct clk_branch gcc_gpu_iref_clk = {
>> -	.halt_reg = 0x36100,
>> -	.halt_check = BRANCH_HALT_DELAY,
>> -	.clkr = {
>> -		.enable_reg = 0x36100,
>> -		.enable_mask = BIT(0),
>> -		.hw.init = &(struct clk_init_data){
>> -			.name = "gcc_gpu_iref_clk",
>> -			.ops = &clk_branch2_ops,
>> -		},
>> -	},
>> -};
> 
> This clock is not critical. Why is it being dropped?
> 
>> -
>>   static struct clk_branch gcc_gpu_memnoc_gfx_clk = {
>>   	.halt_reg = 0x3600c,
>>   	.halt_check = BRANCH_VOTED,
>> @@ -2605,21 +2500,6 @@ static struct clk_branch gcc_venus_ctl_axi_clk = {
>>   	},
>>   };
>>   
>> -static struct clk_branch gcc_video_ahb_clk = {
>> -	.halt_reg = 0x17004,
>> -	.halt_check = BRANCH_HALT,
>> -	.hwcg_reg = 0x17004,
>> -	.hwcg_bit = 1,
>> -	.clkr = {
>> -		.enable_reg = 0x17004,
>> -		.enable_mask = BIT(0),
>> -		.hw.init = &(struct clk_init_data){
>> -			.name = "gcc_video_ahb_clk",
>> -			.ops = &clk_branch2_ops,
> 
> This clock isn't marked as CRITICAL, why is it being dropped?
> 
>> -		},
>> -	},
>> -};
>> -
>>   static struct clk_branch gcc_video_axi0_clk = {
>>   	.halt_reg = 0x1701c,
>>   	.halt_check = BRANCH_HALT,
>> @@ -2686,19 +2566,6 @@ static struct clk_branch gcc_video_venus_ctl_clk = {
>>   	},
>>   };
>>   
>> -static struct clk_branch gcc_video_xo_clk = {
>> -	.halt_reg = 0x17024,
>> -	.halt_check = BRANCH_HALT,
>> -	.clkr = {
>> -		.enable_reg = 0x17024,
>> -		.enable_mask = BIT(0),
>> -		.hw.init = &(struct clk_init_data){
>> -			.name = "gcc_video_xo_clk",
>> -			.ops = &clk_branch2_ops,
> 
> This clock isn't marked as CRITICAL, why is it being dropped?
> 

The above clocks also should have been marked as CRITICAL. Not sure why 
those are not marked in the QCM2290. Since we are updating the critical 
clock set, moving all the required clocks to the critical list in line 
with the latest conventions.

>> -		},
>> -	},
>> -};
>> -
>>   static struct gdsc gcc_camss_top_gdsc = {
>>   	.gdscr = 0x58004,
>>   	.pd = {
>> @@ -2990,6 +2848,17 @@ static int gcc_qcm2290_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> +	/* Keep some clocks always-on */
>> +	qcom_branch_set_clk_en(regmap, 0x17008); /* GCC_CAMERA_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x17028); /* GCC_CAMERA_XO_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x1700c); /* GCC_DISP_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x1702c); /* GCC_DISP_XO_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x36004); /* GCC_GPU_CFG_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x36100); /* GCC_GPU_IREF_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x79004); /* GCC_SYS_NOC_CPUSS_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x17004); /* GCC_VIDEO_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x17024); /* GCC_VIDEO_XO_CLK */
> 
> If you are chancing the driver, why are you not using .clk_cbcrs?
> 

Sure, will add these to .clk_cbcrs in next series.

Thanks,
Imran

>> +
>>   	clk_alpha_pll_configure(&gpll10, regmap, &gpll10_config);
>>   	clk_alpha_pll_configure(&gpll11, regmap, &gpll11_config);
>>   	clk_alpha_pll_configure(&gpll8, regmap, &gpll8_config);
>>
>> -- 
>> 2.34.1
>>
> 


