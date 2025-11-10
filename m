Return-Path: <linux-arm-msm+bounces-80899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FFCC44DA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 04:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 42DAB4E2109
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 03:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20603285C96;
	Mon, 10 Nov 2025 03:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zh9oVguS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CD926CE06;
	Mon, 10 Nov 2025 03:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762746109; cv=none; b=JtIaM8fTP/Xla7iE41iSW7pQKH/gMTAwQJ/d+yvQKY7Cy95DBOzH9BxiyBjlOIMkaq9HlVP22DdYejHHqyGo1J5IJA9UnsUHj1GTRrb9kE32n/+UrnXM3C73MKAD17qWKQntshCfERV5Xxn/I/25Tcy6qpTVVhKKrQuaWLWKb/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762746109; c=relaxed/simple;
	bh=PSLZKd9ah2HF9P9CJVgNLBGyh5cXlvJguICr7JIeukU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=niXbSI/GR/XXetQXcVQK3Q1PyImxxmM/pumto3QqzKqYKRPMBZLtIC2HVa0tYw8VtmxrWJ9eooGbIeOoSWOnPewUWj/pgDPj4a4CcwKDB0pbkzQ5ENM/JEeegkraqVc9gEK5R1IOb9O/A+u2v2g+u7c6+ziGwM1gUGZ3F+AXL80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zh9oVguS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9NvOkb1672507;
	Mon, 10 Nov 2025 03:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=I//g5Oo3nlbrIPB4+qDk6xkOrk6YIL3gE0T
	auqAqbS8=; b=Zh9oVguSG54bm/HY/m+7H/Db5xnKNifPzjvypljXYMVmwozHi0c
	FnLBw6rCR59+NevrKuRvnaT6+8tcvuKnhM6N2ZOlYS86vJ2hvolyifI/QBlQQk10
	VNicP3RVpBE/qanryD95NwgivLIb66NK8TnHxyzYbN+PftwbOZ7Vwh0Qxatk5qgW
	XFseF01IwL6ZHUdpWVcwQAuieFvGLU29jlxDmckN0oouv0t/+ATRSTvD/1NUSysJ
	BdvES81+0fCP5aFR9XNkPvdAlXvzk/Szgfu1TK7nBt4yxwUhBgmY/KSqxxTLKf1s
	qIakjW0XIo4rtopKvSQX82ceaQ3QdWFtOAg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xs7ba9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 03:41:42 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AA3fetQ006185;
	Mon, 10 Nov 2025 03:41:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a9xxkxkkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 03:41:40 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AA3feQB006180;
	Mon, 10 Nov 2025 03:41:40 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5AA3fedk006178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 03:41:40 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 5C35023296; Mon, 10 Nov 2025 11:41:39 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_chejiang@quicinc.com,
        quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com,
        Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v4 0/1] Bluetooth: btusb: add default nvm file
Date: Mon, 10 Nov 2025 11:41:33 +0800
Message-Id: <20251110034134.1016537-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-GUID: h7S-jt_uOT19lBuUCJELtzlGSGl1EHh_
X-Proofpoint-ORIG-GUID: h7S-jt_uOT19lBuUCJELtzlGSGl1EHh_
X-Authority-Analysis: v=2.4 cv=LtifC3dc c=1 sm=1 tr=0 ts=69115ef6 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=7ROp174qnhEf4X4c8SkA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDAyOCBTYWx0ZWRfXxIk99ctO7Azq
 0aJXJBXTWZmyQUqynS7Rdk3NWIGQYaos4RN0sd2dKvwBfHRfqYCXJmlQOBkBkofIcdnO/v034/x
 0NjCDle2YxwtgQEh+Y5PGwKdUxgVia31n7ug+e0RzL5fA6w5Jj6+08GSmCsKOhjV05+qu8PPKlF
 AQl4yR3ZaoQlyKLk0g805kAQ2Yyfipv0Pa8es32gpNfxT9S0KYZYwMWUOVxK0FdQnrLq9bOPLF+
 pJjV0ppXvpcXy1+7EpoFM3WzJYTfI3KfB/CNbEWy5oJWyWk8kMu0YrAK9m+L9WEntv5FiFtLBF0
 jvhA3TolxpOl8ECBkWsgO9B4/RnHyIVoUwoQ1uVHS330eXhR7YAOh0Q7IOUI9XzLYmVnRpblXmx
 1S5z/PdvDPNnXdo+Ol8PqALsOs6eBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100028

this patch adds support for default NVM file

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

 drivers/bluetooth/btusb.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

-- 
2.34.1


