Return-Path: <linux-arm-msm+bounces-84459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B56DCA7FEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 15:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9413C32EE162
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 12:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A18330312;
	Fri,  5 Dec 2025 12:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HAWxfKED"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14B331B81B;
	Fri,  5 Dec 2025 12:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764938855; cv=none; b=hCa9RLhDQeTumUTRIrsbBM+lTwNWQ7uZ50H9EmTWI4YcmdxV0X02DRjShul/h5Skttn0QB1pJXNGX2DF0Temfuz+i172+kbM/BQYUycm9Al/JHkXdDoTmIRs94cwsHQlCoUG4jpSkwavnF+1ZDG6bE0RfBDZMMQNnn4J8X2SWp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764938855; c=relaxed/simple;
	bh=8EgbZMEXFu7PLpsGK+9LxeqsxwDrPgQHGchH0MUjxdY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IAyNUp31QyOcl+WeTZ2w3NG3txE5vXYn3e2ZfxfQ9T1PWXjFFIEAiO8oWJhEzbSnNNK9vPqtwXvoDjNHB4wKO6PNKz03rHlZ4WpmZojMDzpXDQ2OaP/+hs4vSSXeUgeTqjlp/JWw+HdAnBZCow8cSEbm5MYPqPInLQCLOJLbwJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HAWxfKED; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF1CC4CEF1;
	Fri,  5 Dec 2025 12:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764938855;
	bh=8EgbZMEXFu7PLpsGK+9LxeqsxwDrPgQHGchH0MUjxdY=;
	h=From:Subject:Date:To:Cc:From;
	b=HAWxfKEDsM+Qvoow49KV/HYzmFJg7fFxE5IFtMzbf2f9BseWIOIUVM5GRLBBvYfzs
	 5hZaaysExcEBYbh0STRLGh2FjRS0wn2pp3aDKiHsM8OBop23c2VvvCt/lpcU1J+tOy
	 EB8ZoP4/p8Wh0UennYBNBOLGLAdtR5bvloGMULXtbpfNLPKPPIwv1LJUDuYV1SZ9zt
	 0T5g1LakPs+luATft0s3q7k3rl29N7dpyLNlsH0TVYtpjdqruKniHfU0heQw659vgX
	 rDO1PUeAae/Ba73WhOwfetiLO+jdA/O9bKDk8iYCqeryxENsSZp+KWuZBEJrQckQ/n
	 uewWXCn9OYP8Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 00/10] Fix up WCN6855 RFA power supply name
Date: Fri, 05 Dec 2025 13:47:19 +0100
Message-Id: <20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFjUMmkC/y2NQQ6DIBAAv2I4dxvE0qqn/qMxBmGrmygooG1i/
 HuN9jhzmFlZQE8YWJmszONCgZzdIb0kTHfKtghkdmaCC5lywSG6kTR8tL3nUtbjMNcmNoZsG6A
 QJr9lMhcaM7YHRo9v+h7xV3Wyx2neH/GUbMAQ1PEok/+hABOhIXsmJ+0GaPoZo3Oxg0UAB2PyB
 y8kT1Glz56s8u7qfMuqbfsBl78b6s8AAAA=
X-Change-ID: 20251020-topic-wcn6855_pmu_dtbdings-92d843582ce3
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764938851; l=3325;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=8EgbZMEXFu7PLpsGK+9LxeqsxwDrPgQHGchH0MUjxdY=;
 b=MJNpzGJnS6TmltZTFSMvPQZefThCv2IEbmBz7nVF64z/NIYOlFFCc2T9rP4Sx7HXblcSr/uNa
 Lwoq8tWZ4k6DJ38LKGrEGHLuGvcwa5zWIVy/Gg7+nY2N8M8+Au0bEGW
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Commit 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description
closer to reality for wcn6855") renamed the supply representing the
VDD17_PMU_RFA leg to mention "1p8" instead.

While the supply's voltage is normally 1.8 V, the bindings should
reflect the actual naming of the pin. Moreover, almost all DTs define
the output as 1p7, so that ends up looking a little odd..

Ultimately, this is a "fake" regulator that is consumed for the sake
of DT sanity and this series is meant to bring uniformity and squash
checker errors.

The last patch fixes up a less-trivial warning.
sc8280xp-microsoft-arcata is left out because I don't know whether the
mounting of the chip is on-board or as an M.2-y card (although I would
guesstimate the prior).

Depends on the long-ready-for-the-merge series by Krzysztof (per-chip
bindings split of qualcomm-bluetooth.yaml), mentioned below

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (10):
      dt-bindings: net: bluetooth: qualcomm: Fix WCN6855 regulator names
      arm64: dts: qcom: qcs615-ride: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-crd: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-gaokun3: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-x13s: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-blackrock: Fix BT RFA supply name
      arm64: dts: qcom: sm8450-hdk: Fix BT RFA supply name
      arm64: dts: qcom: x1-omnibook-x14: Fix BT RFA supply name
      arm64: dts: qcom: x1-zenbook-a14: Fix BT RFA supply name
      arm64: dts: qcom: lemans-ride-common: Fix up WCN power grid

 .../bindings/net/bluetooth/qcom,wcn6855-bt.yaml    |  7 ++---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   | 32 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  2 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  2 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |  2 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  2 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |  2 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |  2 +-
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |  2 +-
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi   |  2 +-
 10 files changed, 42 insertions(+), 13 deletions(-)
---
base-commit: 273ff909549f26994285d18a1cd64240fb4b1bcd
change-id: 20251020-topic-wcn6855_pmu_dtbdings-92d843582ce3
prerequisite-message-id: 20251029-dt-bindings-qcom-bluetooth-v2-0-dd8709501ea1@linaro.org
prerequisite-patch-id: 94fd78eaa971a5c3585eabbd21ccc05fb60c8904
prerequisite-patch-id: 2968d14edc5f5dacf235b4ef32037a9ce9e58239
prerequisite-patch-id: 1daa41f8558029206cc94670586243629c53cec5
prerequisite-patch-id: 6adfe843aad05ad4e2e0f44f98520c4c19c0ca2b
prerequisite-patch-id: 4a2980108d9a07403483c41fc7ce1ac7ca0e4f98
prerequisite-patch-id: 5102d8402848e79fe5c63c0ecd54371851cccb9a
prerequisite-patch-id: 98ecb5c776956077591e261ef7483b826cc09037
prerequisite-patch-id: 4bbe8f1d81fec797c060c9c0c9ba09e1322a881a
prerequisite-patch-id: f7b59700b4d3e2270b6e9bcfc798468b630c730a
prerequisite-patch-id: eaafe809885578a46cc78b086b53aa3abe03710c
prerequisite-patch-id: c069f2734d3fd0007ccfa84662d35ade1645d199

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


