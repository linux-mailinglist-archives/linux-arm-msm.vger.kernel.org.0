Return-Path: <linux-arm-msm+bounces-68872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C741AB23EE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 05:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C6D117203A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 03:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A782690D9;
	Wed, 13 Aug 2025 03:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kvhTucUC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942161EDA1A;
	Wed, 13 Aug 2025 03:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755055300; cv=none; b=BU/BUoCrb8tGgFCAwxCs2DBIlQbtxnYtwz3ABZDAdCQbAuPVhPjaM9UTcnJQjITVbA4Da1GwMAGYoUv0LTidd9UVf4RMGBDZggNfXVOQpzATdz+56T4WpJHjpSKaFmBUzTGxjf4MQYnNANzxLLBxgDqvYXoqfX7Woftm9VjMEWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755055300; c=relaxed/simple;
	bh=Q3CAbHLCBVDyiOb5ExsJtxT9sJ3zARgcXcaVYKZzXvU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oS7JEBKjPGLBL/kWkHKM7ePm+dWZzbqfK/rfX9ACkd7sbrgly9pZOayq1ltWQJFn8hnQBtP3fUbb6ZdsRcdYakXupkCxzq6cFbdcGQFshULWEw2QvkvJYZbc4AF8rAXMnMAsjguyPQymgWXtr7rr8NlLO3+ryZWujA4OQBSgH6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kvhTucUC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CKaI4w029567;
	Wed, 13 Aug 2025 03:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TyQ8V+iTVg28IwajxsYPxQLlMjOJohRSq+X
	yP8tZTpk=; b=kvhTucUCDwpGD4xdg87euFUzt0iWmMLEkXDxANLmq6BQEWJAQNL
	oMv2ygys9iRHmA4lhNE7wP8NgBQLPQqRGf7OmABLNoq9ibRT1RS0OxkgXit9HTQM
	Z68hL6rG1NHHLlvVWSoK97yWMxrEwRYVEJMaPgttezh11C1KIKLCwx89x2nbID0U
	7wAaneIlNSuZ3DFSiGlLosnpxTF0N1//JWtQxRnOMU8NwqcvOKUs0/DJXrD9Mp71
	u4OQOnESoniWwsuU2GRW3tKTZLLNA7Qh+CCFH5/yQa2c6hPfxovASaZVYn48NL2X
	TI61v/5lguhyStK9UOiPYrGOwVQjcUbjWbA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3ga8u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:21:36 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3LXOR023724;
	Wed, 13 Aug 2025 03:21:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 48dydm8nrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:21:33 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57D3LXFs023721;
	Wed, 13 Aug 2025 03:21:33 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 57D3LXw1023709
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:21:33 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 4697A21D2A; Wed, 13 Aug 2025 11:21:32 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: quic_shuaz@quicinc.com
Cc: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Fix SSR(SubSystem Restart) issues caused by BT_EN being pulled up by hardware
Date: Wed, 13 Aug 2025 11:21:26 +0800
Message-Id: <20250813032130.3851524-1-quic_shuaz@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689c04c0 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Dei6p5SHAAAA:8
 a=pGLkceISAAAA:8 a=CVKY41Y29sSDTK7O-P4A:9 a=TjNXssC_j7lpFel5tvFf:22
 a=M-Yerj1wOn-OpK7r_3ei:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfXyPi96jeRa65D
 kmVxdKjfVovjxvL/gSFonB4ErEY/b+AWpsEqDezi5PZAKRGcNjxsmuDHSj7xB/EiE/cKUUAKCdG
 MK36IKTviGJceILZnGG3Of0mVl+sL3w5remZjcoVhuJl/SXgvrcVOXWC+H7vzlTkQIuJ0/6EFc8
 DBNlD1x+JHz+UQWpzUNtTiRH6u6WpEOLqjPMsr5JnPT/WzOK0MhNouOnovFUmOya8CcDk8w2EIW
 acYmbVftfEXB1oMM/PeSexJJ/1TSlG0N3xkQDVu76ybgW5n4ObNx/dz3s0zjx81d7IGkuUG2veU
 hWxXoGpv03nogx9DJkqmmjQWkMHebXeOCDR0OuOphlgjF3Zs25j2WZvEtCCixJLvlluZ7N7dCCy
 U4r/6Mu/
X-Proofpoint-GUID: PIStzlbX4rBd_BFHBlVsyFRvBuG8wtm2
X-Proofpoint-ORIG-GUID: PIStzlbX4rBd_BFHBlVsyFRvBuG8wtm2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

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


