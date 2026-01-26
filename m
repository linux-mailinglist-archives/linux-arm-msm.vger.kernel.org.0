Return-Path: <linux-arm-msm+bounces-90588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFC4LV+Vd2n0iwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:25:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DCF8AA21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C5CE3006017
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1374833BBBF;
	Mon, 26 Jan 2026 16:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KBoQcKLt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC02728D84F;
	Mon, 26 Jan 2026 16:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769444699; cv=none; b=gnI8rtRXizSTb2dXtaLj75XVuNwOGfqHASNQl0iiQ7waYmtyGhJsjKAhm8QsiMvzsKjcbRBD84mJq2CmhXIukw1bB06edPmPYpBXNL6ShA9FRnQXYcrJX+muXSYFnLFsm6OqsdD71SQ2okB9oApPGNO+pTtgH/OMEMcASCXUGc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769444699; c=relaxed/simple;
	bh=IsrQI2IALTWLet4hfHRfHP/qVLFHFyJPGOQ4YJS899g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rBALHMxUfb6/lQdvGPR/5jb4DEujhzTa92enpbuFUhubvy9PJ3F2R+lCYqNN5M4fPFnEoSD3EnveRy+KQzGiHswyWmT/nfHQ9rhAfNg533sEYPgwEv7TzQgnt8NsqaGuzh2CYkHg5WZ4qS4KNYF3r/Gv+9tMKm0GOW6B7Qo21hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KBoQcKLt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q96Ge5480840;
	Mon, 26 Jan 2026 16:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cH0/XedY5vSUzRD5tbWZmkmmgCbMeD2QTg5
	VtcRZn/A=; b=KBoQcKLthiXCXUSaqpZurKaQae4ijpwGyzhZ7AqfKl7/B+FwSXF
	vx7KAoOZINek9pxK1aEhTMJZrtDrz/zEs26G/jFvnHYcCD98MZQ9G2VaYkyUGjZ2
	esotM4pMoLzcQVtIRyJC11MSuHzClNngdmtFlJIZy+3u9jYAgp8PBrHzaH4DqNTh
	5Gd8CN3WIahszB1rQ45ndljtGk5dicl7bwbGLSgJgNazdPlx5fgLlNT3MDzpjCHw
	CVIu6Pz1COBdKHa89mvTQRUHmPsFiQHnDeWJUT+nkU436aOU+zlxT9yG5aFZRI+U
	ZfNk/fWYvWWw5ZJQlNvRwNaBECD/56MLK0g==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6uw418-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 16:24:51 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60QGOnH3011414;
	Mon, 26 Jan 2026 16:24:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4bvq5kwex0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 16:24:49 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60QGOntH011408;
	Mon, 26 Jan 2026 16:24:49 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 60QGOmhU011406
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 16:24:49 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4766378)
	id EFA2F23960; Tue, 27 Jan 2026 00:24:47 +0800 (CST)
From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, shuai.zhang@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, chezhou@qti.qualcomm.com,
        wei.deng@oss.qualcomm.com, yiboz@qti.qualcomm.com,
        Mengshi Wu <mengshi.wu@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Bluetooth: hci_qca: Refactor HFP hardware offload capability handling
Date: Tue, 27 Jan 2026 00:24:42 +0800
Message-Id: <20260126162444.4194293-1-mengshi.wu@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEzNiBTYWx0ZWRfX2WzsnRBTyPoi
 +r0QgZ490d3ECO8S3h2nl8m4zhr22ey8tsHK9aOe6eCwvTGliYThZYjJcWTpKY9vB42IXTBSfNB
 op5mEz6DuynGbeq9fKXpFQhFGn3U8xZiPcSvhUbTlMQcXvQuhV6z4OSrFKbzwo+gLEPqkan1l7C
 PVgi3xluYkpjgSUdkfWu2+UUjBD0YdCaCgRawAqPIFIF0y9nSebjW2jGLGjPmInSQ9EdnX6wXSb
 0yvrE52Ab/5Kx7NJCQ4W5bLhWahtzAQuDuPeZ4GgUmwl8dN8bPZUkiX5AQUPzoARjqCkHPM5rGa
 7bX3k66LW0/PA7UuztnoBx8bDW+sC6K1rnUPMKX4wI5B3QVOWjjPmRQD2izi/hMXUdQcJRdTlW6
 zSEs50TLutlHhn9Gb/qO8CNK6mNk8FL2j20yI8D3pOJIa6GtK2gDS6I/XDKkuzM78BPdHTk0d98
 EeW663Bj44NlaOvYwGA==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=69779553 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=qFnXSMUquCfZfKk7KuAA:9 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: Lum3YvNzcqGvqGWL9CF7xoR_PNUfRijV
X-Proofpoint-GUID: Lum3YvNzcqGvqGWL9CF7xoR_PNUfRijV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260136
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90588-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mengshi.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 19DCF8AA21
X-Rspamd-Action: no action

Changes from v2:
 - Add QCA_CAP_HFP_HW_OFFLOAD capability flag at first commit to avoid
   breaking original logic.

Changes from v1:
 - Refactor HFP hardware offload capability handling.
 - Enable HFP hardware offload for QCA2066 and WCN6855.
 - Link to v1:
   https://lore.kernel.org/all/20260123055243.2634107-1-mengshi.wu@oss.qualcomm.com/

Mengshi Wu (2):
  Bluetooth: hci_qca: Refactor HFP hardware offload capability handling
  Bluetooth: hci_qca: Enable HFP hardware offload for WCN6855

 drivers/bluetooth/hci_qca.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

-- 
2.34.1


