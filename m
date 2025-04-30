Return-Path: <linux-arm-msm+bounces-56231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1A3AA4909
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 12:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7CFA3B090A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 10:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02893258CC3;
	Wed, 30 Apr 2025 10:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hoON4Tzo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558612586ED;
	Wed, 30 Apr 2025 10:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009562; cv=none; b=GbeRIfqWIEYUPlfDO0bRSslw9yBmkchH5QFFgnw+75h4y2V9ygw34KCPdsHnNy0Y/gzS68IAiJNiJnHW6SW9mIEnpo4X9HkDV1Vbj3MPMeTU5SQModJMDgPgxJbdIARKeXLBDLFW7fsh9hK/iZxPaKlMJFcV5sXdZhHeutbMO1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009562; c=relaxed/simple;
	bh=JpwAbGjZtbb+l4ecnmSMMwr6Db4T2xdth/9sXUdsRSc=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=j2LGhLmJ1m07oFhQ4YGDgDaMgFAyisVqOThhnoCmIGjJ/6zkwTz2D9W2P05dW/z865+6szbA9QhdwHlLQOy7KCAyg3o5d3c9NCbi7/pXwcstx/NYVBWQNvitKrnurrOiw6UNLLd4aOx3FYY2Dz6bzCT8+5Co8T+XyVRICUrPDk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hoON4Tzo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U965NS018336;
	Wed, 30 Apr 2025 10:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yp9Qtfa93eGuofnsQVa575
	GjxxUD5joCddAe8PxoAjY=; b=hoON4Tzo+J+mI4Usf0clo/cD0bsQKjIlsyANtI
	3hsUYe8vjkUTkt7/n3zEZKzaDmvGuD3hldC24DMqgW1gCBuVwqi0pqatqmIQ/Qe3
	nvcAO8tjzJ06Aj/LfqMW9I6nRc4ULpEAFGjj5cf3BcS/j5y0lBbD1imCF26y6Odv
	XV+O3J2obNhTuY1wDCnSFxtDWhadS3mYG8uuDbNk5yjRhiABICpFlP80l5tCtIO5
	CmE7X8JEB57+BVrBtgQkemC45D6B3FBi/gDiM56cnKmh2a/4adgjjgONViFkaWdA
	xo9dWGwlx6mQHLEUWvhIX2G4/kgP9L9VVja6z8hodKFjdtgg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ua9s1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 10:39:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UAdGmV000907
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 10:39:16 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Apr 2025 03:39:11 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [PATCH v2 0/4] clk: qcom: Add camera clock controller support for
 sc8180x
Date: Wed, 30 Apr 2025 16:08:54 +0530
Message-ID: <20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL79EWgC/4WNQQ6CMBBFr0Jm7Zi2IIIr72FYNEORWdCWFhoM4
 e5WLuDy/Z///g7RBDYRHsUOwSSO7GwGdSmARm3fBrnPDEqom6iUwkiNbMSGpCcijKv3LizY6ib
 3917psoW89cEMvJ3eV5d55Li48Dlvkvyl/4xJosC6lbWselkOon7OKxNbupKboDuO4wtuqmz7v
 AAAAA==
X-Change-ID: 20250422-sc8180x-camcc-support-9a82507d2a39
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <stable@vger.kernel.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=6811fdd5 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=5xtFWlRChmHei2TmgT4A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3NCBTYWx0ZWRfXy5tvN61l4hgX VeOIEnr0JNFUGuSuGULsDnjKk2djTC8rxqge4ssqE0cQ5G3WEGTkOFaIIVYUMiTrNhxFK+Pn98s bGOo27Q2MGpA4ZB6qXvSq3CwNCUIdgsYEL/PW1dtVnsYdRPqtKodQVaxayyml2s2NmM4V1eys25
 08Z7e/SWKrhGl1sl30MgIGyGG0dtiBLYTLPzPMaurOF+zcwF0VnHsrskpE9xq5Sp7AP0yTv5PnC F1ifnXvk1PS6wGr9BovAUQWD3gUFhMwlegSxSgUiZiawcNCEmAx+n6MhBRz4eJkFDw5D5KsIpOT CpW54k+Jpxplrx7+YxN88hCcoZQHGeRDw4AOdFa0q5frko+SeY9aYGEpQyqvAR1i1iEKYUsLlHF
 /foUz+d0rCKPlX0QBcnYiZz3tq36mY2IiwakDLa2V92TzhS9+lIYiih1r7dP19t5kfA0cT+y
X-Proofpoint-GUID: 3LE-oqCkn2vNsTTKSllDZcLQMSDDKFK4
X-Proofpoint-ORIG-GUID: 3LE-oqCkn2vNsTTKSllDZcLQMSDDKFK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=978 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300074

This series adds support for camera clock controller base driver,
bindings and DT support on sc8180x platform.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
Changes in v2:
- New patch [1/4] to add all the missing gcc bindings along with
  the required GCC_CAMERA_AHB_CLOCK
- As per Konrad's comments, add the camera AHB clock dependency in the
  DT and yaml bindings.
- As per Vladimir's comments, update the Kconfig to add the SC8180X config
  in correct alphanumerical order.
- Link to v1: https://lore.kernel.org/r/20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com

---
Satya Priya Kakitapalli (4):
      dt-bindings: clock: qcom: Add missing bindings on gcc-sc8180x
      dt-bindings: clock: Add Qualcomm SC8180X Camera clock controller
      clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver
      arm64: dts: qcom: Add camera clock controller for sc8180x

 .../bindings/clock/qcom,sc8180x-camcc.yaml         |   67 +
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |   14 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-sc8180x.c                   | 2897 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc8180x.h       |   12 +
 include/dt-bindings/clock/qcom,sc8180x-camcc.h     |  181 ++
 7 files changed, 3182 insertions(+)
---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250422-sc8180x-camcc-support-9a82507d2a39

Best regards,
-- 
Satya Priya Kakitapalli <quic_skakitap@quicinc.com>


