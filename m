Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 576F4310272
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 02:54:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhBEBx2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 20:53:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229466AbhBEBxX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 20:53:23 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB22CC06178C
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 17:52:42 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id q20so3288090pfu.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 17:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tDdfcsBZJuJtkpBOSJDEI0wgJxTXViUcOD8MHou6QmE=;
        b=UNllgY9o6Zzj174wA73LqGonWn6zXEg/nLHpYeKA/TVksgv4J/R0FtpB8pALL2N5rz
         p86HW3l6UuuNeoOpsKo/5uIxRxhzrCtqcI2ez9sEncG3knq3HGOGk0n67iIp5QC2QHnc
         KzvuXymqpnAffLPotK9GOEJiPsrrQLZ/kfyrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tDdfcsBZJuJtkpBOSJDEI0wgJxTXViUcOD8MHou6QmE=;
        b=EsjEP/AyhyzrZgUyx0KNwjwkwPptdqHJNWr9eIYO1+/VX6z9xjeePfjR9hMZ425WGC
         WhWVyu7bOGTfzX8HvkiMFUfeujDULUJXuCWL8w+WOOpxEAL/3poecTOC/xZ/hLvtMnQd
         3rezXANAonI84iZLz/fJOWqySQM/mnXB7qlFl9zygPzz4DrJ1miw2A4aL9myXRvhq+sm
         s9Tb63EfgD5g1tC4IyXzV3jaq48UpZ9vRsoHU/C/xr7l/Myf+KSVPAMZU7NzIlQ/83OB
         D1mOr8JHqa7BuUCpjIoZh8m6py2MZYEFKEnphZawNAH5ttVjHepeAYRphR0Z4CI0MftW
         dQtw==
X-Gm-Message-State: AOAM533Kt3x+SDlPGOnqbhzf16UveQd7f0166lMS9IcN8FZJqAKq53ef
        o/lXiRI11kMHOQopqemwnKh3FA==
X-Google-Smtp-Source: ABdhPJwLComfvN7kPjNjD0EXVFbUIvYluUGScCCMqUv57Xn5xQlBosQGg3qC6KqznEdWp6yW4uZhfg==
X-Received: by 2002:a62:6202:0:b029:1bb:a811:da59 with SMTP id w2-20020a6262020000b02901bba811da59mr1896539pfb.27.1612489962411;
        Thu, 04 Feb 2021 17:52:42 -0800 (PST)
Received: from localhost (162-207-206-139.lightspeed.sntcca.sbcglobal.net. [162.207.206.139])
        by smtp.gmail.com with ESMTPSA id a188sm7596357pfb.108.2021.02.04.17.52.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Feb 2021 17:52:41 -0800 (PST)
From:   Benjamin Li <benl@squareup.com>
To:     Georgi Djakov <georgi.djakov@linaro.org>,
        Jun Nie <jun.nie@linaro.org>
Cc:     kernel@squareup.com, Benjamin Li <benl@squareup.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] interconnect: qcom: icc-rpm: record slave RPM id in error log
Date:   Thu,  4 Feb 2021 17:52:04 -0800
Message-Id: <20210205015205.22947-2-benl@squareup.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210205015205.22947-1-benl@squareup.com>
References: <20210205015205.22947-1-benl@squareup.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add slave RPM ID to assist with identifying incorrect RPM config.

Signed-off-by: Benjamin Li <benl@squareup.com>
---
 drivers/interconnect/qcom/icc-rpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index cc6095492cbe..54de49ca7808 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -59,8 +59,8 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
 					    qn->slv_rpm_id,
 					    sum_bw);
 		if (ret) {
-			pr_err("qcom_icc_rpm_smd_send slv error %d\n",
-			       ret);
+			pr_err("qcom_icc_rpm_smd_send slv %d error %d\n",
+			       qn->slv_rpm_id, ret);
 			return ret;
 		}
 	}
-- 
2.17.1

