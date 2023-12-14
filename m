Return-Path: <linux-arm-msm+bounces-4637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 934B981259E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 03:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5CCF1C21693
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 02:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9109A1113;
	Thu, 14 Dec 2023 02:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UU6LexRa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B9CA59;
	Thu, 14 Dec 2023 02:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF2A0C433C8;
	Thu, 14 Dec 2023 02:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702522753;
	bh=Ke3Hfe/ljNKuZm1h7cmur868QzI0qQ9j6+vgudXVa3g=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UU6LexRaKVLqZ5X6ZBbjpNFaJ/XlO7guAsGpktg7UvesDoHGD/EtjWmEG0r/ob2j6
	 PqyFWV6vc0mzk/Gc7BDbVr1M6EEKfRhXA070X3DESZqGFUiWUY9H3M/x12eDnS04Eh
	 3ER7Mfe15tSyj9RWkXdsU743Sw6ol95IpKmTiaME5/OGno1l/8oQ7JAB0NQ0bny7xR
	 gD8SQpTZ6aCvdDzqBpJOsEm7qhmJMTkiowBNB7qMm3VA6T9Xx/GB7BEolb4cnuUEZ/
	 6on2HviaxtXt2Y9ytDmXDDHF21PBzZclCfg5o9GU0nAMjJJhGtPgLy52Wl4MrSspQR
	 m/eXoo/w/MPhg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD02C4332F;
	Thu, 14 Dec 2023 02:59:13 +0000 (UTC)
From: Fenglin Wu via B4 Relay <devnull+quic_fenglinw.quicinc.com@kernel.org>
Subject: [PATCH v2 0/5] Add pm8010 RPMH regulators for sm8550 boards
Date: Thu, 14 Dec 2023 10:59:10 +0800
Message-Id: <20231214-pm8010-regulator-v2-0-82131df6b97b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH9vemUC/2WNSw6CQBBEr0J67ZjuAQK68h6GBbQNdCIfZ4Roy
 Nzdkbhz+SpVrzbw4lQ8nJMNnKzqdRoj2EMC3NdjJ0ZvkcGiTclibuahRELjpFvu9XNyBtOs5IZ
 OWBY1xNnspNXXrrxWkXv1sfbeH1b6pj8Z0b9sJYMmL0gwb5tMmC+PRVlHPvI0QBVC+ADKJw6zs
 gAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702522752; l=1307;
 i=quic_fenglinw@quicinc.com; s=20230725; h=from:subject:message-id;
 bh=Ke3Hfe/ljNKuZm1h7cmur868QzI0qQ9j6+vgudXVa3g=;
 b=5EIvBK0008mKfFkqIlHkM9+7i4Yw6lKkrWQ8+ty7d8AIKFEV2zL6xkfIfF5udccUINlvJC3pf
 30F4q5n3TzQD+/w8fkr1WZS8wQEsq9qEMXn5uyoiZpGeL/fTHhq6Mv7
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
Changes in v2:
- Updated subject prefix in the dt-binding commit and fixed the typo.
- Separate the DTS commit with board name prefixes.
- Link to v1: https://lore.kernel.org/r/20231211-pm8010-regulator-v1-0-571e05fb4ecc@quicinc.com

---
Fenglin Wu (5):
      regulator: qcom-rpmh: extend to support multiple linear voltage ranges
      regulator: dt-bindings: qcom,rpmh: add compatible for pm8010
      regulator: qcom-rpmh: add support for pm8010 regulators
      arm64: dts: qcom: sm8550-mtp: Add pm8010 regulators
      arm64: dts: qcom: sm8550-qrd: add PM8010 regulators

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


