Return-Path: <linux-arm-msm+bounces-87599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E38CF6699
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 03:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E77AA3002B97
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 02:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AEB224AF2;
	Tue,  6 Jan 2026 02:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWsP+kKY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F8E53E0B;
	Tue,  6 Jan 2026 02:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767665270; cv=none; b=jdWqWpieW4DI8ykjyjDSHun9dK6QRvkqHPwmWRb3GCWomrEpxf9CxnGaukg2xmkIJTabyAoKrRTp21asKPXJHyFwLAJYzmTLBWQ84egyTwfejSvXi8O1Y74H5ox21GRgBrFrqp95ovVNfWBjIOfLSMTMzXKm/ehKOh2PVZ9ESwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767665270; c=relaxed/simple;
	bh=yeCa1d64klRuyQh0NBbKq+Dzx3ebdPjRSbETulczcz8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pgVAk6v5a4SKFrNcCXKYRU6m8hoAxSBynTwN4skmhR/nrSf9sruEXQaaWf4KWTmDgWM+QccZAbuNlsyrNPQG72Pu0c94of4ZnxSh7EH4zjblIyHdkICFNxHRTYEhCMQliXbBDRmGsjy4LE1t71B1qZbvYU1Tj9jdiJwM9pJscV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mWsP+kKY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nwjL2727189;
	Tue, 6 Jan 2026 02:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nalhBWTgKtQODqHvCSY0ANmE4k6Jz0VK9bS
	R12nQmHE=; b=mWsP+kKYcwaiyoq5mZC2dhWy1vwPMQcBcOUyk0b0MahgdWICW15
	a6PIqdEDkwRwAm7GPHFby1DEKyLo8TD95N2bn+eL221tWzvXi4aVGB3uu2AooYV+
	2eC1N73Nh5SNAuSyLZP93SqMTLn6InkKxVROqnnfwORlvLpb3Su5RO28xxQ1KnFM
	bE6KOtjSoGQC/1WdCvCG1zbsZM+mSZ6k+VwXiYmK3l1rKFiaBfooWKwoTNwAKEsQ
	emRcGNf36jzllHbaWyAOndHisXrSI3vVIrzaCG63X/L8hIe0dxry7twgUWPiuB6F
	QvhPjRarOkCf5BTVMs0IQdCgmMyzVIHCTxg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpn9rbqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 02:07:42 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60627dhP018708;
	Tue, 6 Jan 2026 02:07:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4bev6kwsyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 02:07:39 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60627d0o018694;
	Tue, 6 Jan 2026 02:07:39 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 60627dnx018691
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 02:07:39 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id C7773235DA; Tue,  6 Jan 2026 10:07:38 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v7 0/1] Bluetooth: btqca: move WCN7850 WA
Date: Tue,  6 Jan 2026 10:07:37 +0800
Message-Id: <20260106020738.466321-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: N0hR3q_dxrKM_GZIokuywabYTqd_AJec
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAxNyBTYWx0ZWRfX6Kay+38//u4i
 XcgoxMmmMkUY35YdnfVd2mTvWQ08IwKki3n5MhRoyUSI+SZtElKiGky9jklzwWTeVWP2sDTmUqD
 B0j7mduKGaFM29dYqddK0rfqvNdcc+WVpna7Qpu2hoY8I6424sVQQOSmpHwVITQ+B/jwy0091CA
 e3jf3TyVkoq2v1QnRk1BtsoG2vBpMvEHWhLU6qokPrQ5xEER4wHfxTPQV89oN20Rvnb2Ez+Ru+M
 2lp0btp3qTkDFn1jHbWflE5m1ckg3GSyyL95Np2frkGUEMfxbcNtXNjld97ksjaSeyUbfEvVsRU
 9YSJZTMREU3qwjiM20fWLOOwKzJqMNIn6mxeZ+FeFDED3CxZTokN2ZQ5hwjhTrLknC1CvemRpaf
 8gVIrx4KMakaxIUPM8J2IQb8NifVz9xkocW4KI1v+w5UZ28yas/GGWCpB8Bmq6QW9Rkf8o3kSvT
 jRHMFGXITSa/NPak2zQ==
X-Proofpoint-GUID: N0hR3q_dxrKM_GZIokuywabYTqd_AJec
X-Authority-Analysis: v=2.4 cv=KfnfcAYD c=1 sm=1 tr=0 ts=695c6e6f cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=3rVLPgN0mCaywZWmVPYA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060017

Move WCN7850 workaround to the caller

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

 drivers/bluetooth/btqca.c | 66 ++++++++++++++++++++++++---------------
 1 file changed, 41 insertions(+), 25 deletions(-)

-- 
2.34.1


