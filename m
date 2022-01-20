Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D134495530
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jan 2022 21:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377535AbiATUCU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jan 2022 15:02:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377531AbiATUCU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jan 2022 15:02:20 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC7CC06161C
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jan 2022 12:02:20 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id d5so4579883pjk.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jan 2022 12:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=HtkLk42w0fWd+6/z9mh2AZD/Xm33fQuNOQj57mIh9Q4=;
        b=M06sFa/2Shhq7noZOjf2EeS1lXvRx9NRhU+kUJyjKxjuBy2rUaKXy2LIkm7Cyda/16
         bGRqiz9HX+frjV6/IMeFaPBpnzNQUlcbiiVOwfbghUOLYoYogqc3cqVkBh2NZhztpOFA
         II9ZSGRRYLfmadeUXP9jOQCYsEZKc+G9W6w7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HtkLk42w0fWd+6/z9mh2AZD/Xm33fQuNOQj57mIh9Q4=;
        b=hT6YcqgFnHC06LW+ET7S9JCfhJA4PJodZesSD2STjELyrD9TlKcSDn72VcRlSslaFg
         J8JZhTZra3CPko0ZD/G1fhUdWzYBeMOPniqKbwJwOCzf7HKe1IB+NIedR3iQEkB2tJa5
         80D1mlOq7iXafbMccU/RSYUJYh8Ldzh3LmF2H+1rqYrxp3Ct8Mz3qiStZArRYaJPWsCe
         73aZi7f4YOArPFGWe8quTDXrxvzpqomi49IgI2dFSTaO3oyxXpgY5sxGyqiq7IYgvI7F
         xFqGqKe/KHborVOZEoFl8OCU5iM1XrvYFN6cCc1AT2F7QU9PBFQF6Zk2U2I0Iw1tz9DO
         YgGA==
X-Gm-Message-State: AOAM530pGRBM6yi6Y8PvHXCr2mmbHKoRC/CqDDMOdDXxsN1rUs+l+aPT
        Oya60IdCKuuejA6LY3k0uLxLzw==
X-Google-Smtp-Source: ABdhPJx4Bedm7kx35gBQovgPPmgKSyX2vlJnVfF48rpV+/YtF+cSQhc7Wm9itzPQ9iYRqRwmoRO20w==
X-Received: by 2002:a17:90a:ae15:: with SMTP id t21mr677825pjq.147.1642708939439;
        Thu, 20 Jan 2022 12:02:19 -0800 (PST)
Received: from localhost (99-47-69-49.lightspeed.sntcca.sbcglobal.net. [99.47.69.49])
        by smtp.gmail.com with ESMTPSA id em22sm3398862pjb.23.2022.01.20.12.02.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jan 2022 12:02:18 -0800 (PST)
From:   Benjamin Li <benl@squareup.com>
To:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zac Crosby <zac@squareup.com>, Benjamin Li <benl@squareup.com>,
        Andy Gross <agross@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] drivers: thermal: tsens: respect thermal_device_mode in threshold irq reporting
Date:   Thu, 20 Jan 2022 12:01:53 -0800
Message-Id: <20220120200153.1214-1-benl@squareup.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

'echo disabled > .../thermal_zoneX/mode' will disable the thermal core's
polling mechanism to check for threshold trips. This is used sometimes to
run performance test cases.

However, tsens supports an interrupt mechanism to receive notification of
trips, implemented in commit 634e11d5b450 ("drivers: thermal: tsens: Add
interrupt support").

Currently the thermal zone mode that's set by userspace is not checked
before propagating threshold trip events from IRQs. Let's fix this to
restore the abilty to disable thermal throttling at runtime.

====================

Tested on MSM8939 running 5.16.0. This platform has 8 cores; the first
four thermal zones control cpu0-3 and the last zone is for the other four
CPUs together.

  for f in /sys/class/thermal/thermal_zone*; do
    echo "disabled" > $f/mode
    echo $f | paste - $f/type $f/mode
  done

/sys/class/thermal/thermal_zone0	cpu0-thermal	disabled
/sys/class/thermal/thermal_zone1	cpu1-thermal	disabled
/sys/class/thermal/thermal_zone2	cpu2-thermal	disabled
/sys/class/thermal/thermal_zone3	cpu3-thermal	disabled
/sys/class/thermal/thermal_zone4	cpu4567-thermal	disabled

With mitigation thresholds at 75 degC and load running, we can now cruise
past temp=75000 without CPU throttling kicking in.

  watch -n 1 "grep '' /sys/class/thermal/*/temp
      /sys/class/thermal/*/cur_state
      /sys/bus/cpu/devices/cpu*/cpufreq/cpuinfo_cur_freq"

/sys/class/thermal/thermal_zone0/temp:82000
/sys/class/thermal/thermal_zone1/temp:84000
/sys/class/thermal/thermal_zone2/temp:87000
/sys/class/thermal/thermal_zone3/temp:84000
/sys/class/thermal/thermal_zone4/temp:84000
/sys/class/thermal/cooling_device0/cur_state:0
/sys/class/thermal/cooling_device1/cur_state:0
/sys/bus/cpu/devices/cpu0/cpufreq/cpuinfo_cur_freq:1113600
/sys/bus/cpu/devices/cpu1/cpufreq/cpuinfo_cur_freq:1113600
/sys/bus/cpu/devices/cpu2/cpufreq/cpuinfo_cur_freq:1113600
/sys/bus/cpu/devices/cpu3/cpufreq/cpuinfo_cur_freq:1113600
/sys/bus/cpu/devices/cpu4/cpufreq/cpuinfo_cur_freq:800000
/sys/bus/cpu/devices/cpu5/cpufreq/cpuinfo_cur_freq:800000
/sys/bus/cpu/devices/cpu6/cpufreq/cpuinfo_cur_freq:800000
/sys/bus/cpu/devices/cpu7/cpufreq/cpuinfo_cur_freq:800000

Reported-by: Zac Crosby <zac@squareup.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Benjamin Li <benl@squareup.com>
---
Changes in v3:
- Upgraded logging to dev_info_ratelimited and revised log message.
- Remove unrelated hunk.

Some drivers that support thermal zone disabling implement a set_mode
operation and simply disable the sensor or the relevant IRQ(s), so they
actually don't log anything when zones are disabled. These drivers are
imx_thermal.c, intel_quark_dts_thermal.c, and int3400_thermal.c.

For tsens.c, implementing a change_mode would require migrating the driver
from devm_thermal_zone_of_sensor_register to thermal_zone_device_register
(or updating thermal_of.c to add a change_mode operation in thermal_zone_
of_device_ops).

stm_thermal.c seems to use this patch's model of not disabling IRQs when
the zone is disabled (they still perform the thermal_zone_device_update
upon IRQ, but return -EAGAIN from their get_temp).

Changes in v2:
- Reordered sentences in first part of commit message to make sense.

 drivers/thermal/qcom/tsens.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 99a8d9f3e03c..dd0002829536 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -509,10 +509,14 @@ static irqreturn_t tsens_irq_thread(int irq, void *data)
 		spin_unlock_irqrestore(&priv->ul_lock, flags);
 
 		if (trigger) {
-			dev_dbg(priv->dev, "[%u] %s: TZ update trigger (%d mC)\n",
-				hw_id, __func__, temp);
-			thermal_zone_device_update(s->tzd,
-						   THERMAL_EVENT_UNSPECIFIED);
+			if (s->tzd->mode == THERMAL_DEVICE_ENABLED) {
+				dev_dbg(priv->dev, "[%u] %s: TZ update trigger (%d mC)\n",
+					hw_id, __func__, temp);
+				thermal_zone_device_update(s->tzd, THERMAL_EVENT_UNSPECIFIED);
+			} else {
+				dev_info_ratelimited(priv->dev, "[%u] %s: TZ update trigger (%d mC) skipped - zone disabled, operating outside of safety limits!\n",
+					hw_id, __func__, temp);
+			}
 		} else {
 			dev_dbg(priv->dev, "[%u] %s: no violation:  %d\n",
 				hw_id, __func__, temp);
-- 
2.17.1

