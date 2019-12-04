Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40A981126F6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2019 10:20:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbfLDJUT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 04:20:19 -0500
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188]:58730
        "EHLO a27-188.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725922AbfLDJUT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 04:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575451218;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=p2y2RwyPERJGQCVp0lw0O6oIy5a8Ly1gvR0t4JSILNE=;
        b=N8TeMnNZGoQJ6jCM0Eer7/bGIUOq0MTpfnlqbsRYy8ku+gRCvMZvQ0od8ketXH6+
        Jwvxetnnyw7Iy8fGg1eIzECR7HkkXMRtHDAIKBFKvFejvuMPIQwaQ5/54AyYrMObdiw
        CZMu7+KrShZqW48W4AMWqY0HZD59x2hD63j9k/kU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575451218;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=p2y2RwyPERJGQCVp0lw0O6oIy5a8Ly1gvR0t4JSILNE=;
        b=IuRCd0pOOFphhQxZsqT/1E48O0Y2q/hjVW6GMNFd5Xf7cCavYQ3sI3JMge4uzwe8
        bNXrGuU/geN58u9gqtVUSM9UaKbYNBmIUhCrZ4bqDPTsSLXlc6tXQvRd3rwADHAu4sE
        x4ZNCJvbyQvVHeLezOtXJmg1cQzILQj42Rpkke50=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9CB94C447A4
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=pillair@codeaurora.org
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: sc7180: Make MSA memory fixed for wifi
Date:   Wed, 4 Dec 2019 09:20:18 +0000
Message-ID: <0101016ed035d185-20f04863-0f38-41b7-b88d-76bc36e4dcf9-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
X-SES-Outgoing: 2019.12.04-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MSA memory is at a fixed offset, which will be
a part of reserved memory. Add this flag to indicate
that wifi in sc7180 will use a fixed memory for MSA.

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
This patchet is dependent on the below changes
arm64: dts: qcom: sc7180: Add WCN3990 WLAN module device node (https://lore.kernel.org/patchwork/patch/1162434/)
dt: bindings: add dt entry flag to skip SCM call for msa region (https://patchwork.ozlabs.org/patch/1192725/)
---
 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 8a6a760..b2ca143f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -250,6 +250,7 @@
 
 &wifi {
 	status = "okay";
+	qcom,msa_fixed_perm;
 };
 
 /* PINCTRL - additions to nodes defined in sc7180.dtsi */
-- 
2.7.4

