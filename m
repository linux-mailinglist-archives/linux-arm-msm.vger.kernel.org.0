Return-Path: <linux-arm-msm+bounces-90212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPNaJ8oycmmadwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:23:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A03E67DFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3E4FD48BEC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA1F305E2E;
	Thu, 22 Jan 2026 14:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVYW5GlM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868A630CDA9;
	Thu, 22 Jan 2026 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769091224; cv=none; b=rlHC75vZ5S2UEppsf9svDkq1l3gkCoFhnJSnPWlT/FMTPVAOvXX8/k3iA2bypMvZcHLImgt9zmgmiDLtpbm4zccXBc3MXy23QLh/ODKg/qUPbG7fqK6kFnbKur/ETDvrto3qxKlRnHnD/+Dxu5eyNcLFZ3R/eiENSatcoEtR1GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769091224; c=relaxed/simple;
	bh=KlzRzIRogFcrbpL9SufWPfooVu1EDNmT3WCfXg43g4E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TuUmbDwVC/IKLKJX5AX3rcNZGVt8x+7mIT5ov+wSXbfQSJ6kmPTa2PtU1O7KodeRqQ4ekAHI5pW+CUdi9/mA7TtSTqHLzogmH1vidFm4YHAlm9O5e71CXvDABWlQcq4jbDpKvSlkq5mQB2XW5t9CCbOwd2pUxgXPAxy23B8zExU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVYW5GlM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7te992276572;
	Thu, 22 Jan 2026 14:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4n3wsN8VCGC2iHYEjXMcWXjisHeF4KVk8CA
	Q/CSIMU0=; b=AVYW5GlMabHo1VPSOXJFbztT2LPpbww9iFRM8XclbZSu0YctyPb
	cVT1arFSs3PlBR8MU+8ETuaCLoS+hEYpx4r/EfH2/AF0WmLYE8XQhqUQgrl3pxT4
	st+8cQaM9T7LPhOhgffkSUD/YH1Wu+v/elsidPDKFjl2i5RgLhKMkd48Y4Og8JWE
	vVdhzg7EMeTul1gNshCIhxpBS+DCbdqPzcdcmaup8NOEaTqXHHp1RjUJm5RbNdl1
	2tuTxbR/TaElcvEMgO79agI/wZ+GmbUZtW2AvYNwAVQXQVjomR1UJGANSp15pwFV
	M+klASbMjmzrFdrelUN2BX9XQN6omRSk4dQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7fatjvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 14:13:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60MEDYwO003642;
	Thu, 22 Jan 2026 14:13:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gmypnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 14:13:34 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60MEDX31003636;
	Thu, 22 Jan 2026 14:13:34 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.101.157])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60MEDX2H003633
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 14:13:33 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2342877)
	id 0839E5E9; Thu, 22 Jan 2026 19:43:33 +0530 (+0530)
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Subject: [PATCH V1 0/3] ufs: ufs-qcom: Fixes and optimizations for Qualcomm UFS platform
Date: Thu, 22 Jan 2026 19:43:28 +0530
Message-Id: <20260122141331.239354-1-nitin.rawat@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Hrx72kTS c=1 sm=1 tr=0 ts=69723091 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=HV7g6J3JBgeWPb-Ptd4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEwNyBTYWx0ZWRfX24iqLQcw6rJ6
 dBXWf58ohAvsTs0D3qjdVV2QIuKkdSRGvjTbIYkUVEqTKGUL5ThsqtkeuM8xXcRR26/sL4Afjx2
 PY811gFYAyNdcB3AXcK9kcEgdQ87Pb9EVIHORlq2JPdAEAk93GrpHiYkLfNRj2WxQ7zkQJS5M0u
 fHrtm64kQNLZIVl0eQB9Gv/v02MA8EmY/Yxw3FSRdRUz+xAnnU1SVxHeT/X1boEKBMK3Bc5n+K5
 AwZlHYrQULdjtzzIiMk83bVswnUB+m/OB0BP+OunAEtHsXp0wUL2RqGYhzLT0+DcMZ7a9Tnln4j
 m7p4qnGCVFmmFMzTrvkYMaVwrqR+taBr5wE6YClC2Q0SMUw0EWCFF8lecoQCrf6WK4WWXDCWYHE
 semy50QwfjDRhDyzexsUlPh2z1E8ePvVYpQKWzeXnEd94WBD3jdlf4YF/MfeZgnAgq6wggJYrjc
 4oOJ1xsqxd99BrWp8pQ==
X-Proofpoint-ORIG-GUID: gslQJcrCzS1uTJel8CpF2YM8RIe69tnE
X-Proofpoint-GUID: gslQJcrCzS1uTJel8CpF2YM8RIe69tnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90212-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nitin.rawat@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4A03E67DFE
X-Rspamd-Action: no action

This patch series introduces few fixes and performance optimizations
for the Qualcomm UFS host controller driver to improve performance
and to align with Qualcomm UFS hardware programming sequence.

The series addresses three key areas:

1. Enhanced interrupt handling through CPU affinity optimization.
2. Hardware programming sequence alignment for UFS controller v6.2
3. Performance tuning for sequential read workloads.

Nitin Rawat (3):
  ufs: ufs-qcom: Add UFS ESI CPU affinity support
  ufs: ufs-qcom: Align programming sequence for UFS controller v6.2
  ufs: ufs-qcom: Fix sequential read variance

 drivers/ufs/host/ufs-qcom.c | 63 ++++++++++++++++++++++++++++++++++---
 drivers/ufs/host/ufs-qcom.h |  1 +
 2 files changed, 60 insertions(+), 4 deletions(-)

--
2.34.1


