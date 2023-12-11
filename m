Return-Path: <linux-arm-msm+bounces-4137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9614C80BFC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 04:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AB091F20F43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 03:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796E51640D;
	Mon, 11 Dec 2023 03:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kjo3TH6h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E5315AF7;
	Mon, 11 Dec 2023 03:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA229C433C7;
	Mon, 11 Dec 2023 03:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702264626;
	bh=vZ6FAmeEuhuEnQfZxh3RBh9KdTxrTAeJpbw4mAMqY4Q=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=kjo3TH6hDFYhV6s9qjHD4dXiPk3ygO8EOmdfkVCbZXG1tEuzfi12Gh0TGZVlKRRsy
	 eDtpS9LkhV402Zq7ydrUUEukFOz/hH6jUJUQyMcuGFUzaAeb8XCFbnLGHLVqFUemT+
	 KNPcCv54PYBDsIaKpqCgNFLP2yO4Edgh90q+I40TPnrSHmgf70Da1qK8xXlgMoBSKG
	 AIVt5visiS6vs38/7tykqhpn2a855dftokVWb7qMvDmd3oyOvi3oc/W/5ECtDaXeQ7
	 XZOHrt04JWhMLp8TpWrkFm/wlBMWfXBwaxwuQ2JhOp6HNTL8I0hVUQ2jaRrE0HL66D
	 emB8w2QIJDw5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD034C4167B;
	Mon, 11 Dec 2023 03:17:06 +0000 (UTC)
From: Fenglin Wu via B4 Relay <devnull+quic_fenglinw.quicinc.com@kernel.org>
Subject: [PATCH 0/4] Add pm8010 RPMH regulators for sm8550 boards
Date: Mon, 11 Dec 2023 11:16:58 +0800
Message-Id: <20231211-pm8010-regulator-v1-0-571e05fb4ecc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACp/dmUC/x3MTQ5AMBBA4avIrDWZtkS5ilgUg0n8ZYpIxN01l
 t/ivQcCCVOAKnlA6OLA2xqh0wS6ya8jKe6jwaCx2mCu9sWhRiU0nrM/NlFoM9e1ukRXeIjZLjT
 w/S/r5n0/2fy0AWIAAAA=
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, quic_collinsd@quicinc.com, 
 quic_subbaram@quicinc.com, quic_jprakash@quicinc.com, 
 Fenglin Wu <quic_fenglinw@quicinc.com>
X-Mailer: b4 0.13-dev-83828
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702264624; l=1011;
 i=quic_fenglinw@quicinc.com; s=20230725; h=from:subject:message-id;
 bh=vZ6FAmeEuhuEnQfZxh3RBh9KdTxrTAeJpbw4mAMqY4Q=;
 b=HC3xI1nwGgSj0NizbiQXsnost3cz/SrXXU3YNnwjV1rMxvOW8SkP6NCPJJFouhI6iLqbVNGDg
 DDMW+jy+WhYCFVBpqdhJ5WlkRuCW6+pmPy3XZ2Xk6NMiLyfKa/Fdpfh
X-Developer-Key: i=quic_fenglinw@quicinc.com; a=ed25519;
 pk=hleIDz3Unk1zeiwwOnZUjoQVMMelRancDFXg927lNjI=
X-Endpoint-Received:
 by B4 Relay for quic_fenglinw@quicinc.com/20230725 with auth_id=68
X-Original-From: Fenglin Wu <quic_fenglinw@quicinc.com>
Reply-To: <quic_fenglinw@quicinc.com>

There are 2 PM8010 PMICs present in sm8550-mtp/sm8550-qrd boards and
each of them exposes 7 LDOs. Add RPMH regulator support for them.

Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
Fenglin Wu (4):
      regulator: qcom-rpmh: extend to support multiple linear voltage ranges
      regulator: qcom,rpmh: add compatible for pm8010 RPMH regultor
      regulator: qcom-rpmh: add support for pm8010 regulators
      arm64: dts: qcom: Add pm8010 regulators for sm8550 boards

 .../bindings/regulator/qcom,rpmh-regulator.yaml    |  14 ++
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            | 120 ++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            | 120 ++++++++++++++
 drivers/regulator/qcom-rpmh-regulator.c            | 177 ++++++++++++++++++---
 4 files changed, 405 insertions(+), 26 deletions(-)
---
base-commit: 753e4d5c433da57da75dd4c3e1aececc8e874a62
change-id: 20231205-pm8010-regulator-0348cb19087a

Best regards,
-- 
Fenglin Wu <quic_fenglinw@quicinc.com>


