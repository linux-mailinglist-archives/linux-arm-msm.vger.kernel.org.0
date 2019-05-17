Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 311B921F5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2019 23:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729531AbfEQVJ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 May 2019 17:09:29 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35201 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729521AbfEQVJ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 May 2019 17:09:28 -0400
Received: by mail-pl1-f195.google.com with SMTP id g5so3886790plt.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 May 2019 14:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6yMhbjOdJrtk0xQ+i6AZwRL1Zy3R9rye9qItwhZgYoY=;
        b=S1pCUHGutY6vLzoeCG8u5Yqz3ySgTf/kdPKzMam30sIRpcZRxsjF+zlAGx/fIrTFIp
         c1UKcK4gDiWA9vZQFvW6iGNpJB4zv13dQ3EW4iO5pTUV0W8VgSG3ubSdD6/d6/DzUQ31
         EpISSdtYpdScNDbFpu1KySJGBw2Fj5UhNbs1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6yMhbjOdJrtk0xQ+i6AZwRL1Zy3R9rye9qItwhZgYoY=;
        b=bwSUntU/67zbMI19qXWnjYcykV6MJ17+rlnlMCoPPsVsq3IIkM6TFJDf/+Dnce4AoA
         GJVVCUYD48uw/ujuWM8i0Cq8wAg2Z5TWv607pJSZxlCFNWhw6j5Rjkw4ETVC5UMpsKEc
         L6i8JSP32jPObk6oMaXShG3fLZ/CiNa+JiHPxolQqmIKRAtgtR6ZXd9vfoz4nGiDv6fP
         2xYeC0zrZkfJ9e6S6nLY6ub6cTGApUvittkvytqpham6UYiu6F7dkvtu2BV+stABXH8Q
         ykeI44H8F0zAzaKIfX7eH9mjNzEdsbZzxdrui3R8Syw2hDI9alcN0EPrNyRdbwqH0MZ6
         yo+A==
X-Gm-Message-State: APjAAAUrO3EW0DCmHX53zXWPPkMEQa3PqZmWZuxwYEle41p9p00LBv4M
        00yaJY5bWGtRvh4AyHABbaW04A==
X-Google-Smtp-Source: APXvYqxwpbLICdYAwGQqNce4bs0ykKfJr2vw7HkbP2gvufSFs/2dDJFK4zwTSIAgWKa7ah5VPW4rIg==
X-Received: by 2002:a17:902:201:: with SMTP id 1mr14372173plc.263.1558127367509;
        Fri, 17 May 2019 14:09:27 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id q142sm7890448pfc.27.2019.05.17.14.09.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 14:09:27 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Ian Jackson <ian.jackson@citrix.com>,
        Julien Grall <julien.grall@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH 3/3] firmware: qcom_scm: Fix some typos in docs and printks
Date:   Fri, 17 May 2019 14:09:23 -0700
Message-Id: <20190517210923.202131-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <23774.56553.445601.436491@mariner.uk.xensource.com>
References: <23774.56553.445601.436491@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some words are misspelled and we put a full stop after a return value
integer. Fix these things up so it doesn't look so odd.

Cc: Ian Jackson <ian.jackson@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/firmware/qcom_scm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 153f13f72bac..e300cc272847 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -435,11 +435,11 @@ EXPORT_SYMBOL(qcom_scm_set_remote_state);
  * @mem_sz:   size of the region.
  * @srcvm:    vmid for current set of owners, each set bit in
  *            flag indicate a unique owner
- * @newvm:    array having new owners and corrsponding permission
+ * @newvm:    array having new owners and corresponding permission
  *            flags
  * @dest_cnt: number of owners in next set.
  *
- * Return negative errno on failure, 0 on success, with @srcvm updated.
+ * Return negative errno on failure or 0 on success with @srcvm updated.
  */
 int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 			unsigned int *srcvm,
@@ -502,7 +502,7 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 	dma_free_coherent(__scm->dev, ptr_sz, ptr, ptr_dma);
 	if (ret) {
 		dev_err(__scm->dev,
-			"Assign memory protection call failed %d.\n", ret);
+			"Assign memory protection call failed %d\n", ret);
 		return -EINVAL;
 	}
 
-- 
Sent by a computer through tubes

