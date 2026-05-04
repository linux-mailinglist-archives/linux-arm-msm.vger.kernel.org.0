Return-Path: <linux-arm-msm+bounces-105786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCLhLLbV+GlR2AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 19:21:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5094C1DF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 19:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBAFC3094019
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 17:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE52238C1A;
	Mon,  4 May 2026 17:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4PzJiCq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4sLmBjq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF053E3C53
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 17:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777915040; cv=none; b=fPPpw/C3iSURD11Y72cuUNM4afRDM1yy63lebacWXj6F0n3o139q5O5/Xfb7jZnXq1f1TScDrPj0EccvvE5zmFQ3CcCaiUeokXK1YgLWyA0u7RxUbBQiv0QkEZZWrWH+Moami0Wju1xlzWK3+sR4uzKx8qo8T9H1zpefa2IGR/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777915040; c=relaxed/simple;
	bh=me7LlBI1nMxAAL3914xa0NNnyNBO6iqSTEZkR/ryMk4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VCqFGTOCTmtGjEzI3CsGN1JbM42d53PmEBytCKRi1jod4UqTd1EPou5uC2e9b6cszTrzdD0jGWE0Q/mPnEim49/K0LoY6nCIRL8D+tyzoVkFmI82GLkaDn07R5TP0N2NtezbzHOwMcgcuJJSCi8JPmMXNeLR5LyhvW2dl+Hd3r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4PzJiCq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4sLmBjq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4IZS749422
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 17:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UNH5pQ64r4nUU60TyQ3qC8KKJDFPHI4UC0Z
	WJhC9M4M=; b=K4PzJiCqUXOxQjn4FY8LftTo7Rvym/4Ac1ivVvd7+3M0ma0MQtI
	r4hYCNcVNv/rrypPSiCIf/XFooALCtVXLK9zLcclJemHzefVJc4OGvL/1A0+R3K0
	+tbH1qALjwMid22pPlbjkZykE6ZEXTTRcgIm5mCT1jGwsRMPRUp/IsypULnmhw1z
	2WgVB/lP/O3NLORw4RIT7GZDnKcDtO+pIlv2fpP6Enk+5Hr++qyHd/WClOFixBH9
	4Y/WqMa1l8Owc0vdyaOnI6huZpiQDoveiqF6FMhHjB5B1TO4Y7YpNcXdIXB0BrqB
	mN68C2ChS4d3ckzadCEX03wwZifSU3idykg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscf1fab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 17:17:15 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b62da7602a0so2089155a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777915034; x=1778519834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UNH5pQ64r4nUU60TyQ3qC8KKJDFPHI4UC0ZWJhC9M4M=;
        b=f4sLmBjqpzu5Aq/5SNEIU3ne05INMLWy9nIbCMkuaGMEoEg8CPXwdf++GdAScXVLKo
         lest8wlsV5LGQ2iuZbPxEKesWjWGfSmCxL5dXH9/g1d6MF43nd1o53VDjWYKJKMiNPqC
         cFuVhZTr1BzRVF425Qlx7UQQnWm8Ko8PmqUsFj428F9hVydzylOt8xcCquFcYj8KFndO
         Ov5SMEoZQPAn/ZFB2bfBGDHfE095HqjBzPkrc9dX7c6RRSYwQ83trzmrOMdVWwzXbKKO
         GUEJAtDbGWYwB+CqAZjpRNPkNKaJHXMg0Y6Um0own5Hyv7ZL9qeBVhU6nCT5TIevraC1
         Rm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777915034; x=1778519834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNH5pQ64r4nUU60TyQ3qC8KKJDFPHI4UC0ZWJhC9M4M=;
        b=kFW6Lq16UOVQpl1N3zRv8YUR/B+dfjZ7r6tA8Eab+2z6bgSq/QcBCRKqrFB12KGQp/
         mb0O0Dp4Mu4fhKxu7CE5ZeEMAuZ86EGHyY8eSi6zc9CWmdehcbHy+VRCdYvikjvKKOLg
         Yp4ba9DibJmarpUg2L4GviJ+fNwgI6OGZMhV8mhtdnOR4xnPVJzuQt/34ffDPhiteP7W
         2S7yoUp1VSu9caVA/PAs/RW1VRs+w0i2CEKnAxTYs+s7jF6Pn8IoyG3c+il1jP/8oZWl
         Z4yfsxBSxvvPHxG90Y1Fr020QjAMSuy/y8zKxLO17vvsac+5XRFnzVnkujOlOWHZqP8T
         KxDw==
X-Gm-Message-State: AOJu0YzFyPb8dBvf6N5Pcvs/HQR3/B/CstgSxGsjjmaj3HU2hQjdU337
	NDAY1AtC9hk7+DxhwWWy25JDan5XV0iX51DPvVoIwHbymvxI/b3pDDfkZzUTTThkVEH5ZxSaC3X
	qNZSSUoLlIIhagKIweCnbqf6VRdIt9BLcDHtIkO0n0D3/wRoLSMtHfv7pHW21/m45EnJJ
X-Gm-Gg: AeBDiesZs5sXmHmyp7IMfyTuUnYPmKsxa4OnbLVFiTnhEjs2cVY5xpaGCb8UWXpQgdD
	G5PfY6MtSqpaLZ4gemL999pwmrjOAaH7aBOBIuPIs+a/0tplH4wKGmOTn1wng6yRRvcQOy+NrIJ
	Dj7X3KkcL5KOjkVBFD6Sk56jMq4fL3qof3DZPAvwbbHFg8aH09dQHeybGZUSwY+IPqSkPrzDts6
	DnuHroWPzaRCng6nh1sHsLBBCaFACt6D1bH4Y2hmkIvOkci7xWhkuBxtQOayN1cysxB6bFBgHtz
	w8e16qqXlr/fZ3++TuJpjr8EM+XdpvOWNL8ymUNNrEwbIIAVB4r/IpQCmCUdWkBh2+98bedR6Mn
	ma9E5oka5mqMCzoociTDkFujN1ppeguhF7u2Ui51iSA7b35j5zhTXXQCF+ZI=
X-Received: by 2002:a05:6a20:7d8a:b0:3a0:cd5:82a6 with SMTP id adf61e73a8af0-3a7f1c6759amr10124184637.46.1777915034062;
        Mon, 04 May 2026 10:17:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d8a:b0:3a0:cd5:82a6 with SMTP id adf61e73a8af0-3a7f1c6759amr10123981637.46.1777915030474;
        Mon, 04 May 2026 10:17:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbc6f063sm10398240a12.20.2026.05.04.10.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:17:10 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH v2 1/2] misc: fastrpc: Fix NULL pointer dereference in rpmsg callback
Date: Mon,  4 May 2026 22:47:00 +0530
Message-ID: <20260504171701.18164-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BcvoFLt2 c=1 sm=1 tr=0 ts=69f8d49b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=MnYYGAq_QTRuFDU830wA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1NyBTYWx0ZWRfX5IUJ96xTffj4
 zeUC4laDJTog6KBWxt9PHZpZVr6+xA/1P6f5wQHYUlKfJSwi3Y1/Pb+ZWQLA+x2fySrY1My20jI
 opBQbuxpuU5LZMTXyCye2HIcYk3lmaT1ZYDzwpZtSB6kmLKmAdALQcHjNTY8T79+H09y0Qy3/iW
 /y1EFUHvzu9z/wZPqqoFvxppeiQjZUCL8Zv8tLzuKIXVzjW+4BU7Q6C2dbyK0dlI3LBl30GlEMo
 hD8ou4QAo8k7nA5nGqXGGnnF++cEPfvPpeGa4qELKyHOjUrMZpEDHf4b7/mYcYE8ZyA6+2fkqRW
 uYoi1TEmhb/GWhADtCvGHcGXuAu4zYqxuOg5FD1NJhHC+4zBxR9XrOroIQRprY187c0FkToUjF9
 FfVO4xQygxPiyciXxgBlPnnqKffyEvq6zKKdis4Np+kqLK7hyQyqztEPO5CXo4vsF8JIJ+8Qv5v
 B/lWb+SEmcK8S3ggfSA==
X-Proofpoint-ORIG-GUID: LrzGUrgyBlRucHXPMXDrKF_jEJU0cgK0
X-Proofpoint-GUID: LrzGUrgyBlRucHXPMXDrKF_jEJU0cgK0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040157
X-Rspamd-Queue-Id: 1E5094C1DF3
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
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105786-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

A NULL pointer dereference was observed on Hawi at boot when the DSP
sends a glink message before fastrpc_rpmsg_probe() has completed
initialization:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000178
  pc : _raw_spin_lock_irqsave+0x34/0x8c
  lr : fastrpc_rpmsg_callback+0x3c/0xcc [fastrpc]
  ...
  Call trace:
   _raw_spin_lock_irqsave+0x34/0x8c (P)
   fastrpc_rpmsg_callback+0x3c/0xcc [fastrpc]
   qcom_glink_native_rx+0x538/0x6a4
   qcom_glink_smem_intr+0x14/0x24 [qcom_glink_smem]

The faulting address 0x178 corresponds to the lock variable inside
struct fastrpc_channel_ctx, confirming that cctx is NULL when
fastrpc_rpmsg_callback() attempts to take the spinlock.

There are two issues here. First, dev_set_drvdata() is called before
spin_lock_init() and idr_init(), leaving a window where the callback
can retrieve a valid cctx pointer but operate on an uninitialized
spinlock. Second, the rpmsg channel becomes live as soon as the driver
is bound, so fastrpc_rpmsg_callback() can fire before dev_set_drvdata()
is called at all, resulting in dev_get_drvdata() returning NULL.

Fix both issues by moving all cctx initialization ahead of
dev_set_drvdata() so the structure is fully initialized before it
becomes visible to the callback, and add a NULL check in
fastrpc_rpmsg_callback() as a guard against any remaining window.

Fixes: f6f9279f2bf0 ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
Cc: stable@vger.kernel.org
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2: https://lore.kernel.org/lkml/20260417200146.184425-1-mukesh.ojha@oss.qualcomm.com/
 - Added stable mailing list and fixes tag.

 drivers/misc/fastrpc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1080f9acf70a..a1a54453bb7e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2431,7 +2431,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 
 	kref_init(&data->refcount);
 
-	dev_set_drvdata(&rpdev->dev, data);
 	rdev->dma_mask = &data->dma_mask;
 	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
 	INIT_LIST_HEAD(&data->users);
@@ -2440,6 +2439,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	idr_init(&data->ctx_idr);
 	data->domain_id = domain_id;
 	data->rpdev = rpdev;
+	dev_set_drvdata(&rpdev->dev, data);
 
 	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
 	if (err)
@@ -2513,6 +2513,9 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	if (len < sizeof(*rsp))
 		return -EINVAL;
 
+	if (!cctx)
+		return -ENODEV;
+
 	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
 
 	spin_lock_irqsave(&cctx->lock, flags);
-- 
2.53.0


