Return-Path: <linux-arm-msm+bounces-98039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIINOxWHuGndfQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 23:41:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A722A1A34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 23:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1769830952C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 22:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA661372EE2;
	Mon, 16 Mar 2026 22:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nE24yi+A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cg3YIENJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A57372ECB
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 22:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773700753; cv=none; b=uL0o2Yom7T++1SwECbgEXC8/06/cTf0kHz1ShHjGGMCNztWq6TSfCFW/mVmjK/2pO++wfrzu2xwj/O/BcIActpmbiIfDERiEntAz3GQKj3Wqxrs38Wcn/W5YS2mSHd9yNKnV4ZI3BJ80jsK4ag0CdG66Vfph8vpjrEM5ByWu6bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773700753; c=relaxed/simple;
	bh=Twp7Nz7xLRYF7/mEhhf6UKxXI0LmdBklYei7YIRbHv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6PP9rqKyy8IE2+UPYj2dowFiHzJcNREnRvxlmwcECCUMeWpBl7y2ciHMriBtBdArWF6/WCPux3SKZbY9GKGVXaT3n+Re3MEZ8FHEdaxQY4KRb2UVMEQmqIjc4cbyg7Fvh4L+V6Pq+LkVOTwpepVbzDYxVzjxJfTzuiqYCLJnUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nE24yi+A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cg3YIENJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GEg6Ba3295184
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 22:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RUqvixG5Wks
	FkWvaUmguT5wloH9h3qhuAtu4mv/i960=; b=nE24yi+AyoZ/YThQsSaCF1IF2Cw
	XbsrUSrLpTKMf7T4+++m6qxsn1F+sJMeUldisbR4LMOfV4tLuuUme+JQ0HLzPdx/
	Jp1Atik3pmeixNshyzxMjvClsPMIaiysy9S5CwZuSYH2La1o+RwT98H2Kb9qSA+u
	LDWcM8Q/ilSk1C/jvN2fMXn2qtCV238vAzhbvUlJ9KPLyWj+ApLCiS1n3qc4VTVX
	tx7ip3JELmUvZFVjmjhh74Cho6gge30+0C7gpFJE0rq9hxklkMbGXSn+7HeTNLfd
	p2rLvrNyjHDxt1pH6acqJc2EJtldPQgZTc90s14txEvCFQmdu0CtbyphD3g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy1fbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 22:39:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358e425c261so5904614a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 15:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773700743; x=1774305543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUqvixG5WksFkWvaUmguT5wloH9h3qhuAtu4mv/i960=;
        b=Cg3YIENJErnD8dEp2BY2nQChbZow7CCKoqrgu+Oq2wNv7qR0nLDMqBLNxYwYdaZyfO
         rx6xP4PLj1dnJCdhLmTDjhi5MBgvrM5VI3+lcUtOwkGocFKi9/61XkUEsx9gn01AhzFm
         h+IA98ebAFlD3YqFFfMLZ8NZ8EO1ZyXsxyUlvOWHtPxdZGHtpbj22OtYD1nPqBhpJJaX
         VNUPpcmbSCCdq/E1HwM65ht8ImKs1J6Ff9hncVIPw48ZQZLSKmKUHx6cst4y8py5CGEG
         zY6hnXOgxoC4m0XZvA5Och58tdM5HMA1HTT+qksaiJfGTCLalE28yHFKmBciAzsQX7dk
         2IOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773700743; x=1774305543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RUqvixG5WksFkWvaUmguT5wloH9h3qhuAtu4mv/i960=;
        b=aNaqSzAifC6prwWdy6BmeKBy2WfG9rdYJqlcKtIAeW0M1u41XFUjzTPDa2HDqmnOY7
         neHHK6VEWtddVWaSiNqGVX0uE75PqX8thmpqNRQPnJ6wptJ5/Tcmb343xN60TBPUXDbD
         SIvT/qSH5NS1KrvLiwlzNeuGKN2IFp4k6/wqGXu0B5g6vWFV28zyLDU7F6TLIGn5tnSL
         l+aJ0+48tWBSEK/guCcghhwfS7TzZY8k5LqBkAgQXfXn8ZLc3H5WdO/t53KVypyhiCfB
         Ux6rMru74Z0VjMGLO8qR59h8MWWbK/Pevxz68hk1Hg2ox34+zbrOj2XtNZMf839GPVjU
         MO2w==
X-Gm-Message-State: AOJu0Yyqck1Z9NhkwIlkO3fzq0PAF+h+i/hUR5IRtHDCmWv/qLVBVkni
	6A9nHrX0jj6njxP4kXTowTCfTRSWcMKygXXmyJbiFmsJ94WKVxKrn5bnHhr1I6fum5GCv8x9Dgz
	JVvsfR3etd0WVyYTibD8bbhWptOcd5a1JrEtbVk8WtlpFrCkQH1i0e9UGZpVBsGbZ/8TO
X-Gm-Gg: ATEYQzwh62q+8UWRZ0Qjze5XNTyfSQaNI2zlazJJokVJwF3IjLDoE+esRMkLcgQu30v
	DiPRtViYhgjJXteQVdqW80q+QKZExwA1MFkUkHlEd8yKE5t/vnQRPwWfwr0xKSGDiTjzDDlVe3u
	NcyqAtNnUQwp8adZ8T/nm78icg3/JGHLaeOpU8wcVz97e2GLctrSSTpEduB2ohAy8PpxmzsquSy
	zwZMYBHO33dVivuj+ePaBWaQKRqB9p9tTMbJVu4qv56h1qmG1THEjEbp07bim3WVs06PDudZ9KB
	MSJ33DXo55ucMe4JuV088TbhY795iLGWaDLcuQXmywQzGbAocUuLb0meqPvMKbkxuHd0GubhvGE
	RLUZK74w7lZxo7zY7P6/sUloTg/uDLbKl
X-Received: by 2002:a17:90b:5828:b0:359:ff8a:ee47 with SMTP id 98e67ed59e1d1-35a21e1c7b6mr13704163a91.6.1773700743254;
        Mon, 16 Mar 2026 15:39:03 -0700 (PDT)
X-Received: by 2002:a17:90b:5828:b0:359:ff8a:ee47 with SMTP id 98e67ed59e1d1-35a21e1c7b6mr13704145a91.6.1773700742801;
        Mon, 16 Mar 2026 15:39:02 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bad8b5cdesm723408a91.0.2026.03.16.15.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 15:39:02 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [RFC 1/2] drm: Add sysrq key to kill current job on GPU
Date: Mon, 16 Mar 2026 15:38:49 -0700
Message-ID: <20260316223855.711574-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316223855.711574-1-robin.clark@oss.qualcomm.com>
References: <20260316223855.711574-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b88688 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=qvQf7nBXRcI791bLINIA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE4NyBTYWx0ZWRfX0YVs1rewmcY0
 FCC7BmJ4ix90UtfZ5SqKqrsQ3Vrav6ouz+FTxRbLa9xAVb2vitBiBBbg+ayaJONEilSwOyIumYa
 Qbyq2jbDGi52s3qt/O41YE0rJR1froW6z+zV0Msln7hK8kryskitJmmWK4RAtUYFNLmxEwsh/CM
 sGqz9w7eRgQybmUJNe7zNugP9FYqhtuYry26Gg74nWGp9UtqaS2F23LJQ0vMXKh2yFG0YIFlxxW
 GPGTgnIasArnUlLVWZ2VTGbXrYMgeezmvWk5oSRh69EgJwm+TkhT6iY7jrM7eCw0yGIm+DS+bCJ
 eblFPLzeswSe8BROo/bhUl8noYMGSCEsfiEcKSkePw8yu98vYAkEz+kLjS6seUbHg2VgDDenMOT
 XsILWlCyFv2mF2dBLIJOyBH+W61PdiW0sRi0Or6cRFPpn84C33xDoghwp96aQxdAAV3l1fe5gHq
 hj8rw/oJqAenxebFJdQ==
X-Proofpoint-ORIG-GUID: NnamXHm5U4apyMV5VF9ySc0Aoo4e6v1r
X-Proofpoint-GUID: NnamXHm5U4apyMV5VF9ySc0Aoo4e6v1r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_06,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160187
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-98039-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 51A722A1A34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If your compositor is getting starved for GPU time, it is useful to have
a way to kill the current thing that is hogging the GPU.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/Makefile        |  1 +
 drivers/gpu/drm/drm_dev_sysrq.c | 67 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_drv.c       |  3 ++
 drivers/gpu/drm/drm_internal.h  | 11 ++++++
 include/drm/drm_device.h        |  8 ++++
 include/drm/drm_drv.h           |  7 ++++
 6 files changed, 97 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_dev_sysrq.c

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 0e1c668b46d2..337af859753f 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -44,6 +44,7 @@ drm-y := \
 	drm_colorop.o \
 	drm_connector.o \
 	drm_crtc.o \
+	drm_dev_sysrq.o \
 	drm_displayid.o \
 	drm_drv.o \
 	drm_dumb_buffers.o \
diff --git a/drivers/gpu/drm/drm_dev_sysrq.c b/drivers/gpu/drm/drm_dev_sysrq.c
new file mode 100644
index 000000000000..47e029b7cd0b
--- /dev/null
+++ b/drivers/gpu/drm/drm_dev_sysrq.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+#include <linux/sysrq.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_print.h>
+
+#include "drm_internal.h"
+
+#ifdef CONFIG_MAGIC_SYSRQ
+static LIST_HEAD(drm_dev_sysrq_dev_list);
+static DEFINE_MUTEX(drm_dev_sysrq_dev_lock);
+
+/* emergency restore, don't bother with error reporting */
+static void drm_dev_sysrq_restore_work_fn(struct work_struct *ignored)
+{
+	struct drm_device *dev;
+
+	guard(mutex)(&drm_dev_sysrq_dev_lock);
+
+	list_for_each_entry(dev, &drm_dev_sysrq_dev_list, dev_sysrq_list) {
+		dev->driver->sysrq_kill(dev);
+	}
+}
+
+static DECLARE_WORK(drm_dev_sysrq_restore_work, drm_dev_sysrq_restore_work_fn);
+
+static void drm_dev_sysrq_restore_handler(u8 ignored)
+{
+	schedule_work(&drm_dev_sysrq_restore_work);
+}
+
+static const struct sysrq_key_op drm_dev_sysrq_kill_op = {
+	.handler = drm_dev_sysrq_restore_handler,
+	.help_msg = "kill-gpu-job(G)",
+	.action_msg = "Kill current job on the GPU",
+};
+
+void drm_dev_sysrq_register(struct drm_device *dev)
+{
+	const struct drm_driver *driver = dev->driver;
+
+	if (!driver->sysrq_kill)
+		return;
+
+	guard(mutex)(&drm_dev_sysrq_dev_lock);
+
+	if (list_empty(&drm_dev_sysrq_dev_list))
+		register_sysrq_key('G', &drm_dev_sysrq_kill_op);
+
+	list_add(&dev->dev_sysrq_list, &drm_dev_sysrq_dev_list);
+}
+
+void drm_dev_sysrq_unregister(struct drm_device *dev)
+{
+	guard(mutex)(&drm_dev_sysrq_dev_lock);
+
+	/* remove device from global restore list */
+	if (!drm_WARN_ON(dev, list_empty(&dev->dev_sysrq_list)))
+		list_del(&dev->dev_sysrq_list);
+
+	/* no devices left; unregister key */
+	if (list_empty(&drm_dev_sysrq_dev_list))
+		unregister_sysrq_key('G', &drm_dev_sysrq_kill_op);
+}
+#endif
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 2915118436ce..c1f5a4ee6d58 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -734,6 +734,7 @@ static int drm_dev_init(struct drm_device *dev,
 	INIT_LIST_HEAD(&dev->filelist_internal);
 	INIT_LIST_HEAD(&dev->clientlist);
 	INIT_LIST_HEAD(&dev->client_sysrq_list);
+	INIT_LIST_HEAD(&dev->dev_sysrq_list);
 	INIT_LIST_HEAD(&dev->vblank_event_list);
 
 	spin_lock_init(&dev->event_lock);
@@ -1102,6 +1103,7 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	}
 	drm_panic_register(dev);
 	drm_client_sysrq_register(dev);
+	drm_dev_sysrq_register(dev);
 
 	DRM_INFO("Initialized %s %d.%d.%d for %s on minor %d\n",
 		 driver->name, driver->major, driver->minor,
@@ -1146,6 +1148,7 @@ void drm_dev_unregister(struct drm_device *dev)
 {
 	dev->registered = false;
 
+	drm_dev_sysrq_unregister(dev);
 	drm_client_sysrq_unregister(dev);
 	drm_panic_unregister(dev);
 
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index f893b1e3a596..164ff588aea4 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -67,6 +67,17 @@ static inline void drm_client_sysrq_unregister(struct drm_device *dev)
 { }
 #endif
 
+/* drm_dev_sysrq.c */
+#ifdef CONFIG_MAGIC_SYSRQ
+void drm_dev_sysrq_register(struct drm_device *dev);
+void drm_dev_sysrq_unregister(struct drm_device *dev);
+#else
+static inline void drm_dev_sysrq_register(struct drm_device *dev)
+{ }
+static inline void drm_dev_sysrq_unregister(struct drm_device *dev)
+{ }
+#endif
+
 /* drm_file.c */
 extern struct mutex drm_global_mutex;
 bool drm_dev_needs_global_mutex(struct drm_device *dev);
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 5af49c5c3778..c6c0987dba36 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -246,6 +246,14 @@ struct drm_device {
 	 */
 	struct list_head client_sysrq_list;
 
+	/**
+	 * @dev_sysrq_list:
+	 *
+	 * Entry into list of devices registered for sysrq to kill current
+	 * GPU job.
+	 */
+	struct list_head dev_sysrq_list;
+
 	/**
 	 * @vblank_disable_immediate:
 	 *
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 42fc085f986d..8e9d5d597451 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -385,6 +385,13 @@ struct drm_driver {
 	int (*fbdev_probe)(struct drm_fb_helper *fbdev_helper,
 			   struct drm_fb_helper_surface_size *sizes);
 
+	/**
+	 * @sysrq_kill:
+	 *
+	 * Handler for magic sysrq key to kill current job on the GPU.
+	 */
+	void (*sysrq_kill)(struct drm_device *dev);
+
 	/**
 	 * @show_fdinfo:
 	 *
-- 
2.53.0


