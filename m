Return-Path: <linux-arm-msm+bounces-109789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOm1BheAFWr3WAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:12:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BD65D4B8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D1F63302F402
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CDD3DF015;
	Tue, 26 May 2026 11:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lfHn88wO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYMm2USC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A703DEFF0
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779793929; cv=none; b=GPewkrOLA6mUi+a4hgB2p3HtAGG3FZTwFqzhrKgAHata5CfGmQmcmQZhREY33RJhJxNGdDnXy4QTxnl0Xm4ZP1C75Z6q+SDI5+XPUYyBYqyZi1KoDbhBDFOYIcTP5I/Hsw5unAV52lREtqs/BRSjEyQVNA3YMd+59mhTgqGhFlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779793929; c=relaxed/simple;
	bh=uYD2S2tXd8R9R+Lfdo3Pbu8iaDoyg5n62I3w9cpYZYc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M9wWf0JT1N1nlS6vUAdthtOyoUQ4/7RDtWlV/ronAv3onB4DMX9sjBAfYpIVF3Tl8jVeYzk36r8DL8/8OoqPQoZkn/Z66MrhEXGIQSTC9v8z94kA5JKbOJjm/PU5UCxGTm/eUB+dWv0sHTlvLubNY8z5fkkRLkUAFpYtSn4Rd7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lfHn88wO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYMm2USC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q7AXpj3264052
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yE5zp//7Dfu
	QE0K36XHvwhH9aqHThjhno/dJ8VRxZKs=; b=lfHn88wO1tzZ3YjwQ7qLJba1r/N
	zWBI9ee4GJlrXDpYax4eKjLCEC2tC5/1rek4s0ZwVq6ntueyq2rlKlIbY8G1DkmK
	uM/RLrsKvZ7tSYLsRu3Pb9TVDSew+faoVT07bbaf5MPp6r2AfOKQnXcev7Y2u9X3
	x2Q3RobBvzH1wCYeWLq/c2h+4KErfAUUBUCFyKgcR2zxZeY/bBVX6SG5Si934vR0
	zLT0KUnKxhBXJAuMnzrsK8vTWToIXNbLKaV2Lc4cLd5zVmaY3zSYJfn3pLAPN/b0
	umqbM0nd2IdRbyR0r4iX9GBL8A9ntvH46TDvHzxYH6XZHLOPfgIHigwhq4A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs440n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:12:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so10566881a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 04:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779793923; x=1780398723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yE5zp//7DfuQE0K36XHvwhH9aqHThjhno/dJ8VRxZKs=;
        b=OYMm2USCBUZRz4SKN2yufK1fXjWuGc69pjU5Dzq1hKukaHMaxkS++7WzY49vovfleZ
         cnOxh4PYHRnrQgfj47hu3XZgonwnW72SYLAX1m6COBFH/VzeLO5SBJh/gQhsG4chI0MS
         pL6tmCtR3CMw6cQ9i6FytCIQzFasloVw1To+9z7fR2c2DNB4xnUKe6OfQOKyAuT5DeQQ
         1YhGXpr92JrzuFgbeaEF0Rv3zDdY+pmwGWqxQ8G/BNTX7Ib0Iwot4X9bRcdzr3+yLry9
         MN8WQZBu2TSsM40oaU7ijkfNUQMchlT6q+r5dLaKipUz/CPM6wBa0tS5ZXUsDniEiO+K
         jqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779793923; x=1780398723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yE5zp//7DfuQE0K36XHvwhH9aqHThjhno/dJ8VRxZKs=;
        b=BrEKMeX5Gc2w+7pSbxK6HzCtnyLwBldtlFmtYJzyuV2FD2uRodwl/Ss8SreBZOp0Me
         xo9Ee6mOzfLDFV1ZLYl4WIYckaYRNfzHod7Tnwxc40vyl2ttKK2u796jgZFRZNxb4AWw
         +o2PgLT471fVVClYcPvBeZyjP4y1oHvJTWWDSkEAxZCjTP29j3RewuH/Ciz6LkLzdION
         9d/tN/N8LaQo/ji+p/+X2Qtxuq0/NurPPwkMA7Y/yM+Ml8Xcx7nS7HSW24li3vaRIPE2
         H9/RZRTGS+a7Gpyfg5+Fbyz5Zd1NIOan5G+3k79E2qFWJbKYuzrkwU6XpqvgGuikCRBv
         pGdA==
X-Forwarded-Encrypted: i=1; AFNElJ/JbYkg1pCWOtDPMOCORq3R5/6vjD2L/2yP0vhfuDIOzJCfo8w5X3l19dyHOy0Yo1+Ga7UmjcPy7iG7gpGt@vger.kernel.org
X-Gm-Message-State: AOJu0YygKAsj5ITFz5XcPMaqBuovl0azWUWdUBG0yak+ck86vBe8zfCp
	ppXcXE+e4G4qEO+rbIJuiCnp8xwmHv4/hPQZaeAKqSiDsC4X0xLwblydRZayh+Cunh2nA+yO8Wu
	1qvoA3pF78v4E4H2L7oVKM+vyi8FUe2QCZZsng3HEH6R+AhGDnFu+UGOPJJ3fso4UIJoj
X-Gm-Gg: Acq92OFGJetCBGRdHb/c/yfbc4q2GdDtTxeiElRbC+ttC/m5CMmHr/Puo2pbdLj5jed
	EkpUJ9WC6okUIyT/ogTjg9DFDuPl/GBLHylx42dOI68zFKDbUPN01k8qxRNgTXLkgaK+Pz9L0Nv
	/wZL9EZRQa39K8CcfH3tvfAhHsU6hWH4B2pco972fz+Gpol0uspEMyfZlCRBjfxMrIBYPa2oBGD
	fYhNroqBocfPIf8fsS2mEQN7WpGZVHpF6b/uPrCETUuSjfl0Fy2l2XBi1Ig3Rw2YhGSePlfLeZE
	tI+zCVPPBVe3QFOF6s8uywfNTyYCqlSjKKMYeEfeKH/s6qd06QUGgDS7EG6yU161wahX4cJckFu
	VTgHmE0d55v5t1HHjApr9+UNTYE4SF98bmYrxOgQqvp0ofXPulCHKsSTLlDoQyE6PG6V9FXMavx
	bqFomqJsF/X5v3Oy/g32yz42lUEmRx
X-Received: by 2002:a17:90b:3b8a:b0:35f:b647:d98a with SMTP id 98e67ed59e1d1-36a6749eb2cmr18032369a91.5.1779793923454;
        Tue, 26 May 2026 04:12:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8a:b0:35f:b647:d98a with SMTP id 98e67ed59e1d1-36a6749eb2cmr18032342a91.5.1779793922963;
        Tue, 26 May 2026 04:12:02 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c4ce6bsm12104253a91.11.2026.05.26.04.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 04:12:02 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez@oss.qualcomm.com
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v6 5/5] misc: fastrpc: Allow fastrpc_buf_free() to accept NULL
Date: Tue, 26 May 2026 19:11:24 +0800
Message-Id: <20260526111124.515-6-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260526111124.515-1-jianping.li@oss.qualcomm.com>
References: <20260526111124.515-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a158004 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Dpl4kN4VNrDjC7DZWhsA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: ECW3rrZgkHmfTpR7-sn5YBHrXwAX90I0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NyBTYWx0ZWRfX5HYLftgLTd1L
 SchwHQebT1Vq1NBJbzm2wpxvMWaMs0x0JDWVM/rpsj3ar+SMv10A+c7HXq2gs0/0YGHc7oe9Mz2
 Qq15ZXFRjtc8OhyajvpBsXQbW1iT/mP8sPquNfCy1YklwlQ2G+VeUqRgtd99gYbzVdlqjQuJ37V
 dj1723gofUOPgnvvOmb734vELTm8Cpti11g3hGVosCdof4rLXAVWpUr3ZU0moiGxPGSVggm5hgD
 qIyGSDhIYXWGtscr5qOn9hTD2HjZNAmaY7IQbKoSwD3HA9sWOtXHGu4V40E8aRcvRnma0lSY9Fr
 byqgYcQDkCeVK1qT6mUrQurl5HHxIN26cX4LJIKuDAIAJrJpG6q71ZnT6wloQ00AJOpd+qC1et1
 brYhtuE73UGBClLHCnbMogtYSrkPstkzjeZPuF4CbHWfLQVhXGyTkTuoZ/wtNre/NEiDeT2599E
 c+nhL7mkTl0AkzzsHSw==
X-Proofpoint-ORIG-GUID: ECW3rrZgkHmfTpR7-sn5YBHrXwAX90I0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260097
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-109789-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88BD65D4B8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Make fastrpc_buf_free() a no-op when passed a NULL pointer, allowing
callers to avoid open-coded NULL checks.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 0208208c2d27..6f3cb4934156 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -418,6 +418,9 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 
 static void fastrpc_buf_free(struct fastrpc_buf *buf)
 {
+	if (!buf)
+		return;
+
 	dma_free_coherent(buf->dev, buf->size, buf->virt,
 			  fastrpc_ipa_to_dma_addr(buf->fl->cctx, buf->dma_addr));
 	kfree(buf);
@@ -510,8 +513,7 @@ static void fastrpc_user_free(struct kref *ref)
 	struct fastrpc_map *map, *m;
 	struct fastrpc_buf *buf, *b;
 
-	if (fl->init_mem)
-		fastrpc_buf_free(fl->init_mem);
+	fastrpc_buf_free(fl->init_mem);
 
 	list_for_each_entry_safe(ctx, n, &fl->pending, node) {
 		list_del(&ctx->node);
@@ -556,8 +558,7 @@ static void fastrpc_context_free(struct kref *ref)
 	for (i = 0; i < ctx->nbufs; i++)
 		fastrpc_map_put(ctx->maps[i]);
 
-	if (ctx->buf)
-		fastrpc_buf_free(ctx->buf);
+	fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
-- 
2.43.0


