Return-Path: <linux-arm-msm+bounces-104753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLcaKmx772lKBwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:06:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B5A474E15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 641CC3009CDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 15:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BEA324B1F;
	Mon, 27 Apr 2026 15:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jT3uA7Sg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M2VENgd+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090B33233E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 15:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302321; cv=none; b=mtGhjDqaw6k0R+zvDSxlXn32z7OJuWfebSqDVQlBK760ylu6evgdlpmwGsmHqsnLL9SEMPACqlec8rXNS6TX/9atG4dFlUHzAqAnBlLdPES/3UuCvIXDV6+osc0LrcS8iS3EIsGVY80bE74BH0xzqgdxY3lCSgxnA9tZX2qr88g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302321; c=relaxed/simple;
	bh=DgXVKovqYOMyCgcKbEEZ/ZPvsx9IUv5q4P3uWGz/7Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irSYWOjyYJ+NmljhBY8+UaJ+xyV7ouW7Iv7KE1lA+ro65B2JssNRYK3OGxd97qps8ty8Xp3lIxNdmJGLBAULmA39b25Mv4EFSDrngjeW582QwMFz8/ytWY1rPKxpDBAegoQiqdyj5MUXReJdY3ZgsjMSuSADzqrfwUiasmZAFcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jT3uA7Sg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2VENgd+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCYZbk429204
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 15:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BuXcTyTBJ4Pak1kn48bsQ5Ld
	q98WTYIpaFUXS4EdpsM=; b=jT3uA7SgBmiY87R7yPjrSboE8tbbz5bN3QlqVnEW
	xtoEwJnN1EjIuNJ3OxJBrIA1VPcBEDLGdTNi9jmQ6kzq+owxnnzDuH6CZPkRw+M0
	0Pc0qBHjYuQayf3mECwCgFVkmnngQFAyrgWY7JAFe4o6RalZAzsgvta6o9hogAfV
	OA4nkC8cPg+cLPfUVbE4/fbceGpdbDkmAW+kDX1JuU07SmNFWaT7ZBDfj3S+451O
	Vg9Dts0lC0t0ifVuvCxsF/CJXQ+h67aIxYzDPpC/nB883T05KF3WIz3VGft166lT
	7+ps1uSZDGs2LkEKHVAzn/Xxm1diHCRWrCYF0x3TU8zBvw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x30jcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 15:05:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b81ff82e3cso6348733eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 08:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777302318; x=1777907118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BuXcTyTBJ4Pak1kn48bsQ5Ldq98WTYIpaFUXS4EdpsM=;
        b=M2VENgd+BarL0CCmg/kxuyvmd1ATcePxc0lV+LJZkzYQbxSIx22gwwU77373cBtvMc
         0HUH3iCAAHPGh4MlZURDxkFfKzGUcBBNSK8164EFYPaDVnyJ4wRYkSLN2LL1/Zhc6K/1
         pIgBjXhudmSJbakP5FNv67OmxmiH26tT3Mo0vK108Y1adOB0ZVHROh4vpg9JOxvGImAx
         jsrDhnXUgqwZkJd10FfYgi2Mr4jXSFX1cdUg0MeMTtQOmScciH7M9r7hX4PQXooITLyg
         kDWsJ16u0UPr4DslIPSYKsll09p9GZJemijghG3LAnTqP75DB4O2POJPQwaKaekHJPoC
         Vabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302318; x=1777907118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuXcTyTBJ4Pak1kn48bsQ5Ldq98WTYIpaFUXS4EdpsM=;
        b=q1HH8eMUOcEzfvGvIlk3Mb4ic+scohWgKZkQrVbhwAIQ28ksDrgr8s4CIs4aJHm9eV
         tRH6fIYCg9Lc+2vY+EuLhgbuzHRNHPD9glp9SC76jmZOlbUwAnA0Q9uw5bclwf1VpzCC
         LRlczcqqx13hjyEzL7Wd6pjhgXK+rmqlR26EVBPXpLbLdfF8r8/eKL06BFFVcQj5wGF9
         cic9imSMWtpnTVOsFpiKjxfBakgTisZRX8TTIH/Ngc6vFgt0S+7bH1s3r6/vA6lNScuM
         a8H3fHY1DarELOClqn7ShZnB4oYhnwtAnjoL2mlA2VJRAOFoLNn0yyUdm7AA0FXVS255
         ICfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Mh8hOgkrvbmsyBqWcjEKnTVRXk4y8R+Dh9EnhdxTAi1+AaFyqoBnSgngZA0h0qOs5MSjipJoAIsBtTcNZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8T4gVqj8fBtJcmKh2EKexrsCQhnLgWP25x5D4a1DhU/N2rOc/
	GCAPZOYV5zWyvcadfouz4tuxzdbXqN21HaU38RsWyEGMKEaKk2iyuFUAhvRnyeAIcgKXevexNIb
	mBJw8mZxi4WIosslstZGm/W6UN6p3P+BYz53cFJCRdthuZHV5I9Elxifomkk6EDR/9VC9
X-Gm-Gg: AeBDiesVarlp1YlDkAsUijTDc6g6qF559qkn7Tqnr1Um3HUF5AtB9hIKuNV3nOvKSVH
	TBa43o/tT4U4tPg/cRAcudBxOotOrsgsgiGz1dSoszPfuTLW8EvyNPg296llHvaifWQcbMgtoAy
	b0esPX9rK9qEvRwIBevj151/dMgWlCI6ZvzU+nw5subbGorxmD+xqJAtzTdtsvSAASNoa/OVV41
	FTh6YAFBsg9gjE5nwvGm3W79Q1waX6ZP5UXAxRMDWBM0SJllfH87/q7xR6kbvazKnkgeXpz0KIc
	I4nXqlwmeD4xJv1SAadD4EDxxl5OrOeZGAg4CCJlJNXT8mGdUo7eA8wjOkiuBDZn5kDqtYmkkHt
	kNEAcoIkGGRr4bsK3FldGNvwtF6TxqmQ8GpAUcEA878+kTfKqLnWUK4nJlTP+pgb0GysUxVWWCg
	S1RNYEbpsaXg==
X-Received: by 2002:a05:7022:ef0c:b0:12d:d496:a964 with SMTP id a92af1059eb24-12dd496af49mr2155427c88.20.1777302317732;
        Mon, 27 Apr 2026 08:05:17 -0700 (PDT)
X-Received: by 2002:a05:7022:ef0c:b0:12d:d496:a964 with SMTP id a92af1059eb24-12dd496af49mr2155376c88.20.1777302316982;
        Mon, 27 Apr 2026 08:05:16 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d4bdaf7sm42339974eec.25.2026.04.27.08.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:05:16 -0700 (PDT)
Date: Mon, 27 Apr 2026 08:05:14 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/7] clk: qcom: Add support for global clock
 controller on Hawi
Message-ID: <ae97Kh8kAIDOs15l@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-7-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-7-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE1OSBTYWx0ZWRfXz86wHijL20BK
 PHBSLg5gX5lsB7HTt5szarVC6qQONPUDTs7TzmDMGinkEo838NRpebVowTMBuVhJ1eul7TUxwIv
 fHY0S8TjPpEKu9oILj3m1GgB3bA29dKvbOsQCxYtOvMbYuvZf3JAflK/UZw75PcnSXFg+0Jvr8o
 y4Y0YCX2UHeljaYYFLa+//mobqFf4sCRjOEn/+Ca6lvjHeOQ1vhAi6d8cdJ4Sx3e4liF6PiGtec
 Bdf60AXe/aMU9dDJcyV1HDWyJprwdDALxkcxp/Srjd7jAzj6+t9BquYqPaFOVHQIIg81r0O1gOa
 KoWMtu131H0qjnrtIVFf7s9cTVgxPb1D0Zl3VYVQ+MR5bgJV3umiBZNmFPMCggoNqixqZRz8hvC
 IJV7YELNYxtnUMrAnUs/W8JhIbIxSZRk3vqx8qK9JY0kiy+j+vzTJumltCWSaWmsxBIy1e18Leh
 nJrechG6mMA/RhgbLqw==
X-Proofpoint-ORIG-GUID: FtVdU4gnn3-PYd8CWDVflGwcOu0Mqs3-
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69ef7b2e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7t-CPqBheUaPz9YIfAcA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: FtVdU4gnn3-PYd8CWDVflGwcOu0Mqs3-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270159
X-Rspamd-Queue-Id: 86B5A474E15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104753-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Thu, Apr 09, 2026 at 01:51:41PM -0700, Vivek Aknurwar wrote:
> Add support for the global clock controller (GCC) on the
> Qualcomm Hawi SoC.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig    |    9 +
>  drivers/clk/qcom/Makefile   |    1 +
>  drivers/clk/qcom/gcc-hawi.c | 3657 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 3667 insertions(+)

[..]

> +
> +static u32 gcc_hawi_critical_cbcrs[] = {

This should be const now since qcom_cc_driver_data::clk_cbcrs was
recently made const.

> +	0xa0004, /* GCC_CAM_BIST_MCLK_AHB_CLK */
> +	0x26004, /* GCC_CAMERA_AHB_CLK */
> +	0x26028, /* GCC_CAMERA_RSC_CORE_CLK */
> +	0x26024, /* GCC_CAMERA_XO_CLK */
> +	0x9f004, /* GCC_EVA_AHB_CLK */
> +	0x9f018, /* GCC_EVA_XO_CLK */
> +	0x71004, /* GCC_GPU_CFG_AHB_CLK */
> +	0x7101c, /* GCC_GPU_RSC_CORE_CLK */
> +	0x67084, /* GCC_PCIE_1_RSC_CORE_CLK */
> +	0x43014, /* GCC_PCIE_LINK_XO_CLK */
> +	0x6b088, /* GCC_PCIE_RSC_CORE_CLK */
> +	0x52010, /* GCC_PCIE_RSCC_CFG_AHB_CLK */
> +	0x52010, /* GCC_PCIE_RSCC_XO_CLK */
> +	0x32004, /* GCC_VIDEO_AHB_CLK */
> +	0x32028, /* GCC_VIDEO_XO_CLK */
> +};

[..]

> +
> +static struct qcom_cc_driver_data gcc_hawi_driver_data = {

This should be const now since qcom_cc_desc::driver_data was recently
made const.

> +	.clk_cbcrs = gcc_hawi_critical_cbcrs,
> +	.num_clk_cbcrs = ARRAY_SIZE(gcc_hawi_critical_cbcrs),
> +	.dfs_rcgs = gcc_hawi_dfs_clocks,
> +	.num_dfs_rcgs = ARRAY_SIZE(gcc_hawi_dfs_clocks),
> +	.clk_regs_configure = clk_hawi_regs_configure,
> +};
> +
> +static const struct qcom_cc_desc gcc_hawi_desc = {
> +	.config = &gcc_hawi_regmap_config,
> +	.clks = gcc_hawi_clocks,
> +	.num_clks = ARRAY_SIZE(gcc_hawi_clocks),
> +	.resets = gcc_hawi_resets,
> +	.num_resets = ARRAY_SIZE(gcc_hawi_resets),
> +	.gdscs = gcc_hawi_gdscs,
> +	.num_gdscs = ARRAY_SIZE(gcc_hawi_gdscs),
> +	.use_rpm = true,
> +	.driver_data = &gcc_hawi_driver_data,
> +};
> +

Thanks,
Mike

