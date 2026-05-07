Return-Path: <linux-arm-msm+bounces-106546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJrLFq4X/WlLXgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 00:52:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C22E04EFF42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 00:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CB0B3082422
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 22:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548733D5234;
	Thu,  7 May 2026 22:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKPm5gka";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WcTOHfri"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CFF3D47DC
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 22:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194224; cv=none; b=nKU5Ksu5gJGCj8NHr3cX+kOYcEL4C8LvlVUe8zT6O0VTgrGFfjbRlvwewzlcq+re5N9x4wGrBR7W3aov+MqnOWxEaQZu5q+OyUqUOo8aAJq2w75YCFHpcZ7aYU0oPYT80gzb+qG8mXInHrPgWTyV97dLmG4arxOUJ02h0fio+uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194224; c=relaxed/simple;
	bh=tpFWk8SAVs3UFv/o3uYrm+TV/zcL6UrJjTCyzPTfeK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OH2sJ2GIRvyMPOmedw+1C/YRimSgFDWTv0uF5Qf8lbpSRLyPmyl9U9hOZMP1/6IbDFbfP3BBk/DuCDd37rlHpjmqoT92oN25zKJFyrGO3535AAcXynaysKjGJRDJO77ObwR2iu6Q5bNv7s3C3t+wQDhrVLb5MSlxzx9qMb/p0nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKPm5gka; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WcTOHfri; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647KwAwt2778219
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 22:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSAAlTqOMhQg/xg1nez/7uASR3nN13lqXsz4IVOsiYY=; b=nKPm5gkawbLOk5Z0
	ZqxmELOEv7QG8jjjc0nwUHYSDF7Ljg57YvUC917rGOJy8bZRwEk8NZ7ayR15fwJc
	D/Tw4qIHOuyJWpc84eg2BVvHYqThSh+3lAp0OSV+WaJW0kMdpfJwi/mXY/sztVQH
	6Es2aXaZGHJJz6RNDLgTKU5D5e5gnCLWewX99HaqbfBftlBpCWqqmoVA3IvpHUgd
	lkzag7ynbw3hT/KErl2s8UQ7LLYFgtra+KtAD0bUAqmfEc2XDDZhO9Y7IQw1aORT
	CuR9ZnV/Sb6tsG7LHUcbnkWgtRXMw5l83nViwA2tybgGa32HwFAXRb2kZlUN/Vlp
	mEMQXg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1285g96y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 22:50:21 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-62e66a6ee35so1310155137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 15:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194221; x=1778799021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSAAlTqOMhQg/xg1nez/7uASR3nN13lqXsz4IVOsiYY=;
        b=WcTOHfribNfV/QmSwO4gRzv2V8kTTFQbYjABM4DX7DvGdPTKMBgXj52TP0WlwrZ7n2
         OWXm3oqmxwnn6F2In9Jr6fQqCUO2JDiq6CpAjW9iyFGZn+OSasTBq0PZBDmL4Luxv/gt
         cZJ7u/TkQal2vQOXeH8yAuD9YzzpFnOwwHAG7Q4CBs0fWyTNfNiOazTBAdd9xuyxQkRH
         /iG4zAklvPejh+trHGL6lljeLSaeCmpDcwvF8E91KVKX70Z3QHOBoS1EBSkDX/DG9/nX
         qz0Ozwajw8iGem2IN4AxxZZ2GNSQqRGA8RiJvWoCV+OVwb/UVeXf7Jybs1naJjgE3Z73
         1R+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194221; x=1778799021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MSAAlTqOMhQg/xg1nez/7uASR3nN13lqXsz4IVOsiYY=;
        b=SgElKQ/7FrWSnmj0P0qkJ9xAjXGu8I/yJNYK2Pao2Z1orG6CVnnThhvwQtAzZlrBCb
         iYCzY6PiAHrgr8pnF47lpTpGZ0Jq7lbh9gg9wNMSf4khR8jmbgZlx/5pCmBit0xWMNOu
         zuVNPJBRMucMiJevQdlNsZMIfm+UpGUdMR1hF7/G1kvdnC0p9Idj+dcW8k2EHgQEjRkI
         3IE7kku7C4gkKC9/ZolumV0Ztn5Ra2QXNornaQrxIOIcpA7AjEgJEsYs1H5z2K78PUK+
         rZejUndVBkOWOnzGhGa5Jy4XUaJusqYUh6NJw2MWhep63rTpvJkQ9TQK8tb31d//g17t
         SjQw==
X-Forwarded-Encrypted: i=1; AFNElJ/jOqoZNUOjy1rEQScpbt4ACxslZ9b0wkx7JQynmPxUgIIZ8xwsUhnzQ9ZjGpqD6WQOnpSo5dpLn3erECaI@vger.kernel.org
X-Gm-Message-State: AOJu0YzAHTgS5Gc+8mHkOzWyRsReF22qnZAuXWpFYwHRnOI92xjVcyMr
	ucdki/YjrRVGxpIMooAAeBcVWpIcFx3FzvOYIo5zMpmvaRl7292NTN/tiocmf8zJxSpUlVs1OTO
	GNBxQkHeRWi79hRhJEMQgiqQZzFhnGWJw0eDxoDHNMi0Cy2etv7Ng4GAKPf7l8Psrjp/y
X-Gm-Gg: AeBDiesHDyfGm+QHsq1+HrbRydMOXMgnYesEDAmT527clVRqlKyFsJXB59ipvNsPOlE
	chySL1rvnYWcqN4Y6JYQPNIqzVo0ombuYstQJftA1uzGI1AtDPpsrdaGHnpTaZGcbb1qfzbi0IA
	+Gs0Whm350gGMY6A3Y25NGSK2Ai54O18FyTM8dRdoc0itthepjVLWzyfii1U3/bzCVYK+UhVhO1
	BdmndoPQDvtZh1wh/ZeQXdMCqeYZBZnQJrYIQ1Jq7UKWeFtxcZuEklic+4IxChPvn9x0ubEgXiN
	Ysz74dGPCuc8vNn+WOPC+iakJoWRK9X3Q1SuP8CAaHEcrSM4HFz0Xc0NWSddtDwqK8b3EzcKyQo
	P1YLRRe4KOjIr4zGvRdnLhQ65HWUL7hU5dMjjwMZZAVReB+YwVUBqFmgPhl6MyTWKdm7pKNTLFK
	qLpbpLMIHrbTfc+WuX
X-Received: by 2002:a05:6102:8499:10b0:631:28c1:155c with SMTP id ada2fe7eead31-63128c11e98mr1893172137.7.1778194220486;
        Thu, 07 May 2026 15:50:20 -0700 (PDT)
X-Received: by 2002:a05:6102:8499:10b0:631:28c1:155c with SMTP id ada2fe7eead31-63128c11e98mr1893159137.7.1778194220003;
        Thu, 07 May 2026 15:50:20 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:18 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:20 +0200
Subject: [PATCH v3 05/15] media: qcom: camss: Add camss-isp-sched helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260508-camss-isp-ope-v3-5-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMSBTYWx0ZWRfX+V1laax4aYTh
 qWz9YNOJzOcPOyF0zRuoBz99aQbgNLE+CzP0VbCxj8+s1+bv+IUorMAJ+oQevb8ztwNozSpWLsw
 UofqzgeVzfNJK08L2AUTRD6Bvg6bs9sg2UsF2DfIOOlGgyG0gkMjRrt6k7YDrYY+xxBXADr+DRe
 tXpu6KJYl27zaoCjkzjSGkAAEr50TAemr+Eq2wkOUXI3wGx8KThAuBkTvzdgzcN3UD/jaZg/I7K
 MzPiil6puGNr32Sqjuja56eilXUjO2pBEaX9EhtAGmXFOOTo0UP8tZRgitKvVpunoXR6x5uZSzW
 7rk/Hyo/vGBz67+HgtB5SFILDdA1QVrSDo0EWpzCuvgDfS2B4n3c/OlBY3aO81+6vK3TaUJz9lh
 XR64Pc15LfiTWQxsVFZ8zwklfL97h8z+s8d/WYhq9qcG4mIRGYfvt1HhHChoUFm3zaqw+xUalFX
 Ercj1dhSV+o4uNKY5NQ==
X-Proofpoint-GUID: VwcPddSUs0lP-7s81Hrf9ct-Cryund19
X-Proofpoint-ORIG-GUID: VwcPddSUs0lP-7s81Hrf9ct-Cryund19
X-Authority-Analysis: v=2.4 cv=NKblPU6g c=1 sm=1 tr=0 ts=69fd172d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=LvVHALaGuq2LPpMeDEoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070231
X-Rspamd-Queue-Id: C22E04EFF42
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106546-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add a job scheduler for CAMSS offline ISP drivers which serialises
job execution, tracks which context is currently running on hardware,
and provides cancel/suspend/resume operations. Jobs carry optional
ready/run/abort callbacks via camss_isp_job_ops, allowing the
scheduler to gate submission on hardware and buffer availability.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   3 +-
 .../media/platform/qcom/camss/camss-isp-sched.c    | 223 +++++++++++++++++++++
 .../media/platform/qcom/camss/camss-isp-sched.h    | 174 ++++++++++++++++
 3 files changed, 399 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index bfc05db0eada1d801839ceb8a3b157baae613053..f13c9f326cf81962bd165dc8dd2bb60207cd54a7 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -30,7 +30,8 @@ qcom-camss-objs += \
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
 
-qcom-camss-isp-objs := camss-isp-bufq.o
+qcom-camss-isp-objs := camss-isp-bufq.o \
+		camss-isp-sched.o
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS_ISP) += qcom-camss-isp.o
 
diff --git a/drivers/media/platform/qcom/camss/camss-isp-sched.c b/drivers/media/platform/qcom/camss/camss-isp-sched.c
new file mode 100644
index 0000000000000000000000000000000000000000..6940087f94d00570a82666e882ffc8b38891736b
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-isp-sched.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * CAMSS ISP scheduler helper — ISP job scheduling
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/slab.h>
+#include <linux/module.h>
+
+#include "camss-isp-sched.h"
+
+/* Job state flags */
+#define ISP_JOB_QUEUED		BIT(0)
+#define ISP_JOB_RUNNING		BIT(1)
+#define ISP_JOB_ABORT		BIT(2)
+
+/* Scheduler flags */
+#define ISP_SCHED_PAUSED	BIT(0)
+
+/* -------- Internal helpers -------- */
+
+static void isp_sched_try_run(struct camss_isp_sched *sched)
+{
+	void (*run_fn)(void *priv, bool ctx_changed);
+	struct camss_isp_job *job;
+	unsigned long flags;
+	bool ctx_changed;
+	void *priv;
+
+	spin_lock_irqsave(&sched->lock, flags);
+
+	if (sched->curr_job || list_empty(&sched->pending) ||
+	    (sched->flags & ISP_SCHED_PAUSED)) {
+		spin_unlock_irqrestore(&sched->lock, flags);
+		return;
+	}
+
+	job = list_first_entry(&sched->pending, struct camss_isp_job, queue);
+	job->flags |= ISP_JOB_RUNNING;
+	sched->curr_job = job;
+	run_fn = job->ops ? job->ops->run : NULL;
+	priv   = job->priv;
+	ctx_changed = (sched->prev_job != job);
+
+	spin_unlock_irqrestore(&sched->lock, flags);
+
+	run_fn(priv, ctx_changed);
+	sched->prev_job = job;
+}
+
+static void isp_sched_work(struct work_struct *work)
+{
+	struct camss_isp_sched *sched =
+		container_of(work, struct camss_isp_sched, work);
+
+	isp_sched_try_run(sched);
+}
+
+/* -------- Public API -------- */
+
+void camss_isp_sched_init(struct camss_isp_sched *sched)
+{
+	sched->curr_job = NULL;
+	sched->prev_job = NULL;
+	INIT_LIST_HEAD(&sched->pending);
+	spin_lock_init(&sched->lock);
+	INIT_WORK(&sched->work, isp_sched_work);
+	sched->flags = 0;
+}
+EXPORT_SYMBOL_GPL(camss_isp_sched_init);
+
+void camss_isp_sched_destroy(struct camss_isp_sched *sched)
+{
+	cancel_work_sync(&sched->work);
+}
+EXPORT_SYMBOL_GPL(camss_isp_sched_destroy);
+
+void camss_isp_job_init(struct camss_isp_job *job,
+		       const struct camss_isp_job_ops *ops,
+		       void *priv)
+{
+	INIT_LIST_HEAD(&job->queue);
+	job->flags = 0;
+	job->ops   = ops;
+	job->priv  = priv;
+	init_waitqueue_head(&job->finished);
+}
+EXPORT_SYMBOL_GPL(camss_isp_job_init);
+
+void camss_isp_sched_try_run(struct camss_isp_sched *sched,
+			     struct camss_isp_job *job)
+{
+	unsigned long flags;
+
+	if (job->ops && job->ops->ready && !job->ops->ready(job->priv))
+		return;
+
+	spin_lock_irqsave(&sched->lock, flags);
+
+	if (job->flags & (ISP_JOB_ABORT | ISP_JOB_QUEUED | ISP_JOB_RUNNING)) {
+		spin_unlock_irqrestore(&sched->lock, flags);
+		return;
+	}
+
+	list_add_tail(&job->queue, &sched->pending);
+	job->flags |= ISP_JOB_QUEUED;
+
+	spin_unlock_irqrestore(&sched->lock, flags);
+
+	isp_sched_try_run(sched);
+}
+EXPORT_SYMBOL_GPL(camss_isp_sched_try_run);
+
+void camss_isp_sched_job_finish(struct camss_isp_sched *sched,
+				struct camss_isp_job *job,
+				bool requeue)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&sched->lock, flags);
+
+	if (sched->curr_job != job) {
+		/*
+		 * curr_job may have been cleared by a racing cancel/streamoff.
+		 * If this job is still marked RUNNING, clear it and wake any
+		 * waiter in camss_isp_sched_cancel() so it can unblock.
+		 */
+		if (job->flags & ISP_JOB_RUNNING) {
+			job->flags &= ~(ISP_JOB_QUEUED | ISP_JOB_RUNNING);
+			wake_up(&job->finished);
+		}
+		spin_unlock_irqrestore(&sched->lock, flags);
+		return;
+	}
+
+	list_del(&job->queue);
+	job->flags &= ~(ISP_JOB_QUEUED | ISP_JOB_RUNNING);
+	wake_up(&job->finished);
+	sched->curr_job = NULL;
+
+	if (requeue && !(job->flags & ISP_JOB_ABORT)) {
+		job->flags |= ISP_JOB_QUEUED;
+		list_add(&job->queue, &sched->pending);
+	}
+
+	spin_unlock_irqrestore(&sched->lock, flags);
+
+	schedule_work(&sched->work);
+}
+EXPORT_SYMBOL_GPL(camss_isp_sched_job_finish);
+
+void camss_isp_sched_cancel(struct camss_isp_sched *sched,
+			    struct camss_isp_job *job)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&sched->lock, flags);
+	job->flags |= ISP_JOB_ABORT;
+
+	if (job->flags & ISP_JOB_RUNNING) {
+		spin_unlock_irqrestore(&sched->lock, flags);
+		if (job->ops && job->ops->abort)
+			job->ops->abort(job->priv);
+		wait_event(job->finished, !(job->flags & ISP_JOB_RUNNING));
+	} else if (job->flags & ISP_JOB_QUEUED) {
+		list_del(&job->queue);
+		job->flags &= ~(ISP_JOB_QUEUED | ISP_JOB_RUNNING);
+		spin_unlock_irqrestore(&sched->lock, flags);
+	} else {
+		spin_unlock_irqrestore(&sched->lock, flags);
+	}
+
+	/* Clear abort flag so the job can be reused after cancel */
+	spin_lock_irqsave(&sched->lock, flags);
+	job->flags &= ~ISP_JOB_ABORT;
+	spin_unlock_irqrestore(&sched->lock, flags);
+}
+EXPORT_SYMBOL_GPL(camss_isp_sched_cancel);
+
+void camss_isp_sched_suspend(struct camss_isp_sched *sched)
+{
+	struct camss_isp_job *curr;
+	unsigned long flags;
+
+	spin_lock_irqsave(&sched->lock, flags);
+	sched->flags |= ISP_SCHED_PAUSED;
+	curr = sched->curr_job;
+	spin_unlock_irqrestore(&sched->lock, flags);
+
+	if (curr)
+		wait_event(curr->finished, !(curr->flags & ISP_JOB_RUNNING));
+}
+EXPORT_SYMBOL_GPL(camss_isp_sched_suspend);
+
+void camss_isp_sched_resume(struct camss_isp_sched *sched)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&sched->lock, flags);
+	sched->flags &= ~ISP_SCHED_PAUSED;
+	spin_unlock_irqrestore(&sched->lock, flags);
+
+	isp_sched_try_run(sched);
+}
+EXPORT_SYMBOL_GPL(camss_isp_sched_resume);
+
+bool camss_isp_sched_is_running(struct camss_isp_sched *sched,
+				struct camss_isp_job *job)
+{
+	unsigned long flags;
+	bool running;
+
+	spin_lock_irqsave(&sched->lock, flags);
+	running = (sched->curr_job == job);
+	spin_unlock_irqrestore(&sched->lock, flags);
+
+	return running;
+}
+EXPORT_SYMBOL_GPL(camss_isp_sched_is_running);
+
+MODULE_DESCRIPTION("CAMSS ISP job scheduler");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/qcom/camss/camss-isp-sched.h b/drivers/media/platform/qcom/camss/camss-isp-sched.h
new file mode 100644
index 0000000000000000000000000000000000000000..5b6034976de65be57581ccaa92d1f15d7cb4a688
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-isp-sched.h
@@ -0,0 +1,174 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * CAMSS ISP scheduler helper — ISP job scheduling
+ *
+ * Tracks which context is currently running on the hardware and
+ * serialises job execution. This is a pure helper: it has no knowledge
+ * of buffers, vb2 queues, or the uAPI.  Drivers call these functions
+ * explicitly from their own code paths.
+ *
+ * Usage pattern:
+ *   - Embed struct camss_isp_sched in the driver's device struct.
+ *   - Call camss_isp_sched_init() at probe time.
+ *   - Call camss_isp_job_init() with ready_fn/run_fn/abort_fn/priv.
+ *   - Call camss_isp_sched_try_run() from buf_queue / streamon to start jobs.
+ *   - Call camss_isp_sched_job_finish() from the IRQ handler when done.
+ *   - Call camss_isp_sched_cancel() from streamoff / release.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _CAMSS_ISP_SCHED_H
+#define _CAMSS_ISP_SCHED_H
+
+#include <linux/list.h>
+#include <linux/spinlock.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+
+/**
+ * struct camss_isp_job_ops - per-job operation callbacks
+ *
+ * @ready:  Optional; return %true if the job can be submitted to hardware.
+ *          Called outside the scheduler spinlock.  May be NULL (always ready).
+ * @run:    Start the hardware for this job.  Called from workqueue context.
+ *          @ctx_changed is %true when this job differs from the previously
+ *          run job (i.e. first run ever, or a different context took over).
+ * @abort:  Optional; abort a running job (e.g. trigger a HW reset).
+ *          Called from process context during camss_isp_sched_cancel().
+ *          May be NULL.
+ */
+struct camss_isp_job_ops {
+	bool	(*ready)(void *priv);
+	void	(*run)(void *priv, bool ctx_changed);
+	void	(*abort)(void *priv);
+};
+
+/**
+ * struct camss_isp_job - per-context scheduler state
+ *
+ * Embed one of these in the driver's per-context struct.
+ * Initialise with camss_isp_job_init().
+ *
+ * @queue:     Entry in the scheduler's pending-job list.
+ * @flags:     Internal state flags (ISP_JOB_*).
+ * @finished:  Wait queue signalled when the running job completes.
+ * @ops:   Job operation callbacks (ready/run/abort).
+ * @priv:  Opaque pointer passed to all callbacks.
+ */
+struct camss_isp_job {
+	struct list_head	queue;
+	unsigned long		flags;
+	wait_queue_head_t	finished;
+	const struct camss_isp_job_ops *ops;
+	void			*priv;
+};
+
+/**
+ * struct camss_isp_sched - ISP job scheduler
+ *
+ * Embed one of these in the driver's device struct.
+ * Initialise with camss_isp_sched_init().
+ *
+ * @curr_job:    Job currently running on hardware (NULL if idle).
+ * @prev_job:    Job that ran most recently (never dereferenced, pointer only).
+ * @pending:     List of jobs waiting to run.
+ * @lock:        Protects @curr_job, @pending, and @flags.
+ * @work:        Work item used to run jobs from non-atomic context.
+ * @flags:       Scheduler-level flags (ISP_SCHED_PAUSED).
+ */
+struct camss_isp_sched {
+	struct camss_isp_job	*curr_job;
+	struct camss_isp_job	*prev_job;
+	struct list_head	pending;
+	spinlock_t		lock;
+	struct work_struct	work;
+	unsigned long		flags;
+};
+
+/**
+ * camss_isp_sched_init() - initialise a scheduler
+ * @sched: scheduler to initialise
+ */
+void camss_isp_sched_init(struct camss_isp_sched *sched);
+
+/**
+ * camss_isp_sched_destroy() - destroy a scheduler (waits for any running job)
+ * @sched: scheduler to destroy
+ */
+void camss_isp_sched_destroy(struct camss_isp_sched *sched);
+
+/**
+ * camss_isp_job_init() - initialise per-context job state
+ * @job:  job to initialise
+ * @ops:  operation callbacks (run is required; ready and abort may be NULL)
+ * @priv: opaque pointer passed to all callbacks
+ */
+void camss_isp_job_init(struct camss_isp_job *job,
+		       const struct camss_isp_job_ops *ops,
+		       void *priv);
+
+/**
+ * camss_isp_sched_try_run() - enqueue a job and try to start it
+ * @sched: scheduler
+ * @job:   job to enqueue; callbacks and @priv are taken from the job.
+ *
+ * Calls @job->ready_fn (if set); returns immediately if it returns %false.
+ * Otherwise enqueues the job and starts it if the hardware is idle.
+ * Safe to call from atomic context.
+ */
+void camss_isp_sched_try_run(struct camss_isp_sched *sched,
+			     struct camss_isp_job *job);
+
+/**
+ * camss_isp_sched_job_finish() - signal that the current job has completed
+ * @sched: scheduler
+ * @job:   job that just finished (must be the currently running job)
+ * @requeue: if %true and the job's ready_fn passes, immediately re-enqueue
+ *           the job so the next frame starts as soon as the workqueue runs.
+ *
+ * Clears the running state, wakes any waiter in camss_isp_sched_cancel(),
+ * and schedules the next pending job via the work queue.
+ * Safe to call from atomic/IRQ context.
+ */
+void camss_isp_sched_job_finish(struct camss_isp_sched *sched,
+				struct camss_isp_job *job,
+				bool requeue);
+
+/**
+ * camss_isp_sched_cancel() - cancel a pending or running job and wait
+ * @sched: scheduler
+ * @job:   job to cancel; @job->abort_fn is called if the job is running.
+ *
+ * If the job is queued but not yet running, it is simply removed.
+ * If the job is running, @job->abort_fn is called (if set) and the
+ * function blocks until camss_isp_sched_job_finish() is called.
+ * Must be called from process context (may sleep).
+ */
+void camss_isp_sched_cancel(struct camss_isp_sched *sched,
+			    struct camss_isp_job *job);
+
+/**
+ * camss_isp_sched_suspend() - pause the scheduler and wait for current job
+ * @sched: scheduler
+ *
+ * No new jobs will be started until camss_isp_sched_resume() is called.
+ * Blocks until any currently running job finishes.
+ */
+void camss_isp_sched_suspend(struct camss_isp_sched *sched);
+
+/**
+ * camss_isp_sched_resume() - resume the scheduler
+ * @sched: scheduler
+ */
+void camss_isp_sched_resume(struct camss_isp_sched *sched);
+
+/**
+ * camss_isp_sched_is_running() - check if a job is currently running
+ * @sched: scheduler
+ * @job:   job to check
+ */
+bool camss_isp_sched_is_running(struct camss_isp_sched *sched,
+				struct camss_isp_job *job);
+
+#endif /* _CAMSS_ISP_SCHED_H */

-- 
2.34.1


