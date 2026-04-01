Return-Path: <linux-arm-msm+bounces-101357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPX7MbcjzWlkaQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 15:55:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B24437BA5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 15:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4AF63308E959
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 13:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E2036EA86;
	Wed,  1 Apr 2026 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NDlu8AVO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4qJdY3/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1888443CEC3
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 13:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775051391; cv=none; b=fNPrslAD5eJBCrPkBFKtY1BQWO8s9iceZZYJsCPwt8eoKyTL6eCUqmUT52D+AKnwhi72OZ4rorz98/78v0Msh1k0DB7Tc9YJgxjpPVx+CIYlsF0z36H6S5PIWD9f4BWa9CcjTUxUdDwhPGk9v1TPt3P7fn0+QWg/kXY5l/wBc5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775051391; c=relaxed/simple;
	bh=rW46XFPPp2C7fNwBbAzHJuh71JQi/lNqZu/462qrWPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=S7fD2TL3sz5PNprUuo3fp60b4ReiTjfeTtAT4mv4QrujDF9hD/n1Npqe/vOFWMkqz+iAHOWs7pD9kJnK37SMOCQzMPPsLqFsYvmUGv1fYq7YxvXx/O5obC0WJDiAoNr7FGqMEqinABStdTqNGpBvBQfGVmgKu7RfQXir6JYopts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NDlu8AVO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4qJdY3/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631C4vQO2398537
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 13:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pLcwugmveaGuc3b8rkj7O5
	lUNjS3ZVBSKuNHEhcgUvk=; b=NDlu8AVOWqk4EiJzvBAseAYapxJvgtCzCHicbS
	RFvQJ+mTdVT0ha9L/Q5ZAKggOh0/NA190CWL4/PZ20YZ8f3k4Xq77uAhGQkUcdJW
	T2SPjhogcNiVOgLDohhiT9UVYnGpllMBlSKW97YOffLqVnldgz6rr92zdCLyhNWo
	z2xvchnUdpZB7/MNz1PoyiTisNsBqzjexHgh3Go7KnOVG7FbM/9w6lZ5X/M8bcvQ
	ODNqLdibFXezc/hXhAMyBT/7XQrgcY9Wlf9ZkVxDOH1fzJKkz00aPS1H1vNK2kWB
	PHM7NmAQ/VAoPZJrmxyeO71235WJL2dhbQLboAwF+KigZQWg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9324gcnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 13:49:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b241be0126so153119005ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 06:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775051389; x=1775656189; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pLcwugmveaGuc3b8rkj7O5lUNjS3ZVBSKuNHEhcgUvk=;
        b=R4qJdY3/SPXUBRI13/lXJuZrEhenLb53gY7eDN5+wILC1T29qnyNCTFXIR/acWWyaO
         E5ejLKKHCTFvdrb8RRpGLaFYmpK7IPCYxmZN7LugjODeXCJSjqnBleXwT/sysyFOaLyX
         4mnpFyu62CwahlA5Ex0wsGGRPjspYu4hk8t+R9qo5cNNurK0GFwSYLQpHrg/HmUbZV+e
         BeifY9Pt+ElVQ6JxLtNAZfS3eopvddUVB6sCRGN/BtJaVAMF03gqOLJE7tYX5tGpaEAW
         CJEbVpcgiLAuyYJHvp+xWAgsD6Sm/ROzUJC32An6TWS+bJwk4Zh4mgjtOHIGKp3oN4fm
         bQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775051389; x=1775656189;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLcwugmveaGuc3b8rkj7O5lUNjS3ZVBSKuNHEhcgUvk=;
        b=oAxyLgWPquwMpjm6UoVl6YJlfNuel8ko98g+L0+VzsheSfksEtx3Bg3u1Rptp2M93P
         wWBf7CFRnwuXOOm9+yCx9MtB5Cbsibn38RvBWNZCPDY6HF7SLvYagRFsWdcWu9w3xhZl
         7/QYQxjwTnxaM4ZVWk6wLewZ/BSxUYhhiO95lu0mBNKQ7dgZHNVrPku4k+Yeo8MhtpVY
         U84UZXeH2NiUj/6wBMQYTgcQ0V36C51LEhgrimLH58ZhG5gwdIqiGtPsFjmpj5pURgGs
         DxGOLHwOjxc+ghO1CuWnLAgsWXUSjwlJ9RfACusbOj0hPEfNENl7h3kynAk+s+Inp96s
         XCxw==
X-Forwarded-Encrypted: i=1; AJvYcCWGtzTT/d/nC81F0EkHu9P0YeQ3LzVUwoWhHhIXGEs7ycaip0CkEETb0yVUTHDuTnM9JKz0dtag4t1UvFkn@vger.kernel.org
X-Gm-Message-State: AOJu0YxmQZRFo+AAAGkpseytnpuk9kCMZrd36c2ErALij3gwA1oPyYO8
	ePg44r3LfbCKFoifY2GBk3XsiCt1jArSNrNa0Ob5tJfFit/VGKrH2qBpiihcRjH/rJoXL8xoQvM
	c8Y78NO6E99xpVaiOXueSgi/POKKKmf1tGe/6PBWXYLdvIhsagMgXjvIVeHvUcM6WdyYn
X-Gm-Gg: ATEYQzyjv6ho7TQjArlh/Rko9UCP4OSjYWAnv9BCXG6kFe4Ymo1geZue7kNO+eel+FU
	HgmFBHy+4DpNltzn8M56blZoIUSJxseq8qEySgXJN/pnOSm9n4qGX/+iGKozhdKoo0uWjpyr8HN
	HFO6j7p0w6IrA1rLuaZ/OYjHKWU2hKoq+O0gL01DzrScbsYCvmumuOmMgA00/sjlm025M6o0iGC
	OkenwnG3/MKFwhBsM7U7I4utPNxD0I0Zez5vTLzEmSxsRCr49ZJNMMnopVYMCXahiaTBiZOZZNq
	XsQHb5DmoBvT+Ni0ESwhuMCyxKzFgfFqsa9UhyEYGmtI/MuvTv4Qf+il1YlTkmf0uM8V8z6vjC6
	Q/n6ugc0IqsqyfstQ7uCUTdLRWnBw/1T9xxPXwe33ntau1Vn3sjoKi/8=
X-Received: by 2002:a17:903:37cd:b0:2ae:ced7:4650 with SMTP id d9443c01a7336-2b269cffdd9mr36809115ad.24.1775051388543;
        Wed, 01 Apr 2026 06:49:48 -0700 (PDT)
X-Received: by 2002:a17:903:37cd:b0:2ae:ced7:4650 with SMTP id d9443c01a7336-2b269cffdd9mr36808785ad.24.1775051388035;
        Wed, 01 Apr 2026 06:49:48 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642615sm146649295ad.11.2026.04.01.06.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 06:49:47 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 19:19:29 +0530
Subject: [PATCH v6] media: iris: add FPS calculation and VPP FW overhead in
 frequency formula
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-update_fps_calculation-v6-1-f44f8154ca39@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGgizWkC/43QTWrDMBAF4KsYreugf9lZ9R6lhJE0agRJ7Fi2a
 Qm+e6fOxouadjPwBs3HQw9WcMhY2LF6sAHnXHJ3o2BfKhbOcPvAOkfKTHJpueK6nvoII55SX04
 BLmG6wEgnddsguuQMd14wOu4HTPlzhd/en3nA+0T++FwyDwXr0F2veTxWyXCDrWuiAK61hOh9R
 N0ARtUE3ugYEWy0yH6scy5jN3ytnWexYn/Vm0Utao0IQTkFhuvXrpTDfaIn1OBAY5VnudXMriZ
 JQ+VNCMELqe2Opjaa3NcUaV5isEYnhzruaPp/miZNKCfp37g1Ke1oZqMpsasZ0iC1wgswCUzzi
 7YsyzdhuNpzRwIAAA==
X-Change-ID: 20260304-update_fps_calculation-98ee7f7507b1
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775051384; l=6667;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=rW46XFPPp2C7fNwBbAzHJuh71JQi/lNqZu/462qrWPQ=;
 b=IZRCfGGxGVZHKaINWSGDHDMoqEA3eR/774HyA9SUmi7R3DGnF9Z/S4OVMbaQ6ryKH2YEiBgRJ
 pOF0s2//mDlAiv0wPtJ0EMI44b7REUolmoOBdwv4s/QlzFRgdYz7VXY
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: PtjDQ5AoSYcDvcvO50gKqBYu2rtYwHiZ
X-Authority-Analysis: v=2.4 cv=TKBIilla c=1 sm=1 tr=0 ts=69cd227d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4OJABYYT5sTn56tSQdkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEyOCBTYWx0ZWRfX20RYAuTmHMiV
 rgAWmby7rdorj0MZFsLLKr1t7MmeIyz9zffDH17CK/JWNfWuLuLqm2YdpKrl6gzS4w8+0NaFcv1
 haNqV4RBW4cuzN3DITrKq3xMSdI/cHoD5dd1uejsV53xC3fVBgxM+azdGvi7aK9QNobBtxRPpWF
 QFITD7Pda2xg2zxfDZoGLV6OA64gPbsaxwXREIkMSRqtf6WoMGeMjwv7pC+5gVotJlXsq5d8WyM
 bq0dH58AQ3xYVv6A88N6F1t1aUtNsqyC+gihA+s1UKoJaKxXZDTGYqurLskzV0DOzkCTP50oDpr
 J/OjBgpBVtwTkzJ8D9Nh1PTmUX0QsrZEyHQucrHgmHM1QPRMKPooKvuGldAg7IPIfKwnggReJaM
 JX2iFK7SYjzMwY7BzA7XjwZc7jW8DXz3GunRh2oNHe1uvfNBMAD6p0KzfzMPNGL4isXaHeDQfQe
 5qUHB1rguY60mxyKkuw==
X-Proofpoint-ORIG-GUID: PtjDQ5AoSYcDvcvO50gKqBYu2rtYwHiZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010128
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101357-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B24437BA5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver was using a fixed default FPS value when calculating the VPU
frequency. This caused wrong frequency requests for high‑frame‑rate
streams, for example 4K at 240 FPS. Because of this, the hardware was
running at a lower frequency than needed.

Add the FPS measurement based on the decoder input buffer arrival rate.
The measured FPS is stored per instance and used in frequency calculation
instead of the fixed default FPS. The value is clamped so that it does
not exceed platform limits. Add a VPP firmware overhead when running in
STAGE_2.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v6:
- Updated the vpu2 frequency calculation also to take the actual FPS
- Link to v5: https://lore.kernel.org/r/20260331-update_fps_calculation-v5-1-af91b1a5fa58@oss.qualcomm.com

Changes in v5:
- Added description for defined members in struct iris_inst (Bryan O'Donoghue)
- Link to v4: https://lore.kernel.org/r/20260325-update_fps_calculation-v4-1-13728c0065ff@oss.qualcomm.com

Changes in v4:
- Renamed the variable names (Vikash Garodia)
- Updated the fps calculation logic (Vikash Garodia)
- Link to v3: https://lore.kernel.org/r/20260325-update_fps_calculation-v3-1-b2ec654f7e4d@oss.qualcomm.com

Changes in v3:
- Updated the frame_count condition check (Vikash Garodia)
- Link to v2: https://lore.kernel.org/r/20260305-update_fps_calculation-v2-1-e3b5cccb1246@oss.qualcomm.com

Changes in v2:
- Replaced div_u64 with mult_frac (Konrad Dybcio)
- Link to v1: https://lore.kernel.org/r/20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_instance.h   |  4 ++++
 drivers/media/platform/qcom/iris/iris_vdec.c       | 20 ++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  2 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  6 +++++-
 4 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 16965150f427..63dd889c9992 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -67,6 +67,8 @@ struct iris_fmt {
  * @metadata_idx: index for metadata buffer
  * @codec: codec type
  * @last_buffer_dequeued: a flag to indicate that last buffer is sent by driver
+ * @last_buf_ns: start time of received input buffer for current one second FPS window
+ * @frame_counter: input buffer counter for current one second FPS window
  * @frame_rate: frame rate of current instance
  * @operating_rate: operating rate of current instance
  * @hfi_rc_type: rate control type
@@ -109,6 +111,8 @@ struct iris_inst {
 	u32				metadata_idx;
 	u32				codec;
 	bool				last_buffer_dequeued;
+	u64				last_buf_ns;
+	u32				frame_counter;
 	u32				frame_rate;
 	u32				operating_rate;
 	u32				hfi_rc_type;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..7fb45df37db6 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -54,6 +54,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
 	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
+	inst->frame_rate = MAXIMUM_FPS;
 
 	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_dec[0],
 	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
@@ -369,6 +370,8 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
+	inst->frame_counter = 0;
+
 	return iris_process_streamon_input(inst);
 }
 
@@ -411,6 +414,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 {
 	struct iris_buffer *buf = to_iris_buffer(vbuf);
 	struct vb2_buffer *vb2 = &vbuf->vb2_buf;
+	u64 cur_buf_ns, delta_ns;
 	struct vb2_queue *q;
 	int ret;
 
@@ -427,6 +431,22 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 		return 0;
 	}
 
+	if (buf->type == BUF_INPUT) {
+		cur_buf_ns = ktime_get_ns();
+
+		if (!inst->frame_counter)
+			inst->last_buf_ns = cur_buf_ns;
+
+		inst->frame_counter++;
+		delta_ns = cur_buf_ns - inst->last_buf_ns;
+
+		if (delta_ns >= NSEC_PER_SEC) {
+			inst->frame_rate = clamp_t(u32, inst->frame_counter, DEFAULT_FPS,
+						   MAXIMUM_FPS);
+			inst->frame_counter = 0;
+		}
+	}
+
 	iris_scale_power(inst);
 
 	return iris_queue_buffer(inst, buf);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 9c103a2e4e4e..73c201f4f338 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -18,7 +18,7 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
 	struct v4l2_format *inp_f = inst->fmt_src;
 	u32 mbs_per_second, mbpf, height, width;
 	unsigned long vpp_freq, vsp_freq;
-	u32 fps = DEFAULT_FPS;
+	u32 fps = inst->frame_rate;
 
 	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
 	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..d621ccffa868 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -416,7 +416,7 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
 	u32 height, width, mbs_per_second, mbpf;
 	u64 fw_cycles, fw_vpp_cycles;
 	u64 vsp_cycles, vpp_cycles;
-	u32 fps = DEFAULT_FPS;
+	u32 fps = inst->frame_rate;
 
 	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
 	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
@@ -435,6 +435,10 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
 	if (inst->fw_caps[PIPE].value > 1)
 		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
 
+	/* 1.05 is VPP FW overhead */
+	if (inst->fw_caps[STAGE].value == STAGE_2)
+		vpp_cycles += mult_frac(vpp_cycles, 5, 100);
+
 	vsp_cycles = fps * data_size * 8;
 	vsp_cycles = div_u64(vsp_cycles, 2);
 	/* VSP FW overhead 1.05 */

---
base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
change-id: 20260304-update_fps_calculation-98ee7f7507b1

Best regards,
-- 
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


