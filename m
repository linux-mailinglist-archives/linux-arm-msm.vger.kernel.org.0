Return-Path: <linux-arm-msm+bounces-66545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A92FDB10C25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23F943BB4FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26EDD2DE1ED;
	Thu, 24 Jul 2025 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d8mwFVix"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A573B18E025;
	Thu, 24 Jul 2025 13:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365101; cv=none; b=sampfWWc9MECCBFS8G3LtZ3g5C6PcMYCtj/D8v42glRL1ZePpEqiTSL7QwdpYXabhVNI0/MrcP9bhjyu12E7Cvr4nGt1BtgPrF+L9taA1Aw+ZKnSRsjmqV4dPH0hTE5kspA7oL/yxoJsKZXIUeZGtSXujKGhCPoXFlpR8mXKMpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365101; c=relaxed/simple;
	bh=A9bwIrJRxNNdderC3N4yfoQuVVWuFM3HdHlRwblbGSo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Sb22XgTbRbV1sfpOlORURTBAXIHuXLIWPtKKQ7B6yqJ7qpSlZ+Lv9Z+Vs81+74tTfyytZTF6YgRYIQKvVaApMlqH0CuzAJtvTE1yg+bWrQd+nZndpETjwAhFBcWnOmEYvMdhMCoXrZXOBN5j1srQ84vu9NLRrnWZ3hvUz+bh4dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d8mwFVix; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OA0lhj031506;
	Thu, 24 Jul 2025 13:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jyLV8i7wRnKFP/6p+6N7p8
	ZtV3DeBlsECF50H98gTgU=; b=d8mwFVixsPy5QMiPHuOGgeYIwDY08hU44TSbQB
	klP6JNP8hBdh9AUju4UyO2le3ZRRQxFk/vmaf3RycvnSDiDLp36rMAP3q5pNDhXU
	wbvbZDNA4l28jzPR/9mJZOZtkRhfKbU22fJcHFFO5UbUiPWQ6YoI4nnVShipBXYo
	arkiFWUWGu+AJedikPETO5xbtdl8mOrYpbEgjZm48/jdeVyD0cTKiluUXGhkLNQf
	QaH6gYe8EDj8r344vXCNpyAapSBYC8i+eT5sdec/7qEX/q8YK6frbKIi0rdU5TdZ
	xl7SPthu6Lfhg9acfkb2iQwsFBDyQ5Q8Fgv+bdbHVJq1DvEA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vf90y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 13:51:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56ODpQW8012102
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 13:51:26 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 24 Jul 2025 06:51:22 -0700
From: Vivek.Pernamitta@quicinc.com
Subject: [PATCH 0/4] net: mhi : Add support to enable ethernet interface
Date: Thu, 24 Jul 2025 19:21:16 +0530
Message-ID: <20250724-b4-eth_us-v1-0-4dff04a9a128@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQ6gmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcyMT3SQT3dSSjPjSYl1L8zSDFNOkRCBloQRUX1CUmpZZATYrOra2FgD
 6R8BeWwAAAA==
X-Change-ID: 20250724-b4-eth_us-97f0d5ba7f08
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam
	<mani@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        Vivek Pernamitta
	<quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753365082; l=1642;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=A9bwIrJRxNNdderC3N4yfoQuVVWuFM3HdHlRwblbGSo=;
 b=kBwX7SIVNIo2GmsRmSKTaSto0Mdc8SYIiCngVSieJamZq50xgxhBNrzg9DmqXWbheDx63oZHM
 pPQ07PWKzuvALmNQhzqTm0QImOUXN8GCRG4fC4sg4Bi5iT9owui7/RZ
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fjHMX2Oz5MsGKuGCLSz2NVGuJmJ5YJaC
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=68823a5e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=m4bhzUhuyDQp0F8wBj4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwNSBTYWx0ZWRfX1VqTaSx/gJ7r
 fr8CASlZwDzDPcB/7tk2X+Mx0lv9Ul9L4bskuaJrinWRvabVym9x2IMdOCPHDU2AHvccm7Xf3fC
 aVetlByNwFPlk3nVAoremORlSMrYXu//CtZvo1iEbEbRx3HIxOnHIX4rgTtTBu3YGkga54+GQj7
 2NlcW14g/+zRXEUWaw31Yk/IXRBSgX00h+lZtvPE/Tt5/thhLbhZK0ClSPT7oUI8VDaVKN6UcFQ
 ypOJhkM6yILaDSoe74E0MwZ1Ifih8qJBKRMt3CZ0RqEn5IjNyPgpF6rgFgM7JoLR9MBgoPq1Wh5
 a0zY7xIbAcPGxgtgaufzwauQxyARFOOnLmGoiblqCxNbeJ6/z0Ua9Ex8U2o4H6NAcTyuUTzWDBu
 b0yFJQm5odQkxNwyY7xycTHYC27IIzNvEVYXqzvQhu0cEvH60FOSKps7l2Y55cbhWu4zhHul
X-Proofpoint-ORIG-GUID: fjHMX2Oz5MsGKuGCLSz2NVGuJmJ5YJaC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=765
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1011
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240105

- Add support to enable ethernet network device for MHI NET driver
  currenlty we have support only NET driver.
  so new client can be configured to be Ethernet type over MHI by
  setting "mhi_device_info.ethernet_if = true"

- Change the naming format for MHI network interfaces to improve clarity
  when multiple MHI controllers are connected.

  Currently, MHI NET device interfaces are created as mhi_swip<n>/mhi_hwip<n>
  for each channel. This makes it difficult to distinguish between channels
  when multiple EP/MHI controllers are connected, as we cannot map the
  corresponding MHI channel to the respective controller and channel.
  To address this, create a new MHI interface name based on the device name and
  channel name.

- Add support for new MHI channels for M-plane, NETCONF and S-plane.

Initial post for Ethernet support in MHI driver is posted here
https://lore.kernel.org/all/1689762055-12570-1-git-send-email-quic_vpernami@quicinc.com/

Signed-off-by: 

---
Vivek Pernamitta (4):
      net: mhi: Rename MHI interface to improve clarity
      net: mhi : Add support to enable ethernet interface
      net: mhi: Add MHI IP_SW1, ETH0 and ETH1 interface
      bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for QDU100

 drivers/bus/mhi/host/pci_generic.c |   8 +++
 drivers/net/mhi_net.c              | 100 +++++++++++++++++++++++++++++++------
 2 files changed, 93 insertions(+), 15 deletions(-)
---
base-commit: 9ee814bd78e315e4551223ca7548dd3f6bdcf1ae
change-id: 20250724-b4-eth_us-97f0d5ba7f08

Best regards,
-- 
Vivek Pernamitta <<quic_vpernami@quicinc.com>>


