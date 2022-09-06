Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 000845AE74F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 14:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232978AbiIFMLZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 08:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237610AbiIFMLY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 08:11:24 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A106786E6
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 05:11:18 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id bn9so12053072ljb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 05:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=op1My7AD6wRZoajP6NjClBRCjufsM1FdrS7RvoXvXoM=;
        b=xXp4wxSjqmLI9WZ78W8Hd+I5B6ZuBukGMDbQlcYHzUwBV4WZ76GLEA0ZauVLPli9Ia
         JzOq1lrm56AojqHIIJrb7QDEedU4ei3JSR6105JOmjI9ayXH/hI9Hz0dr+PKOv1R6PyZ
         PKk8tdFesOgdAVy5Vbjqe1h3SZ+MGLedDrFPcol/LpHxmqBQXqh1y4on4Io/r/MtOlsx
         98mMKlO5TVDmH39X3lMn3E6BLuxaYqRUqfIEyDrQJnrlMHuPqBlbdb+aIZkUlLfCRjW1
         H8BPllT58gv0NCzSfmCJiidNBzce/qLZ7PAUkuUw5l8hVpfIBgSPZPwrSo5GXMg9RySo
         j1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=op1My7AD6wRZoajP6NjClBRCjufsM1FdrS7RvoXvXoM=;
        b=S8tF34gS+N0rsfsBHVZecuecR27etMbBLIrKXQKGq9M+bwLdSBBa7xckQNQd2qTXtJ
         DSFPkFllL6A2QYHLH2L0ulL3FyMJSpVzgK7hqjohHMHuKYwKB6zxdj1sMG07sMfmYEe3
         4QMkIUUTu5U9uOuCS9WrYAr+MoG5v6pzva7gOLHf5ZgJHXsg0Pv0+OjGUqp+U5ZkshS/
         CPl1tmrms9g6egb64wSVCZqNPyQVKvCpYrgYN4fAzXxAmbQ/3WGXJz7vPA49sHlZexxK
         xkTUH/vo8e6NhgfvuRrWTGTYx5XEtXjBvLwClN+49UfZKke7cJYurdb4tzZkb0BLxV8/
         rebA==
X-Gm-Message-State: ACgBeo0gWQ8oXD9H10tWcYhbn8QhZKPIR2nMk5q7nurU7AFbsitbgRuC
        TiQQg+HR/k17Abhn6mXxqkniug==
X-Google-Smtp-Source: AA6agR7DVYxx5ldZwxSPHEQ+K6cIBOeh+9IU955p69IwfaOY+ubEBlSVsQXcCy60wL7W30N0ZZELXQ==
X-Received: by 2002:a05:651c:245:b0:261:caa7:5be3 with SMTP id x5-20020a05651c024500b00261caa75be3mr14972270ljn.334.1662466276582;
        Tue, 06 Sep 2022 05:11:16 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c23-20020ac25f77000000b0049462af8614sm1699122lfc.145.2022.09.06.05.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 05:11:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: qcom,q6core: remove binding
Date:   Tue,  6 Sep 2022 14:11:10 +0200
Message-Id: <20220906121110.301900-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom,q6core is already described in soc/qcom/qcom,apr.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/qcom,q6core.txt | 21 -------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6core.txt

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6core.txt b/Documentation/devicetree/bindings/sound/qcom,q6core.txt
deleted file mode 100644
index 5cd4cc9b1fde..000000000000
--- a/Documentation/devicetree/bindings/sound/qcom,q6core.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Qualcomm ADSP Core service binding
-
-Q6CORE is one of the APR audio service on Q6DSP.
-Please refer to qcom,apr.txt for details of the common apr service bindings
-used by the apr service device.
-
-- but must contain the following property:
-
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "qcom,q6core-v<MAJOR-NUMBER>.<MINOR-NUMBER>".
-		   Or "qcom,q6core" where the version number can be queried
-		   from DSP.
-		   example "qcom,q6core-v2.0"
-
-= EXAMPLE
-apr-service@3 {
-	compatible = "qcom,q6core";
-	reg = <APR_SVC_ADSP_CORE>;
-};
-- 
2.34.1

