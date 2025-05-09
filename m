Return-Path: <linux-arm-msm+bounces-57346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41304AB0A1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 07:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3FB17B4990
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 05:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F1C269832;
	Fri,  9 May 2025 05:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n1QvwF1K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5686D22D9EF;
	Fri,  9 May 2025 05:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746770255; cv=none; b=Y1h/Gpowx5T2ErzIeMFaAOYjTMpwcWd8mnrRAKNReD0taXW4KGY+ImvG1oR7jioYzMus1kusn/veIUYGHkLOBXN0/n9uUpVl4vL7kIn0uyp3onPH+rCYmpVHD9hnlgkCGi9UVfrvOt8TKsrugmS1QoNWbBECeF4yM/WDtX2bhFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746770255; c=relaxed/simple;
	bh=VbeeMITY7uwElAuo02LWfKhQw5qHzgaBs/IxmqV/O24=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=CLoyK8IEo1HB5IvObtLFW6wRGHbMfY7hKrYpEcTz89ff7TFnpY0R4fbhhrows1C5mja8rPNmZwJ8ZBO7MfYGHwj4URNGXNY5Jr1qTXb8KcPHgrxj2I4Q4rBXQo7sjyYDtIeefuOQEHIpjeIngLEV1VHL1w7XFLym40EYSch4wNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n1QvwF1K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548KAh4U013634;
	Fri, 9 May 2025 05:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HsG3OxjZ+G1ri3CZO5LLbu
	NF82bXyymJSOT2yBQtCjI=; b=n1QvwF1KJKOyne0+6DXCQhB5kX8ERNi/Ukk3zn
	Gk4177FnSHauOzWMLW0wc960sIovh4pi5N7TlZ/mJNnACWBDqm6OSgt9JugWLdWC
	H8FFRILzvPYcGLnmjBu7rFyB8kMLZmONO9PfRp49GG4y3uCpxtj975Jf6oSTJe1h
	YWl0U5lUvsqKEpEphkUKg9HvmXdJL5J+b6XwN7/fA6+y7n3tpyQ1ON1rKBmS1Fs8
	F1YIF/tzSPxWU23Y1S8/HCjyLcMRBJDj+XZHpb6rEiZRopmv+JbT4lvy3JOyJ8P1
	Xi4fkKZR5LKIKtZ5l6BSIqF+Wq/bl8IQplsWqq7rlU3XVRvw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gt52tr9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 05:57:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5495vTYg014239
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 05:57:29 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 8 May 2025 22:57:23 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [PATCH v3 0/4] clk: qcom: Add camera clock controller support for
 sc8180x
Date: Fri, 9 May 2025 11:26:46 +0530
Message-ID: <20250509-sc8180x-camcc-support-v3-0-409ca8bfd6b8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB6ZHWgC/4XNvQ6CMBDA8Vchna3pFwWcfA/jUI4iN0CxhQZDe
 HcLkw7G8X+X+91KgvVoA7lkK/E2YkA3pJCnjEBnhoel2KQmgomcKSFogJKXbKFgegAa5nF0fqK
 VKdO+aISRFUm3o7ctLod7u6fuMEzOv443ke/Tf2LklFFdcc1Vw2XL9PU5I+AAZ3A92c0oPhzJf
 jlid+q6zrlqlS7g29m27Q1PE92OBAEAAA==
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
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA1NSBTYWx0ZWRfX34nVZBEcMRNn
 iuHpcg3/2BbXocD5qyQz8n7iCRXNZK2ArkqibPSrWX7RdrWcA/KjL9Nd08GOdixCFj8MBCZgSNk
 k1IB+lXImMA+gPX4YIRRJS2kRLFzqQImt8A3DunvqEU99YBjxyLUbaJbI2z2JHtAp+1BVlL3WCt
 JvlUPB7sXvCgV8jmQobUsdXLz7vqdVlqkX/0w+AUIIa9XT05/5ZLv85QZpQNVQ9EEuPc6Npg6EZ
 UEipq4E57humXExBL4umXaY/i7YPP0eVfxQfewK4/ClK0y0slbIsFUcrcK95kcEtlbopFie/bQL
 E6OyKe2RVMKdIiOUpgh1frUCnyhfISvc7Qd1WTVHwKxSlhxH7AvfhIb6nutB0Ed2FeTKwyXEahO
 aAbpS8I80VzNkHtwnJfh57QAoGFkPJ3sfqXVvhqzI6kJ4s45nc1kZ3ap5KmS18dfxpp+fAjq
X-Authority-Analysis: v=2.4 cv=LKFmQIW9 c=1 sm=1 tr=0 ts=681d994a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=lu7Rr3KQo9iiGg5JtfsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1yO4pUnJ5Bkn-1reZrjzMTgVOqJz4T2n
X-Proofpoint-GUID: 1yO4pUnJ5Bkn-1reZrjzMTgVOqJz4T2n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_02,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=906 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090055

This series adds support for camera clock controller base driver,
bindings and DT support on sc8180x platform.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
Changes in v3:
- Drop Fixes tag in patch [1/4]. Dropped unused gpu_iref and
  aggre_ufs_card_2 clk bindings.
- Move the allOf block below required block in bindings patch.
- Remove the unused cam_cc_parent_data_7 and cam_cc_parent_map_7
  in the driver patch. Reported by kernel test bot.
- Link to v2: https://lore.kernel.org/r/20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com

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
 drivers/clk/qcom/camcc-sc8180x.c                   | 2889 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc8180x.h       |   10 +
 include/dt-bindings/clock/qcom,sc8180x-camcc.h     |  181 ++
 7 files changed, 3172 insertions(+)
---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250422-sc8180x-camcc-support-9a82507d2a39

Best regards,
-- 
Satya Priya Kakitapalli <quic_skakitap@quicinc.com>


