Return-Path: <linux-arm-msm+bounces-86915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2F5CE8CAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 07:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCE3D302531C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 06:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09E72F3620;
	Tue, 30 Dec 2025 06:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o10Q6H+t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TjGvmK01"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0CC2F361F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767076126; cv=none; b=XHVILr0FWWqDM6Xmk9phhAuZQulpHeihUGR+lh/DLYq1YB20rjH+S9DZeE4HnV7oy6l96iQrYzfSnSVVW3LAAdh+ki1nIl/Yn5jZXiBsn0osJUDDbZsKOLdbhnYDhYOFDEp31TXtQiZVJKGcWqTChMGR9GUIM3nRYyVdqCAXcec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767076126; c=relaxed/simple;
	bh=MHn+V6TRZoHpB/IKHPrGSV0ycKamLtaH9inFw5f2g5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rGKmwz/C7Yds0kJuOEhceWYc4bC5bICOYGaz4IrrPRLmABKX9KM+sncdWUZG7OCdAV5bkFPS30TqlxMydFl9J88QNwvAnimS1+RTJEV+BFhu0fmj0BB8zhU7eYRVcBm3t8gLwb2oKuC519+gQ8JhTu0mCoUhoXQ1NpLOkd4qkt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o10Q6H+t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TjGvmK01; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU54LYm3539781
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=44twYS2j8pu
	ef9SPj0m2ACmUVD52vfoicRaqJwTY5UY=; b=o10Q6H+tj4bFnL3VN+7vryazyuG
	DuLLblP/BNHZaUg5h4ItaM8YksQLg+POH5mcaFtbahNvfW7dsEJJZkC+3X+ihsDH
	UDBHjJelunByqbUJY6rfnL9kdhcEnkOHFBeZJLTMf3rSfsL4NdoTIB4HYGcaZKy+
	fL6LsFBxk++S9rf4b73kMAmlrbgsQIzBuZKqORU2dYWKGHctsQ+yYKcDevA6phfK
	XLCWwRj9/niTRTXq/LkK7okPUF+1bV+vYT6z9h5NBKDqjv9UWppC8hVT7AIhEhdW
	AtE/9miuioWRjLRZkGjPrXeuIOet1FO16iisfi8es5qXenByC9ozLlu/gRw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88yg5kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:28:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c5d203988so20772051a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 22:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767076123; x=1767680923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44twYS2j8puef9SPj0m2ACmUVD52vfoicRaqJwTY5UY=;
        b=TjGvmK01hp9QSr6WykcgMjZIOPJ5xDS831q3qesvp7Uu+spugEymGHjwrjGK2cZytx
         J3Eu+I1XNDxwVAjZDwRWiAkz9BspgxHUJ9vSvmaxOd9e6uFyGPoKyi+ZuybmbFMkCRv9
         W0ckkeDtOigEXer/5e+uzasHs4yCOkZc0NIWJw6ScBjBOOJe1TNOfqaP7oZEoTCdDviM
         OII6fNlgTIU7vqMXjJqv82fFh23SHIw2qmU3J+5OQQNgkN0QuIWFDCbAnnsFWOgep9ut
         a88jGUPCoWC2IePnZs6+kYCFun2vMxr7jO2pVhscYH+nmJ07VZsElSTFTuJropv5VYb8
         qLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767076123; x=1767680923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=44twYS2j8puef9SPj0m2ACmUVD52vfoicRaqJwTY5UY=;
        b=kiFtb7eCjD5tDE5DhG0ZdAFtr3BnatgP20hnp/MOqvnusQPnydl21SaShh37bTB/8R
         AdtaHuUuXzP75wkOhCbvf96+2NIbmrtFi+uXEo+Ox4Jc99G4FuQErI2t3Uv1Wx3AzVPF
         QhN0NHlU4ESxuWwZQHUS+E8x2RUbOrMGuW7rmdmw76vV65AkpWOWE3S7eJmM87HWHhPn
         DuSROorXIK3vjYZQuSVb9WrOlH5+PhcsBMQtwIEqV8WInev8LCQu41RUqYTVPcbla63m
         petzDqkOyH9QRNMiNLmsYl+FaVr2xeVBogwEO0yYa2qS2j7sgTY2COCU4V9W1Bv8ogJ4
         3wTw==
X-Forwarded-Encrypted: i=1; AJvYcCVIi6KbT2Qbxzrxgj2wM5mZd/lHWsZyaKa4PR42mk8uCn2XziK9oz7tcIiaC7CursXVakCXz4AigXhVyuuv@vger.kernel.org
X-Gm-Message-State: AOJu0YxTyU959hKyD2Ewr4uZLgvkDvpuk1W2tUpl4FfZMRZ0huXm6kq1
	hobDeJFoSi9TBVdj9tVqU9LZebWFC+jBb6h+l3JsuK+9eu3wRf8LqSn16J7rYCd14ayFCsAfPIc
	XPdVUQm9CsUXp3hwaEHY1k13WjpVgt95rlMhGTEbwvR5FDl5KTypgTmqYnUpR6KWCGmDg
X-Gm-Gg: AY/fxX5yQYxdt7al2X4np/XKobIFT+qwUYlBUWNu7tJINiVUrDQAvowhQue6nEigR95
	X98IUTfQvHhdAz3qsk405SnFc4zeqTF+6Sfr3LY9m1eaJV15sZYiQj7ehg+6b7wb0DxWmhPJJpE
	SqBt5vs2KXRB5mWzbngRKKOrg2CUMWuVy9ZGowW4jBg0JGSiy3rIrM3aZEW/0iUWttf22+uk/xA
	0RqXoM4rAE6ALz4OYv41eK9XMCtDZpxm88AIk6yeNMvrCUsIVG9yCcqc7USeXNe3mvuKZbOgz6C
	pTf8YBP3BLolh2r2jzDlRhBNo26WIDUcSpUwnT0l3GVd7HaYnEYoeQrqSv6fyuc6qPqcvLp0BBT
	cEMLJ0OTywJ6JHDG8CAX8TzIvG0xbX3LKOfG5G2UfCw==
X-Received: by 2002:a05:6a20:4325:b0:34f:afaa:125b with SMTP id adf61e73a8af0-376a94cb491mr31113755637.50.1767076123574;
        Mon, 29 Dec 2025 22:28:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGa7a36ash2kDsGeHNgvuyMuFBc2a3MlePVxdjQtL2BMh0tEoB3pf2il6edj9DeU0uuo4hGVg==
X-Received: by 2002:a05:6a20:4325:b0:34f:afaa:125b with SMTP id adf61e73a8af0-376a94cb491mr31113731637.50.1767076123080;
        Mon, 29 Dec 2025 22:28:43 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961b4d0sm26491536a12.5.2025.12.29.22.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 22:28:42 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v5 2/4] misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
Date: Tue, 30 Dec 2025 11:58:29 +0530
Message-Id: <20251230062831.1195116-3-ekansh.gupta@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=6953711c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mhgHPu3uRlbtNExDwEMA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: nXqbZqM5rc5zgtAq0P3icxWY3AJsDZml
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA1NyBTYWx0ZWRfX7wf1Q3LB0PSf
 YBQq5U703pwsgs5sWv0+NZEHNh/uamoILRnH7LHk0EVe+jDGUDj/Nd9wZrkfL8H78dEJ1YNnaqG
 4CDQnokt4xaJraGJ/hq7PfQjH2k/PcVhOhi2gIDqpHXzXrOepQV2gSzgsHfJYKjUBL//s9i4Na5
 dn9PZwIjKT4KRGp+Wzzq2FSA0PwAAiUJkx2E77HBORKRrLd0mDUWmCRsMvbTnAVAeZ8dYA6L7Rb
 IAISOxKhrPN2QgsV7E0OoMlRK1TgSL+TyZ416t6q8yIO3nRtLgp3bz8WzZXcUfjF+feuoEnpMWZ
 /IjeXEBQEy4DLp8/N2Lv4TeKV5qNaq/T+SNaXbkpWhu+cMUuBvbJpnz22uOWotZtklNHBSnaH7R
 nfEVqp7bpkKIyNyIkZuaQUa8RjL54yFXG6jPiRIUIFtwtV9Tv60MjnT+jJN/yyb0Az7UJaWNpDi
 eFqKxfijk3qBwG7moyg==
X-Proofpoint-GUID: nXqbZqM5rc5zgtAq0P3icxWY3AJsDZml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300057

Replace the hardcoded context ID mask (0xFF0) with GENMASK(11, 4) to
improve readability and follow kernel bitfield conventions. Use
FIELD_PREP and FIELD_GET instead of manual shifts for setting and
extracting ctxid values.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 679cd8997a00..f7fb44a8e9c0 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -22,6 +22,7 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <uapi/misc/fastrpc.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/bitfield.h>
 
 #define ADSP_DOMAIN_ID (0)
 #define MDSP_DOMAIN_ID (1)
@@ -37,7 +38,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
-#define FASTRPC_CTXID_MASK (0xFF0)
+#define FASTRPC_CTXID_MASK GENMASK(11, 4)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
@@ -489,7 +490,7 @@ static void fastrpc_context_free(struct kref *ref)
 		fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
-	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
+	idr_remove(&cctx->ctx_idr, FIELD_GET(FASTRPC_CTXID_MASK, ctx->ctxid));
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kfree(ctx->maps);
@@ -625,7 +626,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		goto err_idr;
 	}
-	ctx->ctxid = ret << 4;
+	ctx->ctxid = FIELD_PREP(FASTRPC_CTXID_MASK, ret);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kref_init(&ctx->refcount);
@@ -2451,7 +2452,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	if (len < sizeof(*rsp))
 		return -EINVAL;
 
-	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
+	ctxid = FIELD_GET(FASTRPC_CTXID_MASK, rsp->ctx);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	ctx = idr_find(&cctx->ctx_idr, ctxid);
-- 
2.34.1


