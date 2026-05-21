Return-Path: <linux-arm-msm+bounces-108918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFhTNyucDmqZAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:46:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EAB59F31A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96166305F72F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 05:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7173F35677D;
	Thu, 21 May 2026 05:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TyumxlXq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1+rXva+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1442832F75B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342352; cv=none; b=oTGJBOKEX7vGHEFGgx7g5LruIZJO25cSpjhQnGXhAtKMgy9rN+wMtopqwF3gOkn0zAeaOLcYuMMAhe+bVsYbqngiJTD/295TU+VfhSuA4STG9P0944J5Ei8pRLJ03GI7c2LNOw0qgR1LgbmVdUBK+oWhDgsZq4DAtomIgX2lwtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342352; c=relaxed/simple;
	bh=piLYdD9sfLzUWIAhuoTrNVSPwdPYc9JpO7ZO/zYiMIk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RoPauMK+bVw6g4kQY1VaN8HMLPlPZG4ZKl84/6Gd76hOqxHvpg6dkneFGf2qYi0Ik7Li/k/ALN6UE93XALPiof2+oum/M2EF2WGjE8a4utY/p2lgayTXIxXu/4AxTU/sI5utes/8EZq9sfTo3YWGvs4QLAzDfkRxkHqo8ct5+5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TyumxlXq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1+rXva+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L1Ia9j2071899
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hmDUYWP981+
	QEsAdC4yYWGwxCIUyaTrbIpAPDTEiCGc=; b=TyumxlXq0YuiU1vHhbZ3KhNYWdZ
	gUJ35ZvQyZ+isC3km2aRsmKlk3NkJ1DMCksumlahLciUmw1JntOwUie+ZiC2eVzw
	yFIiJHhshAMg3PqZgcQsdOYBpq0zK+nYdb31RX9qvCWrA7SM4krQsArdna/fAVNl
	bL4e3fKfm/7f1bUVSI0sLgYhMVuE0nWwJz5bMtvWkAEEvM9q7ZbyKFhb0f/KFl3A
	Hbr4y56PeERuDATqfnJxkWNuwbXJZGtlI4fqHhidCCVtGatCEBfwi4s/6StiIa+y
	rrHn2fZrGPMtT0C1jlg/6DH75UuQ8BZGpQh3tt4c3rb+BWlAlOSXOsyowIQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r960tj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:45:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c82bd90afbbso2964419a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 22:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779342349; x=1779947149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmDUYWP981+QEsAdC4yYWGwxCIUyaTrbIpAPDTEiCGc=;
        b=i1+rXva+SsxPEkppPyo2W3nrjUBj1vz9VIQlY2SfaJHqoJ1mVSlh3elYIXEROoHlmy
         IYG+H0830nQnK/G3rw3LdDGXsuBIh5H5Grufuze7HVjQnokMv0AOH+VnsCCuHSMeD8J7
         Ffd4EqIf35ToB1Fugiu22skayee4uvHYHKA+FvSsh6oJo9CyWjesBxYtmXM32SFiEeon
         tBWGKKxNPwdYyL8fuAeaI7rIRzH6Uxx32whU4XgyWyhgeQ8g8/p/UTJZE8HFTpVIMN7c
         sIDqpJkXsn9C6DG8ehIbFHCh/73sIo4uUSBoq+5xICcNSYJDl8wbDyc/M5tzvcKIWcch
         SRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779342349; x=1779947149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hmDUYWP981+QEsAdC4yYWGwxCIUyaTrbIpAPDTEiCGc=;
        b=egflvHcdGv1Zy4fXciY2gAQ6i7pWrSrgJqvKKKZU6SvAiI8AnAjtBnzehjp9UQsU3V
         vhm/G1XDgztCk1WHvHXy4D01YknKh3NkBBIRL7TFrq5GBPlAxtmq8WcTKZhrc3Jqggju
         a2HGQDpfC1sIfTqwDdHFwwUXAwGTu9ffPBxCPm7J0hvkS+T2nmCNcU/bXnaKFYCA+TPu
         3E0F5VSaAzd6TjtFvcP1gwaZiaI3MO4payzDBMZMlZZuZd0DbZHn17OvOUSL3FxeJNO1
         ktuyusyX+ezEInUAB6duwNGGWnXWzxQ7z8i4hv7IJdbiQ4ZAvoxIESMb2mfDUSLgVCkC
         9dUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1nIFr7lG71I67iQ/36IFAHLDk6bkkkNvqQmMTxhlxSVVjBqLUzho7GFrF8VW4PpN+JIMT+X5w6/D3Rye8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7lLNALvWaZwJBe74kOB4G8z0VDhZVv2HzOY/zu1363pcxSmE9
	3lJf+OiDMd40/8J9VFahwDNyQmpm4C8SPbnbjwQOeZMUqs+tDrL9ZTEvgpiKdn2UgiyTm49hUzC
	in3i1a/+IDnmyJbbMmULd7Hz/GO5wO816xxVv7gSNLk+Xp9Iur0o7mO/EkTqR47aRQ2Kr
X-Gm-Gg: Acq92OHtucwT8Jo4zXzWLt/jo2s+5vAZgFj8ZPYXWejHAqV8uXXZz1zPipE8amqF9k/
	o0j3p+a90VI/4wOTV88ZlRkHE1zHpRp3gio93vpIINITGHvLclc51vplM+tK04wbLnvblCLZLKu
	XBPw/hU4g4Bd1jUg/+dkjZE76703JIaZoGo/HRvVK/VfJFaKPthoAQhQsBT4oaId9EaCATuWKst
	/9w2tbBbl7oaWJy7LxHPDV6jT8pNFu4oi9mDBCsFgkNerMJxPHueJeJ9YPcdKtb4zeek4YzSToN
	Yv1bUgTs9kjidBK3YuiP8ExNKLGaWkMv4csLf7aZCAwJUD9qNwHfBnQ/wxrcYco++ujkBPn/dUw
	dA1ifxNlTu8L1ISIueR+s5NdVBilluchawYQCPJNTw3S/m5YVP/EbCNKui1SpGqIc
X-Received: by 2002:a17:90b:4ed0:b0:369:932a:2b8b with SMTP id 98e67ed59e1d1-36a451a6651mr1415902a91.11.1779342349012;
        Wed, 20 May 2026 22:45:49 -0700 (PDT)
X-Received: by 2002:a17:90b:4ed0:b0:369:932a:2b8b with SMTP id 98e67ed59e1d1-36a451a6651mr1415881a91.11.1779342348496;
        Wed, 20 May 2026 22:45:48 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3cb323e3sm1474847a91.4.2026.05.20.22.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 22:45:48 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v12 1/4] misc: fastrpc: Move fdlist to invoke context structure
Date: Thu, 21 May 2026 11:15:36 +0530
Message-Id: <20260521054539.128651-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521054539.128651-1-ekansh.gupta@oss.qualcomm.com>
References: <20260521054539.128651-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RedUWtrSJcrRi_EuctzcyERLyG3MG3GR
X-Proofpoint-GUID: RedUWtrSJcrRi_EuctzcyERLyG3MG3GR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA1MiBTYWx0ZWRfX+Fmm/KUsN0NA
 eeGOyQjd+Me6UrzSCa0DZ6rJUAqRiaD+/Tmm6apsaDUanUJFgi73rKQIRMf4lY4YmvE3cycSpWe
 aOV3wVQ9SSt8eVnaxhZknSXYySpSaFQx4qLNfSdFaXurRQRCKygrLOXO7arP2D14QuMqnFFKJ9q
 BFdC9N+EGbi39AXUuWNCXfEUdHac/j9UxZsWD35spEU8MsbosbNl2IqfT6RBZid5LaKTzYs1awV
 /TSZ8TJZkm5ps9oO3UlglsYMk7prFG3B9dlVU4/8xzi1b+yVGSnyuwWQZlWFBiEI7x+fUUzRDaw
 8Gr0YadRIfoZbYFT9HRAe2yemMIxwCJX5AIimOVShVkEb1RwcK3N7rgdqpjQeKtAjsMpCLOUACS
 8RoTcxs2vBtw4L9ULZus4I2QZf/IOlJfSiA+at2+cZo7G6DH6XF5D2qYNrbyNK6EauM3IMR8uzo
 WnA21uA+xZL21XYMh/g==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0e9c0e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=HL6mAI18knL3XnPGOeUA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210052
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108918-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 71EAB59F31A
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


