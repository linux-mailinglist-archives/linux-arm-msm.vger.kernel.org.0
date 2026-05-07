Return-Path: <linux-arm-msm+bounces-106253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJeuEo0w/GmNMgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:26:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A36D44E377B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF36C30247E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE6C33970F;
	Thu,  7 May 2026 06:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/ttAb1t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wh/7g74C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEE133A00C
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135006; cv=none; b=qwyDRUJi4DfVkDwzXeZgbs9fa7MJugJAONGvtNVk/OC/Fy7oHYc1mZvmQIrtZ8otybDzyukoeTqsGaKjvgLCfWAR2+XwdhBPBY7wIQm/4KCmrwb++4gdkFWkuRh8IEeaIWa3YJPQ2lFtibPyNjM7h/MhtdJrDuLMv9ao8fQz69A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135006; c=relaxed/simple;
	bh=L47y2KuTQaE82CAJC9S6eRIVru6wf2RqgaMOg1n3oLU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pOeAP0Jfmo5yK3o7PRY1p/P9nk45BYaxknZIojjS/MoS8nJRXFy+Vo1pnDVPNLgU60BCNfXBzy/Ofl8icAOGQ5HXpMXX+03OYNrj8xO6jXe+jxvlPPHoI6b4+Z0fs7BB31bUC5xrzHvq/rF34uWxysbQ3CLzyZmjLWWC5rnE/dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/ttAb1t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wh/7g74C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475LJ6Z1067863
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nbCDYI3s3UP
	CGmKd4YHz++jLfH6zEuiFSirImm5jJO8=; b=M/ttAb1tG0koLpwH7pqEOVJC/bA
	sfYfYwDFxxgGDm2L8tHu9on0fvbQ17ZRNRO4/SIrhmHIfaYViLFNhi+6/RPGicKk
	d8NQK+/8+HMeLPFXaKSaCYh0IZGxa5I97Ja0mIAZ2a7ZUQ9OmCW2ERn6NGp6spa9
	QxIzbL3tZqDA7J1HJJ+SNlQqH3Vcez/nxic9aMFGA7A0C7G62sZY7dJwUDpZcEiZ
	ijVeAHYYUW+JUHuq2Wjz6FrDPu3ozhKThGHOifrHDzdzcbyGUo06o3Jc/uOnx8Bc
	VXUsBLoDWLtruC5U0cw0B5EYZeVyJEjSoOcx9/pJ2kvQ56CEH7XoCQzhD0A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mh186j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:23:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so550913b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778135004; x=1778739804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbCDYI3s3UPCGmKd4YHz++jLfH6zEuiFSirImm5jJO8=;
        b=Wh/7g74CkpPPOL8XYtAHudk80Z2I+vfJtAXJGLO4C+JDehTLPkPcTH8v0/kMts8l3Q
         G63mEx6Lg796firHi/OLtheIIfVPDREZ1ctpmftyobiZ1SctfgL/62+I8Jl2EEKjHqSC
         AxmXZUZkLjUbRcDZIvFUK+QpFEnBNcT9Gwz5+gj1YK453KrokmyUBmskh6+d9vK0LXCg
         OcZTkYq2ogIi8mRBeGstjRQ1riSCUZu9dE0qILxXTRAulLJ0GZdLH0dKcBvR1qY2hBnN
         nXoEEA4UrD9LvVJRsBmmkEZju4qLFEwKrV1RN4dP0ouf40alm+XWc5a0km5xuhGQqZC9
         LfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778135004; x=1778739804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nbCDYI3s3UPCGmKd4YHz++jLfH6zEuiFSirImm5jJO8=;
        b=BfrTEsQQl7toRHPnavdIzBsZ1uxHgaDeRTt1pfJHXu7Iv4NQIhNb+R6s+ueP9LbQoP
         h2T3iVtFV3erSPpUQpgXeNewZzdXGIBaHyQe7h2Ges6RDucMurPbuor6bH4/7CoVlLWJ
         1bwWIkj6TTxgyLFANOMyE+uf2+vgP7DnxBGAE8GP5iPNEh7aQeFEWsruZU0rXYY6/WpO
         +aQZXR+VlcegNGAjlfDj6MfVrHlcr55ELxBzPMG3kmV83b9EiPWgpmcKM/UpXKhOPbNO
         c0MGnL2efuW8+v0O0Z08msAqTNnykJ8auj9qg3WS/60lr0JfV6FRrDVvgf+DaQduJajn
         qTFA==
X-Gm-Message-State: AOJu0YweVnqjGNq5ODbjFn0uSYT5auTHDL2Fhbb4hVt9mz8GGlsopC7o
	QPntsCcc+JinIla1aBhht2atRzZ8x0h+uTUzb0dqysa6F+srJRZ0OuUErxAXGYKi0T1fFbtqfZj
	PH5FsEogswo8Ju4IovCBemt4m86oOTemDSW3G0D9uO3tuGCtQwKUr7ie91eK0tFWxRBXC
X-Gm-Gg: AeBDieutm26RQYIHu7Y4iTEYl08dc46x8v+S8aTQ86MimodWlVrAnTC+/8BbXF129ib
	QFdOjZP9GTnaawJrri9rLtDJLivIbHdJJBd0Cb5ierFcDsKWqH+3SVVOT4fySNSGven07BtlZRx
	eLVmo7pHiCgwFwsvZ2BHCai4k+OZMKcx4S+lm1DAcGp9fG/7UiO+ikOrTfFlVIbnpfVH6tW5oXi
	YnH5nQ9zQQxA1MVJq5IDVZhjTuu9GuBLH2pJWZ+gplnCSO5+daE8BPnVwBeVHIQvRXBt7xesweP
	4Lyf7apZhtJ3Sal5CpMTOJS7gfcOVQ8iNYU+t2h6OTzSuvHx+2ETT9G1B+9JxMWomo01928B8Mu
	WVO6cSGffER4Aa8etrBv3y38cMf1NJsRfFUS7hm3ibnxi51GLmLd5TvzvMs+jjGdNnMW/W+kpKC
	raYie0AdfTrlCdtWbrC9acOt06+A2yCvBqqReAZqnaYeSN2pw=
X-Received: by 2002:a05:6a00:3918:b0:82f:7bec:2050 with SMTP id d2e1a72fcca58-83a5e550f4fmr6138995b3a.39.1778135003781;
        Wed, 06 May 2026 23:23:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:3918:b0:82f:7bec:2050 with SMTP id d2e1a72fcca58-83a5e550f4fmr6138963b3a.39.1778135003284;
        Wed, 06 May 2026 23:23:23 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945101sm7346557b3a.13.2026.05.06.23.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:23:22 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: cristian.marussi@arm.com, sudeep.holla@kernel.org, cw00.choi@samsung.com,
        kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
        konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        jonathanh@nvidia.com, thierry.reding@kernel.org, digetx@gmail.com,
        conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: [RFC V6 5/8] PM / devfreq: Add a governor for tracking remote device frequencies
Date: Thu,  7 May 2026 11:52:34 +0530
Message-Id: <20260507062237.78051-6-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: U5QtZivYrdAYt3JqaMr4RN2ozXiupV0W
X-Proofpoint-ORIG-GUID: U5QtZivYrdAYt3JqaMr4RN2ozXiupV0W
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=69fc2fdc cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=4aD_1Snzd4jiIFQuHjIA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MCBTYWx0ZWRfX7PYLtiqpBUS4
 XzfNZox5QvThgp6LN52R+AP3BKhbVvIqJ75HbHYUp2IPT/odU1koiviQ5NLNnQH7NCscoyieDMy
 Ml2VX3PIEmDYtGEzeeYmDzm6nC16ulcTnLI8rfPh7VEzrDXhFNvV4oahMjNmyq/VSVSTVIn/uO7
 L53MnfGUKHY6xTudW6+6HPqupmlZxPL8Lk2QGRvL5Hc/VzgklcTyJtb+d0rkuc+LW2uHC8mNqYu
 SqrBh4ei+5Vu61Hv+ZbzZG8XK6lGISj/U/IrYev2u9rXNa6qiw840CqNWVqWjODyWB8rNMub2mw
 9Fzb7rKLaByToEVjcEKMqxDD1SlFuQrO3LWDWH7FPgetcCav4rupwAoR0mY2XumbyutqNpoBwoj
 eOi2Zo5yntpqQj3T3JCCV94Q1gPTrqbFA7Q+vZd3iQR/A7Sb0OhA8kQkr4CI682X/F2e3MWRX0b
 eHAJhtE8npBp2vUpMQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070060
X-Rspamd-Queue-Id: A36D44E377B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,nvidia.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106253-lists,linux-arm-msm=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On SoCs, where the governor and the mechanism to control the frequency for
devices like caches is hosted on the System Control Processor (SCP), there
exists a need track the frequency changes in a reliable way and provide
ways to tweaking parameters on the remote governor.

To address this introduce the new remote devfreq governor that provides for
a way to track the frequency changes on remote devices. It uses the newly
introduced target_freq attribute flag and track_remote flag to achieve
this.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 drivers/devfreq/Kconfig           |  8 ++++
 drivers/devfreq/Makefile          |  1 +
 drivers/devfreq/governor_remote.c | 80 +++++++++++++++++++++++++++++++
 include/linux/devfreq.h           |  1 +
 4 files changed, 90 insertions(+)
 create mode 100644 drivers/devfreq/governor_remote.c

diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index c999c4a1e567..2caa87554914 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -56,6 +56,14 @@ config DEVFREQ_GOV_POWERSAVE
 	  the DEVFREQ framework returns the lowest frequency available
 	  at any time.
 
+config DEVFREQ_GOV_REMOTE
+	tristate "Remote"
+	help
+	  A simple governor to track the frequency of devices whose
+	  dvfs control lies outside the kernel. This governor acts
+	  as an observer and provides for ways to track frequency and
+	  set/get information related to the remote dvfs device.
+
 config DEVFREQ_GOV_USERSPACE
 	tristate "Userspace"
 	help
diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
index 404179d79a9d..cde57c8cda76 100644
--- a/drivers/devfreq/Makefile
+++ b/drivers/devfreq/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_PM_DEVFREQ_EVENT)	+= devfreq-event.o
 obj-$(CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND)	+= governor_simpleondemand.o
 obj-$(CONFIG_DEVFREQ_GOV_PERFORMANCE)	+= governor_performance.o
 obj-$(CONFIG_DEVFREQ_GOV_POWERSAVE)	+= governor_powersave.o
+obj-$(CONFIG_DEVFREQ_GOV_REMOTE)	+= governor_remote.o
 obj-$(CONFIG_DEVFREQ_GOV_USERSPACE)	+= governor_userspace.o
 obj-$(CONFIG_DEVFREQ_GOV_PASSIVE)	+= governor_passive.o
 
diff --git a/drivers/devfreq/governor_remote.c b/drivers/devfreq/governor_remote.c
new file mode 100644
index 000000000000..6bff3cdaf1e5
--- /dev/null
+++ b/drivers/devfreq/governor_remote.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/devfreq.h>
+#include <linux/devfreq-governor.h>
+
+static int devfreq_remote_track_func(struct devfreq *devfreq, unsigned long *freq)
+{
+	unsigned long cur_freq = 0;
+
+	if (devfreq->profile->get_cur_freq)
+		devfreq->profile->get_cur_freq(devfreq->dev.parent, &cur_freq);
+
+	*freq = cur_freq;
+
+	return 0;
+}
+
+static int devfreq_remote_track_handler(struct devfreq *devfreq, unsigned int event, void *data)
+{
+	switch (event) {
+	case DEVFREQ_GOV_START:
+		devfreq_monitor_start(devfreq);
+		break;
+
+	case DEVFREQ_GOV_STOP:
+		devfreq_monitor_stop(devfreq);
+		break;
+
+	case DEVFREQ_GOV_UPDATE_INTERVAL:
+		devfreq_update_interval(devfreq, (unsigned int *)data);
+		break;
+
+	case DEVFREQ_GOV_SUSPEND:
+		devfreq_monitor_suspend(devfreq);
+		break;
+
+	case DEVFREQ_GOV_RESUME:
+		devfreq_monitor_resume(devfreq);
+		break;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static struct devfreq_governor devfreq_remote_track = {
+	.name = DEVFREQ_GOV_REMOTE,
+	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
+		| DEVFREQ_GOV_ATTR_TIMER,
+	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE
+		| DEVFREQ_GOV_FLAG_TRACK_REMOTE,
+	.get_target_freq = devfreq_remote_track_func,
+	.event_handler = devfreq_remote_track_handler,
+};
+
+static int __init devfreq_remote_track_init(void)
+{
+	return devfreq_add_governor(&devfreq_remote_track);
+}
+subsys_initcall(devfreq_remote_track_init);
+
+static void __exit devfreq_remote_track_exit(void)
+{
+	int ret;
+
+	ret = devfreq_remove_governor(&devfreq_remote_track);
+	if (ret)
+		pr_err("%s: failed remove governor %d\n", __func__, ret);
+}
+module_exit(devfreq_remote_track_exit);
+
+MODULE_DESCRIPTION("DEVFREQ Remote Tracking governor");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/devfreq.h b/include/linux/devfreq.h
index dc1075dc3446..4d50cf230950 100644
--- a/include/linux/devfreq.h
+++ b/include/linux/devfreq.h
@@ -21,6 +21,7 @@
 #define DEVFREQ_GOV_POWERSAVE		"powersave"
 #define DEVFREQ_GOV_USERSPACE		"userspace"
 #define DEVFREQ_GOV_PASSIVE		"passive"
+#define DEVFREQ_GOV_REMOTE		"remote"
 
 /* DEVFREQ notifier interface */
 #define DEVFREQ_TRANSITION_NOTIFIER	(0)
-- 
2.34.1


