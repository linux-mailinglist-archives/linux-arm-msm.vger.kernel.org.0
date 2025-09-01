Return-Path: <linux-arm-msm+bounces-71348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B410DB3D8D4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 07:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6FD67A6F71
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 05:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E35242938;
	Mon,  1 Sep 2025 05:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZiN7Cms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABFF23E25B
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 05:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756704831; cv=none; b=JEwtjNVG27Zhdthlby1a1jxYmkbawBv1s8CR1dl75GK5IuHERQ6t3NKPnzQJtEKip5U+qjZUKyGATEXqa1ItmUdqbcA6cD6XY+t1R2TfxvB2x0BuSwLNttiHK/6dNL2OMsNSYXt+SdvuhNKVJQ4NqWbf/aD8MMZf3QDCTqdehvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756704831; c=relaxed/simple;
	bh=CHpZnKI6qslmG/UOZhdyGWbwJA0vzEsxMasjuRgvRYY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g12mPbserr+5cskDlu0KqdatfcHOQVE9iUOUpab8JMgYWdjsHKJ1Y/vfK9k2WovB+vcd7xzqtc8knbfCFRyImHwSFSV+KTM+IbWl2WRkjEf+z/2U6pwXUS8mzMrxscmaQkxMPgkpPX0IIeeJpC0u6+a1JO+Psqhh8XoZLSa5Ulo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZiN7Cms; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VNoBfP015661
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 05:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6QnJVy3Cx4b
	AD5xl3mAoxpjrmiuwQjGEsSGBJTQmYE4=; b=CZiN7CmsX7PhiXDYfT40wqWPS2W
	SbWY0MVQy7Mg/xC5A6n5gvTn1Jwximf0Nyl9g0Cex9flHkrVc8U/gkJhiaLhccjt
	EQQ+KIVal5gnrPB6CCz7Ct+hDRAekoqtkm/mjQWvu4X9e821Ikvl/2AIOOggONbU
	iovEsW2CGZ3Eu8D0n28K+WYigW63ho9X2WLw933wvGPTmHXCHfzOTcycCnsIuGA/
	vvhftmRFgB2DE52ppuvqHOhC8JexTXzaCl7n6MNeNUWc7Rf9h3c3CD3OKwAI8ILC
	N1MPtIncjMPW6xpbips60hdFID2tetNABw0TZf+eKVMYYpnBFgc9yxh509g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjbd4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 05:33:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2445806b18aso45381085ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 22:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756704828; x=1757309628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QnJVy3Cx4bAD5xl3mAoxpjrmiuwQjGEsSGBJTQmYE4=;
        b=D+vI/9S7aAO5rf6ts7Rqnm+B+yUCNtXg+8gYbRAC+C2xSygn1ZgQVNo6eTqH+GCq/G
         Daf4Z4JDseRT8JVwB1tCSL1QeSrt2cV8kNYXuGXmZOO/XFiIZBwES8Tc4gpBf/sPMo7z
         AJpNFTHi9zaqNNWkkdnWMVqumVsSimPevYGSnFzR/A71vJvGjbyUIR7kL4iurgr2nQx4
         PUK8cNAKvoLhqHQ1CPE9L1G459AXcab2epOwzPd7aUaDBu117BVnfhVoeJEmHOzVuTDF
         zEwcKwJIQfZyyIIvIf7jZCrH7KAQ2myzacrtcTRHl8QJzBV8fsOfcOGfQ8aQEkGsPRu2
         8LwA==
X-Forwarded-Encrypted: i=1; AJvYcCW6bkYbb32vWS2IAULIdCLyVQ0bXIAoEZcKB4WIvWkgmSpz5M4CeUBp62/XPoxlfufihnb017rK9mjiSOq0@vger.kernel.org
X-Gm-Message-State: AOJu0YyYh0pV8O7owWFzz4mDmd9f0G4HlDKskjGPrxxjSdpa1mf6EuKF
	Nxiq4NKjeYQU262w+uS2+iWj8o1z8cR6FAyaoT6VvBwq9KQOKOcBnixy+FfdniujQAeIU38tABt
	WYKUZXA46octO3bAvXFifwlAgduyuhNDwpdOevqq8eCN64mAtzmI8fo6ihyCHSouEznTR
X-Gm-Gg: ASbGncsblQ4u2IBbFJ/XWj4Xn9RtogNtjKSpY57rIEOce6n9kRmLmlHbDwuDwmoOqIA
	lJdIU1ipzohQlVK4VGt8EHf2YNpXRfd6Se/6MtEgfmYqUN8Bvze3+XH9o3XYE0zjo5EG5QpfKJB
	5Ink5AHLtrPNZKQlo1hl+DSKCQ7elL6zkmptVnYYfsiJzexDDTbo8tLfHbdBA6EhJx9gYu8V3jw
	6Qwlq3q5ZdbWaV31sgD1EdhkutGRzfwiR+O15XT5sfhS1D+1pnuKGuJEeJlsYOCcLnSkqfUMByz
	Kh9Nfx4vREOwYCZz359JS0Us+VqoLilrBBwH8EC+jF8vBMMYu7Dye/kUap0c4BuM51fyrI0J
X-Received: by 2002:a17:903:2283:b0:246:c826:bd16 with SMTP id d9443c01a7336-249449045afmr97734115ad.23.1756704827706;
        Sun, 31 Aug 2025 22:33:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESGSlNcSMvh9kqymldfMZ4baXLjakGcjQQ0lY5ahmqYDQGtoEdo10KCkOeIjeZPCdZ3RAj/g==
X-Received: by 2002:a17:903:2283:b0:246:c826:bd16 with SMTP id d9443c01a7336-249449045afmr97733735ad.23.1756704827231;
        Sun, 31 Aug 2025 22:33:47 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24906589986sm90575215ad.111.2025.08.31.22.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 22:33:46 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v1 2/3] misc: fastrpc: Update context ID mask for polling mode support
Date: Mon,  1 Sep 2025 11:03:35 +0530
Message-Id: <20250901053336.3939595-3-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
References: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b5303d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=eMrONWwZx6N8dQ6zNQwA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: T0fQVK_VuPoFwSRtnVqlAMlzYIgxLpgn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX5GPeZ/4TeNxy
 KAGN6Ddzj1DuGQbquPShBM/SKGhrVVdchAoN4vLAn9d6+H325ZSxP8wDu/ckb+N/rFQ2G/npyl2
 VcvTslgwWeETujy6IDgGe6dH0vZq8JkRmLZHTbox4vYP3gC6upcgIjNWvIYakBIwpfK+TRUyurw
 VoRMtHVzqDhatCvS4PsBeK2s/rHNUd77pL/h/upYPkHo7nU7fKBKB3RH/yQ/MfK0Zw/oPAAoUH2
 cguzPbD9kOVcM5MWbhtH8d5yTJ0YdncjumS3Ko7wuy5wxtQDgz+CwTCpY+Y4Jjn9VMsBx9vJoz5
 5Jv8l7X+JQ2qa6DTngfPCtLHOk2qCNeyb0BQiGpqrm4cbQHJbKhZwUiHGcJTXB1FfFIktM3j1Pq
 zcKI+TxO
X-Proofpoint-ORIG-GUID: T0fQVK_VuPoFwSRtnVqlAMlzYIgxLpgn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

Current fastrpc message context uses a 12-bit mask where the upper
8 bits are context ID from idr_alloc_cyclic and the lower 4 bits
represent PD type. This design works for normal fastrpc calls but
doesn't work as expected for polling mode. To enable polling mode
support from DSP(DSP writes to poll memory), DSP expects a 16-bit
context where the upper 8 bits are context ID, the lower 4 bits are
PD type and the 5th bit from the end denotes async mode(not yet
upstreamed). If this bit is set, DSP disables polling. With the
current design, odd context IDs set this bit, causing DSP to skip
poll memory updates. Update the context mask to ensure a hole
which won't get populated, ensuring polling mode works as expected.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 0991ac487192..57e118de6e4a 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -37,7 +37,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
-#define FASTRPC_CTXID_MASK (0xFF0)
+#define FASTRPC_CTXID_MASK (0xFF00)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
@@ -487,7 +487,7 @@ static void fastrpc_context_free(struct kref *ref)
 		fastrpc_buf_free(ctx->buf);
 
 	spin_lock_irqsave(&cctx->lock, flags);
-	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
+	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 8);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kfree(ctx->maps);
@@ -623,7 +623,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		goto err_idr;
 	}
-	ctx->ctxid = ret << 4;
+	ctx->ctxid = ret << 8;
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
 	kref_init(&ctx->refcount);
@@ -2449,7 +2449,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 	if (len < sizeof(*rsp))
 		return -EINVAL;
 
-	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
+	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 8);
 
 	spin_lock_irqsave(&cctx->lock, flags);
 	ctx = idr_find(&cctx->ctx_idr, ctxid);
-- 
2.34.1


