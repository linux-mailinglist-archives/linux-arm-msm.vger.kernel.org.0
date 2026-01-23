Return-Path: <linux-arm-msm+bounces-90277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oC1rF8UMc2ncrwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 06:53:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A7D708FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 06:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 272CD3007488
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 05:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906BF39E190;
	Fri, 23 Jan 2026 05:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IdMkM17H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D47E37648D;
	Fri, 23 Jan 2026 05:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769147581; cv=none; b=D0qSrJ/Rvlk6w1rv3m2p5IWAfJ264Rl5i/1t2Yp0Zf1dm72IYXKaAoZyj8fNMkextsaIWZ1ysFnSX8r8DGEe50frQlYqL2JOARHQJKxIxmfZDhIhFiRe/WZ+sXsdmN/Xe/r4HT23T2bl0/Lg5toLWzZaQg/Tv2qmrbKUk4/4SvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769147581; c=relaxed/simple;
	bh=dz855bqxOQr5Q0SoQthbb65eTjEXwQH8CT5yDpqRoPs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sOsYwjzKxrIstAMznfrSBBJ7EorMtjrNOQPhNgmrA0JyTLELCTA3+8SAVcn4vKpxKDLL9z+24W9f/7CLKMC63b5UQT/ndyK8joFHKCKVtXVzod7MXKbHhl2gnIDky2yAhvL3KK0wNyhYTgrhvOkJB3zZIOrHatzEADNaBLYBsiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IdMkM17H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MK7Thx3677859;
	Fri, 23 Jan 2026 05:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VCTyWnnNoquJQK3mhW3iEJHUwNX25zV1k2m
	U4Il2r1w=; b=IdMkM17H9+b+i9WpBAEi1S0wvLO4E0ccIivDImCajiwiY9nBEAb
	B1uVKBeKyLZO6s721PTVIg78mVriANk89Rv8LbutsA8cUeQAgmtNQPMv/83Ii/Et
	oXaK/ooB0FiDWcnbMI7oON0aIasPhc4Diyici9g6TdWcrZM/upf+OyF/Ns/yWkDH
	GERT4HE7LBLcI1VLH0aIEZxnfYoPQ39ENMNMSPwzdJjaUpvjE0d/mPj2n08HTky4
	cV/fGADv0woM1UMjKxepknarkR0DDP0YlM3EwywidxdPCvrUUG4Q/W/Gof/GJWQ1
	biCTZeb+u0BkHNochkchzbUXsQCnuA08IIw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buqyp276w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 05:52:49 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60N5qkGL011172;
	Fri, 23 Jan 2026 05:52:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gn0rwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 05:52:46 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60N5qkww011165;
	Fri, 23 Jan 2026 05:52:46 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 60N5qjIw011154
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 05:52:46 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4766378)
	id 4CC28237CD; Fri, 23 Jan 2026 13:52:45 +0800 (CST)
From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, shuai.zhang@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, chezhou@qti.qualcomm.com,
        wei.deng@oss.qualcomm.com, yiboz@qti.qualcomm.com,
        Mengshi Wu <mengshi.wu@oss.qualcomm.com>
Subject: [PATCH v1 0/2] Bluetooth: hci_qca: Refactor HFP hardware offload capability handling
Date: Fri, 23 Jan 2026 13:52:41 +0800
Message-Id: <20260123055243.2634107-1-mengshi.wu@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RMy+3oi+ c=1 sm=1 tr=0 ts=69730cb1 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=nVeFywDoN9jqvlEa188A:9
X-Proofpoint-ORIG-GUID: yO-n4AF-bg5FZ53L83uhHCghD0wjMBSV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA0MiBTYWx0ZWRfXx6gTC3Z0Rx/F
 6cwNqzr43v4d0tiZTWETRl8fbfVlg6RA2etSZ9u/2+HkJ4TMUIOBwfIaUU/VXBzF0sv36XXLAs7
 VHjNKdpQNdrxIfE7OzUM3fMzWAu9N9xOCsEaqoq7KClZDSddJEyO0/cp0nxzX9XU+A7lRHpylJE
 EDQuSprxncwgq+EAAApQxKvVBI3izw9DzYZ0A2hL0kEMkvoIHOmL0a4O2FigytoJJddMFi2xrXN
 RsM4QUrSaHLwFlAlBrTk7+1drCWn4+VI224WOqsRtxMF5ynGScB8kkU3gEHthbo/QE5cP0g0ve0
 COduczdAP4Gfbos9C3210Z2NXfiLMBaSRF8qhKmBkgLBkL9pw8IKG1ApOqH66GMLMwBv8+Ct0U9
 0ysrUSrTVE3ot0brZ/ubD7LmzefFlvS8Zxxsr5DBg1Y92TstFz0RQofokSeHBEDJo12jArlLicp
 ZztbSKTd/rzJM8ayk9w==
X-Proofpoint-GUID: yO-n4AF-bg5FZ53L83uhHCghD0wjMBSV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230042
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-90277-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mengshi.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F1A7D708FE
X-Rspamd-Action: no action

Changes from v1:
 - Refactor HFP hardware offload capability handling.
 - Enable HFP hardware offload for QCA2066 and WCN6855.

Mengshi Wu (2):
  Bluetooth: hci_qca: Refactor HFP hardware offload capability handling
  Bluetooth: hci_qca: Enable HFP hardware offload for QCA2066 and
    WCN6855

 drivers/bluetooth/hci_qca.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

-- 
2.34.1


