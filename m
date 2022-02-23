Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D96544C1C2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 20:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244394AbiBWTap (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 14:30:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234482AbiBWTao (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 14:30:44 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67AD47AF0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 11:30:16 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id l8so19675864pls.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 11:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XnpBjOSR9snaUDMP0OhFyFwTrfkZCrEQWX2yIy1MdZM=;
        b=SgrOmBbx0nAAeaVSAb9RN8ZeXKHbp5y9wZQZSL6zSK6QFKB+k6MuzoId5/vaTnGRZW
         nPsURxTcu5Kktvl+1PJT5m28LSFswb19LVNzqcxsnHDth7QsvDXZwDpJkcTNyAu+SQso
         AOIoGGpTU1KWuq2bhln4ghkFcd5lv8vTuZ+5CvXJu11Mtmn8xZvi/Z5ycXtGW3UGWz/B
         p82Z66k3utwKYkWooAnFUW1Rirptzq2nrD43DQ5+wmGSAeI92EIkdX5/hvwjsTGfp/XD
         cw8I0jMNsMBoM5p9AuYyTND2F+jbwK1YPgT+/JXEgeWQFSsLNr0pL8gyT7vDQqU9rJih
         TNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XnpBjOSR9snaUDMP0OhFyFwTrfkZCrEQWX2yIy1MdZM=;
        b=34Pvhp3CEKGU6jslJ1RpNYq9xqwpePeUmKziIkJx+Y/qJSDekoMPTvtxNzXEWtXjdr
         ah8d1EfJKlWBW3LtrMAxEkfRh9fmBL85N83NP2mCu2C2NkmoTtR5mwwgk0GR0luKiS7Y
         2peXzbv8DaVRuh9eC4ItnkAuHn+wZnlecY3IzxQVh6GETjOwXxq8FsmKSanKV2EZQs+6
         rXrqpWyCw+RJC9/8/q077HC+N+oPLuD0yWovcTHui9judCczicAl4x3W2Ytf95l7aSUM
         KuG3f//+6T71xetqk7cfZz1tIuwt3IRK0fVcRrWAgMHdlrH2Z42cACPvLgxaVTITsWt3
         kywQ==
X-Gm-Message-State: AOAM530tS3qS2+16yPL6AWIkd9xt4XGik0tnKNwAN0hmvdClecuET6b2
        gzpXg1fFGl9Cz4aPtjRSMtM38MVCjdd7mg==
X-Google-Smtp-Source: ABdhPJzaUFZ3QSul4U3dZQTaWPGuLsaCMT9ceVaIdyMGxT7el1FgP4IrKqJqXF8L7e3Xpyn3ehmlJQ==
X-Received: by 2002:a17:90a:ce08:b0:1bc:16cb:343d with SMTP id f8-20020a17090ace0800b001bc16cb343dmr894031pju.158.1645644616227;
        Wed, 23 Feb 2022 11:30:16 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:180f:6b3c:fda0:57e9:7d44:2aa7])
        by smtp.gmail.com with ESMTPSA id z10-20020a17090a8b8a00b001b8d20074c8sm3719917pjn.33.2022.02.23.11.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 11:30:15 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, svarbanov@mm-sol.com,
        bhelgaas@google.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 2/6] dt-bindings: phy: qcom,qmp: Add SM8150 PCIe PHY bindings
Date:   Thu, 24 Feb 2022 00:59:42 +0530
Message-Id: <20220223192946.473172-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223192946.473172-1-bhupesh.sharma@linaro.org>
References: <20220223192946.473172-1-bhupesh.sharma@linaro.org>
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

Add the following two PCIe PHYs found on SM8150, to the QMP binding:

QMP GEN3x1 PHY - 1 lane
QMP GEN3x2 PHY - 2 lanes

Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index e417cd667997..9e0f60e682c4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -38,6 +38,8 @@ properties:
       - qcom,sdm845-qmp-usb3-phy
       - qcom,sdm845-qmp-usb3-uni-phy
       - qcom,sm6115-qmp-ufs-phy
+      - qcom,sm8150-qmp-gen3x1-pcie-phy
+      - qcom,sm8150-qmp-gen3x2-pcie-phy
       - qcom,sm8150-qmp-ufs-phy
       - qcom,sm8150-qmp-usb3-phy
       - qcom,sm8150-qmp-usb3-uni-phy
@@ -333,6 +335,8 @@ allOf:
               - qcom,sdm845-qhp-pcie-phy
               - qcom,sdm845-qmp-pcie-phy
               - qcom,sdx55-qmp-pcie-phy
+              - qcom,sm8150-qmp-gen3x1-pcie-phy
+              - qcom,sm8150-qmp-gen3x2-pcie-phy
               - qcom,sm8250-qmp-gen3x1-pcie-phy
               - qcom,sm8250-qmp-gen3x2-pcie-phy
               - qcom,sm8250-qmp-modem-pcie-phy
-- 
2.35.1

