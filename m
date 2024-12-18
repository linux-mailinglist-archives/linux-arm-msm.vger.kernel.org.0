Return-Path: <linux-arm-msm+bounces-42625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 814779F62C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 11:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63863188AD32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 10:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A664198E75;
	Wed, 18 Dec 2024 10:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z0+xhGpW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBD418DF62;
	Wed, 18 Dec 2024 10:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734517489; cv=none; b=iotbmv07STj6onHlkfhlCZZvPVVhxO4KuMq14l0jpe4qRXY5B58kVPWsitlIFdqFUwcz1CwVxFIaeq1uykjLmw7io/WVzBDg0WDQ8k4w3AxQU0zs5yIeT0xkO9WSoeE5HzxnsPqVE8bJMQEdwGWdavsn07jmAP29ukcuWkeues0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734517489; c=relaxed/simple;
	bh=LFLKq5Whzt1xWPMRu1TEoPFtrBiF5MgQLfQhJ3E/8KM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JfnSKnL+AxM3llHAio5GtdNY4aG9YjtwO9IEKFw9det8k5rBLGqZ6oP/O46SgH5gMtldAOeo6DPSSfLBMlHSSTCPJF7cydA95W/b99UBsQumRLOSO4wkqPYb8GuzkLThglGfBxrnS3J6QQcbuqLfxRMzLEl3zqBordUVwGZ7BDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z0+xhGpW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI5CUSH013052;
	Wed, 18 Dec 2024 10:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AzjATrvlRR/KXlpWQeGhng
	auMxqKjt2+AWYl7Ax4kY0=; b=Z0+xhGpWV/lWYTasNqpBOQSwi0Uig69PVt/aXz
	4ZM+m1bD6PLVcGswrurYOzsIBL8qsjL/q6lzJBKjj3VnmUx8VmBemZHCTSO2dxDS
	6Tv4WB1E9Nr1ubDSgaXoHw523G11RNu4uL6QYii2LmRanwpeawcB/MmMt4itJFQR
	WblCZQZVgdnw0PGEX8xzG6C0TzESmLQp7rnReFHeTd6DRrYBfIYy+mFF0hgDJwaj
	lnk5WUuGA70oAPeHCfGxv5S0u3hr++lkx+TUjBI4hB1GAHVbSBa2jEb+3euY7X3Y
	QHCSWqKi+ZVEbMmnieaHwR2sIodkw4Si5M2f/aKV4MeUCu2A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kr1xrqt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:24:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BIAOeCi027707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:24:40 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 02:24:37 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v1 0/2] Add missing fixes in fastrpc_get_args
Date: Wed, 18 Dec 2024 15:54:27 +0530
Message-ID: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
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
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ha7tBqbURgLYs81ps2-sXbNGuYOxLAn6
X-Proofpoint-ORIG-GUID: ha7tBqbURgLYs81ps2-sXbNGuYOxLAn6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180083

This patch series adds the listed bug fixes that have been missing
in upstream fastRPC driver:
- Page address for registered buffer(with fd) is not calculated
  properly.
- Page size calculation for non-registered buffer(copy buffer) is
  incorrect.

Ekansh Gupta (2):
  misc: fastrpc: Fix registered buffer page address
  misc: fastrpc: Fix copy buffer page size

 drivers/misc/fastrpc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.34.1


