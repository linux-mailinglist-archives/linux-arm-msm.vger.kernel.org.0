Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E692F74F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 10:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbhAOJKg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 04:10:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:35596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbhAOJKf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 04:10:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63C0D2339D;
        Fri, 15 Jan 2021 09:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610701794;
        bh=2LsRbyy+Do/aO21gdeD8r6ksKU/aBqs/cH54QcFN0M0=;
        h=From:To:Cc:Subject:Date:From;
        b=kwOsFVdhMhd4G8E6EBIJ2M/mJv4XJCk+e8/OQeGt/4LYAoIrshRd2769DjDHuWzBj
         GZO6pwHE8IbceZTwBaiXxctaiYSN9rqw88arE1llWuN3kQnMxLIzr3LMVBtu31rz/3
         5t/L0ASDCxW4UWXJHWCzFFhsyEnd+XzLmGE7zmS9ZirGtW2GiQPyHY1kxA60lFIVCU
         ElCS9j261nDAJHNne33jWdbnMrnrSCuIctlE0ygISU629eUCS+c02SH0n0Y1Pqxv/z
         2r1WuqbHDk9SnUtGveRtfTGtehN+EXesKRX1p4WsuPvkGJfOWKOjK37KBBpm/Gzk14
         GbCZ4qcgnDGRA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH 1/2] [REPOST] dt-bindings: qcom,pdc: Add compatible for SM8250
Date:   Fri, 15 Jan 2021 14:39:40 +0530
Message-Id: <20210115090941.2289416-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatible string for SM8250 SoC from Qualcomm. This compatible
is used already in DTS files but not documented yet

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
Reposting this with acks collected

 .../devicetree/bindings/interrupt-controller/qcom,pdc.txt        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
index 1df293953327..9c1a046e6fd9 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
@@ -20,6 +20,7 @@ Properties:
 	Definition: Should contain "qcom,<soc>-pdc" and "qcom,pdc"
 		    - "qcom,sc7180-pdc": For SC7180
 		    - "qcom,sdm845-pdc": For SDM845
+		    - "qcom,sdm8250-pdc": For SM8250
 
 - reg:
 	Usage: required
-- 
2.26.2

