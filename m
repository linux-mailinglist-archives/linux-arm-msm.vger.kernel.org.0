Return-Path: <linux-arm-msm+bounces-99384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLsyD7yewWmFUAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:12:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7BD2FCF38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 11B3C3018690
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327BD36680D;
	Mon, 23 Mar 2026 20:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLR59CsO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aUOFSUeH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DAF3DEAF2
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296762; cv=none; b=uvNueF97EwvUpUEcvj6RHtsYHdWqVu9B20aXeXHlTAqD3yWe1uw6xqZhUpcAvR8ETzOoFBvWdeZnOmPoLgDuYb3vi8V5B0dx7Lf6KSNxZFsppq7PEUHTqfexPl01dCxaPHyaBEIelkLqyZSsXac2DvhuUU66vjOeN1RGAOorjZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296762; c=relaxed/simple;
	bh=tsrqhnh/4KQGcogalvfrZcWTtxfmVrAZkQvMOMIVg4M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nXxjXp9HraGAZ7qARypld4rBxDBXFd3KJ8x97Khew+it+fzDeoQrV9Js10pCWJ95ML33p2JIkX743QuuNwyGTWXnOZjdjS4ni2lUQkHwJJfMTHXxpawRoc6xUwea7caSYft8FV3C3vyxRt+IlIjA6ZMH3WCGpuHH36kwraAvGmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HLR59CsO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aUOFSUeH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqW6q2831807
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7VzCEBL2E65XFVAgC4ps2o
	FizCEaaNONz136DmmOrqw=; b=HLR59CsOSltyNVhtBVvJfKWVqAdCMvgQOjHpxs
	GLwRYr7lk42ZpiukN+muRGVBgOzxV5FNc+J6pyFlUfuU70hu2t2kawgbmgvOsSYR
	MweP/dgOM9XpXjUko2VK7wVXWwcH56yTMKlzeJED9iMDDC0VY1U7acV+Jy/N1aLd
	pWRkg9AdLUaTDcpF0IxUOkIoYgoHZAVM/gAENsRO1YeoX95qbs+tL54a9CQIYwfF
	7X6D9UVa7aoy+PLhD3oE2j41oh12YXe6ThrotZxHnfqIGglyliOWbsrdF/hW8WXR
	AlXuvnUnAg8UhhWwFj6tjfWdE9cDxkq1iJ+ZWa6pUfgH8RTQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d364jsgjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:12:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7380305a9aso3678039a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774296759; x=1774901559; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7VzCEBL2E65XFVAgC4ps2oFizCEaaNONz136DmmOrqw=;
        b=aUOFSUeHB/SBzQS3a2SWw+TbswXxsqSKqDWnrtGyjL87ihVLZXvLpILvTiX2UebsqK
         /w/y7WtWpZIoYJu/UHKY9+aQWDQS8RsLnJg3miqBO6DOwVgih8dkcM+8aKhS22tiSxtX
         UtU9ua+3pow2uRfp/sgP1xGvO9htry7lcqisg1ZNi/ikc+kVz2u5GjVc8rI4stQGbxEG
         BaNCkphnC38qZPKBOVHw9Mi3hNs4EOa8xP3ecCgObjjuIsozG8j5Z8abQsjzRFoITeZs
         CXfAlEJkufbqHj3YsC282Q1aUmavXo2kmMpLl8/Dm4Lc3bxWH8+FzmXsIx5HNEn331SW
         F3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296759; x=1774901559;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VzCEBL2E65XFVAgC4ps2oFizCEaaNONz136DmmOrqw=;
        b=CUkwAilMXKwH0QwfaQt/Iehxx3zx13d+qClbUyg2Zr84dmUGInuDaA7989ywkC5b0w
         K4KoPL+XRBaI6pY50ZsAkl4NCMIOUz4Mno9CfmTR5/IWTTddu3j1gOWsgaEmnyNy/+3x
         p1gC426EHvlUGkx2Bc77tk9M5YQ8uy1dp3AfZKIXlTCKp7BzvhZwPxltcNvN9/+B0rQN
         mrLg/IR3MXBnte4qD9Wi7fcCtx9TFrX8kVOxJq7ZQUzb6Rn4WPPh1WvQNKtYpw2X86wD
         HUnWnn8Y7pfhS0SpOqlYb7V01/JENNJx5Qqkd22ok9xTXlY4Tm89YovMvxaAlnoY7lNp
         twJQ==
X-Gm-Message-State: AOJu0Yw7UJupWtOkHc1EMNULW2tGYn6EAZ4uo8A4xvQMa+vfhkjBJma6
	4S6XhvYFZRkrvUSJ9YrErJzIMbAJ4Pu0eczbklsKVZR5tBWERqYd+VhFUy3d7h7ESOghSbQHXcK
	ogTU+aRPv083K3U5moNFDSuPDJzQCrABTjLMysx1TcbeJGZXKNMSyIKBzr7E0oubuus7jbPQjWT
	eS
X-Gm-Gg: ATEYQzz01AhqCt2MqUPPOz9Pmqwt5qY8wXsb/Bm8Aw2QqstO92CViRmBqzBwh13axkW
	tvHgLXija0k0wNROAM38+k+r3liAHD7vmm8eJakoVmpmtKy2lxxJH5KC102B3+yrX3SQIbC8FwU
	kmbuhGoR3XOKkOO3idJcUHLKZz7/PzbP730omMrQw7kErjEFCeCBtlr0xZozENeYeQRgrsQiRSy
	h1VtF/jxTyrzrqm2Frhoeu+lDGImfiiNMufE6JC++YfnfPkZDq5vcuscLSn6KUF7dCar4IlaYJW
	6rNJOipwjwIxbyErR4mBCaQTghE4Zr+ROd+jUimn+psBwL87yZ3PZUq8kPILtiNJbbagzn3CCZl
	LGE5bStZhH/Hn5nbEmbzVLz3SmqjGvwM0MVQvInUZCLeU7A==
X-Received: by 2002:a05:6a20:cf14:b0:39b:8e94:c4b2 with SMTP id adf61e73a8af0-39c30f2549dmr461610637.12.1774296759128;
        Mon, 23 Mar 2026 13:12:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:cf14:b0:39b:8e94:c4b2 with SMTP id adf61e73a8af0-39c30f2549dmr461599637.12.1774296758637;
        Mon, 23 Mar 2026 13:12:38 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409d148sm9510738b3a.29.2026.03.23.13.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:12:38 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 00/16] drm/msm: A8xx Support - Batch 2
Date: Tue, 24 Mar 2026 01:42:12 +0530
Message-Id: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJyewWkC/yWNQQ6DIBBFr0Jm3UkotrT1Ko2LAQdlgVrAhsR49
 1Jdvp+89zdIHD0naMUGkb8++XmqcL0IsCNNA6PvK4OSSstGKaRnKTgsKxrKdlRo3MPd6XWTmix
 Ua4nsfDmK7+7kyJ+1hvM5gqHEaOcQfG5FHwOGFPBw8P+CskGpodv3H9XMsYqdAAAA
X-Change-ID: 20260322-a8xx-gpu-batch2-bf7f5a9406ac
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774296753; l=2904;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=tsrqhnh/4KQGcogalvfrZcWTtxfmVrAZkQvMOMIVg4M=;
 b=UaVLyFZNH8WCBkbqcBCGLkm0owjayRG3hP5gk2G2xW5UTRGfbWqgl8mTdmxRZXUYTByncwUrD
 QlBDrqICFoUDd45PseqO/C2GSCnr12nbpnY/MOEUMFIF7WdppVA1w7O
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 1eefQcEOd5BU6xWWGBxmUtoa4ol8Cv-r
X-Proofpoint-ORIG-GUID: 1eefQcEOd5BU6xWWGBxmUtoa4ol8Cv-r
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=69c19eb8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=69T32sAQ5s3mN8b8UpsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0OSBTYWx0ZWRfXys/dqABjnzbf
 vUojtZLErHgCK/0eqPpFG8aUFRKiU582ZOOWx/J9AKxR2VYRCXQsKd6kjImH9/z+8/JIbXaR9K7
 BuWesdQUSp/OECyH5tDjxhIoGQ1mMdywSxugHjEUaTfIziicmaZwc7P+hUv9RhMp0gLb+Pe8TCp
 Ow1WtS6OSAeaYLRHeutzSWSFdl/UFc4fhAPokRkEGs9k7qtc4SG3g4cD4aNvt5ys6WZduaL9vTh
 eznAnX2ymVPmBno/31rhKhxDUdIXgWGnQuLzjNL/Ww8bJJ5r56/1XvuesNnuaNkIhw/V6IVWbPu
 1NXX2XZ3DcgWW73VE+k0z9Pe27uNm6VlZUrvQrV6a4oDQwWeoy3yf9cg6KLNzSyCZTx6CDCmHc9
 hdw8Yd9tygRu7GZlqnQhNUE5UcGuRblYVhGwqHyGGenajA7CCb5h+DMocSCd7c5Lxb9GzABZ/Mg
 SkbLRpkzPMBVfmf5CfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230149
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99384-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE7BD2FCF38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series brings a few additional features for A8xx GPUs which were
deferred in the initial series. First few patches are a few general fixes
and improvements. The next few patches adds support for SKU tables,
Preemption, IFPC and a UABI to query AQE support.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (16):
      drm/msm/a8xx: Fix the ticks used in submit traces
      drm/msm/a6xx: Switch to preemption safe AO counter
      drm/msm/a6xx: Correct OOB usage
      drm/msm/a6xx: Add support for Debug HFI Q
      drm/msm/adreno: Coredump on GPU/GMU init failures
      drm/msm/a6xx: Use barriers while updating HFI Q headers
      drm/msm/a6xx: Use packed structs for HFI
      drm/msm/a6xx: Update HFI definitions
      drm/msm/adreno: Implement gx_is_on() for A8x
      drm/msm/a6xx: Fix gpu init from secure world
      drm/msm/a8xx: Add SKU table for A840
      drm/msm/a6xx: Add SKU detection support for X2-85
      drm/msm/a8xx: Implement IFPC support for A840
      drm/msm/a8xx: Preemption support for A840
      drm/msm/a6xx: Enable Preemption on X2-85
      drm/msm/adreno: Expose a PARAM to check AQE support

 drivers/gpu/drm/msm/Makefile                      |   1 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c             |   6 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c             |  12 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c         | 243 +++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c             |  89 +++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 155 ++++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h             |   7 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c       |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c             |  33 ++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h             | 155 +++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c         |  77 +------
 drivers/gpu/drm/msm/adreno/a6xx_preempt.h         |  82 +++++++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c             | 166 ++++++++++++--
 drivers/gpu/drm/msm/adreno/a8xx_preempt.c         | 262 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c        |   7 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c           |  17 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h           |   5 +-
 drivers/gpu/drm/msm/msm_gpu.c                     |   5 +-
 drivers/gpu/drm/msm/msm_gpu.h                     |   2 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml     |   4 +
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |   6 +-
 include/uapi/drm/msm_drm.h                        |   1 +
 23 files changed, 1101 insertions(+), 246 deletions(-)
---
base-commit: 38d568f154c66430920b01edc9c722ec14aa54d7
change-id: 20260322-a8xx-gpu-batch2-bf7f5a9406ac

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


