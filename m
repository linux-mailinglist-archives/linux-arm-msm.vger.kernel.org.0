Return-Path: <linux-arm-msm+bounces-5255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BB88176A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 17:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 104E3B22166
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 16:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE5049891;
	Mon, 18 Dec 2023 16:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O5ixwYUX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B233D564
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 16:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a233828ab91so201480866b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 08:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702915335; x=1703520135; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c4hFbIwksqnnHMFEIUpDIp2sv6C4RgN/QaxeoGjcsV4=;
        b=O5ixwYUXcyM9DTz1Ay7bcNMrvbJduiXVJjECpndeDew2JQ+836VanTHZoCHpu4elUf
         2po8jYki4wvqVIzrZ4LjH6hm5JLOOL6Gl3r+3CfcTZkNN6tw4jUzWhxolSwEjJQwoOFo
         EWmvGlobwUi9UH6uDU2PszjplMFp+cdJhhesqQKDI73PbNmnqyFeJ0NEkdjHGM9ClGBz
         Kub4fnURTIbhWt5vkYXOOm819JBFMgGqc2EGGk4VfetCprArdufE/0FvcmYdzbhxFWgj
         dSR+/NjzR/gYV8rZZJkfDpPC9VJcHphD95wBJX1YSaLVVuI/NwMrcGv9WsPsiQuE9Erq
         qOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702915335; x=1703520135;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4hFbIwksqnnHMFEIUpDIp2sv6C4RgN/QaxeoGjcsV4=;
        b=q22qRcdZJTG0iQ7fBPHfsUcAYYBJgz6TmLN7l/HAiWKvE8YsopNLxBIJhDDaCHK1P4
         0PZEAPAQ+YEVMncV6kYCD18k5dTgagZSQNwPzzWNPhztfZYoE9SS7nAgiaJQ8m0syRY0
         gmOYABEcm/DEqjywyh3V+oU/RKHPIpgchpHh+AvE07ALPwSwrw2lSTtT6ie78Qzfdril
         eQLPZA+P+m5swtZp8DTz6v8W2pLCekZSMOYsivE75N516cu1IE/rw7x10+3XopGbdUt/
         YX8pB4t90AmNTp6NOcakRcklkVCUmilq61SHhGiZ9f5JeeTN948De3ZFHk/41NbQvNFk
         Jf1A==
X-Gm-Message-State: AOJu0YwBI8WpFtwgTaM99h7L+x6mFu2aUVKN0hU53ZndCMsd888zhpro
	E4wJgLjZPMittwTXzvypxFm4oA==
X-Google-Smtp-Source: AGHT+IGKfxKawkNOG95ldyV5Amy0pn0orRx9Kky6oco0+fkJ1sV58/N2nFdibVGmvUe0F9sZUP8LjA==
X-Received: by 2002:a17:907:31c3:b0:a19:a1ba:da2d with SMTP id xf3-20020a17090731c300b00a19a1bada2dmr10314351ejb.84.1702915335035;
        Mon, 18 Dec 2023 08:02:15 -0800 (PST)
Received: from [10.167.154.1] (178235179137.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.137])
        by smtp.gmail.com with ESMTPSA id ts7-20020a170907c5c700b00a1dd58874b8sm14260693ejc.119.2023.12.18.08.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 08:02:14 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 00/12] 8550 fixups
Date: Mon, 18 Dec 2023 17:02:01 +0100
Message-Id: <20231218-topic-8550_fixes-v1-0-ce1272d77540@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPlsgGUC/x2L0QqDMAwAf0XyvICtOMRfERltms6AVGl0DMR/X
 9jjHXcXKFdhhbG5oPJHVLZi4B4N0BLKm1GSMfjWd867AY9tF8Kh79tXli8r+kjPjlJmlxPYFoM
 yxhoKLTaWc11N7pX/tZlpvu8fJCfhincAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Georgi Djakov <djakov@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702915332; l=1669;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=6Yb6Qe/+BKF3DV+Lv1BhKuTvaTNyVIFwB8H4W5q8BdI=;
 b=WN6C/G5NMRK0U5PRvi6RcGbFHGJhOq0WE7mMSQzhNKn7wyhSth6m02iTHjs3EDXx7AmQreUZ+
 qE3T1qxAX9ED17zx28TncGmUEfwG8aEyZttWnxMiImBy7buOGhSsja0
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

I found a couple of sneaky bugs concerning 8550, ranging from icc and clk,
to some usual omissions in the dts. This series attempts to amend them to
mostly prevent UB due to misconfiguration.

Patches 1-2 for icc, rest for qcom

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (12):
      interconnect: qcom: sm8550: Remove bogus per-RSC BCMs and nodes
      interconnect: qcom: sm8550: Enable sync_state
      clk: qcom: gcc-sm8550: Add the missing RETAIN_FF_ENABLE GDSC flag
      clk: qcom: gcc-sm8550: Mark the PCIe GDSCs votable
      clk: qcom: gcc-sm8550: use collapse-voting for PCIe GDSCs
      clk: qcom: gcc-sm8550: Mark RCGs shared where applicable
      clk: qcom: gpucc-sm8550: Update GPU PLL settings
      clk: qcom: dispcc-sm8550: Update disp PLL settings
      clk: qcom: dispcc-sm8550: Use the correct PLL configuration function
      arm64: dts: qcom: sm8550: Switch UFS from opp-table-hz to opp-v2
      arm64: dts: qcom: sm8550: Separate out X3 idle state
      arm64: dts: qcom: sm8550: Update idle state time requirements

 arch/arm64/boot/dts/qcom/sm8550.dtsi |  82 +++--
 drivers/clk/qcom/dispcc-sm8550.c     |  12 +-
 drivers/clk/qcom/gcc-sm8550.c        | 110 +++----
 drivers/clk/qcom/gpucc-sm8550.c      |   6 +-
 drivers/interconnect/qcom/sm8550.c   | 575 +----------------------------------
 drivers/interconnect/qcom/sm8550.h   | 284 ++++++++---------
 6 files changed, 257 insertions(+), 812 deletions(-)
---
base-commit: ceb2fe0d438644e1de06b9a6468a1fb8e2199c70
change-id: 20231218-topic-8550_fixes-2bc63cdfe1fd

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


