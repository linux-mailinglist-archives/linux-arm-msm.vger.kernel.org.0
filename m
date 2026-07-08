Return-Path: <linux-arm-msm+bounces-117772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1UyLO+h6TmpwNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:29:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D9899728B64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:29:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Kkj1aPCZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EFmsMO8z;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117772-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117772-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6933A3008622
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 16:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F8541CB33;
	Wed,  8 Jul 2026 16:12:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B6B30DECB
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 16:12:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527156; cv=none; b=s1pBWM7MSCyGv7lEpw/adNt8h4ezKikCaqVIRo0aN4R/XwX35GDP7+jBjbKEh6oa5j3x1v+qpA0MwI15ao1Prx56/SYaalWwOHFOe0nORKJkyVAgCiHSh8/bvIc3NCbAk+pF4fvaBG0IWKF3mRV7QkJGzNXAjCBHc7VWTRUkM1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527156; c=relaxed/simple;
	bh=1nXpRUx2WWpgGmhHch6VcfLTC3FPp9+Reb/7wOr0BA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HMfYbI2+X6pRLoBkx7EVUYzZ/m/g/2GCZooHfynOr73/gX6YDF9TcpfHQ++xG9FiFwCjvyk+MbM5pDhHC/HFnrAeDSKubuW0brKkbJHGcmi2ACc0Eguh9LW+wrcmv2FSSPrtsRZwShZvsrMPIYg4JE6qVZ/vaZzt8io7hXuJ8zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kkj1aPCZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFmsMO8z; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3TQk2579680
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 16:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H+jdjbqbC/3
	QB1jJM1Y8Kku/Fjlf4I53sMsIIiLwjXo=; b=Kkj1aPCZrFn9LEE1771IBWNaWkf
	69RS3USFY0LHD/m0LtcWt+b+1OHtRwSQrGc4PPi7eMyjiDbdJK34eq8fGlYP0htS
	bg7RgjYN69eBLGfonZqbuEkqX6AbTMhY0fFu0Hu7qTokLKwT20MhfU0wtW9Xc/af
	s4MrEnzU1bk44iqRTznV2KHgDkhPJ+syIhbz52KcIItLh3r+Vf7DTZmEvBEGi7RX
	mAcxs/m5SoTJZSs4ovB5nVu5Wx/4cOQ9XhStR1Ju1CvAW0pMU/YPF5XkBYKPgskG
	FGQeTja6i9vfYWo70xWqsgDsAo+Ejgx416qYBBhfaAjZNdUMyAs7E6VlTHQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gbq8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 16:12:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cacd6d37edso16904415ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 09:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783527153; x=1784131953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+jdjbqbC/3QB1jJM1Y8Kku/Fjlf4I53sMsIIiLwjXo=;
        b=EFmsMO8zMnG9ZzXqzVZNIQOE1AmDb6sq6oqyypQSWdqZqR/SHaJHJhVUaTLOOp9lNB
         LDH9Vx02+GgFHrWBEhS/WqroTWnBEviIHUnplEUAzr8kuqcTtKvcnvEKl03MtvXObjWl
         Q3BKh3BaKOIyHux9OcOyR5f9EJYVesqvloBE4HuhL/TqLdo0xoQxRDHMB5ANbZ9igTOi
         fISrS131DGQkAudYIK4lMSfuwLMURr9ML/ZSjmRpFM7rN7NgHzykPTMZ4f9Myo/IKrXx
         ouYul3yPLXEyi6HG8mNajCUPZlho9rMwOoecTYEXVU3+zws4Kp/r2XW4CVotLpqCQFEz
         FGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783527153; x=1784131953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H+jdjbqbC/3QB1jJM1Y8Kku/Fjlf4I53sMsIIiLwjXo=;
        b=scLHe8z8QIz3ILL6sgLotJkbE0JOAypbJtVD+4GZjEZaedNtcHn+DYF6n1OABAeBbS
         X+5NxPYDG6tRYtAYcALnS8jatYkx2QtY/T61WFiQImqciWnkds8brYliMGgl0lnl+G1M
         YG+siAEniEAUEpUP6KnwsnPGpNNkX3OZfynWnY8xJDIBaKVGl2IAj2r60Rin9Vyn1N1z
         KE0fjaxhTY8Hu+N0AkqvVyQ7z8ofjHskS7/ySE2/jjvoLj7mnO0jWHTpfX88PvBJLeib
         nWeS8XqLyN411a1dBFjynpB8ofi1p5Da+lOziKmsxlo9tRTOgVcNPxmoyMBaB8UZfwJw
         hrXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmM4cpYpDmrCp5tHKHNuwy4dp3y8a6l/nqRutfPHq4dn++agc9dvM9NkVgS+SGSbajKb0osDVnFA3nI78I@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy+Way7Q++qnNYc87k8tTBIfy9JuNBLv4TJeyY3+UiVwh4UEi6
	0hePBHF0Pa2fCi1xbrdjfPrTVs0Qx17Vwa+HJcN9iak7we+AJqmIM28UBIMkHeMz/3GelMVxmny
	OGya6ASm9YlsT4zBa+3Ok3r2tp2bV/SBqxXAEPacNniAKMlU3uv6YiewvZ54nv3Ho7x7H
X-Gm-Gg: AfdE7clBYBX56qpeq073nE+nKP/VGdqAfYG2+IFgNIdjHBfe7x2f17ybJvQ1iznpyCJ
	u8OMJDwuGyy4iCau4b4AYUDdh5+1xWDyfRXqHk5OWShxwuc8cybpb67BynOqOrcELQ0oB/5eieJ
	EGF3rnaThLvagtewqlJzfr4dmzKZVh/8YjkRTLNNZMVZIpxo36yHGlo8dX0+FFF1pJrWopOW+Hq
	/eu3GumPNpMAgJOhQcyI/XDBAwCstQVVBFKBlYgujh80q3XXasmIDPgeYZVNVjvrVHddG+ldiC7
	nfNL5uhOl9pJvHbD9IVUui2juSilIM8/5VngPQhL9s1Q6eAhrnjBTwlXHuFKXEGFsANNr5ilfhg
	3yN6sNiragXGhiQd3wy0CNz7zouUiGrGtrxkcFBJPm2Ba88iHVoyWfA/FRw==
X-Received: by 2002:a17:903:4b4c:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2ccea2f919dmr31469055ad.12.1783527152939;
        Wed, 08 Jul 2026 09:12:32 -0700 (PDT)
X-Received: by 2002:a17:903:4b4c:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2ccea2f919dmr31468805ad.12.1783527152422;
        Wed, 08 Jul 2026 09:12:32 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf8c12sm30438155ad.26.2026.07.08.09.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:12:31 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH v2 2/2] tests/msm: Add perfcntrs test
Date: Wed,  8 Jul 2026 09:12:24 -0700
Message-ID: <20260708161224.507091-3-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708161224.507091-1-rob.clark@oss.qualcomm.com>
References: <20260708161224.507091-1-rob.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1OCBTYWx0ZWRfX446TOHyaZuGo
 Eym2/2C1sqG43ee37hHUH9suWD2FyeXcqtOoLJbdcY+euB+E9JRJDkVuzooQaf7PrbBnCxxMYcR
 Dl+dkbHDzG5EGGB/WG/kA1uJHjEGdu8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1OCBTYWx0ZWRfX7aSkmxC5dxq8
 wUggpakFA932zzHN2b2W3xyuPOZnAhMS9X7ndbiw1Mq3wiuz2ijAgrajfhVvtdz00cbD0GPjrUF
 EWxPuYEUAbjO087QARQPofR9asc2pEFATfI/4TtSyFNO7JX1FOrlPiW5o3xlZBpt1ZWO9cOeFmm
 pjdHV/9wcUFYtkNpXYpkfj51z8HFHfADnfbre1NJas4JXK4V2Cqkay4xu8I+4pNimLvPu6mMKcL
 EvDRcDUOzMwJW+jkCl3HWrRzromzQgzNp65rS8+xJV8PU42Nyn76AgzRCSQVtIx9YB9/LndEjmg
 3pWfWXVM+Whh+/9FRgt20/oNpinmyEXmwwjh3UyQr+PdiTBSOGt69OpnyctdLi0/guu5OHe+EO+
 SnHvcmEQfchPbraCak/9+s1b8LpazfWHvxg2vEBAPhxRPNaKaiTNGZkVm5/o3jYEJIUaT+jZgq3
 yzz3F3yuUOa4YwVVq4Q==
X-Proofpoint-ORIG-GUID: _7_9rFIOirwuCD_KD41AtbFeXpFlCe6S
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e76f2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Hi4UILjZCzWCtySGamAA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: _7_9rFIOirwuCD_KD41AtbFeXpFlCe6S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080158
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117772-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:igt-dev@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:rob.clark@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D9899728B64

Add tests for new PERFCNTR_CONFIG ioctl.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/meson.build     |   1 +
 tests/msm/msm_perfcntrs.c | 196 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 197 insertions(+)
 create mode 100644 tests/msm/msm_perfcntrs.c

diff --git a/tests/msm/meson.build b/tests/msm/meson.build
index 2ba5b4db2279..0a7f35662c03 100644
--- a/tests/msm/meson.build
+++ b/tests/msm/meson.build
@@ -1,6 +1,7 @@
 msm_progs = [
 	'msm_bo',
 	'msm_mapping',
+	'msm_perfcntrs',
 	'msm_recovery',
 	'msm_shrink',
 	'msm_submit',
diff --git a/tests/msm/msm_perfcntrs.c b/tests/msm/msm_perfcntrs.c
new file mode 100644
index 000000000000..42f77456939e
--- /dev/null
+++ b/tests/msm/msm_perfcntrs.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <errno.h>
+
+#include "igt.h"
+#include "igt_core.h"
+#include "igt_msm.h"
+#include "msm_drm.h"
+
+static int
+__configure_counters(struct msm_device *dev, bool global, unsigned nr_groups,
+		     const char **groups, unsigned count)
+{
+	uint32_t countables[count];
+	struct drm_msm_perfcntr_group group[nr_groups];
+	struct drm_msm_perfcntr_config req = {
+		.flags = global ? MSM_PERFCNTR_STREAM : 0,
+		.nr_groups = nr_groups,
+		.groups = VOID2U64(group),
+		.period = global ? NSEC_PER_SEC : 0,
+		.bufsz_shift = global ? 10 : 0,
+		.group_stride = sizeof(struct drm_msm_perfcntr_group),
+	};
+
+	memset(group, 0, sizeof(group));
+	/* selecting countable 0 for each counter is fine: */
+	memset(countables, 0, sizeof(countables));
+
+	for (unsigned i = 0; i < nr_groups; i++) {
+		strcpy(group[i].group_name, groups[i]);
+		group[i].nr_countables = count;
+		group[i].countables = global ? VOID2U64(countables) : 0;
+	}
+
+	return drmIoctl(dev->fd, DRM_IOCTL_MSM_PERFCNTR_CONFIG, &req);
+}
+
+static int
+configure_counters(struct msm_device *dev, bool global, unsigned count)
+{
+	/* CP group is present on all gens.. SP would be another good candidate */
+	const char *groups[] = {"CP"};
+	return __configure_counters(dev, global, 1, groups, count);
+}
+
+static unsigned
+get_available_counters(struct msm_device *dev, bool global)
+{
+	for (unsigned i = 0; ; i++) {
+		int ret = configure_counters(dev, global, i + 1);
+		igt_warn("%u: ret=%d\n", i, ret);
+		if (ret < 0)
+			return i;
+		if (global)
+			close(ret);
+	}
+}
+
+
+int igt_main()
+{
+	/* device instance for global counter collection: */
+	struct msm_device *dev_global = NULL;
+	/* device instances for local counter reservation: */
+	struct msm_device *dev_local_1 = NULL;
+	struct msm_device *dev_local_2 = NULL;
+	unsigned num_counters;
+
+	igt_fixture() {
+		dev_global = igt_msm_dev_open();
+		dev_local_1 = igt_msm_dev_open();
+		dev_local_2 = igt_msm_dev_open();
+
+		num_counters = get_available_counters(dev_global, true);
+		igt_info("num_counters=%u\n", num_counters);
+	}
+
+	igt_describe("Multiple process should be able to reserve the same "
+		     "counters for local counter collection");
+	igt_subtest("perfcntrs-local-coexist") {
+		igt_require(num_counters > 0);
+
+		igt_assert_eq(0, configure_counters(dev_local_1, false, num_counters));
+		igt_assert_eq(0, configure_counters(dev_local_2, false, num_counters));
+
+		/* release the reservations: */
+		configure_counters(dev_local_1, false, 0);
+		configure_counters(dev_local_2, false, 0);
+	}
+
+	igt_describe("non-conflict global and local counters");
+	igt_subtest("perfcntrs-non-conflict-global-local") {
+		int num_local = num_counters - 2;
+		int stream_fd;
+
+		igt_require(num_counters > 2);
+
+		igt_assert_eq(0, configure_counters(dev_local_1, false, num_local));
+		igt_assert_eq(0, configure_counters(dev_local_2, false, num_local));
+
+		stream_fd = configure_counters(dev_global, true, 2);
+		igt_assert_lte(0, stream_fd);
+		close(stream_fd);
+
+		/* release the reservations: */
+		configure_counters(dev_local_1, false, 0);
+		configure_counters(dev_local_2, false, 0);
+	}
+
+	igt_describe("conflict, local first");
+	igt_subtest("conflict-local-first") {
+		int num_local = num_counters - 1;
+		int stream_fd;
+
+		igt_require(num_counters > 2);
+
+		igt_assert_eq(0, configure_counters(dev_local_1, false, num_local));
+		igt_assert_eq(0, configure_counters(dev_local_2, false, num_local));
+
+		stream_fd = configure_counters(dev_global, true, 2);
+		igt_assert_lt(stream_fd, 0);
+
+		/* release the reservation for dev_local_1: */
+		configure_counters(dev_local_1, false, 0);
+
+		/* should still fail: */
+		stream_fd = configure_counters(dev_global, true, 2);
+		igt_assert_lt(stream_fd, 0);
+
+		/* release the reservation for dev_local_2: */
+		configure_counters(dev_local_2, false, 0);
+
+		/* now should succeed: */
+		stream_fd = configure_counters(dev_global, true, 2);
+		igt_assert_lte(0, stream_fd);
+		close(stream_fd);
+	}
+
+	igt_describe("conflict, global first");
+	igt_subtest("conflict-global-first") {
+		int num_local = num_counters - 1;
+		int stream_fd;
+
+		igt_require(num_counters > 2);
+
+		stream_fd = configure_counters(dev_global, true, 2);
+		igt_assert_lte(0, stream_fd);
+
+		/* Should fail because two counters already allocated for global collection: */
+		igt_assert_neq(0, configure_counters(dev_local_1, false, num_local));
+
+		/* release global counters: */
+		close(stream_fd);
+
+		/* Now reservation should succeed: */
+		igt_assert_eq(0, configure_counters(dev_local_1, false, num_local));
+
+		/* release the reservations: */
+		configure_counters(dev_local_1, false, 0);
+	}
+
+	igt_describe("multiple groups");
+	igt_subtest("multiple-groups") {
+		const char *groups[] = {"CP", "SP"};
+
+		igt_require(num_counters > 0);
+
+		igt_assert_eq(0,
+			__configure_counters(dev_local_1, false, ARRAY_SIZE(groups), groups, 1));
+
+		/* release the reservations: */
+		configure_counters(dev_local_1, false, 0);
+	}
+
+	igt_describe("duplicate groups");
+	igt_subtest("duplicate-groups") {
+		const char *groups[] = {"CP", "CP"};
+
+		igt_require(num_counters > 0);
+
+		igt_assert_neq(0,
+			__configure_counters(dev_local_1, false, ARRAY_SIZE(groups), groups, 1));
+
+		/* release the reservations: */
+		configure_counters(dev_local_1, false, 0);
+	}
+
+	igt_fixture() {
+		igt_msm_dev_close(dev_global);
+		igt_msm_dev_close(dev_local_1);
+		igt_msm_dev_close(dev_local_2);
+	}
+}
-- 
2.55.0


