Return-Path: <linux-arm-msm+bounces-35893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC0A9B0712
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20E571F214E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 15:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABCE18756A;
	Fri, 25 Oct 2024 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HDMSEun7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D3D166315
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 15:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868638; cv=none; b=aCvMC4dHwwCImPcl361iB/IaED80+DOw7S2jxWqULgxBL3hjZFY2Ed3ZMeWc84wkipKdvDo2PiIndDVzRE6USlTo2WRFLunO6+X75pkaJgn0LUnYrWbxFuXOvrLeiKyTIZoKUgKC2C/A5r2+uinApIgZMI1E14npV9ZdPjxIVYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868638; c=relaxed/simple;
	bh=2I/TB9e/qvZscYuIM5ZhAGgZHV87H1IH0MC1lBIDRwk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hz+LJU9hc3/GfUd4Oj/ytecElCKHptUj5rWj3vol00ngMQLHYcpksZ0ZnCPeMOlr+NkUJZS3kOZQmvvQ6wJM+qJsZYZnrftzYSbKsEgmu+cowBTxdHajAc+gDHajZpz2K8zv13I+3Q2D+K1q1Jg1pD+H1I7sso8hkRZtJOtmyk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HDMSEun7; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e63c8678so2326179e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 08:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729868633; x=1730473433; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yJFbJaVmfKjDCzDIXM5j0dVs3u7mp+kaCik0adMD3es=;
        b=HDMSEun77Bs3q5kl+3PAuXBV55stslqsRrVp5Ex7rWIa6+qsd2tcPbXtVeUb/dsvG+
         NxZhFfj6MoSoyT6uqxTTRrgZsNIYjPZlevZDgDsq25HxMHRAT9TUcZuSgOZBzHB98J39
         HeyFwRzUcWGgN8FudeQcfdXbHBJq1S15apHy1Pb+OXjJu5qBgBP26lfax8s2NnCdgENN
         m6L9lfRP+kzOreG2R3lArqgkObwaYVAZ7UseW2SYlNCASprZPJtB11rh8VYOhMX0HEjP
         GhhBY+AYcATIKR7ukBn0isNQCGczAyzSpgh3f1FNJRH/U1gqCCbd4WuMNEFnBXYCJWZv
         wnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868633; x=1730473433;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJFbJaVmfKjDCzDIXM5j0dVs3u7mp+kaCik0adMD3es=;
        b=LkHVUMz79bpMicGY7VdV728w8ljNihblNkZ2NVeuPfyi/AxuTIZL26wIaHbRY+eOT+
         NlRLO2zbz1KmCpxnbYxAyrF7omEJn2Np0TgsEAK3848bQ2Aj5jWxhFoDwQEIfP/VfM+A
         tHqxKoIkraM2RrCwhBf/5sNHBnXPx/HmBwADpgh7KBfdB/IegDrz2O6r0dEjJmjtjaiI
         sn5cZqZ+cF+x35ErI5d50IbuH2kKk9C/5gY691UEv9xuTOlBhCsegSfPqnfcuX2tzHrq
         n8PhO6NBf/LgcmBR/O142NxBQF7PG5KS6zLmSpfNPjy4pxxJ2+WTYnHLG82GsgTwHkcS
         7jHw==
X-Gm-Message-State: AOJu0Yw+m10MaYm1/HEnaq+xDdWaSuVctpMROh8vcVOpK2k7uzGhmIsk
	6dIzbe2zSvAtCEzNbkC5Gx/viTFa0i8lm2ptlDFHJSVYvn/Aq6BStEatqZx+Njw=
X-Google-Smtp-Source: AGHT+IEc1+LGIXXymPDrmIYeNix/JiUavCyvGz44DMoz7I4erNiOM5fsRMlgqHMSUe8uqhCXhnFs4w==
X-Received: by 2002:a05:6512:3a82:b0:539:8b02:8f1d with SMTP id 2adb3069b0e04-53b1a3392bcmr5698242e87.30.1729868632666;
        Fri, 25 Oct 2024 08:03:52 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a915sm209542e87.12.2024.10.25.08.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:03:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 00/11] clk: qcom: add support for clock controllers on
 the SAR2130P platform
Date: Fri, 25 Oct 2024 18:03:34 +0300
Message-Id: <20241025-sar2130p-clocks-v3-0-48f1842fd156@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEazG2cC/3XNQQ6CMBCF4auQrq3pTCGgK+9hXBQ6hUZCydQ0G
 sLdLaw0xuX/kvlmEZHYUxTnYhFMyUcfphz6UIhuMFNP0tvcAhWWoKCW0TCCVrPsxtDdo6xca+2
 pdaokEvlqZnL+uYvXW+7Bx0fg1/4gwbb+txJIJV1dUV0qp0xjL6OfDIdj4F5sWMIPAOEXwAzoR
 lNFLaA2+AWs6/oGaOzjgfAAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3257;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2I/TB9e/qvZscYuIM5ZhAGgZHV87H1IH0MC1lBIDRwk=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnG7NROmc0Tq8cKYJkTawSQHz7Cbdd8N9iUrLXh
 uGv8U4rhFaJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxuzUQAKCRAU23LtvoBl
 uL9AEAC7fv5yrRXvi55cS54GRqGAsE3aTSY3cikJ5AqZHku7O6pkUDx2CizI70JANmhdi4QAUJS
 dox5p7vsy3q0Je2iS87Rd5xPcdT2sjC+NZ2yD2I3X22/QLNUyqXId/xHPZormvjgRpUfQKBao2z
 7HFhc8y9/Xy3YCWHwPWWKV0S8xONPHHxapl6FabSeSWy1wymL4QVuvZxbovFwVHnZ3tB2L6toka
 gdfSi6aEmAZgPh/CyhxlGRFFMPQmHAgPDV9AjQXjPZvpOVkpKwNiTFwtl3Fzb0MOwxvSKaUynAj
 MRNUXRsfUi0xFcot/3MmbPJG/MJTu5jH/BddW9UlIbsNmUehANJNyrgiM3zzKNDFCnNXrPsXRX4
 S6SeA7mbga/rCkV6gqqqgaiQ6sf3+jzVjeSfQF5Wxl11sDaz+Pv4hlmCLLFZpd0fU4iKlVQGduW
 r+dKkrsoQFwjnPpSBOUbhuenAGiromI5X5I+hmmy1Du6cHe8C2zD9IvaN1qfOBDfrbUXKzXp5s7
 eP0xzLl5PTarxQcIn4zzXYmQMmhx/poQragNU3n1t2czMEFLuzmvzvPTGIpPt/LG5h4pUadkusk
 p6qTFegnrQRXNdpL8nZ45IoaPwHzbmev2GCg+2WajQ0XV2YulptW850NEnks50KDou0oaWwAu5z
 +UxXvzO6iSG3JNA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add support for the RPMh, TCSR, Global, Display and GPU clock
controllers as present on the Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
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


