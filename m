Return-Path: <linux-arm-msm+bounces-93303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJh2FnH0lWlTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:18:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEC415835B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99CD4302F3BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 17:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C5334105C;
	Wed, 18 Feb 2026 17:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WPKJhuN/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+PzXm3P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7CB2F744C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771434971; cv=none; b=Z3GN/PilJvk0FcmcL9csXZMG08MYbYp9l40agUYUie6zH/IqQrlbwn0bNG2Cun8gxcJioy5BEY6/zofSowqZhdttu9HDQmugjpAK2Yx1mr7y7o4vwLK1v9n8Rv1IJmmAuZ3PnWDOX8kpFmjDLdTu3q18DLAEOZYTj9/yx1nHyrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771434971; c=relaxed/simple;
	bh=aVhkLepetiYC5PiocTxkPeWcBQuctXRFmPqTzWOKqZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/pnlCy1MquraX3IyaX7jQg3iKzyqLCTXDhJojdUXidaUvEPB51ofKlbKyVIGs0E4QJ6DCpV/Jz/hNx0C2tQdYOVVChi7v3Ec3c3RyAo7vThGbUb1z4CXZxQJ4/d71PZsqIB/ll8FK87fc51NYa9RChXBdM07T1azsHBb/EHWxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPKJhuN/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+PzXm3P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IC0MRu4060336
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dy8f5ySiJ/BdCVTM2csbla8bHLaSoOzRqkrlexHU9jw=; b=WPKJhuN/rXonK+p8
	YeiURJjlXkz+lHo2zIfEEr0Q/czZHbIHekUPg40mlHSdMEN2KgopXrdBrSHkXqX6
	zv2yTNts9xhdx0A4RkweL7vb4Orap7otLyPxV65BD+rnjPX6NF67rJa7wqnmMm3d
	w0P1fcFo0azQfgar7mSYfo1o03B5DmTYw9BYEL6PFryfjL2WLd1BnhTOA/T3TFWZ
	fl2CxfLMo46PTzrUEEcwUdJOfh/ZnF6ibOfF96pEtWopxAXMEycZbM7GQARLXn3h
	dQV2JXKA7f8VmBTcirXfYHKs5yDuqKI8eoQCTHdLIioCPU8ZPdXZfEAI/A3DvtGv
	pn1+zg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd1qx2j7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:16:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so325874a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 09:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771434968; x=1772039768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dy8f5ySiJ/BdCVTM2csbla8bHLaSoOzRqkrlexHU9jw=;
        b=H+PzXm3P8qxDYJSAG1dFrQN+HqCNzfIVGE14lqKdxEmncSAq85RHORQ29St+rrTt+g
         1E3wMORBQQ6JaNkvWDnGoqQaNGu5H0AC4iqmUOYeSccgVvLPKgzhZEOIm5i9CS3qKG6V
         yKCo9RucJJKzgmjarlWzz1zcVbfWsLarHCigzkd7Ft997Y9eKSvYORORNxyCyTcSsfKj
         UlUSPnZAEot+WrMxBgZo2AHsRpWp1Z+zz0j2mAg/G4kurXiSz70d/BnT29bge6GQIP9K
         3Nz8hEJQYo6D5lAAbaLqotA6G/GZVGtoJv8TZrSpzwoochAyvcvPW16c9Gv8UgrDs2OJ
         4HXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771434968; x=1772039768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dy8f5ySiJ/BdCVTM2csbla8bHLaSoOzRqkrlexHU9jw=;
        b=omXLqAv7wmU486GMQUmHiIfyb/25XikLHyKmsHyCB7FVupBZ5aEHhC9Y7hG6t7K0NX
         7cxXF4lLjmFaVFRxFouWqXnb9gI1aUVY3ihuJWdvmr5rjJ804vZYcbpYKKCw0ywZFE+K
         v23ucVeBYhcZS+dHOwGcJ0xmRMMOJC8Mb54imUQ7ByEhccrzdm6iFrT1qCPg3pM1Olb3
         GlM3YcEubN6N5RgfU+tU4C3SGB6e9HogfxEQWK7GvWdMovjV4z/KvtpucMBkmEIZBfl/
         slQEIe2jamndUb2AAhHLL9Odq0eLLI6bzZFcwYwIMod6vz74TYqtWSG3VX5nAGTQYqZj
         gOhA==
X-Forwarded-Encrypted: i=1; AJvYcCVWu/BE/Q6DyTUC6dq/tPEw89kzwyekJxqIrjQlIg+d+WcXgEm0QBz3Nrn144L+84e1g9cQ3sspeivnTBw3@vger.kernel.org
X-Gm-Message-State: AOJu0YwXE8DsYwj2WIEybcs2UypBljlr/TVPypHB9KUbVc/tj2jgLvjS
	udmhtTdcP0qShTNFoK2SSx4vBqjbNAC9TKlwQ0DA3ngEvmVWSLDsTa3SqPCjdoourklYl+qReDe
	32ltgeAjAGg2K9ct4HD11K1d0Pjut4bBqcP+wV0LC43sjNX59RyIxfVTXWGd76EyJ8ZWs
X-Gm-Gg: AZuq6aKOnMILSriY2GSxjAvckq2hh4Fh9Z9nF4mjMT9vOKvNT5FkDUtaYnirNRhjL0B
	Z9z2uJZTtHYq2HuKm/C2mBRE5ynTA5X1DJUPtIwJNUk0bPWUQNQxxl9AuQrtDQlOLwKKO8+NzGs
	FhRIHnzKbR6aIi215YWxFF1yuLrLuHxRUC98Kv8aUXozYR+nWEWcYqGXx0nvfGm4Hof0Ld2J3yW
	VoXKeoI4nZybf4w5a9exsJjkvOlfNSIpBCf9Rhr1/vHrpCRSq9ushCQhAODbH/wa0gQXu3NZOen
	MtgaMfO16xskafGFe8rKpmyJoUYo3PLsKA3Hcunfq7CqaSXuydHaCQJ0v8er9FYe+19Aj2XX2Ei
	A6GSTQc9BjJ5KCZgryl9x+j6NEoZ/Nle3HLPbngDlmBX5BbH+hg==
X-Received: by 2002:a17:90b:280c:b0:356:256c:4bf0 with SMTP id 98e67ed59e1d1-35888d3952amr2187684a91.17.1771434967757;
        Wed, 18 Feb 2026 09:16:07 -0800 (PST)
X-Received: by 2002:a17:90b:280c:b0:356:256c:4bf0 with SMTP id 98e67ed59e1d1-35888d3952amr2187640a91.17.1771434967233;
        Wed, 18 Feb 2026 09:16:07 -0800 (PST)
Received: from [192.168.0.195] ([49.204.28.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662f6b84dsm32581162a91.10.2026.02.18.09.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 09:16:06 -0800 (PST)
Message-ID: <55dafd36-8b6c-49e1-9579-62e6d97c1692@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 22:46:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rpmh: Fix LNBBCLK3 divider for X1E80100
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260211-hamoa_ufs_clk8-v1-1-b537f54e9353@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260211-hamoa_ufs_clk8-v1-1-b537f54e9353@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hExCUlpxUC2dc9bh7EtGSlEQwhUAjmwj
X-Authority-Analysis: v=2.4 cv=R7oO2NRX c=1 sm=1 tr=0 ts=6995f3d9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IXbkkVN8uJs8XsqYossUiQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=POSefk-TqIfGLmoKSF4A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE0NyBTYWx0ZWRfX5tE9eHo6ZCt7
 FLLq25p0M3QFOszdxNnv5WKT1j4TyIHm+iWaj9BdUsfcQXnP7BajT7Skd5nhGzNy0j8FmCeZ9To
 fXHzOIyEmI367UKTH5w+xqoEERHV6+U2f1V1Kxf8g2S1zuxhudNgMMYadJSu8LYSsoCLC1VMxmE
 XVrT3fWRR+m20kewG7rAPmS0PsE5rS5P9qPBfinE4dWyQydwrVU990UkKZJvtv2lhhtd9c0TrJE
 LLcnxRqdb4VYKdPNm6Nx8HeQxKnOKd3U96BPg3v1IrsH/xOdoEMa0DWV/q2NGbykAE6OWVHVxUe
 PyPJUyefjp6k5cjcABcdJOhPCGsNGmI/Ai8+QmshY+0p3ZdfSCpbvM1ZcMzwCVILYGGrWu7VYCL
 1FCQc0gL7J8XhW/+V7eY1O5XRbtG9BqM3fB5GnqeblhrnZthNslcyrvN2HCCy16z7ruQO5xTTqH
 3AN3cLF8yMMnR9do6sw==
X-Proofpoint-ORIG-GUID: hExCUlpxUC2dc9bh7EtGSlEQwhUAjmwj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180147
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-93303-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ABEC415835B
X-Rspamd-Action: no action



On 2/11/2026 11:52 PM, Taniya Das wrote:
> DEFINE_CLK_RPMH_VRM(clk5, _a1, "clka5", 1);
> +DEFINE_CLK_RPMH_VRM(clk8, _a1, "clka8", 1);
>  
>  DEFINE_CLK_RPMH_VRM(clk3, _a2, "clka3", 2);
>  DEFINE_CLK_RPMH_VRM(clk4, _a2, "clka4", 2);
> @@ -840,8 +841,8 @@ static struct clk_hw *x1e80100_rpmh_clocks[] = {
>  	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
>  	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a2.hw,
>  	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a2_ao.hw,
> -	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
> -	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a1.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a1_ao.hw,
>  	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2.hw,
>  	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_ao.hw,
>  	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2.hw,

Bjorn, request is to drop picking this change. This fix was identified
as part of downstream validations, but what I realised late was the DTSI
of hamoa upstream and downstream had a difference in the way the
xo_board frequency was defined. Upstream DTSI xo_board freq = 76.8MHz
and downstream DTSI xo_board = 38.4MHz.

The xo_board frequency seems incorrect(upstream) when I mapped it to HW
design and needs a much more involved change in hamoa DTSI as well as
the RPMH clocks.

I will send out a v2 patch later which should take care to fix.

-- 
Thanks,
Taniya Das


