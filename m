Return-Path: <linux-arm-msm+bounces-33120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF6C990468
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 15:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2261F28127F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 13:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D337A20FAA0;
	Fri,  4 Oct 2024 13:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VjF69hR3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67B320FA9D;
	Fri,  4 Oct 2024 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048714; cv=none; b=felGR5UFE0CcnZplqFYhfEjABfr4Q/Cy2BBMygXsYj+DHiNuvAQTDC/ZMjM7VhZFusKlxupFAzu+HhkOVQRoUwd9pjuBCnRx6wJBvwqcKgFcImzZ59TwUZccMHjyRlb9fOH4yIji0229VEMbj4ORd06ao7Eka5ZGcvhLV0wV57U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048714; c=relaxed/simple;
	bh=kQpVjwQNxdw088eu2f4rB+DgTekYjxlYL+UHArKCPVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rdoKguzVfL2x+efpEskvNe1d2bpyaOtqAcE9Jn427cmzX3CKYFpSRgLiNMuQJqQAvKyqTrXAmIkuUthJPBRQcttx/9wxnat6BdbcVP7CS8vqxUl6OF9RD9xngX3c6tZdEQkqS8+aiSq2uXDC3AGNGmuWRVXjbNkJyh60oK5TeRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VjF69hR3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728048709;
	bh=kQpVjwQNxdw088eu2f4rB+DgTekYjxlYL+UHArKCPVQ=;
	h=From:To:Cc:Subject:Date:From;
	b=VjF69hR34M5MIQAvgx7C+WsI4sh3uor7V6jxkWhtx9FHz+HD75S0Dik/HLZ7+P1+w
	 syWXmZoAwJaP/4XR/h5JVGgHF48R969K9urXYHsByIfLJa5bruPvxVhJYqBQu3o2QU
	 ctAOKclso0h4hgAh2mQ+ZMwf+c1wll+6Hgp2pLZmDDoB/AFMFFs0KbAlqisWqrxei0
	 pmFXck+n1WNKANexWCDJDw3qOWXvcMRfxPVoiUwv0kxqluvdG5yR9wKy5nqxJJii+u
	 WUqjpotIBqYqutV8f+btIhdu54IMdwOdQU/HqkT8QnWBT5RuFmg0nyYnscOnLKOFXO
	 4KmRcfVOoR5nA==
Received: from localhost.localdomain (unknown [171.76.80.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0889817E35E9;
	Fri,  4 Oct 2024 15:31:46 +0200 (CEST)
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
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] drm/ci: add new devices for testing
Date: Fri,  4 Oct 2024 19:01:17 +0530
Message-ID: <20241004133126.2436930-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add jobs that execute the IGT test suite for sm8350-hdk and dedede.
Also refactor software-driver stage jobs.

Successful pipeline link,
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1283825

Once this patch series is reviewed, will send v2 with gitlab issues
link for flake tests.

Vignesh Raman (3):
  drm/ci: refactor software-driver stage jobs
  drm/ci: add dedede
  drm/ci: add sm8350-hdk

 drivers/gpu/drm/ci/arm64.config               |   7 +-
 drivers/gpu/drm/ci/build.sh                   |   1 +
 drivers/gpu/drm/ci/test.yml                   |  84 ++++---
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  51 +++++
 drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt |  13 ++
 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt  |  20 ++
 .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |  15 ++
 .../drm/ci/xfails/msm-sm8350-hdk-flakes.txt   |   6 +
 .../drm/ci/xfails/msm-sm8350-hdk-skips.txt    | 211 ++++++++++++++++++
 9 files changed, 372 insertions(+), 36 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt

-- 
2.43.0


