Return-Path: <linux-arm-msm+bounces-74700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FE4B9C6BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ED263822A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2902E2D1936;
	Wed, 24 Sep 2025 22:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q60/sf+f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450502D0620
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 22:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758754759; cv=none; b=MDWU1G/Y4x4T61brb2HMDeU5icNb9mFjdAA3ndjT9TJ7P3/WZm4MgkAR8Xp6MCIiV4JdxY9K1ukphBKPlyGZ0+kMxWsDegupN7dFvIhn4nkuS3c7TJCbsgQnT7wByaqRodQQcSuMGKzzNMW6tRTBiuo7CEjEQAcRzygn4TO9QHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758754759; c=relaxed/simple;
	bh=mEGnnXQgRlibWKuAk39UVRorVYhtRQYwVxrKoedzLa4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h8yPX3KkeP70JRBlszS3zD71l6dda9f9GRe+lh3RXZWJtF3IjxoTtvH9HxtFM+73AVs33kbwwrWyTig++1LU7QjpADlQHrAdt4Mj/c4CUJyx5uI0Leyx2MvCO9XfNdIEQknDhHknhz/QzRoG9Wl5DaBhqXCF+TeyMkxs0/CpHLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q60/sf+f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCkQ0O029712
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 22:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a4VNN7OcsZVUmjAxeKnFHAYtKksEdV60jsA1US1GA3E=; b=Q60/sf+fy2I5g/ax
	qLPNBZFiHiYLzxF1HWQkfOTcTl2LoL6AM3OImurH+26G+p2Ak0geUMqs8okTb56E
	vON5pEJTAb+y9bo+l0b9THctX6q1VWCtB5rAhyagmhbGvql/4R/6GBiT11HlrFIf
	S+ookruyguBd8OvuOYHfHd+IW3CXT+ym7+Qf5HYbcb8u9N25T6HgVIKtO82zrnEA
	TX7ULtKd88Th0INexh88NgoUggx6rLgTxLv7LeS3h+hDk6RHzEvkj20tDUTMyuWw
	fJx0rKK40G9NIMjXzhFIlBP64ZRqzlRusFdCcYq/sNbE7cDLGTCxiL9g2YGBLzhC
	bdef7Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fnufg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 22:59:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77f2e48a829so505632b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 15:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758754756; x=1759359556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4VNN7OcsZVUmjAxeKnFHAYtKksEdV60jsA1US1GA3E=;
        b=uuWEh19I/4sQHk5bv9zQvry0g9bURaJOxZYUDZlfNTmtkb1CDLKgfIUFGkV0f7Hzt0
         3NSg02V+szrUWQr5jAFEHCpR12zkXr9S6FN5MmPM72fn+mdTNYBGhoBCeiAJPI0suCzb
         aYtS6GSH63tP9GDzKqDGzrV4N8SQInRqPXOS5JOq2PbLmLay7fV0708/H2s/Qfiiiu+e
         2pC1SybxlzRRmfBsRfFcqM9sjgcvJ9LXe3bah4KGLlfNYf1d1wgP6ZGQVkx2WRskpQb1
         ywydhdCmjl8055kbl4Ly5HkBY2Hrc5l82NssVd+rpkzs4sEmnejVLBgS+vCk2XIxbNU+
         1Gzw==
X-Gm-Message-State: AOJu0Yzh+9Z4ih9rPKFj+a6dqw+v1q4DEzkjjFruqx73tWR6XCQDjl7j
	fAugmHzHmMAP8Em6n2/MSEqpim9OlCoaIm4QMIGsuDxgePMHelHllaglk071SobkzfDO/TgX4bO
	qHr85z4880HR2g6vrLwhkk84cEU5GzQos/QnrsXLqSGJJbYSxAQH8AyTlw6hekDkwLx2F
X-Gm-Gg: ASbGncsprZ1BeeHLsi2TNEkIrbvOJkIe0z4tkvY4dMeo4sY8qOOvmJquxf67lnAAQ2c
	iffX60g7ANvhXDo7AabKcejGaxuObkw7TG89d3Y/H1dDSSGHgb89pTOZYZkLe9AAegzq4hyDKf2
	UeRe0RJlSLxgwj/2d68fswUI6Muzb6xg96eFV7B99WnChL/g4MtXFm1/1cRQdY/mLzUBKfAlcMu
	dQ+0sk98vyPsQEeDpyMNROyob06GW3+ouJ7iyJyE0CenovHQzB11C925MTWtDQ6ZYQjOhUdrtBX
	Zqh8cUOTGnVMzHnOpf6BdBrn7rQZHb97MUSQlFFhtkTroLp/2KWyTajN5VXaPN2Gxa6Xp44isZz
	/Zu3RBcQ2snAwXiA=
X-Received: by 2002:a05:6a00:4b14:b0:77f:169d:7f62 with SMTP id d2e1a72fcca58-780fce34191mr1734284b3a.14.1758754755401;
        Wed, 24 Sep 2025 15:59:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+JrMSMxMf3OSCvo3iH1iXyF3Cweojs5lsX7r1Sy9Lpzpev8hkplQj6hzhhUapLDwvvOD7hA==
X-Received: by 2002:a05:6a00:4b14:b0:77f:169d:7f62 with SMTP id d2e1a72fcca58-780fce34191mr1734248b3a.14.1758754754815;
        Wed, 24 Sep 2025 15:59:14 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c2b70esm111166b3a.101.2025.09.24.15.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 15:59:13 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 15:59:01 -0700
Subject: [PATCH 9/9] clk: qcom: clk-alpha-pll: Add support for controlling
 Rivian PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-clk-v1-9-29b02b818782@oss.qualcomm.com>
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
In-Reply-To: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758754740; l=2779;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=CzA5NXZyz2Pthy3HAxfe93Es8lzKUxFSwzcPhak9IUo=;
 b=IzvTSeUy7yNMklbDQREM9TPVxw5tHN+dQiuHGt802VXAb3ScVzm8U5e2OIdEZT0uySkhcT+Pk
 y9ynxfjkuh6BIDoh2grV0nfyyEw9AHRbSH0H6oS5oLvALIaQioHK43a
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: QndkMALQh8FPbOd_ZrbWzRcLbXjMe8sv
X-Proofpoint-GUID: QndkMALQh8FPbOd_ZrbWzRcLbXjMe8sv
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d477c4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=fFf9reVGpRxvdFVPZdQA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX6ok4J99b5ZHN
 3iHMAhGndWt3/lTdlHEi/UCz85FTvLdPC84vRqcZJSdGIdSU1YEQvLkLBQMk5q1sMTBz8lY75fG
 i8mz+VhTDMCRtKtU8UAAmHlwFpP8NtKgotfvOvkS10uErcqadnpqmHXhlern9u4TMDCj/HutsMf
 vUS4+2YZ2cN89l0UtczLYi3RBM2OaPBpy74XQ6hiutVvV3LmxAm17El05NF9guez/cO8A/csjnT
 dkxui4Wzt9u22h5ISYtkaFhtl/6i52x9UH//06MRnPhEdU2nxAlOGpeME/utSES923OCycx+vOT
 ToHZoIepoWA47/OdL7JJgyeGdHiD5guBJhbxwvirycIaddJfsuYHQVMFek8WmgAcoyVpHZL/KWx
 A8/MTqXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add clock ops for Rivian ELU and EKO_T PLLs, add the register offsets
for the Rivian ELU PLL. Since ELU and EKO_T shared the same offsets and
PLL ops, reuse the Rivian EKO_T enum.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 14 ++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 6f50f0c4b984..3fbdee6e67f9 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -243,6 +243,19 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL] = 0x28,
 		[PLL_OFF_TEST_CTL_U] = 0x2c,
 	},
+	[CLK_ALPHA_PLL_TYPE_RIVIAN_ELU] = {
+		[PLL_OFF_OPMODE] = 0x04,
+		[PLL_OFF_STATUS] = 0x0c,
+		[PLL_OFF_L_VAL] = 0x10,
+		[PLL_OFF_USER_CTL] = 0x14,
+		[PLL_OFF_USER_CTL_U] = 0x18,
+		[PLL_OFF_CONFIG_CTL] = 0x1c,
+		[PLL_OFF_CONFIG_CTL_U] = 0x20,
+		[PLL_OFF_CONFIG_CTL_U1] = 0x24,
+		[PLL_OFF_CONFIG_CTL_U2] = 0x28,
+		[PLL_OFF_TEST_CTL] = 0x2c,
+		[PLL_OFF_TEST_CTL_U] = 0x30,
+	},
 	[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO] = {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_ALPHA_VAL] = 0x08,
@@ -3006,6 +3019,7 @@ void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regm
 		clk_taycan_elu_pll_configure(pll, regmap, pll->config);
 		break;
 	case CLK_ALPHA_PLL_TYPE_RIVIAN_EVO:
+	case CLK_ALPHA_PLL_TYPE_RIVIAN_ELU:
 		clk_rivian_evo_pll_configure(pll, regmap, pll->config);
 		break;
 	case CLK_ALPHA_PLL_TYPE_TRION:
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index fc55a42fac2f..da7d3d755923 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -32,6 +32,8 @@ enum {
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
+	CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
+	CLK_ALPHA_PLL_TYPE_RIVIAN_EKO_T = CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
 	CLK_ALPHA_PLL_TYPE_DEFAULT_EVO,
 	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
 	CLK_ALPHA_PLL_TYPE_STROMER,
@@ -210,6 +212,8 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 #define clk_alpha_pll_pongo_eko_t_ops clk_alpha_pll_pongo_elu_ops
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
+#define clk_alpha_pll_rivian_elu_ops clk_alpha_pll_rivian_evo_ops
+#define clk_alpha_pll_rivian_eko_t_ops clk_alpha_pll_rivian_evo_ops
 #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
 
 extern const struct clk_ops clk_alpha_pll_regera_ops;

-- 
2.25.1


