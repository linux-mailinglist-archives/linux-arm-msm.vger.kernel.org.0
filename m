Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7829E139BA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 22:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbgAMVca (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 16:32:30 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54578 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728863AbgAMVca (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 16:32:30 -0500
Received: by mail-wm1-f68.google.com with SMTP id b19so11449956wmj.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 13:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=K/OQ1Jgex7gK828pBxgz7p1Ugpl7TPPOgqjJJN6erjc=;
        b=IQ9eJEYnYg6INyjzbf2feUbm7FyLEMAZmE8+4Xzo/LYdXQlYekNzFEjWLT2Lo2hbhQ
         4RweeDtroHUfWQ/qlnqNC3rRJ1t1ZSeqNZ61DwppAsLDSWBEMb0F1YciFz/Y98gg8gKI
         L+DLHRfEQuk/xtSpbHFAgeh8PIu4YiiOxmvYpuajFJcDoAWXRekjQtbRlEeeOFX5A/lw
         sNS1EuLwlasb668TDzWNbMB558lcurWhUczlq3Ca8b92Jcv1lyBa83m1uQJw8WAXT6/f
         BZbcNiQI0wnU/pG5exoG/k/oUnoLq6LIhppkPub7pgaQ2N0jMwe/USeCoUhci5q6Tc+i
         pljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=K/OQ1Jgex7gK828pBxgz7p1Ugpl7TPPOgqjJJN6erjc=;
        b=Vy5mVUb2TT564bgsrM4BPleMLJ3XLGfXTbvrqLS6aizpR4t3D5wIn9a1FFVYHR0MvE
         X0N/WRjufg20EZhXFp9L2cXL4oDyMN/LX8traEPwZtLdqQUATruzzN8cAAaHXrqjJNYi
         Z6g0en6fWpjt/UmGWRSxS6lGRysJ5Ryi2MR6rA3CstNGkSy+0MgkVXQ2drVn50vmz+rH
         xDq/qoM9sjxHehFnuTd/v7xLZZc8i6LSToMcbBvHK2a0SipdjQHAvww9ii/+knYuqwOu
         NpvItBjFlXDCmM1Yx4MN61R+V96SehYrwZpgeVd8dAeNhiy4/dbZpOKrX1p867uXoQeE
         EkCQ==
X-Gm-Message-State: APjAAAWbMVEjEWgy36ecrH7DSEEs1w2jG4xJnw7YLO0LMfADugFxBAxR
        8ulfzFd+FRY14r/mqLC0rfukog==
X-Google-Smtp-Source: APXvYqyGV104T9sy7oILp++NPgAOHbCmIaLHg6zBPJSWON3n87EvUpq2Y4QXK7EiDTMokfZRQ4vM1g==
X-Received: by 2002:a1c:f003:: with SMTP id a3mr21218770wmb.41.1578951147369;
        Mon, 13 Jan 2020 13:32:27 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id j12sm16725120wrt.55.2020.01.13.13.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 13:32:26 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org, corbet@lwn.net
Subject: [PATCH v8 14/15] docs: sysfs: coresight: Add sysfs ABI documentation for CTI
Date:   Mon, 13 Jan 2020 21:31:48 +0000
Message-Id: <20200113213149.25599-15-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113213149.25599-1-mike.leach@linaro.org>
References: <20200113213149.25599-1-mike.leach@linaro.org>
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

