Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB7584F23CF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Apr 2022 08:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbiDEG77 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 02:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbiDEG77 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 02:59:59 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701A47E5BA
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Apr 2022 23:58:01 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id dr20so24517581ejc.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Apr 2022 23:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ytEtJqw0uy6W+7gp4IX9zLd4Z1yoYI8Fve6cd2B1msM=;
        b=pufHZkF7epqtGQHhi/rp3fJ68j947extNxkzIrIoEbyprH2k2/Wj7bS40po2iD6wox
         ViOi7FMVrhjSqFQqYUXYOUEGINBqG6DSd9wWefE87XfBezcikEnJfrQV2iUpAisDrZTs
         HTpCL4RMxAwH93CqkZf6lW+9nORiLJT//DV4FTKgbXWz5fWfaurHANDnSrGLqaswA1LA
         SZitEGad8cC2HCoCC2iEA5laadDyH/emRXgJdjDr2g92T/jX0Xoa4mumfxw6DLaBvo4u
         t1KaLm6ZtVk4uuFXGQFTngbGwGfYxy+5Fem3rkSDqqmYR9anWnme6Lau8NrYyHNtxxAK
         /0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ytEtJqw0uy6W+7gp4IX9zLd4Z1yoYI8Fve6cd2B1msM=;
        b=QlrhykMnfMR293FjRsPdx3S7+8uHBATXWY7EHfnK9aS3X5Dm49CwlM9NVJu9w3rej9
         +O6F2M7cy4ncT0n2dlJRjqsK5lBtTPAvUdYbYc/n2DX0a3oT9ic7T99RcQbDYRnKx8Pw
         erRFyRXK0u8ZHYmA2FupaTpyy3P3slMJ+TcJbmpfDPIVb+V91K3wmNNlys7gBxZ7hHBF
         WorpkizsqSswmqkSyRgXBHLbRc+l914gtK1Jzq1U08pzSRiUhSzQOoPKMhvOGkG9aiBN
         tnEoA0w147DBl++4LVt03VE5W1NF7dHNMr49ngxrZjnXIjmYQ6cBHgH2uINjbaghPGgx
         ELwA==
X-Gm-Message-State: AOAM533k8TADdlDsvAEhok7d6n4Y7wz4U2NZxDR0EOX25Gv9yh4sFKj9
        0AsonGqWzuKjm5FWIvTb0GLFdw==
X-Google-Smtp-Source: ABdhPJxahQTxuKqd0DovpGzcDiLImq2qWALuFI8VzoQ7ZIHCQgJZ1fH3yS+9s/M72qSE8TSSG5Vomw==
X-Received: by 2002:a17:907:6d19:b0:6db:89c8:52e3 with SMTP id sa25-20020a1709076d1900b006db89c852e3mr2101712ejc.754.1649141880043;
        Mon, 04 Apr 2022 23:58:00 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id f17-20020a056402355100b0041925e80963sm6367419edd.41.2022.04.04.23.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 23:57:59 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] ARM: dts: qcom: rename WCNSS child name to bluetooth
Date:   Tue,  5 Apr 2022 08:57:50 +0200
Message-Id: <20220405065752.27389-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The "bluetooth" is more popular and more descriptive than "bt", for a
Bluetooth device.  The WCNSS DT schema will expect such naming.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. None.
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 33a4d3441959..6eaa996272e5 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1548,7 +1548,7 @@ wcnss {
 
 					qcom,mmio = <&riva>;
 
-					bt {
+					bluetooth {
 						compatible = "qcom,wcnss-bt";
 					};
 
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 2035be2fb8c4..0799dd4bfa2d 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -930,7 +930,7 @@ wcnss {
 
 					qcom,mmio = <&pronto>;
 
-					bt {
+					bluetooth {
 						compatible = "qcom,wcnss-bt";
 					};
 
-- 
2.32.0

