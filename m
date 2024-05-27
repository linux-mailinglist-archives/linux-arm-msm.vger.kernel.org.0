Return-Path: <linux-arm-msm+bounces-20547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 731FD8CFBDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 10:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B5F6282369
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 08:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C9B6BFB8;
	Mon, 27 May 2024 08:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ARuiEhaQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E367D13AA2E
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 08:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716799365; cv=none; b=DyQmUXYJSKKKv485C5Em2HLBr9avHpiMdVcyAOM75jDL+gN0dA6xadt/iQJMhwQvlJj/TtStAFi1HhGcmTAmvLcfXb9NFtwMC3dMfN0EZB9ILSIJ1aQfVc8htEYbPJDfG76B0EuC/ylTZL4UVQPBSq/NoRVTyKWMyyzCT5kjCic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716799365; c=relaxed/simple;
	bh=ShNumuEqHFtQaXqkFlIDAFs1IqCQ3du3nnDnxol1h5Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YjvIrJllQZiEohwyK6bbARoM6lAhk2v/f94Wb+y4VvcQV8S3fjX8MixD0OiZpKQOKF0SjJn9RHKcL27SVT0+t3zVz38nVabxox0Y8J3ydwpvnZ4MSxusf2gCusH3OMFqflYa+g/lExW2AOkpVJTZRKjtjOOaJjzS/bLmwK8alKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ARuiEhaQ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-354de3c5d00so2467776f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 01:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716799362; x=1717404162; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v6Gc+kT2JekTX9NL/YClyq4Cu4TmQMdt+1e1Ze3dy8w=;
        b=ARuiEhaQ80HFAoGZ0cA4k2mQZTE/HWLxNwRiTjYxdABoH2oluXFZq81X/nAJbwjBHI
         fZ2TGq8Q0dy/06DTJCvU+YjoMioVT4O6N4H09BKD5LjuA0atd5djyrO9l8p/SAAoVxDE
         UlrEH3ve1bWGZ352jxqlP0pEXEg3wRD4QU64tvZmgmKEaUlbJEynCZnrXvNdbYJM8BeU
         0oJefg5h7QawiPRwu0H0ROWAXVBlzcIhEDQ5NVUflRlp6vIvjQAZFly1itxSZHrl6cZs
         lUC3i88UIurf3srRQ5OzWe6u3BCOPb6Ru1oVc5Fp9M3xf+r1QC6seIN0EIad0+z24edE
         TIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716799362; x=1717404162;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6Gc+kT2JekTX9NL/YClyq4Cu4TmQMdt+1e1Ze3dy8w=;
        b=oZ4DWwVQ9/nmrg0ZajkQanBDsdKjqmvxGHjxlQSl6G20rAukn0JnBCg9iYifKShkQf
         H1rXimFDOS0ZcCr3SIqu31ea+zROuiY/arU7q4uhyDrRH36adqddrlELTlt6ZkgJDNAs
         E3jqRXLjaV2tLmwpoybuGlKxCBdkLXP5g2uLAYl3UrekPvhafMyhFWRDrVAojr1nS7Xj
         /Oun/9RcRF1fIZNxMJjORfmjndutVHMoDyShbq3DbjKcoCmjRuztQ3YrOR9+sOjkoHLh
         ZK2J2DTOjdzhMluy0l6iy+1MKoOt7t0yZ86b0zIOinr9w159zp3Y9ddQzIW1IwStpyNr
         Oc3w==
X-Gm-Message-State: AOJu0YwjdrIrX8qKt4dG7oqGru20dN9mVK+HGrpy1G0Bnrdomdkkx4Ur
	pii6IIr9NBDbO/utSP01DY6slI2RyS5jYzAKJ8yeJibnGxFtyrjVerrX3Glj3+c=
X-Google-Smtp-Source: AGHT+IE/gbYd8CmEJe1Fnu3+bm4ciMI00a+mz01IIfc82xZMwUel0Jl18pHTsHxDsU+h61BBkMmsJA==
X-Received: by 2002:adf:b608:0:b0:35a:62e3:710d with SMTP id ffacd0b85a97d-35a62e37412mr160188f8f.28.1716799362005;
        Mon, 27 May 2024 01:42:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3558889fb57sm8447292f8f.114.2024.05.27.01.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:42:41 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/7] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
Date: Mon, 27 May 2024 10:42:32 +0200
Message-Id: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHhHVGYC/52NQQ6CMBBFr0K6dkw7QARX3sOwKHWESSxt2kIgh
 LtbOYL5q/cX7+0iUmCK4l7sItDCkd2UAS+FMKOeBgJ+ZRYosZKILSTn2UC0zVpLmH1MgbQFP25
 gnO0dpM2TATuvUKq+xjxVmlZknw/05vVsPbvMI8fkwnamF/V7/6ksCiTIG2GlsVRNJR8fnnRwV
 xcG0R3H8QUlPzwb4wAAAA==
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3510;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ShNumuEqHFtQaXqkFlIDAFs1IqCQ3du3nnDnxol1h5Y=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmVEd7QtwNlGO1CbXCgSWwpHXk0bJO6vEQQKIXjTdM
 1vXDDTyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZlRHewAKCRB33NvayMhJ0TpDEA
 CFHOekFof52PWcrjj7sU0m2q+u0kpEdqyx08ZwgvQTTeUyuRRsfrzZoGLTrqjDhdlOgIWK/hZJmY4W
 mCo0btwkv0j8MSKCrRNKWwFq9/bwj6xF3/lXqFl4Y05lxNt8ai4VS0rmz/qzIZK24GggZ6XvGoiFMr
 xwRw8h95wjra1PqrTXnCpfdNfYH4sO6Fr7kmzgno7K/KCOUEzvbQFBAOTxQGwJMNYO7iNxfDkOfmQ4
 OuW+wWa5HgopQZ3kcbWAr/jRRMIHLkD4xVQyypp0vRvu9ONd5FWG3WVc/xve9Syl4g+wYghuKhPYPg
 p5ZqVVQSTzIe9pgrI+wUls9iNZZw3URiHRaGgMo/2RzDQ+2bR1mqh+YGzChdb2jjklL6wOXcLBY9l9
 ex+X398Sg62iAUWjrakX6p9X4h9UY2BulA4+RiUYcsJc8UJo0ANzfyYcpAnx2MROcNihs2jRJ16Ttc
 PJrjH/bt9WsPDO3M9Oj8Ce/0/5uPdNgLQtXe+i9IxQVMAJwCpXyoEZGVEa/q/x3mPRWvbBbQelUvXD
 qa7DJBh/Diaj9BYCxUzzgmB+1N7IAwOoyybp8RU0SUCWlYi+1ys43B080BpY407Dg7OQ9FH2dYIpn3
 4tfC9PWINs21ng9xOi+DYlQjjtVj8UujKJi6FxnderPp+ogIIv9DZ5k0ngBg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Register a typec mux in order to change the PHY mode on the Type-C
mux events depending on the mode and the svid when in Altmode setup.

The DisplayPort phy should be left enabled if is still powered on
by the DRM DisplayPort controller, so bail out until the DisplayPort
PHY is not powered off.

The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
will be set in between of USB-Only, Combo and DisplayPort Only so
this will leave enough time to the DRM DisplayPort controller to
turn of the DisplayPort PHY.

The patchset also includes bindings changes and DT changes.

This has been successfully tested on an SM8550 board, but the
Thinkpad X13s deserved testing between non-PD USB, non-PD DisplayPort,
PD USB Hubs and PD Altmode Dongles to make sure the switch works
as expected.

The DisplayPort 4 lanes setup can be check with:
$ cat /sys/kernel/debug/dri/ae01000.display-controller/DP-1/dp_debug
	name = msm_dp
	drm_dp_link
		rate = 540000
		num_lanes = 4
...

This patchset depends on [1] to allow broadcasting the type-c mode
to the PHY, otherwise the PHY will keep the combo state while the
retimer would setup the 4 lanes in DP mode.

[1] https://lore.kernel.org/all/20240527-topic-sm8x50-upstream-retimer-broadcast-mode-v1-0-79ec91381aba@linaro.org/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Changes in v2:
- Reference usb-switch.yaml in bindings patch
- Fix switch/case indenting
- Check svid for USB_TYPEC_DP_SID
- Fix X13s patch subject
- Update SM8650 patch to enable 4 lanes on HDK aswell
- Link to v1: https://lore.kernel.org/r/20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org

---
Neil Armstrong (7):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch
      phy: qcom: qmp-combo: store DP phy power state
      phy: qcom: qmp-combo: introduce QPHY_MODE
      phy: qcom: qmp-combo: register a typec mux to change the QPHY_MODE
      arm64: dts: qcom-sm8550: allow 4 lanes for DisplayPort and enable QMP PHY mode-switch
      arm64: dts: qcom-sm8650: allow 4 lanes for DisplayPort and enable QMP PHY mode-switch
      arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13: allow 4 lanes for DisplayPort and enable QMP PHY mode-switch

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   7 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   6 +-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |   3 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |   3 +-
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |   3 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   3 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 169 +++++++++++++++++++--
 7 files changed, 174 insertions(+), 20 deletions(-)
---
base-commit: d4eef8b2e18d3e4d2343fb3bb975f8ac4522129a
change-id: 20240229-topic-sm8x50-upstream-phy-combo-typec-mux-31b5252513c9

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


