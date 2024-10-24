Return-Path: <linux-arm-msm+bounces-35745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CD99AF4CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 23:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94B181F225C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 21:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32512010E5;
	Thu, 24 Oct 2024 21:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XmzP7td5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BA418A6C0;
	Thu, 24 Oct 2024 21:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729806451; cv=none; b=shlJtrbTez9U4mVCSgE9s4TTyPRtr+UuRu3Ue5yZXvfSdLNslGy3aNBDDVg+6EnNMUK+h/R3gSemY7M5QbWkV/tfOZk1IGEaiqH0toi0KStLgLTO9CJriyCtEp09U4zikO+7dy8tcnHwyANOC8Sesxd2TGnZRG9IzYt4olzLC+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729806451; c=relaxed/simple;
	bh=i9xjxW3QP5AElS0UBjwZccDzXY4Hmvmi9D6GU0Kj8Jc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MW2egVWT79jcC4YU6qsclivuh6fsxLnbvEr9GgVSUNOKWaLf86eEhiO8mULQNwVEvvRV7e8SxRZHfAVBjVLZRISlaWucwVjrA0qgaodqVob+L54oX72wjEBTyHd/00gwCnCuR9TY0qS0ULAoeXISbLXR8SMWI1NYnuNPTUVeOK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XmzP7td5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OA3RRi016912;
	Thu, 24 Oct 2024 21:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vKlKIskfspVezwVcmZJM85
	f5ydIWZt7M17Yi8dukQWk=; b=XmzP7td5xuopoO5dkMC2PLj/ogbvFo31kT34D2
	uY0S68WyVYYn/ABpFQbbr7JQr5fxBKtFF6FZz4stnJGBWORVHLhkxWK5+TBfsDSG
	LMzyEnp8fSoZ5srTlq0JZ3C4cQQPGeQ3pQ999RujArR5L7QoK6ItYbhCiayRFVWG
	jeQeRIMyTxzFwwUdLtv6bj7fYELPF/hyli4BtIe7jg3+MMozjYDiAG0j7e7jS4BE
	HmOrjUnM83xshYu5Gr1luSMNEEyYMQ1saxsZCwmuZIoewn7zvXdwlgm6KjV0pCS8
	ghHqW53KPZpJl5RhhyN302Ms8g6E5as1APyr5ENVAPkQwhKA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3xq1dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 21:47:26 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49OLlQVO003069
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 21:47:26 GMT
Received: from hu-yabdulra-ams.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 14:47:24 -0700
From: Youssef Samir <quic_yabdulra@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH] bus: mhi: host: Free mhi_buf vector inside mhi_alloc_bhie_table()
Date: Thu, 24 Oct 2024 23:47:15 +0200
Message-ID: <20241024214715.1208940-1-quic_yabdulra@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CxcqCd34is9LAU2lXfxpKHDn_36Q_bxi
X-Proofpoint-ORIG-GUID: CxcqCd34is9LAU2lXfxpKHDn_36Q_bxi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=987 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240178

mhi_alloc_bhie_table() starts by allocating a vector of struct mhi_buf
then it allocates a DMA buffer for each element. If allocation fails,
it will free the allocated DMA buffers, but it neglects freeing the
mhi_buf vector.

Avoid memory leaks by freeing the mhi_buf vector on error.

Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/bus/mhi/host/boot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index 21bf042db9be..2e9ef55a566a 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -415,6 +415,7 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 	for (--i, --mhi_buf; i >= 0; i--, mhi_buf--)
 		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
 				  mhi_buf->buf, mhi_buf->dma_addr);
+	kfree(img_info->mhi_buf);
 
 error_alloc_mhi_buf:
 	kfree(img_info);
-- 
2.25.1


