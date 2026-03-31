Return-Path: <linux-arm-msm+bounces-100991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEv2KbmPy2kuIwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:11:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22560366C1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA5583068081
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734B23E557F;
	Tue, 31 Mar 2026 09:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsvuzsF8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yx0pt7ff"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9B1397E9D
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948140; cv=none; b=XYV6sZFBdBWuVlAq06IFmLoQUOYRdq2Tc7EO0LXwSXhjTdZToshqHU1cS5RXhwKgxM/jQX8jb55gsGMVDkNjfZK0XrzGi7SQKfS37mdNaZRVEcd//mtvHUf6PtKddSEH+cvl8ACTsSsXsYofPJGRSGVT6m+6QAsnnYjUVzCQTo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948140; c=relaxed/simple;
	bh=jgQNOLo9vj7tU0NySkOBBoOQDkGpnBRpdjxHH8OoW6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ENjyv8XBKoMS/M2SV5UdNx0wPTzSQoNTuz7Z/SX+gsVs4A5dMgl5+qiVgMRaPFDNn5RniLKTag4CONJdVrP+w0BMuYow9Enin8h4VmLS1GB9Qy3wIM8IgwaOyZDEgKRvaEW/hXnmrnvmFra/jK/XXcLOnW1yT4pjTSxOtjgkTRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsvuzsF8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yx0pt7ff; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V7svAd430871
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXM54aCazj8y06x2yXFau5JJdIb37Kt4s7DObZf7M6A=; b=OsvuzsF8Sb4MFIuH
	AzU3ET+jNhej+rkpnEOSHWpZDMJ26HbZR3I+FBHpqKzsh2sXmg3AJZoPKtJrKuL/
	X8qAEb+u+RpmYI1nCPCrXYVzaunNSDhQ/6UTtZUOulm3877Z0/bw7W//QbgMNsBF
	3RdXcmja2FJog2YhiCfUjFTOL+L18P3zJ8MUpxm0SU/bVQiEIoMQhUIVBglxuOzc
	4JhxqR1K8BuV681rRscDsbiYAJy4AtKuqEc798s6bhka8Ht+SfvJ2TfJ3M1mFwns
	XwyRtmpMXW2lHko2sl7PyRUVK0MIvkCuh0b2bWaor/PFk1wRMK3MIhv3KzLmsU4T
	rqN72g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfhmgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:08:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0cf396c45so50358995ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 02:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948137; x=1775552937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NXM54aCazj8y06x2yXFau5JJdIb37Kt4s7DObZf7M6A=;
        b=Yx0pt7ff2vBOSqrlQBYuL0DbNiqHJF3DZUDfILbH3tItfv8Ht4CmM2iFiiwFCFpE92
         cfSGFgwdCcTNwzhBiRDwg4u0cChn2LwQvn83/JcI426L1qqsP48WoK4r0xDLFlce5d6F
         3gEq5ghPOLZTZYhLF9SWwuuGimujv+2kPuEBKDnvUGXS61wftTnLbeRjY0p1/LWkQDid
         5hXTn8OV21duubhw3vKc0Kn9OubDW/7DjoewiDRqX78sZ74NczoDam33WRghKQMPZ4VY
         3aG6bClXKj8u6wokXPu2Qz6Zgqn4b8CdLdc176dK+aiUYEKYQeUvPiSQKP/GatOp4mQi
         Nzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948137; x=1775552937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXM54aCazj8y06x2yXFau5JJdIb37Kt4s7DObZf7M6A=;
        b=U3NCUI+viVihr0t2rAsq1vpj6as10cL8StQ0aZP+l1wMi9Ia27IFuBd3kkxaSNWIQo
         OCW08UvpBLYHmglW8T90EwDsl+GWBNwU0fcw6fYexuDgZmZ8rB5rm7bmBsks4LKzLiQ7
         vEy1UIQ6bz0xw43hvD2UV+zwHTfphVN3fbEZZGXwSG441NH84hTjHI/I9dhdcpZo/5nB
         2/zBUjR1boscfeH4OXRbup3rLnWbdp94HggjlTUuZAyiGkdomcf9LHbwPqkOw9g/NfL9
         Yho17hZWpEdr7vD32VPue8XqKPx6tqyMQRkBXGk2yPqgicNKzBzmIm9sEngA8iizxDoM
         3mCg==
X-Gm-Message-State: AOJu0Yz12qohxaJYQZ7lhiwyp0RH2ciX/Lb874IRIUx9SU0+/ThM9hTl
	tcoCl3QPNRzSXKOMHDmBU9S8iyHqZh7wFZW0Tnh7L+2svxIbaA3paA+AZg42/4SjFvmL47sgCH0
	1xWQzOeN54YWHRh9vTaytBvkfZ6Yo00Tj2ssac88Jm4xd2k4AmEa0JpAgReRR1p7mYgGF
X-Gm-Gg: ATEYQzycJB2cZ+q9fjkd0yWaLUX2kxatwaOqjMeIv41spiqgCfiHuy+bBtHjaE6kaTN
	2I8hTKMOgwteuf9TpTnW9Amf4W5CTItXNZgVXWnLYZnPrtSllsrzOgonKRpIgaRBjWhK/KytZTA
	cK5sB8MFBr4lR1HVvjMhpOZ7viNaWs3M1OnPJGpTkK9aYBLDcrp2y3zBU9Xyy8tS5QHRfk8mARw
	tc64YYdY2+mDbtPeNfawIaL7HmPeKINhgoPq1YWPApcNudOVpcRvgubdKa6ioqhvnbJnxtfEDjD
	ZHzApfP1OABWHY6aDmW1E135GPC10+cdNypO51YW2JMEUESoFeKSyR2alTfOvERMaDGN3xsO/YP
	TemyvpjYWK3kmYPESCjrc06ptPRlXpk5yUU1htvFcwR43qWlJxw==
X-Received: by 2002:a17:902:cf0b:b0:2ae:450c:951e with SMTP id d9443c01a7336-2b0cdc2c13cmr155340575ad.17.1774948136958;
        Tue, 31 Mar 2026 02:08:56 -0700 (PDT)
X-Received: by 2002:a17:902:cf0b:b0:2ae:450c:951e with SMTP id d9443c01a7336-2b0cdc2c13cmr155340265ad.17.1774948136512;
        Tue, 31 Mar 2026 02:08:56 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24264292asm109581875ad.4.2026.03.31.02.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:08:56 -0700 (PDT)
Message-ID: <45d91247-3207-444f-946f-87eea56cfa58@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:38:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] clk: qcom: rpmh: Add support for Hawi RPMH clocks
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-4-c2a663e1d35b@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-4-c2a663e1d35b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cb8f29 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bRyZQm5hcxuZ6EYdzcoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfX+95lFO59z9EG
 fp1jTGjtBjQO6I44xxaX5yPpN0CBLnmxb16734zCkjCQDdyLDDhiUbn9Oq/fwIH+YufoadO6ype
 ixUH3+Wi3AjrDhaKRN5nFDivkGLcWXYnxTvBXx485BAETHzKD1lCJsTAF9JpW3407j2Ajkr4AXa
 U+buPucT0RZGF8nMMsYsQgR+H/uD48VQ0iDbb+ksYOkHwQbBuz+h0MknDCMLkP6ftVXIYtBIpNn
 EdPn7yQOHVE1mXaFLgZEUFKsa9Tjn8cuWu1L0Lhg4DFtR7X+0u4Q4ZM0DpFFun/YWTY+EbZy+0Q
 A+itSr+btSEZpB6yAdPaSQgbXWGxgJ+VAbK+OR8upuYuGzc4LDc/l/bQDEiHNeBxmlX4CiLlTRo
 p672JdYbUnmotdfXU19t1hnhMYk3ZzDQooGLMfJ89ATXO9G31/bvQC2gImcFtYYl4GQSM8XbzS0
 OV4LJxECAy+96W3d4qA==
X-Proofpoint-GUID: ttNm7VQHvEA4e903e0nrwV0N3oYcEWl8
X-Proofpoint-ORIG-GUID: ttNm7VQHvEA4e903e0nrwV0N3oYcEWl8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100991-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 22560366C1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/2026 6:04 AM, Vivek Aknurwar wrote:
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 6a54481cc6ae..f9084c15467c 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -405,7 +405,9 @@ DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
>  DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
>  DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
>  DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(clk9, _a2_e0, "C9A_E0", 2);
>  
> +DEFINE_CLK_RPMH_VRM(clk7, _a4_e0, "C7A_E0", 4);
>  DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
>  
>  DEFINE_CLK_RPMH_BCM(ce, "CE0");
> @@ -965,6 +967,36 @@ static const struct clk_rpmh_desc clk_rpmh_eliza = {
>  	.num_clks = ARRAY_SIZE(eliza_rpmh_clocks),
>  };
>  
> +static struct clk_hw *hawi_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_DIV_CLK1]		= &clk_rpmh_clk11_a4_e0.hw,
> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2_e0.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_e0_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a4_e0.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a4_e0_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2_e0.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_e0_ao.hw,
> +	[RPMH_LN_BB_CLK4]	= &clk_rpmh_clk9_a2_e0.hw,
> +	[RPMH_LN_BB_CLK4_A]	= &clk_rpmh_clk9_a2_e0_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1_e0.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_e0_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_clk2_a1_e0.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_clk2_a1_e0_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2_e0.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_e0_ao.hw,
> +	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0.hw,
> +	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a2_e0_ao.hw,
> +	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a2_e0.hw,
> +	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0_ao.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> +};
> +
> +static const struct clk_rpmh_desc clk_rpmh_hawi = {
> +	.clks = hawi_rpmh_clocks,
> +	.num_clks = ARRAY_SIZE(hawi_rpmh_clocks),
> +};
> +
>  static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
>  					 void *data)
>  {
> @@ -1056,6 +1088,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
>  static const struct of_device_id clk_rpmh_match_table[] = {
>  	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
>  	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
> +	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
>  	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


