Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7048D10C985
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2019 14:34:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfK1Nem (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Nov 2019 08:34:42 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46527 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbfK1Nel (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Nov 2019 08:34:41 -0500
Received: by mail-wr1-f67.google.com with SMTP id z7so27697571wrl.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2019 05:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wLwJHHdjApYdyG7yY2KSph4X2YQrPHDGykhy5Aqw6Z8=;
        b=bgiHFLu8ynS/16sAB+4eIkko3HK+fGyqlncWTZc32UQ3iNjt9ShZ33eLJw7yXNNcKD
         TP/EEVAS7wVeSxY7oq7Meo018sBlL8S2fZeeYAWV3DKJyKv3NRy2FuNhiVRWZzcCRLvc
         JGO/2Q/HKe+CzWp3aLxT0cCMniXHlFRYDKWJ0OeSkcsFjRS5I2O1KtkajNoGmH9qm3R1
         TR931WJLk9Ffv6qBwjrGYglz21HBVz3C1x74xCDBGNDVil+KsiyOOdDdCSg9rCmnp4um
         SSIJ/jLdInNc1uuA+D78/rjHZkWEl3AlBo48mWHRIpxj/bYkW7V1SQuhmhBLoT0pN70M
         WLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wLwJHHdjApYdyG7yY2KSph4X2YQrPHDGykhy5Aqw6Z8=;
        b=kILcqhS5prPmJ3kZ/mhLNa0xDTGUxeQQ/I0PFfVim8YdS44w0Od3WOlauAKB6wI4kV
         I/8/tLj739rezXJBsMAKncUtWT4k2MeqWM1PjNEE/OWAt8w8CM5gm8OnadW/XimuB+Z2
         gVfd9tYFVYsog3GY/Rru2c6m7pGMcNQL3zP4MT+G5eV3J3JHlLmyOZf6acE5GadGW36W
         1ST+gkzuFSS28PTzJ/vP5qqn19HWZ2p8X8+uDaOR8GTdZoNDlmYVdyEMHVCOFx3ifvNY
         uT5Zjg+SH+R5mDxe+PRrArv0tS/bUnp66cNvsdN18N5POyJLaCdoTzPpIx3RQB+v3lC3
         iwHQ==
X-Gm-Message-State: APjAAAWIWfZuZjbTYQE/5gXLWVpWUqAaCqHVhBkcUYnjTa4ROPP9ZrJF
        uI5b+gOsa4A8ydT0metTAQbbEw==
X-Google-Smtp-Source: APXvYqxcKq0U6gGtpcy9xqY7Tw6Tx53nu1boMNRPw2zCymn44RKNCySHUEyNHfBn7+z+FSz6BUXB2Q==
X-Received: by 2002:a5d:6181:: with SMTP id j1mr46853978wru.251.1574948078252;
        Thu, 28 Nov 2019 05:34:38 -0800 (PST)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id y20sm2220451wmi.25.2019.11.28.05.34.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 28 Nov 2019 05:34:37 -0800 (PST)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     linux-pm@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, digetx@gmail.com,
        evgreen@chromium.org, daidavid1@codeaurora.org,
        masneyb@onstation.org, sibis@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        georgi.djakov@linaro.org
Subject: [PATCH 2/5] interconnect: qcom: qcs404: Walk the list safely on node removal
Date:   Thu, 28 Nov 2019 15:34:32 +0200
Message-Id: <20191128133435.25667-2-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191128133435.25667-1-georgi.djakov@linaro.org>
References: <20191128133435.25667-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As we will remove items off the list using list_del(), we need to use the
safe version of list_for_each_entry().

Fixes: 5e4e6c4d3ae0 ("interconnect: qcom: Add QCS404 interconnect provider driver")
Reported-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/interconnect/qcom/qcs404.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/qcs404.c b/drivers/interconnect/qcom/qcs404.c
index b4966d8f3348..d2b455021416 100644
--- a/drivers/interconnect/qcom/qcs404.c
+++ b/drivers/interconnect/qcom/qcs404.c
@@ -494,7 +494,7 @@ static int qnoc_probe(struct platform_device *pdev)
 
 	return 0;
 err:
-	list_for_each_entry(node, &provider->nodes, node_list) {
+	list_for_each_entry_safe(node, &provider->nodes, node_list) {
 		icc_node_del(node);
 		icc_node_destroy(node->id);
 	}
@@ -510,7 +510,7 @@ static int qnoc_remove(struct platform_device *pdev)
 	struct icc_provider *provider = &qp->provider;
 	struct icc_node *n;
 
-	list_for_each_entry(n, &provider->nodes, node_list) {
+	list_for_each_entry_safe(n, &provider->nodes, node_list) {
 		icc_node_del(n);
 		icc_node_destroy(n->id);
 	}
