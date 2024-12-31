Return-Path: <linux-arm-msm+bounces-43744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCF19FEF8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 14:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9270161B96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 13:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D1219DF48;
	Tue, 31 Dec 2024 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hgtjg3Ll"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A53A19D070
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 13:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735650841; cv=none; b=BTTt3dXyYi+8dfUe21Qnv6I0V3+xd0CaPK1z1w2pG75Dadl346XFy+QsMsjKjCulhIhNFWnYrONJmP4lFkPgeb/vCG6vabldN9mbuD5EQw7pMRAVoORLABMikhQDoS+D3UejeuDr1z5slN9pJ83KtIauhCpwXsBxwyGEzp/Fa/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735650841; c=relaxed/simple;
	bh=GZGMWyQUBw5pvCtQOnp4NjRcrAnPqiX8Obv8YFOqrxo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TIWGR1YtgzZPQNa4MWN/NVHH044xApux0B3dateiFcCDtWhrmPr6i6l1GEpokdrKzBfb72ZjciicNPVnFv7BCba+0PaiKcy4XqkCtRA0dx614GcOymUSDDI9b0dpQX7LNu5wLCJnFUH6lbknXOYc2HEDwyGoaGHiTENwXTv5Im0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hgtjg3Ll; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21661be2c2dso121622435ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 05:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735650837; x=1736255637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fZgp4jfle0ZGJPd2mHyE73pz/6DhpqLqrjCBngOXHZ4=;
        b=Hgtjg3LlF6mWFgQoo2+KBkF1BmXy0IEDZmvkN1plRzxo5cSpFNxZhTXVvUQj86fdU0
         84k803cFmw4ESrQOj++TFveRCM+oTdInGzO0B4B+NJ4mxykWc/RV5nJQpg5yKdx+UTYP
         yp/xHaf6SEo4H68GFpKT8XCztI1PXo+HLtrM8mc2suo72YjHLfyFuo4zK/z+f+Nvsevz
         9I7WefFLZ/uIkemLkVgC9T8TeUD6EhN6urnTl/tRTw7qdf8uZwVVGmWfyTm/rw4PuiRL
         89mBkZdcgIYcgigyii3OFFA8JoMe5/2onSDEuTFeTLSOTy8YLtMr5rN17FnFuvUztPUL
         kIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735650837; x=1736255637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZgp4jfle0ZGJPd2mHyE73pz/6DhpqLqrjCBngOXHZ4=;
        b=CbXUbEEcp/1R/yfONczceVj8b968O6VZaSCj2qBgZMvcYWed+GTtWWPl6kXhh8kl+W
         olj/5cgnwAq3aXX/2O7V1LcqlzyoEEHNs3wtic4rGEComum/wd1d2uB7IvSk6meT8k1U
         mEXsrIBqN5KjBG3c/tt6oefRkvkx6bTw/m1Coi5gVb+0JaB7bAtQ9iSdToMAS96hfbXm
         XAR9smO0oyc//X1grADwMXfaC0mciZV7gK/7GcHCjDI1m14viaiu6ArGukXjAlCpX+nP
         KphgZY4Xbj3SOXtIZe26dhV2pYsQg1PRHPcEs8WS1WMcTOcMZT5zv5raui5JHHs2RWc4
         /v9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1lFYx+1zI98R+JO0modWpwQo95JPjh/6m6tUV0c3R8WGrErzbM8F4QiPVeU2HzvALJwiq3fL0U+RD0CVj@vger.kernel.org
X-Gm-Message-State: AOJu0YzWHz4tFmSvipUghNTXVtHtwEdCPqCpi6OdZHB2aqHrMM0Z1/8g
	oY2tC8XhqJgIIQU2XOjtUQcMvNbvEQRPOPB49R66SFr1AWi70MC/kZySmDhO1A==
X-Gm-Gg: ASbGncuXGyFqIinYzzNrVkQAbdZc/9FSaiSiTLZQF22gvF5zKGe5apKUF1yiLuwBA3i
	kHOOfVXuvvVskjDXzuqzYyadzQJNUiXObd8QjXeekEOgRCBuHH5qev2KzwcpJ9qsaKnegc+OFO6
	LUGliIUbovudOF8EI6D4QS3NODztLAZGwynTkHX5aP3lZwIDxM1zgCXn+63X+of8HwBxP6vCAd8
	B/dop1vIr/VwChcXa0adgodL+qyplSZeXch52x7fETAxOr7EcbpzeR7zopSNk9AGknBKobYNUSs
	f5KZDtI40O0=
X-Google-Smtp-Source: AGHT+IGEg0Sm2+Gv2ELKmcTe/s3eXcD2xxWC9XS2B49nFl0hlJ0LsI4H01w3iCdwEken+HN3bGEavA==
X-Received: by 2002:a05:6a00:1152:b0:725:f4c6:6b71 with SMTP id d2e1a72fcca58-72abde9eb64mr62183286b3a.20.1735650837496;
        Tue, 31 Dec 2024 05:13:57 -0800 (PST)
Received: from localhost.localdomain ([117.193.213.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad6cc885sm20994862b3a.0.2024.12.31.05.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:13:57 -0800 (PST)
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
Subject: [PATCH v4 0/3] Migrate PCI Endpoint Subsystem tests to Kselftest
Date: Tue, 31 Dec 2024 18:43:38 +0530
Message-Id: <20241231131341.39292-1-manivannan.sadhasivam@linaro.org>
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

Manivannan Sadhasivam (3):
  misc: pci_endpoint_test: Fix the return value of IOCTL
  selftests: Move PCI Endpoint tests from tools/pci to Kselftests
  selftests: pci_endpoint: Migrate to Kselftest framework

 Documentation/PCI/endpoint/pci-test-howto.rst | 155 ++++------
 MAINTAINERS                                   |   2 +-
 drivers/misc/pci_endpoint_test.c              | 250 ++++++++---------
 tools/pci/Build                               |   1 -
 tools/pci/Makefile                            |  58 ----
 tools/pci/pcitest.c                           | 264 ------------------
 tools/pci/pcitest.sh                          |  73 -----
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/pci_endpoint/.gitignore |   2 +
 tools/testing/selftests/pci_endpoint/Makefile |   7 +
 tools/testing/selftests/pci_endpoint/config   |   4 +
 .../pci_endpoint/pci_endpoint_test.c          | 194 +++++++++++++
 12 files changed, 386 insertions(+), 625 deletions(-)
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


