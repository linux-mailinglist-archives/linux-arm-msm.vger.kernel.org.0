Return-Path: <linux-arm-msm+bounces-24646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FBA91C13F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 16:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34ADA1F2299C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 14:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15B41514E1;
	Fri, 28 Jun 2024 14:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="gLx1zXf5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7D61C0DD0;
	Fri, 28 Jun 2024 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719585602; cv=none; b=USyFchVEezhfXBlqgtt/hD9r5Otmbhcj2/h555OZbDE239R4En21TrYXBKe3ZHRLKKOPcr27xB5vvxdB17Z4/u+oIuRmseLVaUJOP18X2WIMWgfRab6m+iRQJ83aZJXXLyIHMq2Y5vLg11OwryOru2ZmXEwmOhBK2WVvUtOxGKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719585602; c=relaxed/simple;
	bh=EunNP/EvctUNPAP9/1nqI3Scq3H8ObY1pNrZE7DLvBk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lMf+IpzXiYEPUaNl0Dq+73R7vXzHYRYtI5+B9m89UmfNAcHnLid7/FhecLinPpPfOkM1pwNq3vYccg+I71m/pymdBR9limThv3KhIZ13kECWG+G5vPuHWkzfHT/hpcp/FJI39KqFhEA2CqSFKfqB55XD1pP+kY+lHh51R1zCq+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=gLx1zXf5; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.1.130] (BC2492F3.dsl.pool.telekom.hu [188.36.146.243])
	by mail.mainlining.org (Postfix) with ESMTPSA id 7B6DBE44E7;
	Fri, 28 Jun 2024 14:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1719585598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BpaaS2OIMoGBVUdFbPUqueqmBQUDNqTEOvL6otASaZM=;
	b=gLx1zXf5CGZ91j76c/awAbhU83Vzm61Tye15C0WwbYke+J3x0zEOJs5lV9AOk6e37Zk3hH
	LoG8lv1C9M9T/GnU+U30S5v3waMYBKzRAXtp3UDjPAv+dm8Z2++DJD/SLxM8KTIyWV9y2r
	1Dd/QezZaTcTFXkcbiWnBmaGi+DeTncB7dbfm143Sqv19kcb9s9aunODmCXConK655hAFH
	gvEonstF0yFw6b1sDe9WzACDM06o1VfMLtjf3hlMWm7QHmwAVCU4l9G6jgMWcJYErsZgFc
	x/mf+8+fzOyzgaeszYg4IpP1ViFoumdxnhX0NlcKZwvLq7in8DfxG08genmY2w==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/2] Add MSM8996/MSM8953 dpu catalog
Date: Fri, 28 Jun 2024 16:39:38 +0200
Message-Id: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACrLfmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUyML3ZSCUt3c4lwLS1NjCG1ppmuaYpCWZJ5qbGGeZKEE1FlQlJqWWQE
 2NTq2thYAKdviqGUAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: b4 0.14.0

This patch series add dpu support for MSM8996/MSM8953 devices.

Note, by default these platforms are still handled by the MDP5 driver
unless the `msm.prefer_mdp5=false' parameter is provided.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Dmitry Baryshkov (1):
      drm/msm/dpu: add support for MSM8953

Konrad Dybcio (1):
      drm/msm/dpu: Add MSM8996 support

 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   | 218 +++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    | 348 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 106 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +
 drivers/gpu/drm/msm/msm_drv.c                      |   2 +
 6 files changed, 678 insertions(+)
---
base-commit: df9574a57d02b265322e77fb8628d4d33641dda9
change-id: 20240528-dpu-msm8953-msm8996-5d0fb7e387b8

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


