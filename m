Return-Path: <linux-arm-msm+bounces-70191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4107B2FB5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 15:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5356B661AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C221A9FB7;
	Thu, 21 Aug 2025 13:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bndwxsky"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02322EC57A
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 13:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755784413; cv=none; b=h2dbPGew0fSOKrnjZ5R8Xq48CJX2D3+zt/cq3jXSQRDZ7zaJ0JJdC9Sm64w9+0M95k6SVdZnaB9Fz2svIV7/L23qE59mB+P5ncyvWyrCSIGmTRR8b+Im9d11E2VpaEp03n3aqea7mcybh+WTjiTf8Tp65mtl78+39ACWTa4gC1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755784413; c=relaxed/simple;
	bh=EuJCqC4vIrzzbiFdFQd34jpBkJ7TfEaSLO1NIgSU5T4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u5vZdyTFpeCbmhpzW+qLEx5joqIkW8tXr+ywTy6qh6E8xrVGnGCpJVatM5GXQ0oNsIRLeM00ahNGMQQIeTL2ruypaJBIZ1fAabYTkVGIsiStUxaKSIke7foOG0i1W8XoAWyM5KjeEZIq3ijzoiCDiCdlfJwTTvNTePDgFE9lIP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bndwxsky; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b0d224dso5126635e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 06:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755784409; x=1756389209; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/L//1ClyCXosNXrtBXgB70nXKpVyJeRv0Gj5xSeDt2c=;
        b=bndwxskydvRBGbHkj8uuNU35ppfy74adzntyGWBZ1IG25yEyQF959ea2VvJalEzzy4
         YFrsSjr6ZIEiS7Vk4ZUKwkpbUTJZOOZJ/3yQEuQhYcLGT6SBO/tcr3J8jT8eT4bDATDX
         cN4ihNNiaLyrCUgBoNvIKpJ/nIN/WtcjIf424EEmkpUa8G2yeplLm8pWKl6ZWIZTULlm
         N/SEtTMSoDZSekUWc4xQNrd5WwCZIvYsQuYYRpnFiUdkGkVHpTKoRzt+rdUpcahNWrs+
         89MFMCth/MiSde7wGz+OAisaoWfVC77VCnIg/izvbvME8+p1KxP2P8Ylbzpj+tHxHgz7
         rZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755784409; x=1756389209;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/L//1ClyCXosNXrtBXgB70nXKpVyJeRv0Gj5xSeDt2c=;
        b=FJJ24esDoNLC8e6PKHpJEUYDzkoE5D0m9tH8M9JUChYdjsYVIpx703+v019FwniMUX
         mnzlkE38bB0+0Obx05HGXDKJKhgIJJgCL0VzWERIyw5AWVrI4/6D490kHGC7A0nw1qkZ
         /ZYSfJRywHGH66957Rj24qcV3I9fNOCI0BXWbSNjQ+93T1TDXfj7rQDF9U0E01EP2YYN
         MM6H1iwIFH2YjFoy1MgH2/g9hzwOPdQDl2qfPu+UQzlgqqEgEea5t24i7zOTFFtnqtFx
         GfJ8blYzO+gnBfv5J7MMhDhyfexNIxk/PTl2YI8k/c1k6qQpg3smpfIC4LY5yv7YVwV6
         BzsQ==
X-Gm-Message-State: AOJu0YyWP6/p8tKfxunlULE0D2KG40JA+RV4N+vany2diZfm2GNBcTCb
	B39+0Mu1c0fo8ltP5OaNnavxfMVHBNhCc30SPL+9DVBw+ICmRiXBybxThilUm1Wm22U=
X-Gm-Gg: ASbGnctn90ud/oSJZAy/BaoKnf5mKLZPyqrg+fwR/LZRsDVl09Ib26W4FjO0m3dL/gi
	HUmj7FC9mDa1nnOqG44awd5eH6VyvHI9uMPM3QkWkXqjd5p6y9ZuZBUVBaqgSHzN70zPZy5th5C
	ku7C76EyuWdZ+b1m2D8Ea9L3NHD6Zw1DsHO4SuZjX4QpFuCL+CqutVybIAI+j/DuJ4SsbvrRtxc
	JUSIR1GIsLfCnTBX7E6vb8G47AiJmHts3P6KHElNAnd/5Iv3LEK8SpEoOo8/LoVtgug80dLAepd
	xrUb7XNu9+QopxaaxLlg18DrbU48xC4VhFHbAb628ICi2sNuD73tPj+r8eBjjXgpXxx+X6/a/NW
	s4usjkBh27o5tNe3sCPPqabjgANp1nsuVR544gKs2U1s=
X-Google-Smtp-Source: AGHT+IFqjnnSjNF61C7EpeLGUx4nIzky6XYFQ0Y53PvynJQ0yLX0D7/wgkx/BTczmdLthOSq7BBieQ==
X-Received: by 2002:a05:600c:8010:b0:459:d8c2:80a6 with SMTP id 5b1f17b1804b1-45b4d85d6c8mr20573915e9.33.1755784409232;
        Thu, 21 Aug 2025 06:53:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e269d20sm14825015e9.2.2025.08.21.06.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:53:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RFC 0/3] phy: qcom: qmp-combo: set default qmpphy_mode from
 DT for Thinkpad HDMI support
Date: Thu, 21 Aug 2025 15:53:25 +0200
Message-Id: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANUkp2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyND3ZL8gsxk3QrDVAsDQwMD3YyU3Exd46QU0yTTpBSjFEszJaDOgqL
 UtMwKsKnRSkFuzkqxtbUAe9wO5GoAAAA=
X-Change-ID: 20250821-topic-x1e80100-hdmi-3bd5b5bd2d96
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=EuJCqC4vIrzzbiFdFQd34jpBkJ7TfEaSLO1NIgSU5T4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBopyTWErVXRbjkAObA+pRNthpmvFlxIHFVX1MJmq07
 4Z44uoGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKck1gAKCRB33NvayMhJ0bwAD/
 9ONMhZMYCagWX3zIDZDb3Pm9l0st1EhTIG0qMXmR7QI1+jUalRHvRtBKpR5hE7Yc8g1KBPf2flID0A
 qnL1K80I/ub6xYry25m7AoDU5ISiHsI/NlZU35FlgweT8jAM3illoiG6VOM8A8Hy32uakBlJVFvIlY
 lccXtjmeIIImXhiW9iC5JkzERBq2CFNRfK4EJ0O1S4ibUV+95GQLASfi9KR8ZKvankswFdmGfrt1eS
 /0Ud0+O68LZ8sWQPJYKuEj9r5UbMS7ZtD8HV7QKFQIbUgF8Q+Jqz6FlBcbHXW87/cyTqG5F/GpwmE6
 vEtYo5cNvmDmoCfPQ5II5wl1RjVMgH9uhFGAi2VNP0/4ksDhM1vIV5eqUT/2dpb/p/WcHXkue33iHy
 avqfdiupk1YDCoM+8y4hv/E8BniWyOP+aa3vES6gaUn0GBE4iVAuTudneZaUsF0VhEh+2Hfei/rZeJ
 cw4cDwldJffl0PHwc8J0R6yr2bPMDNGlbOjSr4EYrUeW6UUoWfzVBl0cZoWFbpxjUaLFlSZ2x5xzN4
 Ocztdwf9YU9RK44QA3rj16rSFT1NdtZiwTOfKyNu6/MMsC0vozE9qdW06yGYo76ir1oJt+kxJnFmAi
 BH1kWX8ctIU1bJ/uEUOFDZUSy0D69JKDjuojw7wmC7HQTrCHQhjuYmRJ14WQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
connected to the third QMP Combo PHY 4 lanes.

The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
of a combo glue to route either lanes to the 4 shared physical lanes.

The routing of the lanes can be:
- 2 DP + 2 USB3
- 4 DP
- 2 USB3

And the layout of the lanes can be swpped depending of an
eventual USB-C connector orientation.

Nevertheless those QMP Comby PHY can be statically used to
drive a DisplayPort connector, DP->HDMI bridge, USB3 A Connector...

But if a 4lanes DP->HDMI bridge is directly connected to the
QMP Comby PHY lanes, in the default routing 2 or the 4 lanes would
probbaly be USB3, making the DP->HDMI bridge non functional.

Support the property set set in which layout mode the QMP Comby PHY
should be as startup.

Finally Add all the data routing in DT, disable mode switching and specify
the QMP Combo PHY should be in DP-Only mode to route the 4 lanes to
the underlying DP phy.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (3):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document default phy mode
      phy: qcom: qmp-combo: get default qmpphy_mode from DT
      arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: add HDMI nodes

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 13 +++++++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 44 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 20 +++++++++-
 3 files changed, 76 insertions(+), 1 deletion(-)
---
base-commit: 7fa4d8dc380fbd81a9d702a855c50690c9c6442c
change-id: 20250821-topic-x1e80100-hdmi-3bd5b5bd2d96

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


