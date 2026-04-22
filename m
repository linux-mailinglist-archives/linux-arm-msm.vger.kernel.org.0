Return-Path: <linux-arm-msm+bounces-104049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCokJByU6Gl9MgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:25:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05012443EFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A97E3020FF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE033C199E;
	Wed, 22 Apr 2026 09:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DHrf/4OQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZwyTCYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C903C277E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776849863; cv=none; b=tE9qVhJKCP6Ab5QYd60rgduk0ki3nZFNVUL0Ox2GOflgdVvjurNzkByeQXsLv+kkNDx4YQuHzg+ymHWX2zWXPZt2lswhxK2gzii8HX77Zlds9O1Vi72SwQSwbDFfDs3kvEhvmWt6bz++o5ySlq78BghcL/hFxVlM8QwNmBJgTEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776849863; c=relaxed/simple;
	bh=fqGiXwv7TMUQTJi8HRdgDj9tkcWqqY9b9ZpTnTA2HXc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WNr7uAuLK19pB8Yg5ynZX9tMGj73ue1ti/YNuYHN9IXef7+1gu8jtpEKOOP9pg2bEjWbOlMYLbFrpzJI+pnb+glREc+6xgAcl7u8O6fZDB17LhQlZlxKcBn3K/Yrj3pOf1Ju4T2ZwzHEZOHKSZoKtCFQ4jV8BM7EWP6X+H7gsgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DHrf/4OQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZwyTCYb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M96E75664048
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ISnEXNmu4DG
	VhMqbwORuMrVkS8MlUvvf+D9exDaKuko=; b=DHrf/4OQ+EA2LvFiKGv3BLcxxH+
	D1keSCX1Mij28qi103rgC+sMN12z+Rtwh5xYixs7OhjZqmMpaX7m4qCYPHPLTULl
	PMq9jyvC3P/fCnmdH6Cbqyx2/6z4hNf3bc5jfqN4AUa/gQHHqQ4F4RskkvhJPA8v
	HLjzugcQN3aD4icLNAM46Et+gHkxVtoAmJMkFpQ0xMZlSO6ep0rDMNoxBjQCQOo7
	OMnZDzTOMyKxKtp5iSDmHtinI4E1KDKQ/vv/HvjP8k/DnMSgahtkKw7F3KMd6KBs
	KlN5Qy8mqMFt2HEUInzR+xyLfL/jezahsWNx1nlBdOV3OIHBVTyBfNprlXw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgr33t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:24:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so6391383b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776849861; x=1777454661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISnEXNmu4DGVhMqbwORuMrVkS8MlUvvf+D9exDaKuko=;
        b=EZwyTCYb7ArFVxXya2lSXHnq7kcWUp5zZ3tnlMZAdxO1aHRjcTQAJPBgwwzCWdvWhT
         NLc3sPMcYDQi0QlRh+EAsmNhfgmhEgVvJFgkGrrcBkepq6GyU3/9GjtZEklvYu6EvOCL
         5XPBcm7H0S/H9d5EFiyHYheARMTRElm5bR6Uy4K35RTQFKshoYEJIj3tPDlBxhfsJ53h
         Q61iou6onteCFZKow0/RghKUvgq2BszRMPebXZHbyk9R6MuixaCqBZSW9iNJHrL59a7M
         BcV8pE6MFeKmSX5vjuFv1y9bP5xc/7dJtmkCxQV8X3beKpiuhvT0/8sOHWKwGNqB3KEf
         zXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776849861; x=1777454661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ISnEXNmu4DGVhMqbwORuMrVkS8MlUvvf+D9exDaKuko=;
        b=gPt9GKgGyVLe3voGI6c92TbGACNWDiBAbW89FvGIXi80HOIaVBSlbdp+aMozdE2202
         pvrN6zcsqEcLXvIZpeBdPQjk8vrgtEkOZnRzG3aqLICmCsF0AESK5AoBecpWXBMh0jse
         m7VtGWrTQDNJIndBDVtN+PnI/N91eu4bCUOptuqAnrhb20MZWkrqOUzl+qeVm2AC9pWY
         LUQvERhji3Ldz/iuZeSAFc/ZCKhg04YEs1AGjmu+vDmGDCbGwRmDKH76V4D7e/OKw8/R
         cwUS66TphLXwZIDjadHhUXVXVvjOt+s0GkA5OKQnE2bQFYbGZL6tU63+gt0CFFqJrKC+
         xahg==
X-Forwarded-Encrypted: i=1; AFNElJ+OPCKstNYuhr0CAn0x8DJ+TT120MRxgt2Ps00xEc59dofoaOA5Fo6EJ5jAReHY3/riUFsgwRy3K952ILKV@vger.kernel.org
X-Gm-Message-State: AOJu0YwMEge+ttf9MmlNldkm4QKZqYueIEv0uo3oc4Q6m5LwUAwIogam
	dHrPrh4EDYQrBg0S4g4CZDuDX0YIp0beS8dx6Jor5w7mI+ybUokRdNZ7ge48hhW7WacTlnJBuM7
	z4lFTQ+pqKyikf3A4ib/NskpASG3wk1+keXcdEefm4JM12jcXwB146kuA9T+Yq3kJoHiJ
X-Gm-Gg: AeBDievNROWujedf1CNw2HrNimQiIF/wH0efzOrKpHVsNkN9liscMw/2JeSpfHV9i8d
	G5cry+aSLHjv55W1QUTYE7Oy6N+cobb6qsgOsNj4wpgqt2Tw9kDxvMLi4rmkjX6nV4ulDbajc+4
	H3u//utzf3FDyfzt7W2aQvzxIBc+4nH+RTNxMWCFWi3+/sZGbxeQTdU5PkePc7NUo4KhqgbSAy2
	s1skQibX5NQ7uk9VQbK1vEq1sF4Yos1zdsoxX5sgcJj1vm51XbyT5tatW0A94XyKg5noEc3aC8U
	0RLdw0YIfiDHY+KhgQaTfhibCp4pI6D1OaD/iZHmqvO9YPY5Ry2kSXTjxWL95ypwoiZzx/EW0Mr
	qe6eEvalcAXW7j+PL/WGCI/9Bpn3FUAphRGeysQe9EASjjOz/UUV22UTm6kSAl4/o
X-Received: by 2002:a05:6a00:116:b0:82f:9d21:d352 with SMTP id d2e1a72fcca58-82f9d21d516mr13893526b3a.9.1776849861160;
        Wed, 22 Apr 2026 02:24:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:116:b0:82f:9d21:d352 with SMTP id d2e1a72fcca58-82f9d21d516mr13893499b3a.9.1776849860677;
        Wed, 22 Apr 2026 02:24:20 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb38ddsm15778576b3a.34.2026.04.22.02.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 02:24:20 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ltuikov89@gmail.com,
        konrad.dybcio@oss.qualcomm.com, andersson@kernel.org
Subject: [PATCH v9 1/4] misc: fastrpc: Move fdlist to invoke context structure
Date: Wed, 22 Apr 2026 14:54:06 +0530
Message-Id: <20260422092409.4107093-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260422092409.4107093-1-ekansh.gupta@oss.qualcomm.com>
References: <20260422092409.4107093-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zWbTErG0ANRCVnq0l_h1LHPz1yYfjZD_
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e893c5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=IPuuj3Sbi4WKP8RQR18A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: zWbTErG0ANRCVnq0l_h1LHPz1yYfjZD_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4NCBTYWx0ZWRfXxpQbZc1hm+wp
 vgua73SrkBWRe8ZSCZKMub+fA+LSMM1wQySR6YpADE7jUmD4lk7SxKtWsUnFEIEaMaxo5HmgQtK
 ZoHdpOQxahfMlC1qbnzf4/AJgZLMAMYJCYWnEG1IuKtvPOzu6zpcSADwtYy05ut5nw1dv2zKm+x
 ryDzh4lknMx9NMXgRbRbrXZM3bQ/STKdyjemhZwj1nEJYy9m6wB6trLAVYFPVz56RmCNMHTHmcg
 YU8UvGdcs2kU4qRA11ToPNR/YPPSEsU03QqqKaOMQDS9tnQ94NkeI33V26vFPOK7LKG7ujRItWt
 2kHWdzllbvzFtkusEgKWLpxcJKTrywE9GPIw6AshGj+GejKgRfzTJmXBQJJwtMbYzN79C1wi1Em
 lyHaKTSfsGuI95H+NDLLctDNlyVQ/9Bg1uF+TAmKQ40SXUyLgxe5cO2GLiRD0SzwwdmXzj0KXUg
 6UVm5Jqiyr2/dJdI9eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220084
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104049-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,quicinc.com,vger.kernel.org,lists.freedesktop.org,arndb.de,oss.qualcomm.com,gmail.com,kernel.org];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 05012443EFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The fdlist is currently part of the meta buffer which is set during
fastrpc_get_args(), this fdlist is getting recalculated during
fastrpc_put_args().

Move fdlist to the invoke context structure to improve maintainability
and reduce redundancy. This centralizes its handling and simplifies
meta buffer preparation and reading logic.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1080f9acf70a..a9f507a88c67 100644
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
@@ -1016,6 +1017,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	rpra = ctx->buf->virt;
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
+	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1118,18 +1120,11 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 	union fastrpc_remote_arg *rpra = ctx->rpra;
 	struct fastrpc_user *fl = ctx->fl;
 	struct fastrpc_map *mmap = NULL;
-	struct fastrpc_invoke_buf *list;
-	struct fastrpc_phy_page *pages;
-	u64 *fdlist;
-	int i, inbufs, outbufs, handles;
+	u64 *fdlist = ctx->fdlist;
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
-- 
2.34.1


