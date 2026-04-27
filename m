Return-Path: <linux-arm-msm+bounces-104697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGUqIzBA72kM/QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:53:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 151D24714C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29DA1300DDCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963931A681E;
	Mon, 27 Apr 2026 10:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K5X0HsRW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O23U9NqZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419AD39F183
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777287208; cv=none; b=DGiMXvpadHqyW08feJoWG32O8Bgf8p6hYYMPQL0OBPCVWMV25aVGjcNAC3NBpLIt20dNj9S+UNf6BJb29Ly5ijpUJGI4+8ZIPG6fr8Kc05kwOt9kpRXIgqRVyO6GDL+OUleP9boDMRDsjOgVS07v1IyL1Gr9luSUMI5KnT7+MFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777287208; c=relaxed/simple;
	bh=yBeiDgGput3d9bjzefyAiKqk5DmKgCg0CSjSdvMlmZw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YjLH94wmrV/N3D73tAxOZYE3Xd8Z6S+r0W8SSKvWUqhwnntRAgDZuuicUi9KZzcyC0T9fN8E0dsILtWL3u47LNe5fT0lFki9FMpmhtnrxPml7Jeond5QjWjyAwffezSLCFIqKC8hjjuaT32MJIeODBXQgJ1KzK3hafw+2T91pK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K5X0HsRW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O23U9NqZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TBwv665664
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0ji/W5Knfx89fcuTargogWia1K/65u9oFmR
	3dCs3hcw=; b=K5X0HsRWNUEcNTiGmaED/Ss6KNMLvY7+MIjI/9t8VoxCxFzMK4f
	2jeu41OezpZjuTi4MDdQUATlq5CGXRDmSvWPO1VqjdMx5M9Qhf+V9sHyPeTf+A5w
	5NWUtTEBJMh4kWLfY7eUTmZLwPN3n/ic23wXYSU5aEVJLoObMXFi17hmHgvTtzNU
	3olcp2zw2ozpm6UqnN48faWqUUSCHsITFd3HphqKa4T/JCgxcS9OPeZO6dw7Qa97
	+4UfaORX+d6yG11hIXdUVEl/YB8VP7bCTACU/rMJrZyWFWx2UFqrQGLxij3TKETk
	kt9SkoRRnYtMtjiqZmSb4N+lSa3Mp3VpTNw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n114e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:53:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c79744a2d99so4349199a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 03:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777287205; x=1777892005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ji/W5Knfx89fcuTargogWia1K/65u9oFmR3dCs3hcw=;
        b=O23U9NqZFk+D4wQrOP4Eff/4b/l7ztXtQ+26YOKV7/TxbKc6k+B+NuUzl+r0dOvMIc
         nP83rHMYBj4wR/8jUbt1we1JDeqYHBxiNw+DOidiybzC2vOWtG80AhnwYxJ5tOgvAviz
         WYP3XOLJ4ZWhFTMEmWzbLLnVTjp1LPMrO6banhADgR2Cc1QHG81Zl/Cg+9aPN6tuaO9n
         qdBuYoUdRMHwoxze7hNGgRDZTlB6vHf9/GpMaQjtCqqODmCJWnfTMIZ/GYBgTBt9rTQ1
         VhtdgIE5sBdJcYde7Hfa5XVgYg1rIrnGfoBmmJEy61oMfcmTYYX+hQD7HAJ/3QAfJjag
         mm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777287205; x=1777892005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ji/W5Knfx89fcuTargogWia1K/65u9oFmR3dCs3hcw=;
        b=WS3rnDAVC9lvsMk9RtqtZUFWLbuTthWpmoScdjAPb36bgpf7bltaVi3UVD7iDKoyum
         Gox+9BZD7/ZLzPr587lX6B4ZxxINYi6fpLRpVzqq+1pwOYteEDOTh1JbH3NQIpOG2yrr
         CwNdra4Vkral9m4h+ZkWB7rcwe3EsnDCdyiUfGPit3pJ0+F9pqQ8bOEdF0fYcRqoUG71
         jgXot+UpTVSuMTzhwks2cP7E4CK+YP8Yhx8rfepwkKzQTngg4KeIEXJ+GyYCLeZP0oI7
         TIcLn8slsKKvwVr7JWU8zcaZty3xTT1eK5yF07Bdddx9Rmjxi2jJIIA9wrmPLkuXrMGL
         9+sg==
X-Forwarded-Encrypted: i=1; AFNElJ+b+hLj/17pkRRjKqeaNdBUfhmm4I5qp4S/H46rJOE+gdlgc6A31LGD/sCc9k8l9M3wVwxwbn4vlGtJJTfv@vger.kernel.org
X-Gm-Message-State: AOJu0YxpI3x9v4+5O0KYUc0e1bpEzD4SKNR7zkhqCcEmIsXCVOBeoBc8
	OHBs45sU2mIvC45gcQW0E6xML6NOu1HwQiKNkEClykSLjTsyMcA7YHY+hp/wszVNt2YCPUNfJ9y
	tWuaBETOq4fWtDxsSdToFaJ4gzCtBWPubXpnAKjypYZ3RllxJ/FtC3hJFoAJrszpzkC/l
X-Gm-Gg: AeBDieue44tXDKaqU9jJ+Z+7hcMd/318FHaodQlWoREPqEsFTHyfeDJr1jcxW+htsJU
	JHKTxHoP5yb64F3pFT0U/iKfXXkU+dH/DepReacW18EBNcII4lABU+8mGwqqgr5PLA1k6kWUWr4
	0gl34ovWOpH81XPId6oWfz59tx0MKc6i3NZzaqaoFCfdaSl/e7uJO1cfzoq8QJxqXJYumLBKD56
	0EbBDSWPh2/EoloOTdINNEAVkezWBC8bvQeI+D7MBSzupPYFDGfb2V2k3nFYkCjm7j6dPRYREwj
	FBkrvCxnbvHIXR+B8FWQJEpG17vBxFDAGiCua79mmAK9VQpfY2hddhdd8l9pFmgDupM8zkAIUSR
	XIsm65wEx2ekUrSESO3MNE2HZNdavMjVnmp7nA0PYpKaU0OZOGMh5j3cRMOtpRh9a/uiiC+PSos
	JS0sle+vpQARNe4jFDnacwSM/lYhbp
X-Received: by 2002:a05:6a00:408a:b0:82f:4a53:a95b with SMTP id d2e1a72fcca58-82f8c99177bmr47464169b3a.37.1777287205074;
        Mon, 27 Apr 2026 03:53:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:408a:b0:82f:4a53:a95b with SMTP id d2e1a72fcca58-82f8c99177bmr47464150b3a.37.1777287204607;
        Mon, 27 Apr 2026 03:53:24 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebba485sm39724655b3a.38.2026.04.27.03.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:53:24 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, thierry.escande@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        quic_chennak@quicinc.com, stable@kernel.org
Subject: [PATCH] misc: fastrpc: fix UAF and kernel panic during cleanup on process abort
Date: Mon, 27 Apr 2026 18:53:09 +0800
Message-Id: <20260427105310.4056-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDExNSBTYWx0ZWRfX5WhVl0OAgjIt
 xh47d2TCmfFfmFbwic+GVukc+oJWJIdCc/8FniLup42SzBrohodKDURZ/q4ikW8fqAywmGXQtoI
 qm+qZpFOTgvh3qvjdIsLuvqMoBI/x0UpWHDSww3OKFvPoT1iHlHxgS0R0il/zPwwKo6HzfRZq+T
 7CClWWg9ortxgy/EEple9yX/2vSvWW/Suom0mSvg0QeeuXr2Fy4YhuUgzjRG6aD0N5AuXd1zLLK
 ecbirL5TTnPBmhHt1/+ypOzOdKY+e+/UsHqBzhs/ehF2n14yAp4Ks77PIIQwbnepguJnYbdf6qc
 ASJ3cgz8awv4NTHh2VO/WyLVFqoQ1+ikjbzAuyc4yb7vDovTLzX4T7lTScApF93XQt5hZUMoKda
 Io5i9/qChFXTsTI5ZfJdgFaFiaGzgwKxzHcWe3/iOVr7lglRfxCdtCLfM0SQSVpxo7dRDEs154M
 QN0z49PPko0QRrkKZGg==
X-Proofpoint-GUID: a5T0M76Dt3QwlPE0JfgMNytW4Alp2lil
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef4025 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7UBpWWJXUKeOLZOJV8wA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: a5T0M76Dt3QwlPE0JfgMNytW4Alp2lil
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270115
X-Rspamd-Queue-Id: 151D24714C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104697-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

When a userspace FastRPC client is abruptly terminated, FastRPC
cleanup paths can race with device and session teardown.

This results in kernel panics in different release paths:
- fastrpc_release() when using remote heap, originating from
  fastrpc_buf_free()
- fastrpc_device_release() when using system heap, originating from
  fastrpc_free_map()

In addition, fastrpc_map_put() may trigger refcount use-after-free
due to concurrent cleanup without proper synchronization.

The root cause is that buffer and map cleanup paths may access map
and buf resources after the associated device or session has
already been released.

Fix this by:
- Introducing mutex protection for map and buf lifetime
- Serializing buffer and map cleanup against device teardown
- Skipping buffer and map operations when the device is already gone

These changes ensure cleanup paths are safe against unexpected
process aborts and prevent use-after-free and kernel panic scenarios.

Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
Cc: stable@kernel.org
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 56 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1080f9acf70a..3df771a4a216 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -255,6 +255,8 @@ struct fastrpc_session_ctx {
 	int sid;
 	bool used;
 	bool valid;
+	bool allocated;
+	struct mutex mutex;
 };
 
 struct fastrpc_soc_data {
@@ -333,9 +335,14 @@ static inline u64 fastrpc_sid_offset(struct fastrpc_channel_ctx *cctx,
 static void fastrpc_free_map(struct kref *ref)
 {
 	struct fastrpc_map *map;
+	struct fastrpc_user *fl;
 
 	map = container_of(ref, struct fastrpc_map, refcount);
 
+	fl = map->fl;
+	if (!fl)
+		return;
+
 	if (map->table) {
 		if (map->attr & FASTRPC_ATTR_SECUREMAP) {
 			struct qcom_scm_vmperm perm;
@@ -354,10 +361,16 @@ static void fastrpc_free_map(struct kref *ref)
 				return;
 			}
 		}
+		mutex_lock(&fl->sctx->mutex);
+		if (!fl->sctx->dev) {
+			mutex_unlock(&fl->sctx->mutex);
+			return;
+		}
 		dma_buf_unmap_attachment_unlocked(map->attach, map->table,
 						  DMA_BIDIRECTIONAL);
 		dma_buf_detach(map->buf, map->attach);
 		dma_buf_put(map->buf);
+		mutex_unlock(&fl->sctx->mutex);
 	}
 
 	if (map->fl) {
@@ -414,9 +427,17 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 
 static void fastrpc_buf_free(struct fastrpc_buf *buf)
 {
-	dma_free_coherent(buf->dev, buf->size, buf->virt,
-			  fastrpc_ipa_to_dma_addr(buf->fl->cctx, buf->dma_addr));
-	kfree(buf);
+	struct fastrpc_user *fl = buf->fl;
+
+	if (!fl)
+		return;
+	mutex_lock(&fl->sctx->mutex);
+	if (fl->sctx->dev) {
+		dma_free_coherent(buf->dev, buf->size, buf->virt,
+				  FASTRPC_PHYS(buf->phys));
+		kfree(buf);
+	}
+	mutex_unlock(&fl->sctx->mutex);
 }
 
 static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
@@ -439,8 +460,10 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 	buf->dev = dev;
 	buf->raddr = 0;
 
-	buf->virt = dma_alloc_coherent(dev, buf->size, &buf->dma_addr,
-				       GFP_KERNEL);
+	mutex_lock(&fl->sctx->mutex);
+	if (fl->sctx->dev)
+		buf->virt = dma_alloc_coherent(dev, buf->size, (dma_addr_t *)&buf->phys, GFP_KERNEL);
+	mutex_unlock(&fl->sctx->mutex);
 	if (!buf->virt) {
 		mutex_destroy(&buf->lock);
 		kfree(buf);
@@ -483,6 +506,10 @@ static void fastrpc_channel_ctx_free(struct kref *ref)
 	struct fastrpc_channel_ctx *cctx;
 
 	cctx = container_of(ref, struct fastrpc_channel_ctx, refcount);
+	for (int i = 0; i < FASTRPC_MAX_SESSIONS; i++) {
+		if (cctx->session[i].allocated)
+			mutex_destroy(&cctx->session[i].mutex);
+	}
 
 	kfree(cctx);
 }
@@ -800,19 +827,29 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 		goto get_err;
 	}
 
+	mutex_lock(&fl->sctx->mutex);
+	if (!fl->sctx->dev) {
+		err = -ENODEV;
+		mutex_unlock(&fl->sctx->mutex);
+		goto attach_err;
+	}
+
 	map->attach = dma_buf_attach(map->buf, sess->dev);
 	if (IS_ERR(map->attach)) {
 		dev_err(sess->dev, "Failed to attach dmabuf\n");
 		err = PTR_ERR(map->attach);
+		mutex_unlock(&fl->sctx->mutex);
 		goto attach_err;
 	}
 
 	table = dma_buf_map_attachment_unlocked(map->attach, DMA_BIDIRECTIONAL);
 	if (IS_ERR(table)) {
 		err = PTR_ERR(table);
+		mutex_unlock(&fl->sctx->mutex);
 		goto map_err;
 	}
 	map->table = table;
+	mutex_unlock(&fl->sctx->mutex);
 
 	if (attr & FASTRPC_ATTR_SECUREMAP)
 		map->dma_addr = sg_phys(map->table->sgl);
@@ -2217,6 +2254,8 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	sess->used = false;
 	sess->valid = true;
 	sess->dev = dev;
+	mutex_init(&sess->mutex);
+	sess->allocated = true;
 	dev_set_drvdata(dev, sess);
 
 	if (cctx->domain_id == CDSP_DOMAIN_ID)
@@ -2233,6 +2272,8 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 				break;
 			dup_sess = &cctx->session[cctx->sesscount++];
 			memcpy(dup_sess, sess, sizeof(*dup_sess));
+			mutex_init(&dup_sess->mutex);
+			dup_sess->allocated = true;
 		}
 	}
 	spin_unlock_irqrestore(&cctx->lock, flags);
@@ -2255,6 +2296,11 @@ static void fastrpc_cb_remove(struct platform_device *pdev)
 	spin_lock_irqsave(&cctx->lock, flags);
 	for (i = 0; i < FASTRPC_MAX_SESSIONS; i++) {
 		if (cctx->session[i].sid == sess->sid) {
+			spin_unlock_irqrestore(&cctx->lock, flags);
+			mutex_lock(&cctx->session[i].mutex);
+			cctx->session[i].dev = NULL;
+			mutex_unlock(&cctx->session[i].mutex);
+			spin_lock_irqsave(&cctx->lock, flags);
 			cctx->session[i].valid = false;
 			cctx->sesscount--;
 		}
-- 
2.43.0


