Return-Path: <linux-arm-msm+bounces-103565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MJfJu6R4mnf7QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 22:02:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9857841E6CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 22:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C37173025C21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 20:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F104E329365;
	Fri, 17 Apr 2026 20:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oY6yALLu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kM8MzQed"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EC4311C2D
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 20:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776456127; cv=none; b=dr6Mc5cpCyy5SNPLnVUiSdG1nZ89CEHmGTGX1DhGHUDIYc20H17p9dnE+ipMl00ojgLZQR/OiZVp07dE3ODjhPTiIp8577fW4wrIvpZdit+YXt4fHp/+XxwQq++qy/ARvmuqT1TNqyMHNekbp5bxsUOJVSsaJ1QT2DXb5ULc/p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776456127; c=relaxed/simple;
	bh=JB8wuchRBt9J1x0+dBXYSHtIZwYSy35QkurVZa5Twfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WWUhmITccRo0nqD4SsCHDLD2wx+Ex/H4FAzbFx/o0VOKo8U95HHZJDtC6s23ZmHTDDC2mTuWLTNR5SOs1TgJi9J6BkKK3WsNpwtSK6yKtBJBq0XE8vbstijaP2LLSyTcLdDC08kTUYT+a0ZYNDD6jYpsEmLLeTEKghyO6B2AoR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oY6yALLu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kM8MzQed; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4g9M2669870
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 20:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ViS/wJuo28OBwDkXiCvAvSC5Eff3JISAuPv
	NKYCjY2M=; b=oY6yALLuOkd80Bfm00nUxAPQz/Arhfus7PEHCCESMgIxTYM9oo1
	h0lLLdN7JN3Pe+Jgb9G6XWAuVzfSN9tIupOxOl8PBBgdDnf0OFOuomRFg8AVYM0t
	tG5stVobHbsw8uS8CEZZRPpar//BYlggxqbHPWowJXX1snHzQ2Au7VTkOwed8ic7
	XlCbLEicybarFxujyIzrXIeCocEw4s1syZmuY/KbrZfBoMtZ7V5KB/nnLUyJyHu0
	jdHLGNh8yPpTomodsViDQ3GKytusqGOkuvyo2kjVCznu+o067rG85JhIohGSJWYG
	iHoQQWcvFg3wraTAvw13bNIiydwvl+Cm3Nw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkaxcumys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 20:02:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b249975139so20992775ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776456122; x=1777060922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ViS/wJuo28OBwDkXiCvAvSC5Eff3JISAuPvNKYCjY2M=;
        b=kM8MzQedWacl50B/Fmuy10AoKNPiBfWpkaeLgsK7tih3OmFX9FlO0pA6Kke8Uzj/94
         lqQyXzzDqJCgU4SNq3Km/lOc0OdjOYnBCLZz6VeyJUwfFGa+FMwGGk2tOYjwVBU08g/U
         B1sT9ooJGOCIj4mT3crxOMVcCxa1G0ZLa+fv9bVPcAVRmBQCcXRWGKKx11kADkDIHe/N
         i4kIgZsGiTAWg3Y5PlQGpxX7uWboPMlP/cOFKgZvcGXwWF/ycBHKcJSw1Tr4R68wF0ya
         GsSxPqCgA66iQdS5taSR+hXJr2EU0UvF7ingkNK2nvCvRzsoaGuamIpKadenOCjvfuBH
         gNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776456122; x=1777060922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViS/wJuo28OBwDkXiCvAvSC5Eff3JISAuPvNKYCjY2M=;
        b=rx0NlTw82PJQD9eyfFRCnDepBZL/E1oBgsHKmcgoWgUnmlhySXEPUiY3CAtIaxwg1g
         Fc7JFSs6TwaCZD6mxt9FphpxpTqp+KVFhYdvyijfHxysXgeOyX5ygCPd4FRKi8MVGSuw
         kPJO4ljc1ShM441Het7g2sIP0YEqtHEkE2O+1DvF2ir3ptprTp9iWcBDI6WBBaBI0e0W
         l5YoB9wpZYXm97M9+6N7tbp+8CA6ZZdaGBHlHz5uxcGoplq2vTyT8iILDoTnNYMDSxue
         PxaPb7hPCQ6FTwDJfCLhYxnPKxvzXhJ3SD1zBRA37HqdWiD/bjebeXynP1mPMhyEjOwC
         hFCA==
X-Gm-Message-State: AOJu0YwFcmjNFBbD+pz8hqWH5lyn0igG1rjHkZiBGrEw0lwwL3uvMOoE
	ZLOZF6pS5M6uG1betRpWfVlVsZDShuQrU8Wd1HNj95D0yRcay1P9NY70TP/p4DRG0DZVoJCuUzG
	8eelrdokbr8GG3mjruiGuin6NcExQN3pxOmYv2KYE09jvNp1v1fE7ZMZbabNFw6yP1ekw0BuoGj
	5N
X-Gm-Gg: AeBDietN+T62CZNnmfclYU5gVxgByAOWZBv1++6xkB1HK2lZihmmRoWBdl5TunXcD7h
	9hJKp+R2j0RPf0bJpCULDl5hAuAL9+ifb6J0Q7EbnOkZc2M/LXzJF95ORug20xxKYC+usDLESga
	IbcW3tzjWM0o5GvxJ2Tp+bGfNrRBjvOCcezp0+7d8WxkWUOY0As1kKPOVTffr0o5V5UtFjdsTH3
	io0etfiOHRk8TbdeGvpoUqdiU2zITDk9pwBbINLrsY4nd4Y6WX0Ku6OVTqLoSv8ZiPEWJ44jcWp
	pUlh0Oy8SUiMYBf9l6Sd7XVwVP4yrP1oyhQ/aPbZmkzTQBPHy7D2hhdBrlHLq9kfOdiZfXWcZO3
	EV68OSesW/Zvjh174BV/FNUoR3jvakCQgSMnOfEhBbM2pJsWTzcW1XN3sDdY=
X-Received: by 2002:a17:902:cece:b0:2b5:f105:52b2 with SMTP id d9443c01a7336-2b5f9eceba5mr46078145ad.9.1776456122210;
        Fri, 17 Apr 2026 13:02:02 -0700 (PDT)
X-Received: by 2002:a17:902:cece:b0:2b5:f105:52b2 with SMTP id d9443c01a7336-2b5f9eceba5mr46077745ad.9.1776456121556;
        Fri, 17 Apr 2026 13:02:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3ad18sm28953315ad.71.2026.04.17.13.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 13:02:01 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] misc: fastrpc: Fix NULL pointer dereference in rpmsg callback
Date: Sat, 18 Apr 2026 01:31:46 +0530
Message-ID: <20260417200146.184425-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JcqMa0KV c=1 sm=1 tr=0 ts=69e291bb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MnYYGAq_QTRuFDU830wA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIwMSBTYWx0ZWRfX3tYvqXDRQXjr
 0mZsFIPebUPHSKdqclOzopsoMW/guyNICtiOhWD8bnMuGJwIQl3dzfMGmZb0+Uw5UqJ7IgRnAFM
 L0QGL6bDiv7stHqJkYosfC5zg2wRSDN92X6VLjeWj5br9hVcJeU8WI3QJ7fP2EIib6X4r1n3ahh
 LQiGsHSA5OvpHETflyOdFf1flDSVH+Vu34wXnkZ0wcA0mpiAM1X7cdfmRoKAiPGzWrQ+SPFEHTr
 dz5osbRYk7YiWtAR4bH9/jN1spHBSHnkDdDlhaVs/O2zEpAt1An9ACqKPmDiGz5ysR+J5JZ9QB3
 eWB8MRBq6iwHmytufHbDTEubbKYyWXi0t0BkQX1XXwlUUQdpSFlLOs47oF7L6DT/mO3d6nQIpyT
 vNJ9ZK2hB39qS+Cuq7TFOtGiayhONS2RIPhecneLlB+HuLwKWVpPcDEjvn1G3kQrwfLz+6SGR1Z
 dwINGRPev5iS4WIpK+Q==
X-Proofpoint-GUID: 5DBT4j86qEKVEf3XojXsuORPhwTei28o
X-Proofpoint-ORIG-GUID: 5DBT4j86qEKVEf3XojXsuORPhwTei28o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170201
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103565-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9857841E6CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
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


