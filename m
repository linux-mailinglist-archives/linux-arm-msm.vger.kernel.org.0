Return-Path: <linux-arm-msm+bounces-69217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 359FEB265CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 14:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB7E61CC71B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 12:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2F42FB987;
	Thu, 14 Aug 2025 12:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="em8DHCZL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F171381AF;
	Thu, 14 Aug 2025 12:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755175632; cv=none; b=PE2rV0vPggTmJNeQWcuFNFRNI8wgPSoMZMcQOU5B0OsCNECuCNXMrwAK8XuSK26W94MbjIEKZRXvkALsxlcOC14v9cttW8YxvgeuFbdIW3NqhEZYe3ToPIxjPZzIEieBnjBWWeS3Lh3O1JnOsy0kct3MNQFfKgnJLP7ZRgIbKOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755175632; c=relaxed/simple;
	bh=YYlNZanvxgPBpAFZZouGRj/ghSNVvNTe1basTd5g2Rs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MzXNvvIuJBuJcydY5y1d74IbtB7yw7UX79V93t9t8bAf+sXFlgwYQ88xTbP9zxCoWTY+lNZP6pFe8RfMlx3lI/1QH//hniCFOGPIcGa1FvR+z+o89tp8CEGjLaTsnaqNl2ZYlCjKrB9ZhaiaDqE1jXM/ND4gySzuou5FM+OrO3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=em8DHCZL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9hU9a021243;
	Thu, 14 Aug 2025 12:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OjQwE0PV+FzhXDFLlctubdexTbu7eQlPHrU
	15HjcS90=; b=em8DHCZLeVssW2HDyALGkyxBDYD7kfx4k8lU2Gnd1neCJ0qFoEy
	cFBexCH0akv5ejj9mhXVVE1ldxerHDvXu5pD7Y6jJ6Ij6HG8XRt13wwlI9t8oIiK
	YUG4liJGx3re8jedGtqdmaIW75LGkzy+gVIA1BjPpe55HGULyGKtnbk7q7n78j/E
	+y6NptmtnfosLXIOdMZE+X75ixiPlh7kgjQ7/hyHIBILnFgJGlUfhzC3/avAeOxd
	/HEhso/DaSVaEmFagxFxa1RXO97GxFt5eoA612t/qGa40CPqfPnRgZerpKQGppS7
	XKQYKYwvttArqFoPDqXhKFuG92QbqyC2z3w==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sywyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 12:47:10 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57ECl8FH028101;
	Thu, 14 Aug 2025 12:47:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 48dydmgwqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 12:47:08 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57ECl8Dh028090;
	Thu, 14 Aug 2025 12:47:08 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 57ECl7B4028086
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 12:47:08 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 029F222BDD; Thu, 14 Aug 2025 20:47:06 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] Fix SSR(SubSystem Restart) issues caused by BT_EN being pulled up by hardware
Date: Thu, 14 Aug 2025 20:47:00 +0800
Message-Id: <20250814124704.2531811-1-quic_shuaz@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689ddace cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Dei6p5SHAAAA:8
 a=pGLkceISAAAA:8 a=CVKY41Y29sSDTK7O-P4A:9 a=TjNXssC_j7lpFel5tvFf:22
 a=M-Yerj1wOn-OpK7r_3ei:22
X-Proofpoint-ORIG-GUID: IrhH-b2LliyRMT7tdwLTMhmw4xPl6qsm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX0raSV9ud6uSn
 smiyaNFbEgGMLQdxvaKv12wqWwzH4/hwEhv+hGObwU7pdvUT1PiBk5/NaV/3TgemHq/uUtHH/Xq
 1Kka/0EYlYUW0PjQK7vbnnrGUy5bwOVP9zoOXfrgC4/pZN/M/6O3+GMxXn+QvMzHYoCZzV/Y/Yt
 wwOGzFDc/UwyH3vT4LwVAVFfLLvPW7bKkqdvpSJjOU6kI/VAmitCFlh6hQKVIPZYndnXFdyAYNf
 Ip4/9E6wvSLx6O0WBa2YjBsLgV8zS1R1vTcTJ7YRUvAr6bIncLiRFO7BVFLNpN4nBbsbwcFbBaG
 eTtYB2aKdvKzI8BUptVKUfPzNfsRUhu+NweBAn5a6/YM2Vmq/p07x+UrllLD/GlcK1aNTKRYaoA
 P7o8Rdq3
X-Proofpoint-GUID: IrhH-b2LliyRMT7tdwLTMhmw4xPl6qsm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

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
Changes in v4:
- Update commit messages.
- Link to v3: https://lore.kernel.org/all/20250813033505.3868781-1-quic_shuaz@quicinc.com/
---

Shuai Zhang (4):
  driver: bluetooth: hci_qca: fix ssr fail when BT_EN is pulled up by hw
  driver: bluetooth: hci_qca: fix host IBS state after SSR
  driver: bluetooth: hci_qca: Multiple triggers of SSR only generate one
    coredump file
  driver: bluetooth: hci_qca: SSR(SubSystem Restart)process failed due
    to tx_idle_timer timeout

 drivers/bluetooth/hci_qca.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

-- 
2.34.1


