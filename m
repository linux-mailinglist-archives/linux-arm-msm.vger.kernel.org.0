Return-Path: <linux-arm-msm+bounces-87370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAFCCF2072
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 06:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA4F530053E0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 05:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8991032471C;
	Mon,  5 Jan 2026 05:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHrbPpB7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D71325711;
	Mon,  5 Jan 2026 05:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767592619; cv=none; b=ivzENUXunBbauLWCZwLxraSsNtxY7N6dQLQE0Iu+TW4AMkn9/0fbRsF1GqwxUoQ6tNfXuhFnJaZxAeoqqmPvyEZ+0PFX4YjoP53SpWC6biC3uZmXQejKiDrhJ85ElepOsrmSNRKOjxFgH21UhDHrzsNi/g0VZyHRnXdixjYMemc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767592619; c=relaxed/simple;
	bh=jFZS7/gYR2X6KKcfk7yiXjImdecibutcOFZMz7vkJEU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GU6zEBQXWAFSM70LtE14D1QZOg62NQqnRd/B3R8AYwzEsKuf3XPULG4Pe3PccS3M6D3PDAl/K8ZKZFEiAymucJlu0ULv1IiHSoF8Q2hsDjFQ/gruci8vZHiv9hKEVZgMqbI2mVswB/H63EYN+N1VfZbzt0WPadC3K2jEt55CR50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHrbPpB7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604MtwYn3874963;
	Mon, 5 Jan 2026 05:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bUupRAGvbXJGdVyNbznsKNNS89fABR6vKQh
	0Xg8/HmE=; b=RHrbPpB7B/blhH3lTQ+ydwYzowDp6uAMArgenusSTNm8uLBviYk
	oiOLWI2ZjcAMrLNSJsToyZzdVLoi1mdXJK6lrBhR09m2Zu991/P0yY+vIH59cYLD
	gSkuvlbnHz7JDg2D/t2ciGw9iOD+bHZztdWj70MiHMF8Y9Cr+7400BZq60bqnpyN
	op1Dr/8pYqm4ZEzbnmU9jPKHRhr4z/7Ojiwz8dHD3gsfQdWxio7jXA2jogpi86x1
	ajt+X8JnM0PqnT9JLK/LEIs9Rr3jGNvspeJ+eEGaJUFt8vFHHXHDYLXm5IfGCzRU
	/7QcNYzYzAAdb5BXdZw0a0fhMvTKCjKlaQw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bfyx0gt4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 05:56:52 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 6055unHJ023091;
	Mon, 5 Jan 2026 05:56:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4bev6kqfh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 05:56:49 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6055unsK023079;
	Mon, 5 Jan 2026 05:56:49 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 6055un5L023078
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 05:56:49 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 78704235C5; Mon,  5 Jan 2026 13:56:48 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v6 0/2] Bluetooth: btqca: move WCN7850 WA and add WCN6855 firmware priority selection feature
Date: Mon,  5 Jan 2026 13:56:44 +0800
Message-Id: <20260105055646.3816296-1-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CZYFJbrl c=1 sm=1 tr=0 ts=695b52a4 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=3rVLPgN0mCaywZWmVPYA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA1MyBTYWx0ZWRfX3u8CAOTVRcCP
 sy1fWDlZi+lgxh/SWyayYYhqz9RdqoUcJGMNB9/5Vlx6tHDTmmwLGbIniPtrVD2w8/pLZefKt5t
 3TaQRQqN7b2YYXTkbpdowoyQnYHyIi8PuLRX9RYtgNMWS4IQErUstdBF0BtprkBcWc1aQvTFOnv
 XSwom1ybuptwNamdyiTtnkcz5XEkYrRekhycawKsviynAdb1A3gBWT4PUO4hY+6sT1454/WLTGe
 8iA0kC2hBLYddHYx5DdQ96LUZxVxv3xLiQ1h/Qvn9AaCUlBwB55x9/JJmo++/j5ME5Bmcm/qso/
 XYFc1I6uD5x4TtjXLG1CxZ8tmiRsTF5dHI+32bLnHA7UPRCyubAkAgWfdumu/wU01ezseT0zLC2
 +mR2eUNrxiE2dt5USl+GfSSVrXbXGkDxDwORalTn+BTlf0cJtJOY9qaGOCm+kQxgicnbGqUSPhr
 x+cNAeAmsSimjG2XJhA==
X-Proofpoint-GUID: pqO9YbsJ-zbXof9CeTV0OnQDEwVjrNDM
X-Proofpoint-ORIG-GUID: pqO9YbsJ-zbXof9CeTV0OnQDEwVjrNDM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050053

patch1: Move WCN7850 workaround to the caller
patch2: Update WCN6855 firmware to use the new FW file and added a fallback mechanism.


Changes v6
- Add WCN7850 workaround details in the commit.
- Reduce the logic nesting level.
- Link to v5:
  https://lore.kernel.org/all/20251231075817.2611848-1-shuai.zhang@oss.qualcomm.com/

Changes v5
- Separate move WCN7850 and add WCN6855 fw name commit.
- remove WCN7850 unuseless condition.
- Link to v4:
  https://lore.kernel.org/all/20251226075621.3223336-1-shuai.zhang@oss.qualcomm.com/

Changed v4:
- move WCN7850 WA to the caller.
  handle cases where the firmware cannot be found.
- Link to v3
  https://lore.kernel.org/all/20251117021645.712753-1-shuai.zhang@oss.qualcomm.com/

changed v3:
- Remove CC satble
- Update commit
- add test steps and log
- Link to v2
  https://lore.kernel.org/all/20251114081751.3940541-2-shuai.zhang@oss.qualcomm.com/

Changes v2:
- Add Fixes tag.
- Add comments in the commit and code to explain the reason for the changes.
- Link to v1
  https://lore.kernel.org/all/20251112074638.1592864-1-quic_shuaz@quicinc.com/

Shuai Zhang (2):
  Bluetooth: btqca: move WCN7850 workaround to the caller
  Bluetooth: btqca: Add WCN6855 firmware priority selection feature

 drivers/bluetooth/btqca.c | 66 ++++++++++++++++++++++++---------------
 1 file changed, 41 insertions(+), 25 deletions(-)

-- 
2.34.1


