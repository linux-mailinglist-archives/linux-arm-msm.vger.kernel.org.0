Return-Path: <linux-arm-msm+bounces-1287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3457F2549
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 06:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 710C81C20B9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 05:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE50E18E31;
	Tue, 21 Nov 2023 05:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="KC8dflPl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A82ED;
	Mon, 20 Nov 2023 21:35:52 -0800 (PST)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4SZClW3TvRzDqLd;
	Tue, 21 Nov 2023 05:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1700544951; bh=3aQiV0yYrXDyWJC58/jNq5YnuykrHIOH2V9AQg50cT4=;
	h=From:Subject:Date:To:Cc:From;
	b=KC8dflPloQ1Alr9DQLWVy1CbZxB8aafRpVwbfFWCHLo0uy791qwwTjNEaXqGBiRKU
	 y7MFejJKdXSZMOMxYBnp92E/7o0ffxASEskeqasIazc8leW4TAxVIDv+J+lq1yk+r9
	 UMhV7Sl98XNMwhjXkBOP6r7qTjp/vpTO+0BCiHH4=
X-Riseup-User-ID: B606A694CE447639939588235BA6E43D296FDB1170058309B4A4D35D01B5EB12
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4SZClR6RkszFrxv;
	Tue, 21 Nov 2023 05:35:47 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Subject: [PATCH v2 0/4] Add PM8937 PMIC support
Date: Tue, 21 Nov 2023 12:34:58 +0700
Message-Id: <20231121-pm8937-v2-0-b0171ab62075@riseup.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJBXGUC/2WMQQ6CMBREr0L+2prfVkRYeQ/DAmGQv7A0LRIN6
 d2tbF1N3uTlbRQRBJGaYqOAVaLMLoM5FNRPnXtAyZCZDBurNZ+Vf15qWylmxsnYrirHO2XZB4z
 y3kO3NvMkcZnDZ++u+vf+JVatWKEv9VADee01SMTLHx0WalNKXwy+R5udAAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dang Huynh <danct12@riseup.net>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

PM8937 is a power management IC. It is used in various boards with
MSM8917, MSM8937, MSM8940 and APQ variants.

This patchset has been tested on Xiaomi Redmi 4X (MSM8940).

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
Changes in v2:
- Remove PATCH 3-6 as it has been picked up.
- Applied suggestions from reviewers.
- Add VDD, GND to VADC.
- Link to v1: https://lore.kernel.org/r/20231106-pm8937-v1-0-ec51d9eeec53@riseup.net

---
Dang Huynh (4):
      mfd: qcom-spmi-pmic: Add support for PM8937
      dt-bindings: mfd: qcom-spmi-pmic: Document PM8937 PMIC
      arm64: dts: qcom: Add PM8937 PMIC
      soc: qcom: socinfo: Add PM8937 Power IC

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   1 +
 arch/arm64/boot/dts/qcom/pm8937.dtsi               | 216 +++++++++++++++++++++
 drivers/mfd/qcom-spmi-pmic.c                       |   1 +
 drivers/soc/qcom/socinfo.c                         |   2 +-
 include/soc/qcom/qcom-spmi-pmic.h                  |   1 +
 5 files changed, 220 insertions(+), 1 deletion(-)
---
base-commit: 408a8e748eb5f10026ea9d87f8f218e759101c9a
change-id: 20231106-pm8937-000e423a75fb

Best regards,
-- 
Dang Huynh <danct12@riseup.net>


