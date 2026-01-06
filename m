Return-Path: <linux-arm-msm+bounces-87617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE59CF6966
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 04:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 740A03004511
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 03:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A69223DC1;
	Tue,  6 Jan 2026 03:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nkUxsVlg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3C7145B3E;
	Tue,  6 Jan 2026 03:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767669155; cv=none; b=b45XXWdbj2cyXccvcbOaiesmyWJXbipfb30Imk6sEmFDG0hy9MBSrbJsorUXAS5S3xhzJ+nlzliWl3CuurD2kqxceO2JPmw4npcHq+YXB3Mek4LiOgXRG3bIa9Uk7aMY2tgTDDFntewANYjOf6EOOn9T9nrsKFn5xHwBCAmEv2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767669155; c=relaxed/simple;
	bh=vVNGnbrCpo4KVw5Xq+pNi6/ndEtWTEQkqknewAlzLSs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MBILAQO1EdhEnBywgUvxrPvfVoH/5J74m69ZGzCDkg38aJj4K1WnWjbqOf7jQZY/+8vGkNpM7MbLWNsm1F3rIu9CSPhmWGmnfL/VLlpKdVJ70nQeY79V9mdiPLvTJ5kYHC3jvnZFESGEzeOveQrQITs0FG/3T2S2VrdKWI3052Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nkUxsVlg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nJGc2943603;
	Tue, 6 Jan 2026 03:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3kiM8B51HOZsnCP0Sf2Nec2S+PJWkkNK9GY
	mKLZybKU=; b=nkUxsVlgwzvcFKSbTfE65Kz6t02YhsGbcKd44qjI1McPMxSHxNW
	qmZM1L3pLCE9hjPYvK8hd1fJex8QQI1l9/U3wJR+yb6NSjDdctQIAZzWi39qQiUE
	06um/uhula/i8iKCZLlWAiWs05So98Q110xWVbdAUCSIFR9QXDpElYgMrCxIpVqz
	DhcBDRz7OknTsEFP+TUCtcSQ8j+ZmiTV8JPdkDJ1Sa220AjyvTw2ttZND0eVlxCc
	x+FLKJkfcbc0xZpkT2qNz77pU2FOEKINOlrPh0EFehVIUAdCGZSotbnd/+1KJjKd
	57wLbFAJGDU3wiR9kwkeqt2Bq9JyJQFMZgw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv01s0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 03:12:28 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 6063CPxV023790;
	Tue, 6 Jan 2026 03:12:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4bev6kx4ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 03:12:25 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6063CPfm023784;
	Tue, 6 Jan 2026 03:12:25 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 6063CP1R023778
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 03:12:25 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 77EE9235D4; Tue,  6 Jan 2026 11:12:24 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v8 0/2] Bluetooth: btqca: move WCN7850 WA and add WCN6855 firmware priority selection feature
Date: Tue,  6 Jan 2026 11:12:21 +0800
Message-Id: <20260106031223.499706-1-shuai.zhang@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695c7d9c cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=3rVLPgN0mCaywZWmVPYA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: GWK6ThUK6iOdla2THRjfccMV2rxKoxsu
X-Proofpoint-ORIG-GUID: GWK6ThUK6iOdla2THRjfccMV2rxKoxsu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyNiBTYWx0ZWRfX6Rc971zXYR21
 TQ7ctAmOx8RhK5JJvny01BrSdHlLDPRCCFi2dLN/yyD7QicZ1QgCioacPakXe9/HB7F22nJ4BRT
 sbn2CiTCJFCTCE9hICIEto8rFF1EL4CCqAUyBLRqKN18NA85FEDI/EpnyXW3Kl0FhGAW7fCFOMQ
 M0zl+R7YcanGYRLkPT4aps9kGVoucWop+fqDFKU4eT9a9AFkGFm0uUccRY0L5SkqwvqMiaPxgFG
 VeBILug6ME1ZzIOD+X5acNdW4d5iGjk7RAbRJtOLjRizbyDEsrDjQbfW9+JQfCkYeMAfHXpQuZd
 +zQX49v9n9LF7fC7s1q1mUWnCT1jW817+J0oYT4zfm3IgbfKAo3ej0UpegKeSESsRsQQUVtwu3a
 fuGdncGiriyzaI1cukJotpkdbSmmnlrjl6+U8NSFJP7IMNf1HQjzGV6MGt1J3b9J7qpaOIsabeJ
 e78H6i4oqX1vynnlcMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060026

patch1: Move WCN7850 workaround to the caller
patch2: Update WCN6855 firmware to use the new FW file and added a fallback mechanism.

Changes v9
- Add Reviewed-by tags
- Link to v8:
  https://lore.kernel.org/all/20260106024806.480779-1-shuai.zhang@oss.qualcomm.com/

Changes v8
- Add patch2
- Link to v7:
  https://lore.kernel.org/all/20260106020738.466321-1-shuai.zhang@oss.qualcomm.com/

Changes v7
- Update the if logic for firmware retrieval failure.
- Link to v6:
  https://lore.kernel.org/all/20260105055646.3816296-1-shuai.zhang@oss.qualcomm.com/

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

 drivers/bluetooth/btqca.c | 60 +++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 24 deletions(-)

-- 
2.34.1


