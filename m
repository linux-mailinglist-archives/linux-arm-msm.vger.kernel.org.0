Return-Path: <linux-arm-msm+bounces-87501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 158EECF4119
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEB0C30141EA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81D7349B17;
	Mon,  5 Jan 2026 14:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSvibXCS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C80E349AF4;
	Mon,  5 Jan 2026 14:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622479; cv=none; b=nC6UBRJuLdo6VcZ4uT3RPZHFp+s3xlQrDNC5KRg417ejvFbsxgsAaZDXTm1+8NKCTe3hoAmRLTbGNnop4ZX56cqZcB+A7lqg6hvMBlKM/snHvzPV0PgMmlxtsd34BjApdDsAREF9+k8/LKTFrzNgcJgMiybeSQRDtrPu585ig64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622479; c=relaxed/simple;
	bh=nTuQTI5thN9hQp+3u5UNUqXijoP2z9CCC7DOm9KwqVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ocdjrxG4hXZhVuT0tzK28PvLksB9F5F/+90PMFHP/fEuDwSWLcI2GeGkJnqLPjaP0vwaw2qeXqAg1iYsJpvyQlFyCtpmCS5hoXuopsJsO0Gpj5kepT4sfMROKrYG6z70clgTRPxKOUjyNqnPSYNbHjR1c9qp12M9WjbZ0vmib9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSvibXCS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059co3n610507;
	Mon, 5 Jan 2026 14:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DOy1T1cgxXJFpH9iWILA9uOZgkRQON5sS3d
	2y+xunqo=; b=jSvibXCS6RWRBqawhrG5SYcmk8MxUEssVEGmmIgoCetqcvRp5Ma
	rWAvYA1mRttYV0NhpZVWlkOjUp5Khb1MJIBQKiWZsOPj9seMIzucrGlqWvtQ/T6p
	VZyCUWO+7nzEfB3VOBLMxDbcgep2DiqSqaAfWQEal9S06KR1TSEZ7ylMS4JJ/i/I
	EkYFVbWK4Jfy1p2EYzM7AFjl6pe+dENMbipp4TpGBjLa5Y2HJR8WWJc7m8dkjzCg
	S9Ep1Sg7xUaGIk8uXxDR6LsKGpZQIaMGAvFOulOGSIWc8LCaFoXIH5Q8pJ2YabJe
	quDhmZWIRph6GetNw/n+UDk5X+ih+JOC43A==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgaus0nvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 14:14:32 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 605EEUHn012358;
	Mon, 5 Jan 2026 14:14:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4bev6kt384-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 14:14:30 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 605EEUAH012352;
	Mon, 5 Jan 2026 14:14:30 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 605EEUbR012349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 14:14:30 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 5748423A8A; Mon,  5 Jan 2026 22:14:29 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
Subject: [PATCH v3 0/1] Bluetooth: hci_qca: Cleanup on all setup failures
Date: Mon,  5 Jan 2026 22:14:26 +0800
Message-Id: <20260105141427.196411-1-jinwang.li@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: UYeIJYPQGZouo1AHPQNJTy4iQ8vSopB0
X-Authority-Analysis: v=2.4 cv=DP6CIiNb c=1 sm=1 tr=0 ts=695bc748 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RZkearZ9ixJul0CvTTEA:9 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: UYeIJYPQGZouo1AHPQNJTy4iQ8vSopB0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyNCBTYWx0ZWRfX6SjlJAYm7dZA
 G/nn8W+W5OnmDK22pmM0s8MUn4gra8s9NYJTOXjr24b/RqwEiRoU8BKmMPZt8hO5c0zUz4xzct8
 o4mu0JxjzYwUJ1bFwQtH5jG2ciO9q/hXGMMFbFqfhOSO7ubZt8X61NVjcsfbqMPZeEsU06Sj8zQ
 l3n1Rn+6XpTCx8iQtDb3LxM5b4avR+EzLs0cp/bbJiBYEGO0/l/I1+l23k0BzKl0ZVHcD27oeWp
 doYpwxUVcdOiqM5hlcMul5KzB1Xo9qc0ObbJ6RxVQ1Xw4u3sEnxqNWd0giOtMnrZSjReaOF6Kwy
 25PS9rmn16zMQ/R8A3c+miGJizvctFIVoG87ZYheb+99uqHtWBW0Z3cYvfKPQ1osk77JW1HzNPl
 ku7TBShBWWMLvjPvvGnXNzY3nPq8S8/fqQEJaEREetUq8tZiX66e/AmP0EuOBj01fqcNh2kQ5lM
 ZrYoMu4n0Mr8WwrvJpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050124

The setup process previously combined error handling and retry gating
under one condition. As a result, the final failed attempt exited
without performing cleanup.

Update the failure path to always perform power and port cleanup on
setup failure, and reopen the port only when retrying.

changes v3:
- Update git name.
- Link to v2
  https://lore.kernel.org/all/20251226102707.3449789-1-jinwang.li@oss.qualcomm.com/

changes v2:
- Only reopen the serdev port when retrying.
- Return on the final failure.
- Update commit.
- Link to v1
  https://lore.kernel.org/all/20251222123824.3000167-1-jinwang.li@oss.qualcomm.com/

Jinwang Li (1):
  Bluetooth: hci_qca: Cleanup on all setup failures

 drivers/bluetooth/hci_qca.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

-- 
2.34.1


