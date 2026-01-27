Return-Path: <linux-arm-msm+bounces-90872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDBoJNEReWmHuwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 20:28:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F96199D06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 20:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D249304F232
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 19:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE8636CE17;
	Tue, 27 Jan 2026 19:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cz+nzRrH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MUSFcK1B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A3436CDFB
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542027; cv=none; b=k+X0GyldjQ0GT9RLLqSwTGvKLPsd55clveEyHyU7vG5FOqkZUnInDV2z3GwtSzTcB4VXBWFb57gi3JUmGh5ld7ruhJolppbL8ikWpTgl9H0cxV8jlYj/Oosq7nMJeoD90+7QNMtLeW9mcahJNKnAwlOGKAleUAkpfjVq06XKTko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542027; c=relaxed/simple;
	bh=PA99VsBvx5SIs0szb1JLsFFEYSaP5u8l9YkIWjVzo1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BAidrSFdj9XEM3/rA+h03m5570FBDqeYjEUc5Pu2pc/ZKsMKGeAh0mzSOVmQkKm6VQSMF3rklrkMAgxuXnp1rKxk1N29Vphsnv8rosYZJ9AXtsylLF9NmzRs1Xs0M7z+KaIxMYd+bMGmT1ZXpipSxUd7z0byhzPHsPz973eN8R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cz+nzRrH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MUSFcK1B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RH4tIT1195382
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u478abj+sjd2lC/OaHT9eDhnZeVzUtBngbIXopIxjcw=; b=cz+nzRrHWXi/tpcT
	QBdeiVqo8f//p7M/X5XT8G+CI3uDE1/SCSvefl9QeUeMsdsvjCJZ8jLin6/qHD/0
	GbFZQtNeCrdzkua/lFv6jTXEd5QRI/+vKKvi6EskIEgRBb1jG32nYmP5/OttQRpV
	XbxBQZMJJWnELsQP2NfIo/+Ae6YWqyJqS+60Q+fSjWczCwQiy5sk6aPtJemrgTDp
	4F9vwSPZEUsX3tzotiaIQQKvZxaOGjE4bh0GIGNXyjO0S1tgYCDZxo9Z3ensMHkY
	uFEJMJ8pEReZ8SiCsdwRjeD8GAJK3oWkqQsRifBh0lM2s0eSPC+Dk7rciFWYKcLy
	QKBsrg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by1etgfat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:27:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a13cd9a784so56438515ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769542024; x=1770146824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u478abj+sjd2lC/OaHT9eDhnZeVzUtBngbIXopIxjcw=;
        b=MUSFcK1Be3OWOLSTo4r71Qd65jmcYbhMz5MeZWpP/K79i/DvDG+psZBkI9iKirRfUd
         dcUFSjrXoRrvpEozdt0Qy4fXy/NEcsFtz2A3SVB0gRiAZK26Q5LdAMqZJQ5JK8Gke8fI
         1bPofCnwiVZP/xJW/mgYAuHRwfzp6bRUXYFM07EbubfP3II1y+dUccxPceYN92Sh7cNu
         5DTzF98pIQUjxIoZivV2iehbqqxLhOfkElYSe0Mz3x5/hYewbuzqrl2rfwDC5V3fTAIp
         Jlf+HFPE1oQoLDEEcmaANUVaamI341mU1czUj+S+4P0kjZ2V4tNntq9N9IFoOns9TIQk
         +R0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769542024; x=1770146824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u478abj+sjd2lC/OaHT9eDhnZeVzUtBngbIXopIxjcw=;
        b=qB4MOBhKmc1Y5h1jCV5nPVx07qJIgAufZ1OiH3E15Al5QXG93mPtLuuhk6YeVR1iD3
         YsTL4knZgk0rBvLpeIHN74WT/9zJ1kSQgWgzoHHyw+fG1bSi+1B6DEnuDgbT/7uVEcYb
         1ZIWvfEbXWEkAowExQje00YJAEpeA3N+/G5lGvrQxkHDx8u5yt6D6LEb3012dBALJU4y
         B0xjpJxKn6DNSJkjNa6shNLFFJzRcfWYo8G0P1D9DjbgDP3xYXtFb2LkiHTB1d+OuoYi
         A+auyiu4FFBCPMGmhFuy0mGrQkXPH3jfc5FdvuPWXU96+cBW7FE80bZE9Z59aPcRQiK5
         mxTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWHV92P6pClmVga68eKHvZtMZ3ePlqEJ8qZ1t1uIWcwDi6fzT965H/zz9GwuyBdHt/cV92tVeIk3DRL2az@vger.kernel.org
X-Gm-Message-State: AOJu0YwdkFN3ZTOFNreUcEoloC1s7c3UJw0Yg51nb14nqSf3pSW7yPnP
	Ajs3zE9+y2OtdtiDcIX/vdJXb4GgDWKr0EK3GDpRAoehjrW1k7puEOzutlJSHHKb7J/KZdtzL+n
	ZpM6QAB2j2iAhG8aHc2al5M1aZ+iIz7qKlQlIboXzivaH6mxOGRGNQEbIESNNeMlY1daz
X-Gm-Gg: AZuq6aJ8Fz4UU13xw2kC+2Ce/91oq5fzxANtr+YyQwCyVRmLP8s/xKdB9cI14k2jKSF
	2ftZmkeZbM+8Wd60bG9+67TESejXSRwiqLHiylsPzB27TPHt8rzL0t6Pbj56xuj9Np7fsxCdiKw
	ZehJaOjCoiGPkPaYPjr1gKOdXkpSBt1TY4TpikQyBVu1IrzRKDd6FAVeF3GNVtf4mLnzxR3yio5
	ZD4zxOAwPUzFsujOIoc5CyaPlvRTyKLMKNYSCjSsZjU/uW1EMDAWeS+yl6TpA2yLCFiJ1h6DRpR
	jBfElfc1Udn3DhGKdscb1NqGx3DsRHjPjBz5B4rR4Pp9rbd5pA61rAYEtWI4etHR5aj4ciz7pfs
	QTiDEq8qRoOVhc6J4TBOhxbBnKvBuiLt1rIqGSHsk
X-Received: by 2002:a17:903:19eb:b0:2a7:8486:fe65 with SMTP id d9443c01a7336-2a870d72aa3mr24926175ad.22.1769542024116;
        Tue, 27 Jan 2026 11:27:04 -0800 (PST)
X-Received: by 2002:a17:903:19eb:b0:2a7:8486:fe65 with SMTP id d9443c01a7336-2a870d72aa3mr24925885ad.22.1769542023638;
        Tue, 27 Jan 2026 11:27:03 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414fc4sm1322225ad.32.2026.01.27.11.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:27:03 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 00:56:35 +0530
Subject: [PATCH 4/8] clk: qcom: camcc-x1e80100: Add support for camera QDSS
 debug clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-purwa-videocc-camcc-v1-4-b23de57df5ba@oss.qualcomm.com>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
In-Reply-To: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: XYj5n1mxvsnQN3QoHuQPKqar6npZ8tEf
X-Proofpoint-ORIG-GUID: XYj5n1mxvsnQN3QoHuQPKqar6npZ8tEf
X-Authority-Analysis: v=2.4 cv=Tt7rRTXh c=1 sm=1 tr=0 ts=69791189 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=F2hG9-dZ5E7o3FMX4mIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE1OCBTYWx0ZWRfX4Megt4BYn5z4
 oo4wZNqgbvPzUh3aWozcft+EmoN+nos3/IFiae89GHUFIT43/WD9vNeyzg7yLI8t2yKQGjRnKdl
 ZSKex/umfSQ3QwGLAvDS9fy5GnZ6qGtzxsg4kGqohqGJcfGJ2pkzujQbZ45rTCIFGO/R/ka4rrj
 uVoH7mBab8q+o/AtQ9Oo6ZTBcIO6twMcbcdFm8BV3IjOoyAsP0qjEsm65GJc9SYZDeTRbb9V4yO
 ide9Q9ynJM1zn6gMVe3qI8rk06e7FKMxQW0MdbBTQT2aYZdTjb8hPinGxwNHTPCkKw122vqywMk
 6HOqDrBDASxau2JOP3uRb6vo5Dr3IlatZyzHDAslESVVb+anL5YO3M6Vdd3Q0RgWZ10vHiqyrWJ
 2scgsse/5LteLrbMIZgZI/CFUDB635q/uiAWzPYl6hKqwfyeixO0adpnxKwFb122hCHpKYC49K+
 B4DHqNK/PobLkwpi8XQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270158
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90872-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F96199D06
X-Rspamd-Action: no action

Add support for camera QDSS debug clocks on X1E80100 platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-x1e80100.c | 64 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
index cbcc1c9fcb341e51272f5595f574f9cb7ef2b52e..7e3fc7aee854eee841176a1330f97dc91af91670 100644
--- a/drivers/clk/qcom/camcc-x1e80100.c
+++ b/drivers/clk/qcom/camcc-x1e80100.c
@@ -1052,6 +1052,31 @@ static struct clk_rcg2 cam_cc_mclk7_clk_src = {
 	},
 };
 
+static const struct freq_tbl ftbl_cam_cc_qdss_debug_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(60000000, P_CAM_CC_PLL8_OUT_EVEN, 8, 0, 0),
+	F(75000000, P_CAM_CC_PLL0_OUT_EVEN, 8, 0, 0),
+	F(150000000, P_CAM_CC_PLL0_OUT_EVEN, 4, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_qdss_debug_clk_src = {
+	.cmd_rcgr = 0x13938,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_qdss_debug_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_qdss_debug_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
 static const struct freq_tbl ftbl_cam_cc_sfe_0_clk_src[] = {
 	F(345600000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
 	F(432000000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
@@ -2182,6 +2207,42 @@ static struct clk_branch cam_cc_mclk7_clk = {
 	},
 };
 
+static struct clk_branch cam_cc_qdss_debug_clk = {
+	.halt_reg = 0x13a64,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13a64,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qdss_debug_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_qdss_debug_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_qdss_debug_xo_clk = {
+	.halt_reg = 0x13a68,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13a68,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qdss_debug_xo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch cam_cc_sfe_0_clk = {
 	.halt_reg = 0x133c0,
 	.halt_check = BRANCH_HALT,
@@ -2398,6 +2459,9 @@ static struct clk_regmap *cam_cc_x1e80100_clocks[] = {
 	[CAM_CC_PLL6_OUT_EVEN] = &cam_cc_pll6_out_even.clkr,
 	[CAM_CC_PLL8] = &cam_cc_pll8.clkr,
 	[CAM_CC_PLL8_OUT_EVEN] = &cam_cc_pll8_out_even.clkr,
+	[CAM_CC_QDSS_DEBUG_CLK] = &cam_cc_qdss_debug_clk.clkr,
+	[CAM_CC_QDSS_DEBUG_CLK_SRC] = &cam_cc_qdss_debug_clk_src.clkr,
+	[CAM_CC_QDSS_DEBUG_XO_CLK] = &cam_cc_qdss_debug_xo_clk.clkr,
 	[CAM_CC_SFE_0_CLK] = &cam_cc_sfe_0_clk.clkr,
 	[CAM_CC_SFE_0_CLK_SRC] = &cam_cc_sfe_0_clk_src.clkr,
 	[CAM_CC_SFE_0_FAST_AHB_CLK] = &cam_cc_sfe_0_fast_ahb_clk.clkr,

-- 
2.34.1


