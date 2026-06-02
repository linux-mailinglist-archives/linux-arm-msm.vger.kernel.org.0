Return-Path: <linux-arm-msm+bounces-110736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LgWKbGEHmqhkQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:22:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E06629964
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D41130117F6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 07:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20EA537187F;
	Tue,  2 Jun 2026 07:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ByZDtz2q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FoMSmU7R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9E137F007
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 07:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384709; cv=none; b=SElruSYotgJcd/lUHY0XkNsq63JSDYNkqrtzdyie7lDDNTJqUHWJAi6qUBIPj0yjvr9rsAtV9nldNCUdJ7apuYLtsqv38TK1P1E744ehWr4XF74BRl1IbBXeUg8V3o7okHdR5zvOvBZieTqJaRWmxnC5fpnfGRFEXpLtFR1qXIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384709; c=relaxed/simple;
	bh=BS9DrE52jyxKBZQB3y/dzW/Strq2wVpkRLU+COwfo4I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hGELOlr+5Q+MxUOtJg8oEmnNEVDaIVlGjNWPJwt13yOjf1FhLngE1bcNjVPn9vurOH7f4Tw5u47WwbGR36HMxQN2aMggB/9fOCarU6u8VQs/4EMD0MRx0r/JmMPyVeNuPY1ZYg0ogvKVcQS5l/OJHsAavqUDkKOduuray9y3+ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ByZDtz2q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FoMSmU7R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6524URGK600475
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 07:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XxSW8cHQ3wF
	LpjGnuSGsblT6eUW8Bj573RsJWQBn06Q=; b=ByZDtz2qJQePO976gng7xi8Vjrw
	Se1iBJREMQVB0NCv5VHkj/i6E6BC96Mf5pLS8ymFkolbmhskZh9kfrek7a36N0CP
	WzycxL6DLH2l7B8Z4yznsMsfFgaO/d4FvNnld3cZ7rFegysezQYg1+LMBKP7QJnY
	M9qP2lM05D64ferTiMvouAGa9Y8ZyuA2yH1QRcHchmwlVmSrH31seAANWu8G2HZt
	tdzjxFTnsLQ8+JjUebx789Gjpkd1O+owDiJHBF1C6JK1De8VCsZG9MtQDkAcBqWd
	zMjwnuw5ziress87revQOFIR3v2oaev4F2g/oCjoLAtKm1sp7amLNdLKh1w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eha8rca69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 07:18:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bc54005a7so5248599a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 00:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780384706; x=1780989506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxSW8cHQ3wFLpjGnuSGsblT6eUW8Bj573RsJWQBn06Q=;
        b=FoMSmU7RBJMGzmB7K8rH+0DWwnedPB5PaxthyfNN7djpIkykeT8vhKI7d/r/jBK8Gp
         DgrlKQf+5db/YJQ0YcOm868ypnOIEKjf8/Vdp1II7EgXubtBoYgRZxh1Hp4d0SaNBLf0
         dhhrocHKOja7Ptj9GAVNGYeQ1de9p9WfNX4uPJRc9cdGN1ZZRKU/k2Q2RKEYw9Sc4gh4
         p+Ubr3HLmSLL+KIXaQ2G4n/7dgfqo2JQ10QGg6LB1yXAS0m85hSQrHKmaVmyObZsI2lx
         VFi7Yj6oS7MEeeHyPWVSSBpFsofVNdYaC7E6LiKJNKR7hhhVyqILgpcQXM31mWQ8KgX6
         N+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780384706; x=1780989506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XxSW8cHQ3wFLpjGnuSGsblT6eUW8Bj573RsJWQBn06Q=;
        b=pbBwPXw4QSvBktkglfmc7FWDTfG3opRS61WFlRR2829pTjIDo8jqVsSRzAAdTRGi5S
         zNs+x93LmobhLBZgeAcSlyZXSG45dwCRmK5XrTwkAGzBAgbo2NOH+e/AsrGjZcYJxS15
         IH866FrK6QjnhbP7gsswqgYoncc5T4oGG1wS4lGDD398CimNp37aF39xSUJMGedZDdUH
         LReS7UYbC6XrV0lok4nsoMxQXoN4wbb/lBr3vNsduLUsGv2h6BAz1Sa8gWWciUqazP2y
         DLd4K4N3Av8tcivXU2S/sGNlCYSFXZ0UkOJRzS7I0z73qccsisRm04LTNNXgneMsuM04
         lZzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9G6zH25/C6qaP47jG1lyVdjMKUvTLXdqn7Yr43/ZOwpCvA+xeoB9wXyaOn0tD7L6rWDj0ftcnw5diw0DKq@vger.kernel.org
X-Gm-Message-State: AOJu0YxGCszUPF5Lq/Snn5Xs7XpcJPACNn9s2M6/veke+iEH22hiDKjQ
	DyxXA9JJnZi7pI6dg55kXkxBIi2S2Jdh7g8hLR2mzSRdfbhZW3VyqB9Ouy/v2QrgkKCmAebbAsk
	+tgpXj6HNpvURqqbGycpOrMmfRuVtBkmAjUSaqeN2mCvBreQGCWiRNKnfPj057bNLeavq
X-Gm-Gg: Acq92OGtIM0d7obwJz6ZIET9QXyOP2Mj/RzILnA0r+098+Pv9sHbxRFQuV7N63ktnVo
	LixVlRtDxIc50Zm3NHyja2dVZlXNJJ7qfCoQqVGJEuIoRqU3IUbSTCNWJ/cRVZlyfEC5cbNwiUv
	V+Ku4iyHVO8w5hBaXNkr4tw3QkjfJTWvtkqN2SpF8/Hs4XUeWCOnoMDsfLmiZk9Qew15AGhTJN8
	Ew2t1od3INevvCKKNlFaT755L7Sx1RAfW57mj4Skk4Fkq0U9+JsdzfsXOdWRvAKTyoSQqr79umt
	b8hIL3tB62gfKVYhmvVKK5c9FyeSI3jAdqklArc2JLqx2z6jwG0mR5Wj1lm85Bnxj0eR61apQ8m
	k+0cDlK2JfbuKmdYP0pYpjIE+BWuGxjYEu3FLiuBoMce4MtWHp4LzCC5k1VWA5UD8cxZxA/RisM
	9E4HebvL6GiqZbdAGo3j3Anqrvbas9FQ==
X-Received: by 2002:a17:90a:fc4c:b0:36b:7f69:c152 with SMTP id 98e67ed59e1d1-36c501b813cmr15173002a91.18.1780384705757;
        Tue, 02 Jun 2026 00:18:25 -0700 (PDT)
X-Received: by 2002:a17:90a:fc4c:b0:36b:7f69:c152 with SMTP id 98e67ed59e1d1-36c501b813cmr15172978a91.18.1780384705241;
        Tue, 02 Jun 2026 00:18:25 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd91c9991sm1766279a91.7.2026.06.02.00.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:18:24 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez@oss.qualcomm.com
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v7 5/5] misc: fastrpc: Allow fastrpc_buf_free() to accept NULL
Date: Tue,  2 Jun 2026 15:17:50 +0800
Message-Id: <20260602071750.526-6-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
References: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aKnAb79m c=1 sm=1 tr=0 ts=6a1e83c2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=XYmfcRj0Jzm9BuThv0sA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: DJnqFYSET2ldoVFnFvkWMH21GTCI8pXP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2NiBTYWx0ZWRfX8/QUYilv3cdK
 0hTMwqd+2TtCEb+sr0lZ1YSRsHAbOJDSGfq1uEJa4LcfV2digjCy5kopMj9xMMjTUHSuDbKcFtN
 +pfBZNKjJvru3GYtc7tVIoN33vHBqYewyhJ/Xgo9y/U9Xt6wWlMUCT/RKFzFzGjCnUrxSSlqfWe
 XTzzZzX4IOn8eui78CWsJoja6nnWHmMDqDZXm4csWaZHl7KkBIlWARX5h8cr2SR62GPufBbCcFf
 f3IJR5SbMDWQj4S3mGla5GkktSNyy/dWk5BFldi/1W5OXxihW+P1QvxSajIB79ATyu67ZkmSXPB
 bTQHO1Z5fnHjiQoKAqE98Whz1crokJ9pRHJRsJwlflpI1zOjLizDEHQL+1dFxCfWz8de1ossA3j
 Gvirq6PNo2u8ioS9AhkETsKZT95tLDVC0AL0D7jOFHOvsqGDZ99dm2IPzT/V2IREvNuHLGx/9lI
 CFej+Hh4Tlz1oqAZIcg==
X-Proofpoint-ORIG-GUID: DJnqFYSET2ldoVFnFvkWMH21GTCI8pXP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020066
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110736-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47E06629964
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Make fastrpc_buf_free() a no-op when passed a NULL pointer, allowing
callers to avoid open-coded NULL checks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 33be8bed6a0b..370b4f9ca135 100644
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


