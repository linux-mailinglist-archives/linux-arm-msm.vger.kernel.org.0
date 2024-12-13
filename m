Return-Path: <linux-arm-msm+bounces-42122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3687B9F1814
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A016163069
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 21:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994871946AA;
	Fri, 13 Dec 2024 21:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UY0Oj4WR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2984454723;
	Fri, 13 Dec 2024 21:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734125654; cv=none; b=by9bLCDply4HmFOnrUs8fejndGH/FHi9gfBg+s3Y7lEXKlld/GNAn1tscrQrZOHIwXgLlQq3NubOjH+erAvHO8WU1hV0HdlWoaeEPwedXocWECcOoRv+yZQTEWvvlQXZoOc3QCQvrStKWJeCisNHVCls1KHn8DTBHGAy6OtLc2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734125654; c=relaxed/simple;
	bh=mTJZoE1dsJbrGPXHGSDzMirC/DdO7/P2olWcVZCsZS8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A8FtV52rDMBa7gSgdC+zrwZmH6KY5Ox5cKHqNew0yvRtz1JfeWfjRb4Xq4njaOTsSA/Nx6XYUlWaJrY35rXBAUDMCSCQgJ80uHgIPVj0P6r93d193jVB4D2/Gq2wNfloeMH57B3v0XMPYGG0AD+7GiY6BlsncOnqhs7QocNNwJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UY0Oj4WR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDAjGmc030144;
	Fri, 13 Dec 2024 21:34:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WyT6KvMGrROVkol1SkX3w+5GGAhr1UQaJ0xcGC0gfaw=; b=UY0Oj4WRRiVJcOZe
	9BwOlpO0s8zwDZz/QLn6LW/ihuJbO4dUu281o58NrCsK26AEISTcOZotvZeA9+Mq
	sqd78z+TSOs85hJPkpBhGKofS9eqW0cuDramb6vWTAvbRP6bWK1dnTP1/9rb0Flu
	4Q/WWhgiTQJjdw5O1gmGqfgmVTcO5vEVgSTu6Lll+PDGog2cUXkIAVaAsf+MG5uy
	Bfy3hVlRhvBJutoNDnSSYSYdgZuHhH2pPfLbkbIRKY23r4JI+FOeTAegCLUJlmLD
	GM0OSQGewtVUjXZai//lr8KN+3+W70+MNHyZ7cwQDVYB0ETmUfz8DlfVEgep2T0B
	/G6OWQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgen2x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 21:34:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDLY7cF024868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 21:34:07 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 13:34:06 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <quic_yabdulra@quicinc.com>, <quic_mattleun@quicinc.com>,
        <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
        <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <mhi@lists.linux.dev>,
        Jeffrey Hugo
	<quic_jhugo@quicinc.com>
Subject: [PATCH 5/7] accel/qaic: Mask out SR-IOV PCI resources
Date: Fri, 13 Dec 2024 14:33:38 -0700
Message-ID: <20241213213340.2551697-6-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
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
X-Proofpoint-GUID: AVUvjOMwEcQt2QYMZXQVXORViOgk6GBW
X-Proofpoint-ORIG-GUID: AVUvjOMwEcQt2QYMZXQVXORViOgk6GBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130152

From: Youssef Samir <quic_yabdulra@quicinc.com>

During the initialization of the qaic device, pci_select_bars() is
used to fetch a bitmask of the BARs exposed by the device. On devices
that have Virtual Functions capabilities, the bitmask includes SR-IOV
BARs.

Use a mask to filter out SR-IOV BARs if they exist.

Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index ce0428f6cb82..00fa07aebacd 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -431,7 +431,7 @@ static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev)
 	int bars;
 	int ret;
 
-	bars = pci_select_bars(pdev, IORESOURCE_MEM);
+	bars = pci_select_bars(pdev, IORESOURCE_MEM) & 0x3f;
 
 	/* make sure the device has the expected BARs */
 	if (bars != (BIT(0) | BIT(2) | BIT(4))) {
-- 
2.34.1


