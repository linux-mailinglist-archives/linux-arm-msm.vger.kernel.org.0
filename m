Return-Path: <linux-arm-msm+bounces-5462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6A6819553
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 01:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DF571F26238
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 00:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099AF23BB;
	Wed, 20 Dec 2023 00:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZeqmLtfo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5E623B4
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 00:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-552d39ac3ccso442455a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 16:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703032254; x=1703637054; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfDCSXNar/0OypW7xIXC/SzvfN+SSQCc1nv247H/a24=;
        b=ZeqmLtfo6JFYe9N5fUjBun+6jpfOa4GSggXv+qpbM4aV4W4TbN8lSSlLIArybUtcJb
         RCm/uhE49H+OEcUHVz4wdgtibP42Mm/an3C3y0rqNK0M5tK8yIXBPnOJJsidiRcat3GP
         328GLhkifGLR1n6vWTtYp9zT0/yiBwC5R8/FpcI0RSljOpM9T3O7kVMrMAHnsJ0O4YIc
         FAwfybbDKvohUwL079W1nntJuK1VMf9jdapZFbXPo0WelHYTLLI69xXhfLNBJmTwuVZS
         uOr3jGWcdpLSDjnEJoi6uR7NK3GAP0qAYCzua6zRk0yGWVgj2weFLPML3GGygWCIfX4t
         pnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703032254; x=1703637054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfDCSXNar/0OypW7xIXC/SzvfN+SSQCc1nv247H/a24=;
        b=D19h6BscJsgzC71UuN/9HkzCsAtW2svn0lgXknfm7SRLREvSN7E3S+LIpHYPGlLE4I
         pvRENCSkDPSF7y48XuI9S0m9LZFPOVy4pzjklVQQGVOkT5n9ZcSw4cViGGeDWVJD4SFD
         q21OcMqshPirrgUTNhhk+KgnSGN+jl46iiXKknRttCDMQZ6a2h3goa+Lky4iuX6qGL4F
         X2u3VVKCU8JZvYAqNRvJ2GqL8+X8dUkeW94MnPvbo6ly/K/+RIUKwyl48EAWSPmNriSK
         zWw3V+W8UpgjslbR963FE6Yg4NBVKBmQHyrv0AtneLbItQbL2CjCRGT2DSfAMWttSc9u
         Kjqw==
X-Gm-Message-State: AOJu0YybrtmoYAKIP5Fel480CP/lQpiNrf1ulOuvTkMs80bs509o5PKI
	aDo79F2v//uQlJnVwT3guoj27Akw1LlOcA==
X-Google-Smtp-Source: AGHT+IE8ACDxyeMWX2kPyLKJIyjCHQDQlshb6NC+I+qhFPbLjG7VrI/1HUAyIX8u68L2QJuaqqm/Pw==
X-Received: by 2002:aa7:d448:0:b0:551:b477:8e58 with SMTP id q8-20020aa7d448000000b00551b4778e58mr1801142edr.13.1703032254401;
        Tue, 19 Dec 2023 16:30:54 -0800 (PST)
Received: from [10.167.154.1] (178235179206.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.206])
        by smtp.gmail.com with ESMTPSA id k16-20020a056402049000b00552d03a17acsm4824397edv.61.2023.12.19.16.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 16:30:54 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 20 Dec 2023 01:30:42 +0100
Subject: [PATCH v3 01/15] clk: qcom: branch: Add a helper for setting the
 enable bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v3-1-3e31bce9c626@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v3-0-3e31bce9c626@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v3-0-3e31bce9c626@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703032249; l=1413;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Bhpm8sfSCBACZPHOO1eUmAv4id2tp/m4vWhfhP3T9EI=;
 b=y6MBItszK6bIeyi7CDvuFWntvQh3lvXjyOQbIgMOK9B6+WVV9OJuisYq9tjoajhe+InHPuwjy
 bINoIU1LM5qAUrvYk0US/q2rTlJfui9It7KtcVJMuZd2jmXdMXtExvd
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

We hardcode some clocks to be always-on, as they're essential to the
functioning of the SoC / some peripherals. Add a helper to do so
to make the writes less magic.

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-branch.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 8ffed603c050..0514bc43100b 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -64,6 +64,7 @@ struct clk_mem_branch {
 #define CBCR_FORCE_MEM_PERIPH_OFF	BIT(12)
 #define CBCR_WAKEUP			GENMASK(11, 8)
 #define CBCR_SLEEP			GENMASK(7, 4)
+#define CBCR_CLOCK_ENABLE		BIT(0)
 
 static inline void qcom_branch_set_force_mem_core(struct regmap *regmap,
 						  struct clk_branch clk, bool on)
@@ -98,6 +99,12 @@ static inline void qcom_branch_set_sleep(struct regmap *regmap, struct clk_branc
 			   FIELD_PREP(CBCR_SLEEP, val));
 }
 
+static inline void qcom_branch_set_clk_en(struct regmap *regmap, u32 cbcr)
+{
+	regmap_update_bits(regmap, cbcr, CBCR_CLOCK_ENABLE,
+			   CBCR_CLOCK_ENABLE);
+}
+
 extern const struct clk_ops clk_branch_ops;
 extern const struct clk_ops clk_branch2_ops;
 extern const struct clk_ops clk_branch_simple_ops;

-- 
2.43.0


