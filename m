Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4478861F289
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 13:09:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbiKGMJv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 07:09:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbiKGMJu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 07:09:50 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 212FBB48
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 04:09:49 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id u11so15906817ljk.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 04:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FcNmjKLMj/t6peWOXBMwpkGFM+kDqqzNyUK1wLaHjNo=;
        b=x34/wz6HPrZKgl9RBCOY+gcBinrGwOY4bj8Y09jZ3yDrs3L+SkqTxyNlDDFwrSpaS+
         K5rhVK4fsJEYoGuBGBUjEPkosKAFyWq9oEkMCdWkf53BrnF7GQ+neh1OwHP2slSsPVoG
         YhkR0dGw4f7j4MTneb2KUquvZ9RK0eb0ImtvZCtEef15tPl0baiPdiw8NGbQCMNmsloC
         DdLEEw6oeAvessQGKZAYmOtZlGJUMiqDtZissshzrmLfbFXNxJgKyf5pWFRqKB0SrRYD
         LsRXndaC+90j0q48RHgm56cYbcuE2g9CWGq4HmTQf7OY749dQ/n7nYwaqt4tgb4/S35/
         1bdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FcNmjKLMj/t6peWOXBMwpkGFM+kDqqzNyUK1wLaHjNo=;
        b=XDO9G2Ed3VEkYp4UaJNXv1a3uoZRCDcTJkITrB1laz7GAnHH7QSHVpz3sT72aOtw2e
         zl6ni8V9VK82eV4hA5Hz+gyq4ViwziKOI1/AQq5LlV5CjVWRQM0+PzQHQTZ5w2vFLtgX
         EwU6LHtrVyb81AdjSYijw/05Q0FIt3aaHLOAVzcb1K7rUb3J5l5vjSMoRQkBnf/qM6DO
         hpFtQx+dLqYW7pTqMGbsHS0SeCFt8Ibr/CZI1woRiRrWofwpfbUMGFwOVAv7diamLkht
         uAsOrU8oQ07gQRW6Y5s7BtqT0YBKdT4cyVWJh2jyB8t0DP73lEc6AY3t2sDyuZZEc+Oc
         G1uw==
X-Gm-Message-State: ACrzQf3Ha/0s/fz+suTtImWk5xKBnuoJwZ+RA+1A1+NpBSHAXjKf5VC4
        n8J68EXVwXy5JIyTuP1IkNHwl/N1IMVMOLKq
X-Google-Smtp-Source: AMsMyM63NQrLj4DKJt1HJx8Vhdp/BXHoB9xFL7eImzgcvwzFh6Te6cBloUm1ANuX4TjPEsV97XHCyA==
X-Received: by 2002:a2e:8811:0:b0:26d:fd3f:c5c3 with SMTP id x17-20020a2e8811000000b0026dfd3fc5c3mr5209739ljh.494.1667822987249;
        Mon, 07 Nov 2022 04:09:47 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id p13-20020ac24ecd000000b004a608ec6d8csm1219723lfr.27.2022.11.07.04.09.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Nov 2022 04:09:46 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Chanho Park <chanho61.park@samsung.com>,
        Thierry Reding <treding@nvidia.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v3 1/4] dt-bindings: arm: cpus: Add Kryo 660 CPUs
Date:   Mon,  7 Nov 2022 13:09:16 +0100
Message-Id: <20221107120920.12593-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konrad.dybcio@somainline.org>

Add a compatible for Kryo 660 CPUs found in at least Qualcomm SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v2:
- Add second S-o-b

 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5c13b73e4d57..b2058345bb8e 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -183,6 +183,7 @@ properties:
       - qcom,kryo485
       - qcom,kryo560
       - qcom,kryo570
+      - qcom,kryo660
       - qcom,kryo685
       - qcom,kryo780
       - qcom,scorpion
-- 
2.38.1

