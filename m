Return-Path: <linux-arm-msm+bounces-83434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B08C8913C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 687774E4A68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE8E31DDB7;
	Wed, 26 Nov 2025 09:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogb4jR2P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C957D31D39F;
	Wed, 26 Nov 2025 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150372; cv=none; b=UX6+yyFESY2T9tJ1h4vEJqFwZT4lGgES//cV1XjKrBCoB5ygimvTG0ytksNiNvb2Fj10qHVoJkjIFaN4z5wsCKgrScTYZNyQrTTNkwIHmB0igwUYmODa32Cib2iwqjNJcXefTdhPCjJab//BqiTW6LI3/S9ioKIAU4H4+oDUSAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150372; c=relaxed/simple;
	bh=Mzc+ABe7MFq16XXa7KTHU9WNQyWKYMpEeyWop78EfO8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W1UJbg/AfgM0izzCuA4XWuSscbxOTgWNDcQMOkTOUFDQDhIZqtxJUAs6k7gsMWJ+CkFVt/ZKCSOQu/g1lr7HtMPZYoTGwIm2n1h2FMixsJW0GBcqIx8TS/Sc0tBXBcKRV3Q1ucdZBS3d2KR2sciqjD6QT+NDMiRU8T1H9IHPcko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogb4jR2P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ6XnB03890136;
	Wed, 26 Nov 2025 09:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UZmGnEpLxik
	yfu2bMubaIvq0Ha00pQMY9vR0yQBa/v8=; b=ogb4jR2P6RSPtXkLkfGFwMbCeVN
	4xydsTMKWCMeOaltLqGdqnoAPJ+mxJLFzzlzDSJu2WiL/m87neFG9LCpFi/hIygq
	hCugffpobMIUNjzHkWlivOlsWEWkVoKwt3iVFZaJoNqUES5hotlAKGptBIXcx8a3
	0rtULpdHuEdDjZVR3NrX9hagz20+4rhbKC/twHEGeLqq+tLQhmBIPKLDeJraCUEo
	jWPZev+FsozI/lkv6I9Fz5r6kiRJl8q/7u3WpFmgrTILpvvlNxzunT16EaURQ+xh
	djWU/uzADD5cMseOqUS/AwycRKBroErq7bGKf4qBUG+Gsd5vujFao6BJ7Ug==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angmeab2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 09:46:02 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AQ9jxc8010181;
	Wed, 26 Nov 2025 09:45:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4anw4ssw9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 09:45:59 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AQ9jxuk010176;
	Wed, 26 Nov 2025 09:45:59 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com [10.147.243.7])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AQ9jxrA010175
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 09:45:59 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
	id 6BD52515; Wed, 26 Nov 2025 15:15:58 +0530 (+0530)
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
To: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ktadakam@qti.qualcomm.com
Subject: [PATCH v4 4/4] misc: fastrpc: Update dma_bits for CDSP support on Kaanapali SoC
Date: Wed, 26 Nov 2025 15:15:45 +0530
Message-Id: <20251126094545.2139376-5-kumari.pallavi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126094545.2139376-1-kumari.pallavi@oss.qualcomm.com>
References: <20251126094545.2139376-1-kumari.pallavi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=6926cc5a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=pfE1wiWnY1F2L3mdSfMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OSBTYWx0ZWRfX4Da1mBD7q295
 O6/5MK7hqmQWDD6WQnHGFZJ2FS2VuawEZZKdWIGQ28uZP7iV/5LeyDJ9oTQnnYnRhoY+xxtpN9G
 BGB6YvlP+jOdjFsHoHZj9jE3usVR5Mz7HsuodOP3iVjGQcOLDRn4qjuJH+aASwLbMOl6i6gsymD
 kIiI7MjcS7NHSc3gJJ1fHv/RxX2EYsALXgbgoee30wEQedLox1hEdFHlpYyDRLVTR7HhXYh/3VV
 /KA5MX7aJlUp86Wz2+bcPKMoycJLLohDrJghFMWsCQpccGFGOqEBVeCb2iKtmHObs3ajSiqYZbC
 LuGlz6Loz2uH3rztgqYIkKy9dGi8joKFfc/F6qgwh+v7qfaF8WI9YriAXyr+P2hJV2Yab/QsdUT
 UA3Yg2bp2/2T4k0mtiKU98xQAP/BEQ==
X-Proofpoint-GUID: nRKMuyXgp3gczPnUYLR2u7l-KTHgL_yx
X-Proofpoint-ORIG-GUID: nRKMuyXgp3gczPnUYLR2u7l-KTHgL_yx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260079

DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
both Q6 and user DMA (uDMA) access. This is being upgraded to
34-bit PA + 4-bit SID due to a hardware revision in CDSP for
Kaanapali SoC, which expands the DMA addressable range.
Update DMA bits configuration in the driver to support CDSP on
Kaanapali SoC. Set the default `dma_bits` to 32-bit and update
it to 34-bit based on CDSP and OF matching on the fastrpc node.

Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 9c3860f5716c..b1315e20f121 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -269,6 +269,8 @@ struct fastrpc_session_ctx {
 
 struct fastrpc_soc_data {
 	u32 sid_pos;
+	u32 dma_addr_bits_extended;
+	u32 dma_addr_bits_default;
 };
 
 struct fastrpc_channel_ctx {
@@ -2189,6 +2191,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	int i, sessions = 0;
 	unsigned long flags;
 	int rc;
+	u32 dma_bits;
 
 	cctx = dev_get_drvdata(dev->parent);
 	if (!cctx)
@@ -2202,12 +2205,16 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 		spin_unlock_irqrestore(&cctx->lock, flags);
 		return -ENOSPC;
 	}
+	dma_bits = cctx->soc_data->dma_addr_bits_default;
 	sess = &cctx->session[cctx->sesscount++];
 	sess->used = false;
 	sess->valid = true;
 	sess->dev = dev;
 	dev_set_drvdata(dev, sess);
 
+	if (cctx->domain_id == CDSP_DOMAIN_ID)
+		dma_bits = cctx->soc_data->dma_addr_bits_extended;
+
 	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
@@ -2222,9 +2229,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 		}
 	}
 	spin_unlock_irqrestore(&cctx->lock, flags);
-	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
+	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
 	if (rc) {
-		dev_err(dev, "32-bit DMA enable failed\n");
+		dev_err(dev, "%u-bit DMA enable failed\n", dma_bits);
 		return rc;
 	}
 
@@ -2311,10 +2318,14 @@ static int fastrpc_get_domain_id(const char *domain)
 
 static const struct fastrpc_soc_data kaanapali_soc_data = {
 	.sid_pos = 56,
+	.dma_addr_bits_extended = 34,
+	.dma_addr_bits_default = 32,
 };
 
 static const struct fastrpc_soc_data default_soc_data = {
 	.sid_pos = 32,
+	.dma_addr_bits_extended = 32,
+	.dma_addr_bits_default = 32,
 };
 
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
-- 
2.34.1


