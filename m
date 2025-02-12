Return-Path: <linux-arm-msm+bounces-47817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6CBA33057
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 21:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 922B51883AFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 20:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEB7202C27;
	Wed, 12 Feb 2025 20:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x5XHLJrM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FD22010F2
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 20:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739390518; cv=none; b=EHWXJ3vni5NwfzTls8JklB/z/N0/wixEsaDueHE+rGWtnMY6N64OQXZ6UsCE1Xs3qI5KOh9wTp+PbiLqTpjpJO/SuOoe+c8pfV0HVRVBCEchmOz5dry7uw/Br9/P+YO/AEgucpLkGS5tkLXLU92JZt+G8egbygRsJiJgtjRljm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739390518; c=relaxed/simple;
	bh=sfceOHg+tP5UUbLEnLwpXfCBLDX8do4JU9zZPH8RVhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EHB9NVBrJp7uKPwx8X0GbJyT4DWawkVuYiJvv1xzXXqYZZyAw0xl0gnNc4IjURXWS6yt6QOe+2LbBvser4BzZT8F3pRfap6ebTbIxzdb0NCiictsVvGWrpZgkmJUbaS4C0KZ6Oy1YVbmH/DlQp/1mwGKFV522iHPsQ37jeNq78I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x5XHLJrM; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dbf7d45853so8436a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 12:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739390513; x=1739995313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xa5wQ0nmuazvUIzOywTNV2pFNK01aAPrljCv+6nnSg=;
        b=x5XHLJrM1dUEHFaTSO73Up4Y3G54eEVfyqytGSQKXY1MIlBloLQxxLUbi2yyEbQFoN
         45AX9Iq/gnf81rZ0hURqmT3G3LMSfZLdMVsj29P/Q5OMZ4NV4hkYHsUiP0UT8gfIMJQp
         A+r4KKCn1Rb3FBeopZiql4W4nyxlkrZNDwJidLTe0Rjw36MYL3Z8gdCsNPAn8YbpcNz9
         hE0aSVcoRHrLNT3CoUPVzPtZOYaHnNl7eGZ3HWg3rWLo0kXwi9uLCqMJ/gBH5oKyskRB
         2D6YnqrxrOUroeAILKLWrDFYEtYISqx1ZtzH6dWvQSHv3OvUi9kQrUfU/ZqldGBFEPSs
         E4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739390513; x=1739995313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xa5wQ0nmuazvUIzOywTNV2pFNK01aAPrljCv+6nnSg=;
        b=O68FgyQKi4fLzNe24eFHkh0tlu3UfCa2Jd5zNStLBB+vFS9/9Kwih+tzwbEM6vVLRX
         b6ovIc0cKbwjHlqP8uqjYSxl5v18ORjgSInz2jK0qN1dS7ghnSjA4hHJh217Qqjaw9Sq
         8xM+0XMgE4TzPNd9Z2fIrnH8T7A0fLZtrbg1oJ4fGiT3H7kUGb4BdTsGLiqCsR7kAxEX
         dz5sdJVtTF4zgfiI66N/b3fdSJZUY1a0NEVkydgQOPTkYnBBH4jwNb9N22JoBv+ywx/9
         9cZvKweruJSVHhCA8qdjK1TantGcaoNJ26cusOBdrDhyRplsmUnV0Uka9t6c/plupqYh
         Z2Bw==
X-Gm-Message-State: AOJu0YykvRK/cw7sYj0PoAvMdyAEjmHOuV6A/Tk5h1faIl8lGN9CyQhk
	xVau1VvgklxhynqiPNEsYQFDchr35HzowdgzjS33eP8891VuVETAHD47oQtIICun9T2CBZAdVjn
	A
X-Gm-Gg: ASbGncsJt7PXP3PsntO9U4C6CM60+fu2ejCbmjMqBWC8je0Sg6DlBQoLRvAJ6B9HAoW
	5XPF4Q6GZ5AkpRA7sGXpRCuOu1sJevS/RnPOvMCXDqbd54Sq29ICvvoFtVMDUTAN7II8XhhmLZW
	PnDvHhWowwK9deMqjbri+rji0Va/aJCLGs3MDVeyO3L2T1db/vbiZcKX0eMkMk/DWiPiZHvpjUB
	4hzbPmqMRPn43pSCiyUKfpDWS9orS43AUiM0IAdZ6nVEU9CE2XrDyVq61b1J8PIzS5Fh3JY1Fwx
	cRCgcv0OT7Rvivss5pR6a23zHAL5WR0=
X-Google-Smtp-Source: AGHT+IFAb05sjgDzq+YwuzhaI7raFEZGAbSIAVReugT6xg3PiwiIIKH92pWwOEOH4o17huHznr7LTg==
X-Received: by 2002:a05:6402:5109:b0:5dc:d0c0:4647 with SMTP id 4fb4d7f45d1cf-5deadda1a32mr1594870a12.3.1739390512910;
        Wed, 12 Feb 2025 12:01:52 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5deca41378fsm144527a12.74.2025.02.12.12.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 12:01:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Feb 2025 21:01:36 +0100
Subject: [PATCH v3 2/3] clk: qcom: Drop unused header includes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-b4-clk-qcom-clean-v3-2-499f37444f5d@linaro.org>
References: <20250212-b4-clk-qcom-clean-v3-0-499f37444f5d@linaro.org>
In-Reply-To: <20250212-b4-clk-qcom-clean-v3-0-499f37444f5d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=20330;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=sfceOHg+tP5UUbLEnLwpXfCBLDX8do4JU9zZPH8RVhM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnrP4nY7nkVNOy13YndXymlwyRrIepEGWm63QM7
 axtVGCBK5eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ6z+JwAKCRDBN2bmhouD
 19rXD/9rCeTnqXC+qLRrnvogz180uuWu264eqqpHoUdwFH8VOYTjhoJ5kbVDG+/VcrY8kgyeK8f
 UVXePRf4xfOX8jkRZpqATePW3NQLKcHBE4yj6S4NpL2nL3CVeqGuC2ZG5bhDjRIi6WmVNRg1W2T
 ZGcE/EQ0b883j6Y8942o96g24rl7KFRFiXnYdmKU7dxxLYMLLGWg7VvlSUrtrWd8u46ECN5cIt9
 s6DvIMItYD20NEDR4xENrFHDdqPOyVn2z3Y1/cGBLtAhUJOyZVQ7nM9MGNwWfgIveLbCUxFk9fo
 FTgBWlTW+iA8B170VtQ2XaETy9kh9QVmZuKLVLlNk7kNQT/hi6bgcvdeBBat6khw8QMYGomRkub
 8Swpor56CgRYXgYATKrMpSOpvbIU/CqSGM1c3jA9MAhCTUFHq3uKRAIvemRMFfV0d7hodFHHxZj
 zl+yQzCsrBfmbEOncANSsSv/3AL4/5C3GstHGK+x80y/QTvLDmCvu2Tv7vJV4OSeJrPzLOeA+hv
 YKDyroTncfO5wW6ERFbuHL1zA85LZuVurJV/UCUAsb91HgJzeSRv27zmjakMZWEHC07GYtxhitG
 HYBwefXjvgW8qLjEzbXqUZtAXDMmtPBKK9YAz1ELryZZB0pP7hDV20LL/OK7NjrsZsGYfuM8Rls
 BfMTmLbp06MWZAw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Drivers should include only headers they use so drop:
1. of.h and of_address.h: When no OF call is used (of_device_id is
   coming from mod_devicetable.h).
2. clk.h, property.h and reset-controller.h: No calls to clock consumer
   or reset framework, no fwnode/property calls.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Drop sm8750
---
 drivers/clk/qcom/camcc-sa8775p.c      | 1 -
 drivers/clk/qcom/camcc-sc7180.c       | 1 -
 drivers/clk/qcom/camcc-sc7280.c       | 1 -
 drivers/clk/qcom/camcc-sm4450.c       | 1 -
 drivers/clk/qcom/camcc-sm7150.c       | 1 -
 drivers/clk/qcom/camcc-sm8150.c       | 1 -
 drivers/clk/qcom/camcc-sm8250.c       | 1 -
 drivers/clk/qcom/dispcc-qcm2290.c     | 1 -
 drivers/clk/qcom/dispcc-sc8280xp.c    | 2 --
 drivers/clk/qcom/dispcc-sdm845.c      | 1 -
 drivers/clk/qcom/dispcc-sm4450.c      | 1 -
 drivers/clk/qcom/dispcc-sm6115.c      | 1 -
 drivers/clk/qcom/dispcc-sm7150.c      | 1 -
 drivers/clk/qcom/dispcc-sm8250.c      | 1 -
 drivers/clk/qcom/dispcc-sm8450.c      | 2 --
 drivers/clk/qcom/dispcc-sm8550.c      | 2 --
 drivers/clk/qcom/dispcc0-sa8775p.c    | 1 -
 drivers/clk/qcom/dispcc1-sa8775p.c    | 1 -
 drivers/clk/qcom/gcc-msm8960.c        | 1 -
 drivers/clk/qcom/gcc-msm8974.c        | 1 -
 drivers/clk/qcom/gpucc-msm8998.c      | 2 --
 drivers/clk/qcom/gpucc-sdm660.c       | 4 +---
 drivers/clk/qcom/gpucc-sm4450.c       | 1 -
 drivers/clk/qcom/gpucc-sm8350.c       | 1 -
 drivers/clk/qcom/kpss-xcc.c           | 1 -
 drivers/clk/qcom/krait-cc.c           | 1 -
 drivers/clk/qcom/lpasscc-sdm845.c     | 1 -
 drivers/clk/qcom/lpasscorecc-sc7180.c | 1 -
 drivers/clk/qcom/lpasscorecc-sc7280.c | 1 -
 drivers/clk/qcom/mmcc-apq8084.c       | 1 -
 drivers/clk/qcom/mmcc-msm8960.c       | 3 ---
 drivers/clk/qcom/mmcc-msm8974.c       | 1 -
 drivers/clk/qcom/mmcc-msm8994.c       | 2 --
 drivers/clk/qcom/mmcc-msm8996.c       | 3 ---
 drivers/clk/qcom/mmcc-msm8998.c       | 2 --
 drivers/clk/qcom/mmcc-sdm660.c        | 5 -----
 36 files changed, 1 insertion(+), 52 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sa8775p.c b/drivers/clk/qcom/camcc-sa8775p.c
index c04801a5af35089dceac08ac46e920576cd0d719..1df86da419406f90ac6fdfc671ceace4acef1658 100644
--- a/drivers/clk/qcom/camcc-sa8775p.c
+++ b/drivers/clk/qcom/camcc-sa8775p.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
index 10e924cd533d1e67425b6d3a6e22e319aab2a5e1..a69b70ab1a7090b15fc3378afc200f37a66baa4d 100644
--- a/drivers/clk/qcom/camcc-sc7180.c
+++ b/drivers/clk/qcom/camcc-sc7180.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/qcom/camcc-sc7280.c b/drivers/clk/qcom/camcc-sc7280.c
index accd257632df37fba1c7bafee15ac9c681519607..5a9992a5b5ba5d4aec533c5cd9ef5c9e549ee40f 100644
--- a/drivers/clk/qcom/camcc-sc7280.c
+++ b/drivers/clk/qcom/camcc-sc7280.c
@@ -8,7 +8,6 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/camcc-sm4450.c b/drivers/clk/qcom/camcc-sm4450.c
index f8503ced3d05d34e3cac6d9aa805c05d815141c4..e51590d89a3cbfef25b1023950fc4de7b0b0899a 100644
--- a/drivers/clk/qcom/camcc-sm4450.c
+++ b/drivers/clk/qcom/camcc-sm4450.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/camcc-sm7150.c b/drivers/clk/qcom/camcc-sm7150.c
index 39033a6bb6160f4302bc786b183307066d2bf12d..4a3baf5d8e858c1f11f6cba8bc4212fb88461a9b 100644
--- a/drivers/clk/qcom/camcc-sm7150.c
+++ b/drivers/clk/qcom/camcc-sm7150.c
@@ -7,7 +7,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/camcc-sm8150.c b/drivers/clk/qcom/camcc-sm8150.c
index bb3009818ad76e6dec64dc94ce4ce643111a56d4..ed96dcb885b353b2f1b915116fa4b357de91ff0d 100644
--- a/drivers/clk/qcom/camcc-sm8150.c
+++ b/drivers/clk/qcom/camcc-sm8150.c
@@ -8,7 +8,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/pm_runtime.h>
 
diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
index 34d2f17520dccadefe2f32b98a2d38e3eed97ce7..dcbc6c354e5a0fcd36f289568eb35ee36bb1bb16 100644
--- a/drivers/clk/qcom/camcc-sm8250.c
+++ b/drivers/clk/qcom/camcc-sm8250.c
@@ -7,7 +7,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,camcc-sm8250.h>
 
diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index d7bb1399e1022afc68e45ee335d615d4a5be5add..f72e9585b4fb22ecc227a50dfaf2d54117882c3d 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -7,7 +7,6 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
index f1ca9ae0b33f4c408cb84911933fe571c56e86c8..0a810fc847ce0d8b4f14e00a6983aa83c728f1dd 100644
--- a/drivers/clk/qcom/dispcc-sc8280xp.c
+++ b/drivers/clk/qcom/dispcc-sc8280xp.c
@@ -7,11 +7,9 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,dispcc-sc8280xp.h>
 
diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index e6139e8f74dc0d3af6c60b8ffe413cd45ab2ebcd..94079c54333fccc9b06cc9f82f4b9111b40f8c22 100644
--- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -7,7 +7,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
 
diff --git a/drivers/clk/qcom/dispcc-sm4450.c b/drivers/clk/qcom/dispcc-sm4450.c
index 98ba016bc57f114f381a3d8abb9aec63b36f587a..465725f9bfeb774a147a0f5a5452255ec1b422ec 100644
--- a/drivers/clk/qcom/dispcc-sm4450.c
+++ b/drivers/clk/qcom/dispcc-sm4450.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/dispcc-sm6115.c b/drivers/clk/qcom/dispcc-sm6115.c
index 2b236d52b29fe72b8979da85c8bd4bfd1db54c0b..89f14cfd92336e6c28ad3eeb2ae9ef4219eb0555 100644
--- a/drivers/clk/qcom/dispcc-sm6115.c
+++ b/drivers/clk/qcom/dispcc-sm6115.c
@@ -8,7 +8,6 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/dispcc-sm7150.c b/drivers/clk/qcom/dispcc-sm7150.c
index d32bd7df1433b0f92504c87f12e964cac0bbeef4..bdfff246ed3fe08dea3647da9582e166cfbb96f4 100644
--- a/drivers/clk/qcom/dispcc-sm7150.c
+++ b/drivers/clk/qcom/dispcc-sm7150.c
@@ -8,7 +8,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 884bbd3fb305710ab9991ce56ac47f0799d4e177..1f48e79acfac31641a1cccef895139fea9336a47 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -8,7 +8,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
 
diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index a1f183e6c636ea5b6268b1dc2a7914b3a133fa25..96987d8445cb09085b8017e7f18824a643e677bd 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -4,12 +4,10 @@
  * Copyright (c) 2022, Linaro Ltd.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index e41d4104d77021cae6438886bcb7015469d86a9f..4c5feb96ae53d94b34b671da34ad090b80a9b247 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -4,12 +4,10 @@
  * Copyright (c) 2023, Linaro Ltd.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/qcom/dispcc0-sa8775p.c b/drivers/clk/qcom/dispcc0-sa8775p.c
index 6e399b5f138371e81e24500433a36e5f22d93016..bf9de92a5dd24108c8bd41dea200ab8aa5aa5e58 100644
--- a/drivers/clk/qcom/dispcc0-sa8775p.c
+++ b/drivers/clk/qcom/dispcc0-sa8775p.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc1-sa8775p.c b/drivers/clk/qcom/dispcc1-sa8775p.c
index 30ccea59415a4e1df3e6eafcb1ac37dab0d50be5..cd2f2eb7ffb4f073386a5754aecf22ddb603e22f 100644
--- a/drivers/clk/qcom/dispcc1-sa8775p.c
+++ b/drivers/clk/qcom/dispcc1-sa8775p.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index 9ddce11db6dfe20566ec04ced9924103fc38e4da..c2e4fa5d63ad1c68433cfc2dbcf0f50ceba91b6c 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -7,7 +7,6 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
index b32e66714951b79b1dbdb346c3b64f487af980ef..92ad35cfb75e3fa74f54e57f22d612b26c1fef52 100644
--- a/drivers/clk/qcom/gcc-msm8974.c
+++ b/drivers/clk/qcom/gcc-msm8974.c
@@ -7,7 +7,6 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
index 9efeab2691ba968691dc3ed1ee6d663beaafd9e8..066793e47f79f42dfdf9895bca33393455925ee3 100644
--- a/drivers/clk/qcom/gpucc-msm8998.c
+++ b/drivers/clk/qcom/gpucc-msm8998.c
@@ -8,10 +8,8 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,gpucc-msm8998.h>
 
diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index 3ae1b80e38d9a560383d6ef6a7b4d6a473dd992f..6d37b3d8d1a40dfebbfa8ab89bf0459f041994a1 100644
--- a/drivers/clk/qcom/gpucc-sdm660.c
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -6,15 +6,13 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/of.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
+
 #include <dt-bindings/clock/qcom,gpucc-sdm660.h>
 
 #include "clk-alpha-pll.h"
diff --git a/drivers/clk/qcom/gpucc-sm4450.c b/drivers/clk/qcom/gpucc-sm4450.c
index a14d0bb031acc5a65b722ec54b95e57d1ac6ac74..34c7ba0c7d55e6da2b525810b5497a1d2a0bfa2a 100644
--- a/drivers/clk/qcom/gpucc-sm4450.c
+++ b/drivers/clk/qcom/gpucc-sm4450.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/gpucc-sm8350.c b/drivers/clk/qcom/gpucc-sm8350.c
index f3b6bdc24485bea5ae8bfb87adf948e9ccba4786..6d2660bdd82549806e1eb0d8fb64b1b2523e67d9 100644
--- a/drivers/clk/qcom/gpucc-sm8350.c
+++ b/drivers/clk/qcom/gpucc-sm8350.c
@@ -9,7 +9,6 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/kpss-xcc.c b/drivers/clk/qcom/kpss-xcc.c
index e7cfa8d22044ec1fb5364b3acc1c73585df18372..97bfb21a5e5ea8bd6fbbc3994a0aa03d988a9317 100644
--- a/drivers/clk/qcom/kpss-xcc.c
+++ b/drivers/clk/qcom/kpss-xcc.c
@@ -5,7 +5,6 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
diff --git a/drivers/clk/qcom/krait-cc.c b/drivers/clk/qcom/krait-cc.c
index ae325f4e1047c6254022fe4f0988395eb53b5f30..f29d6dd1f3ac1bde67e30f72b795916eb53ec587 100644
--- a/drivers/clk/qcom/krait-cc.c
+++ b/drivers/clk/qcom/krait-cc.c
@@ -5,7 +5,6 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
diff --git a/drivers/clk/qcom/lpasscc-sdm845.c b/drivers/clk/qcom/lpasscc-sdm845.c
index 7040da9527283bc7bbec5e0bd628aa3a16d28ab3..5c1ea75f9ba802063820819e406a6d355bccc296 100644
--- a/drivers/clk/qcom/lpasscc-sdm845.c
+++ b/drivers/clk/qcom/lpasscc-sdm845.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,lpass-sdm845.h>
diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index 726c6378752f88d19bffbefbcf1ff86224c5c402..605516d03993308c7b93c655eec99faf1f9636de 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -9,7 +9,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
-#include <linux/of.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
diff --git a/drivers/clk/qcom/lpasscorecc-sc7280.c b/drivers/clk/qcom/lpasscorecc-sc7280.c
index b0888cd2460b3ecd56c7e9911f4b8ad65aa45523..56882c2023769c277b748f1a6d3830f3c0ca60d3 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7280.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7280.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/qcom/mmcc-apq8084.c b/drivers/clk/qcom/mmcc-apq8084.c
index cc03722596a4c687684028c7bb4d0d96b74fe189..3affa525b875c3b313711a32f6d45133a09a6813 100644
--- a/drivers/clk/qcom/mmcc-apq8084.c
+++ b/drivers/clk/qcom/mmcc-apq8084.c
@@ -8,7 +8,6 @@
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,mmcc-apq8084.h>
 #include <dt-bindings/reset/qcom,mmcc-apq8084.h>
diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
index 20d1c43f35d99ba531c4e138950c0b69c8c08786..a23440e13b71d67c4cc4c5efa3f7b5c927cd110d 100644
--- a/drivers/clk/qcom/mmcc-msm8960.c
+++ b/drivers/clk/qcom/mmcc-msm8960.c
@@ -8,13 +8,10 @@
 #include <linux/err.h>
 #include <linux/delay.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,mmcc-msm8960.h>
 #include <dt-bindings/reset/qcom,mmcc-msm8960.h>
diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index 169e85f60550bbd82e0a5565263a9bd62a413921..f2e802cf6afc558672f70f407d7538fde2a555fa 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -11,7 +11,6 @@
 #include <linux/of.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
 #include <dt-bindings/reset/qcom,mmcc-msm8974.h>
diff --git a/drivers/clk/qcom/mmcc-msm8994.c b/drivers/clk/qcom/mmcc-msm8994.c
index f70d080bf51c84758d7a30e0d2fd9bfc550196f2..0a273630e852c978558d13a36ed4d8b3a4d339cb 100644
--- a/drivers/clk/qcom/mmcc-msm8994.c
+++ b/drivers/clk/qcom/mmcc-msm8994.c
@@ -11,8 +11,6 @@
 #include <linux/of.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
-#include <linux/clk.h>
 
 #include <dt-bindings/clock/qcom,mmcc-msm8994.h>
 
diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index a742f848e4eeb5a6448971a114fbe5498cad783f..3426e3dde92478d6853e724fb2f555d1a1e31bdc 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -8,11 +8,8 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
-#include <linux/clk.h>
 
 #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
 
diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
index 5738445a8656f1e7c3cd717dfcaef5966c87ba85..5c37be700fa77985d0806587e80ac465956c5762 100644
--- a/drivers/clk/qcom/mmcc-msm8998.c
+++ b/drivers/clk/qcom/mmcc-msm8998.c
@@ -8,10 +8,8 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
 
diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
index 98ba5b4518fb3ba35c159e3dddf6abf922f18920..b3beeabe39ed1d9c66508dacfad904aa379b9a2d 100644
--- a/drivers/clk/qcom/mmcc-sdm660.c
+++ b/drivers/clk/qcom/mmcc-sdm660.c
@@ -9,14 +9,9 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
-#include <linux/clk.h>
-
 
 #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
 

-- 
2.43.0


