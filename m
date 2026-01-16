Return-Path: <linux-arm-msm+bounces-89308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D89D2C759
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 07:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4421302F821
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 06:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2659C346E69;
	Fri, 16 Jan 2026 06:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iG6MSz9h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021633594F;
	Fri, 16 Jan 2026 06:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768544428; cv=none; b=U3L/fHUXtVr062bDeWeJJziT1yR8S5fcuSbeDPI66jrLT/rGG2Q8BEFsvkI2zslQiLQwpsCOMnbsbXZz5sbg4coVVZasyOMOY47o2jgv4neV1/627LXBmzz0UIkj4yMXan7izIxQAh7K4wkTmves3XjGcfvjUKE2lTRIgp0kxw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768544428; c=relaxed/simple;
	bh=r4bockHOjbDL55pwMjmu8J6IiK/XeU57XA+w4GtQBv0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PyMOCSPD2F423O4ocK9HMror8W98djG8H/Tb3+LJgGy2iq4a/gex5XRp+zbGFEhAOn1JJVBVQXrHidyHOqhfa6AXkOUlLo85cSE9x4iXA67J7wr4FauKBeD3SlApgYNNDi1mnMQ1TucSJn25UenqAs+EUJ+FQjHTbVrKrMFgPuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iG6MSz9h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A99EC116C6;
	Fri, 16 Jan 2026 06:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768544427;
	bh=r4bockHOjbDL55pwMjmu8J6IiK/XeU57XA+w4GtQBv0=;
	h=From:To:Cc:Subject:Date:From;
	b=iG6MSz9hBJtWcFVwcBE5EWwqJTIpH96F4Ivi6KKoGnrYmpl8hr3GDro1qdvyZtUwT
	 OE2zJodVUGCxM/xS1F8oF5nqVX9pGmdT4denW9rYfUsof3CWhX5G/wFoSDJPD7Ry7B
	 SrsXSquQ7zxWEv073gj4lHzHhHcn3Sqc4yTxFAOd0E+e9uvqA53F4t96uL6vjJfJkp
	 P17VXnAcTU6aZnqiNdjrXDrt5be8EiJd0W5Joi9h7xvibWinQjPDB7hW13xm+Spfn5
	 avzq7LM+GBFIwAsiOzCCP8vQus2TKXdBACbLVu36la8wSaaSegJCy39+4IfdLu+egV
	 OLKL3rlaPVMew==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	akhilpo@oss.qualcomm.com,
	vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	loic.poulain@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Date: Fri, 16 Jan 2026 11:50:01 +0530
Message-ID: <20260116062004.237356-1-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

Fix IOMMU DT propeties for GPU, display and video peripherals via
dropping SMMU stream IDs which relates to secure context bank.

This problem only surfaced when the Gunyah based firmware stack is
ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
as a fault by Gunyah hypervisor which were previously ignored by QHEE
hypervisor.

The DT changes should be backwards compatible with legacy QHEE based
firmware stack too.

Changes in v2:
---
- Dropped Gunyah related reserved memory requirement changes
- Added DT bindings changes related to IOMMU property fixups
- Collected review tags for the DT changes

Sumit Garg (3):
  dt-bindings: display: msm: qcm2290-mdss: Fix iommus property
  dt-bindings: media: venus: Fix iommus property
  arm64: dts: qcom: agatti: Fix IOMMU DT properties

 .../bindings/display/msm/qcom,qcm2290-mdss.yaml       |  5 ++---
 .../devicetree/bindings/media/qcom,qcm2290-venus.yaml |  6 ++----
 arch/arm64/boot/dts/qcom/agatti.dtsi                  | 11 +++--------
 3 files changed, 7 insertions(+), 15 deletions(-)

-- 
2.51.0


