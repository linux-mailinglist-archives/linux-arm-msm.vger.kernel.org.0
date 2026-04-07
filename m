Return-Path: <linux-arm-msm+bounces-102106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODH/LYzZ1Gm8yAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:16:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 591383ACA71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4FC43097F9F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F723A7F6E;
	Tue,  7 Apr 2026 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZrhP9xAJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1Q5aoha"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523343A7F58
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556796; cv=none; b=GM07hpUu4vQK9PkvrukXFoy6DQOloExCtq4k/x1+yga2eUEWAntAIv885jvqRi1mXqOrHDgMWlgAvgwanAMUgSEDIO62wESb/KSXzO6P5r9mmrWGBZSswF/boiPnS4F0eMHv2DgEHjnQPdh6dLGYzrjjYgs0ffJU6xfVrqsWmAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556796; c=relaxed/simple;
	bh=BeRmkF1AixGu0dDOhZq+ut21Q+0Lj7EFqDNljeqWR/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3QHe2r8EAIEbWPBQBDUm+BJWQG+WO/SVSbQd06JUUQ0nBL3Auhyt6YP0IjW9MqrSWc9iz8Yl8lJvxGwx+6wnL7omqvH4HTHiXRwwSfvqW2c5pMb/0pbg13h7hr43ECurfY5T9Nud9uXUluALavHCK9ESJ/O6QfJzBy4rrbSW7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZrhP9xAJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1Q5aoha; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376WONB2329704
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UwM23ebfEnjAfxbCREGtqZRfmTKIBdktg+hDX1uVW00=; b=ZrhP9xAJlnYdFeYg
	3TW2KaGhemua03DJuleHF3XLO0NhJ2L2EliJmwKUrNcm2C4Tgt2oDloldS87gkyv
	5+X5whcXEPtJ5c4pNQDJe1OtP5NbcBV/bc0ntjKX6J/pqXKzxwtEiEgbpxYMChP7
	V9CMcH4beGBp88W1ZsLzVPQO6XHKWy8gz9NpFeetZE6DJKNnu+NJiZR7ZjObJhTB
	YFD0LA20Vzk8+7RuOsdD9aNVOuVBrWhcuM5N0GNoSokWs/1omY9qMhiEj/dizZe9
	YHPBzRl6dmyyoLsfrgQDXKIRligvbBT9+GaMNK6TC64LcJ18QZ9n4j/2AXz0aB5D
	V8dX+w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4t79v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:13:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89e9d327913so19439156d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775556792; x=1776161592; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UwM23ebfEnjAfxbCREGtqZRfmTKIBdktg+hDX1uVW00=;
        b=G1Q5aoha68UqIW2vzRNZ2Xx8zWKq1XWBFpttnc11roC917oS2C1/7L2zmEQXVxttDn
         CI+6NYCBv9w0FOJTNyH0eosVYJyrlMIpgOze9JYwyuZeWKdheCkUn0edQPQsrU1fZ6V2
         vaCfdY9miXzkwVCCU0dWRRyFhTtU4GGIF/tbWrIHTpEKTYqg9txCjolwKocqksvCNlYi
         ERfXGgBV3arpwPzUbN6+JyniH8jpeVgU7SVrNyzDk4Tx9ZRXIM+qg7B5GP2vGcEgY5KW
         xy4zH/K4vQvJ+JOGdJ9Vtm/3FJJoZqh0FgDyzbT0tsPVujpNVRHXu7BtLvAhiuk3HdDs
         v9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775556792; x=1776161592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwM23ebfEnjAfxbCREGtqZRfmTKIBdktg+hDX1uVW00=;
        b=mo1A+4YyVqPxTK/rlWLaph7Xu3j2px/aMZ0S2jAcMl7FzHG/oh9F8xpsEg22TCr8Sb
         uQgo5EmXukBsVwSuiIIf68m389YbUumu9h/ZG1O6L0ERJA346IHSjV22tf4Cn3PgoEWy
         gXKFii2J5nuYGH/tD2dEXGM0zHpoOhgau4e9p1uYO0Tdyb9pCURFtyoknhx5PML9HwLH
         fp7R5Ia71e96Cn6+yVv4S1HJS37PMP0Wf9hUzxTsr7R+/SZdi0dqRs726ho4sJ9ZaSnq
         ZDwJ64Q7/3Yy4b1w99I32ys71Q/wzWQ573q5jOuhjV2Tt/V2CsWI7Ar5wmFYUqzv7CVL
         ohJw==
X-Gm-Message-State: AOJu0YyNKC4IqmnepBIfMTH1Mp2GS1MCB4WC73gJmjQA513K9jsnGNTJ
	wE+pHepjQ2aba1XyN8V3iFgEQtDGGpEo4hdUapcueD1A1cYT5x7p5Sd0EkBLQvw4EdCJHHE+oAN
	dVrSDKxP1A6LgLK3kZnrySr+DAToMC7j2D6bebcDAZGR0Lc1ZOnpo5HF4r1kXweWYiSUj
X-Gm-Gg: AeBDieu1fOJhXuZGQ9B2aJZGKc34BuFLyuOL4wkpXqiobkVbJEObPelmgLhJQWvwdNd
	KUrCgM7So89EoCmvibLIEPvkVFF8sUBN5lgiBYCueq50PBCwfkZ5sbpc7et9LzXr5YITE0/CgYA
	L+PGDm50w2BSy0neVK2fTWbJt2+8BemjmXQ1KNlGcGj6qwts0wrXAimtYM4quINrBH5EGmUZuH1
	EzUT5yoZu+gAnkLPD4M2B4XPGHqC7hcFb3d6UgQUaiwkf3LtYhWfFf7mCTicoamP3H6dP3iUp1s
	cmGrsvbdm2InFu8SvGioH1FKgk3KJeMH0uHMGvqNsBYvk+6PaGJ3acqwCDCuvTCh7ikEUWiQTDd
	q1qlSE/qbj5Vv2xOg44mhKDfZ4oVEsZLSQcJQSLCO6mSD9Ymnm71XX57qusxYH4BHmAmaoscPr2
	9ur84=
X-Received: by 2002:a05:622a:5507:b0:50b:5286:f757 with SMTP id d75a77b69052e-50d62c846cbmr168680181cf.4.1775556792555;
        Tue, 07 Apr 2026 03:13:12 -0700 (PDT)
X-Received: by 2002:a05:622a:5507:b0:50b:5286:f757 with SMTP id d75a77b69052e-50d62c846cbmr168679951cf.4.1775556792094;
        Tue, 07 Apr 2026 03:13:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e445e5b8dsm3182110a12.12.2026.04.07.03.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:13:11 -0700 (PDT)
Message-ID: <c2cdc581-2f8f-4495-bb87-812b27a1e381@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:13:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: clk-rcg2: calculate timeout based on clock
 frequency
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Mike Turquette <mturquette@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
        Mike Tipton <quic_mdtipton@quicinc.com>
References: <20260406-clk-qcom-gpclk-fixes-v1-0-7a14fe64552d@radxa.com>
 <20260406-clk-qcom-gpclk-fixes-v1-4-7a14fe64552d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-clk-qcom-gpclk-fixes-v1-4-7a14fe64552d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NCBTYWx0ZWRfXw4cRl0yRjzt4
 rcx1CEvCmqGsxHqyuhAsDbM2kTtYT+T28ZOdpHnXtNVeFVTrirc99IxbZDwzpcfkMewdZBPYvck
 yJ832BTJGfnkhlkt9uGOvCwENYrvaRKvBxXGSqaES9kqz6wToazO1RkEfFpOdIl6qO1IqWLCeve
 1cuzdqwG5Emr/IuZ1OyTqbBvebl5TCcf2v1oIdMkk53Se58BlxLD2X20Wuk5pc9AaMTZH/rHGRw
 MOC4ldU2vPC6WGPDnhDE0Mcl5Y8SIZV4SBY0YRTrMJf9xtsChbaw2dOHZDL4awXOJjeq90+yKsP
 0eWnTg6KKPzfNK3yCWXYi7/phHXhSDgJHoBC4zqT++KQ4Jc1lVM3hhWwFFJ6/aEzVn1eC/3I3bU
 KlV8wZaOt+AO5uaUiqpISXQ/UAw3VsLLNVr9YHQWDnYhgZRIxxAuIlsQVN/2YduP2GRit4bN89i
 SMDO5Q76SW2tbwwWGFg==
X-Proofpoint-ORIG-GUID: dg-NXq5-xsyl92yET_c3snPv9rWlOa-a
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d4d8b9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qC_FGOx9AAAA:8 a=COk6AnOGAAAA:8 a=Pc8_uKcFEXUdqOsFkrUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=fsdK_YakeE02zTmptMdW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dg-NXq5-xsyl92yET_c3snPv9rWlOa-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070094
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102106-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[radxa.com,kernel.org,baylibre.com,gmail.com,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,codelinaro.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 591383ACA71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/6/26 5:54 PM, Xilin Wu wrote:
> RCGs with extremely low rates (tens of Hz to low kHz) take much longer
> to update than the fixed 500 us timeout allows. A 1 kHz clock needs at
> least 3 ms (3 cycles) for the configuration handshake.
> 
> Instead of increasing the timeout to a huge fixed value for all clocks,
> dynamically compute the required timeout based on both the old and new
> clock rates, accounting for 3 cycles at each rate.
> 
> Based on a downstream patch by Mike Tipton:
> https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/aa899c2d1fa31e247f04810f125ac9c60927c901
> 
> Fixes: bcd61c0f535a ("clk: qcom: Add support for root clock generators (RCGs)")
> Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>

Having Mike's s-o-b here is odd, given you've decided to go forward
without his "From:"

[...]
> +static int get_update_timeout(const struct clk_rcg2 *rcg)

Let's tack on a '_us'

> +{
> +	int timeout = 0;
> +	unsigned long current_freq;
> +
> +	/*
> +	 * The time it takes an RCG to update is roughly 3 clock cycles of the
> +	 * old and new clock rates.
> +	 */
> +	current_freq = clk_hw_get_rate(&rcg->clkr.hw);
> +	if (current_freq)
> +		timeout += 3 * (USEC_PER_SEC / current_freq);
> +	if (rcg->configured_freq)
> +		timeout += 3 * (USEC_PER_SEC / rcg->configured_freq);

I suppose both are nonzero if we end up in this path but a check for zerodiv
is always welcome

> +
> +	return max(timeout, 500);
> +}
> +
>  static int update_config(struct clk_rcg2 *rcg)
>  {
> -	int count, ret;
> +	int timeout, count, ret;
>  	u32 cmd;
>  	struct clk_hw *hw = &rcg->clkr.hw;
>  	const char *name = clk_hw_get_name(hw);
> @@ -123,8 +141,10 @@ static int update_config(struct clk_rcg2 *rcg)
>  	if (ret)
>  		return ret;
>  
> +	timeout = get_update_timeout(rcg);

You can just assign count = get_update_timeout() below since you're not
reusing this value

Konrad

