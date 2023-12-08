Return-Path: <linux-arm-msm+bounces-4025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8571480A932
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 17:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 487D62812C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C0F3985F;
	Fri,  8 Dec 2023 16:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TM9yCgxb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D1B1BD6
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 08:35:42 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B8FVLLE003587;
	Fri, 8 Dec 2023 16:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=cvc5qDhwThPU5F0V2+oicf5b9wXyvs5L2fuJUyyQztI=;
 b=TM9yCgxbsK0GJnr/WHqEuC3SflyLLXX5ovIzY7p45xFQOgC2wKt49HCC5IoT7nRqv7pU
 ScLqMXFPiA3dInlUA7HGB+7PmXtaLQHbI7l5wsrFS6yNF/DRVx6OClOivRxcIDNT7ZH8
 pFu8eQqFh7NcpVFAMcLpip8hJHLMwPDPi4s+aRXu8cnHNbWHUuNkGN1JrDHfLpoQWAC+
 MX23++fla/MscGrmx5CGG2H1CdS296OTwUM/qlF6yYqwMSWThuB/WNojB5kcGeveoCPk
 FaVoi8kBLqrTFR5MTthDA+vSh5Ju0MypCAy+T6xN8yMaWLT9JlgYQXf76GYJWf2+x+wc Ew== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uv2sfrngf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 16:35:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8GZC4J002086
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Dec 2023 16:35:12 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 8 Dec 2023 08:35:12 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 0/7] qaic cleanups for 6.8
Date: Fri, 8 Dec 2023 09:34:50 -0700
Message-ID: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EqugR-75hfxKlo0daavmeIkuJqLhPtRK
X-Proofpoint-ORIG-GUID: EqugR-75hfxKlo0daavmeIkuJqLhPtRK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 mlxlogscore=928 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080137

A set of cleanups to the driver to improve error cases and reduce some
code duplication.

Jeffrey Hugo (2):
  accel/qaic: Fix MHI channel struct field order
  accel/qaic: Order pci_remove() operations in reverse of probe()

Pranjal Ramajor Asha Kanojiya (5):
  accel/qaic: Deprecate ->size field from attach slice IOCTL structure
  accel/qaic: Remove bo->queued field
  accel/qaic: Drop the reference to BO in error path of create BO IOCTL
  accel/qaic: Call drm_gem_create_mmap_offset() once for each BO
  accel/qaic: Leverage DRM managed APIs to release resources

 drivers/accel/qaic/mhi_controller.c |   4 +-
 drivers/accel/qaic/qaic.h           |   3 +-
 drivers/accel/qaic/qaic_data.c      |  59 ++++++------
 drivers/accel/qaic/qaic_drv.c       | 140 ++++++++++++++++++----------
 include/uapi/drm/qaic_accel.h       |  13 +--
 5 files changed, 119 insertions(+), 100 deletions(-)

-- 
2.34.1


