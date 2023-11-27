Return-Path: <linux-arm-msm+bounces-2129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 537B27FA53C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 16:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DD2C28175F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 15:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10862E406;
	Mon, 27 Nov 2023 15:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C0vWTb6r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB6BB10DA
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 07:52:31 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-507a0907896so5711356e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 07:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701100349; x=1701705149; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Qt5tTZHEEzddg6Ssj7r37p+bACPrFj0HogZyj70Blc=;
        b=C0vWTb6rGN+nwhvM8X4GZOdTxM9kSuWMPjJTrZVyrKmCPAFRsZcMA/F/CohWqyP2xo
         TEPDBH+73DMgyqJH6FDf13q+jy0XVDiO6xs+Jo+29jY2r7TmftqsCX6alyxk7VpbiaCD
         EXcEM8rD4ItlHYGGZzrZy74xyfXTsFhskM3zzHV9JOmQV14mr/qQQqojXOLJXG+vTLK9
         3uX0EY0TCUbUC4VOIBruNd230n0LgU68m6GyR08N2yq/T180L7cpTVPIObogKQOuoUbS
         SoUd2NMwT6x4gOEp74k7zQg7zpHyhFO3hJZKx7bgiTpLNtFepIecjODSHFMAs03igIVD
         NpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701100349; x=1701705149;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Qt5tTZHEEzddg6Ssj7r37p+bACPrFj0HogZyj70Blc=;
        b=t1oZH3mr9KZwhyVZRTxHdG90mRpBmnhqq67KH0XnabIwHqFen4BikHDLGA4uMhbcWw
         P5H7rziBarj4HByjLm95Tr4HeGHbKprKb5gpQKAw9KgR3t0dxStJ9kZGNcB2wA0qGOxi
         iJ909o7hD6+tUccJaeceh41NPFTM3SatljMaOwDdKCrIwAmqYla0Uj5+Pw52cuIU8bs9
         sqwHem8y0FwyzefZeszrGbz8BF1r6NBq5/q5o8Or1eGsk6lmeOm8ZaWc76CfLCGQSp7v
         SA4D37H0mZYf+9byBhHh81w1lFYQ7N7wB/GaZKPCU0pUQq8jYI/Vsjpek7X05/+WAUau
         VIIw==
X-Gm-Message-State: AOJu0Yxkf0BJzYuD19Cf5pT05xIyC45jVHk3gQkkHKYvAUQX0N2+JMLP
	WFgHFGry3N1bF8Z02DVqJ9ztuZXxVplZgC4vG1A=
X-Google-Smtp-Source: AGHT+IEKpRFaESt4gZvElSt1l0ne4fGi8XPGy+WkqgJ128EQh8YsvW3WHrm+Q+ZuH8OVSRdawRxsRA==
X-Received: by 2002:ac2:42c4:0:b0:507:a70e:c619 with SMTP id n4-20020ac242c4000000b00507a70ec619mr4364196lfl.67.1701100349416;
        Mon, 27 Nov 2023 07:52:29 -0800 (PST)
Received: from [10.167.154.1] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id mb22-20020a170906eb1600b009fc0c42098csm5855150ejb.173.2023.11.27.07.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 07:52:29 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v7 0/2] Resolve MPM register space situation
Date: Mon, 27 Nov 2023 16:52:11 +0100
Message-Id: <20230328-topic-msgram_mpm-v7-0-6ee2bfeaac2c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACu7ZGUC/4XQy2rEMAwF0F8ZvK6LIz8zq/5HGYrtKIkhL+yZ0
 DLk36vMrgSa5RXoXKEnK5gTFna9PFnGNZU0TxTs24XF3k8d8tRQZiBACgmO3+clRT6WLvvxa1x
 GHo1zAWWIUCtGa8EX5CH7Kfa0OD2GgYZLxjZ9v3o+b5T7VO5z/nnVrtU+/adhrbjgVbDOed1qL
 +XHkCaf5/c5d2zXVjgTgAQE5ZVDbVvRHAR5JkgSIFpowQZlhTkI6kxQJASP0kETRVvDQdBngib
 BoDBAr6hN0AfBnAlmFxygcloHi39v2LbtF7C2wB8QAgAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Shawn Guo <shawn.guo@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701100347; l=2818;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=jzGaK78zqBfidrnl46fLd36+PZ3YDc+jJgsIYSdRn9o=;
 b=xjIuKG6/Sr8LMdWtOOOHLmJy45SGvaDnQbAUVFhGFvFL98TkHNzpXEQaONwXO3JJvs82pw42m
 uPRG2NFAyjIDzXSjZ5MH6KGM9lFIXS0cXYN+dNQAho+K9ocK0pMHz1h
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

v6 -> v7:
- Actually check the rvalue of of_address_to_resource
- Pick up rb
- Link to v6: https://lore.kernel.org/r/20230328-topic-msgram_mpm-v6-0-682e4855b7e2@linaro.org

v5 -> v6:
- Resending due to no responses.
- Change of base to next-20231124 (no changes to the patch)

Link to v5: https://lore.kernel.org/r/20230328-topic-msgram_mpm-v5-0-6e06278896b5@linaro.org

v4 -> v5:
- Pick up tags
- Rebase on Rob's of_ header untanglement

Link to v4: https://lore.kernel.org/r/20230328-topic-msgram_mpm-v4-0-bae382dc0f92@linaro.org

v3 -> v4:
- Fix up indentation in the bindings patch
- Add an example glink-edge subnode to remoteproc-rpm (its bindings
  require that..)

Link to v3: https://lore.kernel.org/r/20230328-topic-msgram_mpm-v3-0-2c72f27b4706@linaro.org

v2 -> v3:
- Fix the example
- Pick up tags
- remove the outdated example from the cover letter, check bindings
  should you want to see one

The bindings for the wrapper node used in the yaml example are merged
in qcom/for-next

Link to v2: https://lore.kernel.org/r/20230328-topic-msgram_mpm-v2-0-e24a48e57f0d@linaro.org

v1 -> v2:
- deprecate 'reg', make qcom,rpm-msg-ram required [1/2]
- Use devm_ioremap() [2/2]

Link to v1: https://lore.kernel.org/r/20230328-topic-msgram_mpm-v1-0-1b788a5f5a33@linaro.org

Depends on resolution of https://github.com/devicetree-org/dt-schema/issues/104

The MPM (and some other things, irrelevant to this patchset) resides
(as far as the ARM cores are concerned, anyway) in a MMIO-mapped region
that's a portion of the RPM (low-power management core)'s RAM, known
as the RPM Message RAM. Representing this relation in the Device Tree
creates some challenges, as one would either have to treat a memory
region as a bus, map nodes in a way such that their reg-s would be
overlapping, or supply the nodes with a slice of that region.

This series implements the third option, by adding a qcom,rpm-msg-ram
property, which has been used for some drivers poking into this region
before. Bindings ABI compatibility is preserved through keeping the
"normal" (a.k.a read the reg property and map that region) way of
passing the register space.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      dt-bindings: interrupt-controller: mpm: Pass MSG RAM slice through phandle
      irqchip: irq-qcom-mpm: Support passing a slice of SRAM as reg space

 .../bindings/interrupt-controller/qcom,mpm.yaml    | 52 +++++++++++++++-------
 drivers/irqchip/irq-qcom-mpm.c                     | 26 +++++++++--
 2 files changed, 58 insertions(+), 20 deletions(-)
---
base-commit: 48bbaf8b793e0770798519f8ee1ea2908ff0943a
change-id: 20230328-topic-msgram_mpm-c688be3bc294

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


