Return-Path: <linux-arm-msm+bounces-64032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16023AFCAC3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53E624A2EA2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 12:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D5B1EDA1E;
	Tue,  8 Jul 2025 12:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4KfJIjv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24348273FE;
	Tue,  8 Jul 2025 12:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751978849; cv=none; b=mTIiC1EtyQvfrnYGElTZeh76gQ+4fxmJgyIuTBZDDinIXcyJjNOmMv+5LHoVPmijyDEFAWPnp13NgaTaKHcXzobSWksJdTYeeMBMNSzG/2qmSMSMiFzeD8EbvPIJxv5a+foxopsnTDwL/wizJ7buNR5Y1G8PDIAKMIs2SpAmI5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751978849; c=relaxed/simple;
	bh=rCGO6mApTdompQmSEYsdGSyr8F46ScTMMEXu3NIWbQc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VYlCU+40MuwO6+g2EJa1pa748f7UeradvZh1mJg3rPd6edgeo23pHm8axX8VRrfEVDW1SWdjNIAXcYDPs5MHMahSTTT0k4Jzp60i0vgGj+mY9Q3Sw0LJeFR7ugyQeUJ546ylopBW/oLnfszZmWvu7xvR3QsIiCs/WCKOOwbCEZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4KfJIjv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FD5C4CEED;
	Tue,  8 Jul 2025 12:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751978848;
	bh=rCGO6mApTdompQmSEYsdGSyr8F46ScTMMEXu3NIWbQc=;
	h=From:Subject:Date:To:Cc:From;
	b=l4KfJIjvedljIOwV2JCSEME72A8iX1bnxl23AsGN5/QorZd8u0SyeDbKIxsBA5IYt
	 mtPOPXIsUJqXBjP7liZxc2IT67VNA5AIG1kvjgRf1dnxxYqqcvsP33diDKO8X0z7Dw
	 bOYw2t54AW7VgQFB1GC4+W27weHhouXpxvbmfudM2rhA+zaxb7kKFBWhiYipjAOUlV
	 qE6qHrif9+OAlCf8afAn3M6mSZVMXVy0CGW29QxZUpTFvaXVNa18X85Qqq9phz7qYV
	 XJQYOvJ8HUesxnnn0XP9VYvBLJHxmp7Mvh/YuTHIA4YiZdNluOWaLapdZRbrg2fzlB
	 A6IjrDa63ZI8Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/3] SM8750 GPU clocks
Date: Tue, 08 Jul 2025 14:47:19 +0200
Message-Id: <20250708-topic-8750_gpucc-v1-0-86c86a504d47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFcTbWgC/x3MQQqAIBBA0avErBPMKKWrRESNU81GRSsC6e5Jy
 7f4P0OiyJRgqDJEujmxdwVNXQEei9tJsC0GJVUntTTi9IFRGN3JeQ8XolDUG0vbqrRtoWQh0sb
 Pvxyn9/0Afhg+MGIAAAA=
X-Change-ID: 20250708-topic-8750_gpucc-2e68defb27d3
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751978844; l=1147;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=rCGO6mApTdompQmSEYsdGSyr8F46ScTMMEXu3NIWbQc=;
 b=/1aVUu8RhYFtjV1B85CTMcg4gFiwycjTfjE3MjWEZnNcinCNZmxavrPrEvJFygzObT/53xLFj
 fxVON7J6qJNCDz7Ifwf0o3xD+2IaY+Y3CYZTmEDueQxBxJ+e+/+ffBm
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This series brings a driver for GPU clock controllers (there are two
now, but that's almost a cosmetic change) on 8750 and wires up the GPU
SMMU instance.

No external dependencies to the best of my knowledge.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: clock: qcom: Add SM8750 GPU clocks
      clk: qcom: Add a driver for SM8750 GPU clocks
      arm64: dts: qcom: sm8750: Add GPU clock & IOMMU nodes

 .../bindings/clock/qcom,sm8450-gpucc.yaml          |   5 +
 .../bindings/clock/qcom,sm8750-gxcc.yaml           |  58 +++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  63 +++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gpucc-sm8750.c                    | 524 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8750-gpucc.h      |  53 +++
 7 files changed, 713 insertions(+)
---
base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
change-id: 20250708-topic-8750_gpucc-2e68defb27d3

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


