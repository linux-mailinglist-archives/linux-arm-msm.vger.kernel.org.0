Return-Path: <linux-arm-msm+bounces-29077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D829582BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 11:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F4F9B21C11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 09:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDD418C915;
	Tue, 20 Aug 2024 09:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WfHxBiJC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC40B18C34D;
	Tue, 20 Aug 2024 09:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146600; cv=none; b=ILgKsDHWBXhy4OhS2TkothMWeqK7yaYpRkZbgVLFD7ed39hMRSJlaUEQGfZ0NPRq4aOy/ejr/Tpv7lUGSbW+TVJdPfniUgILiPWxAxsbxmn8DficRuOOpnSl1OpVQSXAYq8Q5+MHVccy4MzjWHY0xSiweHKZvxJ1GFBZJ2vl2I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146600; c=relaxed/simple;
	bh=6AAVHfwe0wwspkdEUmTXOA/WDI+6Nq+UyY6c1P262+I=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=VToAwACnnDlfiIQtxLJhyIMgCciGuOmObMO7LX91jyUBzPtbV/hC9eap4cCC0KplIelG0xT9Hrvd40kWJL7SaoGzCMXs26UtFM2ZjP5zafhZXeVqsFNGSdyYnciY+SR3W5yHZU25R06oXGtD/XDxPIhe33zWLOCOF+h/42YczqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WfHxBiJC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K2BjUh011272;
	Tue, 20 Aug 2024 09:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=707cU4+Qw048yNCm0J3erP
	0jjvGpuWqc+P1g4tcosgM=; b=WfHxBiJCd3T7wszGO3RPsGEnhfJmPlzC/lRhaZ
	+LeZ9tQGclT1jPJc1kM3ipfq9oWdz9VvrFcQ3EOEpXj+7xUQKstBw5XRCnQR4Ba5
	3YQz/bCeE8BcCWDFfZ+isnuBwNaajLKfOb0TuOWVUC2NDZKgL2PgIbAFBObdijuT
	ArgFqypUOhvceXfGTA1qjXM0IRXYEYCl1XwoNP3Ls+H2UGnlhsW5YDDIIwx+O/ex
	kJ2BBf5jp4ZLkETP3E/jdOo+HgcxCWIErN6cyMXdB6izlhMgmK32djaYaJ3B0UJA
	mVeCpsjq2wpmGB1sS7mJ473Rt6dRQZDEiRqodggXYf4T13wA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414j5715ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 09:36:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47K9aWN4012819
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 09:36:32 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 Aug 2024 02:36:27 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Subject: [PATCH 0/2] clk: qcom: Add support for GCC on QCS8300
Date: Tue, 20 Aug 2024 15:06:19 +0530
Message-ID: <20240820-qcs8300-gcc-v1-0-d81720517a82@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJNjxGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCyMD3cLkYgtjAwPd9ORkXRNjYwMjYyMzyyRjMyWgjoKi1LTMCrBp0bG
 1tQA7FgoZXQAAAA==
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
	<quic_imrashai@quicinc.com>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OQT6EyEkadwfY8FFZwfKEXCiyfw3YmwO
X-Proofpoint-GUID: OQT6EyEkadwfY8FFZwfKEXCiyfw3YmwO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_09,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=830
 priorityscore=1501 clxscore=1011 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200071

This series adds the dt-bindings and driver support for GCC on QCS8300 platform.

Please note that this series is dependent on [1] which adds support
for QCS8275/QCS8300 SoC ID.

[1] https://lore.kernel.org/all/20240814072806.4107079-1-quic_jingyw@quicinc.com/

Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
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


