Return-Path: <linux-arm-msm+bounces-104418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO9yGks/62nZKAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:00:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7A345CA84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 111C9302F9A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBE735AC35;
	Fri, 24 Apr 2026 09:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkquX0it";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BcOgoNAJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7190735BDC9
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024757; cv=none; b=kBKFuW+A5kdqnHQexfDZBY/E2zB77APbNyECGOq5//ezmkUlhdsFYa2mPjpOPO7mhEzaMscna7vEqwf54uJ+ZsNh1esc8zgW3phnTbfnUW8uEmsiReqjZny9ZGF6vqfNKVfhUK3FiqytbO/ELzX51lCP2S6oBlW5VuqlWcXWIY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024757; c=relaxed/simple;
	bh=piLYdD9sfLzUWIAhuoTrNVSPwdPYc9JpO7ZO/zYiMIk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TROxD+wE/NRUQsXVCW36UzdWPfUbg/HO/qMbz1/AygxeOY+ldd/jNTudO6guwJn2AGa2rIDHShwqwYCGKgwBoni4pI0x42tm9Tou8K2FORQ0dMGXcK0PyWB56gG1ldWLpDUv6JMPYeXHFHHWP1zlG79gIbq0KaPH9so+9mRctiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkquX0it; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BcOgoNAJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7RO2u1823223
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hmDUYWP981+
	QEsAdC4yYWGwxCIUyaTrbIpAPDTEiCGc=; b=bkquX0itnfTorykxkEFzaP8qlV0
	VmknViDWfTgl5HqdL7Dsu2TDilmNVzG/B9G1nAXf9WCsuxbPcP9shAa5cvTsD+MZ
	YhjyymbK5HTT6QEZwBagJ1kM2G5HS6Ky/qqY8ZfUrBLqyV5f1qGP4uWwKkv74F42
	x5TPciz/8sqXXIYZK32wiyX3aaYn70000Zxv2qL3T/QITRS+IMsgbnfli6OApPWx
	r1lTmG8UbNWu6dRxTnoOhrdcqRydnx4WIwhxv533cBNYGDCVNeFvMVbC1fEEr7Jl
	xFT+HbcJFUmmfc9wmAfdabPeYiruq1q3AsO6uYebOW3qcEsmKi4BKQNk4RQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqv5rt9j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:59:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fbceb0181so4165684b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777024755; x=1777629555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmDUYWP981+QEsAdC4yYWGwxCIUyaTrbIpAPDTEiCGc=;
        b=BcOgoNAJo7hlI2EfZf5D5Xp6cvgqYvFpisRtkct6bQNj8Rc8m4YGxLZBeG9wNh8Lp6
         EJzQVnqyKEzxEDvgoXt/jLiI4PlubBDw3OR6X5PrI2cLraOf3ZrLGjiBejqwVRmwGjr2
         Jr+gjsoBqbI/uP9QjXsCj11r/RLjVv9I3ol2sJFTKjgjyM9rQUTS0XjV8/YVdpKxycqE
         gqrlZs0Slam/iHdHfTDsRJuIvyyPg7zP9pzELgGTt6e8zeSLxntEKvotputUv5ycKbZi
         GlWuXRcMBsp6D3JZmytkKWNL0rKj7LN4V+gL0NNsTDhMIbBHxOVPgBb+IJudtPxb6ttJ
         z8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024755; x=1777629555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hmDUYWP981+QEsAdC4yYWGwxCIUyaTrbIpAPDTEiCGc=;
        b=WwSD/qBh2hFq6K8TQ0Zt7xMaNTi/8zBVX2lzLHr1bPPy6j17Jagtx97pmoKoh/aA6j
         9IPVNE5OCcwsABAY4Hx3LGB9qFDOsN6tudqvqCRtKW/kyF+SutmlreUCTc+7BWoTke2d
         dulkJqRgaWS8+QJ9Cw/uSPOG2y0/eCuKNdvSF+UEfMR85tQWTvEr+Eiw6IV04jbGQX+4
         h9NsbDDFDqtAe3MaZ8Wpek6P0MiME+dDe5/dsBLUM7lxcTm6n0xR/CZljg9VDesK+7JS
         PlExeiNZHw+3JEMCQcbvpzjc6DZRLvdZHHa7H62hG15z913TZtyHhzEkOSmPCmnxCELr
         KBqg==
X-Forwarded-Encrypted: i=1; AFNElJ+8tcWPo0kDdeM1AokcdSiQLR6K/isCWkYVb80TAvkKwyk4NrHmQ5Vu9Bbw28F6WiYpa8eASoAmfNgE0K/F@vger.kernel.org
X-Gm-Message-State: AOJu0YxTArJRvhqowctkF4qPj0AxdneCINdmRgnqOiQYjyk5P82p4KAQ
	mNC6JwQdAqOf3uMw4rSTDddaOKFAGDAXBXvvuwQC9hSr3cTJ5ybsReBfQA/yrVf7180+EhDAOfE
	C1CBanQIS+lbbkInsy3bYVMi/ajv3+pmNpjR1WxfZcjdOtugsn+NOu9yI24P8hdr/WFF+
X-Gm-Gg: AeBDiev4igKd+QDPbu9LErUfKrSo7b2WHxXBjQdElEy5tljBbjq9JiDd4iSPIVOAZyB
	tCX339N1k6xaYhejOoj+NrvqVZgo9hsVe9BXf+x/CDAfTyrNHmZ1A4Y89kzYswUfEZDG/ZVRLc+
	c61xEQlFPajS4oJoLMNMnUGL3Kpq3IBuf+sMAi+j5QpHKZkSRp1DpcGs0pLl3SgnJJiMZUurdfT
	wSXvjEVnWYY0yQTQH31Qsz9bMBX1e4UR0Gp6BAPCggaDakLlbPerxNKw7xl10MR/soqhSf64qMM
	SjtgzAeBJNgj+FgIX1YXjtxsB8Iv5NOzVzus4NIKJ0VTgIW+7aCFPJiRVg+aum6wWxRxPtzWbRl
	Ld2HcfMGOYCI3UgwJYHMLCb16hrx4s+OIAK4UugY499o4mrJosBOHeaeJQDtuwbNB
X-Received: by 2002:a05:6a00:2ea5:b0:82f:1973:4b96 with SMTP id d2e1a72fcca58-82f8c91bc71mr36146461b3a.26.1777024754905;
        Fri, 24 Apr 2026 02:59:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:2ea5:b0:82f:1973:4b96 with SMTP id d2e1a72fcca58-82f8c91bc71mr36146432b3a.26.1777024754364;
        Fri, 24 Apr 2026 02:59:14 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d35acsm23679702b3a.15.2026.04.24.02.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:59:13 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ltuikov89@gmail.com,
        konrad.dybcio@oss.qualcomm.com, andersson@kernel.org
Subject: [PATCH v10 1/4] misc: fastrpc: Move fdlist to invoke context structure
Date: Fri, 24 Apr 2026 15:29:00 +0530
Message-Id: <20260424095903.1622565-2-ekansh.gupta@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=LqiiDHdc c=1 sm=1 tr=0 ts=69eb3ef3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=HL6mAI18knL3XnPGOeUA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: cEAbsnNKb7NCYD-ZlWpTMnS4CN6xyRhW
X-Proofpoint-GUID: cEAbsnNKb7NCYD-ZlWpTMnS4CN6xyRhW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5MyBTYWx0ZWRfXw08cnsxy36WF
 g2Fx043Lt9RqTkuVyMV7ANwRG59EPTGLZZbCzFKvDgG/79kap+HhNpuK6loTKB4Oo2gKM/Ns4wJ
 6gdFsbNLgWm9/SwXgsA7TAy2rsfYITJggJv4mW82VJyAoWHEqjUQPDoWkPCD4TNKmPyxoNVCx7G
 e0RuJojGYHO+lrYrHnrWMu/YAmRkCS1i5vMPBJ0hjUVA5QSU+piDwQG6PjtfnNiIe9RpIz9iFtN
 ZGK4rh97wzUyQiBCtIQJnbaFZZa41MUu792UXapBol7lM7KMrNmBVNxbatPeJIrLNyzUMNDeN8A
 Vl4MQUYYV76RHCskOatPNoXjmGm5yBE02cPwE1roKgif3c/sW77yA4nEodBHoO7O0N9WCRG05Vq
 wnNTMoRiqXHFY4TkJNLhk4HHZn4Hur8qsfm2aE0byiwUysl2XdYOQtNsuZrz73nllONR8t8ZOHG
 z2jyOAHCHHAgAx94kYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240093
X-Rspamd-Queue-Id: 6A7A345CA84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104418-lists,linux-arm-msm=lfdr.de];
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


