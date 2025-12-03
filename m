Return-Path: <linux-arm-msm+bounces-84139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39147C9DA90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 04:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E96FE3A931A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 03:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25EB62472A2;
	Wed,  3 Dec 2025 03:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KglR3r/g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7342A23EAB5;
	Wed,  3 Dec 2025 03:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764733048; cv=none; b=uiS5TtlAAVdOxYj4kWlojX1QTCPCvdtPtHIiGFsjly540pCawN2sztmEaJ3i6/GSmyY0iGSyKz9cSZWbqBe7FTJqhrfNXrFDnL0Ta2Z4fyZaNFCtaDOjkgUPwbv9s5XXlvDAJuDfbHRwrwk+eRRQbCo9uXU3uhKGLcu2/eCMzjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764733048; c=relaxed/simple;
	bh=gjVot2V2lVdDjic6hbcb3UHuizTjWYTM160zz1/vMDs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nhWeEBXkRLfrk99YQ7syiOEgoQu1BTgsm2hZ669GRbUvzorfiI9NcOkgWjdzFIUJzTRjAZEEgxdnfNZDeJjgorJZfl01qhq9GiGlYuwvS/mYRkTaSseia2Iq5qQjmQz/nBjxXLPb6RhXxJD4uy38HLXHby8yIfDWgXP4miiE75E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KglR3r/g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2N4Tv7404620;
	Wed, 3 Dec 2025 03:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yYAyLapzzG4OrLDD4QJytYVzqw4rhBWojIe
	uebfeFK8=; b=KglR3r/g2vscysumuGOjG0uHuxuq3rQlBlWmXElLCpju7A1LnUD
	eCD3nMLwM0j7dsrjyPyMa0V83N4tY/r2AIze68T4xFV4AD51bXUvlwbUWa7LWvnj
	fm8t6QIzQ33+w9+y1s1jp/QBko3I+SPEMdpWJupKTGHzixbpypntOLNU931su6MF
	BdwP6M4e51v6krE3uSrUB6qRpSaduiJu9jMWZOoyNP+BSF0rwgRUzZm4j+HJUYi4
	Qh02pMzcsf2bhtAG6HptdYfGXykKuiwBhU1GIKp3d2yFnfJnv+4KXw1S0WZ/K2/d
	Ujbq3pr8LS3CUo0xevDvbAzmG6FMb7W18lw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at9fc8m4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 03:37:22 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B33bJeP018955;
	Wed, 3 Dec 2025 03:37:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4aqswm4f2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 03:37:19 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5B33bJMr018949;
	Wed, 3 Dec 2025 03:37:19 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5B33bJCR018948
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 03:37:19 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 545AE23279; Wed,  3 Dec 2025 11:37:18 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v13 0/1] Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail when BT_EN is pulled up by hw
Date: Wed,  3 Dec 2025 11:37:11 +0800
Message-Id: <20251203033712.446632-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDAyNiBTYWx0ZWRfX/vH1cWbstv21
 Ix0NuolXolGeIYxyKIHmQW9XRKQJRWTmJHVxKQoMrix2PyjaKQfPY6M0Wxbl6gpPLohWGS1c4Rz
 O7pdB8j7UyeZUIhZTOibz4qZqHxO5ZIa+tXaVfoqf6gc8sINy3zGzJQokpcQ5wV+KoUSoHreIZK
 5gyW96HKQFTFR7gpZf3jpaF6p1W6vsZ1FwkYzyCUs6tIRTkCxNdwInVn5i9sCaP2Mt0J8/DwlT1
 bgyab2m70eM7RaAwYFU3D8t4ILxdq+BP6f/qNOx0vNodh/u62Kwtcte3X6tCEymBfANyijaDTQm
 mcy30CyqxKBZIuw+7RNfZYQzuixmCDHacrys8JmA4Znes5iQ79jCHsLUimz8YBlKLkKXmlN6+cK
 +lkbrec9enVz0YlsEzTkaQsq6yGowQ==
X-Authority-Analysis: v=2.4 cv=Qblrf8bv c=1 sm=1 tr=0 ts=692fb072 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=RoLKVjaqVo3_4dOD2DgA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JFizeJY9MHFKzELpsLvQKOkbIx9aYkqk
X-Proofpoint-ORIG-GUID: JFizeJY9MHFKzELpsLvQKOkbIx9aYkqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030026

Changes in v13:
 - Resending only to trigger CI, no code changes.
 - V12 Link
   https://lore.kernel.org/all/20250916140259.400285-1-quic_shuaz@quicinc.com/

Shuai Zhang (1):
  Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail when BT_EN is
    pulled up by hw

 drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

-- 
2.34.1


