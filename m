Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA2C567124
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 16:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbiGEOft (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 10:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231338AbiGEOfr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 10:35:47 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDFDF55A6;
        Tue,  5 Jul 2022 07:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=I5COuRBWta+BF25FG4twgW3CKzNU+lKHPy38Hzoo2ug=; b=IFNR+6uMeWsqTxqsPMS5IwMdqi
        PAm+CqZn1QvmuwvpRdqwgZizm1GXIPK1CUqtewld2PIrt4A8WJQDyue7Swn9RgYNL3g5z8j6eK88Q
        zbbO72xpg4l0OTjGnL0bZVx8EzOJhxEHL4yCMTrvJLFfkCyUrkMWWR1MpBUwTs+SY3YnkLGVfs8Ou
        STL1wKEzrPEWnk4U+i8lqAhTs4UVS6b5gSTx+RGVodsMYe0SAA489KV8sOHVnVrXA0qKfvFeTHutA
        hUICjt+ZsnOpbTut2nUpO8WCwcdcw+J74HGGwVWi+efP4AU0zyaDoqtcOKNBVA2BqGuytoRiEDRl/
        FYkH9dfA==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o8jeQ-007EB6-So; Tue, 05 Jul 2022 16:35:42 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 3/8] dt-bindings: power: qcom-rpmpd: Add MSM8909 power domains
Date:   Tue,  5 Jul 2022 16:35:18 +0200
Message-Id: <20220705143523.3390944-4-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220705143523.3390944-1-stephan.gerhold@kernkonzept.com>
References: <20220705143523.3390944-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8909 has the same power domains as MSM8916 so just define them
as aliases for the existing definitions.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 include/dt-bindings/power/qcom-rpmpd.h                  | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index ad77a6380f38..0ccca493251a 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - qcom,mdm9607-rpmpd
       - qcom,msm8226-rpmpd
+      - qcom,msm8909-rpmpd
       - qcom,msm8916-rpmpd
       - qcom,msm8939-rpmpd
       - qcom,msm8953-rpmpd
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 6cce5b7aa940..d81de63ae31c 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -187,6 +187,13 @@
 #define MSM8916_VDDMX		3
 #define MSM8916_VDDMX_AO	4
 
+/* MSM8909 Power Domain Indexes */
+#define MSM8909_VDDCX		MSM8916_VDDCX
+#define MSM8909_VDDCX_AO	MSM8916_VDDCX_AO
+#define MSM8909_VDDCX_VFC	MSM8916_VDDCX_VFC
+#define MSM8909_VDDMX		MSM8916_VDDMX
+#define MSM8909_VDDMX_AO	MSM8916_VDDMX_AO
+
 /* MSM8953 Power Domain Indexes */
 #define MSM8953_VDDMD		0
 #define MSM8953_VDDMD_AO	1
-- 
2.30.2

