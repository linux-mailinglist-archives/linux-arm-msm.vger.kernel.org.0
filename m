Return-Path: <linux-arm-msm+bounces-67304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D3AB17E22
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 10:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 792C2163D1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 08:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779FD20DD72;
	Fri,  1 Aug 2025 08:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTbc2yrF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7575B21A;
	Fri,  1 Aug 2025 08:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754036500; cv=none; b=t6iK1TlGswxyYjAf7pKmqjbjJYaVC5zqrFclygmDobOVuwy6CDzYfiwbxlwaJ/cm/j0W6RhMYmnO/49St3mWhbZVIgaFTa8OkzaJB/FTaEz1tLZbbO+jIx+oZZzvyG9z30QbrqvaDPdxV0fZppzGjzeLYIKag20dExan2G6EcIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754036500; c=relaxed/simple;
	bh=cbKMaeNFnC7Uv8CxN51Vo7VVhMeUMuTAk7cQCsUiu9g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Tz3QB3ZFhxNXUuA9E9i61ZGlDNslyBzqHmN2ub8l4R7o2s2nlLzLMhiBAQNUNrFIfEXJoEKd6nC/8zkrU2xlCACqbK4cCtkj9SzrDVLlDHmiWebWbsRzFEr0U9MAPjYKJx8hiGjLtkpMhZXi2JM9WLoCorJZJ9bC3whlhT1mV58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTbc2yrF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB812C4CEE7;
	Fri,  1 Aug 2025 08:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754036499;
	bh=cbKMaeNFnC7Uv8CxN51Vo7VVhMeUMuTAk7cQCsUiu9g=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gTbc2yrFVSAVx2nDrKvi39jtB3QnUZulBbCbLLLcROqNlD3RfVzs4W8Nt0ukaQw0J
	 M3F8pa5dREUiN/xPeLIi2LstTyW/2JdSPhu2IZr5Dp4HMpBZ4T6pOEv8dpU2zctLWc
	 hD8Av7QPj5kp/1acOaL4mJWB5KN8n5La76xJA8gl6zzE1Ys25OrgwFYKkLhzwONR5o
	 kQEmK51qa7HW7N7oemtphnYX28EJ7IMHXMe9pGUymJP7/kmin0PCnYLHQI9KIJ0o6O
	 2k4EbcAh0ZDwcSnMOLkKWgTOvM3rOpHbaYqCnTNcTZilTnL9YlgXbIa2AgEpk9gRPh
	 bmeHY2imPQ3dg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00B0C87FD2;
	Fri,  1 Aug 2025 08:21:39 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v2 0/2] sdm845: Use definitions and deduplicate
Date: Fri, 01 Aug 2025 10:21:38 +0200
Message-Id: <20250801-sdm845-msmid-v2-0-9f44d125ee44@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABJ5jGgC/3XMQQ7CIBCF4as0sxYDSGXqynuYLhRGOwvaBhpSb
 bi72L3L/yXv2yBRZEpwaTaIlDnxNNbQhwbccB9fJNjXBi11K+1JieQDmlaEFNgL85CIVlmN3kG
 9zJGevO7cra89cFqm+N71rH7rHygrIUWHBjtyZPFMV155OboP9KWUL3uzLwSmAAAA
X-Change-ID: 20250731-sdm845-msmid-4b08871728dc
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=cbKMaeNFnC7Uv8CxN51Vo7VVhMeUMuTAk7cQCsUiu9g=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBojHkSBWvNXNdLcMUpN8bt8KueWCleQmK/GcdTZ
 AlZM4DI2COJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaIx5EgAKCRBgAj/E00kg
 cqNrD/4hy2MAe4IilwbDSw1HeXkm2bI8unrs3isoiJmmVRVohN0QVFHgKno1CJZAi1AXBwVVNAT
 LOMVtL6EvdmTOh+fwmEv88bBcbQhsevS0AJ9i+FgCPmV0WluT2anXH0ouuW3dLMiceMrhLfxbKW
 COdP6fTALRJRog+G4dIvN9lgdSsLGdjs1cDmZnxFO6sZdUmLES8K1n2eMUS7Up3HbGmHUykgxh8
 9fYnEMEj3REFY/mKQMPmjUUn9yOrSGPjttHRm6yEt844yNIKdbbkfc8DzB79/F6joNM4WCux61o
 f3o/mPGda/XALNqb/SYX+4GvwLQ71JwsRA9c2k/cvlriwx8ExRU7MdPMS2IE5q16UhQr0bXAyOF
 LwQSpcqf/PmRl5/8LLDtrgIpHmFJxkR/jzfC9Yk6kly/kIVKBa+5UGN71Mn5A3GftKUpJ0DpGXH
 FY6W0l+xFgjlBOW+b6WPN01vzdOhuHmpeA4yVeM/Dr4m/PGng6/+SP9H+zm+50fimr3WDjWXgkf
 0oflYoKUssidXxQqxxbJ126sv2c7k4KjsHmjUE0ZT0SV8CVDLIzk/1UBX/+8qNQbzMJdVs8k1Rg
 6cSsO2i1O3CCXF7e999mynmI71HFdjE8gRGYFNZcyrPUPJhs7KSA/9gxcEuK2o09POMY3SCmUtQ
 Rgcz+kfLUVwXuGQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Small cleanup.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- Added missing include.
- Link to v1: https://lore.kernel.org/r/20250731-sdm845-msmid-v1-0-98489ece786e@ixit.cz

---
David Heidelberg (2):
      arm64: dts: qcom: sdm845*: Use definition for msm-id
      arm64: dts: qcom: sdm845-oneplus: Deduplicate shared entries

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   | 3 ++-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          | 4 ++++
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts        | 2 --
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts           | 2 --
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts            | 3 ++-
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi        | 3 ++-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 3 ++-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           | 3 ++-
 8 files changed, 14 insertions(+), 9 deletions(-)
---
base-commit: 84b92a499e7eca54ba1df6f6c6e01766025943f1
change-id: 20250731-sdm845-msmid-4b08871728dc

Best regards,
-- 
David Heidelberg <david@ixit.cz>



