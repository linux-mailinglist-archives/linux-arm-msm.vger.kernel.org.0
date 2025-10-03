Return-Path: <linux-arm-msm+bounces-75910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A49BB7000
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 15:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC1DA3B1B41
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 13:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6091819E975;
	Fri,  3 Oct 2025 13:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="BA4NPUuQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D713522F;
	Fri,  3 Oct 2025 13:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759497581; cv=pass; b=N9JfOzflxjakki0hcAR0pKHDJkucuh6htFu4zEipNyNAx9/r/wV3iQAwLpRhIXGcBTIDCrETeDb7956XAsrS4IPPOgHmAQfv5zVnIzM2Jc63mThVIGGtWwT0CElAfkHzuJenS7S2MfWiPfK5RXjztrbVP/OFX9vdQWyJPWh5FYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759497581; c=relaxed/simple;
	bh=y5Wl2juJNpEAWjocguLoZJV6CZJTMDsigxy0uQkMxco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IB41JfDsLLJHHMBqKxeRLwIDxwG57MmoyYjX/nQQ4dZEyFlLvXLoI/E1gwjoFVVUJ8oWNZ85GsmhEwzcxE4n3vMt6O5Erm499C/NfjA0IBL08mm7SwS+VXSXcPhX0yaiTpI0riUObejEZiN++XokFSDlIX0lG2tlsryRoYsaqYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=BA4NPUuQ; arc=pass smtp.client-ip=136.143.188.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1759497575; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m7uMLLQFfi2eue9mIJ7yJMbOLGT6JVupDeXf/CllIdH5cL3QOJfxFXCQ4iCGcbJ8e9iXlDkVqXg4sfo1H2rijFdzsH8EfMtqxgnpkXhdanZpWHX9cNkAqCKVu9QFdCIOlHySmHgijzp4XviaUeTjo88LbPXcvv+GVu3KF5Q2xKc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759497575; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WDvaGERZwW0unNT0t+ZHheS0dLIO99p/E/1UmNyVKdg=; 
	b=XN42mndllTKUanXwW7fr+zK8P+YNfwolXRuXPR0dQjWafvh4Ll3AxrfBmxw4n31swFkh82V4GiZtJPZyRbB0oQ2vM+GugQkq/TfeSK5GG373x/8PrDE+lQlcVtXELI4QgYjUrYmqZjz5VLxuiFuAiMXOQcl050l+3NADChhrAVw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759497575;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=WDvaGERZwW0unNT0t+ZHheS0dLIO99p/E/1UmNyVKdg=;
	b=BA4NPUuQwe0bDaUWEiwm0aQUR/h2a0tt/Y1URlR5eoauDD79Ku8+l2EsAYX01Htx
	rPmZwSf9uB5+6d1QGk2R9LGdfoyehOQneB29NTLgGfcW88UxMn2n5CFJzG6tHQYNfpI
	Pw+877IGaaHZ1z+SSL7ul+EgTCJIoQfJceaKh0Bc=
Received: by mx.zohomail.com with SMTPS id 1759497572892706.9817352550522;
	Fri, 3 Oct 2025 06:19:32 -0700 (PDT)
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
Subject: [PATCH v3 0/2] arm64: dts: qcom: Introduce Huawei MateBook E 2019
Date: Fri,  3 Oct 2025 21:19:23 +0800
Message-ID: <20251003131925.15933-1-newwheatzjz@zohomail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251001142107.21860-1-newwheatzjz@zohomail.com>
References: <20251001142107.21860-1-newwheatzjz@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr08011227018b94be48480eca8c6dd9540000a36dcfa08272135811c2584a4934096702c9600f78514e57e2:zu080112279578fbbc099edc8de0245e2e00002bf0b50d6d491a200abbf347158b7476e0dd4b93de9d052c0b:rf08011226cce8a2e2e887609d955fef4f000017584207c60b05865bebef06b963494bdf5e8ca092b1405f:ZohoMail
X-ZohoMailClient: External

Huawei MateBook E 2019 is a 2-in-1 tablet shipped with Windows on ARM.
It is one of the early WoA devices powered by Qualcomm Snapdragon 850,
or the sdm850 platform. This series adds mainline Linux support for this
device using device tree.

Changes since v1:
 - Remove 'enable-active-high' property from &vreg_s4a_1p8 and
   'input-enable' property from &i2c5_hid_active to avoid warnings
   mentioned by "Rob Herring (Arm)" <robh@kernel.org>

Changes since v2:
 - Rearranged the order of nodes and properties suggested by Bjorn to meet
   the dts coding guidelines

base-commit: 7396732143a22b42bb97710173d598aaf50daa89

Signed-off-by: Jingzhou Zhu <newwheatzjz@zohomail.com>
---
Jingzhou Zhu (2):
  dt-bindings: arm: qcom: Document Huawei MateBook E 2019
  arm64: dts: qcom: Add support for Huawei MateBook E 2019

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../qcom/sdm850-huawei-matebook-e-2019.dts    | 962 ++++++++++++++++++
 3 files changed, 964 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts

-- 
2.47.3


