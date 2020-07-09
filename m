Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3FB1219ED0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 13:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbgGILH1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 07:07:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727810AbgGILHP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 07:07:15 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1C6C08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 04:07:15 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id b6so1871906wrs.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 04:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5ypoS87uaYq5T1Ws5fpzwvYaFzn2rohMM1mgqyify3Q=;
        b=u/XQOJpRlPYAfkZQd67a8cfGanswI8V5QVehHkfbrFzIMDDe0G/ernaRhEM4XLh0VC
         1GK4E3PfbGomGPDfaaJE/ffo/sQHtkVUj8fUdmFGFSDzodzZIke5XoA7TiKcp2kJYn2D
         2p4DEap+OAMeKDUMYLuEfoX0En8TMCKA/YpyjvtsSgnn+UUahU+4zp5q35GbSeSOxAfp
         GZFccHLnYqs0qkaJO8Ja3hOyKS2hr6KbQzU44JNMdkjSIG3RSkwYxKBPTfhUqF7DiwB0
         /T8Gd779ciLnWaVL1UbYzbqDN/dV5O/mmxeJ/QUbZC7sWQp6UTZjp+VEApofs3CSFGQB
         MrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ypoS87uaYq5T1Ws5fpzwvYaFzn2rohMM1mgqyify3Q=;
        b=DLj0l5AMURUX1Y3I+1fcN50K1nQpRp585fXHmRPIMz9O65LthdtVYzpAVk4kiXyjkl
         v3GRJTQI7kxeqCH2SaTXQ7i5CHJeqOsxiTGf4V5yHzcp726Z93Ip9OnpG3LsOvx+B9XA
         dTAAqDk5cXF2vFkem9y2Y0ws/Y0OW8u2KaqNA/lB3SM7UUHDkGNkNxn4YEh1fce5K5fr
         fD0qUI/ZPNZRrMTdmkQh3R2yEX6Y1G38ZqoRXRTDKZGAXHPP1g5V+yMc7cn07n6uqBGF
         JnfquG/2U70WeG8j2fdByhJjSpredsQ5yOfFqSwwlxQ6pkuq1KECE1aulsUimB8dJUNY
         eJ+A==
X-Gm-Message-State: AOAM532c6+x4+DcPujbUH63tE/sS+Ut9mjHBl7vdySJ54ulyDAv1mswe
        7YNnPgm1riJpi3DJmQklGJUvA/Y1A/c=
X-Google-Smtp-Source: ABdhPJynWNpStYFUrVfAdO0LvBqdBvKmYX7eIbfu3UeYFpdUQ3gByC7usDKxfX5IOl3P6cYXTes0CA==
X-Received: by 2002:a5d:504b:: with SMTP id h11mr61368817wrt.160.1594292833936;
        Thu, 09 Jul 2020 04:07:13 -0700 (PDT)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id q7sm5375578wrs.27.2020.07.09.04.07.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 04:07:13 -0700 (PDT)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     linux-pm@vger.kernel.org
Cc:     saravanak@google.com, mdtipton@codeaurora.org,
        okukatla@codeaurora.org, bjorn.andersson@linaro.org,
        vincent.guittot@linaro.org, georgi.djakov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] interconnect: qcom: smd845: Use icc_sync_state
Date:   Thu,  9 Jul 2020 14:07:04 +0300
Message-Id: <20200709110705.30359-4-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200709110705.30359-1-georgi.djakov@linaro.org>
References: <20200709110705.30359-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Lowering the bandwidth on the bus might have negative consequences if
it's done before all consumers had a chance to cast their vote. Let's
return the maximum amount of bandwidth as initial value. This bandwidth
level would be maintained until all consumers have probed.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/interconnect/qcom/sdm845.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/interconnect/qcom/sdm845.c b/drivers/interconnect/qcom/sdm845.c
index f6c7b969520d..bfea6a5321b0 100644
--- a/drivers/interconnect/qcom/sdm845.c
+++ b/drivers/interconnect/qcom/sdm845.c
@@ -437,6 +437,13 @@ static const struct qcom_icc_desc sdm845_system_noc = {
 	.num_bcms = ARRAY_SIZE(system_noc_bcms),
 };
 
+static int qcom_get_bw(struct icc_node *node, u32 *bw)
+{
+	*bw = INT_MAX;
+
+	return 0;
+}
+
 static int qnoc_probe(struct platform_device *pdev)
 {
 	const struct qcom_icc_desc *desc;
@@ -469,6 +476,7 @@ static int qnoc_probe(struct platform_device *pdev)
 	provider->set = qcom_icc_set;
 	provider->pre_aggregate = qcom_icc_pre_aggregate;
 	provider->aggregate = qcom_icc_aggregate;
+	provider->get_bw = qcom_get_bw;
 	provider->xlate = of_icc_xlate_onecell;
 	INIT_LIST_HEAD(&provider->nodes);
 	provider->data = data;
@@ -559,6 +567,7 @@ static struct platform_driver qnoc_driver = {
 	.driver = {
 		.name = "qnoc-sdm845",
 		.of_match_table = qnoc_of_match,
+		.sync_state = icc_sync_state,
 	},
 };
 module_platform_driver(qnoc_driver);
