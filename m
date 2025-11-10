Return-Path: <linux-arm-msm+bounces-81021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A738FC46DA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44A763AD990
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 13:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2F030FF37;
	Mon, 10 Nov 2025 13:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iKpfjykn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D72E22579E;
	Mon, 10 Nov 2025 13:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780955; cv=none; b=LsORHsLCEtXr5J8sS99/wAgeqx5bkOsGUIMB/xGyWR50ysDmcgsh8GrOYKSlHvWMu8Z8wCUDCrNl1epD5j8k38+DqufnVP7sK3B9zaCy5rDwLM3vbUP8KXswEoBpoAZEIaE5IaXmicUryLGLxETKszdMZC9Ja6TXD+BmhgruN/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780955; c=relaxed/simple;
	bh=36vCbS2vYzF3LpkQ7TlzciSZQJfkopGCnydOaTuN9+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cRPUwTiiAymAYnNCWKk0KTO8G4e47WV/s2furZpRvmV+YL+JNxJ1Dlyvp2jBxr7NOS9swVQ39Sgk0WdPyVAWOkd1EaArNdYSVM1Ogy1UYGDCsdpUr2rCNn67nLDDjN52F7Sah+IUY3Zf1t7MgbxJbndlgF0P8/BhZ/dxKixESog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iKpfjykn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA8YAEj1809151;
	Mon, 10 Nov 2025 13:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sK/i0irK0iIhzC4TOZwagUB1GgyOaAndjF5
	GiHP9QO8=; b=iKpfjyknGJhfZ4fWiEIgTQuhUmtT/ntqNasj+gG8JrzGQFE68cL
	/W2eLkgdIYbyKW7xCdt3pmOJhMpTyD7mdhbvytLmbhbtx4ZCn+C/j28Fj6Vder0r
	TXOBqZB7pxhdyfS+LNZ0+ryOUO1DmzrenL9Av1y4n3DQx0kTmsHWl7m4PQbIWeUO
	szoFMSUji3PWMyYJdsQEw7bHORPY0HqIgkBKkWom5NFcr3KOTgJVvwXkT+RFX/zc
	jwQpUMi5qnR/sAloOxNsSvF/Er6dqjKN+XorO8NKpT8MxKOQsuMp9AgdiwtqaB7Z
	cEqLSg9DpOuPip239B/JQ8w+k9FN8ZsVp9A==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab5m1j04q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 13:22:29 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AADMRUe019502;
	Mon, 10 Nov 2025 13:22:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a9xxm1g4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 13:22:27 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AADMRoO019497;
	Mon, 10 Nov 2025 13:22:27 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5AADMRnq019494
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 13:22:27 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 23D142327A; Mon, 10 Nov 2025 21:22:26 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_chejiang@quicinc.com,
        quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com,
        Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v5 0/1]] Bluetooth: btusb: add default nvm file
Date: Mon, 10 Nov 2025 21:22:24 +0800
Message-Id: <20251110132225.2413017-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDExNyBTYWx0ZWRfX5PI6qv5DNwLk
 8Snwd2wFVRfCF7oGIUZPfcCp87khFBR94u/61qaCkttDHQUSetpphqvwWhnMA90peH8H7gkoohC
 qVikXBxs5Flr4w9eYw+nOo6DCTM2ADXMzc9n6piFEaVPxyMYJgRbKrAIgkomlglQsW8syOwz6g+
 bvfq1SkZjFDwheAIsOrzP6vx3yLqMIGZb47BIJr2uCz4A44IqmZo3x9AW6hKlsiBVKPOU4uH0Sd
 R+TCr/htwaEVJuPqAhnypg47BPo4FBHz6XfBDnu4Kl/po++kc65G5MPG2+p3fk8tWMeXdhiKbEA
 MFL0kYA1mvxjz27FryEhDXuqO/DHgRaFSuSoU5s+6/5hYNY2BRZMkhO33uIuFDcVCQJGYciGMbm
 Ixmd0RqKRGewltvPQxH0PNUj5x/5aw==
X-Authority-Analysis: v=2.4 cv=TsXrRTXh c=1 sm=1 tr=0 ts=6911e715 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=qP7qNcz1gjsOBvW2A58A:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: _Fvu_w7ZiiEAXJClMPvUVjwCCA1K22cL
X-Proofpoint-GUID: _Fvu_w7ZiiEAXJClMPvUVjwCCA1K22cL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100117

this patch adds support for default NVM file

Changes v5:
- Explain the difference between the default NVM file and the board-specific NVM file.
- Clarify that board_id is required to select the correct NVM file.
- Link to v4
  https://lore.kernel.org/all/20251110034134.1016537-1-quic_shuaz@quicinc.com/

Changes v4:
- Remove email CC @stable.
- Link to v3
  https://lore.kernel.org/all/20251104112441.2667316-2-quic_shuaz@quicinc.com/

Changes v3:
- Remove rery, modify btusb_setup_qca_load_nvm, and add board_id to enable the use of the default NVM file.
- Link to v2
  https://lore.kernel.org/all/20251029022955.827475-2-quic_shuaz@quicinc.com/

Changes v2:
- Add log for failed default nvm file request.
- Added Cc: stable@vger.kernel.org to comply with stable kernel rules.
- Link to v1:
  https://lore.kernel.org/all/20251028120550.2225434-1-quic_shuaz@quicinc.com/

Shuai Zhang (1):
  Bluetooth: btusb: add default nvm file

 drivers/bluetooth/btusb.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

-- 
2.34.1


