Return-Path: <linux-arm-msm+bounces-80856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAB1C43AA3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 10:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31990188A70E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 09:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0780B2C21E7;
	Sun,  9 Nov 2025 09:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Np/G3rQK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B772417DE;
	Sun,  9 Nov 2025 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762680313; cv=none; b=YAOohLcm+dnDPidzeCkKM2VnxEfQfujW1XTA962HYZIJdGLkWvM6oZJgIGlTDU9NPuWP12LE7/1ptMYwkvU+dssj1TrMwng5HR8VejXLIKa/EqG81ZyETmS8viIkeyZpkFcpF7TBhJD+VfuC5nV+YRzCzCHPtXC7xiTZjm8PzUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762680313; c=relaxed/simple;
	bh=Sk4k3Kstbsw4Ax3XpoDJr2inivqis6vHWvRyT/guKlY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f5LBoFVK/UJnNp4AhXxaUI0kiAa2eX7HMcALS/vGDVTrZ/UIbaCyx5PTVVb6Yq8R/1Y3Xh+xAr5ECPUxsbBDpcLEnu7zsrwlPFjNlmh1faLD7NikUVfPc7oRVdqNHQ1vUxCVsGyHiT/wJZlWJKAKw0bdnMFSo7FGYUJYbKW7+yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Np/G3rQK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A97e3NO155331;
	Sun, 9 Nov 2025 09:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gz+rpHMKhr3eeEZQi+Jkr8UVDnXfcd9K8Rm
	EV7uIH8Q=; b=Np/G3rQKxcCBvqkvJ/q7iyBusXRVbLat5Gn/LIZ3bQxZITFtWyW
	xTi4JHZyCgVTQyT1ayQiHlBobcvW20D2WcsNiXrB3y83m6405H/c/syGkwa0/VM6
	vfKccJkmdhYyG4pHzk5kH/WPX/au3UChaKx4TyqG1bZ7td7pwdwIKly5LwdbPYiZ
	4U+5b+MetVT2Y0ySrsgcuAfOsSIfSJWpWBOYESlZImbatCHWyEifX1W6i4QHLH4u
	M4MpufzKSNk7SaC/qJlBdHRiZgYud4q3J4cDbmCjWjSOfdh9J/gBNUOORWJaaY50
	p9xR5iMxuId57EYUhBuhagbOEoFaIvq5BIw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xwfhwgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Nov 2025 09:25:07 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A99P5ZH003823;
	Sun, 9 Nov 2025 09:25:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a9xxm0ydf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Nov 2025 09:25:05 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A99P5PP003818;
	Sun, 9 Nov 2025 09:25:05 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5A99P5Pe003817
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Nov 2025 09:25:05 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 44A4A2328A; Sun,  9 Nov 2025 17:25:04 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_chejiang@quicinc.com,
        quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com,
        Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v3 0/1] Bluetooth: btusb: add new custom firmwares
Date: Sun,  9 Nov 2025 17:24:36 +0800
Message-Id: <20251109092437.252022-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-GUID: uod1B-hFcoyvv8jcCGipSOvO91MwvwrU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDA4MiBTYWx0ZWRfXxpL8UJ+Ggwyx
 LNcf7qimT8rfbWEDLqrLB5679mTrzp9RQIkemcY9AepVaTfQ5hwsThRr/MP+ilJvmOdG4hJAU6I
 UlILNx9wRKBR4zUUXtwbD5Q2VrNj+gjg0yXPPH2CgVGECHyxVwGO26j4EIyC+bmMlvkLTM1nZv5
 qSy5DlfK5F4TetUNzEiCWc+uY19Ih49fNDcAriSUh4IEkMpsfQSEwqB1D1EF4oK1IMR6yHjqF8u
 7WfPPgAil4eW7xIUl391exhqgOT0CanwJQdedUUuak1LnLOqF9LzHPbra9ZWNAIcSl+JkaLxRB5
 WmJhILZw13kQHBJ6EyGwKXus/P3wST5jFckTDSp9SwxYiz+EcBm/gnDgSHBxr0zBc3Yk7btr1wK
 eP8TcfuHVCYbY7bMSVrW1zcxGIz03A==
X-Authority-Analysis: v=2.4 cv=LaoxKzfi c=1 sm=1 tr=0 ts=69105df4 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=fjVb93k0sB5HmNTSAU4A:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: uod1B-hFcoyvv8jcCGipSOvO91MwvwrU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511090082

add new custom firmwares

Please refer to the link for information about the qcs2066 folder.

a3f9f6dd047a ("Bluetooth: btusb: QCA: Support downloading custom-made firmwares")

Changes for v3
- remove CC stable
- V2 link
  https://lore.kernel.org/all/20251107125405.1632663-1-quic_shuaz@quicinc.com/

Changes for v2
- Add a more detailed description of the patch.
- remove CC stable
- V1 link
  https://lore.kernel.org/all/20251107021345.2759890-1-quic_shuaz@quicinc.com/

Shuai Zhang (1):
  Bluetooth: btusb: add new custom firmwares

 drivers/bluetooth/btusb.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.34.1


