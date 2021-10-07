Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB3F425ED1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 23:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241604AbhJGV1b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 17:27:31 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:58990 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241462AbhJGV1Y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 17:27:24 -0400
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net [213.127.63.121])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 9502EC91C3;
        Thu,  7 Oct 2021 21:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1633641928; bh=X4Qneg2lzExo3bu3en8DYD1jCtqON6mIXHXBLOUGwvE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Rr52ltbDCtOGhdfUarR4DoKwO9e2wzk/oDvO5wyCMCYaZnAeKYHco5UY1KbnZrQ1D
         qWTA8iIAqTeo3PFLn6tJtoVA118olUierfjwTCzHnvONjNgSY1QaRvuWAogXLhpGlW
         hl4cZAoic8N7WTLByyOxij3oqifrYt0ZvNSDTygw=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org, Luca Weiss <luca@z3ntu.xyz>,
        Rob Herring <robh+dt@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/11] dt-bindings: arm: cpus: Add Kryo 570 CPUs
Date:   Thu,  7 Oct 2021 23:24:35 +0200
Message-Id: <20211007212444.328034-9-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007212444.328034-1-luca@z3ntu.xyz>
References: <20211007212444.328034-1-luca@z3ntu.xyz>
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

