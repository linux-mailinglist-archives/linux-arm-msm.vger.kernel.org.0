Return-Path: <linux-arm-msm+bounces-96677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM4EF+ApsGlHgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:25:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE783251E48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D0B833E2EAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3CE40DFB2;
	Tue, 10 Mar 2026 13:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYz55cK5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJNtetWF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4884E328B6D
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149611; cv=none; b=VdOYQfhAHKxG6dvtZV2KPxxXdGacPFCFfqs8F0QAbhUWQASKKI1yqupWnn+iNQ1+jHauV3gmFm1+tMspYEjONw1KUyYX7IXjRmwt+2kNgnu4Wf01KzUFlpQ60uPMkl2f5e/Y43T5EzDH/phcrKBMfcOp2ALmlb24D4g+EkkVCoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149611; c=relaxed/simple;
	bh=WLjR64FMtcy3VsqCFrk603WYJEIRqZ6RCJ3BITJRJXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EeEzYj60cF7sjhIgqvqOSQd6i5sprRmmbNjmelHZVo9z7VLPUav/UqQa/XVbjPl15pXrO2pYhH4MSH/YEiXAtmhYR1MHNjujjg24cBZpbynB2ti1JlKoyQJebDh+W2GhOCHgHCLaqTiHEmz92/2kxzS2kyeUs7ZHk9bXrPW/sn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYz55cK5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJNtetWF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACajTd1647650
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Aat35daTUCA7fI7ldoBvesOF
	rR0W8njGOSk5Cw5Amdc=; b=UYz55cK5YBoTH+YmZvfb0d5D0bq2XOHUIFQx9f41
	T2xEdan4stEw0TQf1+JaqWTMsO5juQQCfvxYTF2YVLiZ4wtGCal9swuUZNeU2cj3
	M4E7kq0kb2N6I5H3S8olqIg499dAyBwf6MKbB/uu6cC6FEpOEOAs9LLbTeqWqnjv
	79mqUlvDbU0xR4rC5wqgXizH2yvXD3V+b1IPyDu5F+kB75KWukm+pqwfdhJc+zPm
	3Y3kEwHfB46igbUt54/izL0jn8JJwmsK9FR8zImxKwYb4ddLgyo6D4+WyHY68Ixe
	QZihryv3eLgai1cDaOsurpSFuMW+r7ssH7PgZ/PZ8/nU3g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8802pm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:33:29 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ffd5dd4c75so5451011137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773149608; x=1773754408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aat35daTUCA7fI7ldoBvesOFrR0W8njGOSk5Cw5Amdc=;
        b=CJNtetWF2K4Wv3RH5HpLj/sXXLmJGaNhpDlYraNZ/FdfIe9QC5e+hWTRiCeR2edo2A
         4q13hSqiRyyoNn5R8Sz3LtrvPhGh873noiEZHcH4hLEcpfL4zfKBvICfuIL3ur30e12t
         O3/z4w7stdkrfO5drw/AAJNAZ0XZR+CBA5lBpxrqwa3z96DlxMzvo/86AezZlbBafoz+
         +gf80mnpvO8ye0KjYkPrdIZpuxYckkAi4KqzQqVCZV7t4r8iQiVDpSxliYGlbAdjYDnc
         fs7qIApudXG96vg9Ui6ne2vSuicYrahp6XaVP4pfgUe6mXFS+QxFtLL1Vz8ypPbz1yEq
         nXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149608; x=1773754408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aat35daTUCA7fI7ldoBvesOFrR0W8njGOSk5Cw5Amdc=;
        b=jYqQJUY7cFm08TFZyPCbvseQXPBsomokcYCYeWlsiiqkXDKSYA+XjeceBbRvOyuXtR
         fE7seesG11QkyeABOR5FckLiEQuh2tZCC/dItxeK+wb4jReMXkucvQTbNDW4ro1Hte2P
         WG5VHz+ZHwH1TbLbczAS9N/UWX6CQn/T57pO42arwWJYn+MXH3LVRJWrgCjLVk6lbZz3
         8nMqUg1lpNCmGC+ZZX9zoFneClu4BYw7oEfZhkk3xsirOpDj6glOIB2Y3xgAUYNx7jXI
         ZinxV+TUSE1WvpzeyxZjtZ1fMGF4Lk7GfpJtI65Zt9oHSDFknwkkTgTpFyQ8WCDR4CiB
         OZ1g==
X-Forwarded-Encrypted: i=1; AJvYcCVhMf9uUE4gKz70p2CJN2ACeB+h57OxVR6B3H37YU8v4QV1p5++vLLCxN/6Rebt6wsotPYF5NWx3RPH516A@vger.kernel.org
X-Gm-Message-State: AOJu0Yyokzh9Ab3D0n5Ggkjqa45tlrPpdgMGUY7fRy66ob4bFMTgPDir
	Kv7aBCb63B2piP2ImgM++h1DEA+Olfl5zNLoRYhSOkpDRP/T7iNLh1eCeqlYdGL0JZUj/bvMmqw
	huUOw7wRLIydpRsf8ByC6VwnK+vEKYEQA25h85R5gjT7k7mImKGcvwPa928FPJM6AySgQ
X-Gm-Gg: ATEYQzyCyYcS2XGR/R/uVsml4U6Cl1EmXMulJfNmuZcBadAZnf9Qb2c4BpKoDHkZew3
	AVcX2iomEdb730bp1a5KcgprqVq6pzbB42xkyl9btXhVh4YuXVjLilBT1ikhSBv+e6mKDtwhKH6
	zF30B6pSKfebHTqSvALKitFCXpyiOQhn6vQ1Vl+/7CKYfs5ZcIJ4PVTr4WOUIyZJcFMqcoQRMqb
	8cDT6PT8SnUKZ9mgtyy4zeKp24gsjPKfETdX1/vbZOllkVDBFSHrF6aKdLZYU5MY/3l8x+Us1HT
	4ctUulfvSu8rb1iRHXHwhem0GxZzeg8QhaKv9GmuZQanH8wLRx4qRC1KNRgg9A3431w1XJ6kzYk
	LhbP2Hn+OIHinyU8c9naqKqysCl6vRYRP5wpArtTKCgxY+gCQoDU7CdAboD+heCscmCcB01l7ac
	BKfQoY7sUkSFy1RF/DaW4ty6C68kGcZqkAWW4=
X-Received: by 2002:a05:6102:54ab:b0:5ff:1cc2:aa8e with SMTP id ada2fe7eead31-5ffe61e765cmr5432098137.30.1773149608553;
        Tue, 10 Mar 2026 06:33:28 -0700 (PDT)
X-Received: by 2002:a05:6102:54ab:b0:5ff:1cc2:aa8e with SMTP id ada2fe7eead31-5ffe61e765cmr5432068137.30.1773149607980;
        Tue, 10 Mar 2026 06:33:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfc545bsm5014381fa.13.2026.03.10.06.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:33:26 -0700 (PDT)
Date: Tue, 10 Mar 2026 15:33:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aelin Reidel <aelin@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@mainlining.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/4] clk: qcom: Add Global Clock controller (GCC) driver
 for Fillmore
Message-ID: <eeonr5ngacwkkuph4p3vadacklqnh272y3wq5bfrkvmrqootg6@wwg7anuexnaz>
References: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
 <20260308-fillmore-clks-v1-3-976d9a6bebe7@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-fillmore-clks-v1-3-976d9a6bebe7@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExOCBTYWx0ZWRfX8nLldEwZWmgR
 Fskt7a3C4dzchk80q7pdU6VHDMgig+yfJZ8FR9h+CFpZA1girb1WPpzck3yOLdDDlpZDuFV3G3s
 pRZ2g28ypj5w+mu5jz7N9JGoijop2tbNoMDMHSHin0CRJfAK+WHsZtp8KXV4aPIoeYTla6/xn+Q
 n5OWnPpVZfNjK3cOwQUTYpb3JOxsjAYo45L8lYbL7ET4PoIZBq3ElujaZhbw8z/CSm5uThz1E5H
 xKvArmADhL5DTx337jDMK26f+0G/PDXk/1+iBG1lc2CA0eX+5VeaCLVwluABaCx6vSxaLbn0k3F
 n8a2KlH9+qu3BH9ojyFvav3DPAq0TMlGyVZqAq2s80mBT7RKeg30GBD1TlMcQQ6C6nTjKSitQCw
 orwwR0uLCsAUNIo4Y3DYIcHg8VghAvUFQ70kmxy0AXYSahWRNYZrwCUTqVJBh5ZFIsbE/IS+Gph
 QJab1KzKiJf8kaBsl9A==
X-Proofpoint-GUID: CoTFpqPB5dzHPFkZdsQMpeMz1rLiazZ5
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69b01da9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=OuZLqq7tAAAA:8
 a=Nn29QYLWgFSKcfegRr0A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: CoTFpqPB5dzHPFkZdsQMpeMz1rLiazZ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100118
X-Rspamd-Queue-Id: BE783251E48
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96677-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,mainlining.org:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 01:39:29AM +0100, Aelin Reidel wrote:
> Add support for the global clock controller found on Fillmore (e.g. SM7450)
> based devices.
> 
> Signed-off-by: Aelin Reidel <aelin@mainlining.org>
> ---
>  drivers/clk/qcom/Kconfig        |    9 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/gcc-fillmore.c | 2714 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2724 insertions(+)
> 
> +
> +static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
> +	.reg = 0x7b060,
> +	.shift = 0,
> +	.width = 2,
> +	.parent_map = gcc_parent_map_4,
> +	.clkr = {
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_pcie_0_pipe_clk_src",
> +			.parent_data = gcc_parent_data_4,
> +			.num_parents = ARRAY_SIZE(gcc_parent_data_4),
> +			.ops = &clk_regmap_mux_closest_ops,

clk_regmap_phy_mux, &clk_regmap_phy_mux_ops,

> +		},
> +	},
> +};
> +
> +static struct clk_regmap_mux gcc_ufs_phy_rx_symbol_0_clk_src = {
> +	.reg = 0x87060,
> +	.shift = 0,
> +	.width = 2,
> +	.parent_map = gcc_parent_map_6,
> +	.clkr = {
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_ufs_phy_rx_symbol_0_clk_src",
> +			.parent_data = gcc_parent_data_6,
> +			.num_parents = ARRAY_SIZE(gcc_parent_data_6),
> +			.ops = &clk_regmap_mux_closest_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap_mux gcc_ufs_phy_rx_symbol_1_clk_src = {
> +	.reg = 0x870d0,
> +	.shift = 0,
> +	.width = 2,
> +	.parent_map = gcc_parent_map_7,
> +	.clkr = {
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_ufs_phy_rx_symbol_1_clk_src",
> +			.parent_data = gcc_parent_data_7,
> +			.num_parents = ARRAY_SIZE(gcc_parent_data_7),
> +			.ops = &clk_regmap_mux_closest_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap_mux gcc_ufs_phy_tx_symbol_0_clk_src = {
> +	.reg = 0x87050,
> +	.shift = 0,
> +	.width = 2,
> +	.parent_map = gcc_parent_map_8,
> +	.clkr = {
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_ufs_phy_tx_symbol_0_clk_src",
> +			.parent_data = gcc_parent_data_8,
> +			.num_parents = ARRAY_SIZE(gcc_parent_data_8),
> +			.ops = &clk_regmap_mux_closest_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap_mux gcc_usb3_prim_phy_pipe_clk_src = {
> +	.reg = 0x49068,
> +	.shift = 0,
> +	.width = 2,
> +	.parent_map = gcc_parent_map_9,
> +	.clkr = {
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_usb3_prim_phy_pipe_clk_src",
> +			.parent_data = gcc_parent_data_9,
> +			.num_parents = ARRAY_SIZE(gcc_parent_data_9),
> +			.ops = &clk_regmap_mux_closest_ops,

clk_regmap_phy_mux, &clk_regmap_phy_mux_ops,

> +		},
> +	},
> +};
> +

Overall this driver looks very close to SM8450 GCC driver. Is there a
chance of unifying them?


-- 
With best wishes
Dmitry

