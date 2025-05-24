Return-Path: <linux-arm-msm+bounces-59300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3F7AC30FA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 20:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0D4E9E21A5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 18:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F561D47B4;
	Sat, 24 May 2025 18:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YOG2VtLr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EC81A3BC0
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 18:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748112795; cv=none; b=e4ugXciTBNiXWGh6FWLT5g8iWSkS2jdd7ZhkhMT6MTeLrI5cU4KIpWfKnHg+YnHFAXZ8wXdvU3FaOp+9rBarZQ0m3RR2D5bNqnr2O1QBGwoJMyFZvYKGdjeoEFhBjPUAEtBw+H/hFlW6/rBGXnkAwygqiKs9JZBPoCan6EGnNBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748112795; c=relaxed/simple;
	bh=HocmR5sbq7EZCJ1kDDXQu3OSGvlDlIReoSFAC0t0UA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=se+WCbLX4JBLuwjfcbjtlnY+NqsJIRwPnqbeM2jkGmf1KfWT0lO6H5valQRW7dRjkkKoQwKZJPe8+lvieuEJAXjcjTVeq2JznYhi6o18X/4IdMos0eUcokq7D9QnMdTCsa4nb/u62O1YRXRq/RrxD9taq/bHPCfvg+flayhF1LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YOG2VtLr; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b1ff9b276c2so451203a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 May 2025 11:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748112793; x=1748717593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ENV0GZc8pO3b3z0Hxm/yl9U58RTAOYD7uCyKalGX8M4=;
        b=YOG2VtLrv9uW3bpxhHy9uiiPMTu1JCP7q9VSGbbyJ47NcIbOSWr9S9WO8N0EPYNpLW
         ZdyJex/qxLUlMLfn9aYsNXe0S+4CCecadWLAdQrQNSGB9dKoOY8Ca910VU93A+UXdOE4
         2OTgLvsvT8/Y/EC5e69l2y1r7icYRK/Oa/QACKqG3Ztf0AMjE64okstDQ4j8Y3/ezkW8
         fCI2dN9sCtZUQ6eGcVZvffZR7Guku3bvBGFU2gvEMzgTbjD3Ods2/mR3xX8AWNmu25GO
         g+h2kvOjQWeo9bbpW7eru9Stky+/tPJVtQsX3Pk/1juo0M0zLxkIwKHEabLmKTnyxDZu
         Ew4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748112793; x=1748717593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENV0GZc8pO3b3z0Hxm/yl9U58RTAOYD7uCyKalGX8M4=;
        b=Y1+xJdx1q9nYPX8eLjDjpgdYWCmgWjVQflUIrR9tbx+bSbL+wwZYys1/iuLdQ/iLWw
         6ZfoISUW8E5sYSdS07gKcQj2k5n19wtTlQA/anLLvAU6ZzkClxQsbXFDmU+5DVIUSJkI
         OtcTXSuRjHTObcTq5zdVbQYs+Gj6OFTZCreevlvliBFQHSU17qyLaBuWYnMeTP152vsk
         QwwXEIHyjOIj4dXokUvYEWgoDnCRrvpZN5hhAt5MmYMq1Y0slYF/V/F5sfq3bCjj/Rsq
         Oj5pgMSRJF8DlBEPgcO1HOLA5ukoyzZmZcPxUT1u+AEHMzZ0TX5ggRq1SFEZFAPqlXYG
         Fe/w==
X-Forwarded-Encrypted: i=1; AJvYcCWQZ7N+FTAO7P2yoCMt0StW2Q3cerpmtqzJPLdxi89JN1MAK/odb1hg1tYoV9Eq6TO9VVQkORuodHf8ImHY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5lSDS9p2Kp+wB25HwHyCtWgsoIenbaWzxGwth7Rzr7L7OcJAd
	xJQTnOBgw2p90RpAhreruqVuVVqyx/NuQtvWF9PXpCrKFdg8R5SBUMl1Q/Jep3p73A==
X-Gm-Gg: ASbGncvEYAIpBoM5zeFQdXYi47uDjbHH911Y/rVqik4GE+6lz1D05kbI/sj7qnw9SHY
	yKSLaf1VA1XNpJJ+QgZR3BzREM6pbc633acZxwcV5dO8f/9iW8vtg4tEsyRjUaHCoqGTrZphfXD
	U8fpZPl/tmxzn+cFr/B8oLYP04ocZgUWpAIlNB5/W2+op7iZXyjTp1QrieKInYzDRfPFr0iRwer
	5aCgqMhoKC86DbkbzFnR3eqKSZfr0x2kOUrXk1ohrfG520lr1CLIW8YbtQNY54R2z3QoDIv89JX
	4f2NNVLFhyiyJs7Dv93ALKYPa/xHCTJo/zcWsJUIqBXno0ozkE0pHLL5AcVkMSHT
X-Google-Smtp-Source: AGHT+IGFar6sjxj18FKhtOHuDHKr3HTcfefMkgzVX+tcC4McjNSW4CY/RCO4SgrMLDuLMvzLBwBeeA==
X-Received: by 2002:a05:6a20:3d8c:b0:1f6:6539:e026 with SMTP id adf61e73a8af0-2188c267d37mr5899768637.15.1748112793165;
        Sat, 24 May 2025 11:53:13 -0700 (PDT)
Received: from thinkpad.. ([120.56.192.43])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0a906bsm14532931a12.71.2025.05.24.11.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 11:53:12 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cassel@kernel.org,
	wilfred.mallawa@wdc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/2] PCI: Slot reset fixes
Date: Sun, 25 May 2025 00:23:02 +0530
Message-ID: <20250524185304.26698-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series fixes the issues reported for the slot reset feature merged for
v6.16.

This series is on top of dw-rockchip branch where the slot reset patches are
merged. The patches in this series can be squashed into the respective commits
since they are not merged into mainline.

- Mani

Manivannan Sadhasivam (2):
  PCI: Save and restore root port config space in
    pcibios_reset_secondary_bus()
  PCI: Rename host_bridge::reset_slot() to
    host_bridge::reset_root_port()

 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  8 ++++----
 drivers/pci/controller/dwc/pcie-qcom.c        |  8 ++++----
 drivers/pci/controller/pci-host-common.c      | 20 +++++++++----------
 drivers/pci/pci.c                             | 15 +++++++++++---
 include/linux/pci.h                           |  2 +-
 5 files changed, 31 insertions(+), 22 deletions(-)

-- 
2.43.0


