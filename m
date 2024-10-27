Return-Path: <linux-arm-msm+bounces-36060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 814EC9B1BA8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 02:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A187F1C210B3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 01:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC461799B;
	Sun, 27 Oct 2024 01:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TBd8IJpd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B8AE555
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Oct 2024 01:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729992296; cv=none; b=CMa9MCwHU+iVGfycPJtKiBXM66WoRbOaL8ijkPfz6NV9uUF8zdR2lbnncMe6B071fLcn2NO+f/DifNcqNpb1Dc09Bgx/Dy68QrlUaELUymUPCqfXEDE5TwtZacA20Qc+0DxdF6BHdPO3qJ2UOxOVgBI3sAhGXyCVUcBh6+KXWoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729992296; c=relaxed/simple;
	bh=7tM/N1XH2DuKOmOBVNe95VBzXFxfDobIX6AJnVgmH/0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S1D3vIEsC1NC6supAFEo3ZhKe+TKc1+7lS5QSGXmU4nldV4y/f+clLgKO6mnmLvV0hnklhzoVT0piKxfU/rGXO//hapKBtpqybMEbo1/nWgx36Pw5J34i+1NhIFX0V+/JcVA0mjU5iTDMwXgETrH8yPhGCzJhET3JW6kOvuU5o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TBd8IJpd; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e4b7409fso3195081e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 18:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729992292; x=1730597092; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=68AeqYijcL7oecvXqcrDIqXV8PPNtXZ3Z0x7Bk8ng0Y=;
        b=TBd8IJpdBr2UfyKCkiMAUOcSv4K9S/vWmuhM9+7QmV+kaCRA+WYg2XuaGFWrhHBy7C
         OPEH7ezq/kAQ/oUtmYOSTw1Ytf/5FKjDanbeO+mQ29ypJOWQSoyNXX3JVqdkRdxa7ezH
         EpCCHHXUv8iC30Vkhfq1JmPVgy9AS8u/psWXeeHvZ0JFOynZlckTsdulbmkiLA30TpFi
         DIk61N5qRUOcXuIrD2AQIpg5hE6oIl8cVDFxaIxXyCzozJH4Mj/zo06tuKjmlq7wtzAj
         QsFgd+qWAQI55avephaB60EcAfTurUNHu6hQ8QYgR4R4QdAMC8oy6qgwsAhg74AXxSOy
         BNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729992292; x=1730597092;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68AeqYijcL7oecvXqcrDIqXV8PPNtXZ3Z0x7Bk8ng0Y=;
        b=knjy2YIo/SMn6/ek5f7h48zD6JfCIRJZPP7hgdwx7naGpwTllOaFbZ7Rw3CYjJuYe/
         inHtv5u2rJRdfGiNTEL0JQ0HjAuGaJ9lMuc9JWVNUA9e4PRwkXjYL+h90sjI34ewIXWB
         hV+N/+hmoav3MZXoZ1k0ekpWdZFfIntKID0rukHnnf4lmBwHs3ZGNcSsMipubvkY9lWp
         MAFUh67gQ21LoR6LYl6V5vdAii7Xc76ZYOGrZD7ZcOaxfpY2r31hdb0fjixEsE3okwkW
         hyyjvipKCX4AeCp1v6i/MP8OeIwa0gO1rhnP+3gvQKl6t7yraJwax3CF8qfHxumRALBF
         U4Hg==
X-Gm-Message-State: AOJu0Yxs7UpkCR4Gx8IkBiO9pDPvp89f6t11U+rOXLgVDjkTzdVzQwqe
	LX2+uFuH6P0j9DueBtBKXfa30apkATD0HQDVQYulp7tMdJcMJus5ZByIUXkwoPg=
X-Google-Smtp-Source: AGHT+IGNFnfvQwIz3yLv6F260HUn98pzMeiIWO1/m5aRrYXNlOj/wOWz3oQEixnqG9n7ICb+rpU1Aw==
X-Received: by 2002:a05:6512:6ce:b0:539:fcf0:268e with SMTP id 2adb3069b0e04-53b237094admr3368579e87.14.1729992292227;
        Sat, 26 Oct 2024 18:24:52 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c901esm642356e87.219.2024.10.26.18.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 18:24:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 00/11] clk: qcom: add support for clock controllers on
 the SAR2130P platform
Date: Sun, 27 Oct 2024 03:24:39 +0200
Message-Id: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFiWHWcC/3XPwQrCMAwG4FeRnq0kaeumJ99DPHRrqkVZpZWhy
 N7dztOkePwD+f7kLTKnwFnsV2+ReAw5xKEEs16J/mKHM8vgShYEpBGwkdkmQgV32d9if83S+M6
 5XedBM4uydU/sw/MrHk8lX0J+xPT6Fow4T/9bI0qQvjHcaPBgW3e4hcGmuInpLGZspAVAWANUA
 NUqNtwhKUsVoJaAqQFVAN16bDV5h2ZbAXoJbGtAzxc0CODKD9b1P8A0TR9seqSKcgEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3650;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7tM/N1XH2DuKOmOBVNe95VBzXFxfDobIX6AJnVgmH/0=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHZZeEhUulsjctkQk+MwpZ4ZDh+dALftQ3exsW
 Ir+jth7k3CJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx2WXgAKCRAU23LtvoBl
 uLu7D/oCMrWp8UQmOcTjas/Va59LwsbBlENgFF0VC3gth+la6dNy2e00d9zkQ+weAPEyoiMan8V
 L/rINmzYyyrs5W7JCi3pjKbUHvWB+undEWu/cYhwVP36S4gUZdpPqaL4/+GPc5pyj/InT/3aj2f
 JWFVeL8VyWczM8U0//V8W+NOGvILGYg9huSljEduQha4suDqRMXHBViQi1i8SEh4tdB9R0aKXTK
 3TqgOMH7gewVlz9avOAyWkvw2uzpNhmDc6WZ8Ia55SisPwURU0RLmY3m7uqCR0psPK+rLa+P8Nm
 hlnTFgW6rBE+v371Ha+8wNQ3H4t+/6I/3otZJ5lP2jeh2x+J5+gUJJQg5ZKrHWmZhKbpHp8NxGj
 eabflV9HzP70TNmg8PdOEbtVkFfN3XvPu+ZWGyQ+1yLs6mc9pBtrVgZi93yrNISKeT9Uzf1gPHs
 w5Fn3xcqBNC7sOyVJ+Vx5v0kiWCzbiT9qrKa6XVWg9AhmQmzZHwi1ZaNVwI97IvXfKlVqNSfrLk
 Au3ZYXDpujx3m8cQxjCHLXou8YC5JmXqktphT0yqeNZHD6T86yw0FlS+f3VzGeI+HIGFF9Q1gO5
 4ckWdQfJUxmfuwX4K24atZKa/lcxZBjhRy4/G1CzP6OtFvmwfJZqxRBBWVuyfIuPi2OfxAZiCY+
 bcSZ7x9Mf8WG2aA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add support for the RPMh, TCSR, Global, Display and GPU clock
controllers as present on the Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v5:
- Dropped the stray 'int ret' variable, leftover from the previous
  cleanup.
- Link to v4: https://lore.kernel.org/r/20241026-sar2130p-clocks-v4-0-37100d40fadc@linaro.org

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
 drivers/clk/qcom/gpucc-sar2130p.c                  |  502 +++++
 drivers/clk/qcom/tcsrcc-sm8550.c                   |   18 +-
 include/dt-bindings/clock/qcom,sar2130p-gcc.h      |  185 ++
 include/dt-bindings/clock/qcom,sar2130p-gpucc.h    |   33 +
 include/dt-bindings/reset/qcom,sar2130p-gpucc.h    |   14 +
 17 files changed, 3281 insertions(+), 11 deletions(-)
---
base-commit: f6202e7cb4762be30b01ca4e1666512171c16d2a
change-id: 20241017-sar2130p-clocks-5fbdd9bf04ee

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


