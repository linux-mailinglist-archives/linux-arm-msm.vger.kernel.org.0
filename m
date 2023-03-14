Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29AAA6BA271
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 23:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbjCNW1R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 18:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbjCNW1Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 18:27:16 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956892B604
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 15:27:12 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id n2so21931598lfb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 15:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678832830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Au+ByXF+T/ttwdvk2E5GvB4Cm4Xo7Y50WRAwY8Nd3PI=;
        b=Q2LCGvyww4ehVH+wC1KTEGhgAoSUFH1ZX0i1aWgkZRmGHiNPGRfhYGDk3RyIeDNpp9
         HqGKE4iexBIR9tJGgeMLkaGUoyS7JJ50bgQGIiYWfo/CBSovpvVu7V2omFF8f4wXzXMX
         qWuwutohj4c+p4kY+5ebx5J8oSYxTuAho0cqgR2RWquDkXAZtil+fH4h6K2bme2gm+oy
         ddo6qCdr5O6fAm5nYoAZwhix/aT7bi080gRirmCrqERirzZ6ix72nm5oJoL0wsKyUXsQ
         B2aC9tjI3KsOKzVZbmFtZ79sTI7bLHREVQcojPVagmIe+pNSdD+MHMj0f230ySgOCp/0
         1GHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678832830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Au+ByXF+T/ttwdvk2E5GvB4Cm4Xo7Y50WRAwY8Nd3PI=;
        b=xoqU8JVyxoRhTaYlxmleZt/cW7cRJNHubNu5Ubd6JMN5aHs8iLdee7bldUM0XRKcKv
         itu4gWoD6mvapPmBDJaCmd1/u3eFDhSxicTUpK8O/jocNeoM14ox0G2Y4Z4T4OYaMFiA
         33R+SV/bt7LzK9O25Qk8GxDaZjOv3Zz1WWO1TXkt8QfrBxlCVrXYvXzS2rx/5nU+P0nq
         8YL62Ykcvkbbowi0+f+v5BQFSNEEASajZbslHgdE05Pgij+KvK0LhMyb7BkoADzZ+bmf
         lfJvFtqX4DCN+SyVlvA/NMbCnoIUyiPssL6UXDFu3Ceani0hX1p15lcVPUR7uxrZpmDD
         PkeA==
X-Gm-Message-State: AO0yUKWbqNAfEXgpbOnilN0XeL6ol1qdZ03vAh9QayeOD3K2smwrvC/q
        WUCP4V0xQ+R8Tfo7VLnSWuPgXIq6Jtfea+vJozE=
X-Google-Smtp-Source: AK7set8LJmuI7xVqgISQ+Y68vWHmnkx+pjP/kmLyFsI2LuWzQ6PRiDvE6l2DC/c+HAJbShrMgoP7ow==
X-Received: by 2002:ac2:4a91:0:b0:4cb:4374:cc78 with SMTP id l17-20020ac24a91000000b004cb4374cc78mr1497320lfp.26.1678832830643;
        Tue, 14 Mar 2023 15:27:10 -0700 (PDT)
Received: from localhost.localdomain (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id c11-20020a19760b000000b004ab52b0bcf9sm562373lff.207.2023.03.14.15.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 15:27:10 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: qcom,qcm2290-tlmm: Allow input-enable
Date:   Tue, 14 Mar 2023 23:27:05 +0100
Message-Id: <20230314222705.2940258-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow the common input-enable. This was missed with the
initial submission.

Fixes: 5147022214db ("dt-bindings: pinctrl: qcom: Add QCM2290 pinctrl bindings")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-tlmm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-tlmm.yaml
index 6271fd15e0b6..032763649336 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-tlmm.yaml
@@ -85,6 +85,7 @@ $defs:
       bias-pull-up: true
       bias-disable: true
       drive-strength: true
+      input-enable: true
       output-high: true
       output-low: true
 
-- 
2.39.2

