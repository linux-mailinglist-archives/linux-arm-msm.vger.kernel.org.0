Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD906D326F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Apr 2023 17:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbjDAPtn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 11:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjDAPtm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 11:49:42 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4145122E90
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 08:49:41 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so28526402pjp.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 08:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680364180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N3Lew9LFdFmBLa2xh7Y61frxhM4EhNwmm0GMfVIfIo=;
        b=nzaTnmRkDihaYkXInNf/oggEORv36u93mfkPRLg2rVTdtIZHUpS5XWtKt481tOQPS0
         6ld0wsXk7xo4Qj860x/S44QXU+b74um4dnEhRs3NZeRR70X3iX7uMHJhRWdby6s4WRAk
         t5roh3FFAM/qA/Z089pW5Un82e4/aKc1ZMfK4KX6pmb0Zm/AGofTFxKiXOT7A3X2jt/4
         bilsQ+4OKp/qloCfYBX2tS5/bOrgbaXCgsKT8W0OvW2iWFBUWtySZ5mtE+oOUEN6us3n
         slKlUKje1xPsM4VB3Ts/HWeQtaeIOGM0nz7OWFhTtc7YB9eSjAuzlNzbdJel56PxrPNH
         mtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680364180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+N3Lew9LFdFmBLa2xh7Y61frxhM4EhNwmm0GMfVIfIo=;
        b=Q9Js7Yfg3E6QDn/rkmBMIU4QJs7UYJA87+6Sr6BuXIfcz8wVqu8/yf7zfsyrHrEEzI
         WXi0YE5uMDQ5ld5k9abTpfPO3RyWEoI3IxQCwd0bvb00WRu3GQpAjcUL7Ik7sG7Urty/
         8LDCgJPVMkcSOdeK6SqULnUmD1jcn5io0/OeUE7XiMjC1oJp0CRYKTysxgf9+7DR/VFL
         NY3c6EN4h61sag83pu3M+mvH8WuS35LGjgnhwWQCwG9C+PIn4QLI7w+VhjSJHPpX2ek1
         uPbUW3TW8xJlqwGLU9yJIJ7ayacadwu03og5VkjWmGg0m09oPzurEQtv8dsywUXfnh5s
         oLIA==
X-Gm-Message-State: AAQBX9e9qYS+MmB275Z0tlTA7VjCLYldVqRUpVGEdGAkbHDa9TZAo6vf
        r9CodWRysSC28Zt+HqJRE0/g8NrSW5R/HuzVsMY=
X-Google-Smtp-Source: AKy350Y/NByujPBHL4YU9jRF/JypPgvXlE4LVbUU/slgWplAFy/nwLEiSMuN+PEx4TbS7PkdjtXHjA==
X-Received: by 2002:a05:6a20:1445:b0:e4:663a:f645 with SMTP id a5-20020a056a20144500b000e4663af645mr6198016pzi.16.1680364180309;
        Sat, 01 Apr 2023 08:49:40 -0700 (PDT)
Received: from localhost.localdomain ([223.233.66.184])
        by smtp.gmail.com with ESMTPSA id 65-20020a630444000000b0050fb4181e8bsm3385367pge.40.2023.04.01.08.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 08:49:40 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org
Subject: [PATCH v4 1/2] dt-bindings: phy: qcom,qmp-usb: Fix phy subnode for SM6115 & QCM2290 USB3 PHY
Date:   Sat,  1 Apr 2023 21:17:24 +0530
Message-Id: <20230401154725.1059563-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230401154725.1059563-1-bhupesh.sharma@linaro.org>
References: <20230401154725.1059563-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The USB3 SS (QMP) PHY found on Qualcomm SM6115 & QCM2290 SoCs is
similar to sm8150 QMP PHY in the sense that the phy subnode supports
6 regs, namely TX lane 1, RX lane 1, PCS, TX lane 2, RX lane 2 and
PCS_MISC.

Update the dt-bindings document to reflect the same.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
index e81a38281f8c..1575dc70bcf2 100644
--- a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
@@ -276,7 +276,9 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qcm2290-qmp-usb3-phy
               - qcom,sdm845-qmp-usb3-phy
+              - qcom,sm6115-qmp-usb3-phy
               - qcom,sm8150-qmp-usb3-phy
               - qcom,sm8350-qmp-usb3-phy
               - qcom,sm8450-qmp-usb3-phy
@@ -318,12 +320,10 @@ allOf:
             enum:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
-              - qcom,qcm2290-qmp-usb3-phy
               - qcom,sc7180-qmp-usb3-phy
               - qcom,sc8180x-qmp-usb3-phy
               - qcom,sdx55-qmp-usb3-uni-phy
               - qcom,sdx65-qmp-usb3-uni-phy
-              - qcom,sm6115-qmp-usb3-phy
               - qcom,sm8150-qmp-usb3-uni-phy
               - qcom,sm8250-qmp-usb3-phy
     then:
-- 
2.38.1

