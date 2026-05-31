Return-Path: <linux-arm-msm+bounces-110482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJJJOarJHGp2SgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 01:52:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEAA61857F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 01:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFC69301DBAA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 23:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3274376BEC;
	Sun, 31 May 2026 23:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RMqHKovG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F26246788;
	Sun, 31 May 2026 23:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780271484; cv=none; b=HHcFyd8RIl9oyrDwFbkTw6Z6HU8uPusTuOFpSXXicfEnopoGa9MR/uu/Jm9Axk1NAJb96XxtKXn/tzYebmRuSF/DXRaIfXuSwvS8y4IksPs0M1gzIFwd/1NON24ADTy/wg+Y1zsdSqi0nxGk/ndtsSMtvB19lW4nFbihB1UD/O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780271484; c=relaxed/simple;
	bh=HeSRzaMmBgN8kFOW+DJ26Ptg66O+l6S6JV1ThRI74vE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uRNCzgSwy5FAIzmDAlimKdZ9BYCvhtImz35eu1PpBQlSh+zfoVS5uxgKYFHG5SxU/nug4uaQXu8f+vLYRjfvZvQm6xPITTCvjUikY/tZnxJMS0OUtz9gcbP4ekRrY9YFfIsKVHY3NBrgKcinAPNiinCFrOsiQDfJcBBwO5acoPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RMqHKovG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VBbuJD1641315;
	Sun, 31 May 2026 23:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oKQXJxkhcwp
	Y18dGQqYzAdFsYFCW1CUOh+zYhSp6vxw=; b=RMqHKovGO86IX4BaBzED8pO++AV
	Z/3CcxRopg+5i0qCqpYBmWOHNYouDX3VwuatgA61HaMJVkVBQAlTB9DPieUA0Zak
	nLmbYJUIQopiD+Vs2ksGrAcboGb4Jh9U01akx6vVPTZZ3m40c00IGXzW8TE2C9Dq
	SLXEYsrVY+sT2o7RSUWXRwt1H8QFhD5cCZMYlaMDCjem8F38zoh5T0qJvQFtimm3
	2mvddEm8AfebvEbsgn9AkdbA1rOWzNV6PEAvnXQ1VzcCR77SKR4/KiMdI+gCknye
	s7uHFCvPNGJTe82jtKE1o1AoloMGd78dh2m1hIOAKJpXzs58GvJFpQ02S9w==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7fd040-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 31 May 2026 23:51:01 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64VNowqh008816;
	Sun, 31 May 2026 23:50:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4efryj04bg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 31 May 2026 23:50:58 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64VNovoh008810;
	Sun, 31 May 2026 23:50:57 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.101.157])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64VNovbe008809
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 31 May 2026 23:50:57 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2342877)
	id 113C2628; Mon,  1 Jun 2026 05:20:57 +0530 (+0530)
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Subject: [PATCH V1 1/2] scsi: ufs: core: Add UFSHCD_QUIRK_SKIP_DEVICE_RESET quirk
Date: Mon,  1 Jun 2026 05:20:10 +0530
Message-Id: <20260531235011.1052706-2-nitin.rawat@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260531235011.1052706-1-nitin.rawat@oss.qualcomm.com>
References: <20260531235011.1052706-1-nitin.rawat@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: 5Q_o-WTzz9EUXNBHg7qrJsz5pTphB9vV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDI2MSBTYWx0ZWRfXzV8StmrmF7s1
 J5wBXKyX4PoYMKMyUpYw+9dJ9ufDjKUMFgBy6bAFXOrdDRDL+5ztWKU3XEbKpiMWMVC76e6Pbxa
 KSBfRRScOndrGhqubkqtxR1J0D30kBl2JqmApwqytrIfQ1s6ZjNNHf/+pqjeMLzyunRkMOdzz6H
 FUri7HJg4WU3oq5uxYgjqnzKNrqRAMmX17lZw4VeEnOv+eE78pOnkBOb8iN36HQcyVfcMu+N+HK
 2A1eSm13Rf4l0eX/6bkJLhnDOFqBsfP4OEA0bGZmtpW+yHIW3ozsNkBoiEfTbYYPT69+hW6P+Sr
 JdjtIcN1k/QLZSOQBJYLHgoNW9VWt1YyY1/GXYRatOsDx90AWPB+h9fWArRWxnExhXXgoASH8ab
 gbrXjpl78/3zT/Ua3J2fIsAzAg6YKhb6UloW5mcXSm0US9/mjy2om0Iu7I79Oz6KpUYFoFfSweL
 6ENOphYCwRo6w1dfpkw==
X-Proofpoint-GUID: 5Q_o-WTzz9EUXNBHg7qrJsz5pTphB9vV
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1cc965 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=2V3TmOejhFYnK1YQI3EA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1011 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605310261
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110482-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nitin.rawat@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4AEAA61857F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a new host quirk UFSHCD_QUIRK_SKIP_DEVICE_RESET to allow host
controller drivers to skip asserting device reset during UFS power
down.

When RST_N is asserted, the UFS device firmware wakes up and executes
its internal reset routine. This routine initializes multiple hardware
blocks and causing the device to draw a large curreny during this time.
If the power rail transitions to LPM (Low Power Mode) while the device
is still drawing this elevated current, it may trigger an
OCP (Over Current Protection) fault in the regulator.

For some UFS devices (e.g., Micron), the elevated current draw persists
until the reset line is deasserted, making a fixed delay insufficient
to prevent OCP. This quirk allows such devices to skip device reset
during UFS power down. The device reset will instead be asserted as
part of the platform shutdown sequence.

Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
---
 include/ufs/ufshcd.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 3eaae082329c..18d634499ce5 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -813,6 +813,20 @@ enum ufshcd_quirks {
 	 * allowed by M-PHY spec ver 6.0.
 	 */
 	UFSHCD_QUIRK_EXTENDED_TX_EQTR_ADAPT_LENGTH_L0L1L2L3	= 1 << 28,
+
+	/*
+	 * Some UFS devices keep drawing larger current after reset is
+	 * asserted until it is deasserted. Asserting device reset
+	 * during UFS power down causes the device firmware to wake up and
+	 * execute its reset routine, drawing current beyond the permissible
+	 * limit for low-power mode (LPM). This may trigger an OCP fault on
+	 * the regulator supplying power to UFS.
+	 *
+	 * Enable this quirk to skip asserting device reset during UFS power
+	 * down. This is handled only in shutdown; the device reset will be
+	 * asserted as part of the platform shutdown sequence.
+	 */
+	UFSHCD_QUIRK_SKIP_DEVICE_RESET			= 1 << 29,
 };

 enum ufshcd_caps {
--
2.34.1


