Return-Path: <linux-arm-msm+bounces-40829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D9D9E778B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 18:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFC6F16A345
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 17:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127381F63E1;
	Fri,  6 Dec 2024 17:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KHrvvaDa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA501F3D41;
	Fri,  6 Dec 2024 17:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733506677; cv=none; b=brdyxOMFURf4U2HAGOFOlhCkLmPpRaPdmoaLIOkXkiaFkgwfFSQqQ8oM4E55BEvRSAUFc53Z3neQWMdzxq/nWe0FWOws6T7+NHz/uGqCuJ2V5hQvVlDXin3EVeMQ/B1x3ns1aDEzKCz/MM/dgECjKyCIU8h7b8MQvcM3Jg1jOCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733506677; c=relaxed/simple;
	bh=63k2c92CeUESyvh4uVxl4JXinQXiel11zliX52SvBSU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=HUlCb5yrutGihIX2LmbKjC2fc+eji9nWjuseE0L2PLI26ORF/Y4iGGzMNzp9vW4Rx5SsgMe4rMLDoZc1lsogSm6Rmq/sNK1HXouOxsW51UfJyksMUt0r9N+VZ/znFClNiK03LF+D4fb2D4Whs6Q1izUGfFDFbFtr1xZXDMXweHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KHrvvaDa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6CofYh006288;
	Fri, 6 Dec 2024 17:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y5AbVL4afpD27MFzdefeNv
	RwsIAVug4GUb3v0fujMho=; b=KHrvvaDap9Wz7rAZ6Ncj4VJYC4RVYvJyRx86E6
	peE75T961qTmbNL1EYTcR2BxqeMh8isJLsivKdMd7Tkm6dKWgCftDzKXIkvLX2Yi
	MCkH4v2WMkrEvXvjEyH0iLyT64I/496j8jNX9lnN3vFL4oeXjqruynHCncgEt6u9
	lqPLAwxSHVG4MMSsxSIrxy7xpfblcNfkLQoApuGZK42B3FxsuZNcPNzBUPZ5hVbz
	5lzSuOejyKoBCoX8UZebHVZQ+lu7mkKo9PBe8yLNkpaqxfSrJ11kLgb9gaUjUYvH
	eOmCAlOupbbNIs8xsneY/4QZwDkYlXCMw9Gh4VbYyOUR5c6w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bsn6t683-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 17:37:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6HboLD019881
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 17:37:50 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Dec 2024 09:37:46 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 0/3] Add the support for SM8750 Video clock controller
Date: Fri, 6 Dec 2024 23:07:10 +0530
Message-ID: <20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEY2U2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIwNT3eJcC3NTg/iyzJTU/ORkXXPzNMPkRGMLY2MjcyWgpoKi1LTMCrC
 B0bG1tQBbCx6VYAAAAA==
X-Change-ID: 20241205-sm8750_videocc-77f1ca383327
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vr_2Ti-prg9AcphCmPSpGFgtOSzewRSt
X-Proofpoint-ORIG-GUID: vr_2Ti-prg9AcphCmPSpGFgtOSzewRSt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=767 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060132

Support the Video clock controller for SM8750 Qualcomm SoC. It includes
the extended logic for branch clocks with mem_ops which requires the
inverted logic.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Taniya Das (3):
      clk: qcom: branch: Extend invert logic for branch2 mem clocks
      dt-bindings: clock: qcom: Add SM8750 video clock controller
      clk: qcom: videocc-sm8750: Add video clock controller driver for SM8750

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   3 +
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-branch.c                      |  14 +-
 drivers/clk/qcom/clk-branch.h                      |   4 +
 drivers/clk/qcom/videocc-sm8750.c                  | 472 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8750-videocc.h    |  40 ++
 7 files changed, 542 insertions(+), 3 deletions(-)
---
base-commit: af2ea8ab7a546b430726183458da0a173d331272
change-id: 20241205-sm8750_videocc-77f1ca383327

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


