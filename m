Return-Path: <linux-arm-msm+bounces-64836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B929B0426A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 17:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 510564A467A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 15:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A3725C821;
	Mon, 14 Jul 2025 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K+JufpyA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D026325BF1E;
	Mon, 14 Jul 2025 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505178; cv=none; b=GYcTlbtyl/N2rUPyGzk2JXxnhkKqeSdU00mjxJ1G+/eSrMAmpg/B95+izH9wom2p9bM64CRrn5JraDUNBCDpvZF9cqbMz2A5ZyC5PR2ae9OvKqM2aPt6Mg2QlQJlvv+ZahmmdXrLfqYX3cL+dZ3UZmA1Us8DPRaLn41xE9N75fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505178; c=relaxed/simple;
	bh=w2mYwxO3j01mvnExnmQJvR4kT5W56hGAm/EHci1k6w4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=HBOHoaP0/ZWD7CqCjSUUfefacrrQFC0OqlqS4f0B0l9ujYc8JymAMQDuUyXsVW5/pr4K9VBvQzxsD2od+BdawYSzl0QfEsVTpmKDBRQK64aRlWJDTpzdwz/TjSf8x4dP1ySL/CjTLPot45+S1V43eePWsbdK82FO0kq7QuoTnxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K+JufpyA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EA1HU8032291;
	Mon, 14 Jul 2025 14:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VptQElnMeUkm+eOcmOcQQw
	7ifLJyuuzk7L78AjjoPW0=; b=K+JufpyAxApv3UiSYlQBkxoD5o7Orl26m9WToh
	zEk/xdcpHFdESAGTIPgigyvVStFo8oK9MGIR0vFF8tdb8vDRlcH6PeRKxJzI5Xi9
	Uuj2c/4VVvspKUcgOwYLWXwip8qjNzLDnhicOIvNmq73x4RT59WpanIK7iSJd/tf
	ZIkOai5lsh+QQfoykmwcDqJKKRevstZf1w3/oDX5pXmnfwlSwUUx7BFEHHZBW0CT
	RY4QokHfqLpt4MIE5Tld2foaSi+Z2nMtb3x/U73xqWMtfM5iuzmn3FzIECuETXqy
	K/vBazrsljd+1E5Gs0WuiV2oy9GI56s9NYgW94A9uceiKPLQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut4xch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 14:59:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56EExHAh027097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 14:59:17 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 14 Jul 2025 07:59:15 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH net-next v2 0/3] Add shared PHY counter support for QCA807x
 and QCA808x
Date: Mon, 14 Jul 2025 22:58:54 +0800
Message-ID: <20250714-qcom_phy_counter-v2-0-94dde9d9769f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC4bdWgC/3WNQQ6DIBREr2L+ujSA2IauvEdjjMFv+YuCAhKN8
 e4l7rucvJk3B0QMhBFe1QEBM0XyrgR5q8DYwX2Q0VgySC4b/uSaLcZ/+9nuvfGrSxiY0hPqWio
 xjSOU2Rxwou1SvsFhYg63BF0hlmLyYb++srj4f20WjDNdD40auNRGPdplJUPO3EsTuvM8f3x33
 0y8AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752505154; l=1534;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=w2mYwxO3j01mvnExnmQJvR4kT5W56hGAm/EHci1k6w4=;
 b=Hjzd5kQu72O9VW3oBTrKtowoRmguJLBzU9k50+/3TExtu+19r/uSlwwpW7o57/3HLk9HaN1di
 uGFUaMgzvu3DNUFHVIVGw5Rc3SYOuGQ4RGKMkYXt0nsWdRLLQgV/7NE
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=68751b46 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=cCCatxcZxqH0WtuQzukA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: rK-l3DeKYVsO25T7Mwo7kHQH5LUPxxUp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA4OCBTYWx0ZWRfXyxv67bvNyiU4
 AD5lSiQmMNb3/LCkDgZ9v6HQeAh7Xko0mnvzdyBBXGyzl+S1emFg57xSSl6/cS6GzRLQdJ81bg7
 cKxnnFWX/fPMW+zcgng3WR8YoqagpjRncNhhBGyvRbjzPi6WoK8XOFA/L4kgfePPhbUFMizpDmu
 r4dhozXqnBwPVayYSwfrsIEcw9ZwUFhS1cu/kcGDxCKhQUZ9w2pyu7I8IAlgvfTj/PS1pVb5lI+
 xFDUUy4MajyugVf+NLmhdvQlt3TWYi+it1hCPp46DxoVGh3rM7Oe0fcR36BSGeP+LOTiDOIADXK
 IOVcY1xbAZf+ZCUgV0QtghFCLvzTyY0qxzV2p5D28ROnLpNM4lEMIOBKEJ+pQ2N3B6ocH74v6zw
 uXoALgn8iTBVA2mB+wRlcFF/UyJn/IPwbKZl+YX6Dl1DRshT66FofQ6x/HajvolKkNYFteMu
X-Proofpoint-ORIG-GUID: rK-l3DeKYVsO25T7Mwo7kHQH5LUPxxUp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140088

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
 drivers/net/phy/qcom/qcom-phy-lib.c | 74 +++++++++++++++++++++++++++++++++++++
 drivers/net/phy/qcom/qcom.h         | 23 ++++++++++++
 4 files changed, 145 insertions(+)
---
base-commit: b06c4311711c57c5e558bd29824b08f0a6e2a155
change-id: 20250709-qcom_phy_counter-49fe93241fdd

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


