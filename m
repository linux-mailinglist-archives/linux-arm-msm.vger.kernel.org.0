Return-Path: <linux-arm-msm+bounces-4012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4CD80A8F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 17:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BACCC28176D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621FC38DEB;
	Fri,  8 Dec 2023 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d3/GQon/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5E81989
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 08:31:43 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B8Ef7w4021088;
	Fri, 8 Dec 2023 16:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=qmj8Gji5Tp9SderlcWjqsJ3GBy/p9DnSfDidoyQDdIc=;
 b=d3/GQon/yc0GRJYrTozUFmUrl2CoFRYi038w+kw1cdovlcVo4hqkQlp4XIL36+icL+8w
 z9lC50QO6NkBJfufz9lK9LQnK1qw1rXdnZq35qa7KEEAiz0DZRIdIWA/ZCBdJG9oaStr
 jXw8lsJPM1pfcpfEU4O+iPmxuf7dk0tIWAVqFuqTbzaoGmQDkHpRzxuMlIc9UdqJnbcw
 KN5qmL39EjF6eSKh7rALctbs6dezgudYqFbnjBMwrXqxqZB87RWKPfePDTAm8T/8mv3G
 wEvNmDZcsjSxwMyu8wrk+cfzWpPsmsbwFTDAsPWsv13Sdd8YYUYawEc/SEls5Tp9+6z5 tw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uuphg9ysg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 16:31:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8GVPBN008966
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Dec 2023 16:31:25 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 8 Dec 2023 08:31:24 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 0/2] qaic fixes for 6.7
Date: Fri, 8 Dec 2023 09:30:59 -0700
Message-ID: <20231208163101.1295769-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ULj2zqULdyoMJaEnjoCttfmyZixgkz4y
X-Proofpoint-GUID: ULj2zqULdyoMJaEnjoCttfmyZixgkz4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxlogscore=733 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080136

A pair of fixes to the driver. First one is an improvement to dma_buf
handling based on a greater understanding of that framework. The second
is a reliability fix that allows some cards to boot.

Jeffrey Hugo (1):
  accel/qaic: Implement quirk for SOC_HW_VERSION

Pranjal Ramajor Asha Kanojiya (1):
  accel/qaic: Fix GEM import path code

 drivers/accel/qaic/mhi_controller.c | 15 ++++++++++++++-
 drivers/accel/qaic/qaic_data.c      |  6 ++----
 2 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.34.1


