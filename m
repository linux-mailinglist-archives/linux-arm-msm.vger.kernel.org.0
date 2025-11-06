Return-Path: <linux-arm-msm+bounces-80514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EA159C39239
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 06:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4F78E34E828
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 05:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31E82D7DEA;
	Thu,  6 Nov 2025 05:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJr7EOIz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMRf05Aa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8F62D77F7
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 05:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762405730; cv=none; b=UHHMSLmcKv3GqB+rwGj1PP75RLUZLvwG3xh20ZBIn9+ZeFvsAQnN0oY9c4vJ88hL8ziFxMKs8GupJQlk1LmukHQF6hDybnt55SGpFrtC+7zGLvBW8BUPvqTE7719g2jOPdW6eho06Muv32/mYrdFEzig6lN0xj85Iwr+33lxjYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762405730; c=relaxed/simple;
	bh=OdLtVtiwW1xAkEP1Tuk8yBW78hA3TuPbGrqvdFREa1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MHAIHW57WCE/zHjoxder8a0WcFO4SfKUzpZggKTDG7fZgzvlmYMtL6Lpsfw20irNeDvj42/Cm9susRjmnxIPaQBVw5KaLwBxXphRh0cXaMW3cHn0eJsgE64TuYhjeWY4OIrkd0VnjjXese8w8OaRJED5FH1XOm+un4dZSFEP/ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJr7EOIz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMRf05Aa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KEqJU1784518
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 05:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p+hWMKFKc2m
	VbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=; b=aJr7EOIzgAvUY+6EuNLCcqqUO0k
	0hOlOF/cmOdgrgwuiCmS0jCQ3FhRZjj+AU+o5mkoWwveuEJedOTwCcA9BjqhWVDX
	byTOws9ZVIZ1tjY/RRAHmf/VlR8cDRe1pEL2nEXPoRIL/jeT7YS2novXlpA53ptN
	N+5zGWLY70WUDUpQdfYYm46HYt24eX+bUzqyxf052D32iO/GrSL+o+ASz5Zz8Nc1
	jLZBhl8E32ytWuvWkr0lAB0/Aa2kCt6XrI7svpNpqT6T5MkrxTD3TtrXUQDNaf8G
	3mlaZtey7Bbso0yDC+WM7fYGjWWSandu54UQPS3aewVunhPllXy/Xoy6/Gw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8amx9u7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 05:08:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7aff2f41d18so664225b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 21:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762405728; x=1763010528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+hWMKFKc2mVbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=;
        b=EMRf05AanMlQT+0o+n4ytKeE0PzDaV4m3qgueFB0jGCdJlPNMdILMXIRxCP6Pt/jFj
         QBELx13qGdck9u8Pxz/sFqGfmH96zpSD+ioChH4XRjtjpmQpw2Ans+lO3a1QDTPt868q
         29QGJEZmSxhdEoDdUXIvvXjsoQsry03+dpa5GkRAhq8c8XldotMPRIwB3Ic8agHGhT6O
         kv9qYOFXo9PfDu+H5aO5PT6n9/3H+4zsRq2jMAEe2NERI5W0PaUKT1cxqc9PsWWA9KCT
         81Vc7zBNnCo50+yD4BNEYP6eruRDdHWflnyltffxarCW7AWot5MMYrO/CAlYjTbizp1L
         pKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762405728; x=1763010528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+hWMKFKc2mVbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=;
        b=RlCrc0kMSVGweXVt12iv1rkkycdAHDES3dn5S0Bbz2681jLBYaEk/B/m9NWZHnBsZU
         5yNEIcC/v/PobWOecSHmhcYMU90E1WzRgLee16ngFxwY8Yak0oGEn6EES0NECQuQszAM
         aHWklR9Fpf94Ynf9pNynTX1jklt4tcmDAIrkw5xsrJ8oOVTYU8HQ/XPFjNUgznUhl3iA
         T9vCYcDAH9bl3hiSw2pE5o7c6VhGxWRm7guGQP0BJ+ljoXHeYq5m2G8AONOuvPp1KVHi
         mc409KLnxAsOgJElLcR+MnTVGbM7Ij0rCTl1LWiRqUQjhaGxekgi5cz5uMaYhvG5t7qd
         CfSA==
X-Forwarded-Encrypted: i=1; AJvYcCXhIFvZpR/7b9AbZRHu/aolbd89NPToC1lXznIDPGY7/MGShbL2B/G8gEX8ChGtpSgUJt4VSZuXlrEp8lxJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzDtvCCkdPO0KLyZ7q8vZuqVcbrlzYHn9p+Y6LCwzMm4xpf/oTg
	83CMxczo7hd2gsx6WjJWh93yD7X3xWsEwjJDQcmm2aldSI5qRS+9wI1VWq1y5LgQFlB0c/Tfq97
	z+ur+wNVDkN9lmgGc4uzy40boUQXIy7cs4PQkj8HrXBMQ5/lta92/3oPfksfdN9wQYCPv
X-Gm-Gg: ASbGncteXeWufLhQmMYVT8BhEk1uHc8k3h4znfsaAPXvacujYpguBes/wa7WbQ4sfCd
	v3tNeZvuBDIsGctlUcJZhBrNm1h4GLmDElUUrMhCBUxMPR43OXhZswm+uU6oJAsvnJ2+etoxn7a
	GbJSS/5XHy/WFkcBEVfHPvmWGp1dhX4URjTII1c2kalQH+BHtjBmRll9uMtWW7doTFW1kzYIq+a
	WLKkT4DK/sJT4Iv62QgrBBrhr946BlljbLMu/CzrrtGoWL8qRUQfNzCSR1gLUtgak5HxwYfHWIN
	7w8QdI5vjfHyYV9OJMumvv+cFyu4wvw1MYtRl78Bkrw0NkJL8MfCFB9GaF//2UCVEKp353WVdiG
	OfOuUAOuf34ebA/kpmetEnM2JYGmnfpw=
X-Received: by 2002:a05:6a20:4329:b0:2e5:655c:7f93 with SMTP id adf61e73a8af0-34f866ffcddmr8038727637.33.1762405727761;
        Wed, 05 Nov 2025 21:08:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9x/9PQXFxurYjajKLl4M0E+BvzwI4iNtYKbcQnSyyKegfSdBjBGyv0hbXFx4kxfKFSUcyZQ==
X-Received: by 2002:a05:6a20:4329:b0:2e5:655c:7f93 with SMTP id adf61e73a8af0-34f866ffcddmr8038656637.33.1762405726586;
        Wed, 05 Nov 2025 21:08:46 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af7fd5238csm1185862b3a.17.2025.11.05.21.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 21:08:46 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v2 1/3] misc: fastrpc: Move fdlist to invoke context structure
Date: Thu,  6 Nov 2025 10:38:37 +0530
Message-Id: <20251106050839.3091707-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106050839.3091707-1-ekansh.gupta@oss.qualcomm.com>
References: <20251106050839.3091707-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WguVXcJ_Yn_4C07bnyzivgdmB0q35Jqz
X-Authority-Analysis: v=2.4 cv=P443RyAu c=1 sm=1 tr=0 ts=690c2d60 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hRzSbfjIAxXVlyYcgJ4A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAzOSBTYWx0ZWRfX9e1qFkAQIiWn
 XMUHh3DjM/zT0s5bPwd8iAjlhw9wJXZaZe1blJvstq87YPd/SZlq1cA3E3Qcqpoj90oZytY5QTx
 oR3k6AqtoXjekar3uun+c0rGLusj7XS4LYkCvPi0fKfDJ3CBZLTGSjHIQFg1f8C9TnfnoUa0W2o
 ZstWwE+pfhXDtYHAOnmDUogjxl1MQIbt2ND1+p3oGdqoigmqxEmYmrPgxUgSS2T8biHaBlkgWsN
 u6kQUSzc3hbdNdmUAXztSKpn0zX76oFT5b//pyj1Pi0YxVugmBDbvH0z28NpIApRvlyAIKLeTOp
 kTL1mPyrVCvMZ77GpJ91j4pp0Abv768crnYUpj1doz+OMT6D0P0AvrCDLTCtcNCG+5syuAptyaX
 01bJTMwlKp89Qib/q03XD7Dzi15vsA==
X-Proofpoint-ORIG-GUID: WguVXcJ_Yn_4C07bnyzivgdmB0q35Jqz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060039

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
index ee652ef01534..679cd8997a00 100644
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
@@ -987,6 +988,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 	rpra = ctx->buf->virt;
 	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
 	pages = fastrpc_phy_page_start(list, ctx->nscalars);
+	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
@@ -1089,18 +1091,10 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
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
@@ -1122,9 +1116,9 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
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


