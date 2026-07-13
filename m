Return-Path: <linux-arm-msm+bounces-118627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZL3pNzt2VGogmQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:23:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 417147473F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:23:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FsyCIB7K;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gDVDFnrU;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118627-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118627-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED36E301FD68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 05:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95BB636166A;
	Mon, 13 Jul 2026 05:22:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC283612DB
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:22:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783920168; cv=none; b=kpyrPhsDgRA5gaw//lB4SSzR4Q/BnBqX80XisWdd1Qy8MAjKhK8KBIEUDlYXIJo17ZAHk0ZD3kXhD7Me0bFIf03Yb2iDr8ejDPZ7Oq1Gn6SUuyu/xhiHPXH0qbBrM/Wkf24lthzOcfzW+FlAnxbVLQMuqA20BxpFZ06ofTwFZIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783920168; c=relaxed/simple;
	bh=NaqRQKJ7xNt3Dy53XIaBrvccMA4Qf4aTZxSLLGeu80o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qOp3czfDgmc5LZyZeI5kbbK7PNAbC/x302CGcnWDbnS+miSxNO9hbyacruGsy9u5B7FVd9p5XWmMaK9AMHkgfUKMTi0Jtt5bFunhM+lVoGAacUYff9fw9WwVykRYuF452enpsocIhQjVbJ9d+O2pa++tXkthgf+Xdfj2HiAoB2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FsyCIB7K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gDVDFnrU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D39sHM216613
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TPodwT/8PmT
	IoV2zpAVITKv1J5JC+XSCVdQXBOcAIqc=; b=FsyCIB7KbwJydq6Ptp1qA7tL5xr
	rIuxXM+cplWdKwJGGH0HKO+XIIkG3AEeiPF/mn+3VGZc2TnnrGXFG2EPl7138ECH
	Qk9Gx0sPKhmhBW+4EswZaWK8C31mnFDNVTDNW7l6WkXfiRC+NKuAYJ6fk6TfscRs
	IrGE6dcttmGvxKI4rL6QxF85xxnXkEb01M1Kh0hnY2/x88c2ApDrImwb6GhO94r7
	wOTUvU74rxF/BRouC4M+0nnlu7mLpiUU4/eIhEma/PjwZnIiMPUilp9V1G0v4OGs
	qMbvGkCKgxh26l5yQDrpx7pp5G1gplaXZakcQkZUxrstoIyLqRsyBYD4mfA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr4cbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:22:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso2443606a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 22:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783920166; x=1784524966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TPodwT/8PmTIoV2zpAVITKv1J5JC+XSCVdQXBOcAIqc=;
        b=gDVDFnrUPYbcRQ3VPzZdqwub+dVF0tiC6LuKBbQ20uX39ovqpHW1gCBdY28cnrG6Ys
         qtZFBCwECK+yWVbcCbZ/uNjLRhdx50oueMV9A3aCIwuKLeyVo1qzCq1vmP4ayOBV5kyH
         QGwfyLmf1c1Mb7VuQ5ZVS5+fwiQEGoyemIbU2TB18/lBI7ZvtoiXQ2K7/EFdvd8SSrlx
         JP0uIUgWrN4VYDKqNNRvwaEcDkbQI1ZXiA7tes1TBnMQddvD8DkUjLETXzCndDwlIs5u
         xeaF5IXeqg6XI498RLIeHju/X9ve9rfOW+N2QeQjyNspwPyt3QS1LvHp+kMDZaeZYdJ8
         cJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783920166; x=1784524966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TPodwT/8PmTIoV2zpAVITKv1J5JC+XSCVdQXBOcAIqc=;
        b=B/w9FnbS7FbuBRoTq4bmTEaXfXJKGjV593i7PGqWfoMw5sGz7kwv5KmPQYxLr5/bIH
         tNvR6flBF0aCTDBRXGMLBhbkMBMAru5BIL3OJCvP8+uKMKKd+Gf45umOhAEWU4lEdHRC
         iRDYId9hlootRS2mqlE6wAq1HiSW7uUoS+q8p2Jh73DLST6mFlE7CSfK3oVocRiBTogz
         6+bRpPwRQ6AqMjXMbIXXjkXMxujj4av0Q2PNCr3cX1PeCqjNykJD++FEUn2+W2OG3vD+
         XxzxJHfNDQJxaUQhJTMFGLA/xdm7PRkmE68bMYcHCAGnjmRXNY44Z3Q/1sbfBsJsX5QH
         Z6SA==
X-Forwarded-Encrypted: i=1; AHgh+RoyVBiulzy1614uBbtSxkrElniRviGKL/BSsdHGlLyTyxgg3o5iFX8wM8mF5Yw7KIeRNgThbAFxxjw94Md9@vger.kernel.org
X-Gm-Message-State: AOJu0YxCW5I4PUlqT8xuVmgygShS1wXcEQd2aVn1J5EHrI7A2i/tAaD1
	L4aZA19p7Aq86Rnu3PfOldW368tD/yHCyALBCyzZl2JKSUbAX2ZZD9PsNxQYlYJg2enGGYXmBYK
	U8/rIYLWz4Q+7N8WIVkh+2QUJ3GieItfQqZDJgGgyt8IxaWc44NtFY31CHLJaUe/BO2O6
X-Gm-Gg: AfdE7cmrQAuoPO9y58gF3gkhGVQ/oUyDhNWvC4LczAf/4MhoyYOJzOufyvA915LlJvZ
	X8ZpUq0jtVlkNSJyJxu9z5csYyKMPbP5hbAalGAyecmnlZ/TN1DOyYOUX9UBCvJ21h1xDqfs7dB
	A7XIr8Wbll0J1pHYqzkX6WzN2GDWxMeBtJ8e/mQEJXDkHrFEKpYj8lc0NTh0aNOOuRiJ2s6+08V
	XJKMjOLq+70qATYXKQvz3R0nmxDZKFXhHeqm/Op958UOOEX017UEMQVgAf3zXV2oYl9ftGU0seI
	eW4JFqfSfKiKhIy0NC8MgMlPZzXq92aSd6xHqAKxFq9TUzJZXWkZaS1IJwgfKisOexPVUiYY4RI
	4SnVQIKxL7SXTUwNdzLDjaaWby4ujL5bTbC49Z2Zzq8A=
X-Received: by 2002:a05:6a21:4a98:b0:3c1:657:4c95 with SMTP id adf61e73a8af0-3c11077660fmr7861502637.15.1783920165907;
        Sun, 12 Jul 2026 22:22:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:4a98:b0:3c1:657:4c95 with SMTP id adf61e73a8af0-3c11077660fmr7861490637.15.1783920165393;
        Sun, 12 Jul 2026 22:22:45 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca75ef0c30dsm6245605a12.17.2026.07.12.22.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 22:22:44 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v13 1/4] misc: fastrpc: Move fdlist to invoke context structure
Date: Mon, 13 Jul 2026 10:52:33 +0530
Message-Id: <20260713052236.3033744-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713052236.3033744-1-ekansh.gupta@oss.qualcomm.com>
References: <20260713052236.3033744-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA1MyBTYWx0ZWRfX2R/23+j2iKFi
 2I65x7ius0tQ2Il236SQ1lNG1ICY30c5ZfveOeTAosbwr2NK2aoNs4pOH/UORSjrVb2xsG8ELGr
 GVQS91SlVQd1d2cu1YtWp5K2DYpPoAU=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a547626 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=HL6mAI18knL3XnPGOeUA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: rQxJBotZs5Ro9wCS2eiye1Mm0J0SqMJl
X-Proofpoint-ORIG-GUID: rQxJBotZs5Ro9wCS2eiye1Mm0J0SqMJl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA1MyBTYWx0ZWRfX4Juijvmo1Z2B
 Hx1Qreg1Fu52Kvi/GsySZOguHKBtU2sIrOyO0uTt7AlvEPCsi/XYqpWfAa9BStFT6E5NJE6xJLP
 zxMH4q6lbqzBLKU8PeJ3DOmdcPZ2DtRy1aL+UB8SxjajAnJzkoIpNoQNq6XJJhtTy7y1d1EAOdl
 uSfbtefnjaVAxHAA4DCFHfRSY0L7mVlLO86YR6jFxWyXWeKC96hoL2Sy3hAI0B3SIlSrsv37bN8
 QNV45D2KyJNYrZ2AJj0AxeYJGKnBpDC3v1N9VplzHXAHc+/WUKmMa5WnGsbCsEG6bR4y3KG1+OK
 7qY5ev4liYAY8+1Vzzrmy8PL0puLF6jaE1hGelJmCy8L1jUmTXdCGoNcdXkkQLjtIRl2qQdWVcX
 V6AwGisI30vOPDSkczjkiF045Wr9jUsYypVEqPcN6Go92QxngaULeUCkteFhfWg1cXhSiJewLSx
 J88t2j1KuVGaIOj64Ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:dri-devel@lists.freedesktop.org,m:arnd@arndb.de,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-118627-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 417147473F8

The fdlist is currently part of the meta buffer which is set during
fastrpc_get_args(), this fdlist is getting recalculated during
fastrpc_put_args().

Move fdlist to the invoke context structure to improve maintainability
and reduce redundancy. This centralizes its handling and simplifies
meta buffer preparation and reading logic.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d86e79134c68..02c2765e1188 100644
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
@@ -1063,6 +1064,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	rpra = ctx->buf->virt;
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
+	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1165,18 +1167,11 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
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


