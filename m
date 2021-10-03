Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA224200D3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Oct 2021 10:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhJCIfP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Oct 2021 04:35:15 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:37980 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229999AbhJCId4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Oct 2021 04:33:56 -0400
Received: from g550jk.portal.nstrein.ns.nl (unknown [145.15.244.215])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id DF373C9115;
        Sun,  3 Oct 2021 08:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1633249928; bh=X4Qneg2lzExo3bu3en8DYD1jCtqON6mIXHXBLOUGwvE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Cnvzqi51zafi6/EOgB7bZLu6ltQgSr+5n5CPZcZKQJyT7KWHZPqdf92D8vR648Es5
         +kq5RcO/j7lEOm5f8OrZ22DPlRttrOtfhY1tj6nkMQvA4UaD1ocwCMYPBJr8KeaoLM
         83iPBX7+THEZqGOqy0eFab4vvMdR5/j/EkZC5Tq4=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] dt-bindings: arm: cpus: Add Kryo 570 CPUs
Date:   Sun,  3 Oct 2021 10:31:31 +0200
Message-Id: <20211003083141.613509-9-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003083141.613509-1-luca@z3ntu.xyz>
References: <20211003083141.613509-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document Kryo 570 CPUs found in Qualcomm Snapdragon 750G (SM7225).

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 897eec887e5a..1e530391f355 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -172,6 +172,7 @@ properties:
       - qcom,kryo468
       - qcom,kryo485
       - qcom,kryo560
+      - qcom,kryo570
       - qcom,kryo685
       - qcom,scorpion
 
-- 
2.33.0

