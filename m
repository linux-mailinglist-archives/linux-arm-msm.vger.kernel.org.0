Return-Path: <linux-arm-msm+bounces-83293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F57C864BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 18:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7D3B3AA1E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 17:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFA532D0CF;
	Tue, 25 Nov 2025 17:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CIk+mNR9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjEWYBwW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C33B32C937
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 17:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764092752; cv=none; b=b1rYcbrv9oBtdLfFCIQhN8F0RqK5TkPboYJXIFZIw6HroVMI0NCoF2iRcLTC9gEu1E0LOf6A4NdWf6J2P0b7Dg28NIEtPHpul8T64MByaBRb8+EzFfQ6UdAD9T/V+FLF9oOT8xyHucC8F98cYvat7xnRNIKi+Yuh9IjY0fOzXDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764092752; c=relaxed/simple;
	bh=uaUKb71Wii11zvNl5sxMKKfa7cNnprwc4J+HBmcQEU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nJ+rzDyV6KHZcyunfreWnnS043ug67EH4YTAQoyhfj4vQOWeBsIMdClw/W8w+Nd2z3VDS2LP/4fAtIcaI4/xfswuXOv6xJuPxDvpP4uVjJZvW6FTgKr6XrtdUSS4ijbKe9Jd8NlDbxnx8FT8rSrrDNju/UDv+MAHUIbEsew9OEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CIk+mNR9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjEWYBwW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9xEUO2650413
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 17:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ONv0dzy9BraFiB+TBKyhUqYoYWxp7ST7mWMojgH7ofw=; b=CIk+mNR9ZkMiHU2V
	NUV85Z+vWMJ1lvwQa4IcB1LitcaaRUDS+oIDx2psUThKh19+4apDlC9GaDEZ3QVg
	KzIIO3Z0qXVmgk/7YL37G11MmJRxW4TkDa1/QBsUVnUZO+hab679/2PPuvrU7f6j
	V1y7LEfKlxQYfz10bNMY/zqWq4MFlR76bTK1BC87bNtUmLZY9U8riZr0XDlL1qds
	PqXqPL+S2nHJjHRNW7ZV/zJaT6obQ/TzrNLZV4roK5pfLDnvqIAcGORRELKFSSs7
	V/PwOTkinn0CrzWHYdfZuT+VmW9mz4lqzNxNAhIUPMafxM13nt9lAnaCINP6zJjL
	BurRLQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anaabscbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 17:45:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297f8a2ba9eso130484985ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 09:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764092749; x=1764697549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONv0dzy9BraFiB+TBKyhUqYoYWxp7ST7mWMojgH7ofw=;
        b=RjEWYBwWatTHyX3zioxtAis8Kj346kVK8E0xgo3+ixeyCRmNWHeiJZZnmvj14wJTEi
         WRrD24JDYHEBsEm/P/nTTOQLLQXku//CnidoPLkkX+DmAdmB7ONR70obzC7AxLgOgVH5
         NvMPNcRqpNDY3G1PwY0BECJryWIpNRoY+bJ87V06zIvfb5NjSsiKGVlPFRd6YnQ4c0gH
         RFA0EeVM5MPwVFZlTw0yf3OD6efLAEgJ+rR1TAwvvapGi3UGuZVUFdQ1fkGMySJxsNqA
         k6NBCv0XmKutG4ngn12QywXA2GoTNRdCy4Lg6yM/Zge7WMpmHTuLmc4pDpUqB0M6TFc7
         3A7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764092749; x=1764697549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ONv0dzy9BraFiB+TBKyhUqYoYWxp7ST7mWMojgH7ofw=;
        b=eASGkj3XXQU0o2kaD0FHXJ18vGCoHezFqHD0xank7Foaest0BG7vOPcMkPgh/JYaLq
         nyChr8dnPW6b98NI/kHHlK4LlhRadBxXO5pyicjSNHMHvFjZ8oRvBk+l+dQ+LCLGala4
         Mu4MEETdkRsjiIMziiyeIWFoHTUDMZ+wATvlR4ZITEBjA2TBQjDnLvkVczaNZX8jwsuE
         2DWDC2sEavagtP2ci4x8aQdxlO6EsioMgetTHI6291wAXJ4Eekk8EPynZZofdNIPtvbS
         TIatsKNtSSYTUZyKGO37AwjeWRJ1TcFXce7uAtBVOwi8jLWT3TS7UjjnEWAdeRoPPIvb
         NGEA==
X-Forwarded-Encrypted: i=1; AJvYcCUu2hTvxPw5/i9I3OtvBz9frnu0/yChMqrrE4hRLjBNVpO/plC1OMXPrDujL/jYOyAnqd+QZQx43ZpsrQ3t@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1nCVVN/+Tpbl/i/TXU8L3vmFKjcWA9ZK4u/KS+krG8hIyQ7fK
	sCpTOu+9HxIOWusUCRS/StflF689ZRoZsLxv8vTP6R6P1IjmlgyJANVyNxQzFmFFUqWc7JnFzgA
	31TvpnL1wsDls0nSbViUea0ZxUyJCr2ReivC0KjyviG5a572n8XFyqiErt0XNFvsrtcqN
X-Gm-Gg: ASbGncvvfNYSCYukqd4o1u22QG0VNFliy3kDhu9sxddFz9JOgsZZS03wQGuGLcaZOhJ
	aPLAq5GgGSwHsMvc243/GwVziFKrSm7sJa5h0lX6F3x8jlLI3S7FwavpcRPOMVqTfhHu0FjPEeq
	g2Z41OXAw0S4Ng76kGFuk8aZULZVIlx5FIKbfGQsj2Nk/GmVYp5vrSU+4VDEXzJEIpmPr5g/4FC
	GzdY7WYgN6mX8YrHcQDiu0LgDHvJLGdoivDtxHb0jXt3ZkzIufNgMJ3U4HhE/5b3kKKfQhzv1O4
	HuPro3GO5OgLwfOat2fU2pswGCoxZZpfNM4nF6cUISuS/WJt9dW6krjwMASNLz4yC0Wp/ZDeUvG
	WgeAY9g3Gt5hJXMlJ2Kj5ostG9XuzkgWg/Q==
X-Received: by 2002:a17:903:32d0:b0:297:c272:80ec with SMTP id d9443c01a7336-29b6bf5f043mr212995915ad.42.1764092748715;
        Tue, 25 Nov 2025 09:45:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvwp9H67m9nkeaPfXf+UyZa2R9bATzOBDe1yjAHO6XFle1m9u8q5H+vR7VP0wbSA9gBQxQYA==
X-Received: by 2002:a17:903:32d0:b0:297:c272:80ec with SMTP id d9443c01a7336-29b6bf5f043mr212995425ad.42.1764092748212;
        Tue, 25 Nov 2025 09:45:48 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 09:45:47 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:15:12 +0530
Subject: [PATCH v2 03/11] clk: qcom: clk-alpha-pll: Add support for
 controlling Rivian PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-kaanapali-mmcc-v2-v2-3-fb44e78f300b@oss.qualcomm.com>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Vd36/Vp9 c=1 sm=1 tr=0 ts=6925eb4d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fFf9reVGpRxvdFVPZdQA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 1C8dGVzh5rS-CCO6yQ_yWzN1eV4ubDlD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0OCBTYWx0ZWRfX7vgjBYVzk0cy
 MR5qV2ZW/R0bL0bPI94jwB9tEvK5ZeqP70wMfcXPR14O1wi25QvfGT2/A4ZjOXoaaItrmDNui1t
 P9E5Ss3FYH5tgTwtef8O7UWVpkOoGRkjpscMgDQ8UoWH6tIzrhDrVrwVZAJ+6Wi7M4BP5ewBR7/
 7/TnwHT7a9j3kloLPYJXaOv/rMSMkAMwFj0983Kk8A+imR9AC1OlHv50EbfTm+Q366yIcls1eMi
 PZVtbZJDK3ewo4rhD9iwZGGSuGTav2kassm1jkCc11GunlZ2H5yz2MVQNIGWF4xVIiQtsGEt/RU
 zw3ByJO7EN6ftuFGeZlQdhcK//jdp4UP1JUSiZCzdBbZPMT6M9CKrWqBH/X+iyUAgwS9+HSj4Kw
 5CtFnVgad65Yvnth2YXkIIyMHsMfQw==
X-Proofpoint-GUID: 1C8dGVzh5rS-CCO6yQ_yWzN1eV4ubDlD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250148

Add clock ops for Rivian ELU and EKO_T PLLs, add the register offsets
for the Rivian ELU PLL. Since ELU and EKO_T shared the same offsets and
PLL ops, reuse the Rivian EKO_T enum.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 14 ++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 6f50f0c4b984e991982ee8914a496c00c4ee063b..3fbdee6e67f9c82a2b93f2624a112934f01686d5 100644
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
index fc55a42fac2ffe589ba270010eb47c0816832ca7..da7d3d75592373cb2df472b9976f8c7063dc5021 100644
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
2.34.1


