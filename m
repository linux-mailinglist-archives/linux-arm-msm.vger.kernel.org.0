Return-Path: <linux-arm-msm+bounces-29270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D9295B359
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 13:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD93A1F23DC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 11:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E31185926;
	Thu, 22 Aug 2024 11:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h8vrMuTK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4D4184551;
	Thu, 22 Aug 2024 11:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724324403; cv=none; b=MpCo7tQE/mLlbTxh+Tpgxti/OZoAtipuaxL1FrxeCvRwKORdvV8VHSRSMeJyBxJ2A4szCQrxFrX2yr4W44Bg5wyO6o87+1we/0vodR5JoJhsABoikZqPFCoc1QiPv4qG1wjYb7svb+scCk/6e/+vj9bVsheeYcceG258Lbfv+pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724324403; c=relaxed/simple;
	bh=ftpARBDVSOINYSY49FomyfaoJ/hYTZRwJMBbqkqTY/0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MJGZnHScShMyTy6QoAI26YjRO4DdON8PL4qKpSWvFJGAsnk9825cdzb4PJ1+Km3BmzSI/zOyEiP0+vqrU5Ne7NQshhKd6xm+5UL7G0qrSJuIClyyuHfUixt4wsB6f3goDLEiUrzyVaL7B5ALaLFCu/UI+rt7iOMCm+DUtqluxtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h8vrMuTK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47M9Op2m001444;
	Thu, 22 Aug 2024 10:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sCNtADH6kP3rE4w/Nyr4Fckfz/UXQrBUsaH0+FahJ18=; b=h8vrMuTKSp4yPYMW
	Nea3LHn/Fgob/IkiRs+xoA/0NwHe3Dz+7C3JfZ86Q9AyVQ3BlLkba59ZUvmPr6uN
	+AsutMuKY2BocnT5OQku51Wq/4eA1ZGZ0PYOS7yDhQVWxmYwvCcGH1kR02etrXa8
	0cf7kwozJguxo3a86E3HA+LMDv/FFb8CUBDp+D9IGdEeixIAjk1dbypM4SZYhCsT
	Rg9wwp5n2XilSmG8OWg5LIyPqVqg+DaG/ISrYG8IucycwID3gDxkRed4mTjsMFXj
	Em0kXykzCRe41cgOmtdtkX05TnqeBgA+74GZTdTARsxGdMNtyfR3V2zc/mdn52NE
	LNu0rA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 415nrrt2xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 10:59:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47MAxsEr023085
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 10:59:54 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 22 Aug 2024 03:59:51 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>,
        stable
	<stable@kernel.org>
Subject: [PATCH v1 3/3] misc: fastrpc: Skip reference for DMA handles
Date: Thu, 22 Aug 2024 16:29:33 +0530
Message-ID: <20240822105933.2644945-4-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822105933.2644945-1-quic_ekangupt@quicinc.com>
References: <20240822105933.2644945-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Sq62xZ1lzNDHqXiJUBFQpPA0Hr3DXlwg
X-Proofpoint-GUID: Sq62xZ1lzNDHqXiJUBFQpPA0Hr3DXlwg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_03,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408220081

If multiple dma handles are passed with same fd over a remote call
the kernel driver takes a reference and expects that put for the
map will be called as many times to free the map. But DSP only
updates the fd one time in the fd list when the DSP refcount
goes to zero and hence kernel make put call only once for the
fd. This can cause SMMU fault issue as the same fd can be used
in future for some other call.

Fixes: 35a82b87135d ("misc: fastrpc: Add dma handle implementation")
Cc: stable <stable@kernel.org>
Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 drivers/misc/fastrpc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ebe828770a8d..ad56e918e1f8 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -755,7 +755,7 @@ static const struct dma_buf_ops fastrpc_dma_buf_ops = {
 
 static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 				u64 va, u64 len, u32 attr,
-				struct fastrpc_map **ppmap)
+				struct fastrpc_map **ppmap, bool take_ref)
 {
 	struct fastrpc_session_ctx *sess = fl->sctx;
 	struct fastrpc_map *map = NULL;
@@ -763,7 +763,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 	struct scatterlist *sgl = NULL;
 	int err = 0, sgl_index = 0;
 
-	if (!fastrpc_map_lookup(fl, fd, va, len, ppmap, true))
+	if (!fastrpc_map_lookup(fl, fd, va, len, ppmap, take_ref))
 		return 0;
 
 	map = kzalloc(sizeof(*map), GFP_KERNEL);
@@ -917,14 +917,17 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
 	int i, err;
 
 	for (i = 0; i < ctx->nscalars; ++i) {
+		bool take_ref = true;
 
 		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1 ||
 		    ctx->args[i].length == 0)
 			continue;
 
+		if (i >= ctx->nbufs)
+			take_ref = false;
 		err = fastrpc_map_create(ctx->fl, ctx->args[i].fd,
 				(u64)ctx->args[i].ptr, ctx->args[i].length,
-				ctx->args[i].attr, &ctx->maps[i]);
+				ctx->args[i].attr, &ctx->maps[i], take_ref);
 		if (err) {
 			dev_err(dev, "Error Creating map %d\n", err);
 			return -EINVAL;
@@ -1417,7 +1420,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
 
 	if (init.filelen && init.filefd) {
 		err = fastrpc_map_create(fl, init.filefd, init.file,
-				init.filelen, 0, &map);
+				init.filelen, 0, &map, true);
 		if (err)
 			goto err;
 	}
@@ -2040,7 +2043,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 
 	/* create SMMU mapping */
 	err = fastrpc_map_create(fl, req.fd, req.vaddrin, req.length,
-			0, &map);
+			0, &map, true);
 	if (err) {
 		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
 		return err;
-- 
2.34.1


