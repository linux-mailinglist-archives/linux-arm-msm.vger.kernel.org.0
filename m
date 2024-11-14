Return-Path: <linux-arm-msm+bounces-37856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 658939C7F79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 01:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8574B21C56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 00:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66CBDF5C;
	Thu, 14 Nov 2024 00:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fP8uPUlR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C221BA53;
	Thu, 14 Nov 2024 00:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731545249; cv=none; b=dM+4adw71oUXMX6t3zWJ59hJ+0m6bQN2d4OGk9MKeyGPfiar++2bTvyCD/n8f28iYOmMp3H3Uk6uGY+o3UIq0NQV19q9b8PE7XYd2o3KFX6riAkd6IBubbdQv71lluoUwBFrhVuzMFAEjHPLD+c9ibXbg2N37tELrc0G4i167PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731545249; c=relaxed/simple;
	bh=s7Yv5cYnK7lz1o+mJE2Zg0/f6Jz7JTl7QoI36ZaKikE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kOeo/i/HRMHGP7AIRIADBBiWNyarc4wP8EXkptn4vny4OMwCNqa10zh5ik/SNESHFcg5Hg86wIUWJHDPrEQNYvHbiwR4iA1tlfno//J2bOKya4c2E4GngCScsCXydf+X8707bNYYhuLiV3RFUDsDsualLFlj2bCDAMkTU5ihZYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fP8uPUlR; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-83ac817aac3so2999939f.0;
        Wed, 13 Nov 2024 16:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731545247; x=1732150047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IAnmVBwWFf3Xhdog2eQqQl/DSldjwsVOe2c/bV8ijyY=;
        b=fP8uPUlRKBDR7BdrATtjpIuEY2wIHAirFSAu8xxGECO3UGhjUGWYOIqUrOGkKltYCR
         Et1vIst47zDBT3Z78TL26txLRyJugs1qHN46j+8i6/Qb0Hr9tH8vSm+3LEPnqcCsnM+7
         rz5djotvhq0p9DcQWklEL6+qRJAaysACz5a7tSdJriAiO6tfcCYAwwP4x/gktaeJBkkm
         0V/1w49ebY2mw7pCn9Wzu+QjD2uteLMBhhKFiiG/C1bCqVbnXFpDWzOEZybHJFPRdsGx
         hyrnscpn3Wux1gwvGYOM5JSSa8ULQxQPKSIsBNlxX8ce3ACWA6wnH1GznL7MdO3UYN2j
         hYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731545247; x=1732150047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAnmVBwWFf3Xhdog2eQqQl/DSldjwsVOe2c/bV8ijyY=;
        b=jN0dJ0kJJNorrb4bbXNaotGrel8/2bOlTQxOLB3GXEqkUDlw2pp/V3mw976tUUMxEn
         eUyfKIg5MrrTavmFglSt/aap5/vi5U/JYWlYK1H49D0r5czJiZOJIuoNCGRa+mYi0ScP
         YkCkNPiu0IwVqnT/+8sWMT8vzgBKtgtC4ubxnIePA92z+EQWgzvnjp1+thMZmxJ97ZLu
         R2aJUmqINVorbwi7+PeGMVJSHRj9mvPQ4OGFuRUzd3AKV11FlG7hnFhT7cIdUQX6EL7L
         zlwDIFEB4udb7VAd10wmz48k2r7z0lImdveHnE1ddg0MBzJXvjXkoNdSZaNVg0GgyF0N
         ncoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcBjeoT7pwqlW0nzQjvSthMZcbOg3BhgJuhNdCKKEfNHJamzc3FdRtapiNce7zt3s/Di1siK91RcslY+wgTA==@vger.kernel.org, AJvYcCXd7sOqXDMbeSGXa4rN7WGxMOj7VS6C/69YQ66Y70TzAoObsp4ApDj4sDERNCAEE9zyWJoKOQrtRGyz@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy8eeGNmpSHBZwDexPSRDHhBF1UWDM1dO9M7p2lqTcpNuMkJ9j
	RSBmo22NNKu9167XSjXuQR2GfYXSlbDCtDWcWt4PW3cL0C2aRyNV
X-Google-Smtp-Source: AGHT+IFxRqbD12YhC4U8wkPfDwTQO33ThQkh9I8WnH/R9DUcJXRSMyZaEJfwBf3KNdmT3lZ2JubIow==
X-Received: by 2002:a05:6602:15c5:b0:82d:16fa:52dd with SMTP id ca18e2360f4ac-83e431d3082mr1061871039f.7.1731545247358;
        Wed, 13 Nov 2024 16:47:27 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::8f60])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e02fd148fasm2446173.86.2024.11.13.16.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 16:47:26 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 0/2] iommu/arm-smmu-qcom: Add SDM670 SMMU v2
Date: Wed, 13 Nov 2024 19:47:14 -0500
Message-ID: <20241114004713.42404-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the SMMU v2 for the Snapdragon 670, used for the Adreno GPU.

Changes since v1 (20240730013820.41702-4-mailingradian@gmail.com):
- explain need for specific compatible in iommu driver patch (2/2)

Richard Acayan (2):
  dt-bindings: iommu: arm,smmu: add sdm670 adreno iommu compatible
  iommu/arm-smmu-qcom: add sdm670 adreno iommu compatible

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c            | 1 +
 2 files changed, 2 insertions(+)

-- 
2.47.0


