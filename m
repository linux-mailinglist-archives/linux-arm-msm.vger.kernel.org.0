Return-Path: <linux-arm-msm+bounces-102467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iO0/J3Vx12maOAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:29:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AD73C87CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91A5E30BED16
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 09:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AC33B5821;
	Thu,  9 Apr 2026 09:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSe1h3KS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YFxEknEQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A1F3B4EA1
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726523; cv=none; b=kTA1uiQiDz37dvsX+3F/R05eOv1yFN4FMe+tZDhX/WFjLAyFFHZ05i/58HvG1ubEpAkw3pY6DtfBdMfAa4afmZYiUcn/7Mp4bkk2J/EJlBQPM7pRfmZ4WDWwgfJDsVmae2JxlU040TTKOFRw5IidG8xIuEpeUq8w9Fo7JjAkKKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726523; c=relaxed/simple;
	bh=5dBJhx972EX/UgMMLPtbRbChHzcFnbr/i1hiQLaiw1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AFMo0Gj8mcp8MxSSt0uQE0nwpPCIqcxNnvpIjhlXq1qHqQGfrkORLVkJbo4ehCeoaajCIJXTxMMAtjGcmd/ntEKe/x9wCofaK+sNwvWQaT//2JM9yKR/3IOLVyreuTyLShDvmlTG5aE+nwu1/5wvG0fjvdoCpPy3P3NpD4w7t0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSe1h3KS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YFxEknEQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395TjZ24107703
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 09:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F7TDWs6oVX0Gq38QI4zBHU1pWwd2/nmT/gdhyT+D124=; b=hSe1h3KS78HdDdfb
	4NVqJU+/cJrJb+Q3UjQOeZHob3cRCIPjCaWeNN25Q5N0JLuXtJN2eyLZK3CIWHIX
	rikfpUW3d3HFyp2OT3GyKgpG8ScxU5A2zOc6POXNPm2SV19hyLa5Jn2MWVXxNC0C
	6QGe/GaFBis3ZRDM5EGKhxYL4JLkclRJQHVq09+NQdvsDitp2Dm1v7eV1WlS/szg
	vR6al147DMzJfXlcpMmNMSnAJWcdhqYmp9WX4w3mhqTVAtPw3IScgVqoNCoi6Qjp
	xxy83sCgltXPOh+ByOahad5gnHBSONR+xP3fA2ABLrizlFs6rMEXiefzEj21Tbay
	FyftXw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddxhaj6js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 09:21:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b249975139so18994285ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775726512; x=1776331312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7TDWs6oVX0Gq38QI4zBHU1pWwd2/nmT/gdhyT+D124=;
        b=YFxEknEQzT6fEmdlFC0NW2fb+T/gZ+Lk5J1F3Rgw8xeNN6ZiEFH/zyKD8PF5026GpQ
         boLcQT0sjJpc3tpIsa0PfbL+DAVMKRdf4Qnh9hxpHD5byqfprm5+qRwT39mReSo65Wzi
         KGURavCVw9i8dUcstgvcp1CpGXI4X9lEtcN6/1+jfdlBHlkF0SDaQhk8nOf0l7oLnbuw
         4NYJW/dJId5cH1O9p5Lh+c6dw8ZxLfc2ZcCZ7LopmHCqkKqMc5C1mUHAa8/3fNDUKLVS
         0a9dZKXd4rAK86yX4jDBsaQHCKSMnD5gnDgtVWY6nkSyt1degraKqrd4jb0Zs707TeiO
         eOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726512; x=1776331312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F7TDWs6oVX0Gq38QI4zBHU1pWwd2/nmT/gdhyT+D124=;
        b=ns+6ZxoUBQ1qji1yZ4RGYHlCWgvecmiWmPs6EisplELZteyLiUDpjenhB5MexP5gpn
         sRoGLKntjkNzGYsG9pa1+vepSAdbSFPqfKUa3xhaBC/zJQFuRRZPEhG8Z7lccCa0HSKS
         FwIhSd7QJjS5S0xaZAhVa1iLqdynO2MoJSUJnGnTfWsAb2UBUhxEpXjXhwM2uAJgAcyn
         GnIp7pWKaCPoky5VrmFUewU7XkaodPMUCLDQQcPkI7K4naKYBCoDdFyFNFJU5BcAt5Ta
         P5W+/IpxjFJoZundVrEDacWY0SM9vmV7WnBSiwOpSbhKCUS/6YR3FAI2UrncH+OlSnNL
         eMiw==
X-Forwarded-Encrypted: i=1; AJvYcCWE6yonMWunteDAALL8nKL9U6v04NkVWrzRRwLRatNHHdwJ+RYcOBH+wnz2vStbWSDfY5PDPdyi+mYAImQi@vger.kernel.org
X-Gm-Message-State: AOJu0YzznzsgvuDq1lLdGOxaIQxfhOR3CcPlZy7i6uDDr8i5wGJg9wVR
	L1AvX1Scm1hd2pmwdtxFPcPj0DsC5esXgbI7D0/87DEvx4elUJXPl0F1PkY7/xpIU9pn2hGvOey
	vd/w3RtCe4xilW47h0bvpH4HmCWekbDSG877gouamEIVEkEDoOMtVGlZ/jcePd/mq0JXK
X-Gm-Gg: AeBDiesxx7vOxwf5lZwVTAZudi2i1eP6zs3XSAucqzicUkbGEVxnt7+mS1gO7mv8AWM
	C2uVIkoDk81CV0+5LdUyoP3RKU5ThG+Qo+KaKXcePksPkNroH72YAKPr0YKOf/CdgVfvwEBg5qP
	mg/g84BgPoIDJ4/HBrAxY0Yh20PkqbT7XGxz0IQuR1hQshqbuEixpN2bZI/dz5c5mxtZQ5vZuZo
	yQH3SPMrl/qOgqRoLJWI/CD04VyxKs5QjWSoJTF11AzA7QGEkiw/mqQ5sDdYrB8WvEfssZHQXeL
	H5zaxkm1nFe5Tm3G5mqHBSTeTND+YkfWEsC7uzamtL2RHbndiRxnceW2xzeHoeY/sZVroLHM5IK
	vo4iK0frA6SNWiO4MeURAYWQ5377Ei3MqNQF9gsQdz8r37rRZnKyg
X-Received: by 2002:a17:903:17cb:b0:2b2:58c7:2cd6 with SMTP id d9443c01a7336-2b28167569cmr290510175ad.5.1775726511847;
        Thu, 09 Apr 2026 02:21:51 -0700 (PDT)
X-Received: by 2002:a17:903:17cb:b0:2b2:58c7:2cd6 with SMTP id d9443c01a7336-2b28167569cmr290509775ad.5.1775726511415;
        Thu, 09 Apr 2026 02:21:51 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274978fd7sm311766815ad.39.2026.04.09.02.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:21:51 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:51:06 +0530
Subject: [PATCH v4 4/7] clk: qcom: camcc-x1e80100: Add support for camera
 QDSS debug clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-purwa-videocc-camcc-v4-4-5a8e5f2dd4b2@oss.qualcomm.com>
References: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
In-Reply-To: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
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
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: KhmCN0GPnw_2yHCkbl5ptlV_PR994CAB
X-Proofpoint-GUID: KhmCN0GPnw_2yHCkbl5ptlV_PR994CAB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MyBTYWx0ZWRfX5mnIa4zs0l28
 qNYVzPlbNIHcv9A9D//S332lqn/3qNl2sujMvrnKQsfKgjRG3eFQjBUxO18q/Eo70qDuJBWZ6rj
 bE3cDrNkrhofHCJWOVgwEvnyTh+Hrh2mtHMLrQGXf0AGR7X44DOIjvDng6pG+LSXKBpICGazQD7
 dD+94bzhbzF+0VQKqzQJoKltCcbvrJS7Ea9oVyDXcZQxf9L56HhsWoqRpSiCW6FZ9fGXPrHiYyL
 pfKDjSwRv+LlYXr+GmYr27jYbqryY69W5nvj22NxaSKmkSuG0f6rM/5eYsQnAjW783cBfePTktN
 K1f6OQFuaYeId8Nwr1KJdlpjXB0JmZq2eDr66J+G4hDhtfZ5CrYi1a/ytVczVB8dzO1bHkY4584
 lpPI9ORChbdQ25FZePzGVKP0svqicKDRuqMf/a2P1HVsXCV14TEdEqKYQgVSwcqECkMYXIQARaW
 a31B7HqIj2LVOAIQyRQ==
X-Authority-Analysis: v=2.4 cv=BefoFLt2 c=1 sm=1 tr=0 ts=69d76fb0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=F2hG9-dZ5E7o3FMX4mIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102467-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 23AD73C87CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for camera QDSS debug clocks on X1E80100 platform which
are required to be voted for camera icp and cpas usecases. This change
aligns the camcc driver to the new ABI exposed from X1E80100 camcc
bindings that supports these camcc QDSS debug clocks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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


