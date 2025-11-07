Return-Path: <linux-arm-msm+bounces-80691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BF7C3E5EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 04:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 104BF3A5032
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 03:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B43E13D891;
	Fri,  7 Nov 2025 03:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FV8kDSNJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D9116132F;
	Fri,  7 Nov 2025 03:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762486776; cv=none; b=geUeLGco1+5bp0fyyW2V27KdrUmxhcXDf0rNNilcJDQftXYJmJw4T5/XgJA6ScnUQ9QThiiGu3meMlLs9jWDZLwPXLfYNZOw/XjaeghgdVNh7rAMgRsWMAGPZRIZMMgaLQlnjcrKAbFqbsT0KLlkkEhD+0ehtewsqId5X2wGUGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762486776; c=relaxed/simple;
	bh=xO6SZ8W3duCMgy43HEugQiR1wgwsIBxsWN8LzyypCZo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d6UmPZpvDGT7QyOXPC48uM10Uot7LHhlbE/kqWDyTOzBhOvsw85c0bR/ampyi3mj59Zz80YKkdOChjiRn3dwL6NsJ2aA2oY6DDZ/3D67m57wMwCft1tdKQur0W/6nYioMhYda520VgBzlm99dXi9CTKqRY5SdNS2IxDOSNNmcas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FV8kDSNJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A719Fwn1711846;
	Fri, 7 Nov 2025 03:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8ejvBjvXbEdbICTXy4dbsxl1zlj9upML2HE
	3tiydGOY=; b=FV8kDSNJxzo40pijYir+lsGm7FPOaBqRlQqzmL3kaEjKfl2RwwB
	+rilbufAlDMFgbD8dR9AGTJc+29KTyXqEWJTlOSKImkX6L5F5Vh/IdAe2d874Cpf
	pvLogI/EmsIIecfrQBlxTMJjSFmmC6j0fsLlF+UXvxtKaj+LooSD+J1SXkjl0yji
	m10+gWOC5xgAduo/XDn7Dd7+8/rNqN8owF2dPfCdg1zy6B4Gm78ZBzae8RJf1cLg
	ibqO3hTdQWgAJTJHy/hFdxrhpy+svRBQab7BLYuR4lcdNWmgW97tbhlsFmgfGaXa
	2d+ZigaBU3ZR6aLZ2Ch9s2BmcX85bfEvS+w==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a96ue0cn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 03:39:30 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A73dS9S030334;
	Fri, 7 Nov 2025 03:39:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a5b9n4nvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 03:39:28 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A73dRNc030220;
	Fri, 7 Nov 2025 03:39:27 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5A73dRFq030061
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 03:39:27 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 62683231FB; Fri,  7 Nov 2025 11:39:26 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        quic_chejiang@quicinc.com, quic_jiaymao@quicinc.com,
        quic_chezhou@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v3 0/2] Fix SSR unable to wake up bug
Date: Fri,  7 Nov 2025 11:39:22 +0800
Message-Id: <20251107033924.3707495-1-quic_shuaz@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=fYKgCkQF c=1 sm=1 tr=0 ts=690d69f2 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=nga8D478eWHIXYdf7xwA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: DJvmUacozVLYGDGAHbj37ypeSwnJOPeW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAyNiBTYWx0ZWRfXxh5tj15KdQCp
 PNFZ+WTxOUilNKGVs4O413JZPiYI/nT+wpXe4GF96s+NdON0IsH28QOLbDOJootey6yQhCbjFUH
 AozAX/urCm/z+qAWfU4VT/WZw1tl6dCI57aTzxRyUz5t8Ufk0QavGLxoYlbISuGO/jC62uEdRHJ
 SVd3yalPLeB1z0INg+3PY9nYv4CbqgAJHGvqrqaK9/1N4MrOoX0+B4gz9AUZqNeqUbYKdmsBtXD
 5+QTOt1v7dp2CnLwNpX1dZ6HpI82GnJNNJqU1FPoPewegPNVeKYMfrgZSIBX0bczU4wU5qH/Q9U
 XFc7FXhWPEMPS/G6Dn3+o0EYdtGqW83RP9Khtnhn+TFRg2jHxVrU67+m88YycBRhR2phJixsRWg
 kABvwgbOhGe2eAYBzMqRyR8/E9SHjQ==
X-Proofpoint-GUID: DJvmUacozVLYGDGAHbj37ypeSwnJOPeW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070026

This patch series fixes delayed hw_error handling during SSR.

Patch 1 adds a wakeup to ensure hw_error is processed promptly after coredump collection.
Patch 2 corrects the timeout unit from jiffies to ms.

Changes v3:
- patch2 add Fixes tag
- Link to v2
  https://lore.kernel.org/all/20251106140103.1406081-1-quic_shuaz@quicinc.com/

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


