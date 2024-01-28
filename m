Return-Path: <linux-arm-msm+bounces-8722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 478CF83FA67
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 23:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A70E1C223DE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 22:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2077D446C3;
	Sun, 28 Jan 2024 22:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tHNJURNQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE9B3D3AC
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 22:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706482363; cv=none; b=RKrDhyu/Q5wvBZX2QDMeTsbxi6JX4DMJFOqwaSze+bFiNWQdPviB0QAwVTZ+A3gB72Iv9rqL7egApsJhI2aA0mnlWix9gaE9TK5TXDH/WiVz67+FK4fXLbtraq3fL3IrYfFsWKVTxZx/JuGhhnOG7KLKypoU1Kz1GKsCqJbKIM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706482363; c=relaxed/simple;
	bh=dBqBWS5WgCa/Dtu3chgY3pohkThKoPla530xkjDVVtY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ATQgyLf4yTvbeQK8LNInnr1Z3owbbO8ypKfHdvn8cf1s7ivtx7OEKFIk4PXjbW5Oks/eSDFgWsKVNAX+zpUYIEmMixfWFo+G/mcVi62ysr0F9oVkWIrCUxpSb0XwOxSoNt3BeYGwHHrpKR/2/bzpO3xahRfKmZL7PPVgt4fdZpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tHNJURNQ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-55f0b2c79cdso88720a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 14:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706482358; x=1707087158; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Xdj01DvAl1GY6okjPwa70iMiFgfvhRS5t9XnrYRvJk=;
        b=tHNJURNQ734wWQ3GwN3zsUhMDjEpuebzCyG/4C9dl9TdrCGG5nr/joaXWIyF84UcGm
         0o+74Jr2GJqwOlgHRHlrH42t4ZcgbUfS7yuDk36wUO1FqRWZwcp32zpv0781zdR3Albx
         10ntgM5dqKq8v3z1CNPPKZlH0bPbWGIGXXn7UhIQKZxujGutVxU5kdgToTVb7m1mispF
         nFbO949vlHd1qBw3PAVPkEZXp6kt/BFVYZWktJMc+wk0gRvs9odpyqEdg86IQtYFNI6e
         JTV6YE+BW6yWqY68wHcm9oDUHvkZgZsank27HfILDN/klB/0uhJTzTtojPxpKkjxSyZE
         EHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706482358; x=1707087158;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Xdj01DvAl1GY6okjPwa70iMiFgfvhRS5t9XnrYRvJk=;
        b=BtMTAOVwr6q7sYLuaAMkV7gx1CwkvhuAAExeUiBGJb3fZ8sDB/l3tQrGQD0DwzBexR
         NFjcH7N2Qmni5G2bMQo4Px0AuiRR0GqNHTtGuXHJo2EAnXGmBF3aWgbek2l7k4CJq34y
         v9z9q4XJjfzuIBjIZjKd8dhS+BcSPP+no2jJfUe+b4m1Xz7jfb5abNOBzWHVcu62LqtE
         dTtjnzhV6rRBinAf6DzWdezaZWhh0heKz3fVGYGA0GCtCNl2q7gnTiMg6e0sb6iex0ol
         s13YhyFxYjVmiHYM8wJC32BWzg22atJq5J6Q2ElrwKSxiJ5/VR3tqlWeOP5egGYNKggb
         GjiQ==
X-Gm-Message-State: AOJu0Yz5FnzY/tvUJOOyznnycpRDXM2m0Ip9UkGh++A03kTMnFolq9u8
	VjONxFnSoBC2xr7OE5bJ5wbOD8Cf4N57h19LDCJ1JsVF3vK3BIG8U0GqVz18k2U=
X-Google-Smtp-Source: AGHT+IGdTxL7pSRCjUfeALo8oAUwOTPbOh5c8h5tKlY0HpEvGMfiXYXOwe9L3pMlT5GvPgEgHP4Ksw==
X-Received: by 2002:a17:906:c343:b0:a30:f907:3568 with SMTP id ci3-20020a170906c34300b00a30f9073568mr3831178ejb.57.1706482358493;
        Sun, 28 Jan 2024 14:52:38 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id k11-20020a1709061c0b00b00a30cd599285sm3259996ejg.223.2024.01.28.14.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 14:52:38 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v3 00/10] clk: qcom: Add TCSR, GPU, CAM and DISP clock
 controllers for X1E80100
Date: Mon, 29 Jan 2024 00:52:13 +0200
Message-Id: <20240129-x1e80100-clock-controllers-v3-0-d96dacfed104@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ7atmUC/32PQQrCMBBFryJZO5qkkaor7yEuknRqgyEjk1Iq0
 rubqohuXP4//Mebu8jIAbPYL+6CcQg5UCqhWi6E72w6I4SmZKGlrpSWCkaFW6mkBB/JX8BT6pl
 iRM7grNFObupNu7WiAJzNCI5t8t2McGb9Gb9ORD30BLnDGOfBlbEN49PmeCq5C7knvj3lBjW3b
 w+l/3kMCiTIBpVtjWm8qw4xJMu0Ij6LmTvob5b5y9KFVb6qq51D1+j6hzVN0wNWCHNPQgEAAA=
 =
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3585; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=dBqBWS5WgCa/Dtu3chgY3pohkThKoPla530xkjDVVtY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlttqkp3ZnEbB2k2M4z5zx5HxZKE9EkIeziB3vf
 r472yWK8ceJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbbapAAKCRAbX0TJAJUV
 VpHDEACuoFD6jmWMI9dtAtSl5YiRtMaEYSzO0COwrvPJqbXScVUUCxtlsO/FEUC0CugG8GvmbCW
 tIXWmHu+TDML6PrOXl88TnNRMYzrlvVtj8a6ot14HLTGrr/hcjZ+dlnTlvi3jh4+sxQZN65To7g
 8KcWM4o2mu7JoTF9Uzc6da9CpYqCCDOY87JDLjZYW+D1xBYSfU4/AP2+kaaH+Bo8fcYBmY8Ia78
 zB6e9IlGuScF9XXbdP0oXgmoEFzX2w2rXr/bu/O9ManEl9PoBNzJ2CltbLR17GCxiG7Om8y1eVG
 xAQWstK06+eRMS1jYLQ3c9UC8+owAAckTMvKS4laax2fZuY2/00Tr1r5+TU6xzQlfS2pC+PhuhB
 VmKX969TEDy6lPi+xFtTHQMKiMvp1qx59cb3XXCeIsIZ4q81Bz8qAw3JmIq1ZCG+95fgc7Ph+eF
 h2GCuq41tX5+8OZHjF66XOvrr7RoarjphLS0gzQtcvmthAM0e6DUSkTsIgHhYZP91zLRQD6RJtx
 fHDKjvQMIGjSCatrtrfggGiNPWPzeSVynhxQVDhXwFUkuOiF7fl96wsY24sZodSOg+4SJqOxqbN
 YjAKTyL2vxdwO3CrlRrMsOrtqs7psCaxU7y2UYE8l6to8kjXG5U5qiGla8AJcl31YVU1RVayRUQ
 Nd+tVk5GqFtYXAA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

This patchset adds all the missing clock controllers for Qualcomm X1E80100
platform. Another important change is the dropping of the dedicated
schema of the SM8650 DISP CC as a preparatory work for documenting the
DISP CC compatible for X1E801800.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v3:
- Added Krzysztof's R-b tag to patch 2
- Dropped the DISP_CC_ prefix and CORE substring from gdsc names, to align
  with SM8[56]50
- Dropped the CC substring from GPU CC gdsc names
- Added P_BI_TCXO_AO to both dispcc and camcc
- Dropped the _ao prefix for disp_cc_parent_data_7
- Added missing test_ctl values for plls in dispcc
- Fixed flags for dispcc gdscs
- Moved comments for always enabled clocks on the same line in dispcc, camcc
  and gpucc, like Konrad suggested
- Fixed some error paths in dispcc probe
- Dropped underscore from driver name and replaced module description with
  full name, like Bryan suggested for all drivers
- Fixed gpucc branch ops and gdsc flags
- Added Bryan's T-b and R-b tags to camcc patch
- Link to v2: https://lore.kernel.org/r/20231214-x1e80100-clock-controllers-v2-0-2b0739bebd27@linaro.org

Changes in v2:
- Added Krzysztof's R-b tag to patches no. 1, 3, 4 and 5
- Added Dmitry's R-b tag to patch 7
- Reordered Signed-off-by tags in patch 6
- Lower-cased hex values in patch 6, 8 and 10
- Link to v1: https://lore.kernel.org/r/20231212-x1e80100-clock-controllers-v1-0-0de1af44dcb3@linaro.org

---
Abel Vesa (3):
      dt-bindings: clock: Drop the SM8650 DISPCC dedicated schema
      dt-bindings: clock: qcom: Document the X1E80100 TCSR Clock Controller
      clk: qcom: Add TCSR clock driver for x1e80100

Rajendra Nayak (7):
      dt-bindings: clock: qcom: Document the X1E80100 Display Clock Controller
      dt-bindings: clock: qcom: Document the X1E80100 GPU Clock Controller
      dt-bindings: clock: qcom: Document the X1E80100 Camera Clock Controller
      clk: qcom: clk-alpha-pll: Add support for zonda ole pll configure
      clk: qcom: Add dispcc clock driver for x1e80100
      clk: qcom: Add GPU clock driver for x1e80100
      clk: qcom: Add camcc clock driver for x1e80100

 .../bindings/clock/qcom,sm8450-camcc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    7 +-
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    1 +
 .../bindings/clock/qcom,sm8650-dispcc.yaml         |  106 -
 drivers/clk/qcom/Kconfig                           |   35 +
 drivers/clk/qcom/Makefile                          |    4 +
 drivers/clk/qcom/camcc-x1e80100.c                  | 2486 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   26 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    4 +
 drivers/clk/qcom/dispcc-x1e80100.c                 | 1718 ++++++++++++++
 drivers/clk/qcom/gpucc-x1e80100.c                  |  656 ++++++
 drivers/clk/qcom/tcsrcc-x1e80100.c                 |  285 +++
 include/dt-bindings/clock/qcom,x1e80100-camcc.h    |  135 ++
 include/dt-bindings/clock/qcom,x1e80100-dispcc.h   |   98 +
 include/dt-bindings/clock/qcom,x1e80100-gpucc.h    |   41 +
 include/dt-bindings/clock/qcom,x1e80100-tcsr.h     |   23 +
 include/dt-bindings/reset/qcom,x1e80100-gpucc.h    |   19 +
 18 files changed, 5541 insertions(+), 107 deletions(-)
---
base-commit: 41be0b4c4e66215c3aa444d30a75652fb55ed707
change-id: 20231201-x1e80100-clock-controllers-ba42b0575f8a

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


