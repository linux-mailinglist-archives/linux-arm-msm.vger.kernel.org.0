Return-Path: <linux-arm-msm+bounces-18140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 876E38AC70A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 10:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15F9A1F21390
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 08:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCE64E1D2;
	Mon, 22 Apr 2024 08:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IiIurC/a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BE0433CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 08:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713774798; cv=none; b=CiPhC10W0xwCim4q08dXiOP9AmH0mdBRv0LXfss+5pUCSNzl3e3pQqI5S9qktpEZxb1yDrzbvxvD7Bwg8fdTpVsaFlmcGwKCQoP9HsWRS50n7bUvqnGQUOsT1gDFMxigSXstJ5QFvI7XYgxvdrBdDXbBUULz3TvD6pglP/jaCW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713774798; c=relaxed/simple;
	bh=UbFJgQU2qZOrRgk97gfISoGbK/XP23Wbw4WNjZjItEM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E61dnZl+kuqd6nEl+PJvtML9Fcz1lFVkk0MJQKleMR0x7eJu2VPeQriERFNTLRx1WcemoTsPnrPpLn4BggKO1WcEFvsCIVGScI1Oz+Q+FuXc9l+Zxyi4x7qhpXnz4hvsIpNPLCGN50iKkmrP6NbLOqrqFx5hClPAcqMfMOj+QHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IiIurC/a; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41a523e27e0so4868075e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 01:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713774795; x=1714379595; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zhqz8iV7iQBshGwv7QxAtvIsaIHzswkWq5uKt9n8NGQ=;
        b=IiIurC/aeYJOY9ue4M2h/o1KYtls6Oi7uV94VHzWZyqMe7KMW1F7xKjBP72i7sh0wZ
         W7iAJ3hxVH8wUNE3qboD84VeqvjCO2qH78mPASDJGzmss0Vdc35IF4PukEMCCA7LPKG8
         2Qf7TiRvh7hMobSmgrtpPg66PKpjgJxHJhl+jEl6NSfPyWZn4jzFhbcWbCwe3bwxSozv
         Z+RlwS7z0aep4iRefqgKYqIWsEXarWHicf57Duo1QX/zM6MFssoA/696PJk6niBN15nN
         OqpxbrTu2NFtk3JcpTqOHZ3XyGNPZ6pa2e71wM0j83SWjnaXz3E8ni6eaUax7kmpnpe9
         2SUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713774795; x=1714379595;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhqz8iV7iQBshGwv7QxAtvIsaIHzswkWq5uKt9n8NGQ=;
        b=vSk2K0nfjHTQF9db7T+tR4+HKaNbfsBWVxyPIsqJL2Z53EfXzoAxnqQCD7BEx7HVDb
         nyV85DOW9j2pTwiU4/27qhty1LG/cGy/vIA4cm+uj262gOrDk3YW2f0Ar4b4DMC7s0ma
         YooHbsd4VAJVIgDMCe6pZ4hWwyEftAhmtLSSvq8lU0zaSTB4fmjTEcmed3qunzer4nnt
         y03Ds3Lhy6rmeQsoTMXVWzxz3EGlqykxbvvqV5+QSzilprD9aqsdFNqkgQV9ypdFK2Zo
         ElJcs9KaC/d0qKgiHUwds+yaJXQS/zrXo6NHcZKo2Becnio4ZGgg98yqq5t2DIuBCJCI
         bFNQ==
X-Gm-Message-State: AOJu0YwbPLMiBZ0oe8JvoFjs01p28EmXCRGcNo1RwXT5r5bwGQ7wIFHF
	gahlsd/qj3ZB11cZ2udWRVfNqfUzuchVZvKmX8JSLXMiSiMP9j5TLak6+/TIDOM=
X-Google-Smtp-Source: AGHT+IFMTRg9qm+Ou5HmwacBkzUGNdJQlfVnXqZC+7X9JtVSMgv2ZxIYPlOyv+hPTjCy5Tc+xzqmGA==
X-Received: by 2002:a05:600c:4510:b0:418:f8c2:c3bc with SMTP id t16-20020a05600c451000b00418f8c2c3bcmr9259046wmo.33.1713774794597;
        Mon, 22 Apr 2024 01:33:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c1c1300b004161bffa48csm15978786wms.40.2024.04.22.01.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 01:33:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/3] arm64: qcom-sm8[456]50: properly describe the PCIe
 Gen4x2 PHY AUX clock
Date: Mon, 22 Apr 2024 10:33:10 +0200
Message-Id: <20240422-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v3-0-799475a27cce@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMYgJmYC/53NSw6CMBSF4a2Yjr2mD56O3IdxUNsCNwJtWiAQw
 t4tjHSow3MG37+SYDyaQK6nlXgzYUDbxyHOJ6Ia2dcGUMdNOOUJFayEwTpUELpiTimMLgzeyA6
 cQgMMXLOAHGdQ7QuSp0hZVuY015pEznlT4Xyk7o+4GwyD9ctRntj+/hGZGFAoeaZzmSilC3prs
 ZfeXqyvyV6Z+IfM+Q8yj7Iwisoyy3TKqy9527Y30W+ztzsBAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2399;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UbFJgQU2qZOrRgk97gfISoGbK/XP23Wbw4WNjZjItEM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmJiDIgtDRLmZg5sOyOQgwQ/JLYNzENSguud02N0gN
 XfnHc/qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZiYgyAAKCRB33NvayMhJ0bnTEA
 CrI69rE42cc/xIuuyREhF6Ecr3OB4uL5SvpyRnvCt++do9r1hAvx9IPSWHAx7ZPdXbur8I9jqo49+f
 xC7/CCU72224UoO5a4LOcOvJMVVZxtHXjSdJR+ku+k6tYQ0Qc2X7f/2EXn8hF3rJtnu4L7E8tnABCU
 ex3AA6P2jUqiogD7jWA5QOIQr5/rP4vfAY79w+NQnKQQ2/Asuv0v3TYb8aBLIj7YzSrQM/pE2Ykt7z
 kWtzv7PCzm6m/aS5+JxsxFav7BmDXMAiF3wWgOO4m52jgyW8/GjxAk6xlWru93l4blvtvnbw2/iAnv
 eRmPfILjgJ0Om4RKYaknQcfpZrBnqNrB/6VDqX0qzTSGQao+wG9btzZqotTCmhMmuOHXW646Z/UlQL
 CkEFDUgnz7A5iB2/mW9pP0x7/zjX9HwNJd5uzs6A1jmssAA2yHfn3T7d59MAyIUXtcbZkuxJSlfcHW
 sE+gpWIWJ9HiFot7gUqQ2kF5ch4YjXqhx25nKBMAOEsmr0J8oxSG8ChfOSY4W6x597QcUzRKCn+B1b
 Pw+izM/zWsKS3HLvUF/YKCKBk3Ahf/PamCssOZi3/prvCeYQFuKfCr4aq8Me2h+AcNpNIZwOqurmbu
 84IhF8H2IyFlqiV8J0gI0FcN0Jn5L7TbWzuS/b8sbkqQ3AY/aTdDC5IrcBhQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The PCIe Gen4x2 PHY found in the SM8[456]50 SoCs have a second clock named
"PHY_AUX_CLK" which is an input of the Global Clock Controller (GCC) which
is muxed & gated then returned to the PHY as an input.

Document the clock IDs to select the PIPE clock or the AUX clock,
also enforce a second clock-output-names and a #clock-cells value of 1
for the PCIe Gen4x2 PHY found in the SM8[456]50 SoCs.

The PHY driver needs a light refactoring to support a second clock,
and finally the DT is changed to connect the PHY second clock to the
corresponding GCC input then drop the dummy fixed rate clock.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Rebased on linux-next, applies now cleanly
- Link to v2: https://lore.kernel.org/r/20240322-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v2-0-3ec0a966d52f@linaro.org

Changes in v2:
- Collected review tags
- Switched back to of_clk_add_hw_provider/devm_add_action_or_reset to maintain compatibility
- Tried to use generic of_clk_hw_onecell_get() but it requires to much boilerplate code
  and would still need a local qmp_pcie_clk_hw_get() to support the current #clock-cells=0
  when exposing 2 clocks, so it's simpler to just return the clocks in qmp_pcie_clk_hw_get()
- Link to v1: https://lore.kernel.org/r/20240319-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v1-0-926d7a4ccd80@linaro.org

---
Neil Armstrong (3):
      arm64: dts: qcom: sm8450: remove pcie-1-phy-aux-clk and add pcie1_phy pcie1_phy_aux_clk
      arm64: dts: qcom: sm8550: remove pcie-1-phy-aux-clk and add pcie1_phy pcie1_phy_aux_clk
      arm64: dts: qcom: sm8650: remove pcie-1-phy-aux-clk and add pcie1_phy pcie1_phy_aux_clk

 arch/arm64/boot/dts/qcom/sm8450.dtsi    |  8 ++++----
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts |  4 ----
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts |  4 ----
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts |  8 --------
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 13 ++++---------
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts |  4 ----
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts |  4 ----
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 13 ++++---------
 8 files changed, 12 insertions(+), 46 deletions(-)
---
base-commit: f529a6d274b3b8c75899e949649d231298f30a32
change-id: 20240319-topic-sm8x50-upstream-pcie-1-phy-aux-clk-4b35169707dd

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


