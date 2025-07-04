Return-Path: <linux-arm-msm+bounces-63600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CAAAF8740
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 07:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 609351C47E6D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 05:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9CF20B1F5;
	Fri,  4 Jul 2025 05:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KHxSOdhI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1428E20A5F5;
	Fri,  4 Jul 2025 05:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751607106; cv=none; b=p3b8E3eTmhapG5ACEzxoICvxTdJtj2YlS0i8VtA0lS/3iNJaMnYDGx3A5wdozkHrt9Jf/kPDHUUmRK5kZF0r+7q36wJ0DtFZuEtjUli9oECB3fGzUEho952CqDQZaAzQ43mviaK84o58CxtCRBdr2vuhCgtwjSwwf7Dfcg04YnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751607106; c=relaxed/simple;
	bh=lbr/w3Atu8u0QgKs9GzUVac/xCX7/2DRddCVhydzMw8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=sg/PlP5YztrU581SBqW2GJZ9qvXasyDMoLejlStGMPj/jsaxR9FZf4mfNYPIOAItRShkpjddtzWN8n/5c/RalwUzuh+XLsxyWxdr6ds88NlABQJAlB5kr2a8iCVzSI6THlnUZ+YzuVWSIgE3dOtsNwKfjE6fSNViTP2dCqG3ww4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KHxSOdhI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5640GOhH014069;
	Fri, 4 Jul 2025 05:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bes+W9qoQRtMECU3uZpM7J
	zR5WqARX2AyGZAPPR1ydk=; b=KHxSOdhIJuqVLjYfRehspUzIJMG/E/2NbKm7c5
	++Uh+Sh5/L4uugkkqkl5wJoBwdT7tCHTIVX9zLjUbh2CHZ0bcl+aZAotwbzM29cD
	sNFD262AJq6XOZLYJiOA9ODydcFyNJOOB5P3WWgJR05LNnSJ9whUqQfkWHXLxRzJ
	H8V7QUdlKDHkngcbh8KTmdrfuddLLrV/yz6xiWioT17Fr7HR0zsSk6azIu4nnC3g
	XWnRYZ+cAxUf6uv85cY8/lbaOeIpkI/bxBioawHZqayjPNvmYD0tELq4L9TABlgS
	GT4ecaRc0oJDqc5uTF2SjT30NOJK4YZQXZJemKRcNk5tLl6g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw2rj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 05:31:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5645VMgh016875
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 05:31:22 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 22:31:18 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH RESEND net 0/3] Fix QCA808X WoL Issue and Enable WoL
 Support for QCA807X
Date: Fri, 4 Jul 2025 13:31:12 +0800
Message-ID: <20250704-qcom_phy_wol_support-v1-0-053342b1538d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACBnZ2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMT3cLk/Nz4gozK+PL8nPji0oKC/KIS3VSTNENTk+RkozSjRCWg1oK
 i1LTMCrCx0UpBrsGufi4g4bzUEqXY2loAku2xBnUAAAA=
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Viorel Suman
	<viorel.suman@nxp.com>,
        Li Yang <leoyang.li@nxp.com>,
        "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>,
        Wei Fang <wei.fang@nxp.com>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <maxime.chevallier@bootlin.com>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751607078; l=1288;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=lbr/w3Atu8u0QgKs9GzUVac/xCX7/2DRddCVhydzMw8=;
 b=J2KWzNG9u3Qp9GpL49mnLPoTz82x6I+/blPQTx3331ZzZG3e+3UGfBdMhK6QcOt0TcYTe1dv9
 eu279EMWerSDciZRlVmfjwhzl6oe1WahmK8XCe3c6sBaaEFuvMzdxYU
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5DwSsTRLWhQF87L-A5mwRlEgB96AZHlB
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6867672b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=QfVGnWNc7DW3J7Ta4DgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5DwSsTRLWhQF87L-A5mwRlEgB96AZHlB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA0MCBTYWx0ZWRfX1PmzvuJ9fVCY
 fYJe35YCTvVAn7qFYW/AeygjgYTzF65pA/uYOsQxLIQovzUfBuEDfz+woM9TX9rSEVomj/63LGI
 oGIGtU9T/+gsoZ/RFM5Iqxm/oeOCC5sRAHOQSTa2Kb9TKR3cCK8yyC/+yvxT8eRh095p0UmV0Xn
 gGsAQTQsemKxD5s5Z47dFQij0R0ANiCSoiI+4U1qeqQa3mMfWmgllWwu/15ufBXookR/NxzhYuI
 1OY0k/hWJ/Clmf7Vbositu71oQvB1bYz1BbcRyhYuTfXozOwsWRH8EvBf7PAFSXlij+nDIxp2B1
 0QuTrnE730ahNn8yd1pDfegk9mi4Da8slPborsoPSHP4IVtLI3JrA944y3W9GmSRjBsaea+tReZ
 CHDJAvWD87rjaQ+fMuz93C43qPgkGjg2+GiH7iJ115onRHCGTD/l3fl4TWTPnht1amC+6C6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=697 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040040

Restore WoL (Wake-on-LAN) enablement via MMD3 register 0x8012 BIT5 for
the QCA808X PHY. This change resolves the issue where WoL functionality
was not working due to its unintended removal in a previous commit.

Refactor at8031_set_wol() into a shared library to enable reuse of the
Wake-on-LAN (WoL) functionality by the AT8031, QCA807X and QCA808X PHY
drivers.

Additionally, enable the WoL function for the QCA807X PHY by utilizing
the at8031_set_wol() function from the shared library.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
Luo Jie (3):
      net: phy: qcom: move the WoL function to shared library
      net: phy: qcom: qca808x: Fix WoL issue by utilizing at8031_set_wol()
      net: phy: qcom: qca807x: Enable WoL support using shared library

 drivers/net/phy/qcom/at803x.c       | 27 ---------------------------
 drivers/net/phy/qcom/qca807x.c      |  4 ++++
 drivers/net/phy/qcom/qca808x.c      |  2 +-
 drivers/net/phy/qcom/qcom-phy-lib.c | 25 +++++++++++++++++++++++++
 drivers/net/phy/qcom/qcom.h         |  5 +++++
 5 files changed, 35 insertions(+), 28 deletions(-)
---
base-commit: 223e2288f4b8c262a864e2c03964ffac91744cd5
change-id: 20250704-qcom_phy_wol_support-e4f154cc2f2a

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


