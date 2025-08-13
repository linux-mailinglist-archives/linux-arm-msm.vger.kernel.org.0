Return-Path: <linux-arm-msm+bounces-68877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A74B23F0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 05:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F03F1AA649C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 03:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE59F26E140;
	Wed, 13 Aug 2025 03:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DQQ5y7+J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0841A275;
	Wed, 13 Aug 2025 03:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755056123; cv=none; b=mmYhmXItSBgj6Qv/kF/3XGiYHu2+e8GvVY/F3ZD0uXzogHmMH4pCj0kEnZMxklKI85o6yKeMinjLEFVBK78tnAqrWSOG44ZdL5oBIfPSbrm9rjpAEgmmpQDEa9/uBncS3cf6TCkEwnqrcK3+M2gvCwKZHCowudPXxn9IayJZG4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755056123; c=relaxed/simple;
	bh=UVFSq2NfQEcQ7U6I/xjBNj/XYwcpjhFm7taiAEFEW7s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BQ1CQWuB7Yy1bnVj74iSXs6fvACenj7wSXGHGdnWTRiFp5xVE8GPulictGIIPJyyo34P+y0HQZg0XSIp3aWg7hwvt2AzORcSAV81qSqm8F2cEhG9F6WUZhoh7g66RtMR65Cfj+qPKSOU/9sm2nc7Kyh6vrW3CBIGjgZkTR9P0h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DQQ5y7+J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CKWjh6032240;
	Wed, 13 Aug 2025 03:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=m0Bf/+gJ7mIVImLT2dm3Q8f6bebEXflri+8
	M2uFS1XE=; b=DQQ5y7+JNRS2FmjCDWJKwJdcZG/GSCsye8nbfhfpANtBTRXiEFl
	l/JbsdVHcjjHw0RVCPXojhFmxVMx/kZi4ZuYfvLFCqyUSNuUq9Ch162mPO3zVgSz
	+Fw7eLWPmnFBMEOvPWkkMKLf39Ivmy8bijobAMfPb5KDsqc5Q2Nr3zhd8+p9J3bD
	yR2jZrsnKjxuvhKGqpfUvRi+D8RzIOFFA54gIMggEgLNoY9qooLFVMuOe/aAPW/t
	baQZ4SVAvDbXj1tKPo9k60FAMqEalW0r0ZhK5SXgePdwoNQsZX5CMHNVncdMK4RG
	U0Meh992XxHD18tiBzvI/+S6TV9sX/IuhvA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vn7eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:35:21 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3Z9rA004583;
	Wed, 13 Aug 2025 03:35:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 48dydm8qjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:35:09 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57D3Z9NU004571;
	Wed, 13 Aug 2025 03:35:09 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 57D3Z9ke004569
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:35:09 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 94CB021D2A; Wed, 13 Aug 2025 11:35:08 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Fix SSR(SubSystem Restart) issues caused by BT_EN being pulled up by hardware
Date: Wed, 13 Aug 2025 11:35:01 +0800
Message-Id: <20250813033505.3868781-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfXxOeNvEqu+3o7
 MTW7ZQUr9O8a0Saw2vVtPCVk9kbnXsu31cygnZFhbn7/PpWaTjPckCQZDRFx9hmTOHIxBBKHPP7
 2Ez6Sz3O1C6xsyY7XJeNdBJupQpDh5+g0gnz/p6FGtLdXGXIS+89pxZmzqvjbEmbkSs96f48hNd
 f6Y4kX0rzCUwhRPZCsot7DdkN24esokJ/cr5x7QQFN1gUaJJI5HRbl4LAbx1+MP03slYVV5dlLz
 jzY5fFj4DPojyverznUJumnSxBW7epxNUYe/YpgJXuzeS3obL+YjLmj1tus6VdnjKCwi5ZUHEHN
 Vu+K6WROV1aePhTG7HDF86I//Pn0aTswKRjmonp4hVRjpvtMwcWPi5AQ+7TnMZsIa/ezHUKql3x
 iD6tqT9X
X-Proofpoint-GUID: 7glOAxuzbSu7ql9ZrlKTJFMZZLhjKxW6
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689c07f9 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Dei6p5SHAAAA:8
 a=pGLkceISAAAA:8 a=9dY_yc_aYyu9dcp9PvAA:9 a=TjNXssC_j7lpFel5tvFf:22
 a=M-Yerj1wOn-OpK7r_3ei:22
X-Proofpoint-ORIG-GUID: 7glOAxuzbSu7ql9ZrlKTJFMZZLhjKxW6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107

This patch series addresses issues encountered during SSR when
the BT_EN pin is pulled up by hardware. The main issues fixed are:

1. Timeout when sending reset command.
2. IBS state of host and controller not being synchronized.
3. Multiple triggers of SSR generating only one coredump file.
4. SSR process failed due to tx_idle_timer timeout

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
To: Marcel Holtmann <marcel@holtmann.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: quic_bt@quicinc.com

---
Changes in v2:
- Update commit messages.
- Add version number.
- Add new change 4/4 patch to fix Idle_timer timeout.
- Link to v1/2: https://lore.kernel.org/all/20250715051618.724475-1-quic_shuaz@quicinc.com/
---

Shuai Zhang (4):
  driver: bluetooth: hci_qca: fix ssr fail when BT_EN is pulled up by hw
  driver: bluetooth: hci_qca: fix host IBS state after SSR
  driver: bluetooth: hci_qca: Multiple triggers of SSR only generate one
    coredump file
  driver: bluetooth: hci_qca: SSR(SubSystem Restart)process failed due
    to tx_idle_timer timeout

 drivers/bluetooth/hci_qca.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

-- 
2.34.1


