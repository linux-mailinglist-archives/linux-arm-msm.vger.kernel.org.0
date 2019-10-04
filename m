Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9F8CC5E6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 00:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388855AbfJDW1l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 18:27:41 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44479 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388186AbfJDW1O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 18:27:14 -0400
Received: by mail-pf1-f193.google.com with SMTP id q21so4707910pfn.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2019 15:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tgp/FeB2xBiOrdWqd66mmTH1EYf2q2e7GgKZ4PEeOIY=;
        b=FHrs101ssw/11oKSgeFbq+imwHggSoDWpMnD0XoJoGXLDG/DMQVKPS1SAt/7Dlb+jH
         JR4tbGd6OB7SxAvznNvOb94ShM/oM0QF5d8qI5f2T/sYyJsjAE4B4XDsXOPQ6sonOp9D
         U9zOwol2bbZakyvNAhVndhWwvqwwSPukMSDkCYis8Q3vdYKsMCjl/1pH8gI6VAzTyu5o
         NNMJaAGpMm1l5ySndZHzAySTeHWF+t2r2lzOfNybRl5Nm/Ltnl3oDjYSpMtPf5tfDbdP
         sT/kZkxgMZjvR1ShM9y5mC3EjNH5OJ8AZWS7D0ypKcEWw8VsvrIr3K2Snxpyyh2Crwn7
         GQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tgp/FeB2xBiOrdWqd66mmTH1EYf2q2e7GgKZ4PEeOIY=;
        b=XJhPfPlQ9kByVE6kTPGMMklZwW2iw4WAiUB1nonfFa7wPv7llab9rSBBF0KDDNAHnY
         LdS30ZbjcBezIqK4lBq6lnMyHmtuQvMx73p5Syri/c01aLxAJCtFjizC0XIf809xPPVr
         NaiGVPrHzXXSvzJSIhoJCLH0Md5cLucVyw6he3ZRohmL4UXM02l+Lr35PkU8sKeGSeno
         /0lABYKdGinsIQADmtyxssliLBR4h2EYnH9TOYvnTCz0m7UzGPDYGVV2FcsUf+EuZ3q6
         CiTqkNOnkBUBg8I0I3NLt/PVUlWDcX7k16iS0qsn/858WTUHYXdqMioYgWevmIue9NAb
         cZkg==
X-Gm-Message-State: APjAAAXE3fFERNm5K1nMvll/BkZxFjMZR3MCPw9KQx//dLUuqbWOelQQ
        i31iEiN6FwuA62uxIEe2vqJQ1w==
X-Google-Smtp-Source: APXvYqyl4USr2pI1tvW9hNGMGl74FlDuzskNacHLv+8mdd57yjumXhsLj97i5VBCiJe7su2dKbiBeg==
X-Received: by 2002:aa7:9210:: with SMTP id 16mr19733167pfo.19.1570228032393;
        Fri, 04 Oct 2019 15:27:12 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x37sm6328136pgl.18.2019.10.04.15.27.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 15:27:11 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v2 3/6] rpmsg: glink: Put an extra reference during cleanup
Date:   Fri,  4 Oct 2019 15:26:59 -0700
Message-Id: <20191004222702.8632-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191004222702.8632-1-bjorn.andersson@linaro.org>
References: <20191004222702.8632-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Chris Lew <clew@codeaurora.org>

In a remote processor crash scenario, there is no guarantee the remote
processor sent close requests before it went into a bad state. Remove
the reference that is normally handled by the close command in the
so channel resources can be released.

Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")
Cc: stable@vger.kernel.org
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Chris Lew <clew@codeaurora.org>
Reported-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 drivers/rpmsg/qcom_glink_native.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 72ed671f5dcd..21fd2ae5f7f1 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1641,6 +1641,10 @@ void qcom_glink_native_remove(struct qcom_glink *glink)
 	idr_for_each_entry(&glink->lcids, channel, cid)
 		kref_put(&channel->refcount, qcom_glink_channel_release);
 
+	/* Release any defunct local channels, waiting for close-req */
+	idr_for_each_entry(&glink->rcids, channel, cid)
+		kref_put(&channel->refcount, qcom_glink_channel_release);
+
 	idr_destroy(&glink->lcids);
 	idr_destroy(&glink->rcids);
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
-- 
2.18.0

