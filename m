Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886D1305B89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 13:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343533AbhA0MfI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 07:35:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:48462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237989AbhA0McF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 07:32:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96E4C20795;
        Wed, 27 Jan 2021 12:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611750676;
        bh=jmcfRNN25i2ohsqZwDtxcf2Xb7zyD6uyGntHaZ9vuHE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kgQAPp57Qbr33NJcFVXZ58Mb22Hnd4MK+G1+D7Q4O5knUHLM+XUzdJ8K5RxpPLken
         LN38h2e0VHuJMaxbNQmXrLwMyNKgLmR6VK/tTK32hcwBfmdsvlRL229cZFbD7ZYAFN
         cv4FfcmmkhTJCC/te/xi6QCS3BL946MyD6k0CzZ3Q1l20KmoglPfKuTijclkt1Oglf
         FsRQBmZ5OZRJ0IVM0Zb6xECG8goWnohPBgMg7wyWl0SbWLbJD50n32FXx+EoeY0Q7O
         PCL2AXNtvIjT10vW/Vc6JI4yclWuphyuTb3QPNcLexA3dyVFRbfeaeb7sn5CQmh7Rq
         YYEV1WE2QVYtQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] dt-bindings: firmware: scm: Add SM8250 and SM8350 compatible
Date:   Wed, 27 Jan 2021 18:00:52 +0530
Message-Id: <20210127123054.263231-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210127123054.263231-1-vkoul@kernel.org>
References: <20210127123054.263231-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for SM8150 and SM8350 SoCs.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
index 78456437df5f..a884955f861e 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -22,6 +22,8 @@ Required properties:
  * "qcom,scm-sc7180"
  * "qcom,scm-sdm845"
  * "qcom,scm-sm8150"
+ * "qcom,scm-sm8250"
+ * "qcom,scm-sm8350"
  and:
  * "qcom,scm"
 - clocks: Specifies clocks needed by the SCM interface, if any:
-- 
2.26.2

