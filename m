Return-Path: <linux-arm-msm+bounces-68873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8E6B23EF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 05:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8511E3A7822
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 03:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698BF26E6E1;
	Wed, 13 Aug 2025 03:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J+9U38FI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58DF1C860B;
	Wed, 13 Aug 2025 03:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755055390; cv=none; b=blsbpSxfGzpg8HQZVp++xaDog6ptjzKcsSCtAt7/zPVC30iDUQ8g0AvmUWLb6V6JLNZru7WuINhnqQB8bCGcoKZpg5D3USroN4WzaFMBsqvRzofGJlUkodVERyW++SQop+O232uWARNvvF2T67tkccyX57cHKhY5wdE3khcC3n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755055390; c=relaxed/simple;
	bh=Q3CAbHLCBVDyiOb5ExsJtxT9sJ3zARgcXcaVYKZzXvU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S6mVhLWUu20afFUdagbglXsgnsXQ7pN1H6zf79NqrGL9oXArbilKtDXSkud2bzEwv1ZquUrs2pz7tl6BIIRix70f5Ly5sVaiscz1RJkK8EPxVJQ0bUl7C6KHFvIkMRbEMq4lnUd5IRqbDhcF1pxj3LJpMHQ5ie2hvmFqQy0qB4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J+9U38FI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CK5NoU032275;
	Wed, 13 Aug 2025 03:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TyQ8V+iTVg28IwajxsYPxQLlMjOJohRSq+X
	yP8tZTpk=; b=J+9U38FIW9SGG4+TCub6yS+fbqFTJPbT92bCicBRu+6EcCo8CCZ
	cdqFZRu1ftg4gtOnPEFMpjQYQThUlzZQxs3JKiYGPbt/QEtMaSfHOH6PTPA8zr9C
	g+GXVdst2nzv8dqEb8bPTkzEc7gO6Wlz5KmbPrt+CNcdxAuJW/pnLL7tNrasgBuV
	w2xXh2LKXjO5f/8YeVGjPJoC6TU6fNatnp4NJYQitAjXvs9FfREYu0FGaT4N/nqA
	HBBZ4SpPv7WDaJt8ld9hvKCbD8uaO4kSGqjQK3OFAQJ4b9oo3jy4wkLOq5iqf0Oa
	NGeUidxwPi1SPa6Qbv/lyaa1M90/0af1WEg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vn6jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:23:07 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3N430030140;
	Wed, 13 Aug 2025 03:23:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 48dydm0e1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:23:04 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57D3N4t6030133;
	Wed, 13 Aug 2025 03:23:04 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 57D3N471030127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:23:04 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 9611221D7A; Wed, 13 Aug 2025 11:23:03 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: quic_shuaz@quicinc.com
Cc: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Fix SSR(SubSystem Restart) issues caused by BT_EN being pulled up by hardware
Date: Wed, 13 Aug 2025 11:22:58 +0800
Message-Id: <20250813032302.3852504-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX/xpktq+3L8Kz
 ogtQrEg5UTg31R0dki0gruhvN5pnAqYiZPXX3flPFodDAva9F6ZiR/YGEHQL6RkGYyFp5+v26HG
 TXfLzW82C5QaGYof1KftA2LY7dguHxo8yjI248Ksqst3N+ww8caP+z39kKrV6HEfCe6+sjUc1IL
 lvo4yZ/b3uWyqY/gGYYBP1+MK73SKRrS7cOMs2HMlxsJVCb5T7E2T8oKPF6dFGf8ak3qPtKHvW1
 qcd2hgA2/imf6eQoE49ucvYyMlulu6hslI2U0jrjR9HAU4LWH1sGtItWe8Shhj5iYL8tkR316xr
 Z3tVhxgJA3Wg99Lvsf1zrr3beBgenxnGOnYp/ibW6rD0csQrI5ERsTSxHX5oOjoWXf9bBk8enu1
 vWOfSVba
X-Proofpoint-GUID: BGwhBGTieBD4JzWt1hfNc_w2wckpcOge
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689c051b cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Dei6p5SHAAAA:8
 a=pGLkceISAAAA:8 a=CVKY41Y29sSDTK7O-P4A:9 a=TjNXssC_j7lpFel5tvFf:22
 a=M-Yerj1wOn-OpK7r_3ei:22
X-Proofpoint-ORIG-GUID: BGwhBGTieBD4JzWt1hfNc_w2wckpcOge
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

---
Changes in v2:
- Update commit messages.
- Add new change to fix Idle_timer timeout.
- Link to v1: https://lore.kernel.org/all/20250715051618.724475-1-quic_shuaz@quicinc.com/
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


