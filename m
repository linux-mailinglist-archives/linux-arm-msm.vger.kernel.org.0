Return-Path: <linux-arm-msm+bounces-15429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E5188EDBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 19:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 337971C32B22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 18:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A327314F9C1;
	Wed, 27 Mar 2024 18:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TMm5uSOH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06A71509B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 18:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711562936; cv=none; b=Ts9ngls2ZDf8JY/QRDyNGEhTVD2ROgYTMcYlOz90k7USHNoSvNSbUhB5628GoIUSsYhU48Gx8obQcsffQbX+toaybtRDiB4p9kX8A9nZd6duuOhA+Lbo6JE5wKJY/qGhzsrrDVasq1dAWwPoeuz3FIYyEHfV8pybNg5SmGuNUfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711562936; c=relaxed/simple;
	bh=wJFz5d8slJE57e5GmLZn5BRO8EuIyUY4HPhwJVN9rgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jWrzVseKxRMDEVh//irXGTdY/J8JXN92ju/jHcx661NHFag5FeqeOhS9aJiB3TlICCK5O0rbgdc+xXuY3/YBGdcyiXm10HEvvBZWtw2khfuZ96w6U8pzE9jwPAaK++V4lp8sXIwYmfn0RxZHz8gTYxKSqburZz+aRLEfkEczjzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TMm5uSOH; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56c0d1bddc1so129371a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 11:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711562933; x=1712167733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwBVkmIN/f23ohmAUPrx11lmfpC7Jl/+ZfCBD2GN4gY=;
        b=TMm5uSOHPUezfr4Extnw4pnEauJg2zO4K4Kar2RmOmoGkJRy+97HmFwZHRwJylUAzb
         3ODxOUa5Ze4JjNH9YYuNDzCtesAwoggdeUgp/SR1ovHvPHzAVJOFjjQXRDnJgNA6ykIJ
         E+Jj5JJIrqgzylLXx9riLUwkJUhm5KvO7t9at29An0FBCwS0qxPtVUdaKnazrWdEo9Y7
         gd/oV8e6aSntBOEOm8wyTnToOR/ubrCYOZVzoRYHfxq7lT/6jv0zGREiI9fekapKGbv2
         aY7Nig1e+oFSKy0XTk62fMBHxGEb6JVzW1b7jwWp9zViNBuiCupVUO1aUS1WEBK7/nE3
         V+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562933; x=1712167733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MwBVkmIN/f23ohmAUPrx11lmfpC7Jl/+ZfCBD2GN4gY=;
        b=Fi85C2hN4Jq322tG3iHw+RL0cb3I3AsjVYlEoV60DHetFL1XfP44t1NrNLcNzloygf
         4k3dY7Dt6Zou0yeLFlaiMAIPUnOK7FBsMVT2QON/Grvud0dLjh8kh7/LLWyCIv3s7u7N
         cYvz2egtF89LNhf0FmvC26fy0Mq5f0eeigstEUrfA/NLCzGX3xizJ7hyf8FoTG17YJhh
         8S6hShYtZ4UVCi+MEXPuEVkl6vOKc9sjJJFQNpIhpspHVMdoLA5uSqZGY0UvZ56kGYZS
         14PQCzsow5DZ+hAPUq+2iJlAY5/6nGM+c1zX8LKedIVBXDGiXoxLD5jCCu5624Drjnj7
         wbZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7GOmyomI6cCMQIC+QZfiPIBD3BCPTQl2hLvJznG5V/gQz/4pI+uK9ba8qJSENQULZ6P8KzLdv52LqfUEu7tRc2NQNUB2MXBRfE0+1ww==
X-Gm-Message-State: AOJu0YwlCRri7s45foF8wzbYU0k3TQjQw3lr26hv6sKcUfy3DIkYYGmE
	69Tt3zDtX4kMloLSfXefLGFlwCGPu5oKolq6zpsom6vxfAlTYKY8ttiiU/J2VK4=
X-Google-Smtp-Source: AGHT+IFczK4OLDrjikdsTIV/OH2pjjMwuuZc/I3AgccnWZnTU7aC8UhvaOwiVA4JU1kLpTXRuTYorg==
X-Received: by 2002:a17:906:b50:b0:a4d:f5e6:2e2b with SMTP id v16-20020a1709060b5000b00a4df5e62e2bmr180563ejg.30.1711562933332;
        Wed, 27 Mar 2024 11:08:53 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709060be200b00a45f2dc6795sm5702733ejg.137.2024.03.27.11.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 11:08:52 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 27 Mar 2024 19:08:42 +0100
Subject: [PATCH v3 04/19] media: venus: core: Set OPP clkname in a common
 code path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v3-4-79f23b81c261@linaro.org>
References: <20230911-topic-mars-v3-0-79f23b81c261@linaro.org>
In-Reply-To: <20230911-topic-mars-v3-0-79f23b81c261@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711562923; l=2649;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=wJFz5d8slJE57e5GmLZn5BRO8EuIyUY4HPhwJVN9rgI=;
 b=Bf0NiXBrHoyEc1WvPD6HAWIxeCn4Fg0XKu3Y2qVcVxRUSCDSltlwUnL+ip3BgQppXfxv5tzbU
 WahzULqG2VFDZCeiiIy33gihXvW/COD9XjaOjejxcxynWqbz1us2wTU
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Calling devm_pm_opp_set_clkname() is repeated for all HFI versions in
pm_ops->core_power.

Move it to the common codepath.

This also lets us get rid of core_get_v1.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c       |  5 +++++
 drivers/media/platform/qcom/venus/pm_helpers.c | 23 ++---------------------
 2 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index ce206b709754..5ab3c414ec0f 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/pm_domain.h>
@@ -319,6 +320,10 @@ static int venus_probe(struct platform_device *pdev)
 	if (!core->pm_ops)
 		return -ENODEV;
 
+	ret = devm_pm_opp_set_clkname(dev, "core");
+	if (ret)
+		return ret;
+
 	if (core->pm_ops->core_get) {
 		ret = core->pm_ops->core_get(core);
 		if (ret)
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index cf91f50a33aa..ef4b0f0da36f 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -318,21 +318,6 @@ static int load_scale_v1(struct venus_inst *inst)
 	return ret;
 }
 
-static int core_get_v1(struct venus_core *core)
-{
-	int ret;
-
-	ret = venus_clks_get(core);
-	if (ret)
-		return ret;
-
-	ret = devm_pm_opp_set_clkname(core->dev, "core");
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 static void core_put_v1(struct venus_core *core)
 {
 }
@@ -350,7 +335,7 @@ static int core_power_v1(struct venus_core *core, int on)
 }
 
 static const struct venus_pm_ops pm_ops_v1 = {
-	.core_get = core_get_v1,
+	.core_get = venus_clks_get,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
 	.load_scale = load_scale_v1,
@@ -423,7 +408,7 @@ static int venc_power_v3(struct device *dev, int on)
 }
 
 static const struct venus_pm_ops pm_ops_v3 = {
-	.core_get = core_get_v1,
+	.core_get = venus_clks_get,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
 	.vdec_get = vdec_get_v3,
@@ -1013,10 +998,6 @@ static int core_get_v4(struct venus_core *core)
 	if (legacy_binding)
 		return 0;
 
-	ret = devm_pm_opp_set_clkname(dev, "core");
-	if (ret)
-		return ret;
-
 	ret = vcodec_domains_get(core);
 	if (ret)
 		return ret;

-- 
2.44.0


