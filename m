Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79811D89CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 23:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbgERVIf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 17:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgERVIf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 17:08:35 -0400
Received: from omr1.cc.vt.edu (omr1.cc.ipv6.vt.edu [IPv6:2607:b400:92:8300:0:c6:2117:b0e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0874AC05BD09
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 14:08:34 -0700 (PDT)
Received: from mr2.cc.vt.edu (mr2.cc.ipv6.vt.edu [IPv6:2607:b400:92:8400:0:90:e077:bf22])
        by omr1.cc.vt.edu (8.14.4/8.14.4) with ESMTP id 04IL8YKx008041
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 17:08:34 -0400
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
        by mr2.cc.vt.edu (8.14.7/8.14.7) with ESMTP id 04IL8TBc017837
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 17:08:34 -0400
Received: by mail-qt1-f197.google.com with SMTP id m9so13576200qtf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 14:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:mime-version:date
         :message-id;
        bh=kM/2TLwbOWyz4JRQ8aP48mBwa+htNbB3MxdeeuZE8tM=;
        b=CbFG0exkdlO3p7MfGRXUT570x/FPamGUY6VJWp4DOiW3Dmt/gCskEji8vAqw6vgsZ+
         JrHWmPVG+QPicHWrrwOhb3PJLB4OBcNeKWnZkRVmVCQu31Luztse/YlRL6exznoeU4Q+
         xGZfwTYQ/In12tlnrDD6EwMuPPZD8JtU5sLa2r/KWMHvcciAi2VSEcwXPUZYXWqbcvd5
         zww9zioVqFMih4Ke8ov7mjINUkGVjmH9AKWSNJDU3ugAe5TRULlLZuBDOy5ocg8/mEsK
         JJCygFvgYvJCU/khalh9QARjJmcRxS7OKBUYAYda/pdL1JrcOACSRuOCwZrtFubWX+FM
         0QsA==
X-Gm-Message-State: AOAM533pDyaFHlc6Hh+bEOtYOmUB0ge+MFWvGseJFntGb/CL5rOt4H0+
        w5sPLioEDab6v2eCmb5g8f0jlP1wyz2tJyPX2PS7tovF8QqkYAaOJ9qOa5eTiJe1oM5kY8wnNxK
        ZEmP5oEzi6xPIjJEIPxZzJuyUpv19ztGHu3i7
X-Received: by 2002:a05:620a:1e:: with SMTP id j30mr18210101qki.470.1589836108959;
        Mon, 18 May 2020 14:08:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXD+xC5+XKAl2RVDYaqJrxN/4ysReFfKpWWyp/+kjyPqs4ASEt78jxmru36a7x0DnMQdTyWg==
X-Received: by 2002:a05:620a:1e:: with SMTP id j30mr18210074qki.470.1589836108615;
        Mon, 18 May 2020 14:08:28 -0700 (PDT)
Received: from turing-police ([2601:5c0:c001:c9e1::359])
        by smtp.gmail.com with ESMTPSA id o3sm10085708qtt.56.2020.05.18.14.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 14:08:27 -0700 (PDT)
From:   "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: wcss: Fix function call for new API
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date:   Mon, 18 May 2020 17:08:26 -0400
Message-ID: <77652.1589836106@turing-police>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

commit 8a226e2c71: remoteproc: wcss: add support for rpmsg communication

throws a compile error:

   CC [M]  drivers/remoteproc/qcom_q6v5_wcss.o
drivers/remoteproc/qcom_q6v5_wcss.c: In function 'q6v5_wcss_probe':
drivers/remoteproc/qcom_q6v5_wcss.c:563:2: error: too few arguments to function 'qcom_add_glink_subdev'
  qcom_add_glink_subdev(rproc, &wcss->glink_subdev);
  ^~~~~~~~~~~~~~~~~~~~~
In file included from drivers/remoteproc/qcom_q6v5_wcss.c:16:
drivers/remoteproc/qcom_common.h:35:6: note: declared here
 void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink,
      ^~~~~~~~~~~~~~~~~~~~~

Update to API change from commit  cd9fc8f:  remoteproc: qcom: Pass ssr_name to glink subdevice

Signed-off-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 48d16d81f94d..99ecc0e6276e 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -560,7 +560,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	qcom_add_glink_subdev(rproc, &wcss->glink_subdev);
+	qcom_add_glink_subdev(rproc, &wcss->glink_subdev,"q6wcss");
 	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, "q6wcss");
 
 	ret = rproc_add(rproc);

