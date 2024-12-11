Return-Path: <linux-arm-msm+bounces-41410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE249EC64F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59F68281D0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A88C1C5CD6;
	Wed, 11 Dec 2024 08:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pwbOh6dm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E3F1C5F03
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 08:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733904096; cv=none; b=N6doL6J8q1HE146EQYeVXcZm3DBD4zUk7hfzg6gtUrswR1ucShJ+kdSzie2dgD/EOd1w1k9qWPyjgDQkub+38iARgI1GHh0PJGnMdq0XVMZ7oy/BD6dIG+ILBvuFhor5ufa0pKlYN7s0u0r0t9SWNLQ7xZS6D5YnaXRDMRlpwLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733904096; c=relaxed/simple;
	bh=QDCClO9+ruB6VB/58Ynw02ygmft+gwI7j3Au7lq3IGg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c8COuMbFEM2u0rlu8ZJfu5XgFpNkxdIZ3v88HEaB4+s0uUZJkzWBGlTrOOZ36NiXnTwVa9kDKXXS/rNnQWD27ZexxznO1zFS/eMzKwnbls4Lzq/tbOv1K5jQ5xbRT4Iao0OjNBKButY+yU1B29baOExSng7TJQ3eCzFC774mD/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pwbOh6dm; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e9ff7a778cso331362a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 00:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733904094; x=1734508894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pEGhXU+QLmJOzGqN5qm96MkDiJr/KItzUXBN99PYXic=;
        b=pwbOh6dmAqkwCiUNdLRMqlr+WD4vIM2BPbnuUF7C3OJB9sN2RxugC9cQJtkSWFEsoR
         qFrC+WJB+8iMxQD60GmdkUA5W8RIsfn9SFRO1kDDTJph8/ke0kJEUMnPujjmSrqJE9pM
         MCgcqpYLBz8w7YCZF4QCIaYb37jUCJ9jw25bwBjwgWIkV4WuY6RTT0HDDMVxPE0XRKoy
         PIzxJGnJ50ao2f2nCk1tSXSrQ8DZv1o8V1bTMabsfdH+CzSEr1BkVOJfiI7NKg7eEUsd
         mSjiiNUwZRNRQLiSrIYDU99q8TgGJAVzFWaR0CoIfAXKPflycHAQ4A3IdLMrVamgdEM3
         PCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733904094; x=1734508894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEGhXU+QLmJOzGqN5qm96MkDiJr/KItzUXBN99PYXic=;
        b=Pbbus0TRbCxIcW1kS4nVzCG5y10goyEr7OkInQIVVDS34SiXKchEnuzeDaNzC9t6al
         xu1rUhEVK9cL2T6EJ/0Bu/8X0C2dCTHWR9hZS9i3ZKW70nPl2Q3r+vrZ9rzKgauPizfw
         BA1v/4D3yX6SX6XqBHpnfZoow+MF4SELZ4YwW1kyHRL3HPY5no0XUzhKpFlYawskZw2G
         cyMeqeSG9Xr+f57RKXaT/mndC4QUwrQIo0sS/2TAG6Xkqrv/bKhJuVZGBQY96Sq3PXii
         3KUeOH1I7A/t6/++LmXUgW/XA2NcPfjBfA/QknEoQY0F1P54sQzy+wERg/sFlu6YqZ8F
         0GVg==
X-Forwarded-Encrypted: i=1; AJvYcCWNEsO6WSA3LaGAenfljwIMfMpQbe++syqmoWJx493waVY9LLldV8aIZjW9B0iM/K123xYCqqBGIapgfqI4@vger.kernel.org
X-Gm-Message-State: AOJu0YwSanypTXsXCjPndYrObclIG4SyiBdok39MXRwXFSwdPXVhQoRo
	tqmuD5GbT0zXm5h0mpXZ3St47Xqg+Vzr9r42SdEnmWHkJN58ZTpuLXfTE4NJPg==
X-Gm-Gg: ASbGncu3l02skwJHrgBXKsDq/iu4t8YRh4VhEUdgdKaesuzsJGowaCXk6HbXy/YHiC+
	4/7MlESHJ5wendJzCg6Faox+Li4R34zNVIm3GGXYpznAkjKe5IKUFNXW8TIrI1IiqvcxWHMeWC0
	8nQgBrzhxiqLYOoReU8QsQ69bl4S+kK8ywFSKTIwqIJmi/XcyIawO4r/p3vfzKVzQJAXop4mdNA
	focItKKCI9AvaXDLArCIV+COz73gYIUV/0BMZovtWl1LOOm1bRT0EJP/q9K1Tblj3crXAD6/a6a
	+B9M
X-Google-Smtp-Source: AGHT+IEjpYTPZZfgdWB4UyzQkMZqnr6AOgFIDYrlPTj+b2+sChMPtg1c+as/xrmzdknyus1FwtOTkA==
X-Received: by 2002:a17:90b:1f90:b0:2ee:8cbb:de28 with SMTP id 98e67ed59e1d1-2f1287a38a2mr2651334a91.8.1733904093408;
        Wed, 11 Dec 2024 00:01:33 -0800 (PST)
Received: from localhost.localdomain ([120.60.55.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef2708b93dsm12929775a91.51.2024.12.11.00.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 00:01:32 -0800 (PST)
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
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 0/4] Migrate PCI Endpoint Subsystem tests to Kselftest
Date: Wed, 11 Dec 2024 13:31:01 +0530
Message-Id: <20241211080105.11104-1-manivannan.sadhasivam@linaro.org>
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

NOTE: Patch 1 is strictly not related to this series, but necessary to execute
Kselftests with Qualcomm Endpoint devices. So this can be merged separately.

- Mani

[1] https://lore.kernel.org/linux-pci/20221007053934.5188-1-aman1.gupta@samsung.com
[2] https://lore.kernel.org/linux-pci/b2a5db97-dc59-33ab-71cd-f591e0b1b34d@linuxfoundation.org

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
  PCI: qcom-ep: Mark BAR0/BAR2 as 64bit BARs and BAR1/BAR3 as RESERVED
  misc: pci_endpoint_test: Fix the return value of IOCTL
  selftests: Move PCI Endpoint tests from tools/pci to Kselftests
  selftests: pci_endpoint: Migrate to Kselftest framework

 Documentation/PCI/endpoint/pci-test-howto.rst | 152 ++++-------
 MAINTAINERS                                   |   2 +-
 drivers/misc/pci_endpoint_test.c              | 236 ++++++++---------
 drivers/pci/controller/dwc/pcie-qcom-ep.c     |   4 +
 tools/pci/Build                               |   1 -
 tools/pci/Makefile                            |  58 ----
 tools/pci/pcitest.c                           | 250 ------------------
 tools/pci/pcitest.sh                          |  72 -----
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/pci_endpoint/.gitignore |   2 +
 tools/testing/selftests/pci_endpoint/Makefile |   7 +
 tools/testing/selftests/pci_endpoint/config   |   4 +
 .../pci_endpoint/pci_endpoint_test.c          | 186 +++++++++++++
 13 files changed, 373 insertions(+), 602 deletions(-)
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


