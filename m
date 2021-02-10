Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CABE316426
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 11:46:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231492AbhBJKpy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 05:45:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:50266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230383AbhBJKnr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 05:43:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 885AD64DD8;
        Wed, 10 Feb 2021 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612953786;
        bh=OnrZfrz9rG2bg2Ab96WdtAn8mZsRQT+9aUasK8Gxirc=;
        h=From:To:Cc:Subject:Date:From;
        b=ELrCAgjbH+Hqf6oKg9xt4Pynh3SBsRfQVRR7ohCGwEi7wBKBrgcYJZgsIJbrQl1Ql
         y0hqDVJ9bk37e1Seb6TQ0ZLIJWxycnBOrMm8tEhvBVK+Pu5SmRao8qonxmWgKSa7xn
         eOdz4W2dt6StFDQ03pLxc/D+qthHH+4Q/42xnE5/3yqQPBXseFWUDMlN7duMDcSQRc
         R00ksTtV2aFAz96kqzGpgFUG3ZfEhk/lBOzWuhfrFcoIfN14xP2EAb6yi1S2w5ajoq
         l8K3mH/ZaaIpL+swv5d0UcW4/+jgK6MSciOcD/mhsMTDluK9SerCuHVjN3gB59V7bE
         IMbIcxB6NXnEg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: power: Add rpm power domain bindings for SM8350
Date:   Wed, 10 Feb 2021 16:12:56 +0530
Message-Id: <20210210104257.339462-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add RPM power domain bindings for the SM8350 SoC

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 64825128ee97..a71024c24295 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -28,6 +28,7 @@ properties:
       - qcom,sdx55-rpmhpd
       - qcom,sm8150-rpmhpd
       - qcom,sm8250-rpmhpd
+      - qcom,sm8350-rpmhpd
 
   '#power-domain-cells':
     const: 1
-- 
2.26.2

