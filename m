Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89A893AAABC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 07:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhFQFUF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 01:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbhFQFUD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 01:20:03 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 633F8C0617AE
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 22:17:42 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id n12so3937487pgs.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 22:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S8wDhmMZhTosO2tj3IOqJkYffs6zm6oQvLUiE+b162s=;
        b=fG5UQBUGzTsVtH8qK16rDo/344ZQkQ6mxzsSH3UUtxFg/nfMtGae9LAMPf3GqFi5Gk
         VdnDYuUtovfzE6qq1Aw4CM9HNV1A+sRPb2iQz3kkrR+GNnnMVrqPUTkjG/DEIHl7T1ew
         ZHTwyJXVI5XYJN6yY+ROvn5LmcHWzUNvhDlROQLOXVRg34w/tMXkdg315k14hxqswqgv
         8sc5iHR7RSqzc9V1DDu8me5sqdXhd1j5bQ2o45UVHmJaG/FytL4qSMTjDQPMPAVh0RWy
         K1i5JTip6S8uuvvnfBEjlsjQuwqAVnOPCIbXDew0OeIPAms5Q8IdnHFfqXJLTW5UnD5U
         4bWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S8wDhmMZhTosO2tj3IOqJkYffs6zm6oQvLUiE+b162s=;
        b=Ir13OxZu1TpNwRiedKSu7ceY/GmlJnkUUAc/gRc98eLQejBVR+eFtJmirR7Ck+84YK
         Xzx2y4WC05H2QhN52nQ3IscwaN2vp0baT9QJiuFSeNGqIFAGLmBNILLZnUkOzLvUl6FU
         H/F3TFTKbqksIP4RTlmxFobrvuOTv2x9Z9glAR67Hsw946tuRaoGD44po9usOgOwlq/G
         wv8xDHT9sIWQYNdgRONBwOEtvCqbiePHqfHf1hcA38Z7E/VlwdRW9q19PufrNO/8K+H1
         M5nE4KoeFsiiZGgoh/mBW4krxIu5FkjKDpAhp4A2Y5b7bL6jMpM/Vmx1DahG5RAXyj0w
         U3cw==
X-Gm-Message-State: AOAM532Kmv+QVFH3F2QRpRx72rPNoOsZ+gMczF+uEO0n0iZYVWW/tQTm
        lR/NTIN/fjfBrP3uFoO2MkcXRu+nSoH+qg==
X-Google-Smtp-Source: ABdhPJyXgt+A2HMXHIuRWJ61zRoAe149gz2Xcehd+DqNkV8+9y2RVj0PoB8M03IozAkm+smrqFSn1g==
X-Received: by 2002:a63:d242:: with SMTP id t2mr3251913pgi.210.1623907061752;
        Wed, 16 Jun 2021 22:17:41 -0700 (PDT)
Received: from localhost.name ([122.177.46.2])
        by smtp.gmail.com with ESMTPSA id 188sm3900893pfz.146.2021.06.16.22.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 22:17:41 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 1/5] dt-bindings: regulator: qcom,rpmh-regulator: Arrange compatibles alphabetically
Date:   Thu, 17 Jun 2021 10:47:08 +0530
Message-Id: <20210617051712.345372-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617051712.345372-1-bhupesh.sharma@linaro.org>
References: <20210617051712.345372-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Arrange the compatibles inside qcom-rpmh regulator device tree
bindings alphabetically.

Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../bindings/regulator/qcom,rpmh-regulator.yaml  | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index e561a5b941e4..3546c6a966a3 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -33,6 +33,9 @@ description: |
 
     The names used for regulator nodes must match those supported by a given
     PMIC. Supported regulator node names are
+      For PM6150, smps1 - smps5, ldo1 - ldo19
+      For PM6150L, smps1 - smps8, ldo1 - ldo11, bob
+      For PM7325, smps1 - smps8, ldo1 - ldo19
       For PM8005, smps1 - smps4
       For PM8009, smps1 - smps2, ldo1 - ldo7
       For PM8150, smps1 - smps10, ldo1 - ldo18
@@ -41,15 +44,15 @@ description: |
       For PM8350C, smps1 - smps10, ldo1 - ldo13, bob
       For PM8998, smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
       For PMI8998, bob
-      For PM6150, smps1 - smps5, ldo1 - ldo19
-      For PM6150L, smps1 - smps8, ldo1 - ldo11, bob
-      For PMX55, smps1 - smps7, ldo1 - ldo16
-      For PM7325, smps1 - smps8, ldo1 - ldo19
       For PMR735A, smps1 - smps3, ldo1 - ldo7
+      For PMX55, smps1 - smps7, ldo1 - ldo16
 
 properties:
   compatible:
     enum:
+      - qcom,pm6150-rpmh-regulators
+      - qcom,pm6150l-rpmh-regulators
+      - qcom,pm7325-rpmh-regulators
       - qcom,pm8005-rpmh-regulators
       - qcom,pm8009-rpmh-regulators
       - qcom,pm8009-1-rpmh-regulators
@@ -59,11 +62,8 @@ properties:
       - qcom,pm8350c-rpmh-regulators
       - qcom,pm8998-rpmh-regulators
       - qcom,pmi8998-rpmh-regulators
-      - qcom,pm6150-rpmh-regulators
-      - qcom,pm6150l-rpmh-regulators
-      - qcom,pmx55-rpmh-regulators
-      - qcom,pm7325-rpmh-regulators
       - qcom,pmr735a-rpmh-regulators
+      - qcom,pmx55-rpmh-regulators
 
   qcom,pmic-id:
     description: |
-- 
2.31.1

