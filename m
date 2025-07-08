Return-Path: <linux-arm-msm+bounces-64064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC6AAFD02F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 18:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C27F3AE6FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBE62E4260;
	Tue,  8 Jul 2025 16:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ls5DLfnd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C207A25B1EA;
	Tue,  8 Jul 2025 16:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751990939; cv=none; b=NM3yavToGckzm1/D9FyopaaWxPcMx9YttjSY81uhaJaQzZDjKzPYHiUFUjQKcnZL+pgJvt0jkfkSBOrWCSI5NpfQHvR96Z26p3+meWdvCgfq15Z8WDT0yKeHktLc43INZozBaF3yBgF8Om9qQT9w5rLah0Ls6GnY3K/bejmrHcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751990939; c=relaxed/simple;
	bh=tIy1H4wPG07YsBcqQP5HeL5BygRp+bP2YqDFlNaKcuQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=nInZURTh4HVJKvU2pJ+oryrkMn6sHmAxdcXAnP0rJZ10mX0wmKrLN4Xbnml5dAgtmVlVEMcjZgD+ONjlsp/WIxPc3EazbSyA4TGid2BEloA308zP9DGOiKM9Pr9SeaA2cm3oGvz+ajIBpVkpp+v8lMASc5BHrlzLjb2RIcMHNbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ls5DLfnd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAZU9032619;
	Tue, 8 Jul 2025 16:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0agtcIB70BbJp9hb7MOPGz
	YwJiQf6tXtiaK4xwMXakI=; b=ls5DLfnd/JLXUSns2xDs6IR6uL7Tfi0OQABqit
	gqOGuvaZCmCeevispmzxwA0l0tiB45OXX9JZ/1wgij7IiXJi3M3eg2kkCJUW2JxM
	DDJub01BuLVGh9CbjNceWx54xxP3GdRP+PwNnOSqsteZmwMFcL9SaoJgrCcw5EUb
	yyM+8moqfF2ndnJ0CuxRDhvHk6Vx2F5I5HlyfFu7vgJz/OTVtHSewny2bFCBqYd1
	1J4M17cNfHE43uJRiP++R+XUI9TgwFWolBCuqImc5KyGKk4uqmcpY3XC+XUXqfy1
	lWhntS1gmdEIpNuTwNx3sHTCPOXtlhmAzWDCQFEp0X7QixMw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47rfq320b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 16:08:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 568G8gKm016646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Jul 2025 16:08:42 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 8 Jul 2025 09:08:39 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH net-next 0/3] Add shared PHY counter support for QCA807x
 and QCA808x
Date: Wed, 9 Jul 2025 00:07:55 +0800
Message-ID: <20250709-qcom_phy_counter-v1-0-93a54a029c46@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFxCbWgC/x3MQQqDMBBG4avIrBuIqSLpVaRISf7oLDrRJC0W8
 e4NLr/FewdlJEamR3NQwpczR6lobw255SUzFPtqMtr0etBWbS6+p3X5TS5+pCCpzgbYu+na4D3
 VbE0IvF/LkQRFCfZCz/P8A4EEdb5sAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751990918; l=1162;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=tIy1H4wPG07YsBcqQP5HeL5BygRp+bP2YqDFlNaKcuQ=;
 b=Uz+zPBJ48KadNb3JmhOPZpbZhaoi1xO1vGVXpfSh44hTqG2uiwg0cvrk6i3EaE9X5CB/Rv2JB
 ChQPE1oa0kqD1CCbZSAXEuxm7z74D7a5AZL3gaORedI5L0+uqzqHtg+
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEzNiBTYWx0ZWRfX/GSbh3nzB9vX
 /LqJD+cfD0fb4e6gKioflyrYPDR89JguBmpN9NSCC9spgUgZf8VL4A+4OPVwmQXomqENtAIZxfu
 Qpp3v271BXX2r4tGRJKp6MPe4a2rbi0UN6FZ0XQYTXQwPLlc6xhrBZsK8+aH5z1dpH/E0j/xiFd
 kR9xvKgK24Omt6dadx0MLH8sG/DHcsaZF2PUsNiOeNZPGEOennb4Q5D1ER7LCag9YZYrjg8lrPm
 26HRo9XMr3P47KSsC4XZ8o4loivWCfvZ5ZDHLBzb8+dPMDJLGi2xmE5lQm/bHBhO9l+rEnuQNt7
 cb9GKA9HZAfoODpN8QPrXvWhDZzPbodbxw2vHw9wpugNKblHEHK49LRl99qY0nIDSLTZ5wYUKFe
 ANlp2O1Zv2JELl9+6FIp2A4cczSSaFaG1/4mSGocDWEHRq+EVtPYeIa/1Rt7uY+lUCndeEl+
X-Proofpoint-ORIG-GUID: EwvlLgeTYpt4e945PlSb_6BaAdzifgSg
X-Proofpoint-GUID: EwvlLgeTYpt4e945PlSb_6BaAdzifgSg
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686d428b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=cCCatxcZxqH0WtuQzukA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=977 spamscore=0 impostorscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080136

The implementation of the PHY counter is identical for both QCA808x and
QCA807x series devices. This includes counters for both good and bad CRC
frames in the RX and TX directions, which are active when CRC checking
is enabled.

This patch series introduces PHY counter functions into a shared library,
enabling counter support for the QCA808x and QCA807x families through this
common infrastructure. Additionally, CRC checking is enabled within
config_init() to ensure accurate counter recording.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
Luo Jie (3):
      net: phy: qcom: Add PHY counter support
      net: phy: qcom: qca808x: Support PHY counter
      net: phy: qcom: qca807x: Support PHY counter

 drivers/net/phy/qcom/qca807x.c      | 10 +++++
 drivers/net/phy/qcom/qca808x.c      |  7 ++++
 drivers/net/phy/qcom/qcom-phy-lib.c | 82 +++++++++++++++++++++++++++++++++++++
 drivers/net/phy/qcom/qcom.h         | 16 ++++++++
 4 files changed, 115 insertions(+)
---
base-commit: c523058713abac66b0d83ae12a0574d76cd7df2b
change-id: 20250709-qcom_phy_counter-49fe93241fdd

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


