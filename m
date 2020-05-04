Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD611C434A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 19:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730496AbgEDRuo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 13:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730488AbgEDRun (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 13:50:43 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0047C061A0F
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2020 10:50:41 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id hi11so221297pjb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2020 10:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=COJ4St1lQrIdf4dsEVKhZiSK4khVz5kd/fC7gBtBbkM=;
        b=Mpd4GwJqCn6fs3imO0KHhzS3awEBa2J8gV5GcyQYNUazC5gy/M0qVgDmTLbaWH/ezn
         Tb2Xeee7qR1lNT2zrjV3BN/ErkWgmtSPBkLoNINZke5cvXcJ4DmB6bjnXJddexYSgFBN
         faD9o/qrTGYKpFeQcE6EKbkeSR4/vpJx3uFJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=COJ4St1lQrIdf4dsEVKhZiSK4khVz5kd/fC7gBtBbkM=;
        b=bbdwDNTnodXTo5n20LaD9+tMPmtfCoyZ08Zbm6mATyZ8tV9NwXuoeYjzI2qnkIABuk
         VAeiB9g7QMx1ryInv1/Xvr2AoIkUZ40QrWDpCX7pNVymrfx3E7flsnw18axsWRhf+pfO
         vQjrZVdb5kvrez850wmItN7Dctf1iMXBiMqwnGO+KqNU+pW2YWWPdpmOKl8xYXDcTxED
         KlY/XNT64joy0e8mHIMrRQDlTWWQWJfMSyFiWSVZtuC0FY4T7QYoYavChjiYjymqHskR
         JYyK9kQQHuqmL0F+fj95Wb3LwiIh6I8ZdtFyKhb7w2xkSkDIPA5tl+iPQtLKTM/KdoyU
         EYHw==
X-Gm-Message-State: AGi0PuZ5C+rACqUJPe8XBZpHkIA1LBm4l4yzMhZcRtnf0rDcezsO7+5v
        TueHkLfk5B8ksWLv5OpVI68S0vGp++RZlg==
X-Google-Smtp-Source: APiQypLDJBkzSpF+EsZ9GrUQlZE0DsT6W/QXtW8cnRp491M8t8tm7a6yuuNSA0A6B5WZ/k7oh57AlA==
X-Received: by 2002:a17:90a:5648:: with SMTP id d8mr115639pji.163.1588614641276;
        Mon, 04 May 2020 10:50:41 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id t3sm9402062pfq.110.2020.05.04.10.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 10:50:40 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     evgreen@chromium.org, swboyd@chromium.org, mka@chromium.org,
        mkshah@codeaurora.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/5] soc: qcom: rpmh-rsc: Correctly ignore CPU_CLUSTER_PM notifications
Date:   Mon,  4 May 2020 10:50:15 -0700
Message-Id: <20200504104917.v6.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Our switch statement doesn't have entries for CPU_CLUSTER_PM_ENTER,
CPU_CLUSTER_PM_ENTER_FAILED, and CPU_CLUSTER_PM_EXIT and doesn't have
a default.  This means that we'll try to do a flush in those cases but
we won't necessarily be the last CPU down.  That's not so ideal since
our (lack of) locking assumes we're on the last CPU.

Luckily this isn't as big a problem as you'd think since (at least on
the SoC I tested) we don't get these notifications except on full
system suspend.  ...and on full system suspend we get them on the last
CPU down.  That means that the worst problem we hit is flushing twice.
Still, it's good to make it correct.

Fixes: 985427f997b6 ("soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches")
Reported-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v6:
- Release the lock on cluster notifications.

Changes in v5:
- Corrently => Correctly

Changes in v4:
- ("...Corrently ignore CPU_CLUSTER_PM notifications") split out for v4.

Changes in v3: None
Changes in v2: None

 drivers/soc/qcom/rpmh-rsc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index a9e15699f55f..8c338335fc21 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -806,6 +806,9 @@ static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
 	case CPU_PM_EXIT:
 		cpumask_clear_cpu(smp_processor_id(), &drv->cpus_entered_pm);
 		goto exit;
+	default:
+		ret = NOTIFY_DONE;
+		goto exit;
 	}
 
 	ret = rpmh_rsc_ctrlr_is_busy(drv);
-- 
2.26.2.526.g744177e7f7-goog

