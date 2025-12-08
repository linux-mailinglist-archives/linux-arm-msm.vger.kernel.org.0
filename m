Return-Path: <linux-arm-msm+bounces-84619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A9BCABF7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 04:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D87ED3018186
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 03:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B179F2F617D;
	Mon,  8 Dec 2025 03:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBMqLymv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y3zmyEfx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A292F5A22
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 03:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765164831; cv=none; b=pi/wfJwzfVtJlUyI5oIf/lqZb4DDJJ2jMkoajxxVtu8q/tkOB4qBnEnMW7+oRlPg60H0YM9x99OZEJiTjSlboW6ZiBSOPCVbbtpGGxpI7clK7z4/Kbs3sHick7y8tXHnWuuK8slckktxeoJKHNbpsLX771i28yR4bnbIz9Fhs0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765164831; c=relaxed/simple;
	bh=nrpyGRDbRTzil87p0IDZgBpYmVtwM1uvVSenw0xPFpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UYLSeXlOju5eMbtjoncH3ku4L7VbJe8LllEj/ZluZTXzNSnl05a2EdBrtyuOJoZglvnhKjNlcmm1P9n7zy/cPZ9wBUxJ4dBqnPtgO48wpZNViKQqwDDr5SD65S5xgx4tb0tVFq8vc0z3O3vuWXSjWmvIhmoQiMZl0cjaw6mt8+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBMqLymv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y3zmyEfx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7NpkjH3588580
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 03:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vECANsRZAsv0+/HcW0Znhs
	Pk5JYhO1vf6Ev66v/SoT4=; b=SBMqLymvhsOYKX/Dp6GsGz/NNwmw9k6WlkTFah
	HJXtBL/gnW9hL2fZoAfiCxlg/ulRKdCNBfr5XPOU10HEXrPsR9Uncb/gNEhCmiXq
	cKllVQtfPYa9MfGH8s8ddbjWVMuZiMXx13cNA5uB43FNTd20qBmGnd6rKYvZYb2w
	LShJ/3EeZ2R4d5QdK0Slt1IBS/WIFH4zBbW0DwoJQOWrrzI0QZsJFokROsqeBXiW
	PThTvw45OHl7His0F4lwGG6UfnfSiWBd66Jz4HzAds9K1BsLP+b0TC7Sg/MsYvWc
	QR7ZpKtRhyUv9aK8+cQHDFxalDNSHoD3FWhERgECATHJqwyg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcjvbfax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 03:33:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-295952a4dd6so44966025ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Dec 2025 19:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765164828; x=1765769628; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vECANsRZAsv0+/HcW0ZnhsPk5JYhO1vf6Ev66v/SoT4=;
        b=Y3zmyEfxaKjqABqBmJROCituejoGW5BAhMop/eZHxkHwP6BAIInYDRWyw9xoHVSnQ1
         Vi/GfGTDAzbU7fXxf/UWbJG7EiqpPg3lRaftv/1eytmCFr+pjgPigeCCH3VYkYkv/V2R
         igJG3pzBtJYPtYA61SymYzSM6KFkU0EFNK+NucdYwI9OmzfBizws9W910K8aivjXB4ru
         O6U8YXS6KB/T8mJ774+RjoOR5ZpJ+XgqYLoONohIYzKyJ3FbYzCYuP28BABWrhNsSetu
         xm+W2/C2vWA85Cg7tK0FOSYkRVjncyzcY1MSseXRc7OptNAohAWEZFew5ksJxBsD4O4T
         8/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765164828; x=1765769628;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vECANsRZAsv0+/HcW0ZnhsPk5JYhO1vf6Ev66v/SoT4=;
        b=V4lbqJNCqayk9lJ0hRMjxwwv/Cykvy8tTgT0QnQF8fR9o7/rrp6m1ax5POmBLaxZvM
         NjdjR+tF2ZL9GS65B9veKulJjxMB3KZCPFT4DsGDHINUdZ/yEuuz0fxCgTPzOSvgFtzb
         ISHO77KgjBMBZBQdi/l8eZ8qpcbohhFRESKTKVGdMwfyIhf042qXZmRDOeNdoDNNuWBh
         9XnslCD714s2yC6j/p4VPG681JRt9tpvitIuQeqrz8qIvFZwqN9FnC/xlyYS5uAqC9v9
         HpFoARc+mQ3cs9ruZCnhWZlaAVhG5GYveWSbjBGqgtHyW4EoVbY8XebwojH/2kMhugGh
         8cBw==
X-Forwarded-Encrypted: i=1; AJvYcCV+g61tpNd0o/24BckolBVdYjIDkqDWugUSO+ZxDJ3XF8lpg3t8QvB6/TecP9cw8Grhq8wdnLfZV7WaRY5Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxooAtrpvs8Rw+2Od+VHDmhtdzo343XfYBt1rGNTNbY9m5/96NX
	0fsgiScSE4K53ohDGFLr0LU9OXjZ2FBbuyI/NNfknl058IIHoKgkbl+/DkXigzXVjKzLDAdsJOC
	qHdgLxPCBlW9ruRXk8cgI0TcbZDCbDhvBRzx+CQczd3I6Mm3O7G/3GvdkyNrQMa214m8v
X-Gm-Gg: ASbGncu7485fUsCulyMtcGamiF0rk30OT0LDmMvJippNnAqd/xCNJRdAIaQAH14YCOs
	Gm7myLyb90/IrRz8KgmV7TAKI6vR5uPAj/m8o5Xa8B0yNnwXWUYxMZP13BQ3Y6GVPUOUwfTYElG
	dG67zxQQzdJVnqsxPoicMlXWmdLVGN0zXQV9AKEFeZYzdBB/3WV/Z8KJYutGCJpm4+Lr3qyj6B4
	U8cLzY7OC7bnvshEU8QQX1gh+NO6gfHUee+oW1vIVFIDwY9jF5JFTV605ICVAeXz7i6SHfbSsRS
	nQYMVuRSe6mIhUTSnzRzRaXKXFBAAtvtp8926rncK7G6dqFOLgXZkyoOW6oWRJCwdiy8yiPIhku
	i1SHLbv/77gD7ihM+D1r9+CLfiUH97QTRUY1GPVAGQGoI0Co86flY6H5YQdmHaZZWBOWFrWozjl
	OvbxmIY1g=
X-Received: by 2002:a05:6a20:72a6:b0:35d:b415:7122 with SMTP id adf61e73a8af0-36617f04261mr5397834637.26.1765164827910;
        Sun, 07 Dec 2025 19:33:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOSp1CHXkk5vR8ZWGY1ypXn5YdHgRhkrIoj/QqBPGpdX2bidaEXrhd+8hg2OkcoU241CbTBw==
X-Received: by 2002:a05:6a20:72a6:b0:35d:b415:7122 with SMTP id adf61e73a8af0-36617f04261mr5397816637.26.1765164827390;
        Sun, 07 Dec 2025 19:33:47 -0800 (PST)
Received: from hu-renjiang-sha.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6a36bbc60sm10545177a12.36.2025.12.07.19.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 19:33:47 -0800 (PST)
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Date: Mon, 08 Dec 2025 09:03:42 +0530
Subject: [PATCH v2] media: venus: vdec: fix error state assignment for zero
 bytesused
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-fix-error-state-v2-1-255b62ee2eb6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABVHNmkC/3WOQY7CMAxFr1J5TVCdpElhxT1GLJzGGSIBgSRUg
 1DvTijr2Vj61vfze0HhHLnAvntB5jmWmK4tyE0H04muvyyibxlkLwdEaUSIf4JzTlmUSpWF1Dg
 qGgc1Th7a1S1zq6zEn+M3Z74/Grh+l+CosJjS5RLrvjNG+d4jBRWIAxurJnJBO+N6a1HvaLTkL
 Qb4sE6x1JSfq+yMK+xfrxkFCqXDTjc7h2Y4pFK29wedP6+3bcBxWZY3qVg0YAEBAAA=
X-Change-ID: 20251126-fix-error-state-24183a8538cd
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765164825; l=2033;
 i=renjiang.han@oss.qualcomm.com; s=20241001; h=from:subject:message-id;
 bh=nrpyGRDbRTzil87p0IDZgBpYmVtwM1uvVSenw0xPFpo=;
 b=IC8/VmvIE54k3bj645ATMZB3udCmokzu9hbG1W9b+tMkOGNvuINt92VLFFIqcI2LLFrbbLeMA
 V6Mt4cFi6NKB/m0ONAlpao34nsHn/8uar3tKZ0W1csimWAj437RUMxp
X-Developer-Key: i=renjiang.han@oss.qualcomm.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-Authority-Analysis: v=2.4 cv=Dccaa/tW c=1 sm=1 tr=0 ts=6936471d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2SL7H1QK8vwNC9hrVHQA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDAyOCBTYWx0ZWRfXz0GVcFLSlhj/
 s+kLz1Iggs1iGxquPHy7fzUW6Te2DvNB0KdlNIFG23STOZUkZNRPTMLxKadpiuqSxiSxVvspBEK
 +dsMfL5CQ/qcxRZ5b7gDfN1Sav+2SP2N17VhSmasNx/S6GZHa/NcbKdiuKLn2PBG26PWFgKjM4x
 gsJubbQD3MD5ZLLWjU8dO+/xx0rK7XQhCwLPd73TYpi3EXPjD2tBO1heJe9eTR4MNPcSOnu2ill
 Vc2txUmOruG+p3WDlN97jsTJSkm7NN7z4uwDLeAa/Sx9vuKF7n2uLE26zKBkXiXj0q1zD8zx6f7
 Wu0ZxnQuWQg1kleztaPLJshDnMNlwqzC8+dVtqEbm85we8OrUFynYf224YiB9N/aeEfG+BPVbSe
 SyCRD0af2870iT0BlqSG2QjnTh8d7Q==
X-Proofpoint-ORIG-GUID: lMK3Oq46_qdOnhNDOg4b7nyKha_RHMD0
X-Proofpoint-GUID: lMK3Oq46_qdOnhNDOg4b7nyKha_RHMD0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080028

When hfi_session_flush is issued, all queued buffers are returned to
the V4L2 driver. Some of these buffers are not processed and have
bytesused = 0. Currently, the driver marks such buffers as error even
during drain operations, which can incorrectly flag EOS buffers.

This patch moves the zero-bytesused check inside the non-EOS branch
so that only capture buffers with zero payload (and not EOS) are
marked with VB2_BUF_STATE_ERROR.

Fixes: 51df3c81ba10b ("media: venus: vdec: Mark flushed buffers with error state")

Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
---
This patch refines the error state assignment logic in the Venus vdec
driver for Qualcomm platforms. Specifically, it ensures that the buffer
state is only set to VB2_BUF_STATE_ERROR for non-EOS capture buffers
with zero bytesused, preventing false error reporting during drain
operations.
---
Changes in v2:
- 1. Update commit message.
- 2. Add a Fixes tag.
- Link to v1: https://lore.kernel.org/r/20251126-fix-error-state-v1-1-34f943a8b165@oss.qualcomm.com
---
 drivers/media/platform/qcom/venus/vdec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 4a6641fdffcf79705893be58c7ec5cf485e2fab9..d0bd2d86a31f9a18cb68b08ba66affdf8fc5092d 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1440,10 +1440,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 				inst->drain_active = false;
 				inst->codec_state = VENUS_DEC_STATE_STOPPED;
 			}
+		} else {
+			if (!bytesused)
+				state = VB2_BUF_STATE_ERROR;
 		}
-
-		if (!bytesused)
-			state = VB2_BUF_STATE_ERROR;
 	} else {
 		vbuf->sequence = inst->sequence_out++;
 	}

---
base-commit: 663d0d1af3faefe673cabf4b6b077149a87ad71f
change-id: 20251126-fix-error-state-24183a8538cd

Best regards,
-- 
Renjiang Han <renjiang.han@oss.qualcomm.com>


