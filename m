Return-Path: <linux-arm-msm+bounces-29273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F71495B3BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 13:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C46A01C22E37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 11:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941531C93CF;
	Thu, 22 Aug 2024 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bu9iDcP4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EB81C93CD;
	Thu, 22 Aug 2024 11:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724326062; cv=none; b=hs6nKyZpZ7yzVqexYzxwxH0NWIbS8R6i5ZlwKyDAGnHObyVHpEQb0tBQZQ2KR0pBPPRr2226b0Zj2b2h9vRUuiERI3LrhP7p0KSVdE6bo5ol5xV/UWH6s2UI+UYmlPrl/dVv5T29GihduQZNHDwkYLgI1GLTeDVPfHVYCUIgVMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724326062; c=relaxed/simple;
	bh=YTQZD840jQL6WynsalQ6I85hUQYCV8bw2+SJCazhrTU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=gD1cgSE8hBkouYh53xfIOBIOPgDfWNieHol9z0W5ikW/a9noKXVg5YNXJXrVUULN6G8U4PVPSvzrIdpwDaniWZS6HQXEe0SFSkPbuLfD1kOtgE8JuruciGJipBFrW26/1P4woNP+Bw41pN0eQ2irV888YJyJco0g+vsBI/rvK9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bu9iDcP4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47M9jcwn027854;
	Thu, 22 Aug 2024 11:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3bKTSGxjKcVpBXNiDJqNTK
	9YW8F+5ML9zXx8QFGj2SU=; b=bu9iDcP49BPkoROUHale0GL7Kn7mECT5+KwUDU
	szFP5tjg77Ogpc2MggRGyDQj+rQNu+GTCk8RV8xo8N3IbLaHkTfRNZx7CqYvnyd2
	R2iMotwjbfOm8Lmep+c2COwF9LhQcLpnjylfNiM5p8MPq5gYIUhbv2b5CPK6MhsC
	3snnXXlH6EfKm4PyWcuHbLMg9u6p6iYOJXXYk79pLhPtmQC5To+dOv/sqCtZq1+l
	cWprY64zbzpHdzhlQXNxyt2W66NoWv7zqy4vycosdcsCo/gOHxuD3ErVmuXDQFAx
	Q27yk/nZp6Mpj8ujXyinGXdkBsY6lOEt9ytk5EcRslS7Utbg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414v5cem3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 11:27:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47MBRYOL010209
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 11:27:34 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 22 Aug 2024 04:27:29 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Subject: [PATCH v2 0/2] clk: qcom: Add support for GCC on QCS8300
Date: Thu, 22 Aug 2024 16:57:17 +0530
Message-ID: <20240822-qcs8300-gcc-v2-0-b310dfa70ad8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJUgx2YC/23MQQ6CMBCF4auQWVsznSJUV97DsMChwixspdVGQ
 7i7lbXL/yXvWyC5KC7BqVoguixJgi9Buwp46v3olAylgZBqtIRq5mQNohqZVW0MkqHmeDUNlMc
 jupu8N+3SlZ4kPUP8bHjWv/W/k7VCNVjdEh5021s6zy9h8bzncIduXdcv8VP8oagAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, Imran Shaik
	<quic_imrashai@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wIBscJtR56Be3xJyPg8V4iUACJZOCyzF
X-Proofpoint-ORIG-GUID: wIBscJtR56Be3xJyPg8V4iUACJZOCyzF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_03,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 clxscore=1011 malwarescore=0
 mlxlogscore=876 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408220085

This series adds the dt-bindings and driver support for GCC on QCS8300 platform.

Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
Changes in v2:
- Removed the QCS8300 SoC info series dependency in cover letter as per the review
comments from Krzysztof.
- Link to v1: https://lore.kernel.org/r/20240820-qcs8300-gcc-v1-0-d81720517a82@quicinc.com

---
Imran Shaik (2):
      dt-bindings: clock: qcom: Add GCC clocks for QCS8300
      clk: qcom: Add support for Global Clock Controller on QCS8300

 .../bindings/clock/qcom,qcs8300-gcc.yaml           |   66 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-qcs8300.c                     | 3640 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcs8300-gcc.h       |  234 ++
 5 files changed, 3951 insertions(+)
---
base-commit: bb1b0acdcd66e0d8eedee3570d249e076b89ab32
change-id: 20240820-qcs8300-gcc-433023269b36

Best regards,
-- 
Imran Shaik <quic_imrashai@quicinc.com>


