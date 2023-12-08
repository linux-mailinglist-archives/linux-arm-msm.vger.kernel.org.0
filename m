Return-Path: <linux-arm-msm+bounces-4013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C89C80A8FD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 17:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CEB2B20B7C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8199B38F8F;
	Fri,  8 Dec 2023 16:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IhnuIfmL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90D671995
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 08:31:47 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B8FZ4GT010525;
	Fri, 8 Dec 2023 16:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=mavRttr6BbHy1RLRGGoNVm1FePt2nUgLEcyeWpv3uws=;
 b=IhnuIfmL4Dy2dH4x1HSrz0xuvkbQUDDvcTxozp63BO32hEVtm2xtP5BwxmcHsmnWapcV
 ar6O1DAtOoe8Y4KxL0zriBHejT9OFkLc+GTMhgxhwJ1l7bNKGHChat3LdUCLwZQDvFXn
 UAdnAvBEqxWo79O7UEE3hbJzBAMI4+deXZetpz79PQRPQBCzd1acILJOxtN8mkFnyCRV
 I8ga3HdGujTzGb9vipLDFRw1Kr2FEirzXPkx8HZsXtjkqaIGbmv7nRDQDnHg6QzBmVvP
 TXu8iqCWnw1mUSgJ5tWj7lNcOf0XlfdWb2MvoKdICW4pRHsXMK5yQS5kszyEFYf27ico Cw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uv5wpg63p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 16:31:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8GVSSt015877
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Dec 2023 16:31:28 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 8 Dec 2023 08:31:27 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 1/2] accel/qaic: Fix GEM import path code
Date: Fri, 8 Dec 2023 09:31:00 -0700
Message-ID: <20231208163101.1295769-2-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208163101.1295769-1-quic_jhugo@quicinc.com>
References: <20231208163101.1295769-1-quic_jhugo@quicinc.com>
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
X-Proofpoint-GUID: 2F-XN8eTc5JpVqkQ0bN6pw1yvFC4EHzb
X-Proofpoint-ORIG-GUID: 2F-XN8eTc5JpVqkQ0bN6pw1yvFC4EHzb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=949 impostorscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080136

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Do not modify the size of dmabuf as it is immutable.

Fixes: ff13be830333 ("accel/qaic: Add datapath")
Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic_data.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 4a8e43a7a6a4..d42f002bc0cf 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -777,7 +777,6 @@ struct drm_gem_object *qaic_gem_prime_import(struct drm_device *dev, struct dma_
 	struct dma_buf_attachment *attach;
 	struct drm_gem_object *obj;
 	struct qaic_bo *bo;
-	size_t size;
 	int ret;
 
 	bo = qaic_alloc_init_bo();
@@ -795,13 +794,12 @@ struct drm_gem_object *qaic_gem_prime_import(struct drm_device *dev, struct dma_
 		goto attach_fail;
 	}
 
-	size = PAGE_ALIGN(attach->dmabuf->size);
-	if (size == 0) {
+	if (!attach->dmabuf->size) {
 		ret = -EINVAL;
 		goto size_align_fail;
 	}
 
-	drm_gem_private_object_init(dev, obj, size);
+	drm_gem_private_object_init(dev, obj, attach->dmabuf->size);
 	/*
 	 * skipping dma_buf_map_attachment() as we do not know the direction
 	 * just yet. Once the direction is known in the subsequent IOCTL to
-- 
2.34.1


