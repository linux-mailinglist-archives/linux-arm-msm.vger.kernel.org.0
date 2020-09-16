Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 479F626C95B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 21:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbgIPTHr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 15:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727370AbgIPRoz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 13:44:55 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33C3FC061A27;
        Wed, 16 Sep 2020 04:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600254273;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=oSgiL+AbBxRXhhY4lOKblC5UcEx6a7SRflvIOJJAAY8=;
        b=NVniFmbqS9EPIHB9A2WT51iqMVf+zqzR4+9y8S/xrQMAgR8joMZPK4Qt9xCUNrWLQv
        7riRbU/c7c5+BWkpQcuLbwFSlOTnIzqAQGKda1BVCB4l/MNNPcS/DpEUIG2HE70RyLnD
        Wcmp930KyOJUqrO6DyegoedFrzAm6W5SJQnrvzjksLtdjnA+tPev5cCnK+cx/7Dw/jCZ
        zJbZDB3mrCfeHfNqspXwMLheJcj3+tNy9BJMR+U78hmwFYURnBcINoqt1bbQB5cslr9P
        ss6cvIPgOgNqg0QP5rvPOblvKKEHIPcCb1yst69kfbeq3oF2mNPYusG75bJK8zTBTlI6
        Xojg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6Nahc="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8GAfqzlS
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 16 Sep 2020 12:41:52 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 05/10] dt-bindings: remoteproc: qcom,q6v5: Deprecate regulators for PDs
Date:   Wed, 16 Sep 2020 12:41:30 +0200
Message-Id: <20200916104135.25085-6-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916104135.25085-1-stephan@gerhold.net>
References: <20200916104135.25085-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Newer platforms vote for necessary power domains through the power
domain subsystem. For historical reasons older platforms like MSM8916
or MSM8974 still control these as regulators.

Managing them as power domains is preferred since that allows us
to vote for corners instead of raw voltages. Document that those
should be specified as power domains and deprecate using them
through the regulator interface.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt     | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 1f9a62e13ebe..7ccd5534b0ae 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -113,8 +113,8 @@ should be referenced as follows:
 For the compatible strings below the following supplies are required:
   "qcom,q6v5-pil"
   "qcom,msm8916-mss-pil",
-- cx-supply:
-- mx-supply:
+- cx-supply: (deprecated, use power domain instead)
+- mx-supply: (deprecated, use power domain instead)
 - pll-supply:
 	Usage: required
 	Value type: <phandle>
@@ -123,9 +123,9 @@ For the compatible strings below the following supplies are required:
 
 For the compatible string below the following supplies are required:
   "qcom,msm8974-mss-pil"
-- cx-supply:
+- cx-supply: (deprecated, use power domain instead)
 - mss-supply:
-- mx-supply:
+- mx-supply: (deprecated, use power domain instead)
 - pll-supply:
 	Usage: required
 	Value type: <phandle>
@@ -149,11 +149,11 @@ For the compatible string below the following supplies are required:
 	Usage: required
 	Value type: <stringlist>
 	Definition: The power-domains needed depend on the compatible string:
-	qcom,q6v5-pil:
 	qcom,ipq8074-wcss-pil:
+		    no power-domain names required
+	qcom,q6v5-pil:
 	qcom,msm8916-mss-pil:
 	qcom,msm8974-mss-pil:
-		    no power-domain names required
 	qcom,msm8996-mss-pil:
 	qcom,msm8998-mss-pil:
 		    must be "cx", "mx"
-- 
2.28.0

