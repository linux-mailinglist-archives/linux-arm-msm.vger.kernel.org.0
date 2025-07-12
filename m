Return-Path: <linux-arm-msm+bounces-64659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACA3B02880
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 02:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B7427BEED3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 00:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C8913C81B;
	Sat, 12 Jul 2025 00:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MESh5Zmo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7342D13B2A4
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752281912; cv=none; b=cmfbhf0L5yi6fVdFC5HlOIjyPf0GGdDT83LPBh1dDsmTFCMxAINo1ZpPoLubJUBK+968x9dyMkYpOOAio10zuviioihvR5Qj53lJtGPAQt8Bqv1bNKDCT6LALwi5mGuUJEHlS9edPDvHC4DR3bhXmhnG8+gDKWcRGDLFlzhzZE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752281912; c=relaxed/simple;
	bh=vzUSuTIrJH7xWxMa0K6LSztJDpe0D9azFI2sMNeqfUQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RthG27PRfS8+EMh94nF4LUQy7aPc/9PgvT+e/4fTwby0z8cTOgheJSAY6tgWGbo6Ss6WfCD8j+cyEt6yJ1FzlD3vPjvSBtxJgwAw7mg3Ud9YVO/0DbLMtz9dsyrebeU+6JB3lAgulzej9hKfFoBcqBjumvn+cduHsjmQxY0I/Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MESh5Zmo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56C0XI3T026080
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=59/HKHw0IVO/0EYapAGnsz
	AY1YeM/lgh67PJpUrMSEE=; b=MESh5Zmozy+rIb6QVAQ7No/pTcA9dXtHXSXP9y
	8JOYilDOV/7Rl/3vYA5BDXo0nX+Q9dU+KssGDu1QrlIARsEmL4V40bb8z0lU7trE
	n6k/9smxs+JC9KtZA6CoVIzoblhb28vRNgHUCiMkgXcSwMsCUzO8AZrSE4LWoloS
	JohqtIq6oMxjjikMM8JhPvaO98RYVVbfduyWWtuUjLLJoMVoaGjZSbjW/Tf0qTco
	YAVOebIpcePSQmZpKhru5/zoRoqV5oFBVhZXNmP4qvg/i6kO+sTx76b/swqyRiD5
	P78IE3kZzzkXDUroSKiRt62/eKF2lrcFX1Ni9rC/bHdzvQOg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47u1a2hwq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2365ab89b52so21516275ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752281908; x=1752886708;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59/HKHw0IVO/0EYapAGnszAY1YeM/lgh67PJpUrMSEE=;
        b=wlTxYslmUliW0kADXMCcekWnkaG8XrQLrI2hx/duUbZzp41r5GQ5yRU9xsIuq8uXVj
         i9l+iDPrwJjHwjTWckm2FXORiMPgMoTqTyQ5UW6+VQKaJnIpnmqX6Lvbu0EDwTIaYrLU
         RBCcYn+npyRPz9R0lIn4Wuh2cPBzuuP81GqyW/gyTd+R3eK+gILZx/rpHW0ISrYoreg0
         xZXsQwe4KegCtARSp/ljzcVgEJxenRhwpiKx/BIQBd/Y3lTHAfpguwQbbZ+rnb0aoLL6
         CgnG+eZP32+8dZQGPavMFmkPJGXbkeG9CFaU7Z1CgUw1YE2pYcHIboHkQm1zZw/EIZFV
         w/Xw==
X-Gm-Message-State: AOJu0YxdoIm9NSX5QAQlD4aIE5yFfO2/SzfxZks/6CrBNxlOX5GlgCbZ
	Y5hVL/FEPW9FG2oxhs0SCVuY8QmOhh8iebg9iBLQZyoi0D7rNK/T+nlguL2Pm2D7DK7qkNUqMo+
	RpWKbcIzWOdEkkG2bQmETZN3l1PZg0fm13BiW3lg2vM+FFdPaVqumU++nLjOGNDAMcfWO919Pkp
	/l
X-Gm-Gg: ASbGnctjCxk4bgos/Uc4V5LOvpT20m0VyLtZqteYUUCS1qcMcwB0eulBvCXp891YgOC
	yW5F+F4FqhTsA66BPZDY531kEjSp+krnKRUy0f/Dvp0CVJaXcFnKnSGwv7EIad4+KlCh3V7VM3E
	o98fJobZeu8KbeZVYjXkPqkq5P0ta2oc414Q/ao2D7aOkDtFwOHvaZwSV6NySlwngS6fKPP/3ad
	KNHBbgMVKfElJ7t2zQ4gqp2qzTPjMbfR7kFDrVdzH+pR32nzJiVVItpbPiJc6V8HkY+HCA6LeLZ
	hcsnjbFLiuBGNVmW2PJyVFhomXrz8I3wPG5cBKC71gAra2PL4Pj81rlfmpN9DeQpTL4IQxvazAj
	QJOiKeFwFLPWnkFDBCKqRJ/V2
X-Received: by 2002:a17:903:90e:b0:234:d7c5:a0f6 with SMTP id d9443c01a7336-23dede860c0mr65468145ad.31.1752281907595;
        Fri, 11 Jul 2025 17:58:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5ock2N1WmtzIDPmpiiQCTGKrRZe9hOCWl4TodKigqVc/zEllu9cAUP8+zwFBxzlBEwxHi5Q==
X-Received: by 2002:a17:903:90e:b0:234:d7c5:a0f6 with SMTP id d9443c01a7336-23dede860c0mr65467845ad.31.1752281907189;
        Fri, 11 Jul 2025 17:58:27 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 17:58:26 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: [PATCH 00/19] drm/msm/dp: Drop the HPD state machine
Date: Fri, 11 Jul 2025 17:58:05 -0700
Message-Id: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB2zcWgC/x2MQQqAIBAAvxJ7TrCtLegr0cFqy72oaEQg/j3pO
 AwzGRJH4QRzkyHyI0m8q9C1DezWuIuVHJUBNZIm7JUNh4p8mv32UU0DI21EI2oDNQnVyPvvlrW
 UD6PqXEBeAAAA
X-Change-ID: 20250523-hpd-refactor-74e25b55620a
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=2419;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=vzUSuTIrJH7xWxMa0K6LSztJDpe0D9azFI2sMNeqfUQ=;
 b=gcCOUPwSZX203psd2518e2CVIRjXICPtUXHrM8Y/BvpZHwTM2reabtyXUnbryy6J+rGPESLtg
 TAXE6IHFfnhC1CrGKZeEGR2gkwtDDMRRgoDX2rc/bmVOeAzDoXcfs+T
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=MKJgmNZl c=1 sm=1 tr=0 ts=6871b335 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=DWSsPxsAs24NKD_X_nQA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfXx9meE8Of4zxO
 jLVg9ccqO6yPHnM4NcjV4CctIDh+vN0SZcgaeSwVHtTGwUNE0ODpn+Q59METRHzc7N0OQ6BEROm
 7l6vdjR9ZcrF5T06MO5nZxS2p4EPm4UzFiWdUMSmYBDj0ajWTfJLY+CGJ+EQeKrSbAvJnQTvVqi
 Y9MnTeuDA7XDGNJsbQM7GUPa5goDrxjrzrL/48KV2uZwJKZ8j5I7cpfv4+3WRvdDPkz1m4FaY/A
 dg8bzYqjzOSN/sOQrX+mzkBSXovsRjGGc1oKLLEb7fHtTablwjAqo11zozBXy9g2KNr/wjSw4sv
 6y/PMmBapX1nUsibpAxkmfEFsA1gRRyaNkwgajqJwJZS5Kp7OJnCdldRWCvPv8EzRu6JyY9T1WG
 uatW8B+fvc7iIIq1rcj96x5NTEhZuLs4R4/cAgyp+Cjtc0Er+p5ajcoGR7VJexsQhnb2IvEB
X-Proofpoint-ORIG-GUID: rUH3DuGEVcYZCVORM1tExVyQ_VN5P-Ia
X-Proofpoint-GUID: rUH3DuGEVcYZCVORM1tExVyQ_VN5P-Ia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=753
 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507120005

Currently, all HPD interrupt handling must go through the HPD state
machine.

This has caused many issues where the DRM framework assumes that DP is
in one state while the state machine is stuck in another state.

As discussed here [1], this series:

- Removes the state machine
- Moves link training to atomic_enable()
- Changes the detect() behavior to return true if a display is physically
  plugged in (as opposed to if the DP link is ready).

This has been validated on x1e80100-crd and sa8775p-ride. Any help
testing on other platforms/use-cases would be appreciated!

[1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738

---
Abhinav Kumar (4):
      drm/msm/dp: remove redundant checks related to ST_DISPLAY_OFF in plug/irq_ipd handlers
      drm/msm/dp: replace ST_DISPLAY_OFF with power_on in msm_dp_hpd_unplug_handle()
      drm/msm/dp: Replace ST_DISPLAY_OFF with power_on in atomic_enable()
      drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state

Jessica Zhang (15):
      drm/msm/dp: Track when DP is physically plugged in
      drm/msm/dp: Return early from atomic_enable() if cable is not connected
      drm/msm/dp: Replace ST_MAINLINK_READY with link_ready in plug/hpd_irq handlers
      drm/msm/dp: Replace ST_DISCONNECTED with checks for connected
      drm/msm/dp: Rework unplug handling
      drm/msm/dp: Don't delay plug-in handling when ST_DISCONNECT_PENDING
      drm/msm/dp: Check if DP is disconnected in atomic post_disable()
      drm/msm/dp: Drop ST_MAINLINK_READY hpd_state
      drm/msm/dp: Drop ST_DISCONNECTED
      drm/msm/dp: Drop ST_CONNECTED
      drm/msm/dp: Drop ST_DISCONNECT_PENDING
      drm/msm/dp: Drop hpd_state from msm_dp
      drm/msm/dp: Use drm_bridge_hpd_notify()
      drm/msm/dp: Move link training to atomic_enable()
      drm/msm/dp: Log connected and link_ready for event handling

 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  22 -----
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 190 ++++++++++++------------------------
 drivers/gpu/drm/msm/dp/dp_display.h |   2 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +-
 5 files changed, 69 insertions(+), 154 deletions(-)
---
base-commit: 7a88d609b069b7d2f4d10113b18fea02921bedb1
change-id: 20250523-hpd-refactor-74e25b55620a

Best regards,
--  
Jessica Zhang <jessica.zhang@oss.qualcomm.com>


