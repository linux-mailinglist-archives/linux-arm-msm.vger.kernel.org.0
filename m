Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 003476D2602
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 18:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjCaQpw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 12:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbjCaQpP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 12:45:15 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 244011B376
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 09:44:00 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id j13so21030023pjd.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 09:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680281037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ns2jPDGRWz/czfPYAkU0ANfXA6YC0owDF4gxQpajwV0=;
        b=aiimWe8pF/BriYtPf0PKn2U8465iFm5sNDYnZtgWj5CHvNm9VwbTArsIug5gxQlP2Z
         zrOvSMF/ptx4zOWzyWFjhYBBelyoVbcuPSXKJDcvVJBIkCwTc93woeMh/2IJDI747rDY
         CgzzdnLMZTIfli/q7zcINzyqmQw0eYwPFMxGeHlKfibPQCD9Jf2O8/Skgdg31EvJcEQA
         w1DhYtK2FdKnhkdIYIrP5rJIGrmXrjgxT7oQkr397823VjrmFDUEE2zhzgOLd5nvttcx
         gP/8GfSDhZRnXrNtQuXUIS+k4sL5WFxgURnXeERKDoIbyXQy+Q6eyZ3UKQNibkjGxVxv
         WrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680281037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ns2jPDGRWz/czfPYAkU0ANfXA6YC0owDF4gxQpajwV0=;
        b=te9MMRSY8dzIRNAV7vDwbkkrp37yVyJLLeSVbLswH85ebLptKqizC0/N6kilQJmjPO
         JINbm5gWjQQJPLlbEP4ofRjcFrao68NdXuakitFYClnAIq5xiZxomqAn9AZlOh1Z9W21
         QRaVr5cCgzxtQE0JwvWdSG84qgZTLtQW8y1k8ozR0Q6mssStZbTH4a/M5RdqGxPrALel
         Tv9ZNdNjq1cswbZdILzonJwpImGz8Vg5MeroDQbJxdP8DX+tb3VmJLOzplad8z/d20tM
         JWQ3Yw8xrOvmWotmNd8/uPo69nZ/8ZRhFZ1+HalvhC9rGdgThywgc766vkTq+fZ3zMKO
         XSdw==
X-Gm-Message-State: AAQBX9d5c9LzIXsYSBSWufLzDg+9/pPictxPcPuxpUN4U+tbaxwAj31B
        FvgXthIziR0XOcyDLFrcdi+mOmVrI61gkSzQUG4=
X-Google-Smtp-Source: AKy350YBHz2GwuQS2tjXBT1r2+lcPRvkfPSLqAp9Kv6j/d4fJ/dNHxbGwE54Xnj5FtXfG3O9h4F+RQ==
X-Received: by 2002:a17:90b:1bd1:b0:23d:3fbe:2f7 with SMTP id oa17-20020a17090b1bd100b0023d3fbe02f7mr30224030pjb.20.1680281037447;
        Fri, 31 Mar 2023 09:43:57 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c5e:53ce:1f39:30a5:d20f:f205])
        by smtp.gmail.com with ESMTPSA id x13-20020a170902b40d00b0019b089bc8d7sm1798767plr.78.2023.03.31.09.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:43:57 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org
Subject: [PATCH v4 05/11] dt-bindings: qcom-qce: Fix compatible combinations for SM8150 and IPQ4019 SoCs
Date:   Fri, 31 Mar 2023 22:13:17 +0530
Message-Id: <20230331164323.729093-6-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230331164323.729093-1-bhupesh.sharma@linaro.org>
References: <20230331164323.729093-1-bhupesh.sharma@linaro.org>
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

Currently the compatible list available in 'qce' dt-bindings does not
support SM8150 and IPQ4019 SoCs directly which may lead to potential
'dtbs_check' error(s).

Fix the same.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index e375bd981300..90ddf98a6df9 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -24,6 +24,12 @@ properties:
         deprecated: true
         description: Kept only for ABI backward compatibility
 
+      - items:
+          - enum:
+              - qcom,ipq4019-qce
+              - qcom,sm8150-qce
+          - const: qcom,qce
+
       - items:
           - enum:
               - qcom,ipq6018-qce
-- 
2.38.1

