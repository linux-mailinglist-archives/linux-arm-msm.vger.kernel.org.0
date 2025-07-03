Return-Path: <linux-arm-msm+bounces-63520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2A0AF7378
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 14:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0B527B198F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 12:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACEA2E5400;
	Thu,  3 Jul 2025 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pakZ4RGg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EE32E3B0F;
	Thu,  3 Jul 2025 12:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544900; cv=none; b=bZp/VCHU8v02/wVL6TZvhNpKOxUm5w7s/1jGmppTEX3JP9PM6Ek3VGbZAm2ZfSqETxpnhUQ7edvKjVVcG04Cdue6jI+SNaAXUIde00XKVOi7bhfJ6cjDrQ57RHa/k7yWRIn6AmG4GZl2DmFtG3GCbJctxgH2wy0YM0fgvw39C2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544900; c=relaxed/simple;
	bh=qBIYkKU41cbvXE7eQ9qC7MixzXczSqkdCffvtQZmnkg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=F0kBZ7kosBU3txppncNRZ1jEUTsAGw7moROQ77OTRjmWXEOLSKqZqkxTAFrC9rKpHtD3z5RKnRhA/fbbJ0JVyGIRedQJEPi786jud2D2i7LCdz848/Dht/y/MNu0qjM9Byin7KmxL6p3OnftRB3Ybk1ik0ngEcjDMd8JH3nMecg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pakZ4RGg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563B8Qph000320;
	Thu, 3 Jul 2025 12:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F6u7/nRfv9Ok7xGZ5lsXNn
	DCvmfSSR5PqthDlJPEKao=; b=pakZ4RGgD3Pc5TDTo18kG2TTZC96a3r20aGHxz
	gK/AOihHRxh+gIcgjCAhBDWbXNOInBOmm9rvdu095E27QgAMYvBck66ehygE/R1V
	jg3gocvLJs2FUWk0/WfNYU/4vt4/WUHsA0+E5Ig928Um8ITM05BDTfvI/0+L5E5I
	fgeXQHjc3ZVyoV3exjfEyWURW6bCKYtlzPqo8LMePjKoXtvDZmDZyi+lhJJ4EK55
	zmIXmAg+JK3vg3iObBRq8KVEQgfWJJ6TZJEWnHQYFAdK+yTcvl9SNg9b/k3tp8XG
	0ixj43B/xEoAI5CfaOQ+f1V4tS6AKa/p+kH6NLvWZbSu2Liw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmg9em-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 12:14:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563CEeSg002237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 12:14:40 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 05:14:37 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH net-next 0/3] Fix QCA808X WoL Issue and Enable WoL Support
 for QCA807X
Date: Thu, 3 Jul 2025 20:14:27 +0800
Message-ID: <20250703-qcom_phy_wol_support-v1-0-83e9f985b30a@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACR0ZmgC/x3MQQrDIBBA0auEWUdQk2Dbq4QgxU7qQKtWTWqQ3
 L3S5Vv8XyFhJExw6ypE3CmRdw2i78DYu3sio0czSC4nrvjAPsa/dbCH/vqXTlsIPmY2crkqoS5
 mMldoaYi4UvlvZ3CYmcOSYTnPH1bJ5kJwAAAA
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>,
        Viorel Suman <viorel.suman@nxp.com>, Li Yang
	<leoyang.li@nxp.com>,
        Wei Fang <wei.fang@nxp.com>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Luo Jie <luoj@qti.qualcomm.com>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751544877; l=1288;
 i=luoj@qti.qualcomm.com; s=20250209; h=from:subject:message-id;
 bh=qBIYkKU41cbvXE7eQ9qC7MixzXczSqkdCffvtQZmnkg=;
 b=w6OZjcGgnf4lI5YRqcT/LmV/18mPgRBKCjcQtWAEPnG7yQL1BQLYgijMqHgFQ8mlIg+JZmotd
 k1EZJyhS4VRDkREnHfK1l2OevGPW9K7USUqM3+8jpjZbriHtened2ar
X-Developer-Key: i=luoj@qti.qualcomm.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68667432 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8
 a=QfVGnWNc7DW3J7Ta4DgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: w4BcLmJ9FsC-RWLzApV9dJGwYXr1_bIp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwMSBTYWx0ZWRfX95q/eEf3ywmR
 oCpDbLGcA4nW/WkfyNPReJoa+znrm9ZQi5MqmKg6k+o6dcZLhCVVqtOnNrnX09Z6rjU9kkRyCic
 F1YnIRklptxf5olR1TrTYUG2V3WUSdd9heG8jDOD6nHsjik1wsxm5Qf8BdOiL5ipuktj8ppMRHd
 9yk98oF/phj4q3eS55OCUQksq3ey+PbzjqRW54A6+ciNO6H14YuAwU8gorNSgqwtN5HKe8oL4dp
 i9yp2ny1zmfeTj/r3LaIo2haTXzBGmXoNSDNRJOcKq10q9g0yx3puN/cfk0+/DrKCp6E5p2guTW
 qo+QJiLek2EGEPGMPSojSbX9riutge6OsxwVol9IVclkHB+MNokU6famjqc+zL8CX4cLsrlNbqU
 WRLcOCEfVpYh6OTam1gtd66CNRVqH/vSgFZeCt+MbjegJNbJWP5Hasxqllc34sECnS9ZWxLZ
X-Proofpoint-GUID: w4BcLmJ9FsC-RWLzApV9dJGwYXr1_bIp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=654
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030101

Restore WoL (Wake-on-LAN) enablement via MMD3 register 0x8012 BIT5 for
the QCA808X PHY. This change resolves the issue where WoL functionality
was not working due to its unintended removal in a previous commit.

Refactor at8031_set_wol() into a shared library to enable reuse of the
Wake-on-LAN (WoL) functionality by the AT8031, QCA807X and QCA808X PHY
drivers.

Additionally, enable the WoL function for the QCA807X PHY by utilizing
the at8031_set_wol() function from the shared library.

Signed-off-by: Luo Jie <luoj@qti.qualcomm.com>
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
base-commit: 8b98f34ce1d8c520403362cb785231f9898eb3ff
change-id: 20250703-qcom_phy_wol_support-402f7178c5c9

Best regards,
-- 
Luo Jie <luoj@qti.qualcomm.com>


