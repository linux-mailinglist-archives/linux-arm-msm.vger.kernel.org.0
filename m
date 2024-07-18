Return-Path: <linux-arm-msm+bounces-26522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A949347E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 08:14:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6E401F22F34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 06:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBE95579F;
	Thu, 18 Jul 2024 06:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AQI8odIA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0324440856
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 06:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721283249; cv=none; b=mNthd0IBv9MUES8c1Up/1WeakEzU3cKquczKQGic/2/IFSrxUFpxrt1LeLok5KbnKdledcXUdaeerL9KLSq0zOOOXbs41MORfXO6YM5lmCa89lasCYGilh/ccPkYIgHQl7zxn65jXokKh0T8eI8xvEzORlqpXQ9blCm0mMvpo58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721283249; c=relaxed/simple;
	bh=Ceyd6pmyDNG9gS9FdaUqyPB1332+25P5MI9MtTRqPfY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dQpse0AP0EeQE8/DfjuySjyYnWkYvSyooIDavJ2s17U8wRMCsPvp1nQCpV08EwpCZ4B7Ukp2YBuUytyH4USnBbB1LgfenZ6AL4dyCn9RMuhj7dpo2CjgTybPRFfuvzFj6qk6RWk/PNfHOProYyJkhtv0T8pLSaa92EUf2WVUV+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AQI8odIA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I2fF1m023029;
	Thu, 18 Jul 2024 06:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8+W7iM7gFUzxf7sZZQBexh
	+F78DRCQAifhrrnR/WZ+I=; b=AQI8odIAjWyCdvqrsZoAEGdJCxVtiGHjPLgnC7
	tO0SescRoXK0CEuVIpWM4p86L/kTEvSx4PqHn8RlNjOlCC3qqSD2gn8/KUS/gNXp
	2uj8VRtmSzP6wQPjay1FHTNLupTt+i/whaLOGBAyEEStzEBHrEoE+d6xBC1bOHuL
	qb/mQVJ3ZWXDPuD3DEP/qDBqrywWmnxsiXC3K5h9ptBRvLYH+o00r68UUwGTd7Z1
	SuJvCBhEQefC45NHAB5Ha4k26e+Fguw1qzu4G9q4gs7LLOvrtILIclSI3V74XzDI
	JeaVUAZjkx9xPhBOeTZbvo0+Q8kkHpUN8fppF7Vi+0QOT9zw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfnmkk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 06:14:04 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46I6E3Vn024470
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 06:14:03 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 17 Jul 2024 23:14:00 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
Subject: [PATCH 0/6] add improvements to mhi driver
Date: Thu, 18 Jul 2024 11:43:38 +0530
Message-ID: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
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
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: L-_ERA9c7CrLXaLhmXilOu7DzaIWsWLS
X-Proofpoint-ORIG-GUID: L-_ERA9c7CrLXaLhmXilOu7DzaIWsWLS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_03,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1011 spamscore=0 mlxscore=0 phishscore=0
 mlxlogscore=859 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407180040

The below patches address
- memory fragmentation issues: when several iterations of mhi controller
  register/unregister happens. In our case, we have a PCIe WiFi device for
  which fw is loaded everytime when 'wifi load' happens. For this, we need
  to allocate 9MiB of coherent memory with 512K segment size. After several
  iterations, when the memory gets fragmented and 512K segment becomes
  unavailable causing alloc failure.
  
- debug requirements by printing critical mhi debug registers
- bug fixes to mhi_irq_handler
- RDDM timeout issue
- memory carveout for RDDM segments.

Gokul Sriram Palanisamy (2):
  drivers: bus: mhi: Added shared-dma-pool support for mhi_dev
  bus: mhi: dump debug registers in critical sections

Karthick Shanmugham (1):
  bus: mhi: change IRQ_HANDLED to IRQ_NONE in mhi_irq_handler

Praveenkumar I (1):
  bus: mhi: increase RDDM timeout

Rajkumar Ayyasamy (1):
  bus: mhi: check for RDDM cookie set by device to indicate readiness

Ram Kumar D (1):
  bus: mhi: add support to allocate rddm memory during crash time

 drivers/bus/mhi/host/boot.c     | 209 ++++++++++++++++++++++++--------
 drivers/bus/mhi/host/init.c     |  70 ++++++++++-
 drivers/bus/mhi/host/internal.h |  37 +++++-
 drivers/bus/mhi/host/main.c     | 115 +++++++++++++++++-
 drivers/bus/mhi/host/pm.c       |   6 +-
 include/linux/mhi.h             |  20 +++
 6 files changed, 397 insertions(+), 60 deletions(-)

-- 
2.34.1


