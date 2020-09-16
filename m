Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A80926CAB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 22:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbgIPUMa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 16:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727145AbgIPRdP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 13:33:15 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB8DC061A30;
        Wed, 16 Sep 2020 04:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600254283;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=xNx2nYiBqTvwDNj3lkeSGDvTSffXCVKMpdIp0iYKFeg=;
        b=LGMVw2u1OABHMWwPe2OVkk5AWw2/j+JvbDMn5F2oqJ9gnFpsQdDsJ+ZP1Xtv5CXwuN
        2WGmxLqEaZvPakxKDrfLLh6ZSMu6HtDFhGxu3TnCR36byfz+o3/1rRKZ+q4v78IPrAEF
        6Tc3CM7auwCbrzLR0qNpGaeMB1BFnqdDyRJe5W2qGYBeKG3myljSPj66GrtZXa5qHGkk
        4f7wO8Z+kIQlU/4q6bDbMZJpEoTWvnW4F5/YXMcoK+uH+bxMb6KCYrlcdXFTMgoLDWGo
        kvqqzqPY/0VUxm7cB1aG0PDNwIZNlRIRn/9nF1nCtwnIEsOaoBEIzkOwgWrhrKclUWhf
        weLA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6Nahc="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8GAfozlP
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 16 Sep 2020 12:41:50 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 02/10] dt-bindings: power: rpmpd: Add MSM8916 RPM power domains
Date:   Wed, 16 Sep 2020 12:41:27 +0200
Message-Id: <20200916104135.25085-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916104135.25085-1-stephan@gerhold.net>
References: <20200916104135.25085-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8916 has two RPM power domains: VDDCX and VDDMX.
Add the device tree bindings to manage them through rpmpd.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 include/dt-bindings/power/qcom-rpmpd.h                  | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 8058955fb3b9..f136d06b7fc8 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,msm8916-rpmpd
       - qcom,msm8976-rpmpd
       - qcom,msm8996-rpmpd
       - qcom,msm8998-rpmpd
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 5e61eaf73bdd..83dae2cabb60 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -64,6 +64,13 @@
 #define RPMH_REGULATOR_LEVEL_TURBO	384
 #define RPMH_REGULATOR_LEVEL_TURBO_L1	416
 
+/* MSM8916 Power Domain Indexes */
+#define MSM8916_VDDCX		0
+#define MSM8916_VDDCX_AO	1
+#define MSM8916_VDDCX_VFC	2
+#define MSM8916_VDDMX		3
+#define MSM8916_VDDMX_AO	4
+
 /* MSM8976 Power Domain Indexes */
 #define MSM8976_VDDCX		0
 #define MSM8976_VDDCX_AO	1
-- 
2.28.0

