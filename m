Return-Path: <linux-arm-msm+bounces-91131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEIzKDgRe2lQBAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 08:50:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EF114ACFED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 08:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2EC9E301168A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 07:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B7037C102;
	Thu, 29 Jan 2026 07:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hi4HyKh6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iTtHPeq9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A4C37C0EC
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 07:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769672936; cv=none; b=VqBp34CZzb+SNmd6oYVEeu6moiCILxxt21kuPxldxH6flR7F/86J9ZVxf50htgDgy9Xa4kkJcXEgBHGbH8+bAeOJH0EN6GjC1bZIcitx1rrQiFlOp5D7lXT3qL3RuR3I6wsc0i0R5JcWc5DUinMxf5ghkS3eQUXHYTN/JWqcsCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769672936; c=relaxed/simple;
	bh=iFs45nynpZOghqFuo9jLK6SG17R7NMwuI2dqh5glhlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PgeNPbe2c6R+U0tEXyWoelz4AJejWPPNkAHeKiA2Mz/pkYZRf1LTcNcR3IrknaHZ9ZPbw9qVJAKFoK5VdKL0i3j4qOJANsn9rlhf/7wj1HvIMtQ/hDxJdxtj9wRkHAD2+XIiqCBb1I7zXamu88FzMGUsZqxuLABgumZPUMdyDbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hi4HyKh6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iTtHPeq9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T39wap1429062
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 07:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SV7QnoYFt0OYeGaxtyyD1/N76oSB4w/4ECLI7E5XX9s=; b=hi4HyKh6cZN8xO97
	jJQutublGqcaKoFVURvPHq6oahM65PltEGfyJxNIehRXvZHLlgHafrDOMwR+OmgS
	fAHDVw5IpIlhpGhaiG2wep6802HEYw4OtrupZCAxl3kZsg697IkJMAGZOTQ1DgG2
	3XDshr9GuNFoZLS1JkqEzJRlt1r5ObTFtxPK9VlqFbaA6+zjuMH6IsN9TPALww4C
	uFYJ+PF2gLGSz3smryKDQCIAwHBbMD0ZPdnILDXjzmStOSRJus3LKSdexxImFGWD
	nzWEGLlouf2PeJs8MqA4r/w1FkDLi6WaGMq8aWttcBeiHP65JFS1A1yejPTLCYg8
	ud6IjQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byydh0qay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 07:48:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f53036ac9so670287b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 23:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769672932; x=1770277732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SV7QnoYFt0OYeGaxtyyD1/N76oSB4w/4ECLI7E5XX9s=;
        b=iTtHPeq9S5CULHtVQ2jPVtBtUB7LYLYedRPmdaWFsWEe/Skn4WnT8V608UYf28hUMF
         cE0FkEW7iLA65FpsNRUURwxQfPBpphd4+CCJbRLAS8iMBssJmkES1/X6ENhXyu32Uci8
         XYkQQfjJx6pfopOrNH4hbgztBqx0SaGNcO0FF1KPE9LKmRXPJ50/JPz6SYt83ZiguQaf
         2wwHwe4xQyTHk6HL7yzGqPFbOzL8uvnrmfJINdgTCh+vsHnNog8g8rj/6L7BtXscxI8H
         PUslgYvpkumBPiCWnvnZv0MbOgf1z5DzipY6SCUt7yTcKjCHlbZQ8g7LnWMDsExzk+A0
         oDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769672932; x=1770277732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SV7QnoYFt0OYeGaxtyyD1/N76oSB4w/4ECLI7E5XX9s=;
        b=q3gAP8nK2q3tvbRFcYbwjWi2Kou+ebH9rfkIgo/KgxCVm+lTSn5d8Ca/kUuBO4ik1a
         OoqjIHeDdrQxHxCXfG5fyCKaBEv92KEDeqw+PmvIrZZflb5mHWJCVXHibS8ruCEZBK14
         TAqYrOL88HA7qPeUywuB+mBbIw6sYbHM06bIi8UYAApyBihbfbUyye6he6f2U7V41XcD
         39bHgP9Qyy9Df++q8kftuIg2PYJVzMmF0Kp/OxH6RL9mOSV/rID+fuDhKAcG5LT9JJZ/
         PUfLaiGZZNIiTV61FK2OW9QbBH9htgJuWH+PE7UwmnhhtYiDejk09j64ZyOYlcSjxGks
         xCow==
X-Forwarded-Encrypted: i=1; AJvYcCUL/MhtaaR+pcAYaLmWvx8QRchNelh5olK57inC8Xyo8nMRs3Was9pQhY2IP63qggHQyQ5s7suFoNoHmdqe@vger.kernel.org
X-Gm-Message-State: AOJu0Yyga2IBKOij7mlxXE8YSWODE1p/FYbI8eLxnt6kNbTB8oWvVMKl
	ecy72gTk7sVbBUq1KmXpSR0cP0ij7oqb1FawklSWCYLhCNO/1Be4HQaRjKpgPF4IrIW0zDKE6k7
	NSeT/15ESXIFUMg11kC68EMZh8pBZ/1oHprvN7kUy+nW5MolCa4OqHCTOBSeFrAZdPHVL9clrwL
	fLTXc=
X-Gm-Gg: AZuq6aL7J0HcSqDfpPs5zprZCI3N2jasWwvezp7uUFjGTXDoa4BHQ9vvNy9LTJekaFR
	v1Ygi5kUaIo5Da0uiBz0hgGl3uNI3OFdXDFzY0tqkOQqG73CWceP2UHcf9CBH95/xmvQO7x5GRX
	X9w0Dovg+ymCN910J9SzbdWvpH8HhMc+LYSAp3wa7ufd5hYZFu7FjmGpx8EQfIFpaDCJML2ty0p
	uDrUiyopf7lQFvMsnGWN9MAl/9qIlYDjWgZyhymIWHZZy3gTYt0v7QhHezM6kvEnxvaiQKuqq6e
	IahuX3mwDk00ARS4l4bAwEFVnL+AGaXTHZt37D+Q7FUZsdJWU0yr8mvMnsM+RSsIjwJkG0Ix8nV
	eyYqvHSqJ/9nAMjDG3Z0mFOLtgp+TJOafWo16ScLu9h8I7nPdNSkLvFhz2S/U4oj8+erQG/HBnX
	uERDc84t1dDJM=
X-Received: by 2002:a05:6a00:1482:b0:823:b1f:892e with SMTP id d2e1a72fcca58-82369291d8fmr7020257b3a.43.1769672931533;
        Wed, 28 Jan 2026 23:48:51 -0800 (PST)
X-Received: by 2002:a05:6a00:1482:b0:823:b1f:892e with SMTP id d2e1a72fcca58-82369291d8fmr7020227b3a.43.1769672931008;
        Wed, 28 Jan 2026 23:48:51 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b49fecsm4534634b3a.15.2026.01.28.23.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:48:50 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 15:48:24 +0800
Subject: [PATCH v4 3/6] media: qcom: iris: Add B frames support for encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-batch2_iris_encoder_enhancements-v4-3-efaac131a5f7@oss.qualcomm.com>
References: <20260129-batch2_iris_encoder_enhancements-v4-0-efaac131a5f7@oss.qualcomm.com>
In-Reply-To: <20260129-batch2_iris_encoder_enhancements-v4-0-efaac131a5f7@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769672917; l=8832;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=iFs45nynpZOghqFuo9jLK6SG17R7NMwuI2dqh5glhlc=;
 b=aSIKszaG+xqAAa9KuRVopsCgQ2ojY2fQ0WahZxBjROYq4KvmDCOkCyDxQFa6m8mLEB6OcIQzk
 2ay8VsHoQJ2DAawNbZsUjEOKq05VGybTvT6NtGRZdNyEUPUUL/ptF83
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: dG_lwq8o5sPFvmuU6d1cDy1yMfSWCeqM
X-Proofpoint-ORIG-GUID: dG_lwq8o5sPFvmuU6d1cDy1yMfSWCeqM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA0NiBTYWx0ZWRfX/m1Lf1BC4Van
 jmDAB9TKnpxRHybJXdDpajpA1s17yifUCozlZ2SB47voseIo7lH2FvfCQWelyuOy/1ogKG8jty3
 dn92g1SBZMY2keKpLTjM1q+ijJwWb3sFsK4g3cklXgWg82G9fPKQ/lkEeO8sex2rBwcpGyZC3S3
 jf6c9J5zMNDdI8fSmRpl7TklfkiGlW6IHUFxjTpvNE3vgd9Y8hVBOCrV8dFZ64zeKd7zW46jtWb
 5ff5Kg1LLuw7P3UiqTYxXkl9tC3aM4298+hiGJLtreZCkRX+lUEP5doKJh3bESRb54fS0eDCv0B
 pgn/BBO5DIeE0l3Ma5kC+Ia8F+MRBamLfnOsmQ/24UdZmLzo7zfEQwds/O2FZUJjQjWXrzJalGR
 Gyq/T2WeCMrYf77ARDElUxi2USjUtYoMYHBOH8jlwungz5etgELXSBPGQMrv6G4syOpWQyTZPNE
 XIbQ4Of8BNXKqdUVThQ==
X-Authority-Analysis: v=2.4 cv=Cs6ys34D c=1 sm=1 tr=0 ts=697b10e6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=2_V6wWdUOSEACiTAc7sA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_01,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290046
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-91131-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF114ACFED
X-Rspamd-Action: no action

Add support for B-frame configuration on both gen1 and gen2 encoders by
enabling V4L2_CID_MPEG_VIDEO_B_FRAMES control.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 30 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 ++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 10 ++++++++
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 18 +++++++++++++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 10 ++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  6 ++++-
 8 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 9a9dec022b35e94c800fc13ec35bdbba520e7168..e049c28db1d8395736ae6970b5efbb351ce427dd 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -118,6 +118,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return USE_LTR;
 	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
 		return MARK_LTR;
+	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
+		return B_FRAME;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -225,6 +227,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES;
 	case MARK_LTR:
 		return V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX;
+	case B_FRAME:
+		return V4L2_CID_MPEG_VIDEO_B_FRAMES;
 	default:
 		return 0;
 	}
@@ -1161,6 +1165,32 @@ int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_
 					     &hfi_val, sizeof(u32));
 }
 
+int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 gop_size = inst->fw_caps[GOP_SIZE].value;
+	u32 b_frame = inst->fw_caps[B_FRAME].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_intra_period intra_period;
+
+	if (!gop_size || b_frame >= gop_size)
+		return -EINVAL;
+
+	/*
+	 * intra_period represents the length of a GOP, which includes both P-frames
+	 * and B-frames. The counts of P-frames and B-frames within a GOP must be
+	 * communicated to the firmware.
+	 */
+	intra_period.pframes = (gop_size - 1) / (b_frame + 1);
+	intra_period.bframes = b_frame;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &intra_period, sizeof(intra_period));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 996c83fdc6f492dc252771129fc1d62e8b7a7e07..609258c81517b71523b682ca994786cdd020b07f 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -41,6 +41,7 @@ int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_ty
 int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 74f9feacfe3562d44a8415de83fb7a6c058a3d8c..87871fed09ed753760b6057ad4afa87be5f91b69 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -720,6 +720,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mark);
 		break;
 	}
+	case HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD: {
+		struct hfi_intra_period *in = pdata, *intra_period = prop_data;
+
+		intra_period->pframes = in->pframes;
+		intra_period->bframes = in->bframes;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_period);
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 34249fc0d047918c2463517b8303e30df3666b97..4343661e86065f5623b2c02c7ee808a3c47a8c41 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -155,6 +155,7 @@
 #define HFI_PROPERTY_PARAM_VENC_LTRMODE				0x200501c
 #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
+#define HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD			0x2006003
 #define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
 #define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
@@ -484,6 +485,15 @@ struct hfi_ltr_mark {
 	u32 mark_frame;
 };
 
+struct hfi_max_num_b_frames {
+	u32 max_num_b_frames;
+};
+
+struct hfi_intra_period {
+	u32 pframes;
+	u32 bframes;
+};
+
 struct hfi_event_data {
 	u32 error;
 	u32 height;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 544c65dea922ae693adeeba972f1418002fe3f92..67acd98e467df037d49d2ea1830038c0c8fecbaf 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -165,6 +165,8 @@ enum platform_inst_fw_cap_type {
 	LTR_COUNT,
 	USE_LTR,
 	MARK_LTR,
+	B_FRAME,
+	INTRA_PERIOD,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 42addeeda47a849dbab2758b11e948606479f25b..e9016609127b83b933a18e44250fd43d25f05959 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -295,6 +295,24 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_mark_ltr,
 	},
+	{
+		.cap_id = B_FRAME,
+		.min = 0,
+		.max = 3,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = INTRA_PERIOD,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_intra_period,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8250 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 617879ec0fba39c0f8529d69ccf0bc7612445110..a7ee63e5cbd8b476d765f29ecb3a7d5d52fae269 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -770,6 +770,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_use_and_mark_ltr,
 	},
+	{
+		.cap_id = B_FRAME,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_MAX_B_FRAMES,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_u32,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 891aed5091c7a0fd0bf1f1a3a7737d49e6d8cea2..0ed82dc2b8af8c789df1b8c10c1a5afc51ef39d8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -936,11 +936,15 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
 
 static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
 {
+	u32 bframe_count, ltr_count;
 	u32 num_ref = 1;
-	u32 ltr_count;
 
+	bframe_count = inst->fw_caps[B_FRAME].value;
 	ltr_count = inst->fw_caps[LTR_COUNT].value;
 
+	if (bframe_count)
+		num_ref = 2;
+
 	if (ltr_count)
 		num_ref = num_ref + ltr_count;
 

-- 
2.43.0


