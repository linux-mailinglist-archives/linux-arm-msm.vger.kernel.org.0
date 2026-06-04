Return-Path: <linux-arm-msm+bounces-111260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9I4fJNjXIWoTPgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 21:54:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 195436430A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 21:54:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FI7YkdtT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="b/+0CPQI";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111260-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111260-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15653302D080
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 19:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30E13C3443;
	Thu,  4 Jun 2026 19:48:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6933C457F
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 19:48:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780602521; cv=none; b=g8Tz0yh6tPL1kJo6R5bUKL3t7P1pRvNDigmN3+KyaY2WAb3p0EtHpS8KaY2irhF/j79RQWdSeUqNtrjw7+LP2EAQfYUesDyRgCWJCTKjlYc71h4gMhHtDzb2T7tiCxNkG81pjIGuw1+YFnPdEiKvZPIxHiUfCXj0Tab/F6eebkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780602521; c=relaxed/simple;
	bh=jh2lEf+6eMBipLm3VD8oJ3QVgFOzdIJmSl73PZFad9s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C7D2yUBnoy7ViF/du+l9Uu73nLX2OKwHPtYb+ckveL5dX1aR7A2mraJFtQxXponIKGEl6v1TuUZtrWXkeYvpNetw+xg/I6vd5SXTI+ciFgLsMdeY/mhi49BWGYZSwnUkk5DBMlYyd6MqIlT11qqBGafgVPAXdnGzMb3qEncwsu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FI7YkdtT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/+0CPQI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654G6rkk1957408
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 19:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sRxjmDJb+ltIpXrcELq5y5l3qHN5CLUNKQ4
	NUVtbFo0=; b=FI7YkdtTWDJGlNmsgtR3JBqCnhDM90lpW6W8L4u2TOY7kQay677
	BnyLwGqmANG2lvioFQYgmSWnuUjGXjH6qEWG7PKUDDbioq3x3Iad0qbHRzPopE5B
	ZHVwpwcXyoY4hT0orlvBXMmVKRre4hVmQULGigX/Lzlsk1/xkL8ob4xZIo+omeqA
	7NqeviynjcJzCrCfjUcQ70QVDOXYvU1UsM6CO4MAHuaw1PgU67A/P6yDCf8oTStO
	0H4YSBxn674U6eyvSzeWT5M2PTUUo8O+/hJWq3rIPfn1Dj0r+rRAwpWDYB7XZEC/
	doTNh29th0q5vOiIMInkUB33Wcymx9Bju+w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekckps2mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 19:48:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d6389bbf4so1027879a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 12:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780602515; x=1781207315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sRxjmDJb+ltIpXrcELq5y5l3qHN5CLUNKQ4NUVtbFo0=;
        b=b/+0CPQIgAZlMdcUEK52XYRrO9fnJ+inhkbmDN+c5jUWQQGwzQzC2Cp33i52bRlf0h
         fM8Z9U2QXKdXI8JaDGyTKIT7gEwJpFXBhL+xOkUoEo3vtQr4EPTvGFxyK6LQ8h818Vws
         2P/dMCTV+xkTcAPficM64HyQujK/66te+AUjC3BR1q/33jC0B9iDWu4p5cL+H7vPuD5v
         p190KXkudonhqSvyqomrSPw0WPSqAZ/XcrFJgWhxoPgkE3+T3thyIeiMQjH/4vYkTfvA
         qQTSpbxfR7NjbIcqMOjK72L3yk0V4Nd67w1ZDQwrYW0VnEAQQGyYsDByi446GebEUG8M
         JzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780602515; x=1781207315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRxjmDJb+ltIpXrcELq5y5l3qHN5CLUNKQ4NUVtbFo0=;
        b=Bb4Y1NNaKl/tixDrmbnkmNun8L0nU5tYtXFktbU93Mw5JxVdVwZP/iNYCnzRnNsMtO
         QP5K563bh5cedNzj6vKqBsL/9RV5ClFFJ75/4ZHXxzMoY68sk72wXvlchL/7f+qbUzRG
         fuZm2PewZ6ArZDG0vdnxnvvRzTNbVxODeNU7Y5prSkiFSKwAV23p9KcRtNNLuGyNGbKX
         VFJzdqgWDGL9T81YXE5uK701s2yQX3rKm3ki4arClA5UQARSnOJX8MM45IRZdWbqMiJk
         ACtNiEatnlbC256c3IbKntDqq8BImNVNSZ60VTAZU1zNZDO186HGsgW6FYm9u/jVQ3Dc
         Q2Sw==
X-Forwarded-Encrypted: i=1; AFNElJ9Kcyi+Vy4O01LFI7Nbs6SccGqlawenelohqMC485sC0FEgef9oPkA7ROwCyW9iXh212jbTkR0p75GEIytA@vger.kernel.org
X-Gm-Message-State: AOJu0Yxek/61gKofs8Yda+PB1+BTRuCHg8/dyeiPJq+EDfun/eaPd+ui
	dWZxuGiigVgFGHoGk19Or12GUGR7mqbGyHNPOGeDCheDuJGVJ9JvsZHdZfvG/nGmfXWRrj7D0mO
	k4yqQVYP4JQlQRyFc20itVtPbWFfDvoHqXQjqmJcGwtMrnME+8zSfpuKRJHSzQp5Vt0NmGlCQpU
	Ix
X-Gm-Gg: Acq92OHsxCLcrQ9gJE/o10Yv9pb7MUvwhEqoLrLCh/3jlPAvqADS7zQJeAIZ+arGKyD
	VQxwhh2lAYxgFRLvhQVrSGXgr9fhhQqv1Z/0RMsG2BpijFXpuORk1ZoMoOksp+gaTT1tt3NikSZ
	o8PnjTPGK2dgHr8HDBLWOp/niIJp6Uleny/5M3QmYTfbK2k0Ql//zbkji4IgQb96A/tn0prMmrI
	txxG2BMCLReaGTI8yB1WQLv0dlHuowg8z685vgqwsVYpXr81v4czzwvT206Nxy7RjDAMmlsl94q
	XKDudh2wg9qLsV8ev6FKDk+tWDf/JGy/Ns97E49y0kDTiYveVPw5bId0RzzjOmvGdV/ClXFGEtV
	au4VRxFLaAPVHRIP5WF6sWmIoSEMDgTWiW18n7109591JG5ay+M4/zN+3XErOaLCmsQE=
X-Received: by 2002:a17:90b:4a46:b0:36d:bbe0:de7c with SMTP id 98e67ed59e1d1-370eeff19bamr421835a91.12.1780602515344;
        Thu, 04 Jun 2026 12:48:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4a46:b0:36d:bbe0:de7c with SMTP id 98e67ed59e1d1-370eeff19bamr421807a91.12.1780602514837;
        Thu, 04 Jun 2026 12:48:34 -0700 (PDT)
Received: from hu-parihar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-370f913bb37sm108567a91.2.2026.06.04.12.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 12:48:34 -0700 (PDT)
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de
Subject: [PATCH v1] misc: fastrpc: Add cache maintenance for non-coherent platforms
Date: Fri,  5 Jun 2026 01:18:11 +0530
Message-Id: <20260604194811.2437567-1-abhinav.parihar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jFAgPP21mXbDA6oMJs3DwYKZ5XGnDYkj
X-Proofpoint-ORIG-GUID: jFAgPP21mXbDA6oMJs3DwYKZ5XGnDYkj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE5NCBTYWx0ZWRfX87e6eHSf+wW1
 TV1KumKK9m1CIV+QB43qT5YJMmKvRZVbKj12LzcaK+4Ve8S+rgXV6IJEMaGBBvPuOMcfZh3H5fU
 oHG6m9SDPFnZoA59M7wtb5CaZGxH+IGWGTDZOAnb4PDYx8/RA2YZ4bla2sOJ6NDmAhpjRHbGg5o
 PLW80XH7sGkH0u9oBLblROcGvUD/Z3CNQlASXZwxe8BASi8PqTxFVGK9MhrmaQl9kLOdjwK5/OH
 /XEHdON0wdo1YcB5BJpAM43PjKJ8et+PRYk8M1eoQDr907THyZr4PihhK2GZRfuN6oqoTLuwMlU
 Cb1F3XCMjn1QSQAJx9/fSuk7jP9JwMLJxT99CrxzqdJni2SeqtSlH2jwmFQpMrE5TDofUVgXC59
 NmceerwirtH8VGOde77HKN+QVZwWrl1pohff8CBLLHMHiO6gm/SM/8SawymfPUucJHrXP0drqTY
 HxrwAiJhhuSxYWUguEg==
X-Authority-Analysis: v=2.4 cv=H9jrBeYi c=1 sm=1 tr=0 ts=6a21d694 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=4mxDCDZnYOL6Ru_i_akA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040194
X-Rspamd-Action: no action
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
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111260-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@linaro.org,m:linux-arm-msm@vger.kernel.org,m:abhinav.parihar@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:ekansh.gupta@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:dri-devel@lists.freedesktop.org,m:arnd@arndb.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[abhinav.parihar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[abhinav.parihar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 195436430A6

Some platforms using fastrpc do not support DMA coherency on
HLOS. On such systems, explicit cache maintenance is
required to ensure data consistency for RPC argument buffers.

Add cache maintenance for argument buffers when operating on
non-coherent platforms:
- Flush input buffers before invoking RPC to ensure CPU writes are
  visible to the DSP
- Invalidate output buffers after RPC completion to ensure DSP
  writes are visible to the CPU

Introduce helper functions fastrpc_flush_args() and
fastrpc_inv_args() to perform the required dma-buf cache
operations. These are invoked only when the device is not marked
as DMA coherent.

The coherency capability is determined using the "dma-coherent"
device tree property and stored per session context.

This ensures correct data synchronization on platforms lacking
DMA coherency, while avoiding unnecessary overhead on coherent
systems.

Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 66 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1080f9acf70a..043b6a5548fb 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -255,6 +255,7 @@ struct fastrpc_session_ctx {
 	int sid;
 	bool used;
 	bool valid;
+	bool coherent;
 };
 
 struct fastrpc_soc_data {
@@ -973,6 +974,64 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
 	return 0;
 }
 
+static void fastrpc_flush_args(struct fastrpc_invoke_ctx *ctx)
+{
+	union fastrpc_remote_arg *rpra = ctx->rpra;
+	int i, inbufs, outbufs;
+
+	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
+	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
+
+	for (i = 0; i < inbufs + outbufs; ++i) {
+		int raix = ctx->olaps[i].raix;
+		struct fastrpc_map *map = ctx->maps[raix];
+
+		if (raix + 1 > inbufs)
+			continue;
+		if (!map || !map->buf)
+			continue;
+
+		if (rpra[raix].buf.len && ctx->olaps[i].mstart) {
+			dma_buf_begin_cpu_access(map->buf, DMA_TO_DEVICE);
+			dma_buf_end_cpu_access(map->buf, DMA_TO_DEVICE);
+		}
+	}
+}
+
+static void fastrpc_inv_args(struct fastrpc_invoke_ctx *ctx)
+{
+	union fastrpc_remote_arg *rpra = ctx->rpra;
+	int i, inbufs, outbufs;
+
+	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
+	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
+
+	for (i = 0; i < inbufs + outbufs; ++i) {
+		int raix = ctx->olaps[i].raix;
+		struct fastrpc_map *map = ctx->maps[raix];
+
+		if (raix + 1 <= inbufs)
+			continue;
+		if (!rpra[raix].buf.len)
+			continue;
+		if (!map || !map->buf)
+			continue;
+
+		/*
+		 * Skip invalidation if the argument overlaps with the
+		 * RPC control header page.
+		 */
+		if (((uintptr_t)rpra & PAGE_MASK) ==
+			((uintptr_t)rpra[raix].buf.pv & PAGE_MASK))
+			continue;
+
+		if (ctx->olaps[i].mstart) {
+			dma_buf_begin_cpu_access(map->buf, DMA_FROM_DEVICE);
+			dma_buf_end_cpu_access(map->buf, DMA_TO_DEVICE);
+		}
+	}
+}
+
 static struct fastrpc_invoke_buf *fastrpc_invoke_buf_start(union fastrpc_remote_arg *pra, int len)
 {
 	return (struct fastrpc_invoke_buf *)(&pra[len]);
@@ -1093,6 +1152,9 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 		}
 	}
 
+	if (!ctx->fl->sctx->coherent)
+		fastrpc_flush_args(ctx);
+
 	for (i = ctx->nbufs; i < ctx->nscalars; ++i) {
 		list[i].num = ctx->args[i].length ? 1 : 0;
 		list[i].pgidx = i;
@@ -1239,6 +1301,9 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 
 	/* make sure that all memory writes by DSP are seen by CPU */
 	dma_rmb();
+	if (!fl->sctx->coherent)
+		fastrpc_inv_args(ctx);
+
 	/* populate all the output buffers with results */
 	err = fastrpc_put_args(ctx, kernel);
 	if (err)
@@ -2217,6 +2282,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	sess->used = false;
 	sess->valid = true;
 	sess->dev = dev;
+	sess->coherent = of_property_read_bool(dev->of_node, "dma-coherent");
 	dev_set_drvdata(dev, sess);
 
 	if (cctx->domain_id == CDSP_DOMAIN_ID)
-- 
2.34.1


