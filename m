Return-Path: <linux-arm-msm+bounces-80617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DEFC3B96D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 15:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E43266202C1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 14:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C27633C521;
	Thu,  6 Nov 2025 14:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eIVeu+pr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D111E1DFC;
	Thu,  6 Nov 2025 14:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762437674; cv=none; b=djIUXGZwM9VMYH73Baq6yYscQvqnCJluiFv69rtySUjzHlwly57cWvIKZxLNywQ8ShRRim5fJ22KOomZ8ZefmKYZobeu3LZ573MX7ZLStx+FVqNye1VcvzhxfdAyUvQNP8cxpqK+cOkn/YRRU3Kyj67V06ObRduJMH8UcoAo2/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762437674; c=relaxed/simple;
	bh=w8ux3UU1qUImmYc7/0F2KiQG8mMGQLFrfKHnxT1jTSM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dnau51//XCYqR15MrlArYra2F8A/eWkvgW+mD7vzhSEyxDDXibqjlaGVo14cFQ13oFmZYv9lwayDPhKMK1uALX0ZkN9JvE33lp1grWc5u4KN9+Rknp3dPcbGF2PYSER62xiIhfZK10sUHCqZmwBu/Y97J9iW+C7vSacj/z1Dqgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eIVeu+pr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A66t1ZD3155451;
	Thu, 6 Nov 2025 14:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Yk3FPKoQfimlpMwrmbVN1ZN6gwnsqaCR6YW
	2iDpIoe0=; b=eIVeu+prXCD6S6+8gtJQSrjnbq8QtDkUlUweZsQ8QKdjpd9RvWs
	KHdvtydjqcqMYCwrUqSb9iJ10X4hoa5GeL6eZiNQZjLGhGNXlE7TjgcW5C5ENJg7
	+aWv2Ap05whikVu2NADAbB7cXRYeA4QjGChigdv2ksTCUW325iDSoTCRN14FMzza
	DssVO8jvjOowUnqEM9WIhVgJuPaf+uqIRJWNrOlcRIzukPnftQGd6YCVPeK0hFtj
	0CFHFAeoVDQ2ywz/XiU3hIRxnbc+o/ObEym1oUw7W3fAxWw6aUl39CxUmO5Hwf45
	7QKkztWEeia3j9MUBNbsM0H4xgxjegkKiqQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8pu0h514-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 14:01:08 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A6E15vC032323;
	Thu, 6 Nov 2025 14:01:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a5b9n0b8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 14:01:05 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A6E15s9032309;
	Thu, 6 Nov 2025 14:01:05 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5A6E146h032307
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 14:01:05 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 2AB44231FB; Thu,  6 Nov 2025 22:01:04 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marcel@holtmann.org,
        luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org, stable@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chejiang@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v2 0/2] Fix SSR unable to wake up bug
Date: Thu,  6 Nov 2025 22:01:01 +0800
Message-Id: <20251106140103.1406081-1-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDExMCBTYWx0ZWRfX8t4QKvmvugYg
 TFJbs9NCIJJq3M//4dgVk+Mocfq4vA0yQdn9i13mkmhUTwehpUmVU0vzB+btIBHvPsBwc+BcXT3
 a+HFgdcstMWXfjXDxoqKN+PbCu8/9Ls6+TkPGO1YAHBpMrXYAfUAwQ9RUO2isgtGCeiP65rneRQ
 rshHgtnV3Cz2yZ7kti5YkEZa+ys/txeGbQpIq5RWpsQiKzHqjhphcmYQAl/Na4bUYgsbmgSmDrs
 MlIA+hESZUDcxPvidjh5qD5P+b7lBKAwev3RnHucIhPev05tRRof3+BWjd+CbEvSGVRRS6xaQIK
 5qQ1C9Sfq1ug35nxMVbOCzVh5QK6L2ZaNyLDRW+lO8E7ootVCOlynV8bvRH+P2XZuDpWPbldWZw
 rgB0k99KUUCc0Pw82gzgv4Wkq87axw==
X-Authority-Analysis: v=2.4 cv=bIYb4f+Z c=1 sm=1 tr=0 ts=690caa24 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=nga8D478eWHIXYdf7xwA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: WK9rgGOLRK-_Q0fNoKJsMdLt9FLFPerp
X-Proofpoint-GUID: WK9rgGOLRK-_Q0fNoKJsMdLt9FLFPerp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060110

This patch series fixes delayed hw_error handling during SSR.

Patch 1 adds a wakeup to ensure hw_error is processed promptly after coredump collection.
Patch 2 corrects the timeout unit from jiffies to ms.

Changes v2:
- Split timeout conversion into a separate patch.
- Clarified commit messages and added test case description.
- Link to v1
  https://lore.kernel.org/all/20251104112601.2670019-1-quic_shuaz@quicinc.com/

Shuai Zhang (2):
  Bluetooth: qca: Fix delayed hw_error handling due to missing wakeup
    during SSR
  Bluetooth: hci_qca: Convert timeout from jiffies to ms

 drivers/bluetooth/hci_qca.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.34.1


