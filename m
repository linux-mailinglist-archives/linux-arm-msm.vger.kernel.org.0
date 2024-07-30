Return-Path: <linux-arm-msm+bounces-27344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B759403E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 03:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 030EE1C21377
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 01:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B9BA23;
	Tue, 30 Jul 2024 01:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSA57cnE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DC51426C;
	Tue, 30 Jul 2024 01:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722303532; cv=none; b=d4NKXZP6X3QPyBLuoZh5bAAa+IXqPnfuQqTt3J4n7PCRidRQqpwSVymBkiNcid8edTtPdV9fYhWDIOIyUVjS0BTp4PlJFhKKfYkXit8HvT2MUZuG+Shk3Fm93VVAiS3oE4MnJS4HLdzW6UEhoKMRxxSC1qyEu4U9V1SYmBgGpF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722303532; c=relaxed/simple;
	bh=DeWrz3VqxhKlcDlvp2OeARJOtHuhyh1WuRgVwy3hW/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NyOg/NsP++/nAlg7/7GpLf99sZ7iXO/NPAhG7mgmQSerSZ/r8IU9gKU+a0W2XoH5K6LZtgzJviKyEyfK4WZpbolXiDxgA4uY9KRrwYHdVjbt2DtwTTwsf7557OAYjLEMGpbhObi1utX7SWC5Ft8dtjV8haclIns7OnxAsZ7IIOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSA57cnE; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e05f913e382so2388985276.2;
        Mon, 29 Jul 2024 18:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722303530; x=1722908330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5T2H1MxibV59R6E5ponVFEf8aVMT7LzzdBaNyOKYAQ=;
        b=LSA57cnEMyMyBdbLRsKCebWzhMWKupN1iWE6urUNNI8Y3uA82FYgRXmAU7AQQ1zcSj
         Tosfa6H3UQIblcFY+VIS1lRhhUm3KLehdAgzvvQjgAjtMpKOYaf9lOmzreCX239pi6LO
         gYaHpFg4HaKO5vRe+Xeawknr38pIG9GWiLaUOSedP/QACAO7hae3+Km/o986B1P1W9vk
         4D5x3hmNq7H2WDa1bycACo+hHG5WG7FivLL2SjosGu/68GdZHNccXOKko2S9NRR6TpA/
         ciVJju6QEkvDV1z7PdS5cNo05g36Bu2yUezwx4BtMu732szRNJJ86dZTJtYjybKygihR
         vYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722303530; x=1722908330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5T2H1MxibV59R6E5ponVFEf8aVMT7LzzdBaNyOKYAQ=;
        b=UqFTKV6plrnFjf4ghIy1FlSAhM+k36z/aTIHwJoHLL69/kGpkOANjg93iI8DxBRwXe
         9kYKECoOadTw2Sc/kSlscJ2lT5OljNPY/gFuz3B5HRBwA0DhD7ZIOM4cJGAvoP+1G3tQ
         iUHhUBcNZUjBSCEDF0QCm+D6d6G/U5a7OfVnn8xsKDzoQmW4zAtBfJt3vAJZtDUhnV0y
         oPkyfIr4mCP+WuPTmfDfoNdskU8xnMhKiGFknqCqOJZVmU5jTQYfhjnVXMiOhnoi/vX3
         KHqSmh3s0Me4w2PJuLc0/6a07Qy4g702GtAM3yoe4PcHuiKbztIJdj2CJzySXkTbJOYq
         uhNA==
X-Forwarded-Encrypted: i=1; AJvYcCUqr0e2D/QSOuXx3Eg0zpqN7Ch8a92/Ihn8VMLW2rQWZ4D+PSFFwFAwN/Ph/yMz6aDOVP1Qp8MvhvS3y8pCUw==@vger.kernel.org, AJvYcCVvqIBt9Y6L5gzM3K20IeJ0q/Cq+oy22z6VZgNQ7cg/aJoAOf4OYZPLeu1j0Wq6hPhWbdg4KIgBn7Fq@vger.kernel.org
X-Gm-Message-State: AOJu0YxQfXJswkwfIm2/F9ljrAeG7h9NFiNDXJlXnEFXj+R4OJ79Wz1m
	NIznFd3sEUEdJiEkKGO9BrrnHqifqPThzCWlasaUlywzW8bkuaD/
X-Google-Smtp-Source: AGHT+IE8CCqiBQzc9P2bfVnL3NGKo0Stf9R5bLEeJaR55c3XfqJse2oFJU3IpAa/r9TGBMegBbSatw==
X-Received: by 2002:a05:6902:124e:b0:e0b:97c4:77cb with SMTP id 3f1490d57ef6-e0b97c4831fmr2285692276.27.1722303530216;
        Mon, 29 Jul 2024 18:38:50 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45034f7804dsm2284681cf.16.2024.07.29.18.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 18:38:49 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 0/4] drm/msm/adreno: Add A615 GPU for SDM670 and Pixel 3a
Date: Mon, 29 Jul 2024 21:38:45 -0400
Message-ID: <20240730013844.41951-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the speed-binned A615 GPU on SDM670.

Richard Acayan (4):
  dt-bindings: display/msm/gmu: Add SDM670 compatible
  drm/msm/adreno: add a615 support
  arm64: dts: qcom: sdm670: add gpu
  arm64: dts: qcom: sdm670-google-common: enable gpu

 .../devicetree/bindings/display/msm/gmu.yaml  |   1 +
 .../boot/dts/qcom/sdm670-google-sargo.dts     |  13 ++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 168 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |  27 +++
 4 files changed, 209 insertions(+)

-- 
2.45.2


