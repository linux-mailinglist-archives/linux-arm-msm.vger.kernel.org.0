Return-Path: <linux-arm-msm+bounces-108921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FDpGUecDmqZAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:46:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 618EB59F32A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AECC4301C6B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 05:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF77348896;
	Thu, 21 May 2026 05:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RtWSaYoN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hc+LalLe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AF835200A
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342364; cv=none; b=B5LXkRjUNENxWobJPJbfoSpxn1Qm6WsTuB+q3aZ80GbjsikGhFoTTL8YdxVCMGIx3IoCyICvGITdECuNVuOMfbwF65fPA/hZFJilnww9o78UwDV/VAqQFsX/4GZgUbCQzl2CX6dy/u8oVFYLIr/tA9ROzdZQf+8fNnLLNuFnqRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342364; c=relaxed/simple;
	bh=gAg4E1J+Stzmvgfs035XR4jZLx9mUr5n6oPruK7SS0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WXUG3GUMVsez0Ku5CdkF2QApUgdL57OM6EfRXqqpznMacaNE77PZ4peLd2/9EtcTY2S7DH+NpL+9USiTYj3p/+vNzYuHFgRvMIW23/ctv8qZ3AAJFCJouBlx6v87BB1giZBFjouOm65b5qIPwDIahJnuu0NubWsy3SbTjGBF3cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RtWSaYoN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hc+LalLe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L1InXb2072188
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=in0dxS6n0Go
	rPPg0Z1EiapWwjJJdUyQdBupNhQkB8N8=; b=RtWSaYoNIUQ1RLnz3/2fmNXzFwl
	W2kIFcRMsCqK++jAW0/7Kjr5UPQ9uK/ZzX12BeK+5ramHYOT+Gr+9x+bIlMQfgnw
	Y98iw+0s3uqSjp5r5WF/bpVX1pPSFvSIGelvxLZmpfM5NNbl+3p7vdq6M9AnDhcV
	OOLbGQXf8HfyFASiupYcHk0Ek0uIIvVW+4+1VAJZQTvSDa2NI9DglPihRPtE+sB0
	Mmc9Q5F1devxYB3ZxhGZaVc6W0mdmHVFsrMO+8Kw9F5BUvVq4MuiYNfAtWr2fI4T
	mLtc9XiOjO4TQw2mbCMV71qDyDsCydszXsSO9W4wnJSFZ7w6DBbxsX2WZuQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r960tkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:46:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3663cbff31cso14262855a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 22:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779342361; x=1779947161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=in0dxS6n0GorPPg0Z1EiapWwjJJdUyQdBupNhQkB8N8=;
        b=hc+LalLejiwe4k+fj3ikz/Ty5rhQfIO3pqRermIoYa+1HKxYkhH6xOcU5QfbfwP4Vm
         FoudvIjLdZC9RuW4u0GWfH7uL71fgBk3Z5B+iOyw0Dfk0dZqWbnQ20l0leS3pscgXZvb
         xOz+KV0noLFMYKDlj8WBXHaMfUREHuCQryVRRl4L7e3PipTBupqC0uVgIbEVSsgM2eds
         /vgRxWL0Oiy/agqWtVfGssu/c+B4WGQbYOGaYLUtfcZFrLjiW/0B1jVtJ+pNSPZcbYBi
         DRHXQM9c1/U3XvB5qoOGEwTSgLKiR4IKR4fVnaSi3thnG+IzK/Ch/DrJhMzoqWcEhqPn
         OckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779342361; x=1779947161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=in0dxS6n0GorPPg0Z1EiapWwjJJdUyQdBupNhQkB8N8=;
        b=f92t15Jq7NwRLb29+ZcZbyosQbwqfB08U5mWxk1C6pRkxcy6x5lO/FoSnconmxBUYh
         acww8e0BlV+6A/E6lO2+0b/RaQYGsjXBOGNAxIMWBlK2iQ9QbBm9+8vp6egX+lOtjKLB
         VFQ4+qHj0B+91FyyWCDciO7q7+hMEES5DKeaHoBeCAOdVf8fxe3XWHgUgBvsb0vjUrBQ
         VeB3NtYnngOj07lTasPemivptmErXDiO8ic9SVi1csbPl/ZJw44i2etl8IttrFDgnGwm
         06f9uuls2sd+tO3EUAvIX+t7VKo7AVRilh9LHkIxT01GZtXI70e+f44iSdFQL8DAQpZx
         9jSQ==
X-Forwarded-Encrypted: i=1; AFNElJ8f0xZfSXqVX2QGEv3624p7yhA/LsyQ4bOfa5oILnDiNmTAA9cP0jk54BonpcR2RIV+rVbsLLbnA5jw9GVo@vger.kernel.org
X-Gm-Message-State: AOJu0YykUX8ydW380MLZtfK7pOr5/shlLTWR+SgjoNyTmGPf74jLJ+ue
	8IE7LeVQTqLsp5P3+zML5DRKQro2k3VtJDOGRpzQTu4BYd9iT6i4n50O7skXk2c4HDV4slJJ5hO
	QBDI8MbVkGyl3K0QuR9MGW5D3Rs85qZdpFESELAnrhzNNUMxKlAR4yOPwSw3gsHPHP8o9
X-Gm-Gg: Acq92OFhXBC5ML2Yi291A98RoNWxyz9qEz2jTpNmYp1zh0ilW5j/fFzRkIT+r9Ma2Nu
	RS+vEq7mRENYv9IhDHkNAh+L+oz9SULhF4btA69tQ41Cl0NvodQuxMMdtwW2Rq8gtbO0e1b5mw1
	astp2Ilv6e8rEMDFmVqGOWaLX8byCyBjBIgTl4Ku+HDlmXpoI8fGQQFYL8dj8wUDCHyvHbH5O8t
	jlV9vTrdW4abHs3L8n5mj082SRpMnAB4mqJX7sAGrfC7iFkrGegoFot4hlToIiffiRmQ2xRgqww
	uVd72VCRPemrnnDi/tSBPJl4jGtWHLeRbCScheTsILFkcXUdVsMPmvpp2FCRV4+2I4LWk64YYId
	VljvG782ab4LpS7PuS8vSVcIL3f+xbV8m4+JY2/0TlgjA5i+fFIHs7g==
X-Received: by 2002:a17:90b:2c8d:b0:36a:2a9b:3fb2 with SMTP id 98e67ed59e1d1-36a45600421mr1467415a91.16.1779342360420;
        Wed, 20 May 2026 22:46:00 -0700 (PDT)
X-Received: by 2002:a17:90b:2c8d:b0:36a:2a9b:3fb2 with SMTP id 98e67ed59e1d1-36a45600421mr1467396a91.16.1779342359955;
        Wed, 20 May 2026 22:45:59 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3cb323e3sm1474847a91.4.2026.05.20.22.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 22:45:59 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v12 4/4] misc: fastrpc: Add polling mode support for fastRPC driver
Date: Thu, 21 May 2026 11:15:39 +0530
Message-Id: <20260521054539.128651-5-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521054539.128651-1-ekansh.gupta@oss.qualcomm.com>
References: <20260521054539.128651-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -IrvnWxh0i2uge_9TtCUDVtW0j_J2QRF
X-Proofpoint-GUID: -IrvnWxh0i2uge_9TtCUDVtW0j_J2QRF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA1MiBTYWx0ZWRfX7oIv65gyzgsN
 7hiSXZLHcP+QB07ohYPeAtISWHDUajd71wYnfJTPr5l5j1Q0WDc9S8GmGd9JJW98MyYdxXIlv0r
 y5TGV6eg0XfdkBxFdmVab3m2qUL7KGzROuqIOJcdMZtJkMbEaUejPVE1aUohoazyzV0EXGx2iQ9
 /Def7wEZ7kChoJ/sVL/Iz/L3A3Ma+07SN9QSlClA+6riITAn/DDANqKaf564MMsQn+IE3Xrqdsh
 wCzLnQrh/zyc+vD68CZUwZs/PLrq5E85lFdsGyYJGh5+eA4gjtbNuZisqXFH51Z5qzmULjJJcnB
 QyQ4HvDTHNEyXrCp6Y4he6VPIQdhwajrB+53dHnGn9wDYGzx63HTxWBuJMCSpsgjoMGelEtuRvO
 kaNa3aEb9SI4QSMyUwm9qBWT8oU+HQTlH+Kxm3ptFmm2ASC8GdR25pKorAsJMJ9SNCIC53Tjuq2
 qhfIqrKocc6k6QQmoug==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0e9c19 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Xak7btDuadOZULdqBEwA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210052
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108921-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 618EB59F32A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For any remote call to DSP, after sending an invocation message,
fastRPC driver waits for glink response and during this time the
CPU can go into low power modes. This adds latency to overall fastrpc
call as CPU wakeup and scheduling latencies are included. Add polling
mode support with which fastRPC driver will poll continuously on a
memory after sending a message to remote subsystem which will eliminate
CPU wakeup and scheduling latencies and reduce fastRPC overhead. In case
poll timeout happens, the call will fallback to normal RPC mode.  Poll
mode can be enabled by user by using FASTRPC_IOCTL_SET_OPTION ioctl
request with FASTRPC_POLL_MODE request id.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c      | 167 ++++++++++++++++++++++++++++++++++--
 include/uapi/misc/fastrpc.h |  29 +++++++
 2 files changed, 189 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index c4a3547a5c7f..f0311395a686 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -24,6 +24,8 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/bits.h>
 #include <linux/bitops.h>
+#include <linux/compiler.h>
+#include <linux/iopoll.h>
 
 #define ADSP_DOMAIN_ID (0)
 #define MDSP_DOMAIN_ID (1)
@@ -38,6 +40,12 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
+/*
+ * Maximum handle value for static handles.
+ * Static handles are pre-defined, fixed numeric values statically assigned
+ * in the IDL file or FastRPC framework.
+ */
+#define FASTRPC_MAX_STATIC_HANDLE (20)
 #define FASTRPC_CTXID_MASK GENMASK(15, 8)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
@@ -106,6 +114,12 @@
 
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
+/* Poll response number from remote processor for call completion */
+#define FASTRPC_POLL_RESPONSE (0xdecaf)
+
+/* Polling mode timeout limit */
+#define FASTRPC_POLL_MAX_TIMEOUT_US (10000)
+
 struct fastrpc_phy_page {
 	dma_addr_t addr;	/* dma address */
 	u64 size;		/* size of contiguous region */
@@ -236,8 +250,14 @@ struct fastrpc_invoke_ctx {
 	u32 sc;
 	u64 *fdlist;
 	u32 *crc;
+	/* Poll memory that DSP updates */
+	u32 *poll_addr;
 	u64 ctxid;
 	u64 msg_sz;
+	/* work done status flag */
+	bool is_work_done;
+	/* process updates poll memory instead of glink response */
+	bool is_polled;
 	struct kref refcount;
 	struct list_head node; /* list of ctxs */
 	struct completion work;
@@ -263,6 +283,7 @@ struct fastrpc_soc_data {
 	u32 sid_pos;
 	u32 dma_addr_bits_cdsp;
 	u32 dma_addr_bits_default;
+	bool poll_mode_supported;
 };
 
 struct fastrpc_channel_ctx {
@@ -285,6 +306,7 @@ struct fastrpc_channel_ctx {
 	struct list_head invoke_interrupted_mmaps;
 	bool secure;
 	bool unsigned_support;
+	bool poll_mode_supported;
 	u64 dma_mask;
 	const struct fastrpc_soc_data *soc_data;
 };
@@ -308,6 +330,8 @@ struct fastrpc_user {
 	int client_id;
 	int pd;
 	bool is_secure_dev;
+	/* Flags poll mode state */
+	bool poll_mode;
 	/* Lock for lists */
 	spinlock_t lock;
 	/* lock for allocations */
@@ -923,7 +947,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
 		sizeof(struct fastrpc_invoke_buf) +
 		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
 		sizeof(u64) * FASTRPC_MAX_FDLIST +
-		sizeof(u32) * FASTRPC_MAX_CRCLIST;
+		sizeof(u32) * FASTRPC_MAX_CRCLIST +
+		sizeof(u32);
 
 	return size;
 }
@@ -1019,6 +1044,9 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
 	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
+	ctx->poll_addr = (u32 *)((uintptr_t)ctx->fdlist + sizeof(u64) * FASTRPC_MAX_FDLIST +
+			     sizeof(u32) * FASTRPC_MAX_CRCLIST);
+
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1188,6 +1216,71 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 
 }
 
+static u32 fastrpc_read_poll_addr(struct fastrpc_invoke_ctx *ctx)
+{
+	dma_rmb();
+	return READ_ONCE(*ctx->poll_addr);
+}
+
+static int poll_for_remote_response(struct fastrpc_invoke_ctx *ctx)
+{
+	u32 val;
+	int ret;
+
+	/*
+	 * Poll until DSP writes FASTRPC_POLL_RESPONSE into *ctx->poll_addr
+	 * or until another path marks the work done.
+	 */
+	ret = read_poll_timeout_atomic(fastrpc_read_poll_addr, val,
+				       (val == FASTRPC_POLL_RESPONSE) || ctx->is_work_done, 1,
+				       FASTRPC_POLL_MAX_TIMEOUT_US, false, ctx);
+
+	if (!ret && val == FASTRPC_POLL_RESPONSE) {
+		/*
+		 * DSP writes FASTRPC_POLL_RESPONSE to signal successful
+		 * completion via the poll path.
+		 */
+		ctx->is_work_done = true;
+		ctx->retval = 0;
+	}
+
+	if (ret == -ETIMEDOUT)
+		ret = -EIO;
+
+	return ret;
+}
+
+static inline int fastrpc_wait_for_response(struct fastrpc_invoke_ctx *ctx,
+					    u32 kernel)
+{
+	int err = 0;
+
+	if (kernel) {
+		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
+			err = -ETIMEDOUT;
+	} else {
+		err = wait_for_completion_interruptible(&ctx->work);
+	}
+
+	return err;
+}
+
+static int fastrpc_wait_for_completion(struct fastrpc_invoke_ctx *ctx,
+				       u32 kernel)
+{
+	int err;
+
+	if (ctx->is_polled) {
+		err = poll_for_remote_response(ctx);
+		if (!err)
+			return 0;
+		/* If polling timed out or failed, move to normal response mode */
+		ctx->is_polled = false;
+	}
+
+	return fastrpc_wait_for_response(ctx, kernel);
+}
+
 static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 				   u32 handle, u32 sc,
 				   struct fastrpc_invoke_args *args)
@@ -1223,13 +1316,14 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	if (err)
 		goto bail;
 
-	if (kernel) {
-		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
-			err = -ETIMEDOUT;
-	} else {
-		err = wait_for_completion_interruptible(&ctx->work);
-	}
+	/*
+	 * Set message context as polled if the call is for a user PD
+	 * dynamic module and user has enabled poll mode.
+	 */
+	if (handle > FASTRPC_MAX_STATIC_HANDLE && fl->pd == USER_PD && fl->poll_mode)
+		ctx->is_polled = true;
 
+	err = fastrpc_wait_for_completion(ctx, kernel);
 	if (err)
 		goto bail;
 
@@ -1813,6 +1907,35 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 	return 0;
 }
 
+static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
+{
+	struct fastrpc_ioctl_set_option opt = {0};
+	int i;
+
+	if (copy_from_user(&opt, argp, sizeof(opt)))
+		return -EFAULT;
+
+	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
+		if (opt.reserved[i] != 0)
+			return -EINVAL;
+	}
+
+	if (opt.request_id != FASTRPC_POLL_MODE)
+		return -EINVAL;
+
+	if (!fl->cctx->poll_mode_supported)
+		return -EOPNOTSUPP;
+
+	if (opt.value == FASTRPC_POLL_MODE_ENABLE)
+		fl->poll_mode = true;
+	else if (opt.value == FASTRPC_POLL_MODE_DISABLE)
+		fl->poll_mode = false;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
 static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_ioctl_capability cap = {0};
@@ -2168,6 +2291,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	case FASTRPC_IOCTL_MEM_UNMAP:
 		err = fastrpc_req_mem_unmap(fl, argp);
 		break;
+	case FASTRPC_IOCTL_SET_OPTION:
+		err = fastrpc_set_option(fl, argp);
+		break;
 	case FASTRPC_IOCTL_GET_DSP_INFO:
 		err = fastrpc_get_dsp_info(fl, argp);
 		break;
@@ -2323,6 +2449,7 @@ static const struct fastrpc_soc_data kaanapali_soc_data = {
 	.sid_pos = 56,
 	.dma_addr_bits_cdsp = 34,
 	.dma_addr_bits_default = 32,
+	.poll_mode_supported = true,
 };
 
 static const struct fastrpc_soc_data default_soc_data = {
@@ -2331,6 +2458,29 @@ static const struct fastrpc_soc_data default_soc_data = {
 	.dma_addr_bits_default = 32,
 };
 
+/*
+ * Exception list for older platforms that use default_soc_data but whose
+ * DSP firmware supports FastRPC polling mode.
+ *
+ * NOTE: This list is intentionally closed.
+ * Do NOT add new platforms here. New SoCs must advertise polling mode
+ * support via their soc_data.
+ */
+
+static const struct of_device_id fastrpc_poll_supported_machines[] __maybe_unused = {
+	{ .compatible = "qcom,milos" },
+	{ .compatible = "qcom,qcs8300" },
+	{ .compatible = "qcom,sa8775p" },
+	{ .compatible = "qcom,sar2130p" },
+	{ .compatible = "qcom,sm8450" },
+	{ .compatible = "qcom,sm8550" },
+	{ .compatible = "qcom,sm8650" },
+	{ .compatible = "qcom,sm8750" },
+	{ .compatible = "qcom,x1e80100" },
+	{ .compatible = "qcom,x1p42100" },
+	{},
+};
+
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct device *rdev = &rpdev->dev;
@@ -2397,6 +2547,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
 	data->secure = secure_dsp;
 	data->soc_data = soc_data;
+	data->poll_mode_supported = soc_data->poll_mode_supported ||
+		of_machine_get_match(fastrpc_poll_supported_machines);
 
 	switch (domain_id) {
 	case ADSP_DOMAIN_ID:
@@ -2521,6 +2673,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	}
 
 	ctx->retval = rsp->retval;
+	ctx->is_work_done = true;
 	complete(&ctx->work);
 
 	/*
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index c6e2925f47e6..ba1ea5ed426c 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -16,6 +16,7 @@
 #define FASTRPC_IOCTL_INIT_CREATE_STATIC _IOWR('R', 9, struct fastrpc_init_create_static)
 #define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
 #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
+#define FASTRPC_IOCTL_SET_OPTION	_IOWR('R', 12, struct fastrpc_ioctl_set_option)
 #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
 
 /**
@@ -67,6 +68,28 @@ enum fastrpc_proc_attr {
 /* Fastrpc attribute for memory protection of buffers */
 #define FASTRPC_ATTR_SECUREMAP	(1)
 
+/**
+ * FASTRPC_POLL_MODE - Enable/disable poll mode for FastRPC invocations
+ *
+ * Poll mode is an optimization that allows the CPU to poll shared memory
+ * for completion instead of waiting for an interrupt-based response.
+ * This reduces latency for fast-completing operations.
+ *
+ * Restrictions:
+ * - Only supported for USER_PD (User Protection Domain)
+ * - Only applies to dynamic modules (handle > 20)
+ * - Static modules always use interrupt-based completion
+ *
+ * Values:
+ * - 0: Disable poll mode (use interrupt-based completion)
+ * - 1: Enable poll mode (poll shared memory for completion)
+ */
+#define FASTRPC_POLL_MODE	(1)
+
+/* Values for FASTRPC_POLL_MODE request */
+#define FASTRPC_POLL_MODE_DISABLE	0
+#define FASTRPC_POLL_MODE_ENABLE	1
+
 struct fastrpc_invoke_args {
 	__u64 ptr;
 	__u64 length;
@@ -133,6 +156,12 @@ struct fastrpc_mem_unmap {
 	__s32 reserved[5];
 };
 
+struct fastrpc_ioctl_set_option {
+	__u32 request_id;	/* Request type (e.g., FASTRPC_POLL_MODE) */
+	__u32 value;	/* Request-specific value */
+	__s32 reserved[6];
+};
+
 struct fastrpc_ioctl_capability {
 	__u32 unused; /* deprecated, ignored by the kernel */
 	__u32 attribute_id;
-- 
2.34.1


