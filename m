Return-Path: <linux-arm-msm+bounces-36020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FFC9B195E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 17:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF0B21F21BE9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 15:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD4570826;
	Sat, 26 Oct 2024 15:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t9PcxNVV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602EA22066
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 15:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729957630; cv=none; b=pafFxVYc6Y7CQ2Vo8c5ckVQbHinrM44uuyhVTjxdOu3HwwKwv5+zFYcqWXzZncfFu5o1eEoMDnrmvnW6EZDjTdWE4Tk6wYRB2fwYQHre+vyoudXlvZ7SkDir/5EhgBfHSvRiMnl4vKumJXBCqSXDeoWVpgMivTJxrHk9a+Pjvvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729957630; c=relaxed/simple;
	bh=DnphJ809DpBOTKhoHJ/6RAFXBFta/89tt+gIiuZqKRk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J1jZP2b7ubU5AXGhSXObceNpZwPuiC/+xrMBIIv5y7UNNYnSrF9sOjmnZz/qqUxtoaEuR5vBo33Fq8JiXXX+aaqFH6MgWCsYooJWCKAdOoNPA5AcoLjfpczd0MkLJ/ok4pZL6ye5q6QEnS2Psj0sGTVq7FM1DzTJ/Olf9moSoO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t9PcxNVV; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f58c68c5so5179682e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729957626; x=1730562426; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MjV6CfzX2jM9xUG6emWvgOVQJLaaFkz/QoSwxwLl3Z8=;
        b=t9PcxNVVI8SEu7+RCaaJjo+GmCeAz7IdcrWMiUwZSX99/njRT/0Rmc9oXprmjepll4
         KbY7yVfQx1Oc8I0sZldeUeBfR60vSjccTW5mKzMuXalVnHBWmmztjrP9DdygmKhX4YBu
         BwbPQjgrFHl6jpyNC5TGHTvJxhQq28GLkZGpCSoZu7O7dJ4cYmVakEyQFvmiSYclgQbv
         0Fv0rnIcp6PX5RwUnCNXmUNlEi+DWoI+RHzUvtJ13R8WH0s7PIK1bDVqaAnHWgKgCk6A
         tc2nIurrkhNWp0pTZR7hdx9VGdMAtfJIFhZ/4DB3qz+XYujD+5Czf7r0Z7rmfWi3K8UP
         wMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729957626; x=1730562426;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjV6CfzX2jM9xUG6emWvgOVQJLaaFkz/QoSwxwLl3Z8=;
        b=gYeVFaEQGLF2dtWS3raioslZoddcrzabQLqdLrQD5bc9XmwCo88aG23AyvJXG+q4yH
         Xyogq4jV96Yku4svuMSTYLbWAKBrAZpSFkh8YIbwUJnl2LQPryVwc5JkU9WFJAHjeQc+
         LTJH4yCbIKRycAYf/ZdNIqyGeL5bOEf7djIXfIYfleUCsVgxj4zUalGhrIs/em+zFzmM
         6VshOIeBxu7vsf0YhVk9+U4BUq0GmUhApnM44KwidXGNWgAlcf5FvWqdAg+oQFlXOLwK
         eWU/6FrOEoGkNNZF9MMlnPid3Z0n3TdI/yLx9BqVzJPIkXJGu4o2h7kk1BSfn3TZk8WV
         YWpw==
X-Gm-Message-State: AOJu0Yw8tE+TosB2VlqlWXyCgBwtTZP+0iJY1QskqAqwRwWefux5ZYCb
	mT4B5+p0userYWTTLKp0YrooBwyCtIuOV1h+ch56kgypdNfXdpNBQpap42B3g7o=
X-Google-Smtp-Source: AGHT+IEskGeyha9uVTXF9WeI+84tQtI8f8VG/ItzXZqZ/l7V9H5h4ddLIskKAcU6s9IaqAJU2CFHtg==
X-Received: by 2002:a05:6512:1252:b0:536:a4f1:d214 with SMTP id 2adb3069b0e04-53b348cc55cmr2029159e87.19.1729957626453;
        Sat, 26 Oct 2024 08:47:06 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c7cf4sm532188e87.184.2024.10.26.08.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 08:47:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 00/11] clk: qcom: add support for clock controllers on
 the SAR2130P platform
Date: Sat, 26 Oct 2024 18:46:58 +0300
Message-Id: <20241026-sar2130p-clocks-v4-0-37100d40fadc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPIOHWcC/3XNQQ6CMBCF4auQrq3pTFtBV97DuCh0Co2GktYQD
 eHuFlYY4vJ/yXwzsUTRU2KXYmKRRp986HOoQ8GazvQtcW9zMxSoQEDJk4kIUgy8eYbmkbh2tbX
 n2glFxPLVEMn59yre7rk7n14hftYHIyzrf2sELrgrNZVKOGEqe3363sRwDLFlCzbiBkDYA5gBW
 UnSVANKgztAbgG9B2QGVOWgUugs6NMPMM/zF6PmOrkxAQAA
X-Change-ID: 20241017-sar2130p-clocks-5fbdd9bf04ee
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kalpak Kawadkar <quic_kkawadka@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3457;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=DnphJ809DpBOTKhoHJ/6RAFXBFta/89tt+gIiuZqKRk=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHQ7170tw4vV13ywWM0BQprAuGf/i5GISxNYdK
 QRXq7us1UyJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx0O9QAKCRAU23LtvoBl
 uCViD/48fIW1ysYTMtRjkwuqrNc8xSHfH1Palf1lEh3mq076pVTTudgeTM+KL/896SqXGGizrS5
 ExIA7aApdwtpkEfWfub3YqPAcmoodnEKyrqBek/1ivYyaoeiMIChYrPvJ2EPdWC/KPFcXExjRFq
 RbdOgCRcZodsZxH4O0XHoEqcIxnZf3SCLY6oVrXMzH086TDoUVSocUp1vv7fyFf66XQBk2GF5qD
 +ZMC07P/yDmLwsmzQMZOxhnD7V2Hrl5Lyo3tza1LYQL9c3iF2l1XS1U3RBAYQfSpFK0p5JPqv66
 Ylt/iygkwtUZ6JRKN3N9zrPzVLLxJ+SYEKCypeq6opi+N5FMtdN/fvdrS1t+Zvgju3s6tx4z18f
 3dWcB/x8KMhEgJ4QCXbdf97bl2me/CY8k9NMf333ekARZG7C0HVx0sXndWdACQdBNvHaL1as5lV
 9ymXjVPzOoXiYKqLCjaoMSMgO9dkWYp4ak/j7hsJ6TzWHbLsUTwiXKPb0KrrS51yNSqcmQO2wKg
 KBM5b9swBGe0+jm10F6iLqjDM5IoQxwjOLlcfNHFNZFxw9+csZK/WEIAib28bFfiD1gX67Fp7jw
 7h/A2CnhoCMhp2uR+ifQR1+PxiD0ONIF9QDYSwEruIV9H3jPORVRo86b6qNH0N5M6rxmHzHg+eB
 rvg4yjrXUoiCHLA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add support for the RPMh, TCSR, Global, Display and GPU clock
controllers as present on the Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Fixed commit message for the RPMh clocks patch to mention RF_CLK1
  clock (Konrad)
- Link to v3: https://lore.kernel.org/r/20241025-sar2130p-clocks-v3-0-48f1842fd156@linaro.org

Changes in v3:
- Added rfclka1 to RPMh clocks for SAR2140P (Taniya)
- Added HLOS1_VOTE_MM_SNOC_MMU_TBU_HF0_GDSC,
	HLOS1_VOTE_MM_SNOC_MMU_TBU_SF0_GDSC,
	HLOS1_VOTE_TURING_MMU_TBU0_GDSC,
	HLOS1_VOTE_TURING_MMU_TBU1_GDSC
 (Taniya)
- Removed extra debug print in gpucc probe (Konrad)
- Link to v2: https://lore.kernel.org/r/20241021-sar2130p-clocks-v2-0-383e5eb123a2@linaro.org

Changes in v2:
- Dropped gcc_camera_hf_axi_clk, gcc_camera_sf_axi_clk,
  gcc_qmip_camera_nrt_ahb_clk, gcc_qmip_camera_rt_ahb_clk,
  gcc_iris_ss_hf_axi1_sreg, gcc_iris_ss_spd_axi1_sreg,
  gcc_video_axi0_sreg and gcc_video_axi1_sreg clocks until corresponding
  subsytems bringup (Taniya)
- Program GDSC_SLEEP_ENA_VOTE directly from the probe function (Taniya)
- Dropped sreg, BRANCH_HALT_POLL and collapse_sleep_mask patches
  (Taniya)
- Dropped gcc_parent_data_4, gcc_parent_map_4, gcc_parent_data_5,
  gcc_parent_map_5 (LKP)
- Link to v1: https://lore.kernel.org/r/20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org

---
Dmitry Baryshkov (9):
      dt-bindings: clock: qcom,rpmhcc: Add SAR2130P compatible
      dt-bindings: clock: qcom: document SAR2130P Global Clock Controller
      dt-bindings: clock: qcom,sm8550-tcsr: Add SAR2130P compatible
      dt-bindings: clock: qcom,sm8550-dispcc: Add SAR2130P compatible
      clk: qcom: rcg2: add clk_rcg2_shared_floor_ops
      clk: qcom: rpmh: add support for SAR2130P
      clk: qcom: add support for GCC on SAR2130P
      clk: qcom: tcsrcc-sm8550: add SAR2130P support
      clk: qcom: dispcc-sm8550: enable support for SAR2130P

Konrad Dybcio (2):
      dt-bindings: clk: qcom,sm8450-gpucc: add SAR2130P compatibles
      clk: qcom: add SAR2130P GPU Clock Controller support

 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sar2130p-gcc.yaml          |   65 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    1 +
 drivers/clk/qcom/Kconfig                           |   22 +-
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-rcg.h                         |    1 +
 drivers/clk/qcom/clk-rcg2.c                        |   48 +-
 drivers/clk/qcom/clk-rpmh.c                        |   13 +
 drivers/clk/qcom/dispcc-sm8550.c                   |   18 +-
 drivers/clk/qcom/gcc-sar2130p.c                    | 2366 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-sar2130p.c                  |  503 +++++
 drivers/clk/qcom/tcsrcc-sm8550.c                   |   18 +-
 include/dt-bindings/clock/qcom,sar2130p-gcc.h      |  185 ++
 include/dt-bindings/clock/qcom,sar2130p-gpucc.h    |   33 +
 include/dt-bindings/reset/qcom,sar2130p-gpucc.h    |   14 +
 17 files changed, 3282 insertions(+), 11 deletions(-)
---
base-commit: f6202e7cb4762be30b01ca4e1666512171c16d2a
change-id: 20241017-sar2130p-clocks-5fbdd9bf04ee

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


