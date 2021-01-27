Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055DF305B8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 13:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343537AbhA0MfL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 07:35:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:48442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237987AbhA0McF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 07:32:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38CBA20798;
        Wed, 27 Jan 2021 12:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611750672;
        bh=qth49y5ABTYXYFDlFX4RYDBLitErCw8n4cY+dxvbjb8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NY/DhJloaUaJYed7hb25MCrqVlZ2ZHa+8CUhAiclMqvBhZQMhtyvH+9PnDBzkv4LY
         CPVcA3HY9XiCljHKZzyGY+X924ZKdxuZDafrdB1MeA6HkLZDI0kfHt1S1+wKgRzhBS
         GewoNyLs7aTYvLjXObmzyA49QZmpjuXHRC/jGCcKzLWJRwpVx4RBkst7orMQS0qiBS
         QYsHveN3RtAWrDyEk5HjDDN/tkCUxJpv+lIub+AX5y0DosgqYFbdjdD7BPYIjDSSGB
         VpH2GMb0HC9XWVFVbhguPFXylsc3+rJ2dquk77md3zyk+pfneN8CnkAivmjoN4LMvU
         5OqoF2H/su0dg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] dt-bindings: arm: cpus: Add kryo685 compatible
Date:   Wed, 27 Jan 2021 18:00:51 +0530
Message-Id: <20210127123054.263231-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210127123054.263231-1-vkoul@kernel.org>
References: <20210127123054.263231-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Kryo685 is found in SM8350, so add it to the list of cpu compatibles

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 14cd727d3c4b..3a0b4c54cd8e 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -169,6 +169,7 @@ properties:
       - qcom,kryo385
       - qcom,kryo468
       - qcom,kryo485
+      - qcom,kryo685
       - qcom,scorpion
 
   enable-method:
-- 
2.26.2

