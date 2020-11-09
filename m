Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52FBF2AB884
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 13:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729499AbgKIMpM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 07:45:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729045AbgKIMpL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 07:45:11 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B92AC0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2020 04:45:11 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id l1so4133512wrb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2020 04:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I5og6iQL2F2KU/9VCiyIO/1t7oyXeSMRtxWJsg/eg+g=;
        b=gk6Y3BhBCWnU2IL1KQsAWPoRse7BEKzs3cZVZMKCdpCN2TibgOHbiInvSTtrJh0dz0
         QV+ae6jXdwNLSdZl0/pVilO9Hu1wAJLED+q/pEDus6UEFLxCiMQepflmsXsgo5XRhyi4
         KNcDee4/GEagpFrxVO+3pSxcRFlDdfDRy1PGyY6YRx81kz+FrNDPsBjzm/EsQCSvbEnV
         LfX/ObUmMf4K8gsgQ4J8y2L6/kkmxlsPWeDKtZT8MMetegulDNNS/0lBhdDjmKHmUNDO
         ARxYYsFvBZ/8gdyIDHH/RmX58uyQ3gX5rOkbhR4eLovvIdZBYLBc1cdbzFyuwypS15yY
         n/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I5og6iQL2F2KU/9VCiyIO/1t7oyXeSMRtxWJsg/eg+g=;
        b=Nd+Gfv4NcTrfpFFVPzq/eBSzpSBqyp4WaYvj2oJLegRPJFmDqR/LB/1yNJ7g5lR3fR
         D55cl0b7F6frqzEb9Fqv6byCOq8cP2KGjWGs38Ut752xnfFATAy768pcC+6DI+s1MCkc
         VOGdxC0rEVx92BOeSvzfrNLyaH/JhsqL0urEwzGdYaA58+VFDuvgMXZq/7a9NymXjHtp
         AkM9q8fVAp5WdL6SrEsvyPsBuyRXY3kP9nyOKK27Djsr5H4FDL8AcE5tVgfCBC1sszBC
         5mtCWeeJJ25hjeNT/6ACUCLKs0JSHAqxOVeUdXbhQx3mX9Req/gDAQwBwVBQcu3GHyPO
         cBhg==
X-Gm-Message-State: AOAM530gjQDyH7XpZabDRS99qqaHmv1Y8rNxeJw2hqdDuA+GVH9Twit1
        dD5VfsZL45Z0kBPAbCoc+z5JUQ==
X-Google-Smtp-Source: ABdhPJwfwHgZiyEE+orXJW69vDATKlc6ekwB3kQ5qEptBVB3A8G5yP0BiBpzzsb8ED8FvWBBbdqFCQ==
X-Received: by 2002:a5d:4084:: with SMTP id o4mr309309wrp.278.1604925910194;
        Mon, 09 Nov 2020 04:45:10 -0800 (PST)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id d2sm13113259wrq.34.2020.11.09.04.45.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2020 04:45:09 -0800 (PST)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     linux-pm@vger.kernel.org, luca@z3ntu.xyz, masneyb@onstation.org
Cc:     bjorn.andersson@linaro.org, saravanak@google.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH] interconnect: qcom: msm8974: Don't boost the NoC rate during boot
Date:   Mon,  9 Nov 2020 14:45:12 +0200
Message-Id: <20201109124512.10776-1-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It has been reported that on Fairphone 2 (msm8974-based), increasing
the clock rate for some of the NoCs during boot may lead to hangs.
Let's restore the original behavior and not touch the clock rate of
any of the NoCs to fix the regression.

Reported-by: Luca Weiss <luca@z3ntu.xyz>
Fixes: b1d681d8d324 ("interconnect: Add sync state support")
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/interconnect/qcom/msm8974.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/interconnect/qcom/msm8974.c b/drivers/interconnect/qcom/msm8974.c
index b6b639dad691..da68ce375a89 100644
--- a/drivers/interconnect/qcom/msm8974.c
+++ b/drivers/interconnect/qcom/msm8974.c
@@ -637,6 +637,14 @@ static int msm8974_icc_set(struct icc_node *src, struct icc_node *dst)
 	return 0;
 }
 
+static int msm8974_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
+{
+	*avg = 0;
+	*peak = 0;
+
+	return 0;
+}
+
 static int msm8974_icc_probe(struct platform_device *pdev)
 {
 	const struct msm8974_icc_desc *desc;
@@ -690,6 +698,7 @@ static int msm8974_icc_probe(struct platform_device *pdev)
 	provider->aggregate = icc_std_aggregate;
 	provider->xlate = of_icc_xlate_onecell;
 	provider->data = data;
+	provider->get_bw = msm8974_get_bw;
 
 	ret = icc_provider_add(provider);
 	if (ret) {
