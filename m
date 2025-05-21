Return-Path: <linux-arm-msm+bounces-58950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A02CCABFB4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 18:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BA021890527
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 16:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53AE62153E7;
	Wed, 21 May 2025 16:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UF885eCS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D93D16DC28;
	Wed, 21 May 2025 16:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747845149; cv=none; b=DBrSNu1j+CrWYfo82SRnbreVZyZlxLx5chNakVA5L9dtWuNurRPXwhW0J0QarHIsOCz9p1ZkRxfaiOTAJ7gzSZ3gPDIa18CZn9IakVRLU06gOodUmOKSqZNrSyKaTFVZ1/bNGOoCukkLZIJ3j2XzxHtiAl7KFOmedMC/ramer1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747845149; c=relaxed/simple;
	bh=cf1lBPR/+sEaoaDMivYSgjSCVGSU8Koitx5HilmzPoU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kFrh3hJqYTIxELC9rr44RXnEJ8zQUAIJz2xbyVWY+VFCj6TlmRDc5bO74BYZWd1H5pQCBR10rx3Zq+dQdWZvqHWKhz5Z+d3nAG57AsWsJbHw/+KSboVo7zIgpUognK9YBuOtnYN5W7v4rVaKSwi+4bY/L63USE9gJHpZsmRSPCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UF885eCS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XNj7029159;
	Wed, 21 May 2025 16:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KGwc1ql+1jS9ZRvnpK1IPg
	yP+fU4+jeRI9PbhjIUHPs=; b=UF885eCSTaisK1dKErrhDAGyT1tG68WPSRq6FS
	GvNLiOdCNMe0tXWWj0aIXQ9GwNP9YPi0p6PkViPBra4uWCdREcu6+sRzdb8AOMXx
	o4ZZKUJIsFRA5hGTtMyLT59IslQbFL8Z5ut+IuD1luBI2sQQYIQjnPOti3GbCWE3
	xyO3+GZHAqPvgVJ55AYnNdKYZt6evof3imBu2ItFU8puZxwkDn3j0TR1Y3CQNGVh
	y/notXTrbhiQ6d3AHozxSu6ofCFS98BqIg0JILQcyOX4FFMbEloHALR5lKsYqhNi
	3vVDi1zpJT2xMQYugGq+LBmR5ePKV22it7UHHo4oD4gMcrPA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf43n47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 16:32:25 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LGWODC020169
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 16:32:24 GMT
Received: from hu-yabdulra-ams.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 21 May 2025 09:32:23 -0700
From: Youssef Samir <quic_yabdulra@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <jeff.hugo@oss.qualcomm.com>,
        <quic_carlv@quicinc.com>, <quic_thanson@quicinc.com>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH] bus: mhi: host: Detect events pointing to unexpected TREs
Date: Wed, 21 May 2025 18:31:10 +0200
Message-ID: <20250521163110.571893-1-quic_yabdulra@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE2MiBTYWx0ZWRfX/kAtc0Ew7T3p
 K4b7M0MlWD8v2z38LSZ7lpbwCtqgBwTqvvs/P7u/QNlvE2aZ2YCJkM6FoWQHUOJNf3XValZBplA
 voHUYfEegf3Zb2zCd5cqvmxMfweczuLfE0XFPPHKBywA0u4p631zbfRY3D99o/CIPQi3eBUmUSy
 F2EBOZW6g64X/jw/XDThdB4s6dxLv6bIwh9EoSu3QlU+MraIlqfcpVY41jYKL0ETpry828drYks
 5eVB3tRYSci/u5A0EWfoXW4virS5JMSMpvtldaCSuOj8Qb1jfQIW/a9upuX93PizAPjNhcAxE9k
 yV9aC9cTxo4fcskvdlIYZT+iFf0a8dD4HU+sy4mq/DIO8gYz0ZGnH357e8qkwS4vm4A+FBEkffN
 gcBwumzFytlCIDSDfkuYwdBdLnnQrCbliE2rWDlYvnTnSNPfvuK5Sv8VpdAFBfaZsUeILvrz
X-Proofpoint-GUID: 75yyjb2B4tKcPnEa6lF3ZS6uzOofFvnj
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682e0019 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=w97xFAd__o3z-cDrnlAA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 75yyjb2B4tKcPnEa6lF3ZS6uzOofFvnj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210162

When a remote device sends a completion event to the host, it contains a
pointer to the consumed TRE. The host uses this pointer to process all of
the TREs between it and the host's local copy of the ring's read pointer.
This works when processing completion for chained transactions, but can
lead to nasty results if the device sends an event for a single-element
transaction with a read pointer that is multiple elements ahead of the
host's read pointer.

For instance, if the host accesses an event ring while the device is
updating it, the pointer inside of the event might still point to an old
TRE. If the host uses the channel's xfer_cb() to directly free the buffer
pointed to by the TRE, the buffer will be double-freed.

Validate the pointer inside an event before processing it.

Fixes: 1d3173a3bae7 ("bus: mhi: core: Add support for processing events from client device")
Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>

---
 drivers/bus/mhi/host/main.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index aa8a0ef697c7..57dc9c5c0d84 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -602,7 +602,7 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 	{
 		dma_addr_t ptr = MHI_TRE_GET_EV_PTR(event);
 		struct mhi_ring_element *local_rp, *ev_tre;
-		void *dev_rp;
+		void *dev_rp, *next_rp;
 		struct mhi_buf_info *buf_info;
 		u16 xfer_len;
 
@@ -621,6 +621,16 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 		result.dir = mhi_chan->dir;
 
 		local_rp = tre_ring->rp;
+
+		next_rp = local_rp + 1;
+		if (next_rp >= tre_ring->base + tre_ring->len)
+			next_rp = tre_ring->base;
+		if (dev_rp != next_rp && !MHI_TRE_DATA_GET_CHAIN(local_rp)) {
+			dev_err(&mhi_cntrl->mhi_dev->dev,
+				"Event element points to an unexpected tre\n");
+			break;
+		}
+
 		while (local_rp != dev_rp) {
 			buf_info = buf_ring->rp;
 			/* If it's the last TRE, get length from the event */
-- 
2.25.1


