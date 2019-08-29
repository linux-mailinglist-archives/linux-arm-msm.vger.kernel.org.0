Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B06BFA2622
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 20:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728102AbfH2Sga (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 14:36:30 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42805 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727729AbfH2Sga (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 14:36:30 -0400
Received: by mail-pg1-f196.google.com with SMTP id p3so2026437pgb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 11:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=KbKypMZEMo628Sx98GbFT2Lyxp3a3o8vbOSGro2hqs8=;
        b=t3zQUyJMxStChnSzVBHngExmp8QsLonx59qyC0ffBqgubbjGeOyOFMOsHJf8uf6HkB
         CojAknqMdbyB8D+o/RuZItXS57kNsGGjly1qq2ZpZ9joOvjLQ5RVfWeJcCMLtQBpw/zH
         eepAT69hr+gc0hwxvBjbl90PN9iyk0QDzHp5MV7YLfKc5W0wOQ7zGHWbDhWf+GrfcdTh
         wPK7Sxg25ZX5mWRup3BIgWX38rdvTV+rGjVQfpKopTCfmhGLIoh5TTogX8eiT9lPG+F4
         t34bu1vWoK9BI1Ryd083tz1DsL+ZG6939oGqr1RuXw/GymWIu89dLRkNTx/6QIyGSRjj
         NN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KbKypMZEMo628Sx98GbFT2Lyxp3a3o8vbOSGro2hqs8=;
        b=lvNZQwbh1jF3qUMY+QS4VTHCby9z2lMVJQJrzgqVORu8LcomjN/t6uY+0w22DGsvF1
         4MsercMXdgnPWvnG4bEwtMnasvGoA1chdi0CffBXDiYtaq9IlxSwFRd/JbD8Fw5se8Jk
         cSTc/OdytiSzU6dygmtUT1bykEV37mQSOg0Z3E+rLDj2r6P+GZ3wF6Popqzfpy0No43f
         eg27CRalLzPnc1Ur8XoShyXWrepP8Tsnk+MYhuriyfNWBsZMdtuCgAKUsrIeyR3Kb7Tb
         5NUTh0zjNgigAixntqB/F3qK/Jtikie8/8Q2QJiQ9z39KR/8nKox18Ogp1o8lGIIhFmA
         hGaw==
X-Gm-Message-State: APjAAAWCJRSTBRFrgo6yj6NZ1muNkc9Ij3R7uK4cSm0qjx5oKsSUkj9r
        eXhEtLHyY4nMJmeiFJaLYuo3fg==
X-Google-Smtp-Source: APXvYqxpv+GziRN1zBpbr421YfeGoyK+5VQeDsDe4w/JmyFKe9EoDJcwIteI02M7WGql0t//MIrfew==
X-Received: by 2002:a62:5c5:: with SMTP id 188mr13311302pff.227.1567103789574;
        Thu, 29 Aug 2019 11:36:29 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id ay7sm2840574pjb.4.2019.08.29.11.36.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 11:36:28 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] rpmsg: glink-smem: Name the edge based on parent remoteproc
Date:   Thu, 29 Aug 2019 11:36:25 -0700
Message-Id: <20190829183625.32244-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Naming the glink edge device on the parent of_node short name causes
collisions when multiple remoteproc instances with only different unit
address are described on the platform_bus in DeviceTree.

Base the edge's name on the parent remoteproc's name instead, to ensure
that it's unique.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_glink_smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 64a5ce324c7f..4238383d8685 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -201,7 +201,7 @@ struct qcom_glink *qcom_glink_smem_register(struct device *parent,
 	dev->parent = parent;
 	dev->of_node = node;
 	dev->release = qcom_glink_smem_release;
-	dev_set_name(dev, "%pOFn:%pOFn", node->parent, node);
+	dev_set_name(dev, "%s:%pOFn", dev_name(parent->parent), node);
 	ret = device_register(dev);
 	if (ret) {
 		pr_err("failed to register glink edge\n");
-- 
2.18.0

