Return-Path: <linux-arm-msm+bounces-52175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB18A6BB27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 13:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E54E48191E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 12:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A04B227B9A;
	Fri, 21 Mar 2025 12:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DtNYX6dR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF8B225387;
	Fri, 21 Mar 2025 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742561411; cv=none; b=reBPa0oAJZyU1vW7GMHIEfmCUEeU11Q7xdBNz+5mL094M7diIArsLlZvXI56H1YtFEjOjqQgTBLOTWPIp5wCZr/a4ThR7FTHQweMC+ojV5dXMPyQX6zzdXI2L0swbblxhUsIN3/HYVdqc38iesi1M+jUubMms05zwvTxhYVBYEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742561411; c=relaxed/simple;
	bh=0ZVglako6mV/vVYiHs4jlcbA2K3ASzOGKl1R3WwjJlA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=J4LC35uBlsR7P68UWNtn34eiGpgSNPgYzJiskwO62Y/JycyMgu3PDYrDiYmqIqlHfvqD8PrMMAZJn9EEGfwuw9uv4Y71i1lqeBCNlc/58wi3pymC9KNUlgAPzTzTfVo6xnZFBKiNYAXr4sEH2PJ1JM/+Lz6cackvWs+ye5QPhco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DtNYX6dR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATBLk016515;
	Fri, 21 Mar 2025 12:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TitFcPuis8TVshv4HlpE1v
	FhGFNZpDl0U57A6S3xs/8=; b=DtNYX6dRA8IJpZHGB5m0QOahFkAsbwHEV+9MKB
	R/ORpVQuDdFVJvbwzhbslAdmmPdqtbtFgA7q51FB+gSmOEroJOJIp+9x9KxbqmUl
	1BA8o9RuOYu24rEzs4ve20gVvoKDRyU/5ZqMTE105HraEvIz1ajG6Ec9NhiRAekZ
	4xusY4el16E50a+OaFKkGvbtnHkmJlFncmzN7Itql9b6CG3IobVxvhCkB0Ktlvha
	FAvFg8mih5e6heyjm946AA82+MtaAjzl4eD3ntxLN/SgWUL3ijiusbwDNVJFduKw
	I2SDVyLOvydBKMnZ6WEUFg2V3/zbmD0PJMDz1zIA8hLZHDDQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gcd1cven-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 12:50:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52LCo495003196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 12:50:04 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Mar 2025 05:50:00 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH 0/4] Add CMN PLL clock controller support for IPQ5424
Date: Fri, 21 Mar 2025 20:49:51 +0800
Message-ID: <20250321-qcom_ipq5424_cmnpll-v1-0-3ea8e5262da4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG9g3WcC/x3MQQqAIBBA0avErBN0sqSuEhFhYw2UmUIE0d2Tl
 m/x/wOJIlOCrngg0sWJD5+hygLsOvmFBM/ZgBJrWaESpz32kcNZa9Sj3X3YNqFV44yRDl1rIJc
 hkuP7v/bD+34HBzuDZQAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_leiwei@quicinc.com>, Luo Jie <quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742561400; l=1417;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=0ZVglako6mV/vVYiHs4jlcbA2K3ASzOGKl1R3WwjJlA=;
 b=+42wJz8yxMmf8CMqbMXdNWLFuqjiDSyzosSj+FhPNqtOg4vzerdUODRloRFWwzGMjCIJCbYcI
 SXaHqWqPzTtDTSOObc4BuIFL2ER1GJjKArYmPwVT28ZJUzYQtg59OzJ
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=bfFrUPPB c=1 sm=1 tr=0 ts=67dd607d cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EfkPgQgNU6_W6T37c40A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: efskeJMflzcz4NDvhTcPG3EdfuVTDOH9
X-Proofpoint-ORIG-GUID: efskeJMflzcz4NDvhTcPG3EdfuVTDOH9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=948
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210094

The CMN PLL block of IPQ5424 is almost same as that of IPQ9574
which is currently supported by the driver. The only difference
is that the fixed output clocks to NSS and PPE from CMN PLL have
a different clock rate. In IPQ5424, the output clocks are supplied
to NSS at 300 MHZ and to PPE at 375 MHZ.

Two related clock identifiers NSS_300MHZ_CLK and PPE_375MHZ_CLK
are added for IPQ5424. The new table of output clocks is added
for the CMN PLL of IPQ5424, which is acquired from the device
according to the compatible.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
Luo Jie (4):
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5424 SoC
      clk: qcom: cmnpll: Add IPQ5424 SoC support
      arm64: dts: ipq5424: Add CMN PLL node
      arm64: dts: qcom: Update IPQ5424 xo_board to use fixed factor clock

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  1 +
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts        | 23 +++++++++++++--
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              | 27 ++++++++++++++++-
 drivers/clk/qcom/ipq-cmn-pll.c                     | 34 ++++++++++++++++++----
 include/dt-bindings/clock/qcom,ipq-cmn-pll.h       | 10 ++++++-
 5 files changed, 86 insertions(+), 9 deletions(-)
---
base-commit: 9388ec571cb1adba59d1cded2300eeb11827679c
change-id: 20250321-qcom_ipq5424_cmnpll-416f770f2f97

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


