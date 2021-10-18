Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4484316F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 13:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbhJRLMz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 07:12:55 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:16054 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhJRLMy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 07:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1634555438;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=DueWk7PS68Aynz42TauXnxWh163QWN8HTBz8dvEB9gU=;
    b=s5joQlzVJZ+dmtkl0MPCBho1UN5IStEuYJ09XprxpxqpjbkBUbFPrcuaekA8nbf8u0
    1BvnBxbuT2tMdtub42UEePwG6UP72vG/h4tguGKyLrFB8iSxVv++1YitDJD3yul1qCyJ
    lnlI88109qmdXU/vnOG0ge+E484O6YXSRZAa/PHqaQ6QaQyTCZ8YZllmZAi5XhNFd6cm
    kV7WutgQL3wXuYlPthvz/qE5RQd6fuD82+IpMjG4/C/2ZHz6oMQjHotLPza6uZgZjaD1
    qTvWwwZkquIUS1HJIma1GzVSKFAt8Dvp8yQLLqc6zmywLdGdB/Pl82MkrgrrwacktwX6
    vEXA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL1OfxR"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id 301038x9IBAbVhM
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 18 Oct 2021 13:10:37 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/3] soc: qcom: stats: Add fixed sleep stats offset for older RPM firmwares
Date:   Mon, 18 Oct 2021 13:08:02 +0200
Message-Id: <20211018110803.32777-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211018110803.32777-1-stephan@gerhold.net>
References: <20211018110803.32777-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Not all RPM firmware versions have the dynamic sleep stats offset
available. Older versions use a fixed offset of 0xdba0.

Add support for this using a new qcom,rpm-legacy-stats compatible
that can be used for older SoCs like MSM8916.

Suggested-by: Maulik Shah <mkshah@codeaurora.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/soc/qcom/qcom_stats.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 817505bd99b5..67728de718fd 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -237,6 +237,15 @@ static const struct stats_config rpm_data = {
 	.subsystem_stats_in_smem = false,
 };
 
+/* Older RPM firmwares have the stats at a fixed offset instead */
+static const struct stats_config rpm_legacy_data = {
+	.stats_offset = 0xdba0,
+	.num_records = 2,
+	.appended_stats_avail = true,
+	.dynamic_offset = false,
+	.subsystem_stats_in_smem = false,
+};
+
 static const struct stats_config rpmh_data = {
 	.stats_offset = 0x48,
 	.num_records = 3,
@@ -247,6 +256,7 @@ static const struct stats_config rpmh_data = {
 
 static const struct of_device_id qcom_stats_table[] = {
 	{ .compatible = "qcom,rpm-stats", .data = &rpm_data },
+	{ .compatible = "qcom,rpm-legacy-stats", .data = &rpm_legacy_data },
 	{ .compatible = "qcom,rpmh-stats", .data = &rpmh_data },
 	{ }
 };
-- 
2.33.0

