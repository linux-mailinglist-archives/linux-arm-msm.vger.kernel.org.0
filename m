Return-Path: <linux-arm-msm+bounces-92865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOfqIuMOkmlJqAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 19:22:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1146A13F5F3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 19:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E067D3032F47
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 18:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB972045AD;
	Sun, 15 Feb 2026 18:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+RgyxQW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9PdyRnC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9100D260566
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771179708; cv=none; b=TW/UjF6W9BZA1RMJ0kn8PCmsKCADeZINREu4UWnCHr3cdmiSaSM2EQK1bzTktbDQkIsl8VVGS/qPymChI6zg9tgyRALDEcV4EWkePCmon4TB0Ywuba0DOEiainTIbKbPY4EU6aX+GZfWvKIql9nWhad3/xvF7rJMK21HdRwr8RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771179708; c=relaxed/simple;
	bh=aYT9V4yjMFimp7i5AH4FrQXb7/rLIpKhB4tul51jh5g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YfWaLGjjRwbb7TfC1nkAs9njROGbx+XroCi4jXj0irolROF/t7r8mZSmiYt55MFqLcMxhk/tWIUONGxnY1wxbp5Op4w9jwL9wO/+blVdTroQ44F/KN9vbzWV0YhP6mkm8Se7H/bN+8QzPk/ukqKQmRgDVILM0GnxVWMOO5WGIo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+RgyxQW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9PdyRnC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61F9rbrL594630
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wwOwIZrghwl
	5hfUtSY4NZTKubqv0dn/EyjKwV7U9g9A=; b=E+RgyxQWdFXLZYrSJYq5GRl3oig
	HV9uQBOR3sDUmD8PIfsybURlJxigPozzSSHtQXEdYHefD8jtBrK/DH0jGSMYNAfe
	eQ/vXvY6j4aEKajjwKXB+0Xi2dY4TnmxotEAETbDVt4F5lANd8YjBGasdTTrzUqF
	qatfTrsSvRq+Wlp90+ADZQmfpUQwK0fpfVF4fw5G6iQCFZKUUOBwQhrj84HuaxpB
	KVKYal5eutZm8NVkKEtG4ajciuxqN52MWW86dc1CTXgltqOEIW8qleCWuW5jODJ0
	r3BQKoKZLWedg4EMOG320WMXHlFtV444FxWQfv9KcvPvgusj4I7aC1Y9PCw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caerc2xjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:21:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so1313576a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 10:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771179706; x=1771784506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwOwIZrghwl5hfUtSY4NZTKubqv0dn/EyjKwV7U9g9A=;
        b=P9PdyRnCmqpIs4J0FyzPvNUIK2AHOom/yZQHe6MQFIM0+4gFQRxdM/XZYdhE/CDxDa
         dtv4GDK9JcqO4F5BYiW/1XUeBWDc7mMx4J9/wqOAsnx4moalSdNagyAgejR3Vy5oM4I9
         t50IBwGhBCbxODNwYDSHpiTpiTa2Qw+YyuR3VQIZDPEAfRm3ASh8K/Lc69Hj5WSCUHYY
         yE66I2DIRAPOzHIW3mnKbsGXQDfRpEl1gQd8pnBZ7gCoiyCD4ojuyMAXV5ZhftukGZt2
         awRsv6ApF3NvMFAMrD2xVtOCsGl9/Z0G5RmICCJGaQQfCImGDLl7gUYv4zjBJWz+V5MI
         oyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771179706; x=1771784506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wwOwIZrghwl5hfUtSY4NZTKubqv0dn/EyjKwV7U9g9A=;
        b=bz3wtTPNurTOnwD6keo3GSPh1gUyqrZNxHLiTg3/49aVhQMWTiUpoYqNpDGItI/s6B
         2VodC2u3FiRDOu5qLVGaB/781TtXbPam42dcYsC3B8MDjjI7WuNLxM2cea713+HMbAS0
         MQrSIwb91ak2Cmmsf0ejoc9H0KDSFkBBVWLeY+6ywBKxxswsC/Z+mrjbLuDBgzWI4Vxu
         ON3HER0Hn4gjlWn8r3ICFFFzpX6zkyriXLFzOsDQXjmMc0pSGfb7xzDis662kIJeHMp0
         s/T0Bm+4egZswyN/WZjHvhkcbVwFRKNNRNP2/9Ar+/2XpM4rwmUZ6KaikLHNleuYcIhj
         tYJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHDr64qhkJRGUhIAWr+6pRNQaf7YzjYsg+30110YtolfiiL576cuUZMB/J4uS7C0UBYkR62yXSAOBj6YIo@vger.kernel.org
X-Gm-Message-State: AOJu0YzdopELqYAgmwIM7dqxIevZwvTR0/K0ObRWm5Du/W/kS/pPA+dc
	yw01++V2s3YdapKnTy4iNabWn7Tz1tPB7cimswuEsNqV8rt2WmyeEGGs5xef9k3y/UBjminvYFN
	6hTEnMM67K9K2sm9n/KahJib/pJy8IrwBuAJBjz9FUgzNeExLN96UzVy1kk9fI6ia8klD
X-Gm-Gg: AZuq6aJK6T3TZIBizQRuywTsMoKuF6qGrX/9ZM9qMnlD3FOMRrr/3dfP4LRfYnZ+Z1J
	6fnFszuA8EYOYBVtJZ2NfmeGXe6VCYIrm2luFMOCwPbB7+3nK4Jd9bWO/kT4bVTiR/lemd2mWlp
	yQZQ5oZDROEQ1TOIwze0lp4wnFGRkf42v+vKqRAVJAjzlTNiHxXL6IPMIyMhY3UbOCUID1VW0eH
	yG3EQvP0fiCoN5zIRIPjSHfy4filIqxyJOiPeNlZCzVDBm5k61cWu1ZtPeeeTzDzFgtMpiszRnC
	cU/eCgr2wNawbeECkVV/pd9Le36hCawPenYRjSjgsBxq1pTyDWVXfoMg1cHniS7xt9R0mBq0qjq
	wAHbaXWVL12IU3OrzzoIMehCht+C4TqDDxHyM6NSRWa6teTusHqz/fA==
X-Received: by 2002:a17:90b:3e48:b0:353:2972:74a4 with SMTP id 98e67ed59e1d1-357b51ad1c2mr5356579a91.13.1771179705628;
        Sun, 15 Feb 2026 10:21:45 -0800 (PST)
X-Received: by 2002:a17:90b:3e48:b0:353:2972:74a4 with SMTP id 98e67ed59e1d1-357b51ad1c2mr5356567a91.13.1771179705097;
        Sun, 15 Feb 2026 10:21:45 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662e537desm17425381a91.4.2026.02.15.10.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 10:21:44 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v6 1/4] misc: fastrpc: Move fdlist to invoke context structure
Date: Sun, 15 Feb 2026 23:51:32 +0530
Message-Id: <20260215182136.3995111-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZJraWH7b c=1 sm=1 tr=0 ts=69920eba cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=hRzSbfjIAxXVlyYcgJ4A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: LVg8e2lSnB5tNGJtz7JegojgQLstg7qv
X-Proofpoint-GUID: LVg8e2lSnB5tNGJtz7JegojgQLstg7qv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDE1NCBTYWx0ZWRfX0YgUduH1FdwU
 Ug8TSfBxDVlEujU0rA4cGYMLuD5Mlae/I/xqlJDNktumg7O2tmsZ6dQ2chFcuz4Kv7tQEdQh6Ab
 Fya5plXgqqLG/XEOQJT5mUYNZeFg4VdXoiRgbeL9zpcRxI+Qn+SZy50uKmSvzLSbhNREhBVrpoB
 mJXBcETCpKpILRIF8Bu7n5FPy6RxnYa3bKU7+YuHkNb6m9hap/zlPYwxMOVk03eSzZAgPIX1MPe
 FQttR4XOlW5hv35n1sYL0zq4El5vs86FFWIRFy98vd2pVEjrKyayDwpHq9vD8dXJCx670GDQgHJ
 1e+gshMKm1A1GfMOtgDkbDX79NDVMVqbrtrGnPCTefqDIIh63/02WB0VIbZzpmFbUx1+qdYksBv
 U0NtaLYA0znyHvVAc+Db1YoynUqhVAgR5c8AFVGT0cYnp8Y8Uyolju9zNvYjG2p/NdgjB6YgwSM
 Dd3pr8MIos5vvc48ZBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_06,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602150154
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92865-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1146A13F5F3
X-Rspamd-Action: no action

The fdlist is currently part of the meta buffer, computed during
put_args. This leads to code duplication when preparing and reading
critical meta buffer contents used by the FastRPC driver.

Move fdlist to the invoke context structure to improve maintainability
and reduce redundancy. This centralizes its handling and simplifies
meta buffer preparation and reading logic.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4f5a79c50f58..ce397c687161 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -233,6 +233,7 @@ struct fastrpc_invoke_ctx {
 	int pid;
 	int client_id;
 	u32 sc;
+	u64 *fdlist;
 	u32 *crc;
 	u64 ctxid;
 	u64 msg_sz;
@@ -1018,6 +1019,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	rpra = ctx->buf->virt;
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
+	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1120,18 +1122,10 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 	union fastrpc_remote_arg *rpra = ctx->rpra;
 	struct fastrpc_user *fl = ctx->fl;
 	struct fastrpc_map *mmap = NULL;
-	struct fastrpc_invoke_buf *list;
-	struct fastrpc_phy_page *pages;
-	u64 *fdlist;
-	int i, inbufs, outbufs, handles;
+	int i, inbufs;
 	int ret = 0;
 
 	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
-	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
-	handles = REMOTE_SCALARS_INHANDLES(ctx->sc) + REMOTE_SCALARS_OUTHANDLES(ctx->sc);
-	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
-	pages = fastrpc_phy_page_start(list, ctx->nscalars);
-	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
 
 	for (i = inbufs; i < ctx->nbufs; ++i) {
 		if (!ctx->maps[i]) {
@@ -1153,9 +1147,9 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 cleanup_fdlist:
 	/* Clean up fdlist which is updated by DSP */
 	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
-		if (!fdlist[i])
+		if (!ctx->fdlist[i])
 			break;
-		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap))
+		if (!fastrpc_map_lookup(fl, (int)ctx->fdlist[i], &mmap))
 			fastrpc_map_put(mmap);
 	}
 
-- 
2.34.1


