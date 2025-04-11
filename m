Return-Path: <linux-arm-msm+bounces-54029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DE3A85E0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 15:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE0B8462777
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8562367C3;
	Fri, 11 Apr 2025 12:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E5j7UbZF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB492367B8;
	Fri, 11 Apr 2025 12:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744376306; cv=none; b=GgOp1qoKMN/7UAahIt1tqgNm/Z1YLTWAFDvPtSiQtnP0hFDSG0jHABSCuHKGK2jpoMr1TLDVHt49Dvzn+5bf/8V6nOzoyg5sRN8hW5LK0RNmGO1VnedrtxKHurD482KqewvHXdFjO9/qk7WVQERHomxyoCCnOyGDOVM++lUYdiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744376306; c=relaxed/simple;
	bh=t0tkQ54ofbgKef2lCIMo1nwJXoTctI6XB1vozvYeC/g=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=DUf0fPHGegCEukGGIPpi0TcEfclNoRALFxuhpcj2LOc2iG2MGhtW/L+b8m2glyhLDdEjjIl7zougIpdwWv4dRcvPko+0UwM7QnM0Jv4FRdWIcQY/Sp5XHII/LuTfHRvYwGdjOmhH7zvljMoHw3p+OXJxihiAs7hpbmgIKmnaSxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E5j7UbZF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5DjSi018998;
	Fri, 11 Apr 2025 12:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yRDd8cc+SFW/TE94MJLtme
	FHrlAY/wkTRBkLqsG9A/E=; b=E5j7UbZF8B1/Yd3kzrOJLXseeVspQ0FCUZ0kT3
	F9CXx7iqcfDgCEd/tG4wzJQ/NFWF5cvkLKz26JZf7nYBeY9sibC7trdCuhjiCeQG
	f+I5PtO1tmVelf7dnKFXs8skUZX4Mlg03GsLIDThMVwP9Htafsu4n7Uo3MH4s8V6
	eFNdTbWhzQJUNa5BKIkpC0bSLvs4FoIH2cewW8zzcW50PlqzB9Jw+X2JDTnEN/ce
	JDzBuq+fMv46CU/HXqWM8Q0HG4b1Ja5Tn+yiTAGhFrNzFJUH/x+8hAe992OYg6Xx
	LR1bth3ZGdzTGABM/0orqSqqhE/pKn/7KN3efX6FQSMFdhig==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgtkdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:58:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53BCwIPw014349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:58:18 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Apr 2025 05:58:14 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH v2 0/4] Add CMN PLL clock controller support for IPQ5424
Date: Fri, 11 Apr 2025 20:58:09 +0800
Message-ID: <20250411-qcom_ipq5424_cmnpll-v2-0-7252c192e078@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOER+WcC/22Nyw6CMBREf4XctTV9IrDyPwwhTbnITaBAq0RD+
 Hcrbl2eycyZDSIGwghVtkHAlSJNPoE8ZeB66+/IqE0MkkvDtRBscdPY0LwYLXXjRj8PAytzbov
 OlBeuFKTlHLCj12G91Yl7io8pvI+TVXzTn0/J/75VMM4U2gKNzGVr9XV5kiPvzqkM9b7vH48j6
 ti4AAAA
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
        <quic_leiwei@quicinc.com>, Luo Jie <quic_luoj@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744376294; l=1877;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=t0tkQ54ofbgKef2lCIMo1nwJXoTctI6XB1vozvYeC/g=;
 b=4E89aURoGKVvykGfaXXQjUThciMkhEkin5yscUOo5G1fGsQuF3KkkkVOblJnIYHnN7PVTBHFG
 oJ6jqoJvBHfDWCqoiXqhltK+zx3/FIY99Llo5vsj24cU/5KxMnSW5K8
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f911eb cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=vO4UhBWCcG5WWccfzfwA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rUmHRSLZm7dyk0jJWMwC-zsEnio8giub
X-Proofpoint-GUID: rUmHRSLZm7dyk0jJWMwC-zsEnio8giub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110083

The CMN PLL block of IPQ5424 is almost same as that of IPQ9574
which is currently supported by the driver. The only difference
is that the fixed output clocks to NSS and PPE from CMN PLL have
a different clock rate. In IPQ5424, the output clocks are supplied
to NSS at 300 MHZ and to PPE at 375 MHZ.

This patch series extends the CMN PLL driver to support IPQ5424.
It also adds the SoC specific header file to export the CMN PLL
output clock specifiers for IPQ5424. The new table of output
clocks is added for the CMN PLL of IPQ5424, which is acquired
from the device according to the compatible.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
Changes in v2:
- Alphanumeric order for the compatible strings in dtbindings.
- Add the IPQ5424 SoC specific header file to export the clock specifiers.
- Drop the comma of the sentinel entry of the output clock array.
- Add Reviewed-by tag on the DTS patches.
- Link to v1: https://lore.kernel.org/r/20250321-qcom_ipq5424_cmnpll-v1-0-3ea8e5262da4@quicinc.com

---
Luo Jie (4):
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5424 SoC
      clk: qcom: cmnpll: Add IPQ5424 SoC support
      arm64: dts: ipq5424: Add CMN PLL node
      arm64: dts: qcom: Update IPQ5424 xo_board to use fixed factor clock

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  1 +
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts        | 23 ++++++++++++--
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              | 27 ++++++++++++++++-
 drivers/clk/qcom/ipq-cmn-pll.c                     | 35 ++++++++++++++++++----
 include/dt-bindings/clock/qcom,ipq5424-cmn-pll.h   | 22 ++++++++++++++
 5 files changed, 100 insertions(+), 8 deletions(-)
---
base-commit: 01c6df60d5d4ae00cd5c1648818744838bba7763
change-id: 20250411-qcom_ipq5424_cmnpll-960a8f597033

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


