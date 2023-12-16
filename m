Return-Path: <linux-arm-msm+bounces-5077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E0C815A29
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Dec 2023 17:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D54FB23711
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Dec 2023 16:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C525630359;
	Sat, 16 Dec 2023 16:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vCNtlFGc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7F728E04
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Dec 2023 16:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2cc690a3712so60921fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Dec 2023 08:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702744021; x=1703348821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QpymPf5W5y5Shl7nysrpt+V7X2oYQ2I1k51Yugu0cks=;
        b=vCNtlFGc6IaEU6ZzgSo1JT214ZpsH0q335VIQEWqQuvO3efswqY0jGt1Mn/pF5+K1h
         SWckEL39LMjCBG724Xw9wuOSQ+zrNPpyJ4zM7yAxfTtbBTfXqtbX/nsQ8pd0oj7wUOl3
         aJJLM0lkkDqws+e47UogqGRbT9dLsoq1GS+eyQFneT0sd0ybzI1avABlY3WErQKcynTc
         d7SMkvPcCnLW0lNfN3ffUkJ3/t2CPcmvs8RWH7oAaUZRv5KLaD9ABEWNPW663T9bFEMi
         wCKJ7tLjRs2y8Bxi5W4rUuXZz9X86lqnSxLknhghd/NyGKM5VonSpXoOKr1NXgpiMl15
         SP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702744021; x=1703348821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpymPf5W5y5Shl7nysrpt+V7X2oYQ2I1k51Yugu0cks=;
        b=osKdzIU4p8U6g6gJYp8HBTB8jRQrVZy/6k9Oogl+qZR5LZb4cJPVy1K4N36fZCEKUH
         Kx9w0YTaSfWA1xKkdq8Efey8Icjd6pBJgFiyJYUC9r2Q06CU2jFYXkeXkZcMMXKiBeJ+
         2OYam60kTOSYjjXITZAjIcvEv67XmGV4dRqHfr7iXACIhMpKzeX2wvJhCzmmf2UPKwhB
         Nj8Uhptn/h4V2axs807IOhsoB5mg+i7Lppp2CXGllbZ77vPx4y6vyMmq1qBeXb+krPWd
         7EncGZbJKLvW2TX06bgAR+l8HFrRUjNqOkHBjV0ceyC1MYCyWauazd2v1PgLxqlRuy8P
         +14g==
X-Gm-Message-State: AOJu0YyCmJL6d5LMaHyJDF0DyGBUD0Byf7CavMdX3puXwHjl2zqZufG2
	mLaWMgY7WhMwgr52BchOnlhx5w==
X-Google-Smtp-Source: AGHT+IEzJv9PxeELq4rLJVwVWAxy9nj88uWbQPTvAZWb06q5uYlFMOyb55v82sGRftrePQgsTXrvmw==
X-Received: by 2002:a05:6512:b14:b0:50e:c7e:4bf2 with SMTP id w20-20020a0565120b1400b0050e0c7e4bf2mr5054810lfu.133.1702744021180;
        Sat, 16 Dec 2023 08:27:01 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u19-20020a197913000000b0050e304d437dsm69229lfc.223.2023.12.16.08.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 08:27:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v2 0/3] ARM: qcom: drop 32-bit machine Kconfig entries
Date: Sat, 16 Dec 2023 18:26:57 +0200
Message-Id: <20231216162700.863456-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kconfig for 32-bit Qualcomm arch predates DT and multi-machine
support. It still defines ARCH_MSM* types for some (but not all) 32-bit
Qualcomm machines. The MSM_IOMMU driver has a strict dependency on one
of such kinds.

With the DT support in place, this has become obsolete quite a while
ago. Replace all 32-bit Qualcomm ARCH kinds with the single Kconfig
entry for the workaround required to be enabled for some of those 32-bit
platforms.

Changes since v1:
- Renamed ARCH_QCOM_SMEM to ARCH_QCOM_RESERVE_SMEM (Bjorn)

Dmitry Baryshkov (3):
  iommu/msm-iommu: don't limit the driver too much
  ARM: qcom: drop most of 32-bit ARCH_QCOM subtypes
  ARM: qcom: merge remaining subplatforms into sensible Kconfig entry

 arch/arm/Makefile          |  4 +---
 arch/arm/mach-qcom/Kconfig | 41 ++++++++------------------------------
 drivers/iommu/Kconfig      |  2 +-
 3 files changed, 10 insertions(+), 37 deletions(-)

-- 
2.39.2


