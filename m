Return-Path: <linux-arm-msm+bounces-80615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EA9C3B924
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 15:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5C1A74FB756
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 14:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA94733375F;
	Thu,  6 Nov 2025 14:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EBLkbcjM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018B9339718;
	Thu,  6 Nov 2025 14:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762437673; cv=none; b=RLfOwXqurg3FaThdpY8ad/9WtJFlBb6Er27o9alO7MXsmgVMqyTSb0P/6yp/6GbCHoQhAf8l9CPfJKb3ymGvhS2hKzEVh0xjHx5e5GCleX0uyda/Ypd2Q4ldJQnNoQGbOxAYB/V3fCxHFWzvXW2Pfk7EG8StYgqvHG2q/mKMmhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762437673; c=relaxed/simple;
	bh=oJ3Y3umJJuTYkVLa7IX8rSNPkpCHjgK3xP+LjKIL0xs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VDPPdbEswbAR0NdKfagmzFqddauBye3LBJmTSqG/ccUdICzs2MqRWukl0T9zq+F6dTBS+nKjv0b/s4gc/pnfGXUyP2kuS0j82ewXhYLuNjBpi8uHMtxFjGsK9QQjvWCgGd5AnKtA6p0wGL0F/Zb8bpfjQgEOAdcBvXJqqM2bNgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EBLkbcjM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A68jb7k2326852;
	Thu, 6 Nov 2025 14:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q68OE4XvQa1
	fhjTTa225mcPU+T82tSrdGoN3KFgnP1E=; b=EBLkbcjMIW0YM0P+Yh55sVBwgmZ
	r/jBrh/Y0Yi3bmkSwkIH0cc1tzs/dAwr73Owoob9HaEtkBIqWuJDip/qLT1jVMUm
	F+L9TgIke2CVSCuuNhnxcd8K82B9zgkfw8wnUVZuoWxj2+t57i0FoiEqq4pL9Og8
	OLgKidkthrqU78H2UWBk4VL1ak93kPLDskE1UGo7mzgXIB6qDAA1BOmubRjijC7k
	T9G9o0BHXWfRh+/DURYNVl8T9XRWRwvhrAU3TJuGOnb8jC5ziVa0IYS/H5YWWm8a
	RBRQPgs0upg7i8k3jtEqbCqBB0tyJXyrONEG2UpENoQ6jddKfUqeeRgdgzQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8h0v233k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 14:01:08 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A6E15Jb032322;
	Thu, 6 Nov 2025 14:01:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a5b9n0b8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 14:01:05 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A6E15Db032310;
	Thu, 6 Nov 2025 14:01:05 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5A6E14fK032306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 14:01:05 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 31C6623282; Thu,  6 Nov 2025 22:01:04 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marcel@holtmann.org,
        luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org, stable@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chejiang@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v2 2/2] Bluetooth: hci_qca: Convert timeout from jiffies to ms
Date: Thu,  6 Nov 2025 22:01:03 +0800
Message-Id: <20251106140103.1406081-3-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106140103.1406081-1-quic_shuaz@quicinc.com>
References: <20251106140103.1406081-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-ORIG-GUID: GK9Ismagdda_8o5sVgRZ8YcAmVOj2msS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDExMCBTYWx0ZWRfX2IjdQPqnNT+x
 lFIUXySiWmA9hFb4yZEx5eWwrRaqmwskkq5txuMqcoupUu0fCiQXiutZ/jd1v4YKJPGu+RTtduw
 yhtjqrvaj3BqRBisIAPrZcAGcL8FDgFuSF1e+KGQCyb4uRD2YVtqcdvN/PXsgfb389bx1PtiL18
 A62lhT0754L2VFkXSfP2/TW+M/q8eNW0YWNO4s4rkXHrvCZPRA/Lgmq5LeZgPmB8tBvjGFeT844
 nl/ocs+c77U710InMUEfjZHThNInaxBxW0Jc8jRxjVlh9444XDJaf55cTLuQdt979X4rX2ftPZk
 0HDqlcV4WpU9kjfbf1uJU2VtPuOl/l6n2d6lt7EFeDI3zDkAjqMgwtoYhhDHlTo5INc0ptHAsgB
 QHRuriFnu6ZVfQVRe5h3g+ixqJlEzQ==
X-Proofpoint-GUID: GK9Ismagdda_8o5sVgRZ8YcAmVOj2msS
X-Authority-Analysis: v=2.4 cv=PoyergM3 c=1 sm=1 tr=0 ts=690caa24 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=eLiQT_JKY73VEPCCN3QA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060110

Since the timer uses jiffies as its unit rather than ms, the timeout value
must be converted from ms to jiffies when configuring the timer. Otherwise,
the intended 8s timeout is incorrectly set to approximately 33s.

Cc: stable@vger.kernel.org
Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index fa6be1992..c14b2fa9d 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1602,7 +1602,7 @@ static void qca_wait_for_dump_collection(struct hci_dev *hdev)
 	struct qca_data *qca = hu->priv;
 
 	wait_on_bit_timeout(&qca->flags, QCA_MEMDUMP_COLLECTION,
-			    TASK_UNINTERRUPTIBLE, MEMDUMP_TIMEOUT_MS);
+			    TASK_UNINTERRUPTIBLE, msecs_to_jiffies(MEMDUMP_TIMEOUT_MS));
 
 	clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
 }
-- 
2.34.1


