Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A8E27A649
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 06:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbgI1EMA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 00:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgI1EL7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 00:11:59 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01535C0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:11:59 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id b124so8124158pfg.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2a29PGE7XTP2XdT1J2AnCKNgX28qIiZ+/+2Zu4a2uQE=;
        b=qOFxpfltv2nyxZI+cjYjiLOGvx57COZ5pGaozBuNzonXJA58pxLLqsZ0RISOH2s5GS
         GaK5dMQxciCryHZXnuyu6M5zTnJGCU6uagObzP/Vk1zvF1CLZ60xRiZFIO+0WJYMEq/l
         rNuVRex2pXu3fwdW8+7Ugk35Sn/KUcqbIpm68TzvPk7lprRfvw+tUHVrAZfAkAwOmtqM
         JtQ5PpCx2AtsA55yZ/AfdV/jCFxaEFcMbma2KO6of2DQ6Xz8MU3rsJWbrgPjLBgXGYos
         tl+0dODN6Wjb64XYq4e0yMD2hXJMHoCJ+E5Ls5UAE9ibM3apHT3S2W9deQxFpNzSrrUA
         HZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2a29PGE7XTP2XdT1J2AnCKNgX28qIiZ+/+2Zu4a2uQE=;
        b=iemC3l27tSwhz0QcnB4qMusRfZlvq1p7QiO1ecbZzi8YS5C2QOs6A8Zi+XPslXa1l3
         KgW3gZsfgngcoATXHcuSDlSQ29Ob2/QzgMJz3M3zW+E6vlyBlwcDPU07spFE5ZoUFngQ
         Le1dRNF8YFI399m4ylm4crsOMVxRUozS6NSbNYY64z4eW7AWyFOtHi1qX46yu5QZPlVZ
         /baUuWhF9vvdN1+rdfx5zVDm1iQcJ3Fi6DC2kBeOW4BGCpLqKcqw3r2d1K0TmPRyE8IH
         Jyi5KNRce1FsZzB0gfZxBN/NfZD8SmAsdw7QGZYLex1ZI0/ScA6lRTMjW5ReLlyUCgjV
         0Jug==
X-Gm-Message-State: AOAM533qxS5nPV6UV3ti0u5nRHwX4Zk6+qeYlH0Rh/7OvMIryRFgk7ot
        xoVOUj+doODwRtZELd2xdEG8
X-Google-Smtp-Source: ABdhPJylsw/GoIc/xNcMYtcp/205txCMbyEfgrjl5QkueXjuBpXxnUvZGQKXcR/6JdZU93fsfPUojg==
X-Received: by 2002:a17:902:be09:b029:d2:83ee:dc2b with SMTP id r9-20020a170902be09b02900d283eedc2bmr5971464pls.20.1601266318524;
        Sun, 27 Sep 2020 21:11:58 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6003:40df:7c40:5a87:eb86:87b0])
        by smtp.gmail.com with ESMTPSA id n21sm8306322pgl.7.2020.09.27.21.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 21:11:57 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 21/21] net: qrtr: Start MHI channels during init
Date:   Mon, 28 Sep 2020 09:39:51 +0530
Message-Id: <20200928040951.18207-22-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
References: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Loic Poulain <loic.poulain@linaro.org>

Start MHI device channels so that transfers can be performed.
The MHI stack does not auto-start channels anymore.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Acked-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 net/qrtr/mhi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index ff0c41467fc1..7100f0bac4c6 100644
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
2.17.1

