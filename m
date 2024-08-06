Return-Path: <linux-arm-msm+bounces-27969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A958948820
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 05:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF8EE28108D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 03:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB93B1BA86F;
	Tue,  6 Aug 2024 03:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UEImDjSp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CC01B9B52;
	Tue,  6 Aug 2024 03:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722916603; cv=none; b=YkXQL13ydLjDFtyBKp0MTgaRNUpjmNo7FCvqzWw0GnvfCYqfYy5R6neb8jCyuZRLY2MnwqI5VLYzWXADDsJLaQ8dqmlH/HwZR0nrOBRzrzAkFLv9tgGxkwpGzZ3Juljk8KP8CCekPDlX4uAQN0BDDkGzX8dAScpZN1TtuC2n0mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722916603; c=relaxed/simple;
	bh=uFB7ZRit8bMLvXCfUlRqqr2+PBw1q3s/jHXshm0gzUU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=f86YgnSD3rbCOarLylFVmIzOsWJ5lwI0bV7P4Gz3HKJf1sEuIAS3eXLRxv5c+ren7xgG8za0lLeMRbPhYlfrPel5rsjJjl15j157+vRmMLEcbQO7j06/g3F9K5Mw0EQqNpXNUibvfPGKyIAjaC8w7O2/cs6S77m6qJTZLRL35EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UEImDjSp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 475IpNvF026327;
	Tue, 6 Aug 2024 03:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Eaq7DgyhmP5vhvcaR3fU+P
	T5RJ3ooCrJL6LCaOOXN5w=; b=UEImDjSpQdHNTt9F+9QGibQU8WBEP6hARl58lW
	SK6OvA90ETKjF2MF4g+ZzrWASY/2r1GERJb6K7pyOu8qvlCpduu/6tB+bV2Qg1tM
	b6HcRN1M1xejVAFgcbUdAyeQwGcTOFgzs4TMHufJOSJ/RO4pOl0Qmq45cSYMsObW
	YmQW2s02/Iby950IrWuyQu1c4ZLkd8v6o1c7pJ+jwr4PFQwFDS8Jb1nwfOma60mU
	782kdJXhqHk3C43+x/2rWHDbe5MPFkFptJo4x078Wz1hGyaSH8v/DhOiDxwB8eDK
	x3X2Fv1+56Ors0ksp5hayoubsvAoNomKtlz1+PPOgW/sJjNg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40u4cpgx4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 03:56:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4763uQCI006277
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Aug 2024 03:56:26 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 Aug 2024 20:56:26 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: [PATCH 0/3] rpmsg: glink: Introduce tracepoints
Date: Mon, 5 Aug 2024 20:56:24 -0700
Message-ID: <20240805-glink-tracepoints-v1-0-a5f3293fb09e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOiesWYC/x3MQQqAIBBA0avErBNMxKCrRAu1yYZCRSUC8e5Jy
 7f4v0LGRJhhGSokfChT8B3TOIA9tXfIaO8GwYXks1DM3eQvVpK2GAP5khmXQhmjldQcoXcx4UH
 v/1y31j489378YwAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722916586; l=851;
 i=quic_bjorande@quicinc.com; s=20230915; h=from:subject:message-id;
 bh=uFB7ZRit8bMLvXCfUlRqqr2+PBw1q3s/jHXshm0gzUU=;
 b=u2vY94sXaMQbdyUTemNC9uRgfpsnJ4Orqdn94ZrtPEsw0487IL5PH4ZXN2c6xUFrbcSBAr9g2
 xBy/5N1QbidDfhIgV2dY16/Q9IHadPeEMv2rnT8k5jUF3bxfWYa9svr
X-Developer-Key: i=quic_bjorande@quicinc.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: h23sqsft5CLgfHBMUd4aOiHjlB_Aepfc
X-Proofpoint-GUID: h23sqsft5CLgfHBMUd4aOiHjlB_Aepfc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_02,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 mlxlogscore=813 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408060026

When debugging interaction with remoteproc, do performance measurments
and fix client bugs, it turns out to be very useful to have tracepoints
throughout GLINK, so introduce this.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
Bjorn Andersson (3):
      rpmsg: glink: Tidy up RX advance handling
      rpmsg: glink: Pass channel to qcom_glink_send_close_ack()
      rpmsg: glink: Introduce packet tracepoints

 drivers/rpmsg/Makefile            |   1 +
 drivers/rpmsg/qcom_glink_native.c | 124 ++++++++++--
 drivers/rpmsg/qcom_glink_trace.h  | 406 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 519 insertions(+), 12 deletions(-)
---
base-commit: d6dbc9f56c3a70e915625b6f1887882c23dc5c91
change-id: 20240726-glink-tracepoints-0426bba64a0e

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>


