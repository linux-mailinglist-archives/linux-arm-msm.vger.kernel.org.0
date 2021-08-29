Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A1F3FAB78
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 14:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235312AbhH2Mq0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 08:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235271AbhH2MqY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 08:46:24 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CBFAC061756
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 05:45:32 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id s10so314793lfr.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 05:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6mw0MT3om93i5T+rGS/7Y5NL2nNyWToax69yy3f04aM=;
        b=bbJRPC4WvwENh4cdNzVpQ3+lWBYIkqVdfB+jrIzMw7BKMIsjcLPYwjNYUveBUL1Vjn
         w5aoml1VEB3Lz3WtbGW0LdDR0Wqf8eS+a2e4SJiLQENm3acEwboKO71O74bx6EtGam4e
         5sUC6X0Z11zdlzIiIA5Km7KF2YsuL6lWvMMB5kKrDdOPKb02coqn0AqvL9/Z8mFph/mh
         MWJz9uV6A233n4UMZLvFIKUJGmHYO2WKy+vZXy12oOHvQTNnbCzy+Ja1m3OafH6KCJnY
         s41Cs0HuhJml7W+439/cf3EYsFrycR1KWEelkh4YaCSNrr8i5IoR+RmVbddGjcNekYHl
         BUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6mw0MT3om93i5T+rGS/7Y5NL2nNyWToax69yy3f04aM=;
        b=tmemLAGuOfopRh34eLn9zuh/hC+P1PWRkeOS2GTHEvI/aVxGMR+G0TUO9uPDB0OEyn
         EDnOwgSlYUnz34ggSUBe5VZ1ztvQ3uvUgGYJAU68fVLmCPuXOVr78iNwkuYTCS7mAfEJ
         l52JTE8xwf0hscPGPA2eXv4Mk+d3iJtae9lYDgcFTIRXlQeWYUJ0SXdDIh6cIHQb88Jj
         jHmyYUEyW+MpDqC+mkRfEV8e35AdaS2nFjzknfT+e8Se5Xrus1nkaIofvF5d6qxXE7mP
         XTjPgVJUdtqoSbQ5w4XzaKT2lKIX2koumDJ8nqK1oDM1f/hBH+5urxS7fYHjTwyjRI54
         85KQ==
X-Gm-Message-State: AOAM531wONxfYinnrfWCUmRK4CUx7cgu4F/h20eH9C9egIamcwsjl9CA
        CTobbTI+u9EAKgR970fJDu6qZg==
X-Google-Smtp-Source: ABdhPJwvZt+qSrAe/ddF7Uokkg8l4wE7+stitGJl43IJ0+g9jRh6Q+poAK9+8+LdfFclvgltR1Qhmg==
X-Received: by 2002:a05:6512:3339:: with SMTP id l25mr13968860lfe.496.1630241130940;
        Sun, 29 Aug 2021 05:45:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g20sm522746lfh.159.2021.08.29.05.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 05:45:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH] net: qrtr: mhi: make it work again
Date:   Sun, 29 Aug 2021 15:45:28 +0300
Message-Id: <20210829124528.507457-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The commit ce78ffa3ef16 ("net: really fix the build...") introduced two
issues into the mhi.c driver:
 - use of initialized completion
 - calling mhi_prepare_for_transfer twice

While the first one is pretty obvious, the second one makes all devices
using mhi.c to return -EINVAL during probe. Fist
mhi_prepare_for_transfer() would change both channels state to ENABLED.
Then when second mhi_prepare_for_transfer() would be called it would
also try switching them to ENABLED again, which is forbidden by the
state machine in the mhi_update_channel_state() function (see
drivers/bus/mhi/core/main.c).
These two issues make all drivers using qcom_mhi_qrtr (e.g. ath11k) to
fail with -EINVAL.

Fix them by removing first mhi_prepare_for_transfer() call and by adding
the init_completion() call.

Fixes: ce78ffa3ef16 ("net: really fix the build...")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 net/qrtr/mhi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 1dc955ca57d3..f3f4a5fdeaf3 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -83,15 +83,12 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	struct qrtr_mhi_dev *qdev;
 	int rc;
 
-	/* start channels */
-	rc = mhi_prepare_for_transfer(mhi_dev, 0);
-	if (rc)
-		return rc;
-
 	qdev = devm_kzalloc(&mhi_dev->dev, sizeof(*qdev), GFP_KERNEL);
 	if (!qdev)
 		return -ENOMEM;
 
+	init_completion(&qdev->ready);
+
 	qdev->mhi_dev = mhi_dev;
 	qdev->dev = &mhi_dev->dev;
 	qdev->ep.xmit = qcom_mhi_qrtr_send;
-- 
2.33.0

