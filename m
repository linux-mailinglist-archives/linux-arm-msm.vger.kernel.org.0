Return-Path: <linux-arm-msm+bounces-35381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3679B9A9EF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 11:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E21AF2835F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 09:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195CD194125;
	Tue, 22 Oct 2024 09:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N7E5vwgk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438D2197A7A;
	Tue, 22 Oct 2024 09:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729590358; cv=none; b=Gal5EpP6EY7mQD125BCGawt2hwlgKF9DKFcHu44yJIeXL1f4g4dummmNGfkbyy6y34IeNx6LiAT9NMWcC+OtOOk5gQxJw0AZj/7TaZWpu1+OtqXn++MGTlTSmgOJYCPgkLWVrRU0d2/yeI7jHz6QXHjPzzVJNWLGHu2ffbTtFEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729590358; c=relaxed/simple;
	bh=/iZA89Wj3z69KYM9gWhcPxr0XQZlh5V4IALN4CQoFEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sIo1X5VL4tDKA0autRJoUBKgZ4F+y02DcQLcrJ4SmqSjxmUqZJdzTtrSu8A/07XAZBqjdOxqULDnJu9qpHjPzA/383uhJv6sTo4qSOgfv/JN+ieidQtiMNSbVMA+bKdptUTZjijUbwckOqsgy0n6OTJfzzDmsmMUQ8gpndRVNww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=N7E5vwgk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729590354;
	bh=/iZA89Wj3z69KYM9gWhcPxr0XQZlh5V4IALN4CQoFEo=;
	h=From:To:Cc:Subject:Date:From;
	b=N7E5vwgkMdfMpFCcsAwUb5ARa1PUX7lJUBDMYqiLcMOBx094HGLURW25vWv2uwuSv
	 fQ9v47gM07I+sk1C3C01O9e++0wE9kPSyI4O9YAEn8CL4mhxE1jRyM8ImRMIo3hv04
	 qy5SrepGEaxf7KlKcHjrXUvjUT8AW82AlUoQM6tMFHaCEkV2eTnLPWA8tqlFfIKeq4
	 3Zwj+me1ipxpdaqcCXx3T4rxU/A28jktNP76avAQLWeixyaGCDC0m5qNczCVvGnfj5
	 3QET4OlFS6BM7x9DoQrplXge5V9ek607RzYf5/c41MBvD9h20ECDnwTTdffbbCupeg
	 oudct/6L3j/PQ==
Received: from localhost.localdomain (unknown [171.76.81.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A77E17E1395;
	Tue, 22 Oct 2024 11:45:51 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	deborah.brouwer@collabora.com,
	dmitry.baryshkov@linaro.org,
	quic_abhinavk@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/ci: add new devices for testing
Date: Tue, 22 Oct 2024 15:15:03 +0530
Message-ID: <20241022094509.85510-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add jobs that execute the IGT test suite for sm8350-hdk and dedede.

Dropped the refactor software-driver stage jobs patch from this series.
I will send it as a separate patch.

Successful pipeline link,
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1294877

Vignesh Raman (2):
  drm/ci: add dedede
  drm/ci: add sm8350-hdk

 drivers/gpu/drm/ci/arm64.config               |   7 +-
 drivers/gpu/drm/ci/build.sh                   |   1 +
 drivers/gpu/drm/ci/test.yml                   |  25 +++
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  51 +++++
 drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt |  13 ++
 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt  |  20 ++
 .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |  15 ++
 .../drm/ci/xfails/msm-sm8350-hdk-flakes.txt   |   6 +
 .../drm/ci/xfails/msm-sm8350-hdk-skips.txt    | 211 ++++++++++++++++++
 9 files changed, 348 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt

-- 
2.43.0


