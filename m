Return-Path: <linux-arm-msm+bounces-78232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F0CBF9457
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 01:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F060518A7F82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 23:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2DC24290D;
	Tue, 21 Oct 2025 23:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XC8+zj5P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBABED515
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761090318; cv=none; b=cdNS54sZ7veCWSyw4A8RoPAgEZIBcDY09y0F+yZm/YOSmjRAiMCQXewdHgb3YwuyaHS7Iy4HdZPvCfXJleQLT3AtdKbznBbMkkYQLVli1mx1j+Smkb9bbng/QxqBNrpqHtI2bh0b9YjwVPejfFK1WQBHaZuYsd08GDqBLtjHz/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761090318; c=relaxed/simple;
	bh=hqaI36cffQ+N6H5vkclCuKJLO/NutKEKE4TGLUv1C68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IFewaTGC1I+BC42OOz2odw6KgTI+yXVyuiUMASq9LgbyfEBHqh8JRJ462IlgRpzP5mlLsNVhkYGI+hWsBSqv8NzwS9vkzvJvWvLx3IcJULxDc9/a50baHEr8A3oneKz+iixC5RLRwGxMTQYnThUS4BCb1XXsyoFVfM4Ak1I7Nfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XC8+zj5P; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5903e6fc386so1071468e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 16:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761090315; x=1761695115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+9JcimR1oPxJJ5dxJgmHpCzzLYj8g4StfP1y+xgNJ8=;
        b=XC8+zj5Px7xwROt2cqocLa6a3N+z98eJBXIP2m9Tka4wCA7dqGZZXIGXJaYiW2PXma
         TmNoJ/t/nOFHgragySFnewi7PaH+80NIxl5A0GP9fOXhFyKbaXVnLJ8jsl/5zRNacnfX
         zJ0AkQxLGAYhVDs2BCc6Ck3tN5KMslnOL0l0vM0+nn13hTYet5vQABTFZs6aNsaDGp7y
         rKYP2xAF9+B4gLjNlHQkmLxgSpB6yO7GDXKP5hVjkIy03670rJ+OaZcTK/0esG7nimXi
         XhmLUOPEr9YWsFaMkXWJE4V7X5wgP95dcMkf5BJAnfS61zTuVQEjdz489RL/eQFFJoto
         2OpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761090315; x=1761695115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+9JcimR1oPxJJ5dxJgmHpCzzLYj8g4StfP1y+xgNJ8=;
        b=Y+Ydh2XetAfgJsMAk7FRKTuQbc0XL8vf3r109SyyawHTMyeh7otlbJXNl4Z34H5baN
         YaUQ2dytnUwqTohZFmSejoqL5LdDghIpeEQy5DXzywSG9L2mDxOxXU1yelsC7JCm6UVM
         Xlaw3+r3GB9/k7Typi2cUyo8tDGf2mvbcPmMeLzjVj/yjGyIT/pRq3l7hRMQebpm28iQ
         MxLrtYCZsh7i9dQNAFRKEIiHB+fzpcYZxYQcYX84j27e4DvuuvDF2PZOqozjPcMsT3VO
         RDkhma0ItbeJWQl0wRhHcz5vBKjY3wx+gu5RKk1gEB/1fbUp8+RgY5Uc+Bddum77K+LE
         R5bA==
X-Forwarded-Encrypted: i=1; AJvYcCXw0DIQdfrR/GQiSYSMSqx1YXV5w7Gy8MjrWo6LEMICW90P87yWnnydt7ooEZV6UauvJR4hJvf6we80xTBb@vger.kernel.org
X-Gm-Message-State: AOJu0YxQlG4hf1Uk0NnyUSW7zS/Sd0adoKl5Uod0Eismxe6gbcQCRmPY
	72lUSPct+kZ8+iTq9CgS+las33EX34RdSNBmxJSFXMUKjfJIF2qMAzHjPA3qscKtkUA=
X-Gm-Gg: ASbGncuztdqY0fgTyqVnHnpyGYht3d9oUfOacyq/1lcxoOJTwT2vDLHQ+MLjXltwHE7
	rNQ7/paaeT4VQqpdVNUYpkcnLITY0i/9SNFZE4FndyOh7pzpIiO+9U15ymq3nDCQWIBJIB1Tgc6
	cK3YZ5EkL3hk460OVBUTVRtxDK0R4Id86/5GKo4j8/FMUCtBv9TTq+zKi34ewAr0FJc33NT/c36
	gjQiXycAtDS2IT9kePy0+3TCCnUt7glTTjhq5rXcQgEIm0LpB+MKnBM/H1xUelcO6ng8LdnKmKN
	WJfSSVAzFEQkiwQck4OL3uUBFqbR1i9cj7bnPTa5Rc6k/zFHyJmFrQSOJa3zjK2I272zYdQx5P7
	Q9VDMMAKJmREaDBND10ZOmMXZPHAbv83ClhoeG4SKWuO97NCKuoozljhJiaUKTxpdKpQHN/yokI
	cXRxLxXsg7Erjti+m3rE7dVrf9jEQkEtUZ0y98R11ASb8=
X-Google-Smtp-Source: AGHT+IFkvlrZLjp7BFte2VhiXhkgsw0VA7kp2VSuDg5zj+7/4vxFKrYdm1LLOph8TLlb4fL/pkHuTg==
X-Received: by 2002:a05:6512:3b8b:b0:57d:9bd4:58d5 with SMTP id 2adb3069b0e04-591ea31581dmr1149233e87.5.1761090314813;
        Tue, 21 Oct 2025 16:45:14 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def160cfsm4076397e87.76.2025.10.21.16.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:45:14 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/6] clk: qcom: camcc-sm8550: Specify Titan GDSC power domain as a parent to other
Date: Wed, 22 Oct 2025 02:44:45 +0300
Message-ID: <20251021234450.2271279-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251021234450.2271279-1-vladimir.zapolskiy@linaro.org>
References: <20251021234450.2271279-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a consumer turns on/off a power domain dependent on another power
domain in hardware, the parent power domain shall be turned on/off by
the power domain provider as well, and to get it the power domain hardware
hierarchy shall be described in the CAMCC driver.

Establish the power domain hierarchy with a Titan GDSC set as a parent of
all other GDSC power domains provided by the SM8550 camera clock controller
to enforce a correct sequence of enabling and disabling power domains by
the consumers, this fixes the CAMCC as a supplier of power domains to CAMSS
IP and its driver.

Fixes: ccc4e6a061a2 ("clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm8550.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm8550.c b/drivers/clk/qcom/camcc-sm8550.c
index 63aed9e4c362..b8ece8a57a8a 100644
--- a/drivers/clk/qcom/camcc-sm8550.c
+++ b/drivers/clk/qcom/camcc-sm8550.c
@@ -3204,6 +3204,8 @@ static struct clk_branch cam_cc_sfe_1_fast_ahb_clk = {
 	},
 };
 
+static struct gdsc cam_cc_titan_top_gdsc;
+
 static struct gdsc cam_cc_bps_gdsc = {
 	.gdscr = 0x10004,
 	.en_rest_wait_val = 0x2,
@@ -3213,6 +3215,7 @@ static struct gdsc cam_cc_bps_gdsc = {
 		.name = "cam_cc_bps_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3225,6 +3228,7 @@ static struct gdsc cam_cc_ife_0_gdsc = {
 		.name = "cam_cc_ife_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3237,6 +3241,7 @@ static struct gdsc cam_cc_ife_1_gdsc = {
 		.name = "cam_cc_ife_1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3249,6 +3254,7 @@ static struct gdsc cam_cc_ife_2_gdsc = {
 		.name = "cam_cc_ife_2_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3261,6 +3267,7 @@ static struct gdsc cam_cc_ipe_0_gdsc = {
 		.name = "cam_cc_ipe_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3273,6 +3280,7 @@ static struct gdsc cam_cc_sbi_gdsc = {
 		.name = "cam_cc_sbi_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3285,6 +3293,7 @@ static struct gdsc cam_cc_sfe_0_gdsc = {
 		.name = "cam_cc_sfe_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3297,6 +3306,7 @@ static struct gdsc cam_cc_sfe_1_gdsc = {
 		.name = "cam_cc_sfe_1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
-- 
2.49.0


