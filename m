Return-Path: <linux-arm-msm+bounces-104421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SM3BAKA/62nwKAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:02:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE38945CACA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EA003007CA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B7C35A3BE;
	Fri, 24 Apr 2026 09:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TyD7cifT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFIkzme/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCC8359A8C
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024772; cv=none; b=HoOwdTA+Y8LU/H8jhNYQe9toVKrySY+5LkDTBn3+oSCjUxAj59717sZ+IkDWUaAzkyE5Y7gC7HwOy06/N5KSWUVXeZSFAlYseiNYH6QHAOqK4qdACIvc1tIP/S6qwEo63yOZQTFLrTwex433uK7O9+ZXsubHzT8pu0iDNZi+Zww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024772; c=relaxed/simple;
	bh=cyW0ydZI/AE9ZetLV0OXd3bSN+8fX9V+lplZBiIG2IU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pjd5xJ19Il3AEknhNZh1wDVaf3bH0IFTNhVwF2Sh/Is4w8HjpxL9EviRR6cSdbUCQ6fTNb4Y2Okh1AN4HMnpFpF1K3+hCg/GGasSHDlmdMO18W4WTngVzx8fWrSpihv4N+kAidR6niffdGar5aco9AhJLMJaEwEHASRs3oCYYnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TyD7cifT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFIkzme/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O5lDsO1960105
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Dom1w/DSflQ
	pAf7/O+Im0ldhjxWikSCb1TdCzn53krs=; b=TyD7cifThF7iz77k293OG/BEXwW
	LTjOvQ1MZoA/Pc7QgeY0Z6/QF+6YjTS141wU84G6G4dEoPuia3ImgXsctpbXfGOP
	6UHeUKJdR/zakpOSodIGIwZfqNhiiJul4R6LRmyA2CTX5bdCgaEQlkBmtm2QW5cy
	JfhZN+1Wseo+Sw+gb51F2oJd2QYkWFOMBQwWGot3kHjHEip1j3WIBsL/9gy4TLU2
	QS1YPaPvlFI1zeCJcv1PIJpC2bHYyU4n6slojhVYj2EuzIIVMBKumuPeaV4+ipWL
	yYADXlSF9ynFSUSdjUAH6bGkSs4U0RW5MO8HgYisS22sXj4t7mxZAyAilOg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr2nrh3ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:59:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b258636d16so77493065ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777024769; x=1777629569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dom1w/DSflQpAf7/O+Im0ldhjxWikSCb1TdCzn53krs=;
        b=DFIkzme/hydmop6Tn87OcX3t7Zl7/sL+q/NSs8JrSV+DrZlWEX1NHEWuU22ZH4UV1W
         qa9QXD8dw4VRoiOxIb4DSYIsq2+fl1nDFF8GPz+/bVexYJpUMetNlWrUdi+O9paKgD+u
         Uq8qt8txn/o1qTMWjgHanijoqmedIMUUBBS+msIsYXQXeB/WoisJpLiJSh22ahK/Pf59
         qk6MReEqgsFFibIwUqmm8IZqZNiMlguYcCcZ9hKwruNmPGA6B+ERN03O4gbUOuJp+4sr
         BLI/rfzmUAjUS5ugM8z9VEwVmwJZYXDpU7esSCUJYZ5I7K2GCwKLbscXavnFgg0f1la5
         cwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024769; x=1777629569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dom1w/DSflQpAf7/O+Im0ldhjxWikSCb1TdCzn53krs=;
        b=fqnmv/wa0X953l6tlficW1Mg4d2pofKKbaCReDCbK2+Aud3ZbQjp3XLkcMMOjfxCRU
         7bz+TSt1dWexbqxUS1Jh7nv5BIl0aLFdv9vhFtJu+eH5EEO0o35bAa/58IL4I9E8bv3R
         B4XO9I1PO5zyRUL2uG+IuUDLFhOTg/YL7agsmyXUGpQkTJEDRpLlVahTbU8R1RFPjwoZ
         2JNZORmllJ3mOTneaAq4uRqV1Gr6O47kFj0cXhk7k9dpUii4GTHIBBbhG5LHKI9K/YDr
         hIyOzTDHBtHwGySUatikNuJsq1QBeNGpta1GgCYphCFM8F4xoYasODLv8DONn7kws3L2
         rmiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2LlyVJQ99Vs74AzKtHUiGE4XolYabmsG7P/ieI/maDGa4lh7iMpnl5eELbMBXPEtg2wL8YrRcKogk6rdB@vger.kernel.org
X-Gm-Message-State: AOJu0YzS5Ie7gCWODXhcC/724DZ8c+T0jZEN9O1ajm61ALN1UpYR3bdU
	hedjXz3e3Ejqc0eTJ3RJ6GBleFysN0kQ6HpC2EL/TMWFdUI6otwipY2xXORk3yYbd9QClOpPM4G
	niQotZ8qMEnhQ2hCfW9OVuyuwwrUah7CDlrW6T1KfTUcER1gD8jJUrHrYph1wM/A+ZLKc
X-Gm-Gg: AeBDiev6wTks4s8QHyfeSTAoedIKvU/TWPD1FtZ4U7IytBtIWb514P7lB8exlOJgOMo
	hSXpEHWiG2Kc679lqk7Jvniv0OWiJGSWeYaV/saEZmOwRM/xNbsSrccQZbEJ4DamCfcK0Vbt3PX
	bPtildEzMccplrNsjUG/ibNDY3iZLPoruakpFHQVmdOzufTg6raRBqbhj5zGMYQgVUzx+z8G08f
	2BbnOXJlXMcfDX/no6u96LB8Fb2rwtf3B4XOXvdbkGCoBkU/U3lmuoiBornpkKrFlkgwMGrpRwf
	86Wm0p3Xvfq0mQHIA3ac753eDQq/17NrlJYvH3FZvHZypHHBU6lYyTl6bfTzSezRtqM4URnVfAe
	lw5ORghIg04tvNLzNKFiwUHZ4Ubo4VMAdhlKN1nNsxCVb4fY/qv0yD1Pk65EktbBh
X-Received: by 2002:a05:6a21:6d85:b0:3a1:5cce:ca8f with SMTP id adf61e73a8af0-3a15ccecdadmr25884337637.42.1777024768774;
        Fri, 24 Apr 2026 02:59:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d85:b0:3a1:5cce:ca8f with SMTP id adf61e73a8af0-3a15ccecdadmr25884303637.42.1777024768218;
        Fri, 24 Apr 2026 02:59:28 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d35acsm23679702b3a.15.2026.04.24.02.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:59:27 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ltuikov89@gmail.com,
        konrad.dybcio@oss.qualcomm.com, andersson@kernel.org
Subject: [PATCH v10 4/4] misc: fastrpc: Add polling mode support for fastRPC driver
Date: Fri, 24 Apr 2026 15:29:03 +0530
Message-Id: <20260424095903.1622565-5-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260424095903.1622565-1-ekansh.gupta@oss.qualcomm.com>
References: <20260424095903.1622565-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5MyBTYWx0ZWRfX3GO0UmRmud9x
 WEePP7N69VMoo2h21f7UosJC/9j8ETvqouJ0hk7Igfy8lvIaRDsb/ovssT2vzHasKeKxtDAsaQB
 vS5NY9iXr3h0RroUnd4zO2IbnP2ud6eF07vPEbXgB2lR1WCLbg/GwKLZbFn2lyggqvRwGk4lLuw
 59CIxkghg1SlQmBfWE3c8mZbmiIcTy3ftGhOaGoYcDygcHC6FubVos+JvYEwlz7c9PWiwjZ6QAn
 sBEuyuAqkLNA5i+E8f73JGyfRTCk/csTHBBzNjHG+dO6rUD+u6twWauTVrJKsdfRd8U31QNBmd3
 cE3U/lWxAGce152ypz6j0OZBod53YCa9hmXgGaWwRvgb/WHj7Kcs5OGv/sMsNB+0nwDUDONPPpU
 4iSJj9IUMt/W/Chl07Fx+j/ghBx+akI/PLVn42W4lWfRnuUEfpXSUa+WsD0nu0dSvFDZSt6g9IK
 24OMIke8eoojlNzLnSw==
X-Authority-Analysis: v=2.4 cv=UqpT8ewB c=1 sm=1 tr=0 ts=69eb3f01 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=wn3mZlvuqqDVgct7km0A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: dUfngjZCLye8Q-N1XREfSmNUqKsENuyG
X-Proofpoint-GUID: dUfngjZCLye8Q-N1XREfSmNUqKsENuyG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240093
X-Rspamd-Queue-Id: CE38945CACA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-104421-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,quicinc.com,vger.kernel.org,lists.freedesktop.org,arndb.de,oss.qualcomm.com,gmail.com,kernel.org];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

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
 drivers/misc/fastrpc.c      | 155 ++++++++++++++++++++++++++++++++++--
 include/uapi/misc/fastrpc.h |  25 ++++++
 2 files changed, 173 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index c4a3547a5c7f..b24845c7f016 100644
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
@@ -1188,6 +1216,61 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 
 }
 
+static int poll_for_remote_response(struct fastrpc_invoke_ctx *ctx)
+{
+	u32 val;
+	int ret;
+
+	/*
+	 * Poll until DSP writes FASTRPC_POLL_RESPONSE into *ctx->poll_addr
+	 * or until another path marks the work done.
+	 */
+	ret = readl_poll_timeout_atomic(ctx->poll_addr, val,
+					(val == FASTRPC_POLL_RESPONSE) || ctx->is_work_done, 1,
+					FASTRPC_POLL_MAX_TIMEOUT_US);
+
+	if (!ret && val == FASTRPC_POLL_RESPONSE) {
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
@@ -1223,13 +1306,14 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
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
 
@@ -1813,6 +1897,33 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
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
+	if (opt.value) {
+		if (!fl->cctx->poll_mode_supported)
+			return -EOPNOTSUPP;
+		fl->poll_mode = true;
+	} else {
+		fl->poll_mode = false;
+	}
+
+	return 0;
+}
+
 static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_ioctl_capability cap = {0};
@@ -2168,6 +2279,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	case FASTRPC_IOCTL_MEM_UNMAP:
 		err = fastrpc_req_mem_unmap(fl, argp);
 		break;
+	case FASTRPC_IOCTL_SET_OPTION:
+		err = fastrpc_set_option(fl, argp);
+		break;
 	case FASTRPC_IOCTL_GET_DSP_INFO:
 		err = fastrpc_get_dsp_info(fl, argp);
 		break;
@@ -2323,6 +2437,7 @@ static const struct fastrpc_soc_data kaanapali_soc_data = {
 	.sid_pos = 56,
 	.dma_addr_bits_cdsp = 34,
 	.dma_addr_bits_default = 32,
+	.poll_mode_supported = true,
 };
 
 static const struct fastrpc_soc_data default_soc_data = {
@@ -2331,6 +2446,29 @@ static const struct fastrpc_soc_data default_soc_data = {
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
@@ -2397,6 +2535,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
 	data->secure = secure_dsp;
 	data->soc_data = soc_data;
+	data->poll_mode_supported = soc_data->poll_mode_supported ||
+		of_machine_get_match(fastrpc_poll_supported_machines);
 
 	switch (domain_id) {
 	case ADSP_DOMAIN_ID:
@@ -2521,6 +2661,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	}
 
 	ctx->retval = rsp->retval;
+	ctx->is_work_done = true;
 	complete(&ctx->work);
 
 	/*
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index c6e2925f47e6..63346e27d5e9 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -16,6 +16,7 @@
 #define FASTRPC_IOCTL_INIT_CREATE_STATIC _IOWR('R', 9, struct fastrpc_init_create_static)
 #define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
 #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
+#define FASTRPC_IOCTL_SET_OPTION	_IOWR('R', 12, struct fastrpc_ioctl_set_option)
 #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
 
 /**
@@ -67,6 +68,24 @@ enum fastrpc_proc_attr {
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
 struct fastrpc_invoke_args {
 	__u64 ptr;
 	__u64 length;
@@ -133,6 +152,12 @@ struct fastrpc_mem_unmap {
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


