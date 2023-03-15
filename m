Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C30DF6BBC69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 19:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbjCOSjd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 14:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232684AbjCOSjK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 14:39:10 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B1B16FFEF
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 11:38:37 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id b13so20443988ljf.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 11:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678905504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cVubaIqvmyZcVmODQ4m0c66Rfjv3Ax4FAubBWjKvyUI=;
        b=NbsCYa1ped90PCQfFoECGkBtGykaKc5PmrnpfStkvX1VprhPanvIWZBTfNi629EIxy
         YDtrJwiS6hNH4l5Axz3ZUCkTGvqAx2kIntIExbPwW4IJaYuULXML/7y8gQCEd5o7UFqs
         nWRYcFfZ/Xoa7XfcYucXBbTRgN+/Uf/cQ16OiO+7Y/ztTOTewBf8szDUH4VXWML9ncce
         n/+YV9CFW0h+4g3Om1s5/BvB4yTE0E6JpNNLRtoY7ylYb4x6I8G2I2ZyR3C6asdUSsac
         JcDHfGzS7tv02fCXxuDY2CHGFX/OQ0DtahpZfF+p/f2V62+qSaTGqq+4QR0hoVZG5p4D
         l0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678905505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cVubaIqvmyZcVmODQ4m0c66Rfjv3Ax4FAubBWjKvyUI=;
        b=DFHwI0ufq1hYDVl4ZewZyIrN8VkPFBMK6t2vFVre/qgTFzFhpadE/8UumDQO8EujyG
         q2iaBLUt9eDCdZ3kp6FCE5q58LwltmMiCC94SI9UU04ZcDr/55V9Avwj1J1thMj5LHK9
         TrbaWwkVq+H3lR0ojGoAeSHnB0CFrLvYSlZoEb31XEGqSpyNivChtpzKmgj1dkFLMZNQ
         vdlc18zITNj43vprNGGDJJ74a9Ti6Jq7v5yFFMnnA1LHNxsdKLNU1c0kOPut/s9d9o+f
         dx5WqARREOkkq0NkSgXg6sOsAGDrtb0Y/9ysTnhboqV+9Rdma3slD262TCmgxIDCQm+q
         WPEA==
X-Gm-Message-State: AO0yUKWgU4eAxx7vnsnOG5jj8VThvGWfsDUCN3b6cwcGhjvymtMBKmNc
        UBCBC2EssO0s1WK6qn6FdVI990stiVplNw1YiwY=
X-Google-Smtp-Source: AK7set84NzHICTZHh+Hel5/BN/OKTrtw1DK3YnyugJrhQvB1cG5i0IemvtS8crWDlETL4lCsusCg3A==
X-Received: by 2002:a2e:a58e:0:b0:295:a280:45e4 with SMTP id m14-20020a2ea58e000000b00295a28045e4mr1760515ljp.36.1678905504709;
        Wed, 15 Mar 2023 11:38:24 -0700 (PDT)
Received: from localhost.localdomain (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id k7-20020a2e2407000000b00298699aad60sm951261ljk.52.2023.03.15.11.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 11:38:24 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Add PM2250
Date:   Wed, 15 Mar 2023 19:38:19 +0100
Message-Id: <20230315183819.3563704-1-konrad.dybcio@linaro.org>
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

Add a compatible for PM2250, commonly found with QCM2290.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 8f076bb622b1..975c30aad23c 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -33,6 +33,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,pm2250
           - qcom,pm6125
           - qcom,pm6150
           - qcom,pm6150l
-- 
2.39.2

