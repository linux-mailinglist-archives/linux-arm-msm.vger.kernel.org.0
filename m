Return-Path: <linux-arm-msm+bounces-81799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2508AC5BF43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 09:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A2ED34E2A83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 08:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA3623E25B;
	Fri, 14 Nov 2025 08:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MI02RcxT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1083C21C9E1;
	Fri, 14 Nov 2025 08:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763108283; cv=none; b=XYNLeYjsDEcIkhiuEy8QY/mwH693bKut1qrs0+ykMXQY/QnTXNL4SyEY9s2gDKPLkpguhWn1wpuW8y3AP1URlcH5DGuCd7FeMJbK1RPwltCua2e/qN3P6AmQ5fo7Xbt9PQivXC95NQBg5NiadFjrqeI5K/lUX6mPuxZ5a5OZFCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763108283; c=relaxed/simple;
	bh=qDEtVWuKa3nNq0TdHsWA5DtCc8KzkRxwXXfPKtQ9XDM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=irMmz5NdVVOJ7s2IRB5Maq8YM+zg6/BQsUNMzvW1xWT7C7FRHE6BOP+pa336zUISo7Tm7YtRBCMUgChZrT42mTCXQU6TdSYsqeg6LuzKZbdcrFOUTx3mCDx4LfsJr4KEPrAvJYcFFdAhViA9LJXAXCzBpQ2sF9nJDE3m3YFj2PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MI02RcxT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMb0kF1428363;
	Fri, 14 Nov 2025 08:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QzbJkE3oSLkXlG8DWAR5dymyilF+zia6V5+
	I2vEt0As=; b=MI02RcxTdPhBdlknLciq30zGJOszl4HNGwmGlLxeEXKuK+gAL9b
	+KNlNAXKWrvc5M5SWui5Q5DTefXFDESAuj+9FzPdY4DwbeTJKAH/iVN4zLG1DoNl
	slC5Ag7RNnctocehE6XcO8rVrijcGHN1xDVef4mAQdCR6OG1NXM2nZV4o95qnfCH
	nhNsSa/xVsopsqWoZkpYL2eT0iKk56GwOgesTKDHbSN4uz8NXrBl3HLQp9SZK/qp
	oKgjjePJnTbk+WPeZKKVvdyWHOkqKjvQFBWTIXca799nBDD0bP3WGG8PjgjxBK0D
	zPgQtGkhBnzSUtJECJeIbPJHXvSPYg45RIA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g1bs9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 08:17:56 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AE8HsUv016497;
	Fri, 14 Nov 2025 08:17:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a9xxn5rja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 08:17:54 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AE8Hsje016356;
	Fri, 14 Nov 2025 08:17:54 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AE8Hrnw016353
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 08:17:54 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id D6B1A22B22; Fri, 14 Nov 2025 16:17:52 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, stable@vger.kernel.org
Subject: [PATCH v2 0/1] Bluetooth: btqca: Add WCN6855 firmware priority selection feature
Date: Fri, 14 Nov 2025 16:17:50 +0800
Message-Id: <20251114081751.3940541-1-shuai.zhang@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=6916e5b5 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=042h51yfOyDqjzMtcBEA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA2NCBTYWx0ZWRfX5QPR+2xmsbH+
 RTOEenc2E64SMb5nw7X4CWcYVF59jguksETLinpV/XQFmrQG/ir7x8vFqQC4xVXaskjl/Y8JHrS
 mqJx/oKUMvlYAkfpI5hKtopNaCWf0jJq8gb590Ks5cvQAb2o9Ae4+o18mhkmh3uMB9hld4DqfQu
 ZHrgDktBmZp1yJlY3LKLxrMT83Ih82eCLUkuDyhHtRWlM3m2FyGpQIOGToa/iiaT4oHEXOIxV5s
 3TvSQin2oc0IilhAJzd08SJ7yqj9Zhp8Trmblr/Brk3exe4B+gflA1mc8+zRtcmsyVY5tb7NbVg
 Ib69yzhO5JzTiSClWPx+tHtn4tu/jG4s0AxsN/9ZKP1ohm1aGEVVfqC/CBZmDKIT/qg0H2JEcE8
 SUeBALCyvY3E2e7a6JwHykYQMIPQFA==
X-Proofpoint-ORIG-GUID: AQ51e088eEfbNqeg60lillmFnL4wgcg6
X-Proofpoint-GUID: AQ51e088eEfbNqeg60lillmFnL4wgcg6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140064

Fixed WCN6855 firmware to use the correct FW file and added a fallback mechanism.

Changes v2:
- Add Fixes tag.
- Add comments in the commit and code to explain the reason for the changes.
- Link to v1
  https://lore.kernel.org/all/20251112074638.1592864-1-quic_shuaz@quicinc.com/
Shuai Zhang (1):
  Bluetooth: btqca: Add WCN6855 firmware priority selection feature

 drivers/bluetooth/btqca.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

-- 
2.34.1


