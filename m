Return-Path: <linux-arm-msm+bounces-29034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BCC957CF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 07:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFE061F2250D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 05:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E6814B949;
	Tue, 20 Aug 2024 05:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CrsYYq2L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E6E14A4C0;
	Tue, 20 Aug 2024 05:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724133403; cv=none; b=al9MBgCtQgdx/MVXb/DfnV2q9GWl7hBdoDZ6mrT4vSiDXbFGPAuiEEE2XBEdZ6e3sptO9dMB3ipjmMpnrJ50Z2noHnwoDUHKLKmIbGz7GT8sS202y/90UbXCjA/L8Jn7UH8gtv505qVsTgVsduOqevrcBg+11YAmWRRVDX+b+P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724133403; c=relaxed/simple;
	bh=PedmcyPO4TDAqv/aoNlS3MNa8W35t86JsCLgtVunZ0Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cIowaXASRN8gNZlDuRyBTTt06k7DFLD4JgEXoWYmSoEzzGKWdZtGKHJqqMSk759kJ/P8VhsVLLm+9hNv7y42HYXD3QiYZyAb4KcmJh5XFzGXjdWStu5ssQp8T5uU+ut9C6EcxvNnZnTAPdlG9Lbcv+CF0poUpMNEfmnDQcM4gaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CrsYYq2L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JNZmGC004777;
	Tue, 20 Aug 2024 05:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fZfHA8dFqe+FYI8dD68ah1
	xDZ4ifCeXKkGuxRLpCyO8=; b=CrsYYq2LJ7BzyXYPLkcbW4MD3+GnsyzG0fWeU2
	W78msjRKDl0gg6Gmxf3jxCjESQLgevKsWkwO7aDx/lSm3HMUR28GHAqAZITTZ2vB
	FtVt2jMpQPhPhKOQIhJczjPuO2urjsTcHJpZ59yU8a65qiwJR4rmmhvcs7SVJ9ro
	76vTLFCxhseesy43rMP6CiKXYM7uIlh8kyrZIrNt7ffiJJ/+ozFNsl848piLzd0+
	F/WNnXlRPvzlDx2UsqI1I7/AAzfinQ6VMSUKEotqitBdo3iziP66N2I/v5oXXupN
	gRAeAkzxNURqZz2EC8ZQcTvEWw9qXjAgtCuwEji0XuWNRTrA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412kxupkd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 05:56:37 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47K5uaqo008067
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 05:56:36 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 22:56:33 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <andersson@kernel.org>, <sboyd@kernel.org>, <konradybcio@kernel.org>,
        <krzk+dt@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH V7 0/5] remove unnecessary q6 clocks
Date: Tue, 20 Aug 2024 11:26:13 +0530
Message-ID: <20240820055618.267554-1-quic_gokulsri@quicinc.com>
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
X-Proofpoint-GUID: _rghVUhDXF86NiLeA5B6KTFeuy1XLDzl
X-Proofpoint-ORIG-GUID: _rghVUhDXF86NiLeA5B6KTFeuy1XLDzl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=649 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200044

This series is a revision from V6 of MultiPD series [1] minus the
multiPD driver related patches. REnamed this series to keep the title
relevant. Will post a new series for remoteproc secure PIL driver as a
dependant series which will rely on these clock removal.

- Since the new rproc driver will use the secure APIs (scm) to bringup/down
  the rproc and secure OS (TZ) takecare of handling the clks, those clks
  needs to be removed from the kernel. since thes patches were already
  posted as a part of the MultiPD support [1] and some of them were
  reviewed. So picked up those patches and review tags as well.

[1] https://patchwork.kernel.org/project/linux-arm-msm/cover/20231110091939.3025413-1-quic_mmanikan@quicinc.com/

Manikanta Mylavarapu (5):
  clk: qcom: ipq5332: remove q6 bring up clocks
  clk: qcom: ipq9574: remove q6 bring up clocks
  dt-bindings: clock: qcom: gcc-ipq5332: remove q6 bring up clock macros
  dt-bindings: clock: qcom: gcc-ipq9574: remove q6 bring up clock macros
  firmware: qcom_scm: ipq5332: add support to pass metadata size

 drivers/clk/qcom/gcc-ipq5332.c               | 380 -------------------
 drivers/clk/qcom/gcc-ipq9574.c               | 326 ----------------
 drivers/firmware/qcom/qcom_scm.c             |   8 +
 drivers/firmware/qcom/qcom_scm.h             |   1 +
 include/dt-bindings/clock/qcom,ipq5332-gcc.h |  20 -
 include/dt-bindings/clock/qcom,ipq9574-gcc.h |  18 -
 6 files changed, 9 insertions(+), 744 deletions(-)

-- 
2.34.1


