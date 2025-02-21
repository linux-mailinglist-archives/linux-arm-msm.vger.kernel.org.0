Return-Path: <linux-arm-msm+bounces-48969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E9BA3FD51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 18:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B98AF424F77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D987C2500B6;
	Fri, 21 Feb 2025 17:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sD8XtQWR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355D32500AA
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 17:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740158601; cv=none; b=sRt/IIuNhia5xHedAoZBLisr+RKqUz7CtccNavJP29MsqRTGK8cXBnu5aLL/mUyvZo/L2rSjFNXncWvEXeDtERB/6NuT/Zm5jFSy7yOkRhShIMA3XSe8w85o0tl1Mqo+XEqtnFinNFdH2HPLfuUbwLPFwtbSy22o01uNj90ErAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740158601; c=relaxed/simple;
	bh=v4umuejnk/D3zo0ZfQeNhQtPg7rv/6gl7bzNW+Mvmew=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VOyRJ5f0g9NBc+pCMXvKxwI1XLTWH8NGKTXYEIguT/u0jEDF8pJFMRugF5LSpt+gR+UuBSrQMUw9s3yLc76cTyOM67xRrry9KD7jl/9AqQ3lRu4EuSRPI7vI99Cpzu30G3eaZ8EW6h4pWTpcizCNahcjqVskBoPph7VLNoBdXk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sD8XtQWR; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-221050f3f00so54126575ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 09:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740158599; x=1740763399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tAC237/i2ojW1+/RqYj3Hliw8hADl+1Y8oHlt264UNY=;
        b=sD8XtQWRDfOG7PdnJ8+GIluw7fyUI/fO7V6CXLU24CAYbsOCRVfHQ4m8iIrwm7zQs5
         jbz+6bzfFi2WwT5vuO3ATpJiiEd0/lsUCR2hfpsPK5y+EBO7qe4HAxuNwALl8Lui4j9N
         pselkXbJC8utrEZWA4aKAGbvTwmyZcDDfo7OIkBlmROyEWTrISKWsFCsPa7e6+tc7DEl
         KXc8HzrhsPx7Y/DNQ/TBrPC55KDNoLYrUdyn5FfDi2v3jzZTuBQU/zwaC/rFUfoSxkvm
         rGIsdprXC4KHZXGL4ci/gy+s2MKGRn9iwmyuBXYKK24ZikY8IBfbsWah/pwquETiM/IC
         vV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740158599; x=1740763399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tAC237/i2ojW1+/RqYj3Hliw8hADl+1Y8oHlt264UNY=;
        b=RxBWy2XrqLtOvrGVO7Jj1P+Jun+26+MLMdx0iB7vkFNmd8np9rlqEsCBUgClFDmerW
         fa3TMm+F+hv6INluBS7LA8IR/hPExHGGPZxPdSLn3AZE3+zlnnXLuCcinVsGcs0bOn9y
         ROgPq2x0MjQOwYOFLHvVwQR4ZTdFFxJsKFHTeztYFUXvfv4BJDrqyASFia8uSSrw7Mw8
         Sev2zETvgUCI/DM9+kvEVJR8AaTwfur9tqKHeJqpTxNNydw6nUKZpN2C7aCHHYPmd56Z
         7hYZmBR3FYQKwslWAWW5wZJlkEhRJCv5o4aMBs9KMj4IGG91kWFWm5f1woGOQzhghykX
         s+3A==
X-Forwarded-Encrypted: i=1; AJvYcCUUeDn6ZLSXcu0dkhaoGQ4/hiUcU42hsYdvv1X/eWg0EaZrdQ0T0B1M7hHSqmRZ9Sjro5+VsuH8Ua7qsitC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw90OX2EWtBe85kaWgqVyHYzDMaBHd2Bla58BFo1k3sioxTP9Es
	3JbGeVlLHf+GqTVU5IBcg5HLva7I3PZtdVsu6k7tQLtFDtyuVlTxQBzvREMgGQ==
X-Gm-Gg: ASbGncuFfP1jiD8PVRX9bDKLoDzTj899yJ140Zm0sZBjQcQ3Kn0w1ZxU8oexgMctXIb
	Vb9+w4eoO2krx1c04grxCE3XfiZcCVRiXnfWdbwACoupV6SwIlqF32ZA+wxSj8FRXi8CBk2QFAN
	PTusdzZ+JYK0VqYLC/64ByuhKEgH41WfchoWa/OCENfEOTLThAYTT8o80lxC0KjEnK3EjqXyL4x
	t/IxJCItFt8ESa01u6FZ1FfkT4temORQKYNyvHv4w1vhmu1Cpd5pfAS9Qic1WblpC3IWqfEqNuz
	XhYjSvBquzu9dpkQFYgpMK3cGcIIEjVh/Qf39RvHep0urgwFa3Bo
X-Google-Smtp-Source: AGHT+IHRjJdp1yc9JTT15Y3zMSAcEmsTgJkEW6HFHwdSfI5yIExfixz8/4XmLd1XnVTnm6VlmGZZ7Q==
X-Received: by 2002:a17:902:e88f:b0:21c:17b2:d345 with SMTP id d9443c01a7336-2219ff30cb1mr55376785ad.3.1740158598987;
        Fri, 21 Feb 2025 09:23:18 -0800 (PST)
Received: from localhost.localdomain ([120.60.73.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545c814sm141243405ad.148.2025.02.21.09.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 09:23:18 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dingwei@marvell.com,
	cassel@kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/2] PCI: Add support for handling link down event from host bridge drivers
Date: Fri, 21 Feb 2025 22:53:07 +0530
Message-Id: <20250221172309.120009-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds support for handling the PCIe link down event from the host
bridge drivers. This series moves the link down event handling to the PCI core
(atleast the generic bits) to prevent the host bridge drivers from retraining
the link on the back of the PCI core as done in [1].

Also, the newly introduced callback 'pci_ops::retrain_link()' could be extended
to recover the bus in the case of errors in the future.

I've implemented the 'pci_ops::retrain_link()' callback in pcie-qcom driver as a
reference.

Testing
=======

This series is tested on Qcom RB5 and SA8775p Ride boards.

[1] https://lore.kernel.org/linux-pci/20241112064813.751736-1-jpatel2@marvell.com

Manivannan Sadhasivam (2):
  PCI: Add pci_host_bridge_handle_link_down() API to handle the PCI link
    down event
  PCI: qcom: Add support for retraining the link due to link down event

 drivers/pci/controller/dwc/pcie-qcom.c | 90 +++++++++++++++++++++++++-
 drivers/pci/probe.c                    | 34 ++++++++++
 include/linux/pci.h                    |  2 +
 3 files changed, 124 insertions(+), 2 deletions(-)

-- 
2.25.1


