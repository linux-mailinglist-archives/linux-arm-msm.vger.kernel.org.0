Return-Path: <linux-arm-msm+bounces-2563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E29837FDFCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 19:59:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97FF6282408
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 18:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0621C5C90A;
	Wed, 29 Nov 2023 18:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k4IiNEn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90423D66
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 10:59:30 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a178e82a445so12839166b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 10:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701284369; x=1701889169; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vsI99ecXHRz84fsVe8hSaMQPiq7Y/hJuWjZjA6i1Dmk=;
        b=k4IiNEn2nl61fF2hykPScNCDDExgaV+3ZqwgRCcoXl28keuYnL7BboFaAtjhoeuRpC
         VvNjT5M65dEGHOeQ7juygKMYWVp8M42C/KNhkwsi76iznhnMhI1hMTcx+whBQ/Ku6W+E
         rS0WVmr/BSDCGFLzy22J8BmKrkfBXGSzLFxDIzSM+YOr/EVkmr5Njt+27zFkASEU0LpM
         YRgXjsWbdnLJ6R8ukJGPqU4hMkHJOx6cCyBuKOV+syUeVEWGDK/RNh/m5C8xDou/upPL
         5AFOG9JWil26S9/zOieudsXWKzXXXFnjZhimqnFwDCwpmC7iQmnUK4wCc+9Dgdj0YiwB
         jMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701284369; x=1701889169;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsI99ecXHRz84fsVe8hSaMQPiq7Y/hJuWjZjA6i1Dmk=;
        b=YbJjGrLt5WjqzgYQg/O/bdER/vFmuRxZZR4SYxE4ef1gBQr2a5jlBHlkKmm2kuVHNw
         HrW5JisjWTkPczLcNFQGTBBuZo+15ctc0WfHBwP6ielg5xl3Z6+3Pvs8MdWcaz8l7Uor
         4gaPBbidsF9K7BwkX2X2FTosoQx+F1hgPwAce3Hsm6Bjt32O1e9IYnt4yxfba3qBeci6
         SM5fJeh4u4dIA8ryr/egYnyYotb/k97tdQXl35w3bEnNW74g9fSyV0WEIRU7/iTuTHCI
         cHNPoR1lWt/3vUI7uxj3x7wBZYLe1JfmIQCJwPcILZDkMmxX6/VuR4wXlTU6HGOiK3hH
         D1pQ==
X-Gm-Message-State: AOJu0YyggL1IbWt7RncHOsJ4HFvnTMttmDU84fOgnzLOPtxegzyIwK9J
	k4BMcpb+LNob+oK1myzkW/QCoA==
X-Google-Smtp-Source: AGHT+IHgKQzzFE6Gq7BQYvqVnIvX+jn1I+tmXBQZFM53x0CFmHr9LEGEtrSk+Mh7nHHRgrzW8mW+Wg==
X-Received: by 2002:a17:906:7158:b0:a03:9dfb:5298 with SMTP id z24-20020a170906715800b00a039dfb5298mr15067152ejj.57.1701284369007;
        Wed, 29 Nov 2023 10:59:29 -0800 (PST)
Received: from [10.167.154.1] (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id o11-20020a1709061d4b00b009faca59cf38sm8160232ejh.182.2023.11.29.10.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 10:59:28 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 00/15] Unregister critical branch clocks + some RPM
Date: Wed, 29 Nov 2023 19:59:19 +0100
Message-Id: <20230717-topic-branch_aon_cleanup-v2-0-2a583460ef26@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAeKZ2UC/42NUQqDMBBEryL5boqJ4rb98h5FJMZVF8JGEpUW8
 e5NpQfo5xtm5u0iYiCM4pHtIuBGkTwn0JdM2MnwiJL6xELnushBgVz8TFZ2wbCdWuO5tQ4Nr7O
 s7lBZVQwIyoo070zEXy8d8OpcCueAA71O37NJPFFcfHif+k190z9Mm5K51AC3stdgyqGsHbEJ/
 urDKJrjOD5skpCS1gAAAA==
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701284367; l=4352;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=QrM8NHf2bwFSqzVto0GHuPAD5mmj8MB7jsYyxnzDMrg=;
 b=Vugt+4kY+A9z/YibseEQkr4cfRVz8EWijSBPnX/WbVYEvcGJu0Nnsn2gdUDlQfZ1OKWg6IHMC
 439bEpq253ND4DAH6Sad4memZZXvEimurAMjQ+FbnNgwkaoRjycKXdc
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

On Qualcomm SoCs, certain branch clocks either need to be always-on, or
should be if you're interested in touching some part of the hardware.

Using CLK_IS_CRITICAL for this purpose sounds like a genius idea,
however that messes with the runtime pm handling - if a clock is
marked as such, the clock controller device will never enter the
"suspended" state, leaving the associated resources online, which in
turn breaks SoC-wide suspend.

This series aims to solve that on a couple SoCs that I could test the
changes on and it sprinkles some runtime pm enablement atop these drivers.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Rebase
- Pick up tags
- Fix up missing pm_runtime_put in SM6375 GCC (Johan)
- Clarify the commit message of "Add runtime PM" commits (Johan)
- "GPU_CCC" -> "GPU_CC" (oops)
- Rebase atop next-20231129
  - Also fix up camcc-sm8550 & gcc-sm4450
  - Unify and clean up the comment style
  - Fix missing comments in gcc-sc7180..
  - Drop Johan's ack from "clk: qcom: Use qcom_branch_set_clk_en()"
- Improve 6115 dt patch commit message (Bjorn)
- Link to v1: https://lore.kernel.org/r/20230717-topic-branch_aon_cleanup-v1-0-27784d27a4f4@linaro.org

---
Konrad Dybcio (15):
      clk: qcom: branch: Add a helper for setting the enable bit
      clk: qcom: Use qcom_branch_set_clk_en()
      clk: qcom: gcc-sm6375: Unregister critical clocks
      clk: qcom: gcc-sm6375: Add runtime PM
      clk: qcom: gpucc-sm6375: Unregister critical clocks
      clk: qcom: gpucc-sm6115: Unregister critical clocks
      clk: qcom: gpucc-sm6115: Add runtime PM
      clk: qcom: gcc-sm6115: Unregister critical clocks
      clk: qcom: gcc-sm6115: Add runtime PM
      clk: qcom: gcc-qcm2290: Unregister critical clocks
      clk: qcom: gcc-qcm2290: Add runtime PM
      arm64: dts: qcom: sm6375: Add VDD_CX to GCC
      arm64: dts: qcom: qcm2290: Add VDD_CX to GCC
      arm64: dts: qcom: sm6115: Add VDD_CX to GCC
      arm64: dts: qcom: sm6115: Add VDD_CX to GPU_CC

 arch/arm64/boot/dts/qcom/qcm2290.dtsi |   1 +
 arch/arm64/boot/dts/qcom/sm6115.dtsi  |   3 +
 arch/arm64/boot/dts/qcom/sm6375.dtsi  |   1 +
 drivers/clk/qcom/camcc-sm8550.c       |   9 +--
 drivers/clk/qcom/clk-branch.h         |   7 ++
 drivers/clk/qcom/dispcc-qcm2290.c     |   3 +-
 drivers/clk/qcom/dispcc-sc7280.c      |   6 +-
 drivers/clk/qcom/dispcc-sc8280xp.c    |   3 +-
 drivers/clk/qcom/dispcc-sm6115.c      |   3 +-
 drivers/clk/qcom/dispcc-sm8250.c      |   3 +-
 drivers/clk/qcom/dispcc-sm8450.c      |   6 +-
 drivers/clk/qcom/dispcc-sm8550.c      |   6 +-
 drivers/clk/qcom/gcc-qcm2290.c        | 127 ++++++-----------------------
 drivers/clk/qcom/gcc-sa8775p.c        |  24 +++---
 drivers/clk/qcom/gcc-sc7180.c         |  21 ++---
 drivers/clk/qcom/gcc-sc7280.c         |  19 ++---
 drivers/clk/qcom/gcc-sc8180x.c        |  27 +++----
 drivers/clk/qcom/gcc-sc8280xp.c       |  24 +++---
 drivers/clk/qcom/gcc-sdx55.c          |  11 +--
 drivers/clk/qcom/gcc-sdx65.c          |  12 +--
 drivers/clk/qcom/gcc-sdx75.c          |   9 +--
 drivers/clk/qcom/gcc-sm4450.c         |  27 ++-----
 drivers/clk/qcom/gcc-sm6115.c         | 145 +++++++---------------------------
 drivers/clk/qcom/gcc-sm6375.c         | 126 +++++++----------------------
 drivers/clk/qcom/gcc-sm7150.c         |  22 ++----
 drivers/clk/qcom/gcc-sm8250.c         |  18 ++---
 drivers/clk/qcom/gcc-sm8350.c         |  19 ++---
 drivers/clk/qcom/gcc-sm8450.c         |  20 ++---
 drivers/clk/qcom/gcc-sm8550.c         |  20 ++---
 drivers/clk/qcom/gpucc-sc7280.c       |   8 +-
 drivers/clk/qcom/gpucc-sc8280xp.c     |   8 +-
 drivers/clk/qcom/gpucc-sm6115.c       |  52 +++++-------
 drivers/clk/qcom/gpucc-sm6375.c       |  33 +-------
 drivers/clk/qcom/gpucc-sm8550.c       |   9 +--
 drivers/clk/qcom/lpasscorecc-sc7180.c |   6 +-
 drivers/clk/qcom/videocc-sm8250.c     |   5 +-
 drivers/clk/qcom/videocc-sm8350.c     |   9 +--
 drivers/clk/qcom/videocc-sm8450.c     |  12 +--
 drivers/clk/qcom/videocc-sm8550.c     |  12 +--
 39 files changed, 236 insertions(+), 640 deletions(-)
---
base-commit: 1f5c003694fab4b1ba6cbdcc417488b975c088d0
change-id: 20230717-topic-branch_aon_cleanup-6976c13fe71c

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


