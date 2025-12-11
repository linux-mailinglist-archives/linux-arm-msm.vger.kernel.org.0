Return-Path: <linux-arm-msm+bounces-85018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C457CB56AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 10:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2F6A300D494
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 09:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDC62F6597;
	Thu, 11 Dec 2025 09:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FubxAGEr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K+FsIEAG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE2920F08D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 09:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765446672; cv=none; b=EiFbsSTZ+b4z0vMNLHS62KLHqLw+tGnUK9Qpk5sjAg3gm+wlcL/pl0XA9oUbHuZ/xeIoIdey460HOLYxiEALAUsH5MZ/uX8Ovr5MkgWkZbAhomsE/F5oW+zaiz9/osaMZ2NpIUSJ3QT8SThDfHXol9QfkXWT1oreU82vEMgOhyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765446672; c=relaxed/simple;
	bh=Cyr9yX44wGLSvSvCE4NwC+GFqktTTSRroUEpxQNxMSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PwkLiI3aQ1EbvkZJUlC2zyp+5eLkNgATlCXO+SQG5jXmpvv/5TG+8xru4YZ/TrmMhqIN7CtbGE+v53IRflPoPT1oqgz3W3aeBvrKhQy7ErnSJ6f+vzm7Zmv9Vxjd+OTfo7za2aJ4InBI6RzwT6RCt6vDXb1aobx2chNCfOb/+9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FubxAGEr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K+FsIEAG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB9ZQ1E1400523
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 09:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=D737rmLvyrPEw/1cTMLYY3
	h+bX71102iMZlqNuH3bF4=; b=FubxAGErzSqT8zJ0vh+3plJDF79a9pwzZjRth4
	t/a5mWW67v7tB789y+uYELPc6eAVSp0xVTGeYw29het+kB3iHHsrkK2Vp8FJsA8H
	5woyU5XY1ThgRbjTQADst7dEIYzB/Ejqs1TFUmwIGki+TYZ0iQs0gyXNqMRDCKg9
	JYH/uHZpzXHx689bL4enfqq5t1chJ7+dVu6ybKxbO5qmo+NLFBMaOZGQUxmbA5Wi
	QT62IQfA0RENwZoO0Xn6/Y5qeFzCX3zeKuLeoO1PZxrkQFmMBhYZNfZ7WaCysx+1
	BfmbQZQBfW4qSLwk0OOHNUWCNoBe4IxDobLCXImbcElSadFA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayguqhud6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 09:51:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-343daf0f38aso1010056a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765446669; x=1766051469; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D737rmLvyrPEw/1cTMLYY3h+bX71102iMZlqNuH3bF4=;
        b=K+FsIEAGux0otVHsXnb0eOZm6tJ+pXI57Y107S4QvIgtGZZs9uoRodOC73ngWrcenl
         F1OhQ3Sx8aimyxpw4JHt05iSgLYeG5vpsJ12A9drjZbT2sSSgkcyarmeAmFIn8/jXrqT
         TtM1j7GVUc416IwOy49d9cDMzj5PCrK9A9UWUZZN3+3zQQIdDjaO0lsXz6t4qlGvAvRJ
         GA31d/IyKDwnVC+DlWVBk9M9FfCd78Gv9o7C2Rp7VH+hr2jnBqjf6HckmtBs7lc8NUFY
         i/4Cc/iS0FBklBoYpQqJI2bPUWRreko9foAKlBa9Lwjiu+GR2rqUbsCyYx+Lkoq6Mloo
         xuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765446669; x=1766051469;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D737rmLvyrPEw/1cTMLYY3h+bX71102iMZlqNuH3bF4=;
        b=vw7HEm+8gn0BrFXsnCvpIIX/EMvODZuGi0JVkOD7y2TZahoNpxIi/NfHxhwHnrfqZf
         Z08+xJm1onjhZlrnWHlgYAZ644pD/tm6aMBfVZENoabFimjqFXsNY9+LbvehjomOOq7a
         bxmSm4QipOMoxOh8JWq/AQDOxGGPetZb9qpYnOr/ZV89SkSmKxhr4MFl+bQLweRt6KMR
         mJxZatV1xc3DzCSl8GDfixDPCgjqncDORiL+rIczGgTnadI+C0fWqbs3zk0wbN5PTFJx
         tgW3V34VAk+S3heZXJLxIaoio/4dN89iFYEXPJHBbTPxoiDGBrOpv3Z/a0aXVG2THBzA
         mdkA==
X-Forwarded-Encrypted: i=1; AJvYcCVtB0/tDRatkgH+hoVJsle9Xp89JTbplQQBb9XJInzBHtVoUSnW495YoDmI3J4TKzi0KIjVZeoWBC7mvd0n@vger.kernel.org
X-Gm-Message-State: AOJu0YytHLKglSthEp2vZpId+f1QRw0O6HSMUHYmR3/shZwO48Y2fgnC
	/fT86Vdsv0yBCOanYDLp9ELg6UpuJLyqmIshE+3oCKRZu9+bnjBav0FH8QDfAEpgaAOgPwihbMd
	x0oedDJ/ODnDX0NsI1G3Zem005Hj34a0yRlXkrGjFisru+a5xP1gyOuHD6maBWCGdzYo6QCpVYQ
	+8ZgQ=
X-Gm-Gg: AY/fxX5NQpLH1K22BA3Do+QwtoJfioEBIwmEogn3WevtMJ7LNtl+Rh9Z+rS/CWflmwS
	hQIyZhJxAVx/5rYLxp2TblANzjs9XuvVUNzNZEaefEFAmiBuwfTmN6K4B83bjczD+37PXMll1od
	4102zfilwnelwl3PGZnU0AJNMbpYQHpWl4Zysl1KvmJILSAi5nt863K0vYbShJhcbqRIReCW++j
	U8Gd4Djb5GcKbdfzb/etlDt3OrVtyGWiJHL9clMtPebFS0KupztIumXO1aVBiVeyIA9sPxh1KDN
	NAIf3MGBgRRVNMyv7uzjG1iIy74AwztbkRk9r0LVRHpfJfKBaUGRPqo/ssx74wEqoJ3fEFnEYfn
	Aa0iB65Mak7jkEJuilgTu0U+N+AlFswsimxR3wh8214oKVKbwZ/Q6itW+6yWFlViRaugN6owEo9
	3vEaTZAKA=
X-Received: by 2002:a05:6a20:918f:b0:366:5d1a:c738 with SMTP id adf61e73a8af0-366e2999d45mr6085648637.57.1765446668500;
        Thu, 11 Dec 2025 01:51:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9EjSjJCje3+4SsLuYny8cEuSC1KPnptVacLLagytwJhbAUHyHsgrXRrF7tYD3/2uEw2vxlw==
X-Received: by 2002:a05:6a20:918f:b0:366:5d1a:c738 with SMTP id adf61e73a8af0-366e2999d45mr6085623637.57.1765446667905;
        Thu, 11 Dec 2025 01:51:07 -0800 (PST)
Received: from hu-renjiang-sha.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea016c55sm19639485ad.58.2025.12.11.01.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 01:51:07 -0800 (PST)
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 15:20:39 +0530
Subject: [PATCH v3] media: venus: vdec: fix error state assignment for zero
 bytesused
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-fix-error-state-v3-1-b429262d151c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO6TOmkC/3XOTU4DMQwF4KuMsibV2PmbdsU9EAtn4tBItKFJO
 gJVc3fS6YIFsIn0Ivvzu4nKJXEVh+EmCi+ppnzuQT0NYj7S+Y1lCj0LHNEAoJUxfUouJRdZGzW
 WqGFSNBk1zUH0rY/CfWQTX14fufDl2uH2+BSeKss5n06pHQZrVRgDUFSROLJ1aiYftbd+dA70n
 iZHwUEUd+uYasvlayu7wIb922sBCVLpuNe9nQdrnnOtu8uV3u+nd/3ZyAV/GByn3wx2Bo3xFpm
 Rvf2DWdf1G+ajc0FIAQAA
X-Change-ID: 20251126-fix-error-state-24183a8538cd
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765446665; l=2217;
 i=renjiang.han@oss.qualcomm.com; s=20241001; h=from:subject:message-id;
 bh=Cyr9yX44wGLSvSvCE4NwC+GFqktTTSRroUEpxQNxMSU=;
 b=D5ucobgnlEvBYxQEiF09fDWs1wj3XGB8fZiMrGSjdaCHl6PxOOfKHGYAXqlJYHvc+QXQBgTFS
 gYAnj9ynS9FDm7YlG7f6TAA3IkxL7FHrtPKg6Z3V5r7Wi8J/YOxJYFD
X-Developer-Key: i=renjiang.han@oss.qualcomm.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA3NSBTYWx0ZWRfX+0RFaR9DSx22
 Dl1ZJlXxpeSqGkeA6iEZe8qn34YZ+SSwjwvoU2CiAUIO8L4qEmZKXH/ubZhgKGL0x4eg4o/aRRq
 nasqKTCqBTHXNzZ9kzBlmeQzFw173rXXF39Y7XHTu9GOvjsjhKdVc7JBvEf40BVxP7cHhQ7suB+
 1RLjrYueKKJFpuA6mTQY5yNkXR2lpKl9mZK6BctVRKNbW43PPD255T1NOWXRWsxYtoA9oXpScpd
 rn5/4P5hUk7tATHOjYhHTHNSQcwIfKumjDh/CTtjU++nDEdSQ8G5Xr7jOd37FdhKQGr/OY26PnG
 ch+66LFwTZdhHRmXhn/lbvZUS0lJtczy0iZ/V6i2tTmvIeu9phAEf8KERvfu4rkU+dGvBCmFCGO
 lq9p8IKeERFIXwYHupWPEROf4uCbPw==
X-Authority-Analysis: v=2.4 cv=deGNHHXe c=1 sm=1 tr=0 ts=693a940d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5Ms28dyX6PlKRWIk_uMA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: o2CMFcN5tCEYYB9GsydGDEmbMtJv_nNv
X-Proofpoint-ORIG-GUID: o2CMFcN5tCEYYB9GsydGDEmbMtJv_nNv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110075

When hfi_session_flush is issued, all queued buffers are returned to
the V4L2 driver. Some of these buffers are not processed and have
bytesused = 0. Currently, the driver marks such buffers as error even
during drain operations, which can incorrectly flag EOS buffers.

Only capture buffers with zero payload (and not EOS) should be marked
with VB2_BUF_STATE_ERROR. The check is performed inside the non-EOS
branch to ensure correct handling.

Fixes: 51df3c81ba10b ("media: venus: vdec: Mark flushed buffers with error state")
Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
---
The error state assignment in the Venus vdec driver for Qualcomm
platforms is updated to ensure that VB2_BUF_STATE_ERROR is applied
only to non-EOS capture buffers with zero bytesused. Ensures false
error reports do not occur during drain operations.
---
Changes in v3:
- 1, Update commit message.
- 2, Move empty line between tags.
- 3, Update cover letter message.
- Link to v2: https://lore.kernel.org/r/20251208-fix-error-state-v2-1-255b62ee2eb6@oss.qualcomm.com

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


