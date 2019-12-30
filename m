Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6F2B12D23D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2019 17:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbfL3Qot (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Dec 2019 11:44:49 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43646 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbfL3Qot (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Dec 2019 11:44:49 -0500
Received: by mail-wr1-f68.google.com with SMTP id d16so33166812wre.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2019 08:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=K/OQ1Jgex7gK828pBxgz7p1Ugpl7TPPOgqjJJN6erjc=;
        b=uBD/SmUIXnUKTE5KwX0F1I6OhqqqypwSUnDdY4MPjN8M95ue/fHwHrde7CJR2UeCaY
         2GF17mFEL7apj8Alfz9CyFSpnXaztmGasqyvROkYCrrOWtj4VeSAKZ26AQGXa2DquPt5
         VBV/GFPTB3v5e3TujK2EDf5zO5L0jphujlx9tjlMNRzoUMDkPEVQYz0GR9dkO2s9WxVy
         8MP1SpAIS5lad6F0vSqEAioW2CJ5sLZDo4Ihr9pNE+jp8ZQuldyWGX7Yb7C89s//gerc
         0tIlqW5WS9/gYAl0kLAnMCwYkYHwJSOCJpKCAQSWjeqatoBU8B5H82iufARV2AZWPT9Z
         qA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=K/OQ1Jgex7gK828pBxgz7p1Ugpl7TPPOgqjJJN6erjc=;
        b=la/wT8LkfJ80Czt96b/bU3jBEX20SZ4+0fWI/SbiOc8b2LfJ6B4G0Dzx/20UBaSEYm
         rWwlYhq6OQp16u+O+WU4wBqT8YJT90x0rDWakoSORJDfvNZPfgI93zNtDSgcCJI4qeku
         +YHAAXOe0ArCUgyMLiNNu+YgofCH3r3SalfBRndPoXM6jOcaZtomDmOT7Sx42uI+cF3H
         wgXi4kyksbXGv2+mViVQAyiJcuuJrE4s56bvuHZc6yu4GzKN1Qcc5oCNhC0At6UZ9mVD
         XEG+vZWL73Q7t3yKOjXIRJrO+40qdHKXI8+n+7JqelfbMS07Gepmt71cdMpXkFVeJZK7
         2q9A==
X-Gm-Message-State: APjAAAU5FsG60+q4Lx0IrjpL9vIy/HDhqW04l89MLICyY04tONSVl6oT
        ukOsMVWeNmJGGOkzLUBUm2V8LQ==
X-Google-Smtp-Source: APXvYqwiWM7LFoy8NA5bMURgt+xSgFjUPcEWPgklmbuboLMKUV7ZdpEOO/yPuC9BfMlIxUf/eq4N9g==
X-Received: by 2002:a5d:5381:: with SMTP id d1mr10999451wrv.259.1577724285766;
        Mon, 30 Dec 2019 08:44:45 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id r62sm22276842wma.32.2019.12.30.08.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2019 08:44:45 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org, corbet@lwn.net,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v7 14/15] docs: sysfs: coresight: Add sysfs ABI documentation for CTI
Date:   Mon, 30 Dec 2019 16:44:41 +0000
Message-Id: <20191230164441.28375-2-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191230164441.28375-1-mike.leach@linaro.org>
References: <20191230164441.28375-1-mike.leach@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add API usage document for sysfs API in CTI driver.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../testing/sysfs-bus-coresight-devices-cti   | 221 ++++++++++++++++++
 1 file changed, 221 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-cti

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
new file mode 100644
index 000000000000..5ed54d196a17
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
@@ -0,0 +1,221 @@
+What:		/sys/bus/coresight/devices/<cti-name>/enable
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Enable/Disable the CTI hardware.
+
+What:		/sys/bus/coresight/devices/<cti-name>/ctmid
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Display the associated CTM ID
+
+What:		/sys/bus/coresight/devices/<cti-name>/nr_trigger_cons
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Number of devices connected to triggers on this CTI
+
+What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/name
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Name of connected device <N>
+
+What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/in_signals
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Input trigger signals from connected device <N>
+
+What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/in_types
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Functional types for the input trigger signals
+		from connected device <N>
+
+What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/out_signals
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Output trigger signals to connected device <N>
+
+What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/out_types
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Functional types for the output trigger signals
+		to connected device <N>
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/inout_sel
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Select the index for inen and outen registers.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/inen
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Read or write the CTIINEN register selected by inout_sel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/outen
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Read or write the CTIOUTEN register selected by inout_sel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/gate
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Read or write CTIGATE register.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/asicctl
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Read or write ASICCTL register.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/intack
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Write the INTACK register.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/appset
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Set CTIAPPSET register to activate channel. Read back to
+		determine current value of register.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/appclear
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Write APPCLEAR register to deactivate channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/apppulse
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Write APPPULSE to pulse a channel active for one clock
+		cycle.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/chinstatus
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Read current status of channel inputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/choutstatus
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) read current status of channel outputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/triginstatus
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) read current status of input trigger signals
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/trigoutstatus
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) read current status of output trigger signals.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/trigin_attach
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Attach a CTI input trigger to a CTM channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/trigin_detach
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Detach a CTI input trigger from a CTM channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/trigout_attach
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Attach a CTI output trigger to a CTM channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/trigout_detach
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Detach a CTI output trigger from a CTM channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_gate_enable
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Enable CTIGATE for single channel (W) or list enabled
+		channels through the gate (R).
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_gate_disable
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Disable CTIGATE for single channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_set
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Activate a single channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_clear
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Deactivate a single channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_pulse
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Pulse a single channel - activate for a single clock cycle.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/trigout_filtered
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) List of output triggers filtered across all connections.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/trig_filter_enable
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Enable or disable trigger output signal filtering.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_inuse
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) show channels with at least one attached trigger signal.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_free
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) show channels with no attached trigger signals.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_xtrigs_view
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Write channel number to select a channel to view, read to
+		see triggers attached to selected channel on this CTI.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_xtrigs_reset
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Clear all channel / trigger programming.
-- 
2.17.1

