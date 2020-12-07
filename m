Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84AE82D0A7E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Dec 2020 07:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgLGGBB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 01:01:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgLGGBB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 01:01:01 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A2A2C061A4F
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Dec 2020 22:00:21 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id i3so5138942pfd.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Dec 2020 22:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+idpF1Cpaw9/DMbUpS5qXRNzr1N/vr5SsKMNGSE2vHk=;
        b=x79cIv8rBUanEoOew+mnd9hYuXueqtvt1P7zhrODyiIZJA0gGZxJlX8ERMYPIaUHkt
         6hA/uQTumgor3gmMCC0GvgCUyJmyaHUYeccbYaUimayzV1LA06hrHTckeKReL1DDEsQq
         1ktKcI5iii6mqj7t3I2ytqToNYB8rumkBc5lMRZY18skyk26PBraYIJR1c8LA0uw+6gh
         mIbDG5bh/EocQ/i8OitLQHiCQ4tWSF1rXRoHm1HL9VlKkuRUJnvYJNhHXGxRqgwTliXt
         lUJ9DP9gjJ2VViDYtV+ZHsIUpbfPeyY+CTK04cQC4+CSxAHHucNUltD4B+VpCC4l/88f
         TZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+idpF1Cpaw9/DMbUpS5qXRNzr1N/vr5SsKMNGSE2vHk=;
        b=ZFbk4aC+0VwP7IwGnLcMgVxZql+U6iwnSNFY+70CR9GJWldtfG0aOdP860ePw56x9j
         U8akxIyBVdOHrykglIxlaMq/QtKzIlPk5bZqoAb9aEh2LZG+nXadiTMuNDDyQAsym6SV
         40I2YG87NwjBAL47LVizD3qVdldIJaqKLCerBaCXUszARgYQ81C/McBZRsufUvLiHCVM
         l+9tUOqqUwuCfGDgiZWOHXokBHwKHLtHwyNLizxLOL9bCdIceEbjKe8Oe7WxEiAGhTfX
         5zqvDBzq+5ztoWt8sX8T4yScujC/EwajtoUzjgjs0xHSWePT6uphlOmi4ZQM5k+8VOaj
         OWlw==
X-Gm-Message-State: AOAM533hPwUTHrwA0819wbphhE2bX+ziOuTGCOn7EakmwPRZ9bpWIxC3
        k+6lyGWxpvUbMWtTtMzADBUz
X-Google-Smtp-Source: ABdhPJyGFxd72bRvqQPuwgeNFZEl7f8JSsSvuxN+jQfdDwk9LX5/0aSNMeOPU5/uajhspNF9NPAZUA==
X-Received: by 2002:a63:c46:: with SMTP id 6mr16859201pgm.353.1607320820543;
        Sun, 06 Dec 2020 22:00:20 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:89:c10a:c01b:880c:5d14:a5a4])
        by smtp.gmail.com with ESMTPSA id i26sm12953744pfq.148.2020.12.06.22.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 22:00:19 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] watchdog: qcom: Avoid context switch in restart handler
Date:   Mon,  7 Dec 2020 11:30:05 +0530
Message-Id: <20201207060005.21293-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The use of msleep() in the restart handler will cause scheduler to
induce a context switch which is not desirable. This generates below
warning on SDX55 when WDT is the only available restart source:

[   39.800188] reboot: Restarting system
[   39.804115] ------------[ cut here ]------------
[   39.807855] WARNING: CPU: 0 PID: 678 at kernel/rcu/tree_plugin.h:297 rcu_note_context_switch+0x190/0x764
[   39.812538] Modules linked in:
[   39.821954] CPU: 0 PID: 678 Comm: reboot Not tainted 5.10.0-rc1-00063-g33a9990d1d66-dirty #47
[   39.824854] Hardware name: Generic DT based system
[   39.833470] [<c0310fbc>] (unwind_backtrace) from [<c030c544>] (show_stack+0x10/0x14)
[   39.838154] [<c030c544>] (show_stack) from [<c0c218f0>] (dump_stack+0x8c/0xa0)
[   39.846049] [<c0c218f0>] (dump_stack) from [<c0322f80>] (__warn+0xd8/0xf0)
[   39.853058] [<c0322f80>] (__warn) from [<c0c1dc08>] (warn_slowpath_fmt+0x64/0xc8)
[   39.859925] [<c0c1dc08>] (warn_slowpath_fmt) from [<c038b6f4>] (rcu_note_context_switch+0x190/0x764)
[   39.867503] [<c038b6f4>] (rcu_note_context_switch) from [<c0c2aa3c>] (__schedule+0x84/0x640)
[   39.876685] [<c0c2aa3c>] (__schedule) from [<c0c2b050>] (schedule+0x58/0x10c)
[   39.885095] [<c0c2b050>] (schedule) from [<c0c2eed0>] (schedule_timeout+0x1e8/0x3d4)
[   39.892135] [<c0c2eed0>] (schedule_timeout) from [<c039ad40>] (msleep+0x2c/0x38)
[   39.899947] [<c039ad40>] (msleep) from [<c0a59d0c>] (qcom_wdt_restart+0xc4/0xcc)
[   39.907319] [<c0a59d0c>] (qcom_wdt_restart) from [<c0a58290>] (watchdog_restart_notifier+0x18/0x28)
[   39.914715] [<c0a58290>] (watchdog_restart_notifier) from [<c03468e0>] (atomic_notifier_call_chain+0x60/0x84)
[   39.923487] [<c03468e0>] (atomic_notifier_call_chain) from [<c030ae64>] (machine_restart+0x78/0x7c)
[   39.933551] [<c030ae64>] (machine_restart) from [<c0348048>] (__do_sys_reboot+0xdc/0x1e0)
[   39.942397] [<c0348048>] (__do_sys_reboot) from [<c0300060>] (ret_fast_syscall+0x0/0x54)
[   39.950721] Exception stack(0xc3e0bfa8 to 0xc3e0bff0)
[   39.958855] bfa0:                   0001221c bed2fe24 fee1dead 28121969 01234567 00000000
[   39.963832] bfc0: 0001221c bed2fe24 00000003 00000058 000225e0 00000000 00000000 00000000
[   39.971985] bfe0: b6e62560 bed2fc84 00010fd8 b6e62580
[   39.980124] ---[ end trace 3f578288bad866e4 ]---

Hence, replace msleep() with mdelay() to fix this issue.

Fixes: 05e487d905ab ("watchdog: qcom: register a restart notifier")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/watchdog/qcom-wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index ab7465d186fd..cdf754233e53 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -148,7 +148,7 @@ static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
 	 */
 	wmb();
 
-	msleep(150);
+	mdelay(150);
 	return 0;
 }
 
-- 
2.25.1

