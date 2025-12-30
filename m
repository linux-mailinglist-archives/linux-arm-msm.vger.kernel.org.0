Return-Path: <linux-arm-msm+bounces-86914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A7CCE8CA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 07:29:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33B4F301EC5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 06:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CD22F361B;
	Tue, 30 Dec 2025 06:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQC5liGp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EuBkLKVc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64FD2F6192
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767076123; cv=none; b=Hlg5ftfEjdgfgUKaW8OhKzmT8mwOgx0y49BvsDWO0F0LUdNtEEfCeRP7Z8QFEU4alCfTtDHoUnIfP5IycI9HrLS1efr9gWzwMsd8k3ubuLQZadu1r/bgZDY4fw6QAvpnMgJzzXIhkn8BMR2v1jUmBeiwgaxdFPOmjsDN0CTU/58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767076123; c=relaxed/simple;
	bh=OdLtVtiwW1xAkEP1Tuk8yBW78hA3TuPbGrqvdFREa1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PpnxmDVMQJsAo/VKe2dcYcwUz0btng8Cy1/p9renGSTOcrqD+WFsGmbI4x+lnxbveO/AGK3K0vnvV79aoxo9YT7GN4UVDjchsnMoyf5cNNsRF7RxbHnMrvo8jzAibbwuZgepgFyl1bjfzz/73bLPsZUhJi1uFxgSXhX1TnKT2o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQC5liGp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EuBkLKVc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU54Mk13539913
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p+hWMKFKc2m
	VbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=; b=gQC5liGpXVgNHhF4H0v7VM3rUtQ
	bdR7c38yZm9uTqQicj1XeDAxMNuW6N7aeO1r6yhOri4Djf0u4uurlkkfJQa4etGq
	lOQPdXvMUjxt7IuY5B1wnN1JyDhnR9z+wdYd6MdhwGbAkb2AX2cd2KJ2cNomXAPT
	+lNTBbbG+oGUjxCIZJmFZ4OdvTJZN5rFBO1a3O3Qa/lC+3tlLN7fb17rVer413JY
	PyKxRekNsr3iCfegm0ICPtdaPW1k1ZbNV6UPw5ZP5zcK4tYaR2j0Cw4zLyuW3j3G
	r+Tno1K1kOwsSOEkujnf7kib9U8B+fBss2jUXqwKuaL3bmVfNn+X47b0p/Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88yg5k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:28:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ed2so10196119a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 22:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767076120; x=1767680920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+hWMKFKc2mVbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=;
        b=EuBkLKVcsnFnvcyTf8k4CPlcWFddEBRxCAdNqhIhbEQwjNQKhMpqV/Oh37EkCwAPNE
         TkYd7YYT/E1q/rKg3IS7d+Z4FH8O+2mrL0gX0Odtc/KO3seYGxBlZlqP3c9fMfVRbBPX
         2FC2/RfeXYG5kGxk71guCobMP06fUGloeWfenUHRUbyeHNNjnG2Agvm8+ea2KFc0U6p9
         GVuhAJ0qen3kQ7JoMIMfal3kWa1xssGjNdcAcK6/zyZU6rzH74F+dktVYZsSV6crIngU
         MliAYJRrpV4PUm6QfeAmaaNWGEFYbEQa48wBZujiY+M6YEMQTfKI+5t0v8cVtfKtGX5V
         w88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767076120; x=1767680920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p+hWMKFKc2mVbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=;
        b=WkRLT/MH/HJMvQngpYDOEqhw9hnzh6j/le2NyZhImRmfJW1M3RaFqEjUln3j6Aw52a
         HqY0g9tttRlGMQRs/irCiuy/28H0xFKv4TMVvEXpGdVsSiL35n6dc9wEKoqCtzUsZ0Xm
         AtO6uwPpgpVUzRdGD926jL00bC0FcUJhkBgnkM1vcVG0KUGNd60MIs5qd3cpxaXcxv2o
         0D9pAAsjSYUBLk4iSD8gpmth9IWerOov08tRrB6c2U7/5b2FhXuL+qz3mcHMqmML5+lu
         ZcZtGW5Dp+Vx+yzEql8pTD0GRxZm51vdRL11ESPrJvxrV59CmUdh/x4KRx6xfQbK9D0l
         KPMA==
X-Forwarded-Encrypted: i=1; AJvYcCWzPS/khUaZ754gixEAJDW30L+mnsIvPvBhS6Knxbp7bVyUqh3/aXjj/iA8Lr5WiBDAVTaD7IrxmJFCv9iP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw23v+a/3yd+I9mG7eSue8Q99mIsGi5i7ZRGPuveN3es1W+bZnW
	8VLZZE4/UUJy4PE/SEPtnwdS5mOum1f5jczvWBigscGpwggT6rZx2JGFTjIHq1ahHmBbccpE4YA
	XQzAxVnlGKiGM+leb4RMYTIRgWC91TMSSsIUHHaQkkLRCkdo2BtC2iuoo1tQtM2qgqFjO
X-Gm-Gg: AY/fxX555b5IHQ9e21Wq6//rJLg2BdQ/WzscVcW+h5XVUUZuY4fmIN9HDey1PaQcui2
	k1PV+g/SL0k5NKnqWsk6lMOsJiLH4a9ofXUkqTA1Co+eHOCZnVvlrxFmAyzVW9rcaYLrtx2aTnq
	5tb2tMlc6RmXdgMSzVQZNDaMZtDK99KevIn1Y4064VXrpzQZ2lckcSsa02qBEODVYp3GpcotV0g
	sij6xk6UXWPUpuhEXdSrPxCna0K1XkzI+FiF0apQlWKL/Q7G5pCiWGqTmyYOcUNWwAg4yLiwp7q
	4nwNktwfiaegBoj7GfCQXIkG9v1pd/aQER6KDnrjAq14g+PkyksQ+HkMb8eN1O+lApBojNqoDjD
	Se41dQoZ5F4yf/XFbK5X4Yy9MJQJusmJrUWjOBeI/Kg==
X-Received: by 2002:a05:6a20:2451:b0:35e:4f06:4fc6 with SMTP id adf61e73a8af0-376a81daff8mr32915509637.33.1767076120348;
        Mon, 29 Dec 2025 22:28:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMC8S1tcREodptdIQyyuwN5nUQy8IuK3aPyGljG7nPIvam307pIjnVBo/03fbiCYSgImk6wg==
X-Received: by 2002:a05:6a20:2451:b0:35e:4f06:4fc6 with SMTP id adf61e73a8af0-376a81daff8mr32915482637.33.1767076119863;
        Mon, 29 Dec 2025 22:28:39 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961b4d0sm26491536a12.5.2025.12.29.22.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 22:28:39 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v5 1/4] misc: fastrpc: Move fdlist to invoke context structure
Date: Tue, 30 Dec 2025 11:58:28 +0530
Message-Id: <20251230062831.1195116-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
References: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=69537119 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hRzSbfjIAxXVlyYcgJ4A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: kd3wjOE1T9kUhZUBL19NiOjqWhmf7eNp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA1NyBTYWx0ZWRfX/4HrbN7xnuO4
 wcXvroOkGVQD3xTs0HPfM/cxJJK+W8tlYj7UfzRVqRECVkEIc3XCAYbIQ+4yMbX5sE9wY/lXFaJ
 MWQtb7ggRuF7Pevcu8aC99pdidpHL5FQiZ6nnCKCf4yCA48YKXjQYlGc6yi/606idEEt4gYHX8N
 54t51UKF5Ha5rHW0tA+unGz2gWn3oH3N9DX6vZC8PNPjeUcEDbE0rK51PRox6cSULo59eAzIv7+
 dHBtcUJdWZG25LUZB0I2ebDc7wgAiyVldBb3EgduPblwhcCoHAht0F5zZ/cilKNH/eTG2YrCwqU
 rxn0tLGNE5qtV4yebKRAJOPrcRP1ThDBEZodwPQZdiLVhL4LJpcH1qmLNk4YqeQ9feQ4e+0wFfC
 JVu7+UYqENeNaH9/mndhwnxHp8qmiWRnFMpZ1ViCSrD6B7hb0mKiDVRf0PgwXsA6/FpSVNmPBTL
 +NK1RYvT+8ljQUHsGgg==
X-Proofpoint-GUID: kd3wjOE1T9kUhZUBL19NiOjqWhmf7eNp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300057

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


