Return-Path: <linux-arm-msm+bounces-4791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE858136D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 17:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2D63B21A2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 16:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A3861FB7;
	Thu, 14 Dec 2023 16:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xg13y4Ek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC73114
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 08:50:09 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a1da1017a09so1008534866b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 08:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702572607; x=1703177407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YVNXxg+9nL5wJKIK1np/vV0mTD7W9fQ7IDNoTCiFtT4=;
        b=xg13y4EkPv/leP0sgCzYELXEbk3TuDxhPnNRCHAcZTnYST4fVsPdCUGq9sIG4sHjiA
         B8IaerKs2Lva07k5rUnrsI8S3oZQp3Z7xBn/z7RemXRJJy9uo1qTXF39STCkC8uUtZep
         YspDgMiayLTh7XabeMfbFtofkc5Dae4XlMbTtP8JAjkBVmoWzXJFRfhgxSESJ+6nuN5q
         3Km+t1XPRE/v9nikZyBNLSIWMG4R3IgDIUl+nKUEOfXAc/v3qz6XzCvsPF4qudi6yVBN
         /bkuNCZxsNMlrg02JOcgV27rdXxxHvGpT4wQ+qctORjgtBuRl8pHc5L7m6n51zgg0ykO
         gCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702572607; x=1703177407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVNXxg+9nL5wJKIK1np/vV0mTD7W9fQ7IDNoTCiFtT4=;
        b=f1mvmUrSdpApFfJeoXoE1W1p11FvZXuh6UISIqt9I0OfDJNu5hGUfNwgLt8OZueWfw
         OP5VZZ0NG0cC2oxiEb/N9w6pbU2Xtoyi7xSirXri1MsPQ9lydWX9NadfZRPPuZTIu/ud
         +6oc97Q3/dpfeU2NBsEVncKLzesYB1VdCDpVlvqa5dmh3S1nPVPM7GVrFklwyoT1rIIO
         PVJIXlvwmRkehybZaJ91MkDzHpIfTXQXOUCWGwI2ikMSZOjgvW72wH5/6+3sDxr2FgTr
         jAW0iAYCNkztYoqs7TqZHClou4NANm1aJ++ZGh41Zde6UA3d7+TGeIptLpmWSL22xexY
         K8qQ==
X-Gm-Message-State: AOJu0YzFsB4QlQYtXRxK0h1MwVn0c/yPkwWuxZz5iphaTRlgsS0Mm0wF
	0OMU6scTE8OOQdndsQ48INR6Zg==
X-Google-Smtp-Source: AGHT+IFjNqeKsYaZC4DeK0s39Vq559/OpBQMBEIddm7hKaejJvB8yT5aOMEVFYwS7ckfQz+zFM4P8w==
X-Received: by 2002:a17:906:5a49:b0:9e0:4910:166a with SMTP id my9-20020a1709065a4900b009e04910166amr5931126ejc.32.1702572607724;
        Thu, 14 Dec 2023 08:50:07 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id tn9-20020a170907c40900b00a1f7ab65d3fsm8530308ejc.131.2023.12.14.08.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 08:50:07 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 14 Dec 2023 18:49:35 +0200
Subject: [PATCH v2 06/10] clk: qcom: clk-alpha-pll: Add support for zonda
 ole pll configure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231214-x1e80100-clock-controllers-v2-6-2b0739bebd27@linaro.org>
References: <20231214-x1e80100-clock-controllers-v2-0-2b0739bebd27@linaro.org>
In-Reply-To: <20231214-x1e80100-clock-controllers-v2-0-2b0739bebd27@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3693; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=pUaL0S9mlmI81sPMJsRfFAirIeeYUm7HXjGy1jinNxQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlezIuJBT7gvPwd62+qbc80TrUa/uh0Vq6qT2fX
 QsjsuBAW1OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXsyLgAKCRAbX0TJAJUV
 VtVWEAC2Q9GN+p2UCaHWVOGj5g9qRarYVsAWjFKr4ic8b2WVOaMGWLb513XMqshxoMLlqiglbHp
 WTDFpl8ThRTTp7NYQ5ovUlvXIremYracN8PrIcE0PQMYJOMBNs5rZYVqIE2rJjkmLNwQq1KuYhg
 9mK5a20cCwvXA3OhPgLUvsQKEv6FFxcEUEPtDkN/3Jij7SUkXtysBbEKUdSQlc36cfsHXovF6Ul
 +hFrmFVinE9jUsf+2FRJA0r0pmCgaXFc2iXDdKVUhgwvAls9dG7rzSkz87sqkHz9cfAmB7yvMqn
 2VZp7lk+WO3pSakn0S43Dk5xDyGvPQYZ4U9ty8NOaAcjhNQXSsRchk67bHnu20q5drdfnsRMCl5
 UmZTz2YYhwJch1dLOscW3rJFQwU5VLf2RiK/XKGkbVP5VcsUxaDgzymY6EMAKCOguZHSQeW170H
 I9ktHMKv3vhDoQUIMDXJ6MsZelL19ZV52h64EP57ymFx3YBikQroursoWkEDrXU7ylI7xu8BYR8
 tOgsc2MwDSOCDnDk2Qfdhk06aZVN1a6n+SdykGBV9ErbKxpEr39kP3r1bkUUg3+w44YLznHSQRh
 t4+g2Q+b00lE4v+q/lNrQlV2IZu4c052kGjEmQ7u5+aU8usR1ehCxnsJNlMjkQNhvyKe/fAeIE2
 0Zhguy+m1FUJklw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Rajendra Nayak <quic_rjendra@quicinc.com>

Zonda ole pll has as extra PLL_OFF_CONFIG_CTL_U2 register, hence add
support for it.

Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 26 ++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  4 ++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 05898d2a8b22..85f8e2ad0b37 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -52,6 +52,7 @@
 #define PLL_CONFIG_CTL(p)	((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL])
 #define PLL_CONFIG_CTL_U(p)	((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL_U])
 #define PLL_CONFIG_CTL_U1(p)	((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL_U1])
+#define PLL_CONFIG_CTL_U2(p)	((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL_U2])
 #define PLL_TEST_CTL(p)		((p)->offset + (p)->regs[PLL_OFF_TEST_CTL])
 #define PLL_TEST_CTL_U(p)	((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U])
 #define PLL_TEST_CTL_U1(p)     ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U1])
@@ -228,6 +229,21 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_ALPHA_VAL] = 0x24,
 		[PLL_OFF_ALPHA_VAL_U] = 0x28,
 	},
+	[CLK_ALPHA_PLL_TYPE_ZONDA_OLE] =  {
+		[PLL_OFF_L_VAL] = 0x04,
+		[PLL_OFF_ALPHA_VAL] = 0x08,
+		[PLL_OFF_USER_CTL] = 0x0c,
+		[PLL_OFF_USER_CTL_U] = 0x10,
+		[PLL_OFF_CONFIG_CTL] = 0x14,
+		[PLL_OFF_CONFIG_CTL_U] = 0x18,
+		[PLL_OFF_CONFIG_CTL_U1] = 0x1c,
+		[PLL_OFF_CONFIG_CTL_U2] = 0x20,
+		[PLL_OFF_TEST_CTL] = 0x24,
+		[PLL_OFF_TEST_CTL_U] = 0x28,
+		[PLL_OFF_TEST_CTL_U1] = 0x2c,
+		[PLL_OFF_OPMODE] = 0x30,
+		[PLL_OFF_STATUS] = 0x3c,
+	},
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 
@@ -2093,6 +2109,16 @@ const struct clk_ops clk_alpha_pll_zonda_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
 
+const struct clk_ops clk_alpha_pll_zonda_ole_ops = {
+	.enable = clk_zonda_pll_enable,
+	.disable = clk_zonda_pll_disable,
+	.is_enabled = clk_trion_pll_is_enabled,
+	.recalc_rate = clk_trion_pll_recalc_rate,
+	.round_rate = clk_alpha_pll_round_rate,
+	.set_rate = clk_zonda_pll_set_rate,
+};
+EXPORT_SYMBOL(clk_alpha_pll_zonda_ole_ops);
+
 void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				 const struct alpha_pll_config *config)
 {
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index a1a75bb12fe8..99a3db9de4a1 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -21,6 +21,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
 	CLK_ALPHA_PLL_TYPE_AGERA,
 	CLK_ALPHA_PLL_TYPE_ZONDA,
+	CLK_ALPHA_PLL_TYPE_ZONDA_OLE,
 	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
 	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
@@ -42,6 +43,7 @@ enum {
 	PLL_OFF_CONFIG_CTL,
 	PLL_OFF_CONFIG_CTL_U,
 	PLL_OFF_CONFIG_CTL_U1,
+	PLL_OFF_CONFIG_CTL_U2,
 	PLL_OFF_TEST_CTL,
 	PLL_OFF_TEST_CTL_U,
 	PLL_OFF_TEST_CTL_U1,
@@ -119,6 +121,7 @@ struct alpha_pll_config {
 	u32 config_ctl_val;
 	u32 config_ctl_hi_val;
 	u32 config_ctl_hi1_val;
+	u32 config_ctl_hi2_val;
 	u32 user_ctl_val;
 	u32 user_ctl_hi_val;
 	u32 user_ctl_hi1_val;
@@ -173,6 +176,7 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops;
 
 extern const struct clk_ops clk_alpha_pll_zonda_ops;
 #define clk_alpha_pll_postdiv_zonda_ops clk_alpha_pll_postdiv_fabia_ops
+extern const struct clk_ops clk_alpha_pll_zonda_ole_ops;
 
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;

-- 
2.34.1


