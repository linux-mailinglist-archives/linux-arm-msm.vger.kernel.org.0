Return-Path: <linux-arm-msm+bounces-64917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 037B1B050AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 07:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 012943AA6F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 05:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4D32D0C6E;
	Tue, 15 Jul 2025 05:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ggUXq8Hb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1371B85FD;
	Tue, 15 Jul 2025 05:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752556598; cv=none; b=g3dannUQmXUEA6RWh+wIjT799ET2CPOvwJJUoQQJYwsVrN/xO7pZGAX/rnmjSSbL4sUD7EgjGJduBETEnUPnExg3c3iaJGBbP92ATzUd3qEUjvZg96dDxpy22ftOtMY6/8gmI82Otus5sb55R6q3LP233ThdERIUWIrZf8JGRTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752556598; c=relaxed/simple;
	bh=rN2Dl42KUuTSdcOVToEBJ2ftu5xQQly9vQhOVfrIZWU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ChCakDnQvMXhqP10AZaeEWCAYCaafJeQ+ny/hz8+PKo8NrbwVcpubGO9uH3Wjm1h69uj2/Q5uYLpU91Fvm79rgtgWpCylSFxmXSrDzmpR8UpB33fLKLAKMNSYyik1kbk1AvMoTHq5dXtmg33LnKVcLE7fGR3/5P1DCkNemxfTZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ggUXq8Hb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGwN0Q001306;
	Tue, 15 Jul 2025 05:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=we0sdaKx5SGnYsnEKl1pqY1BAI36ixvQga3
	Kt/sQRwY=; b=ggUXq8Hb+5fcadiU5I+9j1HWPtBCkcexm790FtbufptddlPT794
	r1Tt25KJfrFFfuoNnrKj1Dhylz7GzexhJ+qef+n478jI4xCT0QO6SjhowmhCs+OZ
	Vw89SjIqI4KpQ6vC3hZ8BvHyuRYRJ9/M13Ii5Z+bpLEdjQiWp+/BDLdCRXtMT83i
	8UGo4fLe2QTv79MXIdnwjI/w4rkSxXbD1kqVBAIVSfbzFbpPIt/7SF2imOgsUNkK
	rYNcl1xarN7LtulJqCS9DmvKMfnhRHENshFdNs4z0J2ugSMfVHPHoEMdHKPjzMlb
	K67wcymLxBJRBqrQso0FjWXdNAsJv9bc9Cw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37y0y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 05:16:35 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56F5GWB9014201;
	Tue, 15 Jul 2025 05:16:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 47ugsmbt4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 05:16:32 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56F5GWUN014196;
	Tue, 15 Jul 2025 05:16:32 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 56F5GWHB014188
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 05:16:32 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 732BD22B2B; Tue, 15 Jul 2025 13:16:31 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH 0/3] Fix SSR issues caused by BT_EN being pulled up by hardware
Date: Tue, 15 Jul 2025 13:16:15 +0800
Message-Id: <20250715051618.724475-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA0NiBTYWx0ZWRfX1WODKE6LZGTv
 f27mo2BlPxg+zmRPuztM0UBahV/w+ylXF8lPHGnWvp9XnxUI7qO15PhxJEzymQwG/6n7z5jxAI5
 qy8l5bBSSV6YUpdUWk7XYND4KhBPjnIOAlIpRlGgUJvNy32JNZN2i1p0HCpvVRY/aheoEb25HDx
 DClRyfAbfeWGKaWr+t6aLSK24ybw+MembGm0JJro5TAdjrzwUDl6QRId057ujlzex5M1NvmRrXZ
 Ct6YfgNXelJcX8x5CZMKSX+PqgXBPYEaEqXO/xV2e8TTJNDM7ywK5pGC21vgDG0Yi7ud4jNkL2G
 dJffq7TFO3c8mvthaz/5NjAjURqSib5ht8RY0MOaTxR89XyDypnrjMPPYRNt8OAq7WST3IBz+Sz
 f1xvYnKmD28plRoYPPXcLYc2M2SfRojb6GHRdK3zPr9kNfWtPQAuRXmHJHRch6Lfe9tTfKPy
X-Proofpoint-GUID: TNJQT6WFMumtGKZYYjmq0FEMThpaSPVe
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6875e433 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=CCsBk6LTjx9FGpkNJm0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TNJQT6WFMumtGKZYYjmq0FEMThpaSPVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150046

This patch series addresses issues encountered during SSR when
the BT_EN pin is pulled up by hardware. The main issues fixed are:

1. Timeout when sending reset command.
2. IBS state of host and controller not being synchronized.
3. Multiple triggers of SSR generating only one coredump file.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>

Shuai Zhang (3):
  driver: bluetooth: hci_qca: fix ssr fail when BT_EN is pulled up by hw
  driver: bluetooth: hci_qca: fix host IBS state after SSR
  driver: bluetooth: hci_qca: Multiple triggers of SSR only generate one
    coredump file

 drivers/bluetooth/hci_qca.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

-- 
2.34.1


