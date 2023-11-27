Return-Path: <linux-arm-msm+bounces-2134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 221207FA618
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 17:20:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 542AC1C20ACD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 16:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF338364BB;
	Mon, 27 Nov 2023 16:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mky51Kq8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 708A5CE
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 08:20:12 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50aabfa1b75so6263871e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 08:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701102010; x=1701706810; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o7VqPtYpwoj+TW7Y8BWDK43UozTyH/qVC7KhQCmuFRM=;
        b=Mky51Kq8MRdApT6aAUPok70hZRlAm3e9oKN1Gr2h9qM1EiVQhyUQF0wKjt0L4l3qfI
         9MA+G83hqcUW1H6BEvqTzVHUxcnfcCYLL+jwEzzAyb1PZfooI77sBnwrUW904VQvnyFt
         z+4wTVk+vKXxCZiEvLwHilXIl21j9IlRp6GbmLptFQ/H0lPqn8sWmLMbWoU4ALUrjz0v
         EcbmqsYPSq9zAMbeXEEq7Eia5F3zmdt3wwemaT1mL80kv3cY4WDMeZl9GZ8eenTgDenu
         1bCEL/CHmoWbL+Afgsi2onVxjUx8JuCqp0o/wmRNNPL8dmbeL0CxHaaOTGOlWF0DQrLx
         q5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701102010; x=1701706810;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7VqPtYpwoj+TW7Y8BWDK43UozTyH/qVC7KhQCmuFRM=;
        b=AfoYMbyszCYko40EwmtoFgBEVbCCk38PHdDRaUsslDt5NLp5wlLUdWD/Ebu5YMNxaW
         OHle8bkKvA8cEjLLZwXWbpGtd5AfeGH2KZBJXGm9O+xjF90E1zhboU3mOFl7JbUZaOxp
         o+AnZ2/EqVaWij/72Zoa+UZca7/AEDkN9LxTjyerWC44RRKWAiPR3g7ZBwU8b3PT+LO/
         M5SbTwGFNhzSVtZU/Rqwb749kGN+BFDGCmJgKQF5W+gbwEylc3UFr8wmjMkfOGsyePh5
         UP5ll9cQE2RdSomluuA8k+9PVQcfEVsJuzEhMmol6ipghQ7eEY+8+51ZE9yV1CtkJA9q
         kVaQ==
X-Gm-Message-State: AOJu0Yz9Ok1aYIk2Hr4bbWO3vH2GBTgCLIHm8gm4B8Od7kfhEZhAq3ba
	sIPtzaqFGtM7MiIyw5NIKRlEwQ==
X-Google-Smtp-Source: AGHT+IHmgRxGBQwnhbTyFCMdrlJjPEqWPP9SdrVlRVuS7yeIr7kA+AYZlSRHNy1rJX25Nv8IL8B7dg==
X-Received: by 2002:a05:6512:3196:b0:50b:aa13:a761 with SMTP id i22-20020a056512319600b0050baa13a761mr5779827lfe.46.1701102010662;
        Mon, 27 Nov 2023 08:20:10 -0800 (PST)
Received: from [10.167.154.1] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709062acc00b009c3828fec06sm5734760eje.81.2023.11.27.08.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 08:20:10 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/6] SM8450 / SM8550 Adreno
Date: Mon, 27 Nov 2023 17:20:02 +0100
Message-Id: <20231127-topic-a7xx_dt-v1-0-a228b8122ebf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALLBZGUC/x2NUQqDMBAFryL77UKTCoJXKaWsyVMXJEqiJSDev
 Us/Z2CYiwqyotDQXJTx1aJbMnBtQ2GRNIM1GpN/+Kdzvudj2zWw9LV+4sETgM51HjEKWTNKAY9
 ZUlisSue6mtwzJq3/yet93z/OMxPedAAAAA==
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701102008; l=1189;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=/aCt/tpWduoy987CggdzKos+vz6oIxXcKvTXjXKLxJ8=;
 b=/fFdW2I4PegFvbTzHnoeeKoejhyDoNRfMyRHqa4iYNbe/GxP/qCjLCCo4xiLaXyEVTacKmf9c
 nJik6l90SFTAynj16yrttBu/TokmhuJ4L2xau17nJBJgUOOGLFeHYzE
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Following the merging of related bindings, driver and mesa changes, enable
the GPU on both of these platforms.

P1 for Will/iommu, rest for qcom

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (6):
      dt-bindings: arm-smmu: Document SM8[45]50 GPU SMMU
      arm64: dts: qcom: sm8450: Add GPU nodes
      arm64: dts: qcom: sm8550: Add GPU nodes
      arm64: dts: qcom: sm8550-qrd: Enable the A740 GPU
      arm64: dts: qcom: sm8550-mtp: Enable the A740 GPU
      arm64: dts: qcom: sm8450-hdk: Enable the A730 GPU

 .../devicetree/bindings/iommu/arm,smmu.yaml        |  48 ++++-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |   8 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 202 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |   8 +
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |   8 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 166 +++++++++++++++++
 6 files changed, 438 insertions(+), 2 deletions(-)
---
base-commit: 48bbaf8b793e0770798519f8ee1ea2908ff0943a
change-id: 20231127-topic-a7xx_dt-feee4142edda

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


