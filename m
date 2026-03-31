Return-Path: <linux-arm-msm+bounces-100940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHoIK2xby2lJGwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 07:28:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 500603641C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 07:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E9FC3090912
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 05:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5B336F411;
	Tue, 31 Mar 2026 05:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F6zrv2Qe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGVxEpfe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2520285C9D
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 05:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934703; cv=none; b=RbFWQLg1uuE8krPMeKhdhH/4jLjDqi8WCd/OGJjoz7+SRyfyNnSgKIrz9KMGbXi30EZ92bjMy53uv3jB1ksG/Wdaz0HAMjnp3rT6o2PYuI7afEoiQ1AIp1AqXtyWKR+zi/hPbM2AWk1MarH93W67lGvgNL7oRYydI/erZbntpFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934703; c=relaxed/simple;
	bh=5dBJhx972EX/UgMMLPtbRbChHzcFnbr/i1hiQLaiw1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FIybH8wvx3ZUxrILK39HJ2FVj6a/21fZxrEa+TcjIH/6orQdEVAm8RhVCnznSMxZ0RYtIU+6VgBxKEdC9YDBRJu71Uu3kxp5ZgaRTYvUQLmvAWj81kxeDuSqKMnrEpkpNMkIWl6Lbj0PmJdUWA0d4ZqLIEjqgyxxFfiLdLtEjww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F6zrv2Qe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGVxEpfe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UNmI7s3175937
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 05:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F7TDWs6oVX0Gq38QI4zBHU1pWwd2/nmT/gdhyT+D124=; b=F6zrv2Qe7GnzMnv/
	k+IAmH37x7OjnuDw7RQlOFf13MknULBwjSOPPLBv4CJ+Ikwym/Xm6XwPe4fo1uqS
	kUJp1DDAvcppa3cNCY1pTptw3Jxg8iGwtN3sjO1Q7qIG3VwnCowq1raqhbAUS/43
	V4Opg6DEQ0EERxpCCmCsPw9dTEq9KZcVWyDjkkFc1U5nbJuFa+tHfOHVE1fdSYky
	oiuH+DK+My+gmb867IQcm08pWTRtdWdfbtF0fOYSN4wASFL7YmdblwcKHUp+wL4E
	4lNE5AqQgdvksQjxItsMnhhbGD5TAWVD3ecVLRTlirr8mxBHWlcGf9OWFS4yP9uc
	/6j3Rg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h3seg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 05:25:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c709551ec08so10452164a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 22:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774934700; x=1775539500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7TDWs6oVX0Gq38QI4zBHU1pWwd2/nmT/gdhyT+D124=;
        b=FGVxEpfeaIsf0Rs+CP5oXk92yDxFXb1453JA/PJE3B+n99ysJZJSObVHgDV71e+WMB
         RjcCcaoFWOZ/AoHRU4C6jYoYf/2+rQ3PcAdlBPcJwjZe6E+hghd2NBeRHlN1lED1DnAn
         3VmUqbM8s9RA6poNPxrIMZN7CzRGOJXfhndk0enhBvVoHYi2pW12Odc7oZtrEmGLSaGe
         n66g4sC1TdGAPra3OWFY4Up7fBgj2RC5Nv2ynafbdznq1vToojrpe5vZ0loWq4W1ToSO
         dn/fUYcfp7iHX3sdnp+mYARFCca82xomSdtj/pmdryxt6YgjuM7YTg1Jbo1zbjA1ZDcf
         CXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774934700; x=1775539500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F7TDWs6oVX0Gq38QI4zBHU1pWwd2/nmT/gdhyT+D124=;
        b=pSEWi4scdz9v1MXyVQf5WIWKWQ2gK29TISuGnGG55ua3pJR12wpmvIyfKAFgkbfdxD
         GB4rGsx2XS0G5cFnHh+uSc7VgUFNAyfzMj2BU2dW+TI/9pCWux3RSEjVDKJ4wnpr1Ru8
         0OkLDrycRddI6fnU/wuzoNje3OZ7xnaDXgTRIWhQ8GgNjTC3n5C3/s3Gn+37dzFYOkI5
         YaokjCwngn4h1vrF4uKE3a1UjjkczvEUjSevQK5LCvXHwUJmMb9akZl6wl3Q/O5Y9z/+
         aKvI6g4pK/8TZlMMxbRabCvLg8DQsaF7tqNA5U6hCcP5EtaXdVN0zqdsHacu0Kkca4oY
         r7qg==
X-Forwarded-Encrypted: i=1; AJvYcCVekYm5CgEmCg+Wm/xtk3XMv+RhgF9T3c+Y7sMdMjJSrynoB8sxW3KjNAR7Q2tMJPxEY0STG2nXXF2VGX+4@vger.kernel.org
X-Gm-Message-State: AOJu0YxH5j8MMf3oFOi+YayWUu3KbZIsGQnb7996jl697VaA1Yz6TQBG
	MUHQi7BSEIImNnyBotg4YYmhb5CJsyEfW1NzO+PHdZsBTSlJOaAMjMXVfKaO6s1TPOgKO2gq9Qy
	ZBMIoJj6tWUMWndJFBh4CW9yHgt6yuWScS/qsAIKrBv3jVUOu96ALAfqMKvpO7sbWiy/Lm6FEt/
	nz
X-Gm-Gg: ATEYQzw3ZKmlWr16aWzSLlwL66s5YSjVaF+2KM6UcsoW8AufdhU1KSn5Q2qMmo0F4Yt
	WqSqfn+QSXMaZHPoYFlKpUpc2EPrwd91MOKnl/k7ZfLImRexifJNTEtXXy3SjCCBlHyVV8e8WYD
	wGieSbrybgW3iVe8LViCxfjtVrO2zkSDz2Mlkt0DLqCqwetjuv4wC3+GxsQxUHeEYsIvEVjpKqD
	oyJYoFKoRss4jo2EqDCwREhG9a0yrTdxxWMGr0tT7wKmjX++ASREgJ7syhtRuO/vzZ9J/fi+YE5
	pUIZcLfC58TCxzVyHRiMJ6JTf3EfLC9blyj4vkEQYJcun9qK5L6BJojujTOCSjIYaEKr0s1Uncb
	NThoGCWlDTimTLzlXJWF0F8xPPdRNQzYx9d7xSZNSBr3C0a3MeVvz
X-Received: by 2002:a05:6a20:7fa4:b0:39c:787:f185 with SMTP id adf61e73a8af0-39c87915751mr16564442637.29.1774934699541;
        Mon, 30 Mar 2026 22:24:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:7fa4:b0:39c:787:f185 with SMTP id adf61e73a8af0-39c87915751mr16564404637.29.1774934699108;
        Mon, 30 Mar 2026 22:24:59 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843db09sm10270751b3a.7.2026.03.30.22.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:24:58 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:54:13 +0530
Subject: [PATCH v3 4/7] clk: qcom: camcc-x1e80100: Add support for camera
 QDSS debug clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-purwa-videocc-camcc-v3-4-6daca180a4b1@oss.qualcomm.com>
References: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
In-Reply-To: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0OCBTYWx0ZWRfX0++N3gKn3mwE
 63wXd+cenYA4th6t45Jyr2+CvrrkthhHcjtyL2/i6m9IMV/zi0eQ5XpnpqoUQuifJYobaUmmiCb
 mlh6d6tfMUNlRb1mooSWAS2C/9wrXu7vTNZb5qGqqr6tfUvon/CHb5MrP/1ZX6Uu7nDB/V4ykf5
 jvLURrpopjpE6sySS1Kp9L84xNh+cw6LLcgv9pZZAV0upkDzsGpNuKa+LWyuomcxjLTTlrhR1PY
 Lp1oqiY9N+2j8XkFEdxfSMl0jpVJDh/Gzl4YZY7mNgMa4I7s5/qlKOMyr9giZgP2DCFswsgbnb6
 45yINJDdp9X3nXs/tH/d+2bu0VO18XEUlkb00XU//t8CfVEdzVx2yd+j4CrT3ZFMyWFMQbX3i2I
 wQNIEs9ATdTZfyPRkFE/vATb44sKXGlFxxYCSNCjtMvETJJtNjJVErCeubhCyeXGbi/sBAgipuV
 Q8nMeIdYtPHE4jED38Q==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69cb5aac cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=F2hG9-dZ5E7o3FMX4mIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: -9PxfjIBCtEvd5u-As5OFF9KtFID_N7y
X-Proofpoint-ORIG-GUID: -9PxfjIBCtEvd5u-As5OFF9KtFID_N7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310048
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
	TAGGED_FROM(0.00)[bounces-100940-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 500603641C5
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


