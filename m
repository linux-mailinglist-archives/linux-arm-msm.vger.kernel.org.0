Return-Path: <linux-arm-msm+bounces-60751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E73AD33AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA0E33B8C17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 10:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9233528C2C9;
	Tue, 10 Jun 2025 10:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="atrlBOav"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39E221CC71;
	Tue, 10 Jun 2025 10:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551736; cv=none; b=L7+a3yRu91vmZYjRSO3OK8abNlac5vfcvJgV7FW4q+f+izPzpuaoxKESt3lgbYFQZhxKp+zwsmTh1HkFO8hxz0uve35+fJd8cytwZ5YEDp8v2N1PSvnudDYBfpr/NZuojT/0CA3/SstwV7mDbRbzIAN9X/I4KI8l3UKF2RVOkcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551736; c=relaxed/simple;
	bh=wYFgVP2gxoyf8lffRavDBbUQ6yzvYSeHA+dyCglyUwQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=r1fXFJ2scdCHKJPDERa4P2DPA/YZqNLF/CzpOk+z1fgzQcxrdEqo34FJhDmAzKsYL5szTG6FwbBDcik3woL3GWdwhhrMgtWm/JVXR+ZI7g+8JWPGdGQXF/YTrK7dBnwBx1UbD9JxKzJ9XIQmsFh1kN6uHek31cyZflA1vVk26Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=atrlBOav; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9Ponc027404;
	Tue, 10 Jun 2025 10:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aiee2k/WYmaab5lj0Ku54v
	WRrAkwciSl4A4DVRNodMM=; b=atrlBOaveEa4HczHNH0g/z9hdxpNUwXe2RSvYG
	RCNCQfOo9XoNktTjoMeJCdfGVKASY3bzE0BrWAN653HGlR+zTGZ0+xM1eRqHQtQU
	UG/yqgYwkB7spHl0hfk4NKL0km5kS+x1Zln+zuLvxEYRjlZKSJ+s5j29fOzIph0J
	3RI2awUv7ihcAkHbS0BgaRfm7wxYFr3SA0Aw3//o+gnMrW3u62ZMHsXXuFpUrbQP
	g/yv6EEEOUno0WsjuL7JAxKjfaVj8O2933/ZLvwRFr2NvnAp8iu75MRXCOXjF61A
	E1IVnRbOfqs902nqxMR9qBygFPlepjI7y8ahbdzpu+aSp0aw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d1216ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 10:35:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55AAZTgF025781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 10:35:29 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Jun 2025 03:35:25 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH v3 0/4] Add CMN PLL clock controller support for IPQ5424
Date: Tue, 10 Jun 2025 18:35:17 +0800
Message-ID: <20250610-qcom_ipq5424_cmnpll-v3-0-ceada8165645@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGYKSGgC/22NQQ6CMBREr0L+2pr2QwVZeQ9DiJQiP4FCW200p
 He34tblm8y82cBrR9pDnW3gdCBPi0mQHzJQ483cNaM+MSBHyU+CM6uWuaXVygKLVs1mnSaG2GG
 OXSeqoYe0XJ0e6LVbr03ikfxjce/9JIhv+vMVQvz1BWSclShRiTNqXlYX+yRFRh1TGZoY4wcQd
 B1EuAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749551725; l=2128;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=wYFgVP2gxoyf8lffRavDBbUQ6yzvYSeHA+dyCglyUwQ=;
 b=dIXXJ5fab2euWI4KW5MnW7pj8bpHlBG2RmEokhym35G16t/UlbBaGi84vB0vM8nxwCIASdYo5
 fHNqA135CVwByRH3MXKBS0qYbQgjY+/bfe1vK1jAVCW8BiyjZUwg20j
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: p3NMUVMn8qMLPJLMO6OSNnOC1WmejbmR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4MiBTYWx0ZWRfX7ISnfe8ZmL9v
 oTvQHWdSuCx/Dsb+RzUIT/b1nkdn81P1jXgXZ10HIjF3mB98zKTNVtR//Lat9wTLYXpHZE5Th4r
 Gt8j8qf+oR3w+U0ut91+GtAo83OerLsi/U9FzwRGJEhMHaGbyCGO4h0vlscTEF7PGuXEgTYwSIH
 DxzxD1awbLhYECPCdmhcQqu5f1i4pE/OVwKzJLcsiUgB4sp2DpAl1Dj8yUDKEZixA0bo1JhkXgi
 TmNTCHZnK9D2rsR7KU3RoaMUA2kLqZZt5opfMKNjrr49c6ybBlFx+n6FPzV7i69nO33y+A/8ovf
 FVyOYUVLQxxhIG3INyDp/FIv8544JFHK+M+aA4MPVdRre/lEq22acKmooJ/cEZ6Pus88TVcOGAH
 KbiQGc+xY572JGlOqSaoeGXeYQk2+eVmFyCnHrqOVo8FqVhkT62B6d5BLzt9p7cs8q7Sfm6h
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=68480a72 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=JicUbE_RofftU9P8D18A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: p3NMUVMn8qMLPJLMO6OSNnOC1WmejbmR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100082

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
Changes in v3:
- Collect review tags for the DT binding and driver patches.
- Rebase onto the latest code to resolve conflicts in the DTS patch.
- Link to v2: https://lore.kernel.org/r/20250411-qcom_ipq5424_cmnpll-v2-0-7252c192e078@quicinc.com

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
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts        | 24 +++++++++++++--
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              | 27 ++++++++++++++++-
 drivers/clk/qcom/ipq-cmn-pll.c                     | 35 ++++++++++++++++++----
 include/dt-bindings/clock/qcom,ipq5424-cmn-pll.h   | 22 ++++++++++++++
 5 files changed, 101 insertions(+), 8 deletions(-)
---
base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
change-id: 20250610-qcom_ipq5424_cmnpll-22b232bb18fd

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


