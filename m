Return-Path: <linux-arm-msm+bounces-108414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKa7GPkjDGpqXAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:48:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0431C57A795
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C3F6B3031F49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34BBB3E1235;
	Tue, 19 May 2026 08:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hU6Cv8EO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLQ59JtN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFE43EE1E5
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180451; cv=none; b=hT1GhZWg8ISRdzV7d50AFq3PqZj6nP/1QUMtsQw0yWui0/S4pLM93fFE6XwyYxc/JuKXgsksFoFRcfWmraCknEbm+IS1cqp1Sc9tcOZKRa1i29hK4r3XITXBV373HPnsZ7EEpeCbJ8U6hgl4NbqaBfEC7Q6GLLGXzNaIHqh3afY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180451; c=relaxed/simple;
	bh=YPp5f7tmeMst8GKKxijr/AboKJkzB8aKNlLYibIXw48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ax+XrXHDadqY1+ciSJNtlRtBWLn4cFgi6wc7STYCc1djdsz4GfheSZQLzlQW6gFOAwFyBGVfaKWBAmcEUQ9eQwCG0/Qym6vW2NPqBfKR2WLvEjcySfVeEQBSZnh84R4UFw0+07bUaVsH7dpL8gHqM/5iH5z5MZS5+Yy9ZbVK2Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hU6Cv8EO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CLQ59JtN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J8HxFs1146715
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xTinPDIT42wpCfBllIcZHX8UxeyI/yWkjtmGEOTCzfc=; b=hU6Cv8EORpp4dRgG
	QR/2yMCs6NkukkXnTachheNfwe0nQIVuofMCG10qPJkA31cqXwUxUD2+9UahdTyF
	kgtdFYPHjPLcAARyiuTfqxMDQP0hNJEeFGmbQDJIhzAcDj1Shh11z4ESAkLmFqKj
	GXvAh939fXoB5aPyDbvfgpY26RnbN8/Xp6fW0nrt2cZr0ZpvWvtxPxPHBvods34W
	j1SDaSlOyOGyXbuqvHvTVwiv1WcRwmUh3l463g35fuxUNm+vtGVdw0TRu2cBZSqt
	Wz7b70TLPFaCDq/E+Rd5LDJ8OEiox+ldSt61qlRYwHrNd6kVcAdEoGPrHIZYpDx1
	y+m5Pw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8e7ehjhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:47:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c82ac893940so1543118a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779180448; x=1779785248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTinPDIT42wpCfBllIcZHX8UxeyI/yWkjtmGEOTCzfc=;
        b=CLQ59JtNCFlEIyQ2sYBEBCgAhTa9S95fVoBDVluuh/9hDSy4WxXCSU5U3lbjwxX6lD
         2lsY/0r/5LVNj79iCxxb3xJQcx+xxVioGLDS+cwAMBTzeIA79TF4U40gg6bAf0zNrV7x
         gPxAt5fadiQ2FlPdAJ4EMPZL3d5/PAmjfw0NiviGhvgdewmTFcNszewr4mZ7nr5Y1siS
         Klm6oPwvt8KdQryocNls4jRVF456FywKkkWQZXE30RvUmV3KqIM8W6ywgTuxAPlWIOF6
         H5U4IjlFGijF05pfbedEoLfwRvYRshACyYtArulrpESSNKLdGw2ug3sfsZaVpF6mmDG6
         ZFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180448; x=1779785248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xTinPDIT42wpCfBllIcZHX8UxeyI/yWkjtmGEOTCzfc=;
        b=BMStCG9+/9dVNHuvkGRqXOw1OaQEM21U2e4upv2V8f2St1JdxcKCGiSBtGt2hGfU8Z
         lbELxOp1m9TsiwR7i8ulY6j/h3U5ohsySfwmMmJG9owogOfcsBvfov0yZcfcP4MtctuF
         jzp3na+lfWjoqpF0QfsYD/wU2OeK0VbbcRVL8yQ6KStKfdy3kpysrpwoOgnZfxgg1QjI
         Bif1pwrywH6hRuuA5jZ6cnHTEtjKIGnVnnL2ZeWn46F9IvlrmaC32AapQyZeBo0t/ESE
         3a7EttpJRv8yrS9Q46uf0TQiEg55siNx9dPE8BOpME+sHT5K5EkLt6clqOuAs6JmY84k
         RLOw==
X-Forwarded-Encrypted: i=1; AFNElJ+VDwLNICuiLIxi8uFdiiNySz72t2WDQSL/8h06k/YMIlp1LKD5wpBtoxQ8vIXBUXTRRhIqAJ/Ifi4FnR7J@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2eGwFoVC+TXyeOLn/7r7kVOJp/UyKWJHv6sakkXRURrNot+cp
	QDReoZ7nG2m1rsslcQ/XFPUdylasxatjjw5ZHDM1wqBg7RO4rnpghkdJvJmjXTmTi1hUAobb1jt
	EPsMG+Q7C5oi10MR1BYQ68xWxuMxgPxQLemlYUHjhYF654kPUhIs8MYdVtEdGPiPgvSo2
X-Gm-Gg: Acq92OHeGM63bW+1Q9dlmLoUIWV12srxS2+Uo2rMjiu4A0DlqGAL8dWvd31AFPrv4hf
	aGvHo407q3sqlt8oW8tHksEee6Oonwu8CHuRuleXu9Qrj5ArmQ++pX38NC81wzEP4ggp5BLcV3Y
	//FKrjxBH8MD/FpbZ1qsihQ6BNZ8tbJjuwL3iz0aXmdwFauzPSVH6eN+uuzmz67AYCMFYJWow1t
	tNao8VeZf9ZZM0svzI7otRAfNx10QC0prZKC4T+Km4zE3aWJVmV+rb0YzCifrkoGZY5IpNJzlvO
	qta89q9inYkBzsPJ7Q39P2bt2vekq7+AeqG83bLao961yL9pJcErwMO1fuBVQUl7mntbjwbac3/
	gdW137Xa1Ke+ophik0aHGCq9WvWlNPVKwm5magVNLxRXSWQBaStgP/KTxM239s0a99h/HTMQa1X
	SsSCTV5BZy/w0GsASQb5uUaI/uRSmyEdyNY9RKLRsiK8iG3/jFbd5F+yM5
X-Received: by 2002:a05:6a00:ad5:b0:835:3f51:730e with SMTP id d2e1a72fcca58-83f33cbf6c8mr18627553b3a.13.1779180447488;
        Tue, 19 May 2026 01:47:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad5:b0:835:3f51:730e with SMTP id d2e1a72fcca58-83f33cbf6c8mr18627527b3a.13.1779180447008;
        Tue, 19 May 2026 01:47:27 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5b1f5sm17434104b3a.31.2026.05.19.01.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:47:26 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 19 May 2026 14:17:06 +0530
Subject: [PATCH 2/3] clk: qcom: ipq9650: Use icc-clk for enabling NoC
 related clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-ipq9650_icc-v1-2-4d3554c94257@oss.qualcomm.com>
References: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
In-Reply-To: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779180431; l=2920;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=YPp5f7tmeMst8GKKxijr/AboKJkzB8aKNlLYibIXw48=;
 b=4h1ltpKD9kccL2YvodSEVfLaNB2Hkl8Fsxf/yQod/s2YypHihYtk27rawOgGNmvW8b4/R8tsW
 vROHhE1F4qRCko1419rDR30OoOkGDBetO7+ii36LvSnPcdirAuBqq+n
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=Rt316imK c=1 sm=1 tr=0 ts=6a0c23a0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=mQEdNAxdQoGx0Htu_1MA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: kM4dscAsSfqzu68zVK0yAQedQ8MowObH
X-Proofpoint-GUID: kM4dscAsSfqzu68zVK0yAQedQ8MowObH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NiBTYWx0ZWRfX/KxoRRoKG8tP
 vuUkiq/cz0S7IIC+AvmxIYpyMYtx0lYBr0ddRrPoof3SBhi7gTKGweNjdcR1uD+8b7qAXQShChj
 dTLyMh+2+KVlN56VDz5CiRLiLKSiylwPrvMzLjA3JvbXwhS5/odWh6Hchr2t9IzSjvLRfbvtwNi
 wmpRk4is+YxSIMdGjlKQsijVGfbwi03/WFAFjdnA6n1xwHThgYJPjSywpxlYojURRF9ewY6mgGy
 NuUQkgqbZqp9Fo4Qi/1tVe1K9BRctFckGVHsbWaWFQeoRXJqgp1PKJlsKSbzx1vc6tHdP+u7kNj
 Rf7qvcbQ3pNDcIKGhyKIVvTy57TaoGrx8fTnt6l27zzg4LfW59Z2CXjszQQ+tppXH8nrOD2fpwN
 5OvBVP58wQAMgmBCZCla/sUhf9olv2OTYBTNbmrAbV45Q+d6CmwBBWfeaqJoCA7fUgi9WAn77qV
 lU8OK/sQW0AKOxySHgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108414-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0431C57A795
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Register NoC clocks for PCIe and USB interconnect paths using the
icc-clk framework. Without this, the clocks required to create
interconnect paths and access peripherals connected to these NoCs are
not properly managed.

Also add icc_sync_state to ensure clock states are synchronized after all
consumers have probed.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq9650.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq9650.c b/drivers/clk/qcom/gcc-ipq9650.c
index c556c2bbfd96..6b43958f3bf1 100644
--- a/drivers/clk/qcom/gcc-ipq9650.c
+++ b/drivers/clk/qcom/gcc-ipq9650.c
@@ -4,11 +4,13 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/interconnect-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,ipq9650-gcc.h>
+#include <dt-bindings/interconnect/qcom,ipq9650.h>
 #include <dt-bindings/reset/qcom,ipq9650-gcc.h>
 
 #include "clk-alpha-pll.h"
@@ -3385,6 +3387,22 @@ static const struct qcom_reset_map gcc_ipq9650_resets[] = {
 	[GCC_USB_BCR] = { 0x2c000 },
 };
 
+#define IPQ_APPS_ID			9650	/* some unique value */
+
+static const struct qcom_icc_hws_data icc_ipq9650_hws[] = {
+	{ MASTER_ANOC_PCIE0, SLAVE_ANOC_PCIE0, GCC_ANOC_PCIE0_1LANE_M_CLK },
+	{ MASTER_CNOC_PCIE0, SLAVE_CNOC_PCIE0, GCC_ANOC_PCIE0_1LANE_S_CLK },
+	{ MASTER_ANOC_PCIE1, SLAVE_ANOC_PCIE1, GCC_ANOC_PCIE1_2LANE_M_CLK },
+	{ MASTER_CNOC_PCIE1, SLAVE_CNOC_PCIE1, GCC_ANOC_PCIE1_2LANE_S_CLK },
+	{ MASTER_ANOC_PCIE2, SLAVE_ANOC_PCIE2, GCC_ANOC_PCIE2_2LANE_M_CLK },
+	{ MASTER_CNOC_PCIE2, SLAVE_CNOC_PCIE2, GCC_ANOC_PCIE2_2LANE_S_CLK },
+	{ MASTER_ANOC_PCIE3, SLAVE_ANOC_PCIE3, GCC_ANOC_PCIE3_2LANE_M_CLK },
+	{ MASTER_CNOC_PCIE3, SLAVE_CNOC_PCIE3, GCC_ANOC_PCIE3_2LANE_S_CLK },
+	{ MASTER_ANOC_PCIE4, SLAVE_ANOC_PCIE4, GCC_ANOC_PCIE4_1LANE_M_CLK },
+	{ MASTER_CNOC_PCIE4, SLAVE_CNOC_PCIE4, GCC_ANOC_PCIE4_1LANE_S_CLK },
+	{ MASTER_SNOC_USB, SLAVE_SNOC_USB, GCC_SNOC_USB_CLK },
+};
+
 static const struct of_device_id gcc_ipq9650_match_table[] = {
 	{ .compatible = "qcom,ipq9650-gcc" },
 	{ }
@@ -3414,6 +3432,9 @@ static const struct qcom_cc_desc gcc_ipq9650_desc = {
 	.num_resets = ARRAY_SIZE(gcc_ipq9650_resets),
 	.clk_hws = gcc_ipq9650_hws,
 	.num_clk_hws = ARRAY_SIZE(gcc_ipq9650_hws),
+	.icc_hws = icc_ipq9650_hws,
+	.num_icc_hws = ARRAY_SIZE(icc_ipq9650_hws),
+	.icc_first_node_id = IPQ_APPS_ID,
 };
 
 static int gcc_ipq9650_probe(struct platform_device *pdev)
@@ -3426,6 +3447,7 @@ static struct platform_driver gcc_ipq9650_driver = {
 	.driver = {
 		.name   = "qcom,gcc-ipq9650",
 		.of_match_table = gcc_ipq9650_match_table,
+		.sync_state = icc_sync_state,
 	},
 };
 

-- 
2.34.1


