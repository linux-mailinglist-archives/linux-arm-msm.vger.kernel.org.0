Return-Path: <linux-arm-msm+bounces-28769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5423A95445F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 10:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1C641F27723
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 08:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A1812E1E9;
	Fri, 16 Aug 2024 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jnWlfPhn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDB943AD5;
	Fri, 16 Aug 2024 08:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723797165; cv=none; b=lbiargIBKkgmisN2v4yLbtD7yD9oKphrLabWNm66lVFNr9bQHJ4mlyHHIjugEyZiGjDcA/r0ebUQwDvBIXIw/VRKpyaXQJGYZqvuZxtwfko6we1PxujTguOzRjO1pzD1occMFmFQOBgDdnZis4MHoxwGOISDQHpVqm46Oi1KyQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723797165; c=relaxed/simple;
	bh=dn0kPdWXDA50GaTSPIW0c9Rso8lEypHSwBpq/lMPwqo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=YVdFOgwBaNeN4Oc3f0gUkHaTaDw/Y3Km2zxY8Q+01eQC+RUGhKZrBW0PP87KY3nnk4kiRbQghoGLJ6MbNIurvyhD+Hl21xJQLpBpCzCjS1/8emoiXGoMDbU/H2iEu4JLUZ8qUTxgpck+/24kmfHDQU/Z1TAjC+9K0Lg1zxkAZj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jnWlfPhn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47G7jv5k016994;
	Fri, 16 Aug 2024 08:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rjxRZ/+ITKgUYzcnPr8m6E
	jKxZsi7LjrQiKekFtZrBA=; b=jnWlfPhnyWkKtkyx8fIoRjt5HsVF6h9rOzLpC9
	tT1lyJbtLsPINB37be4e5hcqfx2Jn1w8Gr5SahIqfQJqGm23U2ozodmbjv6VasJO
	lwIgwzeB1M0AIsbTp1jtahFH/xRdABgtG1pJ75yiOkqTcmF4mIzbdWIEYtRXwLmd
	9xLS74evYQiO/+bNgwC3X7nDCNGEJZ0/lFYFSmCC+5hfk8DAe6UGpQTaUopXvlhR
	cAky3+OEvtwHbqtYFVDPvAYT84CUFau0tvvn1dI/nSgU/2XHu1XkuoQ66qf8RzCl
	9/fBWxiwk/C9r3QHgdUzCPfn698kJllctThOjCuVnH8o6a5w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410kywpsx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 08:32:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47G8Wdr6015177
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 08:32:39 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 16 Aug 2024 01:32:35 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v2 0/5] Update LPASS Audio clock driver for QCM6490 board
Date: Fri, 16 Aug 2024 14:02:09 +0530
Message-ID: <20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIkOv2YC/yWNwQqDMBBEf0X23IUkBIn9leIh2LFdaK3uqhTEf
 zfo8c3wZjYyqMDoXm2kWMXkNxTwt4q6dx5eYHkWpuBCdMnXPHXfOjaOP2M2Y4VhZjQ5JZd99H2
 gYo6KXv7n6oPWQO2VKaalHMxX0e77AX+Wbkx+AAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <quic_imrashai@quicinc.com>,
        <quic_jkona@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yh0d_C2DIzxEQANOrDa51Rjm8E4rAItF
X-Proofpoint-GUID: yh0d_C2DIzxEQANOrDa51Rjm8E4rAItF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1011
 mlxlogscore=999 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160061

This series updates the low pass audio clock controller driver for reset
functionality. The patches are split from the below series.
https://lore.kernel.org/all/20240318053555.20405-1-quic_tdas@quicinc.com/

The QCM6490 board requires only the reset functionality from the LPASS
subsystem. Thus separate out the driver probe to provide the same on the
QCM6490 boards.

[v2]:
Changes in [v2] compared to [v1]:
 - Updated the lpass_audio_cc_sc7280 probe to get the match_data for both SC7280 and QCM6490.
 - Separate regmap for resets [Konrad]
 - Split the lpassaudiocc compatible and GCC protected clocks list changes. [Dmitry]
 - Link to V1: https://lore.kernel.org/all/20240531102252.26061-1-quic_tdas@quicinc.com/T/

[v1]
  - Add a separate platform driver for QCM6490 resets.
  - Add device tree changes for protected clocks for GCC and LPASS AudioCC
    compatible update.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Taniya Das (5):
      dt-bindings: clock: qcom: Add compatible for QCM6490 boards
      clk: qcom: lpassaudiocc-sc7280: Add support for LPASS resets for QCM6490
      arm64: dts: qcom: qcm6490-idp: Update protected clocks list
      arm64: dts: qcom: qcm6490-idp: Update the LPASS audio node
      arm64: dts: qcom: qcs6490-rb3gen2: Update the LPASS audio node

 .../bindings/clock/qcom,sc7280-lpasscorecc.yaml    |  1 +
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           | 28 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  5 ++++
 drivers/clk/qcom/lpassaudiocc-sc7280.c             | 23 ++++++++++++++----
 4 files changed, 52 insertions(+), 5 deletions(-)
---
base-commit: 367b5c3d53e57d51a5878816804652963da90950
change-id: 20240816-qcm6490-lpass-reset-e9a880a141f2

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


