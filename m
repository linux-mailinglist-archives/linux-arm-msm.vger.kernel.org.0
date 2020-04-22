Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA3F1B4FA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 23:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgDVVz1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 17:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbgDVVz0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 17:55:26 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67BCCC03C1AA
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 14:55:25 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id j7so1770745pgj.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 14:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VcN3ZrHWXlIPIuh298G1lUnACYhPjzKzp7jscayIaS4=;
        b=JG4Xp5iAXo+CrWZdn/y4r+OZsOjzrMLbL1ltQWdthqarbD2q+yMDBjC/j/8ONTKO67
         izd7bl01J9AylLWiyA8vjPLcbySNq6/vcVFp/ymDArLe3+jWLxvoIZvbXLOiQsHhbcg5
         pGgNdAykwkPFFmQVqht88gJI6UEnach0gbPYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VcN3ZrHWXlIPIuh298G1lUnACYhPjzKzp7jscayIaS4=;
        b=EZKo/0NcHy1QPMR0zMI7I/Cy8BXwKZ+71OiTrc4yotdCEbSmBJwcfWx+a4xMcXeOKj
         5u1jUoSxJSCgACajJO3RSu5ksmNw/4wy9WIKVAn1YN/oppcirTu3yTs8w/oSPdiW2nq2
         63M9/doPC1SbwvKwK8GgySg+ZWsuf7KW+aUFlmcN/0fY+jSjwB97bn5d2xZj8wD4q36U
         I+1C92SYmWs3HoPEURmOlxuysGv2571tlB6hIPfOWx0UYfgSqpUPQEl/zNGDhBK8/Zdp
         42gloIUsJf3xwymf6wNZ4j9yztKjfpsIuNPfIMgjEYfN0OOWNE5qjsxJltfc/oRXoGnm
         YLdQ==
X-Gm-Message-State: AGi0PuYuzuREfs3wQQxzknZVap6HYNE5z9aEZMIp8S5ATuhHa3nCCWQZ
        +zR8nGxjqVTTmHIDHpiDYTlhcw==
X-Google-Smtp-Source: APiQypIPMIRi0bHMPdu9jfpd4s1/+Acupprv6NYFFFx0FXOFJvQM+mh4MegAtGry2e5FVLcca2uxgw==
X-Received: by 2002:a62:8202:: with SMTP id w2mr594501pfd.117.1587592524740;
        Wed, 22 Apr 2020 14:55:24 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id r4sm211072pgi.6.2020.04.22.14.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 14:55:24 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, swboyd@chromium.org, mkshah@codeaurora.org,
        evgreen@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] soc: qcom: rpmh-rsc: Corrently ignore CPU_CLUSTER_PM notifications
Date:   Wed, 22 Apr 2020 14:54:59 -0700
Message-Id: <20200422145408.v4.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
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

Changes in v4:
- ("...Corrently ignore CPU_CLUSTER_PM notifications") split out for v4.

Changes in v3: None
Changes in v2: None

 drivers/soc/qcom/rpmh-rsc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index a9e15699f55f..3571a99fc839 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -806,6 +806,8 @@ static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
 	case CPU_PM_EXIT:
 		cpumask_clear_cpu(smp_processor_id(), &drv->cpus_entered_pm);
 		goto exit;
+	default:
+		return NOTIFY_DONE;
 	}
 
 	ret = rpmh_rsc_ctrlr_is_busy(drv);
-- 
2.26.1.301.g55bc3eb7cb9-goog

