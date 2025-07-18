Return-Path: <linux-arm-msm+bounces-65642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF0FB0A13C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 12:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 299EB1C81120
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 10:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B0C2BDC32;
	Fri, 18 Jul 2025 10:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KCNOCUkY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E422C2BE023;
	Fri, 18 Jul 2025 10:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752836070; cv=none; b=gH3ilvQvdJRT6Nd1HFQDEbukKoWHGR8d6Eoa8UOIPEMKJczEfbNoFgLZpUZ+ZPth6MAs7zdQW9F0xCg5nx9FNCoDedoSpPw6N3qoTmoDU1rJUz+hTstcoOFeecSbxhKHLric4L2tv4u72ekZMCt61b+fh6YtQo5kjAE1PBJXugA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752836070; c=relaxed/simple;
	bh=DcifpRdDner2fj6W9Zx9zgD04arAmO1TSTumNsIisT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sqRt31CE8M3yidMXkch+dwcR3O06d919HknmJs8neF/1EYfv6w4DmxSWR3PKHw0N0y5gFeXU43E5zj0DCaP0IyTob1jrFsRXdW3tG95eXxU/TPsLNDfjHB7nlry2qocMcr3F917z/CpMT2b9qMmY0pqSs7zX/s4wKSKPHMejoZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KCNOCUkY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752836067;
	bh=DcifpRdDner2fj6W9Zx9zgD04arAmO1TSTumNsIisT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KCNOCUkYes2/54fgCGIHjrDjFy1DHXqXEPSFz0wxCD0pgcCFoq5lNZqMtune+HtNi
	 6m3rrIbFN4ZN8tfSAdotWU+S/NMb0lvy2bQA00sMYPR0JYsmRBeKZr0roUpGRAAn+U
	 6TE+9rqibOHkcRCM5gLQkqwzHnd4d8pRS/7DCRxOsA9pofco1BUulAaICf0dCAtrwh
	 dfvXUWov5cKabLimFYIXktubZEhG3DvI02WUdq3/4iHa80iydeXJmgskUePPROwd0L
	 C/cSdQxVZ5r2pRq3oFPukmGciryaHexfbzdtMF+6+Bn+mnsC0e5f07q7cxCv+HB0qJ
	 GRzkIXRIrW8uw==
Received: from debian.. (unknown [171.76.80.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B702417E1522;
	Fri, 18 Jul 2025 12:54:23 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	lumag@kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/7] drm/ci: reduce sm8350-hdk parallel jobs from 4 to 2
Date: Fri, 18 Jul 2025 16:23:54 +0530
Message-ID: <20250718105407.32878-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250718105407.32878-1-vignesh.raman@collabora.com>
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The sm8350-hdk jobs are short and each test takes around 2–3 minutes and
the full job completes in about 10 minutes. Running 4 parallel jobs uses
4 devices at once, which is not needed. Set parallel to 2 to reduce
device usage.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/test.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 53d19ffaaf61..d1ef2d91e7d8 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -185,7 +185,7 @@ msm:sm8350-hdk:
   extends:
     - .lava-igt:arm64
   stage: msm
-  parallel: 4
+  parallel: 2
   variables:
     BOOT_METHOD: fastboot
     DEVICE_TYPE: sm8350-hdk
-- 
2.47.2


