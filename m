Return-Path: <linux-arm-msm+bounces-76408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D52BC5185
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 15:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 129EB3A5A73
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 13:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2A2249EB;
	Wed,  8 Oct 2025 13:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="Um8pxC1s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565F91C3306;
	Wed,  8 Oct 2025 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759928469; cv=pass; b=BWX/kRlUXb4IiZlawTd6XY6TubKrhbPjSy2tY4SOFVH34nvBlUqJREu0aDWBfFnPxGK0kbYJ/sxrR3pkRRU1+1jB4Xaf66D9cUrQZBfpuIYnB9B7G4CrPvkDViOjLdgk4csuecXgN8Y7NWXxJuaKuXKU3WCly946MhIMrdhV3nA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759928469; c=relaxed/simple;
	bh=Jl05ydmdikzLsEiYX4kjqrnPQ5Sb5lANeN3XmQsbghs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CMVv4B8pglOWWCrCy6U12ASc12V8FmeFKbGFtXe/J1PNWYk8TyWGgpjHvoWrsgkv2KYqDgwMobJb0PJ/GE+p8I98tDDzslKJ3vg6Za3Qat1V7FtgNtF4hFOLkRPi7Zoqb0Ixt5RRw4reBVcKHbH/tVSm7Jxzwg7QjMgKWWeKQ7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=Um8pxC1s; arc=pass smtp.client-ip=136.143.188.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1759928462; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KriMtnIZOcVzEvx1ZlF+ba5fHzsEGZSMnzPQR1SxnDAa1PO+DHH2cHGebkD0HFEgd7szIh6NAatf+zz8j31/szl2JRtMGL5ajIPU4uOJPM4a6OW8lbehAdwmfNtGcKIIWIb/ZFvPCUXmolQOeRFrS9Dh87VOT95x5bGYLL8y/DY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759928462; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vvSzGzappQ2DIa8Z8JIp2DCABJeZOABIXE23Kpa7obk=; 
	b=D/meXYcr/1uXSPqJ2Ej6MCzUqv4RCFt0bzyHevBDz2oEV0j0to+FU/6QHvwdUgDrIhUbaBV0wHFwH0Q0WLmwMuDaS9eq64TouXHpeMc6JUdSMQY8lpgmhRz9uHPIra/u6xta7Qw9KFQ/XUNoTwS8F0owGhXCXCaY5ADwswktJKY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759928462;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=vvSzGzappQ2DIa8Z8JIp2DCABJeZOABIXE23Kpa7obk=;
	b=Um8pxC1sO8Q/h15zkxQeNbVGPmSRu3dYYjboSWbsdhnPo4es/hWnxhqm21Q6mcdF
	jaS8UUgSk7tP/jG1qTNCUe5CR4Wk5StUr1hKUmjgH3J2Uqbf6T2OP0TJEwZCoDLAz2f
	GVhNBFqzvwSlSP24be7Hqyrihp7Lxp/L2DemtXn8=
Received: by mx.zohomail.com with SMTPS id 1759928459515119.56493147883725;
	Wed, 8 Oct 2025 06:00:59 -0700 (PDT)
From: Jingzhou Zhu <newwheatzjz@zohomail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jingzhou Zhu <newwheatzjz@zohomail.com>
Subject: [PATCH v6 0/2] arm64: dts: qcom: Introduce Huawei MateBook E 2019
Date: Wed,  8 Oct 2025 21:00:50 +0800
Message-ID: <20251008130052.11427-1-newwheatzjz@zohomail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr0801122729bcf230bba7811d4fce1bac00006db2bdc9c55547d897731858920e6701971d166bfc98f853a0:zu080112276cb30eea9ceb5594f45ae46e0000b7d03e5f36d5c2315622e68500e562f11e935ca3ab60b75a69:rf08011226b35178edd6f0ea9fae52863c0000ca786c8ad019c635939d03be7d1475c2c2895189b183cb81:ZohoMail
X-ZohoMailClient: External

Huawei MateBook E 2019 is a 2-in-1 tablet shipped with Windows on ARM.
It is one of the early WoA devices powered by Qualcomm Snapdragon 850,
or the sdm850 platform. This series adds mainline Linux support for this
device using device tree.

Changes since v1:
 - Removed 'enable-active-high' property from &vreg_s4a_1p8 and
   'input-enable' property from &i2c5_hid_active to avoid warnings
   mentioned by "Rob Herring (Arm)" <robh@kernel.org>

Changes since v2:
 - Rearranged the order of nodes and properties suggested by Bjorn to meet
   the dts coding guidelines

Changes since v3:
 - Added new lines before 'status' property and subnodes for better code 
   formatting
 - Rearranged the node order of regulators and pinctrls
 - Renamed the pm8998 pinctrl nodes suggested by Dmitry

Changes since v4:
 - Collected Acked-by and Reviewed-by tags

Changes since v5:
 - Fixed cosmetic issues as suggested by Konrad
 - Added comment explaining gpio-reserved-ranges

base-commit: 47a8d4b89844f5974f634b4189a39d5ccbacd81c

Signed-off-by: Jingzhou Zhu <newwheatzjz@zohomail.com>
---
Jingzhou Zhu (2):
  dt-bindings: arm: qcom: Document Huawei MateBook E 2019
  arm64: dts: qcom: Add support for Huawei MateBook E 2019

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../qcom/sdm850-huawei-matebook-e-2019.dts    | 972 ++++++++++++++++++
 3 files changed, 974 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts

-- 
2.47.3


