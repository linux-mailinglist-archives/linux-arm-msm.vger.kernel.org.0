Return-Path: <linux-arm-msm+bounces-46950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8C1A29020
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 15:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8521E3A5F9D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 14:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84ADF14B959;
	Wed,  5 Feb 2025 14:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jdnwUfo/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EB2151988;
	Wed,  5 Feb 2025 14:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738765905; cv=none; b=Hh2G93CRmATohpMKeDO+hrgnDXxVKyiWfov8quaEX1DDg3NrnwTbyJUoK5qKvQis9SShQrfN9g94zETBvyCt3qS/I0m8hisx4am0L7/ZhoGj4y0f05vlJx6TI40U5hNgIrd6pdu298l3nQb8S+1kETsnfFLeFbJS/zscABAIL/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738765905; c=relaxed/simple;
	bh=DK5BdsHC9FTcHgrgOYmsyFWrjMwYPINHQIFTi/aJ4F8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MIsfY6iiq/Bcq/fsDhq3A24VWvo9Q7HXNi3lqftG8BPFHmq0f4ri9VIk52ZlrQu6YZrbih4PS4vy4UqV5c+drALMJMorqBZmm6Gra+Vmg8Bzr1FchPM7uXd4P2pNj+FZo7cwFxTyb1EqqM6tC/tw6uRmbJMRQs4cdKFKMzSUhLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jdnwUfo/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515EVYCK025691;
	Wed, 5 Feb 2025 14:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oByTq9zwLSfVLM6kf11yP1nxs2lm8nXB/3U
	SzIcPI9M=; b=jdnwUfo/y39CeWgg53YdX1ek9MoXOQCHmkqaZIHDR748/NsIkeF
	8nnRTx/6EX3xTulz4LayczfVczv7y7nNas28t3H2B7PKOKQyQ1X/TzKu0289T96V
	6W9iAcPev1cWFbgt3CMDZt/FHO4dWigv4qnGP52BfEnFUBzbFE0Dm+X1j+90opi5
	xqyvXZGqx4SK0+bHZ3JPukBP8Mo4nXmFRN0XQ/wzcP2vAdAkTCJUupA9Y0Pge0qC
	TJgoMRmTs/klHGb1ulC5B97r55fXf0N8ySql5qK+/nLzQMbpvczs9ukhqL01FSgf
	ayBNSKcHloAhz/JRqfEWLEZ/w8aoGqngCFA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44m9txg00c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 14:31:33 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 515EVUTw026460;
	Wed, 5 Feb 2025 14:31:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 44hcpm8b2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 14:31:30 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 515EVUP9026455;
	Wed, 5 Feb 2025 14:31:30 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 515EVT89026454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 14:31:30 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 575AE2439F; Wed,  5 Feb 2025 20:01:29 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v1 0/3] Add Qualcomm i3c master controller driver support
Date: Wed,  5 Feb 2025 20:01:06 +0530
Message-Id: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
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
X-Proofpoint-ORIG-GUID: 50gHAaifOHbal4BnlRd8gV41hFTtbJBh
X-Proofpoint-GUID: 50gHAaifOHbal4BnlRd8gV41hFTtbJBh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 mlxlogscore=849 clxscore=1015
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502050114

This patchset adds i3c master support for the qualcomm's QUPV3 based 
Serial engine (SE) controller. 

The I3C SE(Serial Engine) controller implements I3C master functionality
as defined in the MIPI Specifications for I3C, Version 1.0. 

This patchset was tested on Kailua SM8550 MTP device and data transfer
has been tested in I3C SDR mode with i2c and i3c target devices.

Features tested and supported :
  Standard CCC commands.
  I3C SDR mode private transfers in PIO mode.
  I2C transfers in PIO mode.

Mukesh Kumar Savaliya (3):
  dt-bindings: i3c: Add Qualcomm I3C master controller bindings
  i3c: master: Add Qualcomm I3C master controller driver
  MAINTAINERS: Add maintainer for Qualcomm's I3C driver

 .../bindings/i3c/qcom,i3c-master.yaml         |   57 +
 MAINTAINERS                                   |    8 +
 drivers/i3c/master/Kconfig                    |   12 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/qcom-i3c-master.c          | 1190 +++++++++++++++++
 5 files changed, 1268 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
 create mode 100644 drivers/i3c/master/qcom-i3c-master.c

-- 
2.25.1


