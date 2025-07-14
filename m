Return-Path: <linux-arm-msm+bounces-64850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 376CEB0457D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 18:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B23471A633AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 16:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3880260566;
	Mon, 14 Jul 2025 16:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KquCpFec"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309172459D7;
	Mon, 14 Jul 2025 16:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752510667; cv=none; b=ZUHsN1DGJjqAc08Y1TB8x6i2WTCVfg3SjEuOKuqNhhrnutVLWNC11z44EzkXqE1zlUE44IOp5UqsLwsLypG5tUe4u2hgSkiqYoM/wOhuUJWE0EhqhdhTkYn0mWk7CwG9oTFUA+pUD1xJQaOxGAKARCAErlqh4FZDGPbPH+VhgZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752510667; c=relaxed/simple;
	bh=tFfM0hDJcCZvahEFei2hiOVroZttDJK94ipLxDSFX5k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bU++GnVkKBtm8amB2KzOuP2v1B42MGPHLa8FWricy9+W3iXgVVw5+znpnwZ9Xp0jgyI7cS1/KRmwVXFGbVRz9SYpCmjNkJCCZkKpf8WOx7PvBXfKL6to5B6xvWxW8oVRp7YBZjCsYdUck0o9ihUO4aWO9TVxUlkV9mwYiOxy7WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KquCpFec; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGROpC022077;
	Mon, 14 Jul 2025 16:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mxi7SiBD/iDWVc8EiXp2B8
	FLdd1L3Gj3MaiaDSYI2w4=; b=KquCpFeciof4tZmb80oa60D/Z5X5Wxn0iTF1Zw
	8Nw7g6CnpH/ly88nlbgJGdn/xKc+Oz2cm3dJDDxnt44h85VAjB0zmrUSWSD+kR22
	BaPEzzQ9dCxArBP9ZEY/AIvfuotRSkua4pwOopD/1CHrCxCVUHrztj0VOq+YBQIK
	9fC4Pk3+Wo+pM/Lcf60cZBlm1SOwxMTBomdfqo7nJAQr5MToj2lR+XHKpILrBdbV
	i957cKOZn3QO53j//bYJIlisPoVbHtFAaIvigvHbp7cmK6vbBINu4XTKxcCtAMq4
	Tc+PFJTuZWRKHO6mn3ltYJtW1AyhuG+nHtuMqvZf0Fi/B4xQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dp808k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 16:31:01 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56EGV1KD002087
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 16:31:01 GMT
Received: from hu-yabdulra-ams.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 14 Jul 2025 09:30:59 -0700
From: Youssef Samir <quic_yabdulra@quicinc.com>
To: <mani@kernel.org>, <jeff.hugo@oss.qualcomm.com>, <quic_carlv@quicinc.com>,
        <quic_thanson@quicinc.com>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <youssef.abdulrahman@oss.qualcomm.com>
Subject: [PATCH v2] bus: mhi: host: Detect events pointing to unexpected TREs
Date: Mon, 14 Jul 2025 18:30:39 +0200
Message-ID: <20250714163039.3438985-1-quic_yabdulra@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDEwMSBTYWx0ZWRfX6f2w6LLz2Sth
 L/7YRZt3oIidiuK+aIBqUqqlJdsv0NBEXzZgle8UL7Ja3N/PUYt2vcsKkd7n08G8odb6fMpfm54
 trDKYLWlW4LApNLfNrbDTuDqHBd1Vu21xFXxNGBYiOq8nLDY42+GtZAcvkjtpcwqKDsiaXBk/I7
 OwkRMylNqiPMk66w/lmAcDE9mScfJzbYSaiRbZbUzTZclq6TtNHSolChTumc0dxu5JMwf1ydUtk
 3w8YWn5erA4jU1q5qve87MLhAMFkR4HOuR37cnykbrv9Ht9fhfNNDUo4mB8eKAI6crKicnETBDJ
 b2p6cRcw0umlYroTsUSX+2mhJDaf06TdxbdX5fGNuVJjJUhhHGpYBmro/71gzSAb0Myt/Upc1eh
 x41RmYq1bBV2hZxdsnz5XIn0HbVE6wMkxUQrj49OtDbvdc5WKYIwsQOg3+qEpIEwCss499Pp
X-Proofpoint-GUID: TLh2fF-fhecPJMxj10FkaN0nWhzkUbXC
X-Proofpoint-ORIG-GUID: TLh2fF-fhecPJMxj10FkaN0nWhzkUbXC
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=687530c5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=ztyKLzQp5aFZxASnXIYA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140101

When a remote device sends a completion event to the host, it contains a
pointer to the consumed TRE. The host uses this pointer to process all of
the TREs between it and the host's local copy of the ring's read pointer.
This works when processing completion for chained transactions, but can
lead to nasty results if the device sends an event for a single-element
transaction with a read pointer that is multiple elements ahead of the
host's read pointer.

For instance, if the host accesses an event ring while the device is
updating it, the pointer inside of the event might still point to an old
TRE. If the host uses the channel's xfer_cb() to directly free the buffer
pointed to by the TRE, the buffer will be double-freed.

This behavior was observed on an ep that used drivers/bus/mhi/ep/ without
'commit 6f18d174b73d ("bus: mhi: ep: Update read pointer only after buffer is written")'.
Where the device updated the events ring pointer before updating the event
contents, so it left a window where the host was able to access the stale
data the event pointed to, before the device had the chance to update them.
The usual pattern was that the host received an event pointing to a TRE
that is not immediately after the last processed one, so it got treated as
if it was a chained transaction, processing all of the TREs in between the
two read pointers.

This patch aims to harden the host by ensuring transactions where the event
points to a TRE that isn't local_rp + 1 are chained.

Fixes: 1d3173a3bae7 ("bus: mhi: core: Add support for processing events from client device")
Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
---
Changes in v2:
- Update the commit message
- Link to v1: https://lore.kernel.org/mhi/20250521163110.571893-1-quic_yabdulra@quicinc.com/
---
 drivers/bus/mhi/host/main.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index aa8a0ef697c7..57dc9c5c0d84 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -602,7 +602,7 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 	{
 		dma_addr_t ptr = MHI_TRE_GET_EV_PTR(event);
 		struct mhi_ring_element *local_rp, *ev_tre;
-		void *dev_rp;
+		void *dev_rp, *next_rp;
 		struct mhi_buf_info *buf_info;
 		u16 xfer_len;
 
@@ -621,6 +621,16 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 		result.dir = mhi_chan->dir;
 
 		local_rp = tre_ring->rp;
+
+		next_rp = local_rp + 1;
+		if (next_rp >= tre_ring->base + tre_ring->len)
+			next_rp = tre_ring->base;
+		if (dev_rp != next_rp && !MHI_TRE_DATA_GET_CHAIN(local_rp)) {
+			dev_err(&mhi_cntrl->mhi_dev->dev,
+				"Event element points to an unexpected tre\n");
+			break;
+		}
+
 		while (local_rp != dev_rp) {
 			buf_info = buf_ring->rp;
 			/* If it's the last TRE, get length from the event */
-- 
2.25.1


