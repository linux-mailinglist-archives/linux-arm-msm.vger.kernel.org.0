Return-Path: <linux-arm-msm+bounces-83684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E9CC90DD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 06:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 39C5D4E19AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 05:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6312C08C8;
	Fri, 28 Nov 2025 05:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GYN6muF5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K+alVQn4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E067525B305
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 05:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764306346; cv=none; b=Hjx0hvfwMQhvrgzj5XWCq7omFqLpXemQtVWW62NMSq2XyLrUgosD6R3iQfX1bEnL+8JkSgmbV0J0ifmO+UKia3QWZ7FfiHwBaK4YKTuxoPQMdalvvDfa636YcEENWrLf45x8sz1ZW98bWbJiDct/OpVnazLOQ7e6vD02OBSIh14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764306346; c=relaxed/simple;
	bh=OdLtVtiwW1xAkEP1Tuk8yBW78hA3TuPbGrqvdFREa1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mxpkb8mYs3wL+S51J+i49M/ORhCOlT7PhwGC2DeM96DZ7ggCdfppKeoPW9hYhCEnXKaUWngg52SjmTZsbsEUVB67MV61Cq1HsAAMoFHMxXYsTxyFjNAPspjWXD3YQSaVjhw7j3ynuB5HyghuZ07GypMLPLgDx9PQSF2MbpLqVcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GYN6muF5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K+alVQn4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARIqYNw1958734
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 05:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p+hWMKFKc2m
	VbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=; b=GYN6muF56IcEBaCOcGXR6byt6YR
	Y0ew8MqWafkQ7uJ0pbFwllIyJ1Vc47RqKBivVopa0Cer1+Yx0sc72Rqv4IRG9BE6
	8/vR7mzyyyMZ8uNt5BQlqJxi2df1aZc4QRMrUNrn3qX/B88DwVIkaF5cZBOXVRZU
	JCOsaYLudUvomInjPYB3Jkp3+ROA5qZiv8lnlocQZO5dheonS6SO85H4Wr40d1CO
	5It7KaZ417v4PX285eMadyVUugauh2KWeU75S4uVdOYzYzeKg7ZhE5ROVf8wrKN2
	/AMhya4fsRhQnPRF3U352x/CzoMypw/gvXxxh6pMBNWK5InKcnP9Rov6qpQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmynt46v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 05:05:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-295595cd102so23966325ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 21:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764306343; x=1764911143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+hWMKFKc2mVbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=;
        b=K+alVQn4rmv/JctN4Vtjbmy00DqJ0cNaalUcaTN5SHfHVPY9oo1Ugp4+I4xeDUtimP
         yyUq4p2dXLg8xAdqHGNCbrUpHw8WkjZ8YOPSdWDJTefMM0PU1YfJ/VBbroWMIE5j48mR
         F5tMiWP6oMkvSIrBMJ1GCbN1ffSFSNkKiMFoNuHQ8koa6BuRY2SmDgDJkRUMzSvA6FvT
         wLqxAHZd1MDeYIlwvcLOoj2Jto0toGfhe2ax7scPMB9jsOzb4FiR9a3szyYSNlaog4vj
         6mv6elG9HrdPegFjA4uhzSkfW4WNgp6X7SCb6oHyFKU00CWUMzlyGhhq/jbE+mNWuSQJ
         51vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764306343; x=1764911143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p+hWMKFKc2mVbzgviX4dn/1pRPQOpQtDu/1ysXFdpkk=;
        b=fMq3Fm16KINPfvETvyzmRNfhqVP/AoTqG1fw0fAKWI6B8GEwWUjHQO9knlv8GccqVU
         AooY9noQs9Kbnzx3UZA98orKJS6s02CgpUDG+8FYBOnzMZ3nEtJG/sdsm0/87p/9jNN7
         fj5HWxXMr+BEzETeAwD081frux0U9FF00dspOz4fq7gpqFdoEKmogrtfMluHQNutPgRz
         nFfZCFAkWlWzGlJcpZeKQENKV/V06MUDX2DDmaFcVTJ4AcSirO3k/O8dBb4d9PQ+bNjr
         hoi1jbn5egdZIEm3QXWEBy2q6FydxGlowT6YdDjqlL7qprdafC6VegTmGF9xxdg+iFex
         tCXg==
X-Forwarded-Encrypted: i=1; AJvYcCUJzRXy/rPpPyI/u4q9JDxvuxiFsIMSSrExHhjDsXU4Xb5f69VcCab14juR9koJTOeT0e7gUhCEWprihLl2@vger.kernel.org
X-Gm-Message-State: AOJu0YxFTKt3P1Z0hLChcodsloD0k6JGh1wXcVqmPwzPQjmsV+ZrHQ0F
	HMtkfRBtleoR7/ugvQovitkiD0eDoCBs5w31Z0Ha62SZ1Sl/ZwIQNcxLltT3uya2N/wuaTs/uIv
	iE6OVJEK1ThJzRq+Ikm5eDakD3PvUWUkvzr05PNTIk8XU3EmJ2FT6sdrHF0E5pnnwOU6M
X-Gm-Gg: ASbGnctwf27vE+H+D57E3qYHrUYEfmCw/QDTmL98YPEcefcCEsDl+8D3UugxLitpjX6
	LCdduyrx+j/lj0xVqSO+l1+Yc1E81VtkPkiDTUxNijebG44JlY/RkzN82sbu1ZWH0UI+mWWwznC
	I4BPEcyL8Y6THiVP4S3tO8AupyqB4wm8zkQf022ByLM2oqPI9lxqmAFvzb7/DHBVwq9Vb94aIMj
	M1l02zymIf12BNQXNoDPidVATxKVFpnz6EvL0TEUyeDC7IWjpXjPkJgJxOyrA646sNihr6DUZ/t
	fcr+K11XIJgHCgk8aF6bmCOosekmE3fpEx5CtpmXH+IUyuUM0PLrd5SNXu9mH88jbDxDHkz4f0e
	TnnAw3VLzuyp81hsitOqNRkzNLtmQVNUtXDkyh8eagQ==
X-Received: by 2002:a17:903:8cb:b0:295:70b1:edc8 with SMTP id d9443c01a7336-29b6be917a2mr313234415ad.2.1764306343273;
        Thu, 27 Nov 2025 21:05:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGttVcxC48I1qXIGJ8pQYFoTXX/seoyTogxzon7pZSukIpd1r+O3xQjxLuzCwzZDbvVHZOVGA==
X-Received: by 2002:a17:903:8cb:b0:295:70b1:edc8 with SMTP id d9443c01a7336-29b6be917a2mr313234025ad.2.1764306342721;
        Thu, 27 Nov 2025 21:05:42 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40276sm31952075ad.73.2025.11.27.21.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 21:05:42 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v4 1/4] misc: fastrpc: Move fdlist to invoke context structure
Date: Fri, 28 Nov 2025 10:35:31 +0530
Message-Id: <20251128050534.437755-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
References: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _qFbF3X_hFNVaZrMY6oWGzQXxNU1bfsJ
X-Authority-Analysis: v=2.4 cv=QOplhwLL c=1 sm=1 tr=0 ts=69292da7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hRzSbfjIAxXVlyYcgJ4A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAzNCBTYWx0ZWRfXzvkliowyawj1
 YN3oiD1y1cRq3Rf2KnuOhw6y+YINLwkzH0HKSTBV5AnJl9YZRvx7GxNaZkLyqahDMq7MXgU8NFO
 ieCwmsKWCGNEKVw7hDejbh4dEGN6PQESuUAcWeOFiFxzYOq0QEopvCJhWTqrEWMbaSG7nSSXARf
 tISrSHyrDm6dtFOg2B+KUUjfbfX2s0vZMBxCbTnDPHakqaM5ZVA32iG1oS9nbA7t1rFrAF7tgql
 46fTPQcr6e84zpTnXEbDNb4trZztlCVWe9436Hs+MTkJdGxmPkb3iq3aSNIdRLNqJwoHuZVgevW
 6SqNgKXdZmOIgpG2/4f0hYIjBN1tqolxFX9VH//Hb7snqdAsjranyv99Leo/ITFNA8dR8vm4KZW
 t6IFxjbIMfU0wpRX/TCg5Mzd8sNEtw==
X-Proofpoint-GUID: _qFbF3X_hFNVaZrMY6oWGzQXxNU1bfsJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280034

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


