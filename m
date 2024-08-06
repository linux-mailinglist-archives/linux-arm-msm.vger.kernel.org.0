Return-Path: <linux-arm-msm+bounces-28026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11237949A5D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 23:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDF31284AA5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 21:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CEF16EC0B;
	Tue,  6 Aug 2024 21:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScglTBQV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7399D149001;
	Tue,  6 Aug 2024 21:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722980706; cv=none; b=ej5PtV+/0EvMOX/huY/0hq4VKdOqZlBS3HDUveeFoSd7i1FJoNdyBevS9dkBFR6D+9j1ethH6ObsOQNqjIZeJvrmpjF+qF4UfYkuLeGPdPosDlVpYF5hsjfXeHzhplbKK8NAiTV7I8ghbgBOa2s1UTXL+QCeZRZzla1srAJDlpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722980706; c=relaxed/simple;
	bh=5fGtm+0TePKeoW5A7+ayM9+rNstUUYsVnS0z4qNirOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=If1zDBaGtMutF52/2ITbv7yMPGNzdDbkPxcsUNJ7IxtWqzJQyMnb4GN8LdK7CRunmkoX7aPnrpbBRb7LKgSHW1AZ32cf720oCl+y/kyX6YIc/z3dOkRC4rSV40afn84OWuPKRVCWSPk9+JikP2pL25J9vUMbUcfzHdInAO0K3n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScglTBQV; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6b79fc76d03so6539616d6.1;
        Tue, 06 Aug 2024 14:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722980704; x=1723585504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KLSFBItpfPwWFfPLR9boww7jDHN1tVOHaURUpYvMBEE=;
        b=ScglTBQVKd0Ua/8x8gA8r2pMmWCs/DnS8IlaOSwy7vQoiUTT1fROwwVyHteoLmpNEf
         FyXqzy1i7Q0dsaGqUTto4C8LYy70r4Sbpv6kyVZYWUpP0+nj8v0lVjuy9uFYoWHvNS8d
         F/8l9IrNIsuWkUIhpz3CiL2kAaum35kk/ZD6FZU3R5ezbd39EJyaJKhhQPRcTaonyjdx
         fidrL0NzkGjJQvlcTSFISs7+O8Cr/kG8NRLj10TtGUx8XMVQgx1ihzAyh4/J6/T6xcfq
         YpS/fZJGcnq+IoDuiBxHyRkHOy4cJSaRYJI/+orVlpIgPCMJUvbziBr1EkBAbm9AKPPI
         m71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722980704; x=1723585504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KLSFBItpfPwWFfPLR9boww7jDHN1tVOHaURUpYvMBEE=;
        b=Gv1cscqhuhSx6weZzkSBuUsE9g15gQdnGu4FgvOIFuavwJSWMpi33RhCI6YcdkVx6O
         +sq1xVfcWZ8ZrrLkumgmFLgxSRA1SXA1HGseeomUITvpo2p1LpvKD0OK3Z16YjoBPOXt
         Jyy0EmJV7kYED+hqeagDddEtpMoG5v4PiB3rBpfZEjZZaTKLt1f/9UzyrEjH2dCSNCoC
         w2S5Yj3AnoZYZwINJRydfikLTGUrmlg9GNXCPvsSehKd5Tu1KZGZFEErV8gh7c3m2GdJ
         cT5EGTMytgY2nmy/Dqdtv5uhKCyN7qW85T6Yehu6PpT2/QGAxjeGoYpG18mVAAk4lDrx
         rRkA==
X-Forwarded-Encrypted: i=1; AJvYcCVGhkCPEb3fm5ZSPe/ceokgexIaCrART8CvMMuqgAStPy7zKc3BEm485voJoWD+qT2rYlZTOF/wHVbGDLaUlJzpCtfzU+OMSD274DOmi0YV4aFDxKJWRSUpAfMgiI1pbmr1iXeZVYhMd1PlaFEQtXH1WlRIxvJd0yRJZmKQd7ghebKiaHopOBU=
X-Gm-Message-State: AOJu0Ywp1M+uaVSvKwjcGUk+4b6lWLitBhEdOIGYaavHvKLEi9DKHZG1
	W6q41+xj/ZYtML3MXjoetb7zZOtLjOdyxfrU8WmLtS09QaA4vKsT
X-Google-Smtp-Source: AGHT+IFzOssy1QmsgTWYBcHvTJ6UtXaK9mBa3BKvdzHuAXAXu3NvSanPEiUvUwUK8sWEO6PJLngQLQ==
X-Received: by 2002:a05:6214:3387:b0:6b0:7eaf:febb with SMTP id 6a1803df08f44-6bb9839db29mr175608146d6.31.1722980704128;
        Tue, 06 Aug 2024 14:45:04 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c79b875sm50530676d6.49.2024.08.06.14.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 14:45:03 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 0/4] drm/msm/adreno: Add A615 GPU for SDM670 and Pixel 3a
Date: Tue,  6 Aug 2024 17:44:54 -0400
Message-ID: <20240806214452.16406-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the speed-binned A615 GPU on SDM670.

Changes since v1 (20240730013844.41951-6-mailingradian@gmail.com):
- add Acked-by tag (1/4)
- add OPPs exclusive to some speed bins (3/4)
- enable GMU by default (3/4)

Richard Acayan (4):
  dt-bindings: display/msm/gmu: Add SDM670 compatible
  drm/msm/adreno: add a615 support
  arm64: dts: qcom: sdm670: add gpu
  arm64: dts: qcom: sdm670-google-sargo: enable gpu

 .../devicetree/bindings/display/msm/gmu.yaml  |   1 +
 .../boot/dts/qcom/sdm670-google-sargo.dts     |   9 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 180 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |  27 +++
 4 files changed, 217 insertions(+)

-- 
2.46.0


