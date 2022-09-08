Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 815C05B256F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 20:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbiIHSPp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 14:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbiIHSPm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 14:15:42 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A2F7E31A;
        Thu,  8 Sep 2022 11:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:Message-Id
        :Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=KEqqxV7+w6K6/dAlPcwLEpwvGqKa/pz7uec2FiPbYSI=; b=PvgMfBqLq4KlQg5Tjhv4zwVBaG
        bu9e1bm68tg93nP4+Tf/IRRBYILykx6zLzQs8n20HUTJkOrCVlVa/qawGEpZfZ7kOE5aTqa5z7DxB
        jWEgP/ZjSTQzRBNq4YbxZzQRPKD3xaTBFAPR680+09TLUbejYFOiynSJ5/ayUFaj2D+mUE+S40w5o
        ytTutMP0la2I92RbUJCV1Kxdveux97QKJwUqcE6j6auKQmG8jOj9Np+FCLLgrv3GcDKvAFkFWtbcL
        uui02Wrgz4Rc37tt/3QA7jMC5vCVvW+1Ih3Ghm3THQvdY8Ag+b0aixZx7mG/KpxMWXaz1WuiQW42M
        vH3nl3Cg==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1oWM3g-004g7y-Re; Thu, 08 Sep 2022 20:15:24 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH] dt-bindings: remoteproc: qcom,smd-edge: Add APR/FastRPC
Date:   Thu,  8 Sep 2022 20:14:32 +0200
Message-Id: <20220908181432.458900-1-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
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

Similar to qcom,glink-edge.yaml the smd-edge can also contain
apr/fastrpc nodes for functionality exposed by the modem or audio DSP.

These nodes are already used in existing device trees, adding them
fixes the following dtbs_check warnings after converting
qcom,msm8916-mss-pil to DT schema:

arch/arm64/boot/dts/qcom/apq8016-sbc.dtb: remoteproc@4080000: smd-edge:
Unevaluated properties are not allowed ('fastrpc' was unexpected)
  From schema: remoteproc/qcom,msm8916-mss-pil.yaml

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
Since qcom,fastrpc.yaml only exists in Rob's tree right now and
a similar change for qcom,glink-edge.yaml was applied there it is
probably easiest if this patch goes through Rob's tree as well.
---
 .../devicetree/bindings/remoteproc/qcom,smd-edge.yaml  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml
index 06eebf791e32..9b9eaa80fd20 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,smd-edge.yaml
@@ -19,6 +19,16 @@ properties:
   $nodename:
     const: "smd-edge"
 
+  apr:
+    $ref: /schemas/soc/qcom/qcom,apr.yaml#
+    description:
+      Qualcomm APR/GPR (Asynchronous/Generic Packet Router)
+
+  fastrpc:
+    $ref: /schemas/misc/qcom,fastrpc.yaml#
+    description:
+      Qualcomm FastRPC
+
   interrupts:
     maxItems: 1
 
-- 
2.30.2

