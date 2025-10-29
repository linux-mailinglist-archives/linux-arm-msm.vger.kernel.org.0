Return-Path: <linux-arm-msm+bounces-79469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 08767C1B154
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 369975A4B16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 13:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F01E2C11F4;
	Wed, 29 Oct 2025 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B3eWoCVu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6974932C8B
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 13:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744709; cv=none; b=Rce5AqHXIeojAz+dQDHtK8RzfDt+tLVSuI/Ilfl8o7L5RdVlYJDwjwm9rkJg/Z1Jlh+O90eVxU8bVFkb9Gh/HZJv7+lb0+CmCNllwpAq/Iy20NyXVriHQCEywlvIEZoPRnJmClSpBlyyxqGzQhRix1a++/Np66lzyY9cAuEDnzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744709; c=relaxed/simple;
	bh=3unlR1V2gIolUh+XahCUQ3NCnp6cJj0xrnKUy90nCSg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FCkpqfIgk72yZG0ot29wrarcWp4QJweXrYS5hWfNm36nW96gESpmYjrMd8g7YwllWNeleG2IBTCu5Q1rIiIQsnSJXGf6rb1zB2IcAYnXqPo5xs8K7OdnCKbuqXLQdDAUIUuLLLKE52ahUr4YhzhwzVgHuG7wyPCIVyz+lyMKTmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B3eWoCVu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-471191ac79dso77394495e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 06:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761744705; x=1762349505; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sqaEwbyfWq5z+9uWBI43KLr77IOM/bA9Dq5RLeFvP/0=;
        b=B3eWoCVudZwy4HZYjeHXoEQgfgigIEXutM2Y+U3hBkeYFhLFPHPmhqB7bpxOwvroEH
         DSAkn6AV0ZDizaiDSVG/03HhSFaed1GK5fWp7LpBDz7+TPhukCDZ+xrpSPHzLC5EyWaE
         nljRM8iB1OzmdJnqwxLGpSRMZQhfyR9s4HODm3hh2PaumaMk16AR2Yh6ewKqsY8jbpoj
         wTLZI/2wG1K5/0AW1UVqxEJSyh46Wm6i4tPr6nlvhz6/eQq+JyvqG8JtDeSVvel0J9Xn
         cJAoCugCkhpqExonqw/RiJ+4nk/22CIJi7VrawHp1fcoCzDgD68kqjgf/YriaUj37stl
         HXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761744705; x=1762349505;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sqaEwbyfWq5z+9uWBI43KLr77IOM/bA9Dq5RLeFvP/0=;
        b=Ibght9i2R7wUi4HA9h+mOahKYzNRdMa3HWKVYRt6/GALhtcFwCuB5LN5v6wl+Lz/kz
         oyRO/ZMIsVPR455K3PPM53kx6M3M3gjtbuax8jWSZX1+2nbdasmOyGzeldw6FZNFALyr
         RSy8ZVQmSyg/GgcGbKXdQBJ0dkJsqXwxbG5TP20cfQhRuupjzsM5aHVQS5ynwuFmefbw
         lwMBAXp7/KXBUlFRE2xdcl+1OvChO1LkkHUQZ33nHfchNEnDOWqWsy2jaTgOfbFBeZBY
         6PFXb9Mkjoj+jS6VDn+oiSBascgYXVYGvYC3lsLcvfS56QrxT2MJEIQuvKzEz0m7wgv7
         Loww==
X-Forwarded-Encrypted: i=1; AJvYcCVMAxvleuoIFe81UbLYZ3KLVM14/xc8ai0Mwoocq0jedsotQjxr9KSu+OBnIhoWY3ts2gGZkBJrseMof5jM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9xtN8OfKwStmFNpv/DAkyfVq7q1Ic4HNtwPW8tERPd5dgBxd3
	4YJY/DtGh86kWlDE5llWZWrAfUZtuKiUi8MHmH+cue1lgWQfUURZzhR1yJro0Jaui7eORKrQ1CF
	MOcJo
X-Gm-Gg: ASbGncur1Z2nJI++pc1XqsQHqQ3k+r+M1l9IyNFuvU5hLJV2M+490JA1uNYgLYGgDg0
	n+jZvEAqKCDvCVMO05yYKwssXzCfAuC6dITm7DdUCndpnT5gK/cJTWd4BsNIillv0Ju1QJPKFFG
	pFgDluSsGOy5z2dWTjwQ6HzAuSz3KC4GB00cd0XeeVe+43oKLeUd7mNnTxiyzvlB2CUPo3adWxB
	VxAKfPXkeKygseaiQIBW7+Z8fI+IQG2fOxTBVNhy6HgG9sf+Uo1S1HsfSisTRd55O/DEZqSQ9bC
	eNy+gXrLt+a0hzIOufa6O67PTa4jRB/LeCwtCwdoww+4G8wiQLDH/s89WBf2d6zp+myThwPrhWi
	GNEs+k9nfgXzOWNhZzosL1Sr4SYt6lcPIBq22zrGbiVje0MOv0iTVmUpORuzANbp5Nm46tUVwaA
	==
X-Google-Smtp-Source: AGHT+IEUo5K1L3jXjehmVgAr9vID9LU63vPIgz1DPh5I2bBQUa8TMjUk7SLEqbkkRkNVIiF8q89ejQ==
X-Received: by 2002:a05:600c:4e46:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-4771e17ef98mr27350035e9.9.1761744704790;
        Wed, 29 Oct 2025 06:31:44 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b7cb9sm58273015e9.15.2025.10.29.06.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:31:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v4 0/3] phy: qcom: edp: Add missing ref clock to x1e80100
Date: Wed, 29 Oct 2025 15:31:29 +0200
Message-Id: <20251029-phy-qcom-edp-add-missing-refclk-v4-0-adb7f5c54fe4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADEXAmkC/43OwW7CMAwG4FdBOc/ISQvNOO09EIc0cVpr0HQJq
 qhQ3x3DYRPiwGTJ0v8fPvuqCmWmonarq8o0ceE0SKg/Vsr3bugIOEhWBs0Gmwph7Gf48ekEFEZ
 wIcCJS+Ghg0zRH79h41prZKKlRokySs+Xx4X9QXLP5Zzy/Dg46Xv7f3vSgLCNjXWRXGh9/Dry4
 HJap9ypOz6ZP/ATq/egETBY63WLPsh+AatfUKOu34OVgNjYlrDWAbfPHy7LcgNd96uFcQEAAA=
 =
X-Change-ID: 20250730-phy-qcom-edp-add-missing-refclk-5ab82828f8e7
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2420; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=3unlR1V2gIolUh+XahCUQ3NCnp6cJj0xrnKUy90nCSg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpAhc0KTq9ZO6jp/IGBgo+1QQxZFspJxS2iy6aT
 gqsHS6lg+OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaQIXNAAKCRAbX0TJAJUV
 VsOeD/0RpM8IdFbeGWgAKeuXg07gvm9epnctye48bBTSimA8oSr0WxlhViGXushp72gJvkYWyoK
 4PsWltTJGl4hBWInkVNhuhwqFvdDQeq0pOylr7CMud3O9EPMx0Wkp0Q69uVxef5HMda3I5CN1Xv
 lcF6QWWMXKmbcxWFmPUpx6vsMJvyHN6lsUIPcSPQ1bG52iJbu+1ZiuK2em92AwPSPTCiOEVcWe+
 AKzjuRNPcsdf9kO1FtRsFUEtefbqL/mYsbIu+Qdm7p+ql9OMS4NdXCpOcx1+nF/T0aW3ky++c3F
 pSJby1MAu8h584RaGY4xZgNp1CMLliHhNTA1BtFR65ADVvqbs9AORtTcEEQXNyqbIjvwfX+qU6o
 u7VSseKaXTHa3Pr3zdNjCMPvnGldn2YXtmiR/p5bnzu/CALjDbXDJC0INmKQsobapmOESz8gMPr
 Pvs03Jed0mhQp+Bn+FVot9D+0eonLiDwV7FA3QQZyn23PZjSaJfNTrbHM/26NlJt8W5lvGRcVIy
 nTGs6DvdEhoKD0+MF2LtOIc1s2hQe0GhdQGiHH6fXtYAoqgMrmAy/m3Co+dcPKhmlccxBOkMxUT
 9MBTrBhR7OdSru9WVZNfUJIFLLfNPS2S3Zbwc1PsVJtJsInM7TMGNTHM2TOx2OvFJWf7+SEPBUw
 f8oB0GZLa73Vjcg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

According to documentation, the DP PHY on x1e80100 has another clock
called ref.

The current X Elite devices supported upstream work fine without this
clock, because the boot firmware leaves this clock enabled. But we should
not rely on that. Also, when it comes to power management, this clock
needs to be also disabled on suspend. So even though this change breaks
the ABI, it is needed in order to make we disable this clock on runtime
PM, when that is going to be enabled in the driver.

So rework the driver to allow different number of clocks, fix the
dt-bindings schema and add the clock to the DT node as well.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v4:
- Picked Dmitry's R-b tag for the driver patch
- Added x1e80100 substring to subject of dts patch
- Link to v3 (resend): https://lore.kernel.org/r/20251014-phy-qcom-edp-add-missing-refclk-v3-0-078be041d06f@linaro.org

Changes in v3 (resend)
- picked-up Krzysztof's R-b tag for bindings patch
- Link to v3: https://lore.kernel.org/r/20250909-phy-qcom-edp-add-missing-refclk-v3-0-4ec55a0512ab@linaro.org

Changes in v3:
- Use dev_err_probe() on clocks parsing failure.
- Explain why the ABI break is necessary.
- Drop the extra 'clk' suffix from the clock name. So ref instead of
  refclk.
- Link to v2: https://lore.kernel.org/r/20250903-phy-qcom-edp-add-missing-refclk-v2-0-d88c1b0cdc1b@linaro.org

Changes in v2:
- Fix schema by adding the minItems, as suggested by Krzysztof.
- Use devm_clk_bulk_get_all, as suggested by Konrad.
- Rephrase the commit messages to reflect the flexible number of clocks.
- Link to v1: https://lore.kernel.org/r/20250730-phy-qcom-edp-add-missing-refclk-v1-0-6f78afeadbcf@linaro.org

---
Abel Vesa (3):
      dt-bindings: phy: qcom-edp: Add missing clock for X Elite
      phy: qcom: edp: Make the number of clocks flexible
      arm64: dts: qcom: x1e80100: Add missing TCSR ref clock to the DP PHYs

 .../devicetree/bindings/phy/qcom,edp-phy.yaml      | 28 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 12 ++++++----
 drivers/phy/qualcomm/phy-qcom-edp.c                | 16 ++++++-------
 3 files changed, 43 insertions(+), 13 deletions(-)
---
base-commit: f9ba12abc5282bf992f9a9ae87ad814fd03a0270
change-id: 20250730-phy-qcom-edp-add-missing-refclk-5ab82828f8e7

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


