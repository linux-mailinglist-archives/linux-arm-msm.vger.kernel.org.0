Return-Path: <linux-arm-msm+bounces-101374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLvkMklKzWn4bQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 18:39:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F68737E076
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 18:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E69A4308E084
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 16:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179043DA5B3;
	Wed,  1 Apr 2026 16:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pt6gn+Yl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FVJaNKI9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0C63D6491
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 16:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775061326; cv=none; b=lfUyv1+iVQMXwJvlgPgnH8PmLGL2Gu20gSdMMev2MudzkwI0H0BvCrZAgKqpGkmR94ImuIoyPChR2I/QYxYP3EgbNCq3/Uam0aU++ZP2H0w/fhsVHeSpazglSh90/+j4XhVfE6JVoYe/ucQ+WIJ96vzSW3srmgE0OC+fVLUysQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775061326; c=relaxed/simple;
	bh=7N701LTx9bJ0sc4tJYW2zwmhMyTG1gcsh4UxcNggmXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aNu2Y1SutuPjOqBmr9Ls9oKp6wL3qZqgCYuEYH4E2wOfmR2wjxYUJZiPNA7tYzS+HArqTnpRucrVjVt527A6TnwTZhx+DSouJ7fruYlSaf/8oPdSMhH/tPQzmLaR68446R7QkXW37hxrMMUanVX2L/JYTE29sV0hbv4j2wURYJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pt6gn+Yl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FVJaNKI9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631DPbMV1893818
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 16:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oOH6Gjls3CqWEpA9mqTKUhqgpzoClPrvgbLT+iZ4b6Y=; b=pt6gn+YlNCcP80au
	cWyjxIZ6zwykIJftcfntN/LeviWS/FMUn63ziH+UDapF9hwYZjD4Rpqo/JTmUn0h
	tCp/9zyR/IUUkni7/agAr4cKUp19VlOdmOm3mZq/VuMLFvejE5U5niqX6QOOPccP
	DGw8slxEXiaNQQoo3bMNJX8joAPf3BokVC1/NFWl5VZSzm3WlS1mc8jGA+rOib/Z
	8PPsH4sH8JDJoYL/hYfSpPKse1LVOCilcWaNLY22PI4bZ33JSymEdBiWleJvY2uL
	Tp9zP4tu/YqKkwEJJdK8cVBWuiLs9R+sfJ8wFpsHlaPi0NGiry4oUV1pc+vcX+ZQ
	IQGUPQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483rvkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 16:35:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0bf2b3879so221442665ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 09:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775061322; x=1775666122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oOH6Gjls3CqWEpA9mqTKUhqgpzoClPrvgbLT+iZ4b6Y=;
        b=FVJaNKI9L5BBC1HJ9d16dCrEKZQYpR7MUtSojW/TgzbkaxH2AO4kvrGw2+0hs5J1DK
         HFMur7WCkvjzrRVYtWz42rmLA4B6XvSlw/Gq3w820CpUqD+NftYTvT/zAWcyd56GAT0K
         NkV/L4p61ZrSLMD5MW8ceqaCmDWVRpom/0a4ldRTwCaq1Xt8JcPZXVyPKaXtNbtY0yI7
         5ZgUKRv0Nw1HMxiWAgM77Jp6kJjR06bRvdOZLUjNNUykNzroImQ6lWC6Bx2bnZUQyEjp
         rnJer4xa+8sk7tTDYaWoTDO35ZDXdQoqX9wub9m5Y6NN/Y/A/WPSPKHOKUlR15OPAeJe
         0uNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775061322; x=1775666122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOH6Gjls3CqWEpA9mqTKUhqgpzoClPrvgbLT+iZ4b6Y=;
        b=SyM/Q7rbKkEjpla0xu3FFFr17BgOxJbF9rPC7DlwjbcC6JHxCG2FL+792DiFaR4mUv
         fVdArrPUWDLPuZ4dRpaDkzzlmDLCBABF+GX3dHNxOljH9DIUTwdRLprWNerkGLy/bpgI
         ZRr8u1mtBj+S95gEIEdl5WBXCpY1G+iJpF7lWEHSwwoPfff0kD8AvlW5zyyOTut27ojX
         x3yKB/c0rZMYvGHDYQl0PDKxzDG9KzuIndbkyETd5veLg8YR35+AQZyZquEabf7B5XO2
         dhCZjMr9NPqqxaOKcKzjmteW+20j/RLlkp3xwnb7vbzImrxMtLouswnHTws4Az/QF89q
         TlTw==
X-Gm-Message-State: AOJu0YxhCgr29qBI6PDAmizWiDWiL/IAd/4wAkpmaOTz54B/kbF3l442
	NR72Jn+LxVu7Y+M20RFKqpkwAxsTvc2332moeSOZyyeUcVk1aNVhWLSjav2azalY1A8ax+kmx5G
	s+sHaFmmgfe8krTnLn7wJl24axzmVF6tTkx8igortmDD/b/o4B4LnaSgbFEglVpKVzvGe
X-Gm-Gg: ATEYQzw3INPkVV9sq6cEOVee5LPB9ycTGTki9ca8NjxyR2pYrHaJXvrM0TeUpdEeEcr
	uIwX/WRSD7FwsTXazxpBzUIDDQGqy5+qnu9uwZyc+A540QbLy9TwFgtLrT8EF7TnVSw6RE69fIz
	dPLN/iTINSnLhlpcDK6eGyTp41jsnFOmUzv+TJ41nn7/IVGpg540/apnGfSojaufuzcpqa02KC/
	Pjdo247QVS8biVNXJtajwYzxw1GKnOGiFz8Ym/hA3CJVd79RBxdcgmot9xiKuQOHIjZ8Q4kXUcZ
	o+fUZEwP1pl5cnBw7rDpwOw+r6mnyBYVOtLD+Xr3GwK/spP3B+5+IBFM9mnURm32BKXAUGck1ji
	qMCf9uR1x41TO9R4KDC/MHil7z7uGSJFiatv8sJnW5KZTIiFb5g==
X-Received: by 2002:a17:903:2b0c:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2b269cffdefmr43544465ad.23.1775061322247;
        Wed, 01 Apr 2026 09:35:22 -0700 (PDT)
X-Received: by 2002:a17:903:2b0c:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2b269cffdefmr43544125ad.23.1775061321745;
        Wed, 01 Apr 2026 09:35:21 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.30.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478b658sm2609885ad.31.2026.04.01.09.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 09:35:21 -0700 (PDT)
Message-ID: <ebce5979-0ab5-47ff-963e-68e27216821d@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 22:05:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
 <20260331-qref_vote-v1-3-3fd7fbf87864@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260331-qref_vote-v1-3-3fd7fbf87864@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69cd494a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=UX8sLPG5SLFWA/DeEh7vkg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1wW_Jg1dmpZ7RQPaF88A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDE1NSBTYWx0ZWRfX2b5NenzSg6BG
 vdO5Zmc5VP1vXudkYc8LVINxuHmZhHR4hpoRXtzoqV+wvIX0y9DI9t9kS/uKiTfLYcxTq1HgtdV
 SAZ0AB/P7HmzgXaNfatW0hymI3EDmDdh2r9NoZkL3b+ne+4YVXIBY04s609YKKNfVcURrbi9+TW
 pbYrKqUKsrFXbkkMsRIYkNXQQlFCYeJqa9ip98esz7uYg8RORfgMB76307MmABC7OaM5uDJTptW
 MH75q2Vw6U42+ZS2OD6CXAGWTCeDNo15k+ZsnX7ruWdgOZIMs7v6Ui6kTA5Ic3OE+jBBgrLMp2h
 4Mlo8y2lZnaq1T2QQSv3dnslWQWEBthZ7R8S548CmAXv5Vi3M/kbFXbRSFPY/W4risTdl1vr2rk
 XBpNVWN3VajTpYyxgft5C868V8FAP0o28WICczSlLUBfaKW4YrSmvBZCV5DdyTZgwn40uEOcDL4
 YJN8LzWAH+rGwDBG8jA==
X-Proofpoint-ORIG-GUID: AHmWqOOiQ3YqmB4ORmF53-y4YQWUCIrT
X-Proofpoint-GUID: AHmWqOOiQ3YqmB4ORmF53-y4YQWUCIrT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010155
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101374-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7F68737E076
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/2026 12:05 PM, Qiang Yu wrote:
> Replace local clk_branch-based clkref definitions with descriptor-based
> registration via qcom_clk_ref_probe().
> 
> This keeps the glymur driver focused on clock metadata and reuses common
> runtime logic for regulator handling, enable/disable sequencing, and OF
> provider wiring.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/tcsrcc-glymur.c | 340 +++++++++++----------------------------
>  1 file changed, 93 insertions(+), 247 deletions(-)
> 
> diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
> index 9c0edebcdbb12816d1be5249e4f04bcaf02048aa..585f87b23af2d92daef1787b2f38911681c0d8ee 100644
> --- a/drivers/clk/qcom/tcsrcc-glymur.c
> +++ b/drivers/clk/qcom/tcsrcc-glymur.c
> @@ -4,265 +4,115 @@
>   */
>  
>  #include <linux/clk-provider.h>
> +#include <linux/clk/qcom.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
>  #include <dt-bindings/clock/qcom,glymur-tcsr.h>
>  
> -#include "clk-alpha-pll.h"
> -#include "clk-branch.h"
> -#include "clk-pll.h"
> -#include "clk-rcg.h"
> -#include "clk-regmap.h"
> -#include "clk-regmap-divider.h"
> -#include "clk-regmap-mux.h"
> -#include "common.h"
> -#include "gdsc.h"
> -#include "reset.h"
> -
> -enum {
> -	DT_BI_TCXO_PAD,
> -};
> -
> -static struct clk_branch tcsr_edp_clkref_en = {
> -	.halt_reg = 0x60,
> -	.halt_check = BRANCH_HALT_DELAY,
> -	.clkr = {
> -		.enable_reg = 0x60,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(const struct clk_init_data) {
> -			.name = "tcsr_edp_clkref_en",
> -			.parent_data = &(const struct clk_parent_data){
> -				.index = DT_BI_TCXO_PAD,
> -			},
> -			.num_parents = 1,
> -			.ops = &clk_branch2_ops,
> -		},
> +static const char * const tcsr_pcie_1_regulators[] = {
> +	"vdda-refgen-0p9",
> +	"vdda-refgen-1p2",
> +	"vdda-qrefrx5-0p9",
> +	"vdda-qreftx0-0p9",
> +	"vdda-qreftx0-1p2",
> +};
> +
> +static const char * const tcsr_pcie_2_regulators[] = {
> +	"vdda-refgen-0p9",
> +	"vdda-refgen-1p2",
> +	"vdda-qreftx1-0p9",
> +	"vdda-qrefrpt0-0p9",
> +	"vdda-qrefrpt1-0p9",
> +	"vdda-qrefrpt2-0p9",
> +	"vdda-qrefrx2-0p9",
> +};
> +
> +static const char * const tcsr_pcie_3_regulators[] = {
> +	"vdda-refgen-0p9",
> +	"vdda-refgen-1p2",
> +	"vdda-qreftx1-0p9",
> +	"vdda-qrefrpt0-0p9",
> +	"vdda-qrefrpt1-0p9",
> +	"vdda-qrefrx1-0p9",
> +};
> +
> +static const char * const tcsr_pcie_4_regulators[] = {
> +	"vdda-refgen-0p9",
> +	"vdda-refgen-1p2",
> +	"vdda-qreftx1-0p9",
> +	"vdda-qrefrpt0-0p9",
> +	"vdda-qrefrpt1-0p9",
> +	"vdda-qrefrpt2-0p9",
> +	"vdda-qrefrx2-0p9",
> +};
> +

TCSR clock refs are just not for PCIe alone, they would have supplies
for all the ref clocks. These supplies can also be shared across other
clock refs. I think it is not the correct way to handle the supplies, as
TCSR does not have the complete supplies map.


> +static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
> +	[TCSR_EDP_CLKREF_EN] = {
> +		.name = "tcsr_edp_clkref_en",
> +		.offset = 0x60,
>  	},
> -};
>


-- 
Thanks,
Taniya Das


