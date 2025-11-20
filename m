Return-Path: <linux-arm-msm+bounces-82722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 779E9C75C55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 18:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id B27C23367C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 17:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F0736D50A;
	Thu, 20 Nov 2025 17:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkWgWMwt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A974936D507;
	Thu, 20 Nov 2025 17:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763660031; cv=none; b=nV5acV8+EJsfWDHa6Xggh/KxXw9zEHT2BhOcEQfUmK+SRFAhCstmRZZ8n0RF38d+ZloEtvSw4Ep2k7FzCfIABziimlzv6IH/PYumGm3r4NYYyXiw4nNCYeUcJ17jtCznWzOk4qubEKa1PJ5qOv9CmwAJwSxEPl88trcjlhnZ/Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763660031; c=relaxed/simple;
	bh=tWt4S/VjPKR3HSRkH3iDfzfRVd9TwK3IAQzzX5E2DAI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=knQRYrlkpAo63E6NI/sdHwHBjlzMcd2JaPqLXHi00aj1BbcGc5trEH1ffJUF1yIDgaCgn5gE1TQ8J59EEfi0tJCSqtoJzNISiA2C7K4vEjXBQASwsUlF1fXDlTzOYqq0Mp0wGKN+sakB6hMNec015r9XryEYfDUsyyPX73Kk0uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkWgWMwt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB79C4CEF1;
	Thu, 20 Nov 2025 17:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763660031;
	bh=tWt4S/VjPKR3HSRkH3iDfzfRVd9TwK3IAQzzX5E2DAI=;
	h=From:Subject:Date:To:Cc:From;
	b=lkWgWMwtLZ9CH5agGkvhp/AIsHNkvgqpG8WQmwb+Z8l0Tzld3ssdHs95ns4J6XSqh
	 uTHqoVuXVulha16l53eKz4zIIbol/FmUpHmIm3lm26O4UHslSynSe5Dl1SQjpr1cHs
	 jI2o5hpTvBxptVixFpepRDhlsUeXw03QuB+oFVfI95IQRqbRyPdHoIbRVSM4qc/LKV
	 IqTG2Oh3zmmRwAuBbjQZi4xO/U1eS99ETrGk9r51js1WGPUTYZnMBFFuhYgYhpjTIX
	 ij6u/rf6fujsN/5qe/J4fSOj0I7wu+30YN4m4Uhqc59KeQ7PN/rogTHqtkOdYGfEPE
	 446TMUWe6h4og==
From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 0/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
Date: Thu, 20 Nov 2025 18:33:30 +0100
Message-Id: <20251120-b4-sm8750-iris-dts-v3-0-8715442c30d9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOpQH2kC/33NQQ6CMBQE0KuYrq0pn5aCK+9hXFD6hZ8o1RYbD
 eHuFlwQE+NyJpk3IwvoCQPbb0bmMVIg16eQbzes6eq+RU42ZQYClNCZ5EbycC21Epw8BW6HwNF
 Yo2wjEUGzNLx5PNNzQY+nT/Z4fyR7WMuOwuD8azmO2dz+/YgZF7zKC6gMyMICHi7U197tnG/Z7
 EVYjVIUPw1IBjSYVVqBQrRfxjRNb284sXQOAQAA
X-Change-ID: 20250714-b4-sm8750-iris-dts-ebdb5dc4ee27
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=krzk@kernel.org;
 h=from:subject:message-id; bh=tWt4S/VjPKR3HSRkH3iDfzfRVd9TwK3IAQzzX5E2DAI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpH1D586yhi+jeOWhJHVhaETDqyCQNIaKw41R4+
 TbDOz+yuM+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaR9Q+QAKCRDBN2bmhouD
 1x7aD/4gnB6EYBMWTuwg6eQZslWwwWC4S7kvL4jaAxiOSfsAGU2wJsCIpFhg5aKeLizXJf6hJ+S
 G3hv4/uUEXBMysOVKtA9u6scY9H0/YdEwOg6/w+72fC/YTEu9C1B/sU2UjlHzObGS5iUwxbJvwL
 boPSiPTkLfgj1IsWRyAhYlBoor5GhhPMRoGffA0POLuIIiE4qTD6RFgBnb59TH1ywMNUV2rR2qC
 IgZx7r+8vMY+3PjVGlphtT3ij3yeiUwGwFqlmh5QfB7/QD44FTwJNU2owLVg4WQ+aoC9WkNrILo
 wFBYCZon+RLGDm+3L4EglppjvnKKa+8R6350wmMiVYOFXJ9n1saYeq2v+UhaTahm78Y7bXysIxK
 0Mmne7Z3blYZH2DVBctyTdNB2fA3SzQ1hjrZ+oVUPwtfZz5So4A4yr5hsIB610D1OcRpD9pl66C
 K0o2M47C8hyMZ5Ht+IdZ8Q2npkKz6B9yCd0nOL8H5esW4Q2fbFrcN2yF9H9SioWiMnxPhh9Aq+Q
 vJ2Y9iY6WgmW3mPIxi8Jrh1qWliRBk6QDo5nusTx/zcfLmx1HP1t6RQ94pivvck50t3ZTSKL8yq
 9Jx7pU2TfFLHRZm+pQgFxpkdnxpK/GXQnSlk6hQZJ7EjadQnf7OLviPtttYuwUC0TxO+AM++KVT
 euzg0B3a2Nnl4ag==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

Dependency - video-cc clocks bindings header - is already in qcom clk
tree for v6.19:
https://l re.kernel.org/r/20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com

Changes in v3:
- Add tags, update dependencies, rebase.
- Add missing opp-570.
- Link to v2: https://lore.kernel.org/r/20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org

Changes in v2:
- Patch #1: Add RPMHPD_MXC (Konrad)
- Link to v1: https://lore.kernel.org/r/20250714-b4-sm8750-iris-dts-v1-0-93629b246d2e@linaro.org

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      arm64: dts: qcom: sm8750: Add Iris VPU v3.5
      arm64: dts: qcom: sm8750-mtp: Enable Iris codec
      arm64: dts: qcom: sm8750-qrd: Enable Iris codec

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts |   4 ++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts |   4 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 119 ++++++++++++++++++++++++++++++++
 3 files changed, 127 insertions(+)
---
base-commit: 9eb88791f9759995910e9b96bb55a9cad54bb84a
change-id: 20250714-b4-sm8750-iris-dts-ebdb5dc4ee27

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


