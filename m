Return-Path: <linux-arm-msm+bounces-34943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B1B9A3CEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 13:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1640A281DB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 11:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B6D20100B;
	Fri, 18 Oct 2024 11:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MbKTcykl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45D320E30A;
	Fri, 18 Oct 2024 11:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729249978; cv=none; b=EbtaAakSi4uzvRDpI7ibk4BZLVzSXBRLCF9la4WQY8kEVEyxQSb8gd5+zh/C6w2NP6BUJfGaOIopp3FQQwMTsf8CuiCqcAmGrVb5Auv7MDZqjaAn7PLZVrYP+LNOix7Fog3UAMIOczvNMzotVV9pO+An8TmQaFYNq0xfCoK/TKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729249978; c=relaxed/simple;
	bh=P8qnk6i+wSgU7WFURGdC2VoGWEoLo6sghL+/SK0nS3s=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=PzwJbKFXEfIYdD6uyQ9G5syaqQBX3/hknbTt/yvTJhouLIfWIN46a7in6TaapKqJsoU+M5PzH3vOVfg0vBP03TyKTin8Mnxa62ljx7UrdUIaq714Va6a/1GW0//x+5Sd6Gcyd4nQdzM4Q9zwtg48hbqAuO0gvrt+MRq45xxMC/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MbKTcykl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I9FHYe028782;
	Fri, 18 Oct 2024 11:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rDlcCC65nIKEHOPIknhAra
	HvMRY6CX43Td2FzgJ2SSI=; b=MbKTcykl4zoQDtgeYDAfnHW9Ia5Sq7I9Y+s3YA
	tyUhe0e7FkyXSc3SJD9Xet9CCKTHyFZdY4scp/Ct6oFs/hiyh5yBMBvNUMbv4TJr
	f4ugFJ2XwheLDW0j5wJXDIjwMljsMMKbYRT7RR94SYLgo7cSRtXOQEN8DZ2m9sd6
	9AAGOK5YQFTHaWx7OxC5tSYPK42hTxCO8EQ20WclLHXAaG2PoyiziMZ6lUTdPT9u
	fzd5DQpHyTDLofkAuLMSLTnY+oJl66uXGjVW2nLAaCUz3mi+1vxa0RyCJHQmRzPb
	CSVMXFqhd9ovsUr2QqJio1YiHQumoWPr5TGItW+tRh9BEuJQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ay8jc3ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 11:12:53 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IBCpCX014111
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 11:12:51 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 18 Oct 2024 04:12:47 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Subject: [PATCH 0/6] Add support for GPUCC, CAMCC and VIDEOCC on Qualcomm
 QCS8300 platform
Date: Fri, 18 Oct 2024 16:42:28 +0530
Message-ID: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJxCEmcC/y3MQQqDUAyE4atI1g3kWWulVykuJI6ahVZfVAri3
 ftou/wG5j/IEQ1Oj+ygiN3cXlNCuGSkQzP1YGuTKZe8CBJKXtSrqwiPI8/NqgOcO5WASu83tAW
 l4xzR2fsbfdY/Ryxbaq//8Tw/XV6fD3kAAAA=
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
        Imran Shaik <quic_imrashai@quicinc.com>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _CgLMgprT-P9KW2VFrMo4lnqYnxUoXso
X-Proofpoint-ORIG-GUID: _CgLMgprT-P9KW2VFrMo4lnqYnxUoXso
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1011
 mlxlogscore=594 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180071

This patch series add support for GPUCC, CAMCC and VIDEOCC on Qualcomm
QCS8300 platform.

Please note that this series is dependent on [1] and [2], which adds support
for QCS8300 GCC and SA8775P multi media clock controllers respectively.

[1] https://lore.kernel.org/all/20240822-qcs8300-gcc-v2-0-b310dfa70ad8@quicinc.com/
[2] https://lore.kernel.org/all/20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com/

Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
Imran Shaik (6):
      dt-bindings: clock: qcom: Add GPU clocks for QCS8300
      clk: qcom: Add support for GPU Clock Controller on QCS8300
      dt-bindings: clock: qcom: Add CAMCC clocks for QCS8300
      clk: qcom: Add support for Camera Clock Controller on QCS8300
      dt-bindings: clock: qcom: Add QCS8300 video clock controller
      clk: qcom: Add support for Video Clock Controller on QCS8300

 .../devicetree/bindings/clock/qcom,gpucc.yaml      |  1 +
 .../bindings/clock/qcom,sa8775p-camcc.yaml         |  1 +
 .../bindings/clock/qcom,sa8775p-videocc.yaml       |  1 +
 drivers/clk/qcom/camcc-sa8775p.c                   | 99 +++++++++++++++++++++-
 drivers/clk/qcom/gpucc-sa8775p.c                   | 47 ++++++++++
 drivers/clk/qcom/videocc-sa8775p.c                 |  4 +
 include/dt-bindings/clock/qcom,sa8775p-camcc.h     |  1 +
 include/dt-bindings/clock/qcom,sa8775p-gpucc.h     |  4 +-
 8 files changed, 153 insertions(+), 5 deletions(-)
---
base-commit: 891a4dc5705df4de9a258accef31786b46700394
change-id: 20241016-qcs8300-mm-patches-fc01e8c75ed4

Best regards,
-- 
Imran Shaik <quic_imrashai@quicinc.com>


