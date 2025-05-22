Return-Path: <linux-arm-msm+bounces-59142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42196AC1756
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 01:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 688C13A3291
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 23:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFFF2C17A9;
	Thu, 22 May 2025 23:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rx+OgsWO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4D52BE7AE;
	Thu, 22 May 2025 23:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955384; cv=none; b=KKsrNVU+NvH4XRTFz+1TodIjg+RuuKLuYmlrNT4NlssbNHlf2JZeti3Go9su0VJrZ7hiWbsbWaeYJIFqHRwT1eoZML8a9IcRaW9AGsm1B7JdkrfvEWcKEclLbo+J1wfQ5yGQyJiruII+ejEgX0CcDAz8MkoEzLLcd0hZVyIbpQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955384; c=relaxed/simple;
	bh=EOZN61vPcPoZmjiOrDRCNtzl/DMqpv2ZH9hIlf0Lvd4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CAn1UJpaP0Qz8BwTEGj0I2BnvG/mqEZG/6aieyg2+djyR24n5sHAW/PifKI64ioVmnCTDDPhKV6qEx9NYCSSHRpFf9azZQ5dWxlqg49XE0YURPGOpD7bwxBhYOqBzSwFWPzuyThzdIHDSza7CHkv2iCy6O5Z6ZvcXuErn0GAWoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rx+OgsWO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC5CC4CEE4;
	Thu, 22 May 2025 23:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747955384;
	bh=EOZN61vPcPoZmjiOrDRCNtzl/DMqpv2ZH9hIlf0Lvd4=;
	h=From:Subject:Date:To:Cc:From;
	b=rx+OgsWOi8tvcBUQqH2n4xLAL3TOwSzFuCVCNw/subjrBHhZx3btY83b4oL9PPama
	 hnYhfGUTTAC8GdZ5UL+VkKr0TOcolcvnE8ijYaKllUuEBnghby+R07xg1huKEdAsew
	 0uCFoKQR7Y2+FNpP4PD9+oNluVhsPX/h8RD2kiiZN7PQXZv0KQnSBJDNVdWC/bZrhx
	 +xmWdwZJGEfjwr2qwAhFrtIRnXt53llbWkkhz2Jgvbreq0LGf6OqfnXtg1iJn1G/37
	 WO2myPJ1jhEr0LzRAGRpXwLuEltFPPOyJqVOjlL0qKOXDlO9uSWo70YpRFkam3TxMo
	 2Imzh/houWQ0w==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/3] Grab IPA IMEM slice through DT
Date: Fri, 23 May 2025 01:08:31 +0200
Message-Id: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+uL2gC/x3MQQqAIBRF0a3EHyeYYURbiQjRZ/2BJRoRSHtPG
 p7BvYUyEiPT1BRKuDnzeVR0bUN2N8cGwa6alFRaatWL64xsBUezckAQDn4YrDXjCE01igmen38
 4L+/7Af3Il89gAAAA
X-Change-ID: 20250523-topic-ipa_imem-def66cca88e5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747955379; l=1070;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=EOZN61vPcPoZmjiOrDRCNtzl/DMqpv2ZH9hIlf0Lvd4=;
 b=Mtf+Kz8MxA/zVqIaYonOARh9viF2dKwgikqBSquPF/O+6W6vKZ4YFJT1/oRxZ3/IrwGB4EAYT
 S1LE0vA2+xpB4kE6OJpndTOkpRzOwUrvf4RUk0RqBwdMs8ho9RGlR5Q
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This adds the necessary driver change to migrate over from
hardcoded-per-IPA-version-but-varying-per-implementation numbers, while
unfortunately keeping them in there for backwards compatibility.

The DT changes will be submitted in a separate series, this one is OK
to merge independently.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: sram: qcom,imem: Allow modem-tables
      dt-bindings: net: qcom,ipa: Add sram property for describing IMEM slice
      net: ipa: Grab IMEM slice base/size from DTS

 Documentation/devicetree/bindings/net/qcom,ipa.yaml   |  7 +++++++
 Documentation/devicetree/bindings/sram/qcom,imem.yaml |  3 +++
 drivers/net/ipa/ipa_data.h                            |  3 +++
 drivers/net/ipa/ipa_mem.c                             | 18 ++++++++++++++++++
 4 files changed, 31 insertions(+)
---
base-commit: 460178e842c7a1e48a06df684c66eb5fd630bcf7
change-id: 20250523-topic-ipa_imem-def66cca88e5

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


