Return-Path: <linux-arm-msm+bounces-77304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE963BDC901
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 07:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27F521928225
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 05:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA152FF176;
	Wed, 15 Oct 2025 04:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MTJkBb5a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F12FE05A;
	Wed, 15 Oct 2025 04:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760504386; cv=none; b=icg5CfULTPBLIF6EEgWZ9xWLfOu3U9iUTzCT78qRJrAMTcQxYEQI/5uwuKD6rMMln5bf/IeWc92SzzgOAthKOAHjYyDpevNTq6l+l8z3lQOmAc5v7YPL5Hq4D1wJbONoFwCo53+7IoT7tv2z9KZkKuUOPP/+lQTTDezEu7PnBW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760504386; c=relaxed/simple;
	bh=mBZApl/59Et12ONLpDjECT+EoDB4h0Soj3EWX4Z5OeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lvx3xsJQYyuDGo6rvjR6CpNO3cVAaDZEJ0vvATXgWfNAz6nFB3Gk2TXJtbMr8DWVfDkxThF15nE6eC+d2eTkn/C7p90CKoDU0uKzClQcyw/QZRTJp7+MuimJct+YWntTUT00MHTym/PAkuQ7e0TQO/v0ekx/D4uDDoVVDrB82dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MTJkBb5a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sE8I016271;
	Wed, 15 Oct 2025 04:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ajh9QU4pxOw
	ob02eQ9ZtkQhntGe/G91CpkoWzkRfVTA=; b=MTJkBb5acgH8ynmQto8AZ7iDl+R
	JsqQnRgoUf+RK/XSRTi0krXgf1CpgWe00YNAt7E3IL2EZHYaB9PhBlIHPot2DcFq
	hFwLPVIKg97oz06E7Plfg8xZg/IB+eZX73W8FPJePE/aeOMDgnvkK6QEOt8zwbzM
	g9WAYudKTcAFBm3RY0z5viAtigiZwfqpC2ZuKWJUiQidqoK9SIihMVmGXcgxPv63
	Icnd3C7AtgjbHZ+a0wmrDkE2Gxd/biKoAyj+Dus9P+IMObtcSHEz8w+Leh73xFRZ
	B9Wu1PwnczBT2VPxhpKovKXcg6F5J49g+g3JDB+7V5ZUZnRNnmsf4Hd8wHA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkb4b4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 04:59:38 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59F4xZkA022618;
	Wed, 15 Oct 2025 04:59:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49qgambme2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 04:59:35 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59F4xZb1022612;
	Wed, 15 Oct 2025 04:59:35 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com [10.147.243.7])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 59F4xYVJ022610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 04:59:35 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
	id 03C0853B; Wed, 15 Oct 2025 10:29:34 +0530 (+0530)
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
To: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: [PATCH v2 3/3] misc: fastrpc: Update dma_mask for CDSP support on Kaanapali SoC
Date: Wed, 15 Oct 2025 10:27:02 +0530
Message-Id: <20251015045702.3022060-4-kumari.pallavi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
References: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 8sDC42sr0cleISRs5KS_T5T0QQ76vLqA
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ef2a3b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=vdkB0UXvyYWMEW_6SW4A:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 8sDC42sr0cleISRs5KS_T5T0QQ76vLqA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX+6PzGXVB09uC
 IQxFlubL7FCzUkD0RyVEMr6JdAmwx0MBrFue4JoEiVlKgfd3XhcW+EHuy1A4fW3EFvjPfn8Gp5J
 J6yDE4dLXA60iW02hzVkd0Yp/K/YCITgYwBKYX61270YDqayS3ecF+UoydCXw/RlcHFZ3Ox6gLF
 HCQKRg3Mo3gr1y2QELGnIH4oyJj8rxjzgfwcSVRhGPCVmXPQ+s1MRK1hozn6KJy7l3T05tch18l
 sR6RSetGgAoiA9gGXNxYHi1GLl1kkDJ8qEVmQ2LN1IDHskeVgen6w4VfQEjEyUkA3EAx5zP3O1y
 K/bnXzbSU5U3vhS5Mwzov95Fru10rae74zjPRoXUrCVoeIsgucwgOV1txslaTVUxwBh9N7LqJQ1
 nLD+Tffn5U1QTGr93aPTmN4c+KAUlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
both Q6 and user DMA (uDMA) access. This is being upgraded to
34-bit PA + 4-bit SID due to a hardware revision in CDSP for
Kaanapali SoC, which expands the DMA addressable range.
Update DMA mask configuration in the driver to support CDSP on
Kaanapali SoC. Set the default `dma_mask` to 32-bit and update
it to 34-bit based on CDSP and SoC-specific compatible string.

Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1a5d620b23f2..f2e5e53e9067 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -267,6 +267,7 @@ struct fastrpc_session_ctx {
 
 struct fastrpc_soc_data {
 	u32 sid_pos;
+	u32 cdsp_dma_mask;
 };
 
 struct fastrpc_channel_ctx {
@@ -2178,6 +2179,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	int i, sessions = 0;
 	unsigned long flags;
 	int rc;
+	u32 dma_mask = 32;
 
 	cctx = dev_get_drvdata(dev->parent);
 	if (!cctx)
@@ -2197,6 +2199,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	sess->dev = dev;
 	dev_set_drvdata(dev, sess);
 
+	if (cctx->domain_id == CDSP_DOMAIN_ID)
+		dma_mask = cctx->soc_data->cdsp_dma_mask;
+
 	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
@@ -2211,9 +2216,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 		}
 	}
 	spin_unlock_irqrestore(&cctx->lock, flags);
-	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
+	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_mask));
 	if (rc) {
-		dev_err(dev, "32-bit DMA enable failed\n");
+		dev_err(dev, "%u-bit DMA enable failed\n", dma_mask);
 		return rc;
 	}
 
-- 
2.34.1


