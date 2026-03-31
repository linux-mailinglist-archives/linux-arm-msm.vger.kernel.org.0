Return-Path: <linux-arm-msm+bounces-100935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL4wBxtQy2khGAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 06:39:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F74363E9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 06:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66869301990F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 04:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CAFA2D5408;
	Tue, 31 Mar 2026 04:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EuuTu2AT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XUBzkxSo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAA623643F
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 04:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774931870; cv=none; b=cWQILUZirMUzjcOFLOl1An82WPsTla7T/CRci1STrlqJLyRT++ITqzr2a2zNDorQydYUnrmCXgyMLZv2Qr4ud9z0gyCEnKw6YU4qw3cvz4le9Y+DQ3EMFa1q6jqR/3sc6QOYQ3aB1lbivOLjASU3Ul69Kxvbivy0c45T9P5lVEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774931870; c=relaxed/simple;
	bh=vNOvFG3NWZdXP6lkXqeN0wFrU5C+pnOxUCCMOYW/N2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tRD3Gj/rJH1p+2knUd/CQJOHsLM7h1OvAXi+OrwVn23mBPUxZAHfQnkrLJFGpGvEbSr0iknk5Imy5rIjgaPAZ/Bz8/vQ5ZJ/ae1KOg1/kYUy9hoMXVrOIUzWIxZuxvR62kqkxYq5BFRGh7hZn/6ktUw6BPceFykAg6PYKtZsnR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EuuTu2AT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XUBzkxSo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V1DYXP3173909
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 04:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kR8Irg/q+gw7a0zsDVOhQ2W3UFpdUJJN3+8xc8TCvVI=; b=EuuTu2ATyShgLB8X
	sYKTAEAR/FhTO6OnlRqd1WD18kphDQhLMxwxAknXEYyntJKf6IxAKAnNvaWR/2u2
	+Yn5DU2H4LSvUgEBatYdt2rCE6xGKrkInY5PZfb4VRYwYvZejDQ7TXZP1yJFXXLl
	V4aYEqrcSva5QuJukssu0uwXNFTmzugjTRoqC5BGlWCPCvkucyt6gbCwweY02VpO
	M2qMMfYWU7uJYnd/wk6iTh4Zd9LKeNVx1Nr+gs3Ow4z/OZ4rBVov2lD7tKal+xbN
	Ng3epGVkoZI9Px/3LSBY6cnvEyJ1gDsnTA4ia1HskmBko0s4PQPlBaTKWMoSSI9Z
	VSSdFA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h3n37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 04:37:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so4635262eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 21:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774931867; x=1775536667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kR8Irg/q+gw7a0zsDVOhQ2W3UFpdUJJN3+8xc8TCvVI=;
        b=XUBzkxSo1oKu7S/zA1C2U8nFK/n0qbXTHfn6JylFfH0q0W5cCNSK4tA64gGeMOfGBo
         RAkavwBg4B8klqmsPCeJ4AhKg3A2gONsD2gYcf7d8MTZSgnReB2qIgWVk3jM/4vl5nZE
         QNqHDUVeAh1qfWaLEkYS2kdz7Il+T96XoQeaS5+m+03UPfEj7LFR5LgLPGGdV+preMK1
         Y5ILjSfo8n+cQ3y7ILNpReaMPxBfVnfmNH2csZFg+6plRBBSQMGmVjMgcPwFcqvvs226
         21SN2RoE4SWl17EwkptHoh/lpEhRYanZV1ALvD2JdP4kkdCqxBm41eiX/A6hhxC11MT+
         lwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774931867; x=1775536667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kR8Irg/q+gw7a0zsDVOhQ2W3UFpdUJJN3+8xc8TCvVI=;
        b=JDO3YNfZFzagQ2RqFG03asvrkssYnUoXEU0IfyMjNvm1058/GD6Dhi9Uw9Bs49xh4h
         pFHu8yDep2mFKeRvqDID68fbREd8wi0DWEpc34LjgkFy5pemHm+q22aVTFkDWa7/YoAa
         SqpZU3f9boTF6p8QUuZpL0BYAGnmF7EZG/1o+IaZD/KW/ivb1Cxr1ILWj/PLBRy5dokI
         dEpw4YrjmBoJb6LWiXTcVfdjNXZZKJllAk4yvDmSDd/ks/j62ToRZG8wNXSPAR2GZgor
         1vkIa+Gx07OcOfa4PJor/6p0IEkmVTzSk4ehiNFuGt1VJC8bKvmvKozqCNZdO4h9uAZG
         dV0A==
X-Forwarded-Encrypted: i=1; AJvYcCX+AxR71VWtrHGA/S5qSHsVLeSmi7Zy1ghwsZ/ITh24pjxEibJNf7YG8GPdLS0vGMZc0q4Sf2SClqwzSzDj@vger.kernel.org
X-Gm-Message-State: AOJu0YzBnZ3s726ZtdwYkYwwCWpQVVCPAl6TM5Og21jgxV0ObQIe9+zC
	Ut1g+0N9gN0+o4/xlHKTQ7MNAFRA50Xsxp2h8QaMfObCzqLsoqe/S74zDMHzscLRWZProdgljzq
	AR/K2AgzJDqY6LptQCfuRYJXnoT/gfn6xzr0GztNqFJiZyLQ8jEa88z1ol9oP+4rnPsf2aaI3tK
	Jh
X-Gm-Gg: ATEYQzxH3sEkcCZapMPnY2Ia4wrUJSjckOBsinQ3h1b+4Vsb4HguhP+74NpnAiiDrG2
	KrXEY8ZXfk9lWRpPGrSlGhBmkOq8kFoCIRZCpDS4izpvZK/NnkfC8H73nq2jr6mNH2EptwixtlL
	QeiIHIByvmGHW0v9BI4I/A5R3ZA1agiF1i3DmKWtYbyam1PCwK/pTcZyoqdy0d+cjfbazGMLfkj
	Mue6Q5UjyJPZSugGpKOdBQFztgtE6nrpzDWBY76xmoNro3QneIaqX3jKZ/tKZ18AO5nkLeBxZ6/
	6robBU6l9Dxz6P7x4MmGH+HB4PgFLzY3b9m4hZccoCbC7ExouuHVYzj3rcnx/HQ6tqEwoP7r/K7
	XcYuIvtD39csKGvgG+47m+29L1Yqj3WxVdVkTOzuI6zVKkuk5arZK
X-Received: by 2002:a05:7300:148a:b0:2c6:7f49:a873 with SMTP id 5a478bee46e88-2c67f49bef2mr2749128eec.26.1774931866482;
        Mon, 30 Mar 2026 21:37:46 -0700 (PDT)
X-Received: by 2002:a05:7300:148a:b0:2c6:7f49:a873 with SMTP id 5a478bee46e88-2c67f49bef2mr2749119eec.26.1774931865920;
        Mon, 30 Mar 2026 21:37:45 -0700 (PDT)
Received: from hu-renjiang-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bd9894sm9252248eec.4.2026.03.30.21.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 21:37:45 -0700 (PDT)
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:07:09 +0530
Subject: [PATCH 3/3] media: qcom: venus: relax encoder frame/blur step size
 on v6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-fix_venus_bug_issue-v1-3-e4ae7a1d8db2@oss.qualcomm.com>
References: <20260331-fix_venus_bug_issue-v1-0-e4ae7a1d8db2@oss.qualcomm.com>
In-Reply-To: <20260331-fix_venus_bug_issue-v1-0-e4ae7a1d8db2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774931842; l=3330;
 i=renjiang.han@oss.qualcomm.com; s=20241001; h=from:subject:message-id;
 bh=vNOvFG3NWZdXP6lkXqeN0wFrU5C+pnOxUCCMOYW/N2k=;
 b=4THH6t5Rul/hqB62kH63/SiPX9566kmFOzRD/h/slkuoCXPj3/8KJbjd+hkZS1XiG//r+jiYP
 nITZppfiFrPBbXQd/3+QORgsa9kj8c2ClZK+MVVT1Io1LN+TAb293IV
X-Developer-Key: i=renjiang.han@oss.qualcomm.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0MSBTYWx0ZWRfX/+XlBkxYCgt9
 7hQQmVJx9c9pffsvKJrPOYK1Rlum2uNu7AoqCRoI48cmBED4xJ4OI5yxGuZAFeIZgbCXgzZZFjR
 fcPL+6Sy4dOCknD2gUdd69eq7HS4WVNzR5T5V+uhyOHlQ52Efr4FJGTbnXxXNm8BUD44PSNwUsL
 52dbnILtogcO1Umey+AARBaAH2PuX8Alwr4zXm7uJcZ/YtYZxQIHgdxsZw/zy+pREy3t4tpKBqk
 jH9i4lS/7VcW/KNt+3YxHJn/upSogCH4X+aoixUYT/NmVa0JVVv8OlPDBD3bsBN97s8cnG+Ebf7
 YBBdf2vz1LnX25K7cSgyFZSitzbvLGZ1OJPjhk4zAGBufrbPzG7mNudprPljDlz+IMGRgW40oFf
 UzecNfhJLze9PnHfgcxfGhqOHAbt9zLLzPakhO3oDo6kxpg3nxjdOqjXWb83Yv+uLKIYTX4SC4t
 HrM2i46UzlaiFAvJ23A==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69cb4f9b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9aUIKaMk1Dojow7eGAgA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: e-jbRQuSxNE1R90wrEXCzwfWzwDqxfCm
X-Proofpoint-ORIG-GUID: e-jbRQuSxNE1R90wrEXCzwfWzwDqxfCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310041
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100935-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[renjiang.han@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,samsung,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B7F74363E9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Encoder HFI capabilities on v6 enforce a 16-pixel step for frame and blur
dimensions, which does not reflect actual hardware requirements and can
reject valid userspace configurations.

Relax the step size to 1 while leaving min/max limits unchanged.

Fixes: 869d77e706290 ("media: venus: hfi_plat_v6: Populate capabilities for v6")
Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/hfi_platform_v6.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6.c b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
index d8568c08cc3612a0024d36f65c741151a23459c3..fb8d10ab34043ee676bd7adcf9420d4274ce9d78 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_v6.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
@@ -173,8 +173,8 @@ static const struct hfi_plat_caps caps[] = {
 	.codec = HFI_VIDEO_CODEC_HEVC,
 	.domain = VIDC_SESSION_TYPE_ENC,
 	.cap_bufs_mode_dynamic = true,
-	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 8192, 16},
-	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 8192, 16},
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 8192, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 8192, 1},
 	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 138240, 1},
 	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 160000000, 1},
 	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
@@ -195,8 +195,8 @@ static const struct hfi_plat_caps caps[] = {
 	.caps[19] = {HFI_CAPABILITY_RATE_CONTROL_MODES, 0x1000001, 0x1000005, 1},
 	.caps[20] = {HFI_CAPABILITY_COLOR_SPACE_CONVERSION, 0, 2, 1},
 	.caps[21] = {HFI_CAPABILITY_ROTATION, 1, 4, 90},
-	.caps[22] = {HFI_CAPABILITY_BLUR_WIDTH, 96, 4096, 16},
-	.caps[23] = {HFI_CAPABILITY_BLUR_HEIGHT, 96, 4096, 16},
+	.caps[22] = {HFI_CAPABILITY_BLUR_WIDTH, 96, 4096, 1},
+	.caps[23] = {HFI_CAPABILITY_BLUR_HEIGHT, 96, 4096, 1},
 	.num_caps = 24,
 	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_6 | HFI_HEVC_TIER_HIGH0},
 	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_6 | HFI_HEVC_TIER_HIGH0},
@@ -210,8 +210,8 @@ static const struct hfi_plat_caps caps[] = {
 	.codec = HFI_VIDEO_CODEC_VP8,
 	.domain = VIDC_SESSION_TYPE_ENC,
 	.cap_bufs_mode_dynamic = true,
-	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 4096, 16},
-	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 4096, 16},
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 4096, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 4096, 1},
 	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 36864, 1},
 	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 74000000, 1},
 	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
@@ -229,8 +229,8 @@ static const struct hfi_plat_caps caps[] = {
 	.caps[16] = {HFI_CAPABILITY_P_FRAME_QP, 0, 127, 1},
 	.caps[17] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 2, 1},
 	.caps[18] = {HFI_CAPABILITY_RATE_CONTROL_MODES, 0x1000001, 0x1000005, 1},
-	.caps[19] = {HFI_CAPABILITY_BLUR_WIDTH, 96, 4096, 16},
-	.caps[20] = {HFI_CAPABILITY_BLUR_HEIGHT, 96, 4096, 16},
+	.caps[19] = {HFI_CAPABILITY_BLUR_WIDTH, 96, 4096, 1},
+	.caps[20] = {HFI_CAPABILITY_BLUR_HEIGHT, 96, 4096, 1},
 	.caps[21] = {HFI_CAPABILITY_COLOR_SPACE_CONVERSION, 0, 2, 1},
 	.caps[22] = {HFI_CAPABILITY_ROTATION, 1, 4, 90},
 	.num_caps = 23,

-- 
2.34.1


