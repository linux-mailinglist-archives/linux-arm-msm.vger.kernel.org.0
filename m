Return-Path: <linux-arm-msm+bounces-83451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85352C89B0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 13:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58B663A4038
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 12:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4DB13271E5;
	Wed, 26 Nov 2025 12:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5BT7LFW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4544F32692E;
	Wed, 26 Nov 2025 12:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764158929; cv=none; b=dqVe+U0PbonpgkFRH6/kL5gvux4fL0kXxZ9UXgg1u9NnDqsk+MQNoI9DlnDLxpgCCcEfuUSrfO5jhQUy2WYNW1aD9w5gvShBcJV5JNG6/dGR7n2sZSXkbCr+4SunYX6jCbdtG7Nabx9/d93N0hZ82GEvzuFzfzBBywOeeWHn6VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764158929; c=relaxed/simple;
	bh=ElnGPqFvz62tr9E8HS/4iLIgaALgD3PStTWgfVE+gkE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GmfHx/GePKvkIKUFzMmiVyn+cQJWA5nrAvTwme8Y2qYLrFhHW7KzrHyTNQoVRz/s9JEknPDhOT2h4sAdeuOMw8IhjMgMcN+yDx0jN/DX1PkhFEjwRrNiKnuTAIFdG3nAZxE44RJxnzhn1eejohawwIaIdYpesBv68pTfnEMFJGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5BT7LFW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94DB0C113D0;
	Wed, 26 Nov 2025 12:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764158928;
	bh=ElnGPqFvz62tr9E8HS/4iLIgaALgD3PStTWgfVE+gkE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=F5BT7LFW0080MkX22z7WjzC03Qu6mGiqwKEVKwPICqKbDI6ZSwPtKWOMwX4XKn3KW
	 AQ5YRh5kPa1WQugrTOW3dYSG8+uSWzpN1QXtFLrHoJItrR+09ozmYvOfm61iH1dbtM
	 6g6ME8ftLJVYCOwX1xWED50nS/jumCPywnGpXJMxTgRr/1JZi8eZRuC+oKFBzaOc/C
	 C6BKdJ/Izi0i/+WYzTSwiVmEmZxY26iAFk7pxwwwY/7JhFPhXrR2YSN+MDYd1uju2T
	 ey5Dnp2NV32RjTUq8ZuwsbLJ4WV+oYAIdBvY+oBzQTBLvwytC0b6rJy+mnkWS6kk8A
	 Hs96BJgT0aRig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AEBD10381;
	Wed, 26 Nov 2025 12:08:48 +0000 (UTC)
From: Robert Eckelmann via B4 Relay <devnull+longnoserob.gmail.com@kernel.org>
Subject: [PATCH 0/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable SLPI
Date: Wed, 26 Nov 2025 21:08:34 +0900
Message-Id: <20251126-slpi-v1-0-c101d08beaf2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMLtJmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyMz3eKcgkzdZDNDs1TjRGNLw+RUJaDSgqLUtMwKsDHRsbW1ALGoOI5
 WAAAA
X-Change-ID: 20251126-slpi-c616e3a391ce
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Robert Eckelmann <longnoserob@gmail.com>, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=595;
 i=longnoserob@gmail.com; h=from:subject:message-id;
 bh=ElnGPqFvz62tr9E8HS/4iLIgaALgD3PStTWgfVE+gkE=;
 b=owGbwMvMwCVmcOAq9/vk/SGMp9WSGDLV3p4vbGzZ4/RCd07c3ZkWx1brZOfwyWufMOr9/nP3+
 Yh1TI57O0pZGMS4GGTFFFl2uB3TyXRdGrFx9/4ymDmsTCBDGLg4BWAivxcyMkxwF2mqn7e2QVvP
 csmLTQ/P7p88q+WyaWLvD9Z5eU/6GOMYGXY3nsldrhXDd7zupF8lw/oPwQKno6TdVerrT749kGf
 5mRcA
X-Developer-Key: i=longnoserob@gmail.com; a=openpgp;
 fpr=B846C62C6945A558B1BBBF7630C0D50BEF63BF54
X-Endpoint-Received: by B4 Relay for longnoserob@gmail.com/default with
 auth_id=569
X-Original-From: Robert Eckelmann <longnoserob@gmail.com>
Reply-To: longnoserob@gmail.com

Enable the SLPI dsp on the Xiaomi Pocophone F1 with Qualcom SDM845 SoC.

Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
---
Robert Eckelmann (2):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable SLPI
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Add placeholders and sort

 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 30 +++++++++++++++++-----
 1 file changed, 23 insertions(+), 7 deletions(-)
---
base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
change-id: 20251126-slpi-c616e3a391ce

Best regards,
-- 
Robert Eckelmann <longnoserob@gmail.com>



