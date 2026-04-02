Return-Path: <linux-arm-msm+bounces-101425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qI8QA6IDzml+kQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 07:50:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 760F338429D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 07:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4170130ADD41
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 05:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14152DECA3;
	Thu,  2 Apr 2026 05:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aT62KUIC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gm25prLS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979592ED16D
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 05:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775108978; cv=none; b=J+G0r3U0xzj3x823TMhsFz4epsOimF/EbRtcPTJ+RuUo/r6tJAba05FLUV3AyBsgUxQVAkzENKxjvcivXedNJHQKO+i8DmTR1QDMncBYaMxxapdYM+VzPlEFK1Chrcq9cUPunrxBkJvh+jbb7XNqmXRl9assVVkMnCGSEaqff4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775108978; c=relaxed/simple;
	bh=uzqUI8UkTFwiu4DmC/RQnQacWKtYbJXj7rczp6GuGB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K6QGUkhoXu/q6qFHnUh47mZpR4JurgjNyxW3YUs8NCZnY21aJdO+GtnmEbXolEd0aMvJAASpSg6t5oC91frzWoXqcb/OPUEdH7QXyC1v/E+oH/PyN4bBtzPwILulC7lGphn+u/FKOmB8kbXyJ+It6QK/YNwy9BcgJizU+DqlnaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aT62KUIC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gm25prLS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M48QD547864
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 05:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gW0pzUiuvZ7
	Sy5PEGDehzgCXNgTwqsOcea/DS5PsqFU=; b=aT62KUICq4vixdMgPXJtK+9K2vq
	ErzhBqMcEVqEKt7wXoGByUuPzG/ep3EP1Jnrj5Zni+3Fel/+K1buR25XI/rPDPK5
	bIXwGNr7qtwFxgBRLGg4zI0BNSK6sWYq+qCOZr6mffX1kVW32gNL4JbpZJ2kFud+
	668rMEp1r0z8QvrRRzXZ/60sq66S1FCDm4jQcbNf+xwaSkqNG7MmcAt6amXxtaRY
	6dHLNvmG5rwupiqnnNNpgK7nQvZyMN3Jjy9R09sjCs+FqJHsnFoS+0S8eIfPskP2
	N+kUjtgg8NZSiYBFd5JvUpQ1gjP5M9OgSR4JCYo3sv+S5UOFG4J7P4kV8fA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d94vvk4ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 05:49:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82ce0c07d0cso376730b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 22:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775108975; x=1775713775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gW0pzUiuvZ7Sy5PEGDehzgCXNgTwqsOcea/DS5PsqFU=;
        b=gm25prLSI8vuOIPVNuzqYq8zhTlE28jh+rnlV8mH3FwXl0xENQH96cqFN+Vpu/Cdl3
         ZThd3SMe5y4JWUVzz5jnLmZDj4OaolmBHI6O5dASnf5H5Up5OtBdRR+inkx4wjTf4mKu
         b7vvUt9GhdEdrt1ZVURTjek2etN9aMZ93Qor6FCiMNn8WRMXgxmwMd1LVEbu75srWmiU
         n59fXBOHrdlTNYC0mxGjVTzbL8g5Z80lxmSv9ShyGnj57JI+eHO8s55/G/0UIfRpyaSz
         nqcV1jaex7qoYmGqIUoDPMF31yYilbTWDzem6/inlRW0jMJqXDXycF0RhE9WFmEYVzSs
         8TCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775108975; x=1775713775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gW0pzUiuvZ7Sy5PEGDehzgCXNgTwqsOcea/DS5PsqFU=;
        b=qWpqXl0GfAjqn6ZVRHDYqY5TsziQUT4onMhA8ifRw0YuOasezqbmiAiv02dk5jDeD1
         BzUuRBfWE8EGjvWrd9J/CX+V4aqSgGrASOZSQt/fI3zY3ZBJdHpxPegQEMZKU+LgZCdd
         gqbtwrY6unajCZynNBGh3i6+CO0kfC3LVpbX8Z5tu7eW40K/T8FhGHTUAyUf0YLs63Rf
         xYpKuqgwMFDiFH5GteoPbgWuNzLvAWflb3k9THR9sendYvi9jXfKlvkQ8ELRVzmim9+i
         cQITZIgLx1TMKaBgB1QdVaKkwp/NUnPT4NTVc8hAn8mBQfpIAEhmXDEt8lDcRkrvBfYL
         3jbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB6JAQs+pF80DzA2x2Gid+8Ap6U24Z4FjnTNRlrDdMb/oBy9895JxxJxgy6TArRL7OVi64XXIl7YTJPT2V@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk4gs6e2tG9zfllLG8+2DLJbHXfdzVZxXv8Rd2kvDIjw0paL34
	zNliMr3PH/oqBzRA/ylix1ueAyaoMNUMiX5FHQ4YKG8IBAG6EEYXOT7uem0EJnTNwP41i1uvVcz
	xutzh7YfsRFnPAyD4UsYrxrbwJAm3F1PwNXFT2Bhn74C1ajqDCoCWDnavWyuVAIaMu1kS
X-Gm-Gg: ATEYQzzIgfOy6W6LBboMIHBC/kS3V42f1nIN374A6BxURUeIZI99h9xqcqpvls18Jii
	846AbdmJ2pFJoVn4CntgNfskZbXrflXtVYUdsGoUEbRm7AB8YKt2Yz/OAGG+rBYCwmCwMFJjfED
	MQ0KgpX4UcYcMzUJGIRj+F9I7V3TlYC1t+508zZIl3GgTsccXUBoCK1HALB/NnabbWysQc22Lkk
	Dv8DTYQxApmx2DkWNwvga3dAniqkL7i42IlOXBRoTlVJLN8shqnellcRFftyVjdZKh/ollPOiu8
	pSv0UiRuFusUrjWNRCY0a2j04elBCoSvDGqdXq5/n35FXq87vZfwhBvEtKQhKUU+ThaLIxCecEN
	UVjh2b6twV7mBTyfcNKoWu+EcETt2YCxpbguKE34ehCP2aGK8cqAW6w==
X-Received: by 2002:a05:6a00:1d86:b0:82c:212a:906a with SMTP id d2e1a72fcca58-82ce89b8e11mr5803985b3a.36.1775108975494;
        Wed, 01 Apr 2026 22:49:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d86:b0:82c:212a:906a with SMTP id d2e1a72fcca58-82ce89b8e11mr5803953b3a.36.1775108975015;
        Wed, 01 Apr 2026 22:49:35 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5fb22sm2167747b3a.26.2026.04.01.22.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:49:34 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
        konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v7 1/4] misc: fastrpc: Move fdlist to invoke context structure
Date: Thu,  2 Apr 2026 11:19:20 +0530
Message-Id: <20260402054923.3061925-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402054923.3061925-1-ekansh.gupta@oss.qualcomm.com>
References: <20260402054923.3061925-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA0OCBTYWx0ZWRfX64v5XdBXSBqy
 FSFBmRl4cId75spg9sNW4Og1p5blBzKDnvA9N+oSihY96Mj31IfXxEyfc55sqDpAvnRCCwhSYxf
 /6rZBiSO4vgjtGyyKMwrkqucDrf5MeanVTahUAjnYVrpCa5CFYjJj5dKrunpf3dcnlGTyFZPb8/
 aO9lx9ST2e2YBuf1VhqCxACbMd5twpoxrC0tRN2THSjtPNClg7PC0NIiqGCZGC0uM0rlju13kDs
 BmGkPlwHxRHGLWt/gcugVW4OfcJxR1V/cyEBOU7cktrMuwhRSDSoKwlqozaLXMhALuq0LvOx4MN
 pyDcYO1R7CeRpQvJ7ctG1D6hCNLnwVM7kcU19AT4k5MriNaXJykj5fhAMdOE57bnQD1xRkVKMy/
 a2UPOxJIjNRpZ3bR96+Ubp+v350n7yd7ExJrcV+FZE+Pb0brnNWuF1s/wNJ1ztoonEfPIEM6oUq
 LUJ+ZfFAUO1TKo95iIQ==
X-Authority-Analysis: v=2.4 cv=DJSCIiNb c=1 sm=1 tr=0 ts=69ce0370 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=IPuuj3Sbi4WKP8RQR18A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: h3B2mNA8VRClik75rTaJ7MGImjOMxn62
X-Proofpoint-GUID: h3B2mNA8VRClik75rTaJ7MGImjOMxn62
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020048
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101425-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 760F338429D
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
index 47356a5d5804..11f4ae749e51 100644
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


