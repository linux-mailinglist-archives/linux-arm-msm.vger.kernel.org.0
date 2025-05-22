Return-Path: <linux-arm-msm+bounces-59146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB78AC1778
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 01:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12F4D1C03000
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 23:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5D52D026A;
	Thu, 22 May 2025 23:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YP72t/cH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E121D2C376B;
	Thu, 22 May 2025 23:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955919; cv=none; b=GGoButRua//mCatbl7CJSRynI2dyjy9hGfs2Mi8q0LlzLOGjzXRm5yTh2kduoYxDZHsEis9ttf5aQBfQ1E2sHX4W3f36K6xDo42a4/uOtH2xbsVFQWbZYd2XCGtU/GuN/iZgubAd5fwLN8LpM+alcBj7X5pzdVpk116pv6loXGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955919; c=relaxed/simple;
	bh=5+7fAY6eR4MG9NgL+IBBN9GTAKyqw2wvO6TVHj4p1J0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mRSNcqB/GR4sACRfpPjzMcHNehOTRaJIO/uDnITxfcJcudXcDc1Y5LgefQQGO47eURTLzGfnXMIGgNaUdhaftRU0LYAEG6WMDRjWO1dnIOmc6LL8ZBBT27oyxKI5gbzL7lPD8whnwxBkZiRNG2nXDcwonscLm5IUpY7cL3ERAEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YP72t/cH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8726C4CEE4;
	Thu, 22 May 2025 23:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747955918;
	bh=5+7fAY6eR4MG9NgL+IBBN9GTAKyqw2wvO6TVHj4p1J0=;
	h=From:Subject:Date:To:Cc:From;
	b=YP72t/cHrkt13dZbB0RmKH5rCh4yTHXqfKGg/1z1dmecZFNDvXALUFp+J+e1qKcW8
	 2X4rqSsgSg3k9nub7aITAlbgxPTAXT37jX/jnOQFUy/hTD0VgJHJ6wprHMC2ipkVyf
	 p9AbO2VzTg9akgS+Q9VQx+g5FjL8Sd0L7TLzqmXRoqQY3PS8vlHGhQ0MwiWJzZCqZP
	 oOV7OqvrnTcHkGqGIDnqVUdU8ahnG8P6E9DUf2yIfXg8MIjflQfFb3+2H217sApjxm
	 /p9JId4UCQdchTFWKLsywjEYUy8Ar0Zk9Y7T+jnz3yKZ5XW3WuuEyjdkS8h1vHlUN2
	 KBBpeXlV83MxQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 00/10] Grab IPA IMEM slice through DT, part 2
Date: Fri, 23 May 2025 01:18:15 +0200
Message-Id: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALewL2gC/23NTQqDMBAF4KtI1h0xkdRWSuk9ikjUsR1o/Jsog
 nj3Ru2ym4H34H2zCMaBkEUaLGLAiZjaxgd5CkT5Ns0LgSqfhYqUjrSKwbUdlUCdyS3avHIM+lL
 rKomNrJUUftcNWNO8m8/syAP2o6fdUQqLzGan0+D2RyZPwyQhgkJXOj6rqyyT+tEyh/1oPmVrb
 ejPfftWGEbYGnJp0ODs4Acqka3rF+uaAjHgAAAA
X-Change-ID: 20250523-topic-ipa_mem_dts-58f5d73a1f21
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747955915; l=2463;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=5+7fAY6eR4MG9NgL+IBBN9GTAKyqw2wvO6TVHj4p1J0=;
 b=/TJ7cmk/FJQ068DNpf4DiXwjXvvwoHB4aCxNMSQYG6EENJ8OeIgY6tdoB42SC3CMHcHCkab6t
 jV41lYN5NIMDd1hg6qfVsToAjyXPFWfjTvYN1hMN4ZZhRrwWD05AFKq
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The IPA IMEM slice addresses/sizes are hardcoded in the driver. That's
mucho no bueno, especially since the same versions of IPA are used
across a number of vastly different platforms, which invalidates that
approach completely.

This series wires up the IMEM slices in DT on almost all platforms
(need some more time for SDX55/65) and fills in the necessary bindings
holes.

Tested on SC7280 only, FWIW.

Patches 1-3 are good to go instantly, the rest must wait for the
bindings changes that were submitted in the series marked as a
dependency.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (10):
      dt-bindings: sram: qcom,imem: Add a number of missing compatibles
      arm64: dts: qcom: sdm845: Expand IMEM region
      arm64: dts: qcom: sc7180: Expand IMEM region
      arm64: dts: qcom: sc7180: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sc7280: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sdm845: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sm6350: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sm8350: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sm8550: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sm8650: Explicitly describe the IPA IMEM slice

 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 13 +++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi                  | 16 +++++++++++-----
 arch/arm64/boot/dts/qcom/sc7280.dtsi                  |  6 ++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi                  | 16 +++++++++++-----
 arch/arm64/boot/dts/qcom/sm6350.dtsi                  | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi                  | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi                  | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi                  | 16 ++++++++++++++++
 8 files changed, 105 insertions(+), 10 deletions(-)
---
base-commit: 6add743d2854d744c3037235b87c1c9d164fd132
change-id: 20250523-topic-ipa_mem_dts-58f5d73a1f21
prerequisite-message-id: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
prerequisite-patch-id: f6aa0c354d434ec11dd88b93528c05cb3a45bb07
prerequisite-patch-id: 89f72ef0c3d3f29753b0cb9e290a4036ba380cc1
prerequisite-patch-id: 330c94ac7c2b42dd86c5f763b133f0d2598fda40

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


