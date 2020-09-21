Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC55271C25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 09:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgIUHhX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 03:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgIUHhT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 03:37:19 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F056DC061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 00:37:18 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id x14so11565083wrl.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 00:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NROX0bNqDI7FiJUF4YVflXDepbR7cwfa195+TAp7FqI=;
        b=sUQGXw3W8ui6W7UW369yPnoa8QnsVfzpFzRk+yz8aIrOp3Tmms9uqhuYD7DfokVb/L
         osUVCqbl+aTyxWJWIEOs5Y0vwjvEbawxdlFktY7qVaTnsz3d+ZxxEecwnNkbf4j31sOw
         AHY7pQyCucaxwt9rPcnG12nT/LfdqDV6Rzn4NAMZZxlkLispA+gqm333Ej79LNMAG8RV
         6YAYWKk5tbRWGqhS1c+uyfGn72Iq3++pzCRNSDwb46pkKw4aCyPIMHu6NypP7o+Cllh2
         F96YHK98ncy3AZ/fOMaUBP8OGausbuY5jiAJ3Y/jWeMxfaHuYGmWpGZSvqmni6807C8M
         U0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NROX0bNqDI7FiJUF4YVflXDepbR7cwfa195+TAp7FqI=;
        b=QOloGY/iouskQUtN7m5FlqRBjm+uoMqdVnnCglBG/Ryw6WXZ12+k7LudlPKcfXO5Ik
         E81XZuA3hSRibuzeBm+T+tYgtUezb/dViJBrkLfr2zeEsQgC+GD3dFW6c7xhtTV0tftw
         suDVhc9deK2b8UTH4QFUKP2FdevBbbjeb2ZWIKNTuQ+1rsb9LEGjgps5hTBp815UPOsr
         M8mR1EOIBTER80fU29vkE6JaDbeiN81kSWIZPYNjO6HpF5Woi1lWMt31aWp43Ls4VbHl
         XJJvlO3h+S1HTebsCnuKKD07wBd5AWdBWUbVqOCJoP9o0zVljxExHfYiEoIEzeDKXy4G
         nnTQ==
X-Gm-Message-State: AOAM532W3kotqo/1z0c9NH2vAbAuPiDfCXaYrSW6P7V68rFBwEOK687Q
        jL6QkEmkYZJfemr0mFbAbYboKA==
X-Google-Smtp-Source: ABdhPJyUkazSF0v/Gm+h2UP/98/PEaQBIlc5UJ6gJvjQmbcaVK8BZGumzpDTykPTQpPOH3TP4MyNoQ==
X-Received: by 2002:adf:ee8d:: with SMTP id b13mr55137256wro.249.1600673837648;
        Mon, 21 Sep 2020 00:37:17 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:490:8730:5875:9da3:b857:e7f4])
        by smtp.gmail.com with ESMTPSA id v9sm19976761wrv.35.2020.09.21.00.37.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 00:37:17 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        davem@davemloft.net
Cc:     netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 2/2] net: qrtr: Start MHI channels during init
Date:   Mon, 21 Sep 2020 09:43:04 +0200
Message-Id: <1600674184-3537-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600674184-3537-1-git-send-email-loic.poulain@linaro.org>
References: <1600674184-3537-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Start MHI device channels so that transfers can be performed.
The MHI stack does not auto-start channels anymore.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: split MHI and qrtr changes in dedicated commits

 net/qrtr/mhi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index ff0c414..7100f0b 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -76,6 +76,11 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	struct qrtr_mhi_dev *qdev;
 	int rc;
 
+	/* start channels */
+	rc = mhi_prepare_for_transfer(mhi_dev);
+	if (rc)
+		return rc;
+
 	qdev = devm_kzalloc(&mhi_dev->dev, sizeof(*qdev), GFP_KERNEL);
 	if (!qdev)
 		return -ENOMEM;
-- 
2.7.4

