Return-Path: <linux-arm-msm+bounces-27340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E30659403D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 03:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D623282408
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 01:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B451BA23;
	Tue, 30 Jul 2024 01:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBsEL/Q+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E702881E;
	Tue, 30 Jul 2024 01:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722303510; cv=none; b=XWh6o7NZat6pXUOIa6QuRvr4s4fL2mJPoXbuiwuQjaOPEgoX66hcCXGvTjWiaaU9F9SdbvDV31d6PlMLggX3JLU8ovV+kAPVpSwHENfDX5N10pBPQf48cMKDNZkHsfkP/WPIo2rL2utq2BDruSO3nzEiiSQSH8KfVhBa8YDcdLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722303510; c=relaxed/simple;
	bh=vCMeJLxBE1E1OUKIuCiF5v71+zDefOF1YYBnAe/5hlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FcEkdPoIGlgiBlmFSP5FEhFIWIjNDlxDuzn5c4ysU7z+kDo3Oyy8DpNDrX7VxNnfIx09t+Ui7Cn8T7rT945NcLTR0Yxk/9GrQpUwvtA/zuDGgUSgvo8p2B4KEmHVCfQ+2mDZVtLkT3l71g2b04juxqHkMcwEs3Onl3wbkWy+SzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBsEL/Q+; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6b7b28442f9so43844236d6.3;
        Mon, 29 Jul 2024 18:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722303508; x=1722908308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kl23btDpfXcYyDJZrQxbw4uzYXVetl2r/66y8xWnu+c=;
        b=KBsEL/Q+S7UTDaCiOzd0IBzUZs5tOA8+/O/lE07STyLfPMn3rENNsVMQYlDNO+LeNc
         CsFWXIPVbgfw3pgUKQmAsKWXyO4FWJjV1LmaulwDVFpRtEOUtEpwgQVD9NJmICaS4M8W
         0vV8cojb4NReK/Qtc0jgh+PCksqoQQFG59fSt8P2BTn5oy3XI58rTrMbACZ1FQNWhrFK
         nSgCYdrCZJInBbh7yUXbD53455YbUArxnw6ZuVxPFKBp+A+W/yvOE01HIduVExuFS5bh
         Xv5LxWN3mopGFJw3Uuqn1t6Uqw+nG8gN979VNCmg87Zfnya1XDVMExRtNMQdwed2SsZT
         I11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722303508; x=1722908308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kl23btDpfXcYyDJZrQxbw4uzYXVetl2r/66y8xWnu+c=;
        b=YrHAgCyflPSD8E/jjIAW6z/5osHNECZQcPaNQLVuMp5nrDZxpRynVjGlLjs4KnrY1b
         KSrjcAINZahnVI10ihN16S3N9eC4PUjRA5rT00ZSTDNIt74jSlOwdzBGcpPJeOxOjIJ4
         K6lipvEzdWz93RC+4l/za191HXJLRqjivYpWMuLJSK/msTq+D87N+CXPpmDufoU0Tzl1
         kDtQJZiatzFaLN10e3auO4VRdVFy6NK/RcT6Omf4XVU77jNrc1nxYzKysq5AQycKg/z2
         Yf/AWc0q7gbMNuyBs/x+SWQiMQrmZzqpP9Tw+PgcoEg+CHKCNxEBsVHPVBs63VQAwaVq
         8anQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3Hk5gLK5RaCoDdDVI/7qyy7OcTQbFMLAWdJ97u5sLgFY9g9QCHoLUAWCJrBscwL+1mr0+iu80+FW0cVp/KaxAtx/0tFDdz4rAmtoteylml7wbvY/oYAbmDJ5kP5wDHvLcHbm6BDX6tIU=
X-Gm-Message-State: AOJu0YyXGJJX6X0QJGlzaNzjdeejUPTRC7aPgAND1os2j9WI9HByr+1C
	T/FI/GX9EXuOnRFnH1i/A6om6o5diz6OtIuGtCmDtDrwih/oBJ8OQRRDlTjR
X-Google-Smtp-Source: AGHT+IFjfgSVi+KOR/NBYMpeFH2G10iYQT6mSJZ9NSOEk4wpt0+LukvkRQ+bUHo6la43XxdEZ8Y39g==
X-Received: by 2002:a05:6214:cc5:b0:6b9:5bfc:557d with SMTP id 6a1803df08f44-6bb559b4d46mr170582156d6.1.1722303507968;
        Mon, 29 Jul 2024 18:38:27 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb3facb1e9sm57947226d6.119.2024.07.29.18.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 18:38:27 -0700 (PDT)
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
Subject: [PATCH 0/2] iommu/arm-smmu-qcom: Add SDM670 SMMU v2
Date: Mon, 29 Jul 2024 21:38:21 -0400
Message-ID: <20240730013820.41702-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the SMMU v2 for the Snapdragon 670, used for the Adreno GPU.

Richard Acayan (2):
  dt-bindings: iommu: arm,smmu: add sdm670 adreno iommu compatible
  iommu/arm-smmu-qcom: add sdm670 adreno iommu compatible

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c            | 1 +
 2 files changed, 2 insertions(+)

-- 
2.45.2


