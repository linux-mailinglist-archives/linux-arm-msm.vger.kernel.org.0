Return-Path: <linux-arm-msm+bounces-37122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 353C49BE316
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 10:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE421283C5C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 09:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390BA1DB360;
	Wed,  6 Nov 2024 09:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BAYFCp/T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E181D2B1A;
	Wed,  6 Nov 2024 09:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730886747; cv=none; b=ALfg2gpY5gxmOhTHqyuYJpeoZFDv9/E0gfw/VsTms0fS8rXi9YY/X8KqW8p1P56LtPIRDi9aqJwvBmruL0VsUcMdQx+4vMNvpzeCZrN1A+uslLlbNbc+RoR/SylER/A/Lhhj0VXKKzvbxmAWIl8sG1CA0rzNXKGeA1qPx7XvKX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730886747; c=relaxed/simple;
	bh=+MIADX+l9wd57eQ7XD/ylL2pcdWx09/ZtIVvIuxjwnk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=j4VxdNtLlqp1L52HovgoaRrK/6dfnwlE8yzQhDhDPLEGxekWjdqSCctHjqQIqzgLjK84Qp7uyMgJl5+hAqyKY3UIVSQGCvzXUBSWL6hLY3FQSZkX0niRU0p7b9FBCuUmI0xpeOPjJqs/pyxpkgp4kZoeeDJQLBxoT4zzjHqAAZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BAYFCp/T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6636v1024687;
	Wed, 6 Nov 2024 09:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sIel+c1cv1eXOwYSg1T0s1
	XCsCMRcMn8aqVevNj5Rdc=; b=BAYFCp/TH6T+yk7Q1uRVrF1RXT4bN3gnp4Lp7F
	9KtNDKoFHxBE5W6K1syGNQna2Y38EtcB5i1xAqw/YdQ9g/drJRH1byF5fp2yBwdz
	zxBAkLlXzn+Z0/JwlDqMmdZHXAmnG4ddGS5Aexbh3KovSQ5fR+dIwG1Ogn40Vmm1
	1MbF7z8ilzbOjGQhNSpNOsWJiiHMVDvPPdnWf5vakJmt7Pk8/2JweVtR6Z6ptrzW
	69K4UZdf23ClfW/BraMXIu8GjKxT0NW2a91oUpOxY9WegHqYrjdZUS5YoE0BOZQh
	014wnlMRTYbeB2VPUx5Q5gKwtbcrBqA9xKqYCXlEtfGDodpg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42r2ugrm0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 09:52:20 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A69qJIx001476
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 09:52:19 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 6 Nov 2024 01:52:14 -0800
From: Imran Shaik <quic_imrashai@quicinc.com>
Subject: [PATCH v3 0/6] Add support for GPUCC, CAMCC and VIDEOCC on
 Qualcomm QCS8300 platform
Date: Wed, 6 Nov 2024 15:21:55 +0530
Message-ID: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADs8K2cC/23NzQ6CMBAE4FchPVuzLRSKJ9/DeCDbRXrgr8VGQ
 3h3C8aoCceZZL6ZmSdnybNTMjNHwXrbdzGkh4RhU3U34tbEzCTITIDI+YhepwC8bflQTdiQ5zW
 CII2FIpOxOBwc1faxoZfrOzsa79GevmVj/dS753YcxNp+PvTeRxAcuFYllIqgKHI8RxBth0fsW
 7aCQf4gMttFZETitgQFORio/pFlWV5L0rbSEAEAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZfPISoQPQFuq4d19HjSDVTNtqKMycOla
X-Proofpoint-GUID: ZfPISoQPQFuq4d19HjSDVTNtqKMycOla
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 clxscore=1011 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=884
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060080

This patch series add support for GPUCC, CAMCC and VIDEOCC on Qualcomm
QCS8300 platform.

Please note that this series is dependent on [1] and [2], which adds support
for QCS8300 GCC and SA8775P multi media clock controllers respectively.

[1] https://lore.kernel.org/all/20240822-qcs8300-gcc-v2-0-b310dfa70ad8@quicinc.com/
[2] https://lore.kernel.org/all/20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com/

Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
Changes in v3:
- Added new GPUCC and CAMCC binding headers for QCS8300 as per the review comments
- Updated the new bindings header files for GPUCC and CAMCC drivers. 
- Added the R-By tags received in v2.
- Link to v2: https://lore.kernel.org/r/20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com

Changes in v2:
- Updated commit text details in bindings patches as per the review comments.
- Sorted the compatible order and updated comment in VideoCC driver patch as per the review comments.
- Added the R-By tags received in V1.
- Link to v1: https://lore.kernel.org/r/20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com

---
Imran Shaik (6):
      dt-bindings: clock: qcom: Add GPU clocks for QCS8300
      clk: qcom: Add support for GPU Clock Controller on QCS8300
      dt-bindings: clock: qcom: Add CAMCC clocks for QCS8300
      clk: qcom: Add support for Camera Clock Controller on QCS8300
      dt-bindings: clock: qcom: Add QCS8300 video clock controller
      clk: qcom: Add support for Video Clock Controller on QCS8300

 .../devicetree/bindings/clock/qcom,gpucc.yaml      |   3 +
 .../bindings/clock/qcom,sa8775p-camcc.yaml         |   6 +-
 .../bindings/clock/qcom,sa8775p-videocc.yaml       |   1 +
 drivers/clk/qcom/camcc-sa8775p.c                   | 101 ++++++++++++++++++++-
 drivers/clk/qcom/gpucc-sa8775p.c                   |  49 +++++++++-
 drivers/clk/qcom/videocc-sa8775p.c                 |   8 ++
 include/dt-bindings/clock/qcom,qcs8300-camcc.h     |  16 ++++
 include/dt-bindings/clock/qcom,qcs8300-gpucc.h     |  17 ++++
 8 files changed, 194 insertions(+), 7 deletions(-)
---
base-commit: 891a4dc5705df4de9a258accef31786b46700394
change-id: 20241016-qcs8300-mm-patches-fc01e8c75ed4

Best regards,
-- 
Imran Shaik <quic_imrashai@quicinc.com>


