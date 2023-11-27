Return-Path: <linux-arm-msm+bounces-2073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6517F9FD9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 13:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4178281022
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 12:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0801912E75;
	Mon, 27 Nov 2023 12:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nq8c2ZQ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331FB137
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 04:45:44 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-77d632b35faso224322285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 04:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701089143; x=1701693943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=My7gSFRp+Y7hoOV+FBK21Q8iK89AnBNbYhuMMj6/9YA=;
        b=nq8c2ZQ2iSF2Iu1oeCXn1TmpOK9wA//99CcvtoPaue8jEu34xZewQr/FOqKtlyXOvM
         LFPOti7AhKNQbW6rCNst3etX9twZ2x+FOzOM9qDoduhn6Dkdd3mIV2nlqz3wu1xGEB0q
         F7eGUEg+oJPYkKqEm0P/TVpu7AG8ZuevnFpaiv4WrpJxoWg5wfBP+1BiNf3Cfp3ByBJb
         Qamtj5LlliWbprW14a7hPYCygiBUZhm7i+tJYIBlJ6I+MiVT8/VwgkOy2ljK4E6xdlC8
         CBO+apEVSIgkTU950iQceu39ruj3WgPKsn/2pMy1ieivBPxm/ByxjeRBgjXpHan4un72
         ABPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089143; x=1701693943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=My7gSFRp+Y7hoOV+FBK21Q8iK89AnBNbYhuMMj6/9YA=;
        b=K80uTMZFED+hooE775XLBXPVtnFhDGRapMjmgTavoeNtNacbiKoyQXPN5V42ODaSOk
         D98OJ1+ym6k7O7awpWEx9dpu45vdbmt2/lNAUb7+pJDmdWpY9/YFJ1jJrDP7xHZ6ToGR
         Pm892kgJD36uXkJ2OP3SL/gDxtkjmTztSx+HgpvO8dm5UcEqyHlBAwq1e9A9HH/HcNuw
         hYnY1oWZlVls6nbzvDW5P5Ma1+06Bbaw0tIbB0039sAT6Cc9ud14AlqP8Zmt1Ux/N+G9
         sMtcKKnRQlW+/MifoH3ahTUNeatdQv4VfdXmDu9sgsZxjLkcL4pwRVYHq2o8XSigyliO
         atkg==
X-Gm-Message-State: AOJu0YzhSPaQx1u0bYyYnRFEkNA7e2N8DRj/YzNgEqAUgh+a4iWCy4sO
	oXnZykuufik6DfRwHKm2xWa4
X-Google-Smtp-Source: AGHT+IHxlyPEMgiSFO7SQKkp2Y9pFf7htAgqwPBMkxZfJRWlUXhmb2oNI5Vr/2R6YVNt+HXPnHuOGQ==
X-Received: by 2002:ad4:4986:0:b0:66d:5d31:999e with SMTP id u6-20020ad44986000000b0066d5d31999emr12774208qvx.43.1701089143185;
        Mon, 27 Nov 2023 04:45:43 -0800 (PST)
Received: from localhost.localdomain ([117.213.103.241])
        by smtp.gmail.com with ESMTPSA id er10-20020a056214190a00b0067a204b4688sm2832231qvb.18.2023.11.27.04.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 04:45:42 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com
Cc: kishon@kernel.org,
	bhelgaas@google.com,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/9] bus: mhi: ep: Add async read/write support
Date: Mon, 27 Nov 2023 18:15:20 +0530
Message-Id: <20231127124529.78203-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series add async read/write support for the MHI endpoint stack by
modifying the MHI ep stack and the MHI EPF (controller) driver.

Currently, only sync read/write operations are supported by the stack,
this resulting in poor data throughput as the transfer is halted until
receiving the DMA completion. So this series adds async support such
that the MHI transfers can continue without waiting for the transfer
completion. And once the completion happens, host is notified by sending
the transfer completion event.

This series brings iperf throughput of ~4Gbps on SM8450 based dev platform,
where previously 1.6Gbps was achieved with sync operation.

- Mani

Manivannan Sadhasivam (9):
  bus: mhi: ep: Pass mhi_ep_buf_info struct to read/write APIs
  bus: mhi: ep: Rename read_from_host() and write_to_host() APIs
  bus: mhi: ep: Introduce async read/write callbacks
  PCI: epf-mhi: Simulate async read/write using iATU
  PCI: epf-mhi: Add support for DMA async read/write operation
  PCI: epf-mhi: Enable MHI async read/write support
  bus: mhi: ep: Add support for async DMA write operation
  bus: mhi: ep: Add support for async DMA read operation
  bus: mhi: ep: Add checks for read/write callbacks while registering
    controllers

 drivers/bus/mhi/ep/internal.h                |   1 +
 drivers/bus/mhi/ep/main.c                    | 256 +++++++++------
 drivers/bus/mhi/ep/ring.c                    |  41 +--
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 314 ++++++++++++++++---
 include/linux/mhi_ep.h                       |  33 +-
 5 files changed, 485 insertions(+), 160 deletions(-)

-- 
2.25.1


