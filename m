Return-Path: <linux-arm-msm+bounces-68770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D93B226CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 14:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 283E562382F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 12:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41891241695;
	Tue, 12 Aug 2025 12:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J8RVhkrT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2174221283;
	Tue, 12 Aug 2025 12:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755001777; cv=none; b=GG/v0OsUATNd2+4dZnZoGjYlqYcnyx9HNxWH2cvGF9vPTKpyB/XXPwqVYMnqM00slTZ+O4ISNpI3bsn2SuV5kBXJN1XbCg1JnG/5rdLafZ43+89gdd5bB2z2TeTxGOkvYVjt0WeSi+3D1C6vpOM5C6iYIr2E1aWQJEE4cMhPtvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755001777; c=relaxed/simple;
	bh=+oV+L+WoYUvSemyEmYmqA5gaNjXGGRDD6fk7MO+5ARI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HlKbTwtq2ENhlrBD1EaRGgjD7Atlqm4dMONr+mq16s57iUxKqymhQHS9hJ/EVjlCouDOPzPj3x+lUQLvcJgVt6oaj9qqOJln7jj4JPvtQ12wF1MaI6nZKBE2N/vN5Cz9exiO24nAZoUwhI1mhTh+iVTXsn1+UzSiChpvEklU0fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J8RVhkrT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CCL6T7028663;
	Tue, 12 Aug 2025 12:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wFZZdnSUu7FPYmMneFcydDxcJezMj42MWDu
	kFHYHhik=; b=J8RVhkrTYA3J7JK4dH2mVjiyBidqoO7hjsfZFeEyjStCSMWURGL
	F6ezHPs4ACxTP9fn1ZSxkVFV5EGUJUcfOjrQp8KpO+JQgr/YhQxRJs9jSR8IKOP6
	rZw9FuUjLAH+phjFWc4WL+gadW87aLSHM5hqI6lyshp5HQ0Y55tAPQczUvXtFAQ6
	zFAeLM+J9BvUeoMw2vBOBmQzqxl4S295X21rASJ5MzpioW6nX91AxrfReYuf8Vlq
	yJzlyFK18ZGA+vrVGaafXPqPhQIjRluZv4KT7LjpTwDL9TNFQENCOP6ei/4RncLw
	LiMthLtKmYmBg5arFyUgD2CKnnslMU5Lb+w==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hm80pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 12:29:34 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57CCTV4A029610;
	Tue, 12 Aug 2025 12:29:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 48dydkvpg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 12:29:31 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57CCTVa0029607;
	Tue, 12 Aug 2025 12:29:31 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 57CCTV2I029606
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 12:29:31 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 1B3A722B1E; Tue, 12 Aug 2025 20:29:30 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH 0/4] Fix SSR(SubSystem Restart) issues caused by BT_EN being pulled up by hardware
Date: Tue, 12 Aug 2025 20:29:23 +0800
Message-Id: <20250812122927.3183257-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX6kLNNUWUt6zs
 gdwbg3U/RFDc65Y4FwaH78/1ag6SkutYPDTTHIuPqxzrVCztTBSZG9U2lA2VvqfG9vy6EDqP7/E
 WRwCHn4GARJ2kiz8JyVVkBC/8yz1t+hOV9pj1nKd7i7kjLJiHfPGzFII3IdclKdxjGD6HQWOyj/
 4PK6+hTV+IOBDzM1WvJ8RpiSEoxvi7oGN/2cz7/Vur3Lu3QaJTzbcR1PowNKViIyLfyrLVU7j/N
 yv91+RM52T2nHEUiyeYPFhB3Sd/qJWdmvOdn2LObW3fOQRUksd5rL5OJLBmsl3aQqBceAd/NcAs
 aF9yqjDOOF0tTI5kjjs49MVNAZxtc4oZY+eVR02amB0KcGnRi4t1p4iIABrEJnUCfLwg+DzxQbY
 QB2G2pqi
X-Proofpoint-GUID: HRmUxSyg_QpLNmsxmGN7SYB9_znx2iGV
X-Proofpoint-ORIG-GUID: HRmUxSyg_QpLNmsxmGN7SYB9_znx2iGV
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689b33ae cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=CCsBk6LTjx9FGpkNJm0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119

This patch series addresses issues encountered during SSR when
the BT_EN pin is pulled up by hardware. The main issues fixed are:

1. Timeout when sending reset command.
2. IBS state of host and controller not being synchronized.
3. Multiple triggers of SSR generating only one coredump file.
4. SSR process failed due to tx_idle_timer timeout

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>


Shuai Zhang (4):
  driver: bluetooth: hci_qca: fix ssr fail when BT_EN is pulled up by hw
  driver: bluetooth: hci_qca: fix host IBS state after SSR
  driver: bluetooth: hci_qca: Multiple triggers of SSR only generate one
    coredump file
  driver: bluetooth: hci_qca: SSR(SubSystem Restart)process failed due
    to tx_idle_timer timeout

 drivers/bluetooth/hci_qca.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

-- 
2.34.1


