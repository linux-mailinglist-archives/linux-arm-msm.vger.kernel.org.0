Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E491678B842
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 21:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbjH1T15 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 15:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233331AbjH1T1b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 15:27:31 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB6C1CDB
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 12:27:09 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31dcf18f9e2so758274f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 12:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693250828; x=1693855628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZrHrixjJTfHp+8KzhmU3pank8Phapb7i2mtd1W6FyY=;
        b=puIo2IYmdzRkxcG9l3U/HA/Sg/bMR7ddZh06USIZ8WWAxcqxmQ3oXvKlCP1rIvo/1f
         EJ+FfF2G9TuE01YI3u4K0goBfEGO4WTdfb+2f21LZakHyuWjX/6VqShPJ8dv5TbKaW6h
         +eon8GiAyTPeBWj61BPnSyg3okN1d+yOceB2dcNbiTDfwyzU5svZPhMqP2g6DGMkykhY
         Dr8qevmDAmw7xuM3bXc0Rrg40p7Kk8oU8BmjAaapE/Qe3HvwBgAlz7bLVEzNK7KzpQyF
         q3220k3N5ul3HDieX1NCJ2xahnND6ArBMyPGv7F1w0OcHiBRbW9EuewTofxa4kgryipL
         tztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693250828; x=1693855628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ZrHrixjJTfHp+8KzhmU3pank8Phapb7i2mtd1W6FyY=;
        b=EYfKbjCgK/42P5d37JA+Zkq1PSWJX55V09PLhZ8W73L21uA0kqsbAPnwjPYEiKgjHt
         Rd/8BdFIwWrA4mig7FxbLTyDzNRil3lMs0xTaJArbbO2EFrT3rkzHc5kfxRgRMNgNG4D
         jgCLul5MXdVX2YLurttm6hR/tozuDvSAaVskjwSUwdTLDprAdnvwojbY877aMxVt2rD4
         2+LoMD5GnSJK5KkU0M2GzA9xwyr5Eww3HKALXkdbnxozLfmaLs5WIKM7AFjZRklMcXZF
         AeulLbxkAckxIHhjKChR+LUoyRwhzPDq4lof3h1edOeow+owcz1+Gn7/KYqVIlT4Rhlz
         fP2Q==
X-Gm-Message-State: AOJu0YweK/ZGeXFlPH3ciMz0DSln8c00OVhFKoG1cwoscwjXdxQr76jt
        HuJZkYZMsORHZumpTmQF+sdAHA==
X-Google-Smtp-Source: AGHT+IEEGru84SUHFfCkbyGAXl1BVPJ1qKlE94RFGVLiLHe9WynVK7WBIN5FA+kPUAZAITnY+rRsNQ==
X-Received: by 2002:adf:ec11:0:b0:313:f4e2:901d with SMTP id x17-20020adfec11000000b00313f4e2901dmr20276102wrn.22.1693250828356;
        Mon, 28 Aug 2023 12:27:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8bd:7f16:d368:115f])
        by smtp.gmail.com with ESMTPSA id i20-20020a5d5234000000b003141f96ed36sm11435319wra.0.2023.08.28.12.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 12:27:07 -0700 (PDT)
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 05/11] dt-bindings: document the Qualcomm TEE Shared Memory Bridge
Date:   Mon, 28 Aug 2023 21:25:01 +0200
Message-Id: <20230828192507.117334-6-bartosz.golaszewski@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230828192507.117334-1-bartosz.golaszewski@linaro.org>
References: <20230828192507.117334-1-bartosz.golaszewski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Device Tree bindings for Qualcomm TEE Shared Memory Brige - a
mechanism that allows sharing memory buffers between trustzone and the
kernel.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../bindings/firmware/qcom,shm-bridge.yaml    | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/qcom,shm-bridge.yaml

diff --git a/Documentation/devicetree/bindings/firmware/qcom,shm-bridge.yaml b/Documentation/devicetree/bindings/firmware/qcom,shm-bridge.yaml
new file mode 100644
index 000000000000..f660962b7b86
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/qcom,shm-bridge.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/qcom,shm-bridge.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QCOM Shared Memory Bridge
+
+description: |
+  Qualcomm TEE Shared Memory Bridge allows sharing limited areas of kernel's
+  virtual memory with the trustzone in order to avoid mapping the entire RAM.
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Konrad Dybcio <konrad.dybcio@linaro.org>
+  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,shm-bridge-sa8775p
+          - qcom,shm-bridge-sm8150
+          - qcom,shm-bridge-sm8450
+      - const: qcom,shm-bridge
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    firmware {
+         compatible = "qcom,shm-bridge-sa8775p", "qcom,shm-bridge";
+    };
-- 
2.39.2

