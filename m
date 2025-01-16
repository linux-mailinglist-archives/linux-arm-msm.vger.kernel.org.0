Return-Path: <linux-arm-msm+bounces-45306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 808AFA1407B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 18:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B68FB7A1D96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 17:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FF022D4F7;
	Thu, 16 Jan 2025 17:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jyE9E+71"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E179922C9E4
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 17:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737047828; cv=none; b=CMshUC+uR0BnNAWU37f9/Vm2O9R/KUU0S8/ze3gtCudrZc6EESqiHQQsTaLBIGxWZPJxfKUgajzaqBgPd66cBjYoH2CD0bs3uR4mN0xekmkWJivPA5YITxGZk/eUUMdEnsH48dHm4DTqRUoQkiK6pY1GTI7/ByyRc+FxR2yh+ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737047828; c=relaxed/simple;
	bh=Cfls029jt6+1ViuA9omlvupSKnHGsOVELSd35jNeE50=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JBY36HEYad3TIdjya2UK14Ajg50SimS8YVJeTpmccmCuQBpPByHMPLZSVRvCg1bS76aHopKYKg+0FXhsD17jNRhlDoNFfBZ8U0jDnfLbHS9YxFv6pxGY++LOcxD9i7AJmiWTgSDaDGEhG649hnrKLyBN8knN670p7gVSV8dTUxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jyE9E+71; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2163b0c09afso22825555ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 09:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737047825; x=1737652625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NfmKxAUKcXZh1619YtkrCCyWijhCyYLpsgHJ3rMHb7w=;
        b=jyE9E+71SoJ+JhA+9wA/PxCkbh0c90ex8MWW4y6MPT4Vl5NRs6FoyevbTM17xEbtXp
         clOawCyi1boGuL84okCDU3xtjP+1kj0t2eJRNvhKZ8LtYTfnUX6VLES2spmcmAzbbVTg
         6NXK9gW+8mPeqhk04Q2btgAB6Vi0R/Ys11NvchSVhqyYH46l28jYegLY9eLMmyX7uKqe
         p1QPzOhpicI81mjkKXHlD1Wh1816VKOAehhBE9g76GtGa31AvIOYiHjRQBn9EMnXNaR7
         aurQ6Kd6XZCf1kvNk5fv5eiNvNQ6MwcpskQwWVpPzyV1ciVWI8PZtOrX8jmaDeTnOmtW
         3PCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737047825; x=1737652625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NfmKxAUKcXZh1619YtkrCCyWijhCyYLpsgHJ3rMHb7w=;
        b=DJDhNIM1bAMEkD206e5ccWn/aAhy2n/kQdhmKCKiUq/0pyt4yT1v4VkqASet8cgXe7
         dC6XuYfYLVyqOEiDuWdJj3oyhRjevqO/Ca1NK7qf9zlnUTlZ90qNxyxBCAz64YgF46im
         g8hUpD4Hka7xn4Ddp5vd2gLTo2csGJqkK/LQ4VbVJ8Y2BMYVS59KSbJPgzTi2osKWEbC
         AJwZSjN+f4mZvrIkq6r8XnBJrWA6tPsdmikJG/hw8MAoPM/FxaYGaNnDe/5LIJGWVYHH
         IUa+tNmS5rqc1eZOjilFnV+8jh3fRaSx8RWAC0ejVBXyoQ3gQ2S06ULYaktFM4MLZayq
         0EXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhHKjYX9A0tx1iaJNNCmFOcsd5FSS0Aqu9DI6+lrWXOJGTEcVwHP9IzkXyNCPSJ4UJX2U66JNq98v2GucY@vger.kernel.org
X-Gm-Message-State: AOJu0YxCjlKSb/F1voUSLH8ypcG1UvjMQNuaFL/r9ZoiJb4wgjTUI9bI
	RJ+ynOq7ADG7BWDV54n5rGvhxBJ9UdVtMsa5y1PAWRby//5ZVUVa1nbljxVZOg==
X-Gm-Gg: ASbGncubD76IG7rJWk3bbTonm1nPUIQdqvoBGUWqPe08GgZxPc1gYKxw8OfF3zS7TW0
	79PXHzcQCJjSET/x2XOnLmtyu2pnv2FUDLVnMBOxGowI2euAVHnc2dixKWP66ZrdIAsQoziHPuZ
	94rEE4AtDYOs1BrV/SF0jk12JQJNwtQdGyG/KIU0R1+8DjSgS9lscRlHT75THB+VvooUELatjCT
	M25BPSMDoPQy7/vc4szw86tBYz4804tdDrAuKtQzfRymSYNDymYDVUu3K5p0KI1HgVDvbpzNTe7
	p/A0OYc8uixvJzvNwfbRfw==
X-Google-Smtp-Source: AGHT+IGHCqVnUp8laxBsrAyjTEfGfl8hihKER1EIrc5smmXCIpNgLm5tAWS5wI017Ij/vv1nkBYrHA==
X-Received: by 2002:a05:6a00:1bca:b0:725:e015:9082 with SMTP id d2e1a72fcca58-72d21f11f2dmr41551752b3a.5.1737047825224;
        Thu, 16 Jan 2025 09:17:05 -0800 (PST)
Received: from localhost.localdomain ([120.60.79.208])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab7f1846sm275155b3a.15.2025.01.16.09.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 09:17:04 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: kw@linux.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	lpieralisi@kernel.org,
	shuah@kernel.org
Cc: kishon@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhelgaas@google.com,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	linux-kselftest@vger.kernel.org,
	cassel@kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 0/4] Migrate PCI Endpoint Subsystem tests to Kselftest
Date: Thu, 16 Jan 2025 22:46:46 +0530
Message-Id: <20250116171650.33585-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series carries forward the effort to add Kselftest for PCI Endpoint
Subsystem started by Aman Gupta [1] a while ago. I reworked the initial version
based on another patch that fixes the return values of IOCTLs in
pci_endpoint_test driver and did many cleanups. Since the resulting work
modified the initial version substantially, I took over the authorship.

This series also incorporates the review comment by Shuah Khan [2] to move the
existing tests from 'tools/pci' to 'tools/testing/kselftest/pci_endpoint' before
migrating to Kselftest framework. I made sure that the tests are executable in
each commit and updated documentation accordingly.

- Mani

[1] https://lore.kernel.org/linux-pci/20221007053934.5188-1-aman1.gupta@samsung.com
[2] https://lore.kernel.org/linux-pci/b2a5db97-dc59-33ab-71cd-f591e0b1b34d@linuxfoundation.org

Changes in v6:

* Fixed the documentation to pass max MSI and MSI-X count to configfs
* Collected tags

Changes in v5:

* Incorporated comments from Niklas
* Added a patch to fix the DMA MEMCPY check in pci-epf-test driver
* Collected tags
* Rebased on top of pci/next 0333f56dbbf7ef6bb46d2906766c3e1b2a04a94d

Changes in v4:

* Dropped the BAR fix patches and submitted them separately:
  https://lore.kernel.org/linux-pci/20241231130224.38206-1-manivannan.sadhasivam@linaro.org/
* Rebased on top of pci/next 9e1b45d7a5bc0ad20f6b5267992da422884b916e

Changes in v3:

* Collected tags.
* Added a note about failing testcase 10 and command to skip it in
  documentation.
* Removed Aman Gupta and Padmanabhan Rajanbabu from CC as their addresses are
  bouncing.

Changes in v2:

* Added a patch that fixes return values of IOCTL in pci_endpoint_test driver
* Moved the existing tests to new location before migrating
* Added a fix for BARs on Qcom devices
* Updated documentation and also added fixture variants for memcpy & DMA modes


Manivannan Sadhasivam (4):
  PCI: endpoint: pci-epf-test: Fix the check for DMA MEMCPY test
  misc: pci_endpoint_test: Fix the return value of IOCTL
  selftests: Move PCI Endpoint tests from tools/pci to Kselftests
  selftests: pci_endpoint: Migrate to Kselftest framework

 Documentation/PCI/endpoint/pci-test-howto.rst | 174 +++++-------
 MAINTAINERS                                   |   2 +-
 drivers/misc/pci_endpoint_test.c              | 255 +++++++++--------
 drivers/pci/endpoint/functions/pci-epf-test.c |   4 +-
 tools/pci/Build                               |   1 -
 tools/pci/Makefile                            |  58 ----
 tools/pci/pcitest.c                           | 264 ------------------
 tools/pci/pcitest.sh                          |  73 -----
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/pci_endpoint/.gitignore |   2 +
 tools/testing/selftests/pci_endpoint/Makefile |   7 +
 tools/testing/selftests/pci_endpoint/config   |   4 +
 .../pci_endpoint/pci_endpoint_test.c          | 221 +++++++++++++++
 13 files changed, 437 insertions(+), 629 deletions(-)
 delete mode 100644 tools/pci/Build
 delete mode 100644 tools/pci/Makefile
 delete mode 100644 tools/pci/pcitest.c
 delete mode 100644 tools/pci/pcitest.sh
 create mode 100644 tools/testing/selftests/pci_endpoint/.gitignore
 create mode 100644 tools/testing/selftests/pci_endpoint/Makefile
 create mode 100644 tools/testing/selftests/pci_endpoint/config
 create mode 100644 tools/testing/selftests/pci_endpoint/pci_endpoint_test.c

-- 
2.25.1


