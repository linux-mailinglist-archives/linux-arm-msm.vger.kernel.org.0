Return-Path: <linux-arm-msm+bounces-76283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A6CBC3214
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 03:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE6AB3B02F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 01:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9875B299A8F;
	Wed,  8 Oct 2025 01:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="c8JJqIva"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977EC23E320;
	Wed,  8 Oct 2025 01:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759888464; cv=pass; b=gCC4jgyTeMwKFoE90eo7XJ/FLxEX4LX7q1yGths5Vg+FPB38hd8c/HwfrKiCys5IrjFj9VCTbT4AET1R6SEbiAey2UN6uC0RCQulLLkbJSsVcZLVIwbPiX7x4pJezL2lUfEHkRj8B0wohIsrhekDVy8VgSSPsVXXV3fFE7hApUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759888464; c=relaxed/simple;
	bh=C+DPJ/8jJYfCDcWTU91Id0h824T2FPQPPCn4tcsve3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=okAn9yWz0OiHu/RNLsZlLcOa7wUpYtv55mT3OjAY++Egt+0x43piV7icNjCjLeQPo9XTQDcCnwXz4VKxSwW8QevTqCZt3eWLpzi5asmO6gSYm7ScrCBlLk0jgEJzJ2OorimAsBUXEvjnACp+efL5rMzP8YBF0tChUQAXTqIzk1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=c8JJqIva; arc=pass smtp.client-ip=136.143.188.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1759888457; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Id36dcXr9KLiaFT/qdHZ8rnjpe16/wYLbAbLEVh3EpzdbbMWcEHuKd3NaW+o3LNfewVqn2CJeWUF4M1vMw1zE/5OpAGpb5SJmjau+IVT3IisLwq+mxKyUqkQal1ff2mhS0Y0zRBAF/3O5e9RVMSswLcDXpubW17PE8R1hKOkGl0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759888457; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RvVeq1rNJABl3cWiiGOcJTNDgAvpCJOMD8Pa3W56t6k=; 
	b=jxHtHd6ab19EdEtYHsVr4Nfrh7Eu7/IEe8ZDdX8jkQUsmgHQeUTpCRYFsB1kyQSzl8EhwcQvHTVAf+O67sK8SCJIvwVENEYkmidtI/jc5RkqfzO81H3FSoYAlIIg6Wx5LQ7IMkfhlbAGxMbR0UjwQ6pC6ekDVmJnE8qnuhh4GzA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759888457;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=RvVeq1rNJABl3cWiiGOcJTNDgAvpCJOMD8Pa3W56t6k=;
	b=c8JJqIvamqqRjgOY6YP1nyzBI3s809Z5KxRxRayL27Tn5NR/renvWjxFr/HeJeoK
	//x3nwO/oFe0ITqZUXKNKNm2cP+y2jsQm1zXltOXZMOAbW+2gLuTep5JFpOTVnZoned
	sqodApBpUs8UkS9VI7vvIGfnsaLHq/RI2pyw7DTs=
Received: by mx.zohomail.com with SMTPS id 1759888452503931.5456142120652;
	Tue, 7 Oct 2025 18:54:12 -0700 (PDT)
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
Subject: [PATCH v5 0/2] arm64: dts: qcom: Introduce Huawei MateBook E 2019
Date: Wed,  8 Oct 2025 09:54:02 +0800
Message-ID: <20251008015404.4906-1-newwheatzjz@zohomail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr08011227612280e81a7eb03b164683e200001918fb20c966cf9a9587df68e74821d65e85a57cd8e642ca85:zu080112278b64cbe7f74296c30f43c80a00005df5133c9bb9b26ea04f83099b69a75ca2419ac3702b1ea437:rf0801122608d5c04929665373ae73333400007cda9107b0dd722bb0baf2fc18b63ed47e210fa50fa1b7bf:ZohoMail
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


