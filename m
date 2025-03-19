Return-Path: <linux-arm-msm+bounces-51888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC24A683A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 04:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E66F8424074
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 03:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C02724E4C3;
	Wed, 19 Mar 2025 03:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNu/RMkY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4250C215055;
	Wed, 19 Mar 2025 03:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742354577; cv=none; b=vGlrOEOM80rxZr1nB2Mx1cMEYyPLtR+FQ5sWejq2LbKXwqyNMFcDDWlJLFqEiIaQaD5yKH7lMPzFfePXvIAgTEZt9z3rFhjuaTKEhyepNTBaS60OmQg7WzYN3ue7GXMd63UhnbU5JZU6ygiWdFNfb+qplEXASnpT7Thlw8AsSpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742354577; c=relaxed/simple;
	bh=OIzJIfkOFGoCE9pBG/Lr5IOf9VKdk7vbd7YcXAXXAEo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ltEDWhzWE9fy4SXguDjU4FkA2o+x18Yec2bwiXGGoWp1d09g5T5e2UY83v1tBpAu2LPMuVd++pk8mLzmZPNncx2ZOc5LOnRsZZl1F2+JQ1Ty4a0eD/RyYB+2dsQhd95b6Lj8JBk5ERemQIiwNTgeATKQClWsBRqrWCPOgE3zgzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNu/RMkY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA10BC4CEDD;
	Wed, 19 Mar 2025 03:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742354576;
	bh=OIzJIfkOFGoCE9pBG/Lr5IOf9VKdk7vbd7YcXAXXAEo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=SNu/RMkYh2+8GNgZvWtiZZlQBpWr3PEuwWMvJuWkLyrHEDD9sSnxga8hgCx98jOMz
	 JFHWnrMnFhFq25VZU2yOq+IpBdWh53nFPO5WHFZHdEcPCfBxdQ1JEL6bcG3NPjS0cx
	 Eo04JjCACoH7t2kcvqxUwFxC587xys1yd50suGCPVaW/Eh82ejVa04ZB6XqARtfsEv
	 iX4uipBIIVzPAtIULs4YMIQx3R1vEBPicwCj3NyVIvnMi63Gzl4OO+FnfpnTZiXkCm
	 oIgDH2k9D3vwog+YZjtn5Em3q2SwVW9TFNFd5CaBl/a6ZPOOYKAb51uSlOpDkDifGy
	 BJ/CFuXLiIMew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BD7C35FFB;
	Wed, 19 Mar 2025 03:22:56 +0000 (UTC)
From: Bjorn Andersson via B4 Relay <devnull+bjorn.andersson.oss.qualcomm.com@kernel.org>
Subject: [PATCH 0/2] arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable
 fingerprint sensor
Date: Tue, 18 Mar 2025 22:22:55 -0500
Message-Id: <20250318-xps13-fingerprint-v1-0-fbb02d5a34a7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI842mcC/x2MywqAIBAAfyX2nJBr0eNXooPZWnsxWSOE6N+Tj
 sMw80AiYUowVQ8I3Zz4DAV0XYE7bNhJ8VYYsMGuMXpQOSZtlOeiJAqHS9ner4T9iA5bKF0U8pz
 /57y87wdfDSP4YwAAAA==
X-Change-ID: 20250318-xps13-fingerprint-a7fbe2792c24
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742354576; l=770;
 i=bjorn.andersson@oss.qualcomm.com; s=20250318; h=from:subject:message-id;
 bh=OIzJIfkOFGoCE9pBG/Lr5IOf9VKdk7vbd7YcXAXXAEo=;
 b=xPdarBZ6Wboru3bGIBrX//UgIq+TafbLcKFRcVMI2nbSEI5CvAFcun9STrbiGIKfJIMr0AlgF
 8qRciq7cCFgBd/GMkcO9od9WJ6yd77Y9k8jHNNoIYd04EkVb84UcJFE
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=rD3O9C9Erg+mUPBRBNw91AGaIaDVqquHZbnn6N6xh6s=
X-Endpoint-Received: by B4 Relay for
 bjorn.andersson@oss.qualcomm.com/20250318 with auth_id=362
X-Original-From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Reply-To: bjorn.andersson@oss.qualcomm.com

Make the repeater optional in the SNSP eUSB2 PHY driver and describe the
involved components for enabling the fingerprint reader in the Dell
XPS13.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (2):
      phy: qcom: phy-qcom-snps-eusb2: Make repeater optional
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable fingerprint sensor

 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 59 +++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c         | 10 ++--
 2 files changed, 64 insertions(+), 5 deletions(-)
---
base-commit: c4d4884b67802c41fd67399747165d65c770621a
change-id: 20250318-xps13-fingerprint-a7fbe2792c24

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>



