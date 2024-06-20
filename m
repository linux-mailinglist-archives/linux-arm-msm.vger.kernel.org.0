Return-Path: <linux-arm-msm+bounces-23349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE8C91039E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 14:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D38E282507
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 12:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D7C1AAE02;
	Thu, 20 Jun 2024 12:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kOuYqOeH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A35F1A3BD3;
	Thu, 20 Jun 2024 12:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718884932; cv=none; b=sdkFKVVVEFMMVgMGzGz2kZ1TAlT6rNJHHLxAHXLO4uOpfOph/1PY0NBS9CyZCkfm5YVJXOs2epTKdZkA5+bVhOHSdHbXbT7iDsL98Hp25TmP/5LnbVFHBKKk6VBb4cv2ufvtQgRXhiKGZtKuuogEKBqeazP/6Ha2sDm0k3gUckE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718884932; c=relaxed/simple;
	bh=j0fwJmIMo/7DDL1dghJhDBjKre5s1jvgyAK89WfqLks=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EVSSmssSTWTN09UWKfOtqCTk3fPt6pLSVEN8ksQ8s0CdqpmznS8uL6MRwIcCcrY8vONIUu30MZR0zs3xM9kBr32+GuduG3o5ZzaRs17+9iWQGrTFO4gJ2p88ZJzcDdXPeclJWi6v3RdvVmRBsSrnmyItkUc9mw5oe7Gm6V+GEfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kOuYqOeH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45K9v8OD028929;
	Thu, 20 Jun 2024 12:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=S6SbWQnDXzierw9JezTEo6
	5XAaKoSjriw6hw2YMx2c0=; b=kOuYqOeHAkFwwS7lLwXrLxAcJVrGrcmkXJ0XsA
	sCP4o6LI33TpMKHgd/yL18y4OWKQr/XqbK7XPqbsl1HB7niPjJetTQj8UrLurmFl
	fp0Ku05me3EXfTfL9qBHoyt4lJtrOUSCaOUL7UhOjX64dObP6IWJ50Yqs1pKLmfA
	0EgCGUJY6yYUGJgL9t3wJERZQPV065dhgbSzXzfgaAnEjR24ZxkkInmFqQ7aK/HG
	hmwdyro7tEav/xHNIQG3JHcaFeIYqAL70J3yzKh637xiiAe7czI9hztlGOOfh1hQ
	xQJXXJopiysaPJN8vprZ/RDU/a7YkyCH0k9mL5NBDoYdxuZA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yv7jehkr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 12:02:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45KC26Tg018684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 12:02:06 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Jun 2024 05:02:02 -0700
From: Komal Bajaj <quic_kbajaj@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>,
        Komal Bajaj <quic_kbajaj@quicinc.com>
Subject: [PATCH v3 0/4]remoteproc: qcom_q6v5_pas: Add support for QDU1000/QRU1000 mpss
Date: Thu, 20 Jun 2024 17:31:39 +0530
Message-ID: <20240620120143.12375-1-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.42.0
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
X-Proofpoint-GUID: -V1IOhmc3Aqwv0f0Oc5wRbHiT5JQpAmb
X-Proofpoint-ORIG-GUID: -V1IOhmc3Aqwv0f0Oc5wRbHiT5JQpAmb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_07,2024-06-20_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 clxscore=1011 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406200086

This patchset adds support for the mpss found in the QDU1000 and QRU1000
SoCs.

The mpss boot process now supports late attach for an already running
mpss. For this, it uses an RMB register space to perform a handshake
with the mpss for the late attach process. This is implemented in the
patches below. The patches also address issues with split binary
detection to support loading of split binaries more robustly.

Changes from v2:
* Collected Acked-by tag
* Listed the items in reg property in qdu1000-mpss-pas bindings
* Marked memory-region as required property
* Moved rmb register logic to pas driver
* Moved the logic to signal Q6 to continute booting into a helper
  function
* Link to v2: https://lore.kernel.org/linux-arm-msm/20230306231202.12223-1-quic_molvera@quicinc.com/

Changes from v1:
* Dropped changes to aoss-qmp
* Renamed mpss pas bindings
* Updated commit msg on mdt loader to be more descriptive
* Fixed syntax errors in bindings
* Updated firmware name in bindings

Komal Bajaj (1):
  remoteproc: qcom_q6v5_pas: Add QDU1000/QRU1000 mpss compatible

Melody Olvera (3):
  dt-bindings: remoteproc: mpss: Document QDU1000/QRU1000 mpss devices
  remoteproc: qcom: q6v5: Add support for q6 rmb registers
  remoteproc: qcom_q6v5_pas: Add support to attach a DSP

 .../remoteproc/qcom,qdu1000-mpss-pas.yaml     | 129 ++++++++++++++++++
 drivers/remoteproc/qcom_q6v5.h                |   8 ++
 drivers/remoteproc/qcom_q6v5_pas.c            | 107 +++++++++++++++
 3 files changed, 244 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,qdu1000-mpss-pas.yaml

--
2.42.0


