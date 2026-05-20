Return-Path: <linux-arm-msm+bounces-108627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHwsIzZaDWrBwQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:52:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0905D588743
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2A2D3055074
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 06:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68FE34A3DB;
	Wed, 20 May 2026 06:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEb0ib7l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HDaubYdD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9C836604B
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259861; cv=none; b=CpsNB+4k/4bTn0I/ZZ3KNTDhSKCLEy0hqU7bAmea7VMBeNrfoxioZfgsE8CxPj3wIxl242yYvYsYI5Br5l++s/TgH5e1u73Ht3E5dGWU6pdwGXZQYF+K0H+bbneL9MLcpwy3qxPNJMcAZFIQ0ktU8PTZN14hb31vc6l/fkn+u2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259861; c=relaxed/simple;
	bh=piLYdD9sfLzUWIAhuoTrNVSPwdPYc9JpO7ZO/zYiMIk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cKBaQUQIzI5JBj1RPleD25QSx15uhRBScTyPrSjUqjnRDZI5uPUEB0kvTfkbzLLUP8if2mS6BxW4uUgLKyj4PJfBTN20p7hOlRhMA+kcVzXsw5o30SjGvK+8wggNL8RU4zASgUTXpQtN7sOF8rUIoG/tZLNzHGr++NpkiiCFkzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEb0ib7l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HDaubYdD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JMUEBW341465
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hmDUYWP981+
	QEsAdC4yYWGwxCIUyaTrbIpAPDTEiCGc=; b=FEb0ib7lWqn0d0YTeFBkTMSpWgn
	oXWjr/nDAodLynC3DNsPwDf+m4gMm8L0aweTMZcrqRsHhQvUPdES38xuy4vwb9Y/
	+cJRF6oLOcwWyIH1cANqHz2zxBjXrxKPtHxcQ+m7VFnN5Lkuhprqzjy5reUbB33Q
	26BXA+vUKRVSWlk3zNYRkFQgRzCcm2aOJX/oU7/OSXgb48ukHrSXVrEZrxu0MEWG
	MPQbJkyoRNeN5YPQZ+imNpEVq7KGBbRaSojrHCDVPsTlBsSg27z4RiPYparXdBHI
	hcQImL9gl1bEz9S1IQcB0wIAQ6ahsy1B0p6fhmLmn17+tOQp1FH0KIBNFfA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3vbcba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:50:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba054e0304so42744525ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 23:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779259858; x=1779864658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmDUYWP981+QEsAdC4yYWGwxCIUyaTrbIpAPDTEiCGc=;
        b=HDaubYdDGFtFtjVTrxtQLTXKKhfAO9yZzNKxF1eC6sQkx76lIhkIIqNME4WZPOGT51
         LRkBbUkDADghFGeLorAIFwhlmVmjvYo4Ekzbgr301DWzQ9EetomxbGm+hRloBX36k2NE
         ueCXjFh7uAJ6l1XsCNc2Q2iVEqsFYKkiTHzkwrwsOphfN53eqh/7i70M3ASgcH0rdX8D
         1AQnxTk711CBqmqm+ynSnQJuPGFPd2iG6sFVMF39FQ7ziOg4a2yQP3VJLwi0cERraPz7
         bwYbOivAAca6xieOc4DQdXYb/AFro1gDszVzotb3Wkm1J3rKLgUZnGom5tXLPvVd7kaV
         YkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259858; x=1779864658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hmDUYWP981+QEsAdC4yYWGwxCIUyaTrbIpAPDTEiCGc=;
        b=ROOaUm9t/03H2CD+9tR8xwClhVSyh2Rb9i8+t7GUwTRZ36WYd16Gzcto99tHnp8t3E
         tIKY0n2c0/5da1oWNgos1QdWXSN5WVvHK8ixKdLxodxyTnt3ghG2Lo3Ho9ofKKylZgyu
         OfO6UbunjtqX+fXKLf9qzYhOZf3a1+XCOlNeWdVeTvYDXE/c97h0LFLX0QimdqYeb6nd
         INmadMGULV9hfJTn5XKi70e8A7P7umGfSGX6+1wFsDW1k5ATbTb9i9uYZynyF8N/JzeD
         tN2wzOhukU3JGV4wPOfnZJQ1CcVwCtYEXL7CdlJfmpayhw7Db3iSShWGho2awMDcI7f/
         kTLg==
X-Forwarded-Encrypted: i=1; AFNElJ9E+V1AOtcAKOEWhJlVAUuDzotziFBCQ3zJd+/Jzs6yTv1BLMWVxvzf3D1P4yT5uKOBQQEGvgyhcsneHqru@vger.kernel.org
X-Gm-Message-State: AOJu0YxIMKicda1fCooEwz0Z8lB/5AQ3uAoB41Y8zmq6KK2Gz5qraE/d
	9zSo4HUI3qTPMQKchx3n2QD1GrbgsbFJaGBi5Ts2smS5eMQkf0iLdA61+XLUKiI20T6vaL5xlLY
	313wz7sp31AHYfUPPxLjQBcPCdh3NUiD1RMwh9m7E9l6/4Xxd5IrpUjwOI/ozXZLx1qaN
X-Gm-Gg: Acq92OGN+6tHgA1oOqbHMXjgLxoXOexQ1xsV+Is+2CMoMyp4MPuYdKB0dzAeFqSAb/D
	Hhx1Y0fyzKn3iA/P/Z7+L+AAQ/eGuWX44F76pi9CO/osVTRcv1Dklfg3ejpV+TiHhYAfgEn/3yz
	TqvKxW/H8XNbtDrEjS4oTiBV9vWbBDndA/0t8AgKiyNXucg+3CdWvYpYnDi9ZcwAkYJwAc6xihp
	7fpa5kTDj+ioZlzSHjGoPloJ3Rz9q/yPUgG/X/5w+09DZzyi0/61LJ5ZLi3bRwoNeqk7Npq+04E
	WZrbhlKhvb1FZNNL9yGqJmdhD1YleqeQWTKiX/wLeqUWw+kAxdRLZU3znZeXEuw4m9GAtfF8gcl
	YpT5qe9qncCeOlVh0XferYpMSWuY55l0Uk9x5qDlcXZY6l9RTgDweIw==
X-Received: by 2002:a17:903:2c08:b0:2bc:8e7d:3dce with SMTP id d9443c01a7336-2bd52b54312mr225423645ad.27.1779259858128;
        Tue, 19 May 2026 23:50:58 -0700 (PDT)
X-Received: by 2002:a17:903:2c08:b0:2bc:8e7d:3dce with SMTP id d9443c01a7336-2bd52b54312mr225423565ad.27.1779259857616;
        Tue, 19 May 2026 23:50:57 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fe51sm206410165ad.2.2026.05.19.23.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:50:56 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v11 1/4] misc: fastrpc: Move fdlist to invoke context structure
Date: Wed, 20 May 2026 12:20:44 +0530
Message-Id: <20260520065047.3415790-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520065047.3415790-1-ekansh.gupta@oss.qualcomm.com>
References: <20260520065047.3415790-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zg7fyeSVn18E_MOqueHp5HfXHyFi3-Bo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA2MyBTYWx0ZWRfX9PQOUhL7z64W
 hwPslm0sEd9yIiUsvYdgNciWJsiI/EsDPLV8dOETpfHOIXYndU5coCLfRYDrKot/Tlm6t4R6KrQ
 3eOTx/AQ/fwQ3zP7SPzZpPLVsCD8xIetDTmvKFzpD/Lvnn25vIVK2XER01T1usRsExto4MSTIRY
 UCHzAdI2FhKKTZDwIqqUJ8zgU2EOK2bnAx9iQHr2TXCP2OFmrIURFFGxt5LQ0Nv0Tclx/72U1Gm
 btmrtnjYy7c239yU5rxg08PbzlSD/Xl9GbDZNZH+ZycL6idbvuoV2oghx7SMDK6OvwVnePPExve
 CmpjjfyVoigPI+s9tiVKdQFkfspYNEBDBO9hBBBUPzkZLZjNI1Hljk+4oIlP4SY9QCgPY8N7qrO
 jMK16k3jOrFsYoGWARFTMU81KSo2be9GlQ4a9uEeDHX88tN2W87f6fTe56S1Arntw2lhbxDuxfv
 zTxjnw8NktilhdvAf+Q==
X-Authority-Analysis: v=2.4 cv=JuPBas4C c=1 sm=1 tr=0 ts=6a0d59d3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=HL6mAI18knL3XnPGOeUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: zg7fyeSVn18E_MOqueHp5HfXHyFi3-Bo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200063
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108627-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0905D588743
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


