Return-Path: <linux-arm-msm+bounces-76058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 27419BBDFE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 14:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 57EDE4ED5D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 12:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6416627B505;
	Mon,  6 Oct 2025 12:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="CNAX62to"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996176ADD;
	Mon,  6 Oct 2025 12:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759752919; cv=pass; b=rPn/zzD+r7T815hVyDb7rodPNcni/xjOuD1J3ZZltWirbg8qiBbfxhdd1sfVFCXKRm6mo8HDLTA/SfhXhmjjTsZ7gNkazzuMhEm4XKtyK/T3cne8wKLgMlygx+mb7c+AP1qsiExaj2j0rX7SkRItE+FZcnIgqnnsEFjPiz5noFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759752919; c=relaxed/simple;
	bh=oaxNNDOmFgwM1kJf3ftKOKjqmuUynKCc4cu/8P9NQJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o/wenGdShTlRk/EyZZ5zfB+eI5hETo0rd3gyXUsmVVphE8zQIv7bSFPWsb0FFuLYWG/HS2YGucRqpNWcKAfe+Wurg9Sldl+1g/30X3P/6IvWlhi+4r/1jUQv3IUjW7li+UbJNj4CzZXQ5HelldmCtOmNpV6pbpC1GKbgYyl1reY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=CNAX62to; arc=pass smtp.client-ip=136.143.188.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1759752912; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NqWPazd+ASbZV/VKcABjBNN/Yh5IM5EHaXWWutZAXH8dRXpP3NJv6lRdVwiN65ADxZ3rHI0w39c0kXxS2/p5BTAF5jfRMrPLsv4wGtCFkYA9t6dW3brKzEBtr1W831Agtbux7PHTQhNpaccMgpd2bJPYHScCnXJ7Obfa94pp6TA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759752912; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eLsI7blZDryNkmQXLrdDYitpRo4H9hLZxrVzac66TI0=; 
	b=kFuGpn2WuVKJEjq01XvPZKD20qj5iYA+MeA6dRhvUOiGdBlyBd5CYCc8E5WTrWgUwAUXxaUjd/x3TTYnQ7aoU4tFipkCwH87z1aC8jztU5agxzOUrwHdfwWo7FAX11gsUBRFyl/zeDga8User/LtSAgpbf9Q/FiJAK9FDo1Zhp8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759752912;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=eLsI7blZDryNkmQXLrdDYitpRo4H9hLZxrVzac66TI0=;
	b=CNAX62toO9EDrQl1JogSbCJ8S0NwAzfiF5nbr6eGbydssRo7mjG3+BYDQm/EC1KT
	hrvPG4N8bWeEHhyoJ7GFl1IHrKf71mrPSxNpm0eKBfnTVhE/vsGFZOKxj8uNFazTw9D
	Z0InRTt9kMFtUkZEyPBvvlG1uRZXHea2hNBMn204=
Received: by mx.zohomail.com with SMTPS id 1759752907963941.8350424458547;
	Mon, 6 Oct 2025 05:15:07 -0700 (PDT)
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
Subject: [PATCH v4 0/2] arm64: dts: qcom: Introduce Huawei MateBook E 2019
Date: Mon,  6 Oct 2025 20:14:53 +0800
Message-ID: <20251006121456.26509-1-newwheatzjz@zohomail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr0801122756e720f5d24bb63cc0a85c8300002683ee7aca1a564839e5b60373d02173956b1c312908f13848:zu0801122703f5ab3b1e590f5a216d74c30000c00c0a0a3b210c4f7eb95f4b0c67981bdcb1d7ad91e365925a:rf08011226c922f1e9bd0f3611907bfc210000c223ae9d0363dda5cbfbaa165fc8af874b124b90821a9e0e:ZohoMail
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

Changes since v3:
 - Added new lines before 'status' property and subnodes for better code 
   formatting
 - Rearranged the node order of regulators and pinctrls
 - Renamed the pm8998 pinctrl nodes suggested by Dmitry

base-commit: 47a8d4b89844f5974f634b4189a39d5ccbacd81c

Signed-off-by: Jingzhou Zhu <newwheatzjz@zohomail.com>
---
Jingzhou Zhu (2):
  dt-bindings: arm: qcom: Document Huawei MateBook E 2019
  arm64: dts: qcom: Add support for Huawei MateBook E 2019

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../qcom/sdm850-huawei-matebook-e-2019.dts    | 975 ++++++++++++++++++
 3 files changed, 977 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts

-- 
2.47.3


