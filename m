Return-Path: <linux-arm-msm+bounces-104721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNK/EVpb72mWAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:49:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDD0472C2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EBA83022932
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56823B9DA6;
	Mon, 27 Apr 2026 12:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eLF8F5PU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PyyL++1a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590053BD22C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294010; cv=none; b=pHPQQhEyy9CU9mwQNOkxVFijvXEdle4ieNEHIMfBcAiZcPM/mUjwU+l5gQnKawFULtbSofQy6vMqtqUExzHNENt5sJ5twYxcSS0x6FeAY6SE66ehlV2wpkMRaw7ijBpsFTi3GobH+W+NEnkMP91i4tBCeGwnmH7v5cl6Y5PPrP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294010; c=relaxed/simple;
	bh=tpFWk8SAVs3UFv/o3uYrm+TV/zcL6UrJjTCyzPTfeK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NnFXicrBajD3zMGcc7/EjW+ZdMxXcsPIQu27epyc8YzhMjCJyXtBdqOyJN7fg8KOJHVxQKNtJFSM64OpM+Csxl6lIhRTFKha2GDTTXZxvbQyW8w2WwV5ZKpRPihXHXnV5vCaxoQT0Rzqi+rUUHp/1ArBS9W1Bo9p1NJKyqASXJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eLF8F5PU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PyyL++1a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RA3nm33123502
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSAAlTqOMhQg/xg1nez/7uASR3nN13lqXsz4IVOsiYY=; b=eLF8F5PUgIlyjlqU
	wU96H/fNTLCKWqK2P7rDL9L+IcjBLEe4hw/8WTX2A1zeerd+A7exH+Bz5Aaqevhx
	jPF+1wApxwdiWmL7XFcheqdYAfRmpgnw09ecyE9BYV0bqcXBfS3TxcvIrHYxdukF
	2YF2he00UUyeAKxtiw0XQk6nuwdcUttcyaN9VbM/JSSoK9VLmfyenyYoYjFQ2nwg
	Ax9m/4RkF4v1gEU7AtrNgS+6+fEcbiJ97rMg+G9HIRtd3aIM5DpaX1X4+GUhCTuj
	2OkFsen9lSAUBbYOFTXrcLQ9uT46kDcF+36ncGi2QvIcgi0M+IlgfZCcyom4yZ1/
	oSltUw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgghr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d826ed6f9so134314641cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 05:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294007; x=1777898807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSAAlTqOMhQg/xg1nez/7uASR3nN13lqXsz4IVOsiYY=;
        b=PyyL++1ayb6oGpeanS9EqfjbrskNY6HppWVqwIY6/68SQsoCtoTrpn2rnghh7y+7Yr
         QFwg/4iOLcvTRBiUUEAQIPdqkHRBwJ+JpKwbsVJAnIzOsieilBGRplTj9mUI2XYRvkCK
         nDdnISvsng/8Gn78wYwtfviAffWXwbDUnOql9V/vdByese89nTGsz7yqO+h2cKBFQ0Ji
         VvKgYUDzMsndpCzg7rX7Derv1BGB/Jgod5ugU1yWi8+92+8/YP7MHhLFqPUOd52hZEQY
         uXmnj9k/+Yig+yaSnirct2fNy+mUqElhy2hjbTiRnZqo2j77xsZO8DlY7oZC1X8hgTUD
         VrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294007; x=1777898807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MSAAlTqOMhQg/xg1nez/7uASR3nN13lqXsz4IVOsiYY=;
        b=lNTWeNS4i4w2Ba4NPYgn4J0AfiSJjAOdvsMlfTlfVeNZY4Zi7iB6jjkrVhSsozO/Uh
         +BXA40COL/Ck35w94AqjnDILLRAU9PdnBms/VOAoLJJmOD06iBRAIDgRPiK6V+t5gK2e
         ++hgT7Raf4O7k6pmbc/mRitCHSw9sxoyWFlFXhrdvStNW7i2kg9pOJ/sn7hH7s7ZkxBi
         9nH3jJt5Y18t1Vfg5dTjIcN15DQXA12LYNwqSB8nUufv8CC/vNtNLTht+NnxDPRicGHI
         RQizEGlNcBwwoNTMwBHDOo77wtOQszTSmIm6kdePx6wksGHFaYcAGM7Bc+cdvRUnqByQ
         KDHw==
X-Forwarded-Encrypted: i=1; AFNElJ9iBc7CCdeQ9wvqEVRkzIitr1VGh8oARI/lUzQr9KDeEgsH0jTyuNuROAJ1K8RadZTdKJu2TAz6GMljS5bW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw03uWN9IavZNcnIB4XLndURBUn39n4HZpuoohJNzMzFztvklNc
	3bMjbGZev0r9YZph0Ccrg3vl9ZnS4Wp0WwLMYcmbq8boGeeAllRaLsTrr4fXb4ZK2ULKQU+0+3U
	lZeDMnQAvz9CAR7ApV6P9TGT4lebOYVNtKspQfvBABucEPftQ4votllAOYqA+RwxW1mDz
X-Gm-Gg: AeBDietg41mS981LcOusxHVkKnHDIMwkUz3lzlX0tUDDiG6L2vwcyxiOgyAV4P3dAgR
	o5sA/hQW2XB0uhTC0dcDCUFUwmllBjs2j60YQSyXKdvjG/7ed3PG5VwY8gPMT1VKksL6z3EPyFQ
	xMDrU9QAijB0H+CWowsLjfRiX/3O4FiyNL88btZHqzBpfwGIyqmPWwsjgF1ewKbq1SmS1PukSyD
	a1RLxBxecXGaI5sermU9lVpI76zdN5n4zpwI4A/ruw88amVZCsa1Ez8uBTZSO24pywTr8IiZbdR
	4JxmzB8koAW94lFwdg4aE8TvEZ7h6lw9ysdZVqsldJDM2mxAftVqC8lSoSSxqqM0eR3QTgQysqJ
	nnk35j3YJcQHdjUxFCdiQbBvgf0PfFFVAseAri80AmpNDdLE1l8o81AZ78l8/pGownBJ2QXqq2i
	TETNZpr6qzIB4o4IRVNedakTqnGkE=
X-Received: by 2002:a05:622a:d14:b0:50d:af03:c9ca with SMTP id d75a77b69052e-50e367b5588mr467378481cf.38.1777294006432;
        Mon, 27 Apr 2026 05:46:46 -0700 (PDT)
X-Received: by 2002:a05:622a:d14:b0:50d:af03:c9ca with SMTP id d75a77b69052e-50e367b5588mr467378001cf.38.1777294005912;
        Mon, 27 Apr 2026 05:46:45 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:45 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:33 +0200
Subject: [PATCH v2 06/14] media: qcom: camss: Add camss-isp-sched helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-camss-isp-ope-v2-6-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
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
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfXyk1KJGkwXy9p
 pfT+jJa8uZepQksuNCxsMYwCwxqqiXyEvFNFBTG2zTRndkC4FoIXwT8tHsGGkYkx5UAqIpmnkHB
 Zmk4rsOkVjvdupHrl9JN44YxJcnXjk/NCPzK2Kh6D4vKNWzm2ldJtweHECpHIF0rzZMsIO4VD2c
 PtouicvVNUyAjXRiLpxFoNg9cCDWtiPsuVeJJC9DbgxJP1rIFlZjgnW0LCpktZ7diWEtXBRuINC
 1nDsUg3I90IJVUA84ECO3StRYHnn4a4p6jDyBCN746rFkBvgCtGrRwEbCjx+WxZRIusBNDN5bOp
 65CdH5/ok8998YeKwpJsuG2+d1SCa3PK3US5sKt1e3CxHoOFfOVdHGDy/YaGuh4v1pXNA2Z55jg
 wIuNM0sMH+H5TJOX5GAtILKHWoexNKMaAEjNfJkM9Xbebola7GP4JECs/mv5EUnKw90SZRhK9Nf
 GM4ILqhYwC4N5pcZo8Q==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69ef5ab7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=LvVHALaGuq2LPpMeDEoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: TlVyR82xau10RPC0DskGpMhNxpZZP4lJ
X-Proofpoint-ORIG-GUID: TlVyR82xau10RPC0DskGpMhNxpZZP4lJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270135
X-Rspamd-Queue-Id: DCDD0472C2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-104721-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

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


