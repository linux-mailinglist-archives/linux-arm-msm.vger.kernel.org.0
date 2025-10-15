Return-Path: <linux-arm-msm+bounces-77444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BE4BDFAA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 18:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BB503C1C12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178132FB098;
	Wed, 15 Oct 2025 16:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BoA8dLHY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA832F1FDB;
	Wed, 15 Oct 2025 16:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760545948; cv=none; b=DkFLUGDkIaFAJ/P87PjcubKXAJAjECfolRRTqeIhTvTKHL8TL+ya/kaYKoaIFnsDkbmaUaXNNM8fTlG5k9eDOcslUXU7Kwh/11bvCiFuiQFXqZPC5ylGkVAcwGq/4KkvovSVkpyGCV+Qpp+Yjop2POKE1B1KLXodDrVnD90PwwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760545948; c=relaxed/simple;
	bh=ie+ylesedpI9jMhZxIpqW8R56Zyac9ugtbrkk+dBWxc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ip7kAt+chRNVckpaflXxNVO6y9CNOy1F8XXDT4pQtmOieOhaY+QRv/pvCOIbuqev1tCCH9B/O6kg6WEykkhn6SzubBd7IQPjC9OP4mOx1OaJ0cnZzS8V9sqTjRk1RNZgOq5nG/rkg+nLg5DEhJykkRXKRl/OBLuMWsyJ2MYs1VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BoA8dLHY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6012FC4CEF8;
	Wed, 15 Oct 2025 16:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760545947;
	bh=ie+ylesedpI9jMhZxIpqW8R56Zyac9ugtbrkk+dBWxc=;
	h=From:Subject:Date:To:Cc:From;
	b=BoA8dLHY7U5qBJSZ1h10w4egn9LOR7Y//oD41jbWQCzpgltwnxNEB31wwvItLOmv6
	 2EU2C2s67M8N0nacpfvD+S4oQY8UgZrQOqoSEfCXuTEni7Q1HwNY4QuDjPCBBeYpUg
	 6xTpeh551QWXraKsfa8vJsK1V9mPk9uCAD7aYg40xSFdl5O+AQXvlJco2sEXxQMlQM
	 xj0Z9Rc6dwVRiKJ4VLPLGxqnbwmADKVj3Y1MB5z59FyvrgFXCmmdN4jy/23rncNOVi
	 KOHKA/aH69QJGR8Agvm3XpIi9N5LBfh+VxKJicj7nGuaIthljyRP6u7XSaQ6C8vcai
	 3QeHMNPBDCPYQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/2] dt-bindings fixes for sdm845-starqltechn
Date: Wed, 15 Oct 2025 18:32:15 +0200
Message-Id: <20251015-topic-starltechn_i2c_gpio-v1-0-6d303184ee87@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI/M72gC/x3MTQqAIBBA4avErBNSkn6uEhEyjTUQKioRSHdPW
 n6L9wokikwJ5qZApJsTe1ch2wbwNO4gwXs1qE5p2Uktsg+MImUTr0x4uo0VbkdgL0arkYahn4y
 VUPsQyfLzv5f1fT/RvFZRawAAAA==
X-Change-ID: 20251015-topic-starltechn_i2c_gpio-8f5ce7749af1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760545944; l=574;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ie+ylesedpI9jMhZxIpqW8R56Zyac9ugtbrkk+dBWxc=;
 b=oEePfW5cZzL5sbOHNWuhfL8Fxb9ZtVlreOXjhGE4LB7GVVUNCm9nEqmVAJ53PV6Ab8gPUa+xa
 ICYb5BBzVXIAe07LF/TsiYZAxpLoBD/R5tJ74qQ50lB1aLtN9LnEHYK
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Just some low-hanging fruits

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (2):
      arm64: dts: qcom: sdm845-starqltechn: Fix i2c-gpio node name
      arm64: dts: qcom: sdm845-starqltechn: Remove stray #address/size-cells

 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
---
base-commit: 52ba76324a9d7c39830c850999210a36ef023cde
change-id: 20251015-topic-starltechn_i2c_gpio-8f5ce7749af1

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


