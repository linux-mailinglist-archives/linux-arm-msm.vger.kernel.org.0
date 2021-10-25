Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4024443A849
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 01:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235258AbhJYXlL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 19:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235094AbhJYXlK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 19:41:10 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D59BC061767
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 16:38:47 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id o133so12429642pfg.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 16:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5MjhOsT6vsgE3PRSqOL/b2QlSnU9cwQAuPv26ujxKj8=;
        b=eYsJQ29kvLlHJ1I8kvPlWWSSKos/TDJWWWWBpksa5ij/buKU9ESOTC5u7sXTZWXcE5
         eYRcZ/gvWStncpEOEy5XQQaBBRTUa09oqxtE7yKWvj7pSXrxm0iIkbbvIV0czZIB9Qlf
         RjQ8OlGDSrwX9GvjtR9HgzBzTf3r2dTRQVwwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5MjhOsT6vsgE3PRSqOL/b2QlSnU9cwQAuPv26ujxKj8=;
        b=FuOBb0zo3f9M+nRYHzFP8muJ3tvqxIXAHvJ2poxE59CxToQt4u/4t+MWGiOotBylif
         LvkC0hVn3w9bw32pg+4Xi+7CCP4rfKu3lBERxc9YAc1+5wIZC2jOa6wcVENv8QPxvf6p
         P6BEcDByIGKVHh1EKzCEDrFnuQADSNyzhDZfAIbk38Pj7iqfd+1cJynP339i9018JWl/
         lZsA1Wk7E07jtww0SRJ4lAzfBu+nMIP8p+wwE8lwLPyntqW4lCGzhTxwYZ6DdOVI7I0M
         48heKVbm+CFBjdox0ZnM0eq3Bmc4dScunewCtVgy9wTv1ti1/nCD2mPNmqDfReh/b0nB
         wujg==
X-Gm-Message-State: AOAM532YvzzU9KKx+huIN72PvvT0uBoUPlIjF5u0gji82EyKNKRnIyBA
        XHnKO6hqDIC7lXzAYSwG9yu+tHScMnpCqw==
X-Google-Smtp-Source: ABdhPJzN8Fq3J0xzMexQJ4RXwIe9fK/rt+cBpLPXI7+R0DFMn0pF/dJIPe8SbAI8ihRt06x5Usti8A==
X-Received: by 2002:a05:6a00:22d1:b0:47b:e629:3f39 with SMTP id f17-20020a056a0022d100b0047be6293f39mr12333728pfj.80.1635205126753;
        Mon, 25 Oct 2021 16:38:46 -0700 (PDT)
Received: from sujitka-glaptop.hsd1.ca.comcast.net ([2601:646:8e00:b2f0:eac2:13a5:2214:747b])
        by smtp.gmail.com with ESMTPSA id gn1sm5954453pjb.34.2021.10.25.16.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 16:38:46 -0700 (PDT)
From:   Sujit Kautkar <sujitka@chromium.org>
To:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 1/2] rpmsg: glink: Fix use-after-free in qcom_glink_rpdev_release()
Date:   Mon, 25 Oct 2021 16:37:52 -0700
Message-Id: <20211025163739.v2.1.Id19324ea36b4cf89faf98bf520bc6b6f01240433@changeid>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211025233751.1777479-1-sujitka@chromium.org>
References: <20211025233751.1777479-1-sujitka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom_glink_rpdev_release() sets channel->rpdev to NULL. However, with
debug enabled kernel, qcom_glink_rpdev_release() gets delayed due to
delayed kobject release and channel gets released by that time and
triggers below kernel warning. To avoid this use-after-free, add a
condition to checks if channel was already released.

| BUG: KASAN: use-after-free in qcom_glink_rpdev_release+0x54/0x70
| Write of size 8 at addr ffffffaba438e8d0 by task kworker/6:1/54
|
| CPU: 6 PID: 54 Comm: kworker/6:1 Not tainted 5.4.109-lockdep #16
| Hardware name: Google Lazor (rev3+) with KB Backlight (DT)
| Workqueue: events kobject_delayed_cleanup
| Call trace:
|  dump_backtrace+0x0/0x284
|  show_stack+0x20/0x2c
|  dump_stack+0xd4/0x170
|  print_address_description+0x3c/0x4a8
|  __kasan_report+0x144/0x168
|  kasan_report+0x10/0x18
|  __asan_report_store8_noabort+0x1c/0x24
|  qcom_glink_rpdev_release+0x54/0x70
|  device_release+0x68/0x14c
|  kobject_delayed_cleanup+0x158/0x2cc
|  process_one_work+0x7cc/0x10a4
|  worker_thread+0x80c/0xcec
|  kthread+0x2a8/0x314
|  ret_from_fork+0x10/0x18

Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
---

(no changes since v1)

 drivers/rpmsg/qcom_glink_native.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index e1444fefdd1c0..cc3556a9385a9 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -270,6 +270,7 @@ static void qcom_glink_channel_release(struct kref *ref)
 	spin_unlock_irqrestore(&channel->intent_lock, flags);
 
 	kfree(channel->name);
+	channel = NULL;
 	kfree(channel);
 }
 
@@ -1372,8 +1373,10 @@ static void qcom_glink_rpdev_release(struct device *dev)
 {
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
 	struct glink_channel *channel = to_glink_channel(rpdev->ept);
+	if (channel) {
+		channel->rpdev = NULL;
+	}
 
-	channel->rpdev = NULL;
 	kfree(rpdev);
 }
 
-- 
2.31.0

