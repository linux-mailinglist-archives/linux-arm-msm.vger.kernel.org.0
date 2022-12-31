Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B92D65A48A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Dec 2022 14:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235673AbiLaNIB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 31 Dec 2022 08:08:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235614AbiLaNIA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 31 Dec 2022 08:08:00 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3996380
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Dec 2022 05:07:59 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id ge16so21316269pjb.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Dec 2022 05:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03EcVfcgn594UPANtn877VRHUEcrNy316gwc2wdWerc=;
        b=NsR2jtqsrt3qzyDQmMkY9hX72wNshQRRtijNRgntkmZwYcvtH2uXkilcK36csmmuTx
         DnWpJXMX80s1FW/xzo9KtsRtpNz4bmUjVtie4frFR/h3/wXLiXQcOK9BRxsoe8SVcuYX
         ZlG2GOcH1zTc9RgOkFiQ7xNESfwSt0MEUzF2Udolh7Ml7/QPFSp7z2u6vs3n3+Uc4dAW
         RAu58jYejFvZKdww7Z9dPr1I8f25YDA86XuFK5QK4mGIrbPdQHC6Z2CL+KhsMyta8nW6
         +SRhktdiRs/ax3aTwgpmiy7F+S3b+Ijl+w27DWVsHq8k7e8vTA6it2MycQluQN1t4esY
         yU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03EcVfcgn594UPANtn877VRHUEcrNy316gwc2wdWerc=;
        b=Kfh5xtosaKPPZVzyD++1WaRQjJCkpy2aulSWYWA5lufbwAFW9haZnNpzoBhbD5Bd0e
         ARIAF9afRIOEN10id7rLjH99agRwmJVLCFdtUhToIibg9SXf+Ih0/0YOTttvTcAf2u8J
         oGZQFSzuvYJcyMVknmEAXk35heDVF0PPHEIlbdjI8ofdfcxjHpEyut132rg/7HR/a9Je
         837jIkJAE6SNK/OmNE9GboD0hwCbUVO3evfchirGJ3/P6VO6S6tkjQ7XD9mqtIBL6Nuz
         DbTDl4kefe+5JQPRAhUUixz2Fw5tRj5NnBIA2MrX/iopfq+g2Dq1RYQDZPOojlvYQOCD
         57FQ==
X-Gm-Message-State: AFqh2kpqzjp+cSNcVNSBhr3geqbpqRQ/YxkmSEHgEZ7eSAtx8UwK2vOV
        eeXEhzdMH/SELsLPFt0a/KnnxBP9XHCvH8jzN0c=
X-Google-Smtp-Source: AMrXdXvLOdVZiYlJtJLOLdI970jqGgZJV9+4ih0D6yth1+4aZD202Q2MXMXVtF57Mhkmtz3rP1r7zw==
X-Received: by 2002:a05:6a20:b297:b0:9d:efbf:7880 with SMTP id ei23-20020a056a20b29700b0009defbf7880mr37131383pzb.53.1672492078593;
        Sat, 31 Dec 2022 05:07:58 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c5e:e3b5:c341:16de:ce17:b857])
        by smtp.gmail.com with ESMTPSA id d7-20020a17090ab30700b0021904307a53sm14568161pjr.19.2022.12.31.05.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 05:07:58 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     quic_schowdhu@quicinc.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org
Subject: [PATCH 1/2] dt-bindings: soc: qcom: eud: Add SM6115 / SM4250 binding
Date:   Sat, 31 Dec 2022 18:37:42 +0530
Message-Id: <20221231130743.3285664-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221231130743.3285664-1-bhupesh.sharma@linaro.org>
References: <20221231130743.3285664-1-bhupesh.sharma@linaro.org>
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

Add dt-bindings for EUD found on Qualcomm SM6115 / SM4250 SoC.

On this SoC (and derivatives) the enable bit inside 'tcsr_check_reg'
needs to be set first to 'enable' the eud module.

So, update the dt-bindings to accommodate the third register
property required by the driver on these SoCs.

Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../devicetree/bindings/soc/qcom/qcom,eud.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index c98aab209bc5d..1dffe14868735 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,12 +18,22 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm6115-eud
       - const: qcom,eud
 
   reg:
+    minItems: 2
     items:
       - description: EUD Base Register Region
       - description: EUD Mode Manager Register
+      - description: TCSR Check Register
+
+  reg-names:
+    minItems: 2
+    items:
+      - const: eud-base
+      - const: eud-mode-mgr
+      - const: tcsr-check-base
 
   interrupts:
     description: EUD interrupt
-- 
2.38.1

