Return-Path: <linux-arm-msm+bounces-65025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97168B05848
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 13:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C80891A60FFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 11:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6387C2D8377;
	Tue, 15 Jul 2025 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="acbrdwET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B022673A9;
	Tue, 15 Jul 2025 11:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752577387; cv=none; b=Om+lnMWqteGMEYyC15lt0EpnDdgOcKVW0vgT//piiJOjJIb004yiYjZlPkVu1S7bZjVi02jwDQd9nMSi6JcRp5Q/mIfno9IAmez+qbJHVtwhtdOXNuf9al0I1u7m7HHXFQw6mlU1M7RdfNvm8EtHroXwc4/WdCR3SJKuWptcUPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752577387; c=relaxed/simple;
	bh=6+1tfxhRAKeckRR71WjO7SHqYCGup9Q/qfjkGi5il68=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=NA+QTdfNSmFfAheVm00aw784e1xNhY/uXTE/ijGxd8SB5if1qfxAm37Dv7/9Ua1u1onofU3HwROVbCyl2baXacH3xx7Gz0xVu7KcbW9sF0uq/2SDGR39spTaMGvkpwFj3FgX+q9+D9aievG4cv87WdZmg4RPVEZ0fA1OF2iyG+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=acbrdwET; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F5c0oM011542;
	Tue, 15 Jul 2025 11:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NWEBi6E9kskv6BEIyPrdnk
	sgs6FzVCDGGRu5t+yBxd4=; b=acbrdwETygV/M9A7hyLhbxz+6eKSnwcvCI/IIh
	mSnE2XAw9B+vh3gSWBwDQJRWJvyNETPSBMMS8fJOpUaoIRPFchezSOHotDfj56ZP
	rk8l84NydRTEAcqm3IlVgmieaC++0U+xK33V65YU3Z7LExLvJyC0kqds+u7dFLne
	f+TDtMrgTyhp1OTPi90NyFi7BttKwq1y/WR8NMD2tOgr2SgZ0bRyO4LZB9p8697c
	HGUByVlw0U+xzVe3uIcwJsn/d3hGEDS3/5ACf2zh24HveiyAfhLRsY2wwn42OK7O
	2boNNtsd2EgYTK1UqXfhZuU2uVgbPr9HiVf2gucp6trk7AsQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyjqxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 11:02:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56FB2e5o003607
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 11:02:40 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 15 Jul 2025 04:02:37 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH net-next v3 0/3] Add shared PHY counter support for QCA807x
 and QCA808x
Date: Tue, 15 Jul 2025 19:02:25 +0800
Message-ID: <20250715-qcom_phy_counter-v3-0-8b0e460a527b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEI1dmgC/3XNQQ6DIBAF0KsY1qUBRA1d9R5NYwwMlUVBAYnGe
 PdSVm3SLn/+/Dc7CuANBHSpduQhmWCczaE+VUiOg30ANipnxAhrSEcEnqV79tO49dItNoLHXGg
 QNeNUK4XybPKgzVrIG7IQsYU1ontuRhOi81v5lWjp/7OJYoJFPTR8IExI3l7nxUhj5TlfFi6xD
 4LyHwR7E1wpEEp0rdDfxHEcLzwt4Q//AAAA
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Luo Jie <quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752577357; l=1750;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=6+1tfxhRAKeckRR71WjO7SHqYCGup9Q/qfjkGi5il68=;
 b=syaXrqIz6oMh3k9FbyBwaRsO2WRqPxwDS1L5urb563thEUI4iWr4QrZs1HDAKH5kyqNYylGAw
 KuSx6znkE6zBoYpQPCP/QQrt1IydoVQaWv38vYBqmOiUB00IixhiIuh
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zEuudNBPeD3f-D-qAvR-qW0ZMo9tTc_P
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=68763550 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=cCCatxcZxqH0WtuQzukA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA5OSBTYWx0ZWRfX9xrvinzkCJMM
 XIuruZ7PMPLiCdVbGJ+yY3iOO1iyKj31FUQU1/oiNvujXhG4seyQfLDKn/ZMMZQCu6EmTW++s5Y
 AEa2jidXEbMT7THiWDX/0EFTfqIDICl1HaNAuUPHkiehnDD9RscX8YqezsKAkz6/uN2GJzNVNpY
 vp8jXIAbA9OgAr3f864gsSU73i/FeGKpiXgKe8osdyLO+KGKrY6t5q8/ZglgzUfb7aDvtKZZ7jy
 yMbWM2bGdMqpYM8RRUeL5H0Tl4ObkckxrkrfOhwKoRAENkHZctHVV3OJTzJ5DHlSVmfJfkoaPK2
 yZ2uayOSjkCLXQQCXqQ7QFAHRatnvjPLKCaD1HRlbd5joVXrxf24O+CoWyMjC3w0vkDH0HeBg6B
 Zax72r7zKaOxyrTnvJYxmfiUSewQK5GmaD03d30/GaPlVe5l4/QYvXMtn6+z0iCzMQTB4LLP
X-Proofpoint-GUID: zEuudNBPeD3f-D-qAvR-qW0ZMo9tTc_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150099

The implementation of the PHY counter is identical for both QCA808x and
QCA807x series devices. This includes counters for both good and bad CRC
frames in the RX and TX directions, which are active when CRC checking
is enabled.

This patch series introduces PHY counter functions into a shared library,
enabling counter support for the QCA808x and QCA807x families through this
common infrastructure. Additionally, enable CRC checking and configure
automatic clearing of counters after reading within config_init() to ensure
accurate counter recording.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
Changes in v3:
- Resolved the compilation error on the ARCH_i386 platform as reported by
  the kernel test robot.
- Link to v2: https://lore.kernel.org/r/20250714-qcom_phy_counter-v2-0-94dde9d9769f@quicinc.com

Changes in v2:
- Update to use the standardized PHY statistics framework.
- Enabled automatic clearing of counters following each read operation,
  ensuring support for 64-bit statistics.
- Link to v1: https://lore.kernel.org/r/20250709-qcom_phy_counter-v1-0-93a54a029c46@quicinc.com

---
Luo Jie (3):
      net: phy: qcom: Add PHY counter support
      net: phy: qcom: qca808x: Support PHY counter
      net: phy: qcom: qca807x: Support PHY counter

 drivers/net/phy/qcom/qca807x.c      | 25 +++++++++++++
 drivers/net/phy/qcom/qca808x.c      | 23 ++++++++++++
 drivers/net/phy/qcom/qcom-phy-lib.c | 75 +++++++++++++++++++++++++++++++++++++
 drivers/net/phy/qcom/qcom.h         | 23 ++++++++++++
 4 files changed, 146 insertions(+)
---
base-commit: 06baf9bfa6ca8db7d5f32e12e27d1dc1b7cb3a8a
change-id: 20250709-qcom_phy_counter-49fe93241fdd

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


