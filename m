Return-Path: <linux-arm-msm+bounces-87608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EABFCF6828
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 03:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25A04303272F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 02:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2EBD230264;
	Tue,  6 Jan 2026 02:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWjhvFAj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5852120F079;
	Tue,  6 Jan 2026 02:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767667701; cv=none; b=Hva/ehJtrlAAjB4gh63LB1N5ZMX9RlTU//aA8srkjpTQOK5hbf5ERVtl5hA+faHSJUr0LeJAg66G/TmLPz30VtKLXpCj7Snnffwd3WnCxpuJYV6z6LLdLCJ4kwcXbho5BEboigOX36LGiB2G0RbRrVMP98T4F+qRqPet4Nnl0ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767667701; c=relaxed/simple;
	bh=QngDbXCmZX6IwtzYU0cwW4pi5V/2e4TGdwN2uiX9PPs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iwZWOry4HwTSqbAy//7GbcDY+8oqtZF9BG0D5LSwMM0RiWHSZ3n5XfkmcM737LCJb4EcLWzv2g822uhLStHbsM3Gyk+gO1GQFrXBMiQoDMsdV/tg9Ljkufz4Pe25ov/V+sHqszOkwaxLYHC5Aa7xqjvk+QlujKCP+N11UYJqEQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GWjhvFAj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nC7j3114781;
	Tue, 6 Jan 2026 02:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TFptgeff6HRedvYtfQMvVADmk2cUaTRaHtd
	fcflqVRA=; b=GWjhvFAjCwOj9KvQWcPFnu2wAHIofwp39OM5ofMBFK6zU8ww7u1
	HD5hiyqBPKvU2A4iV+1+RU6YR+4ZcpK7f94Y5rKkDOadbXmDuXzNUW5RjgVoUMlY
	XLu00iZlaEnD4I5E/3XyD8WrAn4RDZjHUxMeUKEOhevNCE/wFqhWWXVEhes9iggm
	na/3L29o41gZMXUxD3NetNXJpQn6+HhrE3r7yAEpkEk3veyNxQK59fG47hS93u2K
	pS6yem3hR71c1aQM+saGqYIJ21TrJqXcU2tLXjLYSaVi7wAfJbl//iekZXJShlAE
	hBXzN8EFffE7fbVxavXZhfPWBC3P2fKOA5g==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgmnh8s0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 02:48:14 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 6062mBlX027334;
	Tue, 6 Jan 2026 02:48:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4bev6kx0mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 02:48:11 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6062mBOM027328;
	Tue, 6 Jan 2026 02:48:11 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 6062mBSs027327
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 02:48:11 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 79528235DF; Tue,  6 Jan 2026 10:48:10 +0800 (CST)
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
Date: Tue,  6 Jan 2026 10:48:04 +0800
Message-Id: <20260106024806.480779-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-GUID: iEdzQkB_mDW7L-mj_DUHggKerOY3Wv_o
X-Proofpoint-ORIG-GUID: iEdzQkB_mDW7L-mj_DUHggKerOY3Wv_o
X-Authority-Analysis: v=2.4 cv=Vscuwu2n c=1 sm=1 tr=0 ts=695c77ee cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=3rVLPgN0mCaywZWmVPYA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyMiBTYWx0ZWRfX1mWs2gklftaZ
 oShQHWTl9gfy52o+A4xWq9IAtepxiopaflvXqgQP40w5ucBFkow2elqHdfY84WM4M+0XZVWlxEv
 WjheFzeWMdLJNIgFzp/e9ULMQrEPiFZzeI8FNfpUpD5acQaiVuIichhGVLjXlZdX3U/zGH5/mfF
 BeNEP3knXxCiiGaYQImM2tv7uR6+ibmMXeGguraS1AQm01+UqnixUBz8h0JxqVC8e9DdHVU+gIU
 IegrvOyWuad8pWhntcIEvo1b53Cuh2RyueqQZDAwiptf1X5AhXA7f5jLA9e6CLO1VYRfjGsLi6c
 2v9669RXLxEI1qcQTViGQ+IMV7AeqaRtto24KtPtTskkMPZWQGp2MTqlbJMk1+v4Jc6Ca2cc4iI
 lkjdoPqm0rpConJSrgNwNcCe1CL9q7hjnRob8YJ2cN3ZR77gJgyt5ZHufypwTUF0jDYIYKpOAeT
 ZR/9nQEWO0xmoDNK3cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060022

patch1: Move WCN7850 workaround to the caller
patch2: Update WCN6855 firmware to use the new FW file and added a fallback mechanism.

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


