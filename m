Return-Path: <linux-arm-msm+bounces-115564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fyGTFXySRGp6xAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 06:07:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E06126E9A05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 06:07:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PzlqCJrf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="EY6c/xM9";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115564-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115564-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 468373009F71
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 04:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E863C371072;
	Wed,  1 Jul 2026 04:07:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF8B38F620
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 04:07:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782878841; cv=none; b=UtSTxX9jp+alav4OVpHZiMWotg5N1sMLQ32/q04czl6lhPmq38QUiogHWB7IrieEmTjlDBc+08TEy4/UGzmpza4DDnb9OO5exJqjljuOWvMrccWoljll6qdcHi8PiivktpuYzC6AROYzjnYc+M8FF7yKUMEVnnI9ImtxiuK18Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782878841; c=relaxed/simple;
	bh=iQKrax4xdqPBaPK/ZY7NeYmK8KG/BYaKFf94nhYGZzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jOpEQICidwASMSN7vi80IY+BZTOYqYxCGzg+bFE1Ib/XlaijYSOGTCidgcFs5l/fl+YMFyqfUJoHBYR4Hpwa7V8sOaQhCp1KVVJFl7zaJcIpHGC3VcpnMNOlJNLltW9Pli4LSm8V6zCEsYrKcrB6GBnPyYjE652xNFTNxkIurr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PzlqCJrf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EY6c/xM9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6612tFar3960369
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 04:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bXPC9cfbhTzc7btajVjYymebFkcCjufLQIb57VfBcXE=; b=PzlqCJrfaNO8CRPf
	wYIOEK9U3N7rahR2BN95T69Hvw82aNxO5GR1JExujtgHlP8qP9NcIBOMCXJsqK69
	Xll86hLDgShe6DtclVc10RYZQASPHxTvC/XtF6whoZ19CIyZ8gKeEwQGom2fk/BI
	z5qKOoipK+78sAAlARJCkY+FhnV3OeScIRpVC50n6oyTv2W36csBy1bj+W3roZNo
	WAOGnSOuB4AGh9MtBshXDSyj1HBfzIIjjHg7e7KhVW/+VE6VhJIQUVP5AF88+mgW
	SvJkcAQuxbOlWF+w0o3t4VvghtI/b7e2XkmzboUSMU66XGKoXzLQvRhqKoMBBW+r
	tEhiZA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j9127wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 04:07:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30e85f5bc9eso766968eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 21:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782878831; x=1783483631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bXPC9cfbhTzc7btajVjYymebFkcCjufLQIb57VfBcXE=;
        b=EY6c/xM9mDpDR3LI3WJT0q9OAlJ6mVosrpVtTIYZmmJXsB+qEUb3Vqca8yuxhSv/bR
         148r/Rpe3XW73LVM3LGFsycHYMz80ilgJzFFpTEbng692WohO6iV9EZNOnjB1rgzwTDE
         3A/sSWniSG5lJg4tONl90xCO+pmVYiK8rJM5uCkBVdBdp6FjplW854G8kPYfDWpNnbVP
         gTcIz7bu4CnnQIwxgAdM8pRTe5xy0qxKq1Ydvjv+Nun2vKdy5nsZHeu59QPHhEy5nXd0
         SOrVwy5XSyxCwvWpTdn3yHvq7X33hqWbRcKAVSuQdM75H4ZWwZBMGrg8YAIsC/j+BKyr
         ZsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782878831; x=1783483631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXPC9cfbhTzc7btajVjYymebFkcCjufLQIb57VfBcXE=;
        b=HbAxYrNQMVvRfRSXt2qNMulmYXN6YenQWCEsG3H8YCfCWhyINc2Ml46rdBjkr9Ftvc
         2uzd1AOVDwtTJKKQVGiTOWhSU7SvFo18rzQvs3eqdV0+VewWK8gFRQQLmKdvWZ1IREkj
         KzalLgKwpdMZhNaTf9VxniEfy7FtZe5jhFP3asDpoIT0ACPYFF/dtisYBAiWEZKhflG/
         uAMm54EGU5KdA9wmMrwrtUr265WSbl5PVehV1r4wtrSPMTKIYUsWyHr+Bl1T6ky7o0OR
         rk23W8+Ug9l5wGUODsN7o/HlcdHxFFx9pASXN8HGL9ylvrC/A3ABlckqrR4LjrKrkjb1
         vs9A==
X-Gm-Message-State: AOJu0YwfsK6ygH0o7j6GLM5BhAxS3zAsS1Ve7uyYXj0R0tmdoaFrfarO
	HfkK0SvnNar3x532W1wZ2mQ1YV+Qryc02CK4w3yF8g/zBBwL+eH4dGLIgMWuB2+WYs1lOoYKvxY
	nj2bdh5Ynm0aSbDDsb3NBt1SniUsXiftPr6ZCyqqktn1ABc/j3uykU5Sph4AzAKWyOxGn
X-Gm-Gg: AfdE7cku9ytw8y3d34AK+W+YX5+ZiK/JDtVmdXbEW3+lvJYnNcZDlL4FcvRU8wE9y/Y
	o/8GgO6T6AedXIEjH7iZOwrbse4GPPiOSnN8jJnQai5OoDuOL58ow1FkR95cmmR5zmfPB/APDqu
	Xf59tpylvq3P8vPzWJ6WGOppyZoMzXucPFGxK9sI7h+k+yS0xxNlgLCUXSe3uiVQaKFbZIWRg5c
	G+seyslckjuJFOwobfCtTfndZlJjsV8kS6cXZ72DxwnbtDjN/bogUa1jZNJG150cMlPGDCWj3d/
	ZWFN03XHG8mdCSGSbEQinhnq17c3lSbzBEGaZqux++e9CCeMOtI5looE12vHnltRvNdaQdtTD2i
	+/jTtZ0ijBfKBHwlo+kVKdooQ0YhgQcDb90ONc07kag==
X-Received: by 2002:a05:7300:6d95:b0:305:56a:c38f with SMTP id 5a478bee46e88-30eff2a2572mr11057eec.26.1782878831422;
        Tue, 30 Jun 2026 21:07:11 -0700 (PDT)
X-Received: by 2002:a05:7300:6d95:b0:305:56a:c38f with SMTP id 5a478bee46e88-30eff2a2572mr11010eec.26.1782878830841;
        Tue, 30 Jun 2026 21:07:10 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ef03a6f9asm7249363eec.19.2026.06.30.21.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 21:07:10 -0700 (PDT)
Message-ID: <56ebd97b-0834-41ac-8fdb-2469e2848694@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 09:37:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
 <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wmCEaty6LzGLG2zbEUD7CtwdVngcO1ZG
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a449270 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=uyBkinp2FPxe1pn4hbAA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: wmCEaty6LzGLG2zbEUD7CtwdVngcO1ZG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAzOCBTYWx0ZWRfX5pVpmf6k7RXt
 HXZhPvSGkXFkC7lSTTb+YrIeWe/0BxBcBBLYitQjDBzlUSGz2bDSlCqc97LuOdHQYp+AR9b4OSj
 fOBPetx04XkOf9owv6YdVskMIjNnd28R9N+zzfsnXJEoOiuGVHKzC23mWGYhzZSs+mnPFhOBS5w
 7yu4FDZFgO1hJ6KKbZqVebnuvdUC5+HJLbEELE0HunkPjHxM5j9nHiuNoV5zQC47dCTBGzxUvnh
 hxxFdQ0UD+BelarlvgmYe+5QOWdwFnFA+S63XXSSlPrNwOeum3TBm9pVIfV9OyTNLwtVR5LNVIZ
 CdU5GUc7HYk5r5KkJ3CSJvM8gfnsghEtMI6lhxnuI1syBuoVnDoPmiMULqojrU+ocbQdd/pJnxR
 bVHurHl59+EG+Owav7mLFZ4bQ9Xcsi1Ml2g/0+VaHhbWXbwzMQQOZd8Q5thKHQFvktaeRxW6TVd
 TljcnvCraeRgFIujmFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAzOCBTYWx0ZWRfX9c1Is8yj3up8
 4OeShTnl3FwioqBl5ZCQUdC4vM0Kapql3V78hVUsf0wlcCOaLMoExEyzMYgyth3ckGfjf4Kbnaq
 VxiL2/PgU5nrLZqx1x8sEk+GaZsYm8I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010038
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115564-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:bmasney@redhat.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taniya.das@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E06126E9A05



On 6/26/2026 10:02 PM, Konrad Dybcio wrote:
> On 6/26/26 6:26 PM, Brian Masney wrote:
>> With the introduction of sync_state support in the clk and pmdomain
>> subsystems, the following warning happens when the unused clocks are
>> shutdown in camcc-sc8280xp:
> 
> Stuck at _on_ sounds wrong.. does clk_ignore_unused / removing
> the sync state from the clock part only resolve this? There may
> be a clock dependency for the TITAN_TOP_GDSC that we're failing to
> describe
> 

Hi Brian,

This probably could be due to camcc_gdsc_clk getting turned OFF during the
sync_state, but this clk is required for GDSC transitions. The camcc_gdsc_clk
is currently kept always ON from probe in camcc-sc8280xp, but the clock is
also modeled with clock framework, so the clock can get disabled in sync_state
callback now.

Can you please try removing the modelling of camcc_gdsc_clk using below diff
and see if helps here?


diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index e97b8d4f3c84..660d8655d391 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -1753,24 +1753,6 @@ static struct clk_branch camcc_csiphy3_clk = {
        },
 };

-static struct clk_branch camcc_gdsc_clk = {
-       .halt_reg = 0xc1e4,
-       .halt_check = BRANCH_HALT,
-       .clkr = {
-               .enable_reg = 0xc1e4,
-               .enable_mask = BIT(0),
-               .hw.init = &(struct clk_init_data){
-                       .name = "camcc_gdsc_clk",
-                       .parent_hws = (const struct clk_hw*[]){
-                               &camcc_xo_clk_src.clkr.hw,
-                       },
-                       .num_parents = 1,
-                       .flags = CLK_SET_RATE_PARENT,
-                       .ops = &clk_branch2_ops,
-               },
-       },
-};
-
 static struct clk_branch camcc_icp_ahb_clk = {
        .halt_reg = 0xc0d8,
        .halt_check = BRANCH_HALT,
@@ -2839,7 +2821,6 @@ static struct clk_regmap *camcc_sc8280xp_clocks[] = {
        [CAMCC_CSIPHY2_CLK] = &camcc_csiphy2_clk.clkr,
        [CAMCC_CSIPHY3_CLK] = &camcc_csiphy3_clk.clkr,
        [CAMCC_FAST_AHB_CLK_SRC] = &camcc_fast_ahb_clk_src.clkr,
-       [CAMCC_GDSC_CLK] = &camcc_gdsc_clk.clkr,
        [CAMCC_ICP_AHB_CLK] = &camcc_icp_ahb_clk.clkr,
        [CAMCC_ICP_CLK] = &camcc_icp_clk.clkr,
        [CAMCC_ICP_CLK_SRC] = &camcc_icp_clk_src.clkr,


Thanks,
Jagadeesh


