Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4551EDA15
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 02:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728390AbgFDAnj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 20:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728382AbgFDAnj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 20:43:39 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D3A6C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2020 17:43:38 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a25so5111759ljp.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2020 17:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lf2AkgbZNNBLszG0Yic70a6dubyQ2Qb8wbjXSRCkiy4=;
        b=FIRvt2hI9pF83v+VUTI3gFpqZ2LhQZyoRHgtcOuRSRNyRPocoaHuxMtGwhuHqYVoo5
         vJJhSUXr4gVXnLZkk8SOaiCUE47PhvWqWbOVcLgCGNbP4VyRCqPG2ksxgsgc1atcnizL
         jvNdwcziPfIGHJpPfTOnw2dAztZxO9rTSLiIDxmF3NhtymgFE4QMQ1oQZypXEuuXOgjm
         1mu4RU4od4DuVJWjifSXUMXkiL4h7rzY1ke+WgKCLue30jOXzLYDLOKEpVFOhzzYvHOY
         avaBK+wuwxmdq00vq19TUXfC35TbJMbZm7U5T+7DpLc/QxVWK+oAs2CAhwTKv1ThW8BD
         EGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lf2AkgbZNNBLszG0Yic70a6dubyQ2Qb8wbjXSRCkiy4=;
        b=FVxW7u4GIhUQb7i3lQYCR53RoeVBdb6GHvJwIT4A2JbPHGessmnaKq9z+L46qqn3Kr
         atfw1w7CAXMlemaS3RuEqZF5DcM96g25BCO2qn46FkjZMuvLRdMWHd5NJm02/DBuXU9/
         o/3qxAp67apylyf0oJ+WjsaxpprojJx4J8w9muk6CxjvRJW/rdhuCqqow5mV6U55uVFe
         WWdn1uDYV/Vw/d5H3dTqZJ7d7defy3rS7qs2xzgCrGEjsdfQ4QNNPi9K2ahGS6mazOJc
         HvMaXSlkWS5rpYql7+zd6nnUARvUjo31Q3e6gTdXOSF4FQEtoPYgGo2cO2cN4N7lIkmo
         8RXw==
X-Gm-Message-State: AOAM5320ilfiuwCT4VoWrxtg3aPJQlFFufxV2iK5MyzXyjmUnQxOdQ4z
        o1gOSCRDV3l3NoNngobzSFvv4w==
X-Google-Smtp-Source: ABdhPJy/QFf3BjDD2Vmrs7DO/JnE1fQxk2CfAIaD+dKQyNNaoN3pIR1k1G1zp9qZsqCnVOzP2BM0pg==
X-Received: by 2002:a2e:5415:: with SMTP id i21mr860383ljb.233.1591231416931;
        Wed, 03 Jun 2020 17:43:36 -0700 (PDT)
Received: from eriador.lan ([188.162.64.226])
        by smtp.gmail.com with ESMTPSA id t16sm858527ljj.57.2020.06.03.17.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 17:43:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: [PATCH 3/7] arm64: dts: qcom: sm8250-mtp: include pmic files
Date:   Thu,  4 Jun 2020 03:43:27 +0300
Message-Id: <20200604004331.669936-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Include files describing used PMIC chips, GPIOs, power on, etc nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index 0bc4b1e037c4..c20ae91d3026 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -7,6 +7,10 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8250.dtsi"
+#include "pm8150.dtsi"
+#include "pm8150b.dtsi"
+#include "pm8150l.dtsi"
+#include "pm8009.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. SM8250 MTP";
-- 
2.26.2

