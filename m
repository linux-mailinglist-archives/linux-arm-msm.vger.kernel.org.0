Return-Path: <linux-arm-msm+bounces-113904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ltDVAsbnN2rWVQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 15:31:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 020036AAE97
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 15:31:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hPVl0YR9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JcJDzz36;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113904-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113904-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC7BD3001071
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 13:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA6936728F;
	Sun, 21 Jun 2026 13:31:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B041242910
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:31:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048703; cv=none; b=Mc+PQWQdeAzmlSdTy1p1DUAXfPn7pJxIuaqzwxbNc2FCtMDxJXq6AjuuBxrMbArkVitH2ozweCEiLep+0NzsFHXGUpAcmdTOPw4FBJBmpN6CDQjoAS0G8swVJRlO4cLUU/Z8UdRyBnb3MnEex7bxNH3HQmne39OeOyiEBHLeYs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048703; c=relaxed/simple;
	bh=VN6NxdAohu577dk3D9LPn+bxrsAV8xVyAetpHGfw9H0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TNd9YSrByLAiI1YSWdqcKGL4hGguClJ2TGSR8ZwoamUW9iyvHXRiWIHU77gswfKBIwDqNGI2pUozkAbGdfFxf35SBhvRdwwXNH+F3ecm18s7e0BBaQsuGbmehiBHRYxUWj9vryZzXeEwRVL7lCfnQDO1YXSsTYbnyPDxWOMMvfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPVl0YR9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcJDzz36; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L9tSJe1464596
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UuXygAe9bgAQ+FLVDxZXXpsG+6tBLctCiBd3eYw4++U=; b=hPVl0YR9jKJ1zAf4
	igC52PvK5VmgsYixYCTAuhmc9J/yLejQUpCyw7YbMKPNd6z/xT9SduM2Syxv3/LC
	AM/JJyA0T8GJeYqX/Yh/W4kymTCvu1wBfif1QubZIhchFg5e4I25F1yxMYWcrERQ
	m3QuKk3ZoQ6csiDvBhDUFioIKhaHoNIWsBQUyXez2HEeG8xIlUv5Vwm6qhgXJ0E2
	SDUOKh9XJMoPm5Ew7k4mSTmiZ+eYAOFtwyMw/XEJFMKW1O6jESIUp/B3ixtN0bnm
	6wB6P9PedV0/pTb3rVEpSfYrWgzDCqr6Prmmp+MaztDHrVLi8IcC40IxOIF21Gho
	I+KBpw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm1k2yub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:31:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842211d6e48so3992854b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 06:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048701; x=1782653501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UuXygAe9bgAQ+FLVDxZXXpsG+6tBLctCiBd3eYw4++U=;
        b=JcJDzz36JAiPs6T5DUoZ9cyh4+O2LcZNh86e+y8gCDmbSWa6iWhZFfTy15KRd0fGpH
         E2R5mIKjCw5PReA2Yu3UgtIm5la0knCr7rfycsWg6CYyQZgnlsYH/z9Zo0HC90CJsXbQ
         I74caWTn15boJ7qEGwQyG9RbJLLcjfvzJmsmiv7hLEZN4Ik2w9Sy3Uc9BB7+3EWtq8QK
         Okcp6et0Nhho4dTLuLEpecF7roiid+7GaEjBXVg4hzYScpR/BR8WBmIyUhwQmLUdT0Tc
         o/GCECujJSInepXHD5fyqz5qZM5YTEAmr7EkgYs4whmonNehy5wUV0vpe3/+44BiWczo
         Fn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048701; x=1782653501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuXygAe9bgAQ+FLVDxZXXpsG+6tBLctCiBd3eYw4++U=;
        b=QQdyC/N7dc0Mty+N4snnabuPaBeBN87eIerm8Al1kCguvce+RuOrleqQbchnNQ/rhs
         68otVuvz3ke4q9KAA8vyf/YvfvhRSiwymqVxhhzBMtFspbFLkTvfNd++ATfABi27Mqfv
         DbtqrlTd28wvOt4u3krNNGKB6kpWnWnL3bnB5SVYyDuArOg16ywvQa6dgNwpq2yEifz9
         8vNeGr6P2G2nGzI5bM2Yx7RuINS7fZzAaRWU53Sd9Lff8L50/BChbvGb1DaGAD0T2Qtd
         yTiJOUIoge9SVvo0bXxXT0lFFZg12BYbBaDHxofbNzhru4+U91K8UhDrB3yauxy1n+LC
         Mtow==
X-Forwarded-Encrypted: i=1; AFNElJ/9fbQyYZnhbi/fikU8yBFdgwPQh6wQs5dMKJ0aZDEIDI+agKdr++gDFl8KTUGRskoBSkj5AvVuT92W/dZE@vger.kernel.org
X-Gm-Message-State: AOJu0YyQJ/rlq7TtCtLib4PfNmcV77dOHykDNxu3wItVtwWc0V1Fx0/e
	ECKEwsmchep33p/H16C9lRaxUGSagVx+1U1lOeYHkpMCsrdIVjzpEBaWLS59nGkp2cwqlrLaPi0
	YF1aj3w51f6/zmm4g7gov+TN1+r0qvdgrDHy/LseH4KzQ32PV7fOMgMdhdCPpQpz3KLf8
X-Gm-Gg: AfdE7cnR21MqmMn4qgM3jrgl7KqxGnOsPbUpPcs10aGpacomp9QoziEGpsSlvfwmTWH
	cEbjxKMaWJ+/0cDNSorjbJFYIJJH2QOjTbNnOe+FwyPy2YpyvXWch3fx3aLitgcdTeOzLYUDZw+
	E1jdaKXnuFA+DvRw89xorNM6X/QzH6m+JYZFKnfBUrXvLlJM4TzGGIUwmEwnzgIVXPVxHIb5ePP
	LDOkVidSoxJtaehBjyV5gs7E6kz1yQgrEuE8zCGZPjS+4PA7OvpC6GL9xmOA6VUz89uhYitqGlu
	gBaf4p5FLyzuIyXmmJGzF9UQLj6RR9arJ5Qb9zSNKa+5LJQolCk3DfQbOGKQeQhaR+DHWMr80Q+
	kfYxV+wOYaAd8VYDa9IxGzyAThRChCXq310Eu2EAo
X-Received: by 2002:a05:6a00:2394:b0:845:4928:8645 with SMTP id d2e1a72fcca58-8455078cb38mr11154265b3a.7.1782048700857;
        Sun, 21 Jun 2026 06:31:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:2394:b0:845:4928:8645 with SMTP id d2e1a72fcca58-8455078cb38mr11154222b3a.7.1782048700418;
        Sun, 21 Jun 2026 06:31:40 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564da30b5sm5058583b3a.25.2026.06.21.06.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:31:39 -0700 (PDT)
Message-ID: <2fff81bb-1880-4057-b176-dcc9e26a3527@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 19:01:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] clk: qcom: gpucc-qcm2290: Move to the latest
 common qcom_cc_probe() model
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
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-8-8204f1029311@oss.qualcomm.com>
 <4zhwpr2n6ihjevwamqzutoyoj4owg3mkutbn3ddstooh566fqy@j2k2or3narkd>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <4zhwpr2n6ihjevwamqzutoyoj4owg3mkutbn3ddstooh566fqy@j2k2or3narkd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uMiOBS9jaMT7gwocBPLHznfupPF5E0Hs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfXxz1xqZeApv1P
 WpzBvQXMnoGn/V1tlLjGNBejl7tfGSD8MkxUqj0iHQkgN4B2tCE3fJk506ZLTnFoj5+aVZPCCeI
 w/yK7dPRpX1f/4sa7g2WZvo5VVo2vog=
X-Authority-Analysis: v=2.4 cv=T6S8ifKQ c=1 sm=1 tr=0 ts=6a37e7bd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=D-w674G2B0HpSMWNuX0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfXxBbQhZN45YqB
 Af/+WvLeMZu43gBCIqUXUNLUjkYSfTXEFFXO3cx68rMna//KztxOfficBckZsS5kMPvLG/QhHC6
 o1+DrpObik/+8Jn06Y5PBMpv7qysB9Ja0HxfVZG0SLEXzYrGoKx0A2QhQxF6llmXTPwe0UVN6LW
 hlQLaxrjH7mokrr8/WgmzDuvWcikpD4hYSZ2wzhW6Os4f3EnGjXzEun511Wel2KU0EZWe6FvG3h
 KZfkifNDJq78TxKvE0MRqNdde7VyXKbrDy6ZECH96p4MysdTH0mq11W3iNDLIMWCSiX7ArTEQuE
 pXdnhxLLTfpX+HOjVggVexSQnUANh+UfGrpuGxonYt+iDqvJI3r0dhFUawkm6VvUjzdKSu/Qx2Q
 5YSkLmRHTFdrz48EgsNPzVA/bYzWhKjm31ugaJCGzB4Ao26ib5VlhUIz5dwTtB16mte4anVxV6n
 EZj5f1YOqFbFOAzrMew==
X-Proofpoint-ORIG-GUID: uMiOBS9jaMT7gwocBPLHznfupPF5E0Hs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113904-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 020036AAE97



On 06-06-2026 04:59 pm, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 10:56:14AM +0530, Imran Shaik wrote:
>> Update the QCM2290 GPUCC driver to use the qcom_cc_probe() model by moving
>> the critical clocks handling and PLL configurations from probe to the
>> driver_data to align with the latest convention. While at it, drop the
>> modelling of gpu_cc_ahb_clk and gpu_cc_cxo_aon_clk clocks and keep them
> 
> Why? Also it looks like a separate commit to me.
> 

Sure, I will check and split the patches.

>> enabled from probe as per the hardware requirements, and drop pm_clk
>> handling as the required GCC clocks are kept always-on from GCC probe.
> 
> Separate commit.
> 

Sure.

>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/gpucc-qcm2290.c | 92 +++++++++-------------------------------
>>   1 file changed, 21 insertions(+), 71 deletions(-)
>>
>> @@ -224,19 +210,6 @@ static struct clk_branch gpu_cc_cx_snoc_dvm_clk = {
>>   	},
>>   };
>>   
>> -static struct clk_branch gpu_cc_cxo_aon_clk = {
>> -	.halt_reg = 0x1004,
>> -	.halt_check = BRANCH_HALT_DELAY,
>> -	.clkr = {
>> -		.enable_reg = 0x1004,
>> -		.enable_mask = BIT(0),
>> -		.hw.init = &(struct clk_init_data){
>> -			.name = "gpu_cc_cxo_aon_clk",
>> -			.ops = &clk_branch2_ops,
>> -		},
>> -	},
>> -};
> 
> This wasn't always-on beforehand. Why is being changed?
> 
>> -
>>   static struct clk_branch gpu_cc_cxo_clk = {
>>   	.halt_reg = 0x109c,
>>   	.halt_check = BRANCH_HALT,
>> @@ -318,12 +291,10 @@ static struct gdsc gpu_gx_gdsc = {
>>   };
>>   
>>   static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {
>> -	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
>>   	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
>>   	[GPU_CC_CX_GFX3D_CLK] = &gpu_cc_cx_gfx3d_clk.clkr,
>>   	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
>>   	[GPU_CC_CX_SNOC_DVM_CLK] = &gpu_cc_cx_snoc_dvm_clk.clkr,
>> -	[GPU_CC_CXO_AON_CLK] = &gpu_cc_cxo_aon_clk.clkr,
>>   	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
>>   	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
>>   	[GPU_CC_GX_GFX3D_CLK] = &gpu_cc_gx_gfx3d_clk.clkr,
>> @@ -342,6 +313,16 @@ static struct gdsc *gpu_cc_qcm2290_gdscs[] = {
>>   	[GPU_GX_GDSC] = &gpu_gx_gdsc,
>>   };
>>   
>> +static struct clk_alpha_pll *gpu_cc_qcm2290_plls[] = {
>> +	&gpu_cc_pll0,
>> +};
>> +
>> +static const u32 gpu_cc_qcm2290_critical_cbcrs[] = {
>> +	0x1078, /* GPU_CC_AHB_CLK */
>> +	0x1004, /* GPU_CC_CXO_AON_CLK */
>> +	0x1060, /* GPU_CC_GX_CXO_CLK */
>> +};
>> +
>>   static const struct regmap_config gpu_cc_qcm2290_regmap_config = {
>>   	.reg_bits = 32,
>>   	.reg_stride = 4,
>> @@ -350,6 +331,12 @@ static const struct regmap_config gpu_cc_qcm2290_regmap_config = {
>>   	.fast_io = true,
>>   };
>>   
>> +static const struct qcom_cc_driver_data gpu_cc_qcm2290_driver_data = {
>> +	.alpha_plls = gpu_cc_qcm2290_plls,
>> +	.num_alpha_plls = ARRAY_SIZE(gpu_cc_qcm2290_plls),
>> +	.clk_cbcrs = gpu_cc_qcm2290_critical_cbcrs,
>> +	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_qcm2290_critical_cbcrs),
>> +};
>>   
>>   static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
>>   	.config = &gpu_cc_qcm2290_regmap_config,
>> @@ -359,6 +346,7 @@ static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
>>   	.num_resets = ARRAY_SIZE(gpu_cc_qcm2290_resets),
>>   	.gdscs = gpu_cc_qcm2290_gdscs,
>>   	.num_gdscs = ARRAY_SIZE(gpu_cc_qcm2290_gdscs),
>> +	.driver_data = &gpu_cc_qcm2290_driver_data,
>>   };
>>   
>>   static const struct of_device_id gpu_cc_qcm2290_match_table[] = {
>> @@ -369,45 +357,7 @@ MODULE_DEVICE_TABLE(of, gpu_cc_qcm2290_match_table);
>>   
>>   static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
>>   {
>> -	struct regmap *regmap;
>> -	int ret;
>> -
>> -	regmap = qcom_cc_map(pdev, &gpu_cc_qcm2290_desc);
>> -	if (IS_ERR(regmap))
>> -		return PTR_ERR(regmap);
>> -
>> -	ret = devm_pm_runtime_enable(&pdev->dev);
> 
> So, it was pm_runtime-enabled beforehand. Now you've silently dropped
> it.
> 

My bad, will add use_rpm flag.

Thanks,
Imran

