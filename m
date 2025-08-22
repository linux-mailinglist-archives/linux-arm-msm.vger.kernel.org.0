Return-Path: <linux-arm-msm+bounces-70308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 923DEB31360
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08AB5B01529
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4614C2F5320;
	Fri, 22 Aug 2025 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PscnfzYr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597982EF652
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854947; cv=none; b=Npc095SuQbI3nNyPbEjZVPTSribLwOMc6UKBk55mmlfiA2s6O5o5rDXrgYtpy4nI3lugLFPtDDZYvGAppgUoCeVaCH0MY38y6qxV9hF0sn+m4BXnXzoDMRyMIZlG27XWzYp7cVfLHmtMX940H+xoMz52pluM3o4KjELQTl4SeOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854947; c=relaxed/simple;
	bh=59UJ9vti3y5HQowQ9v/ukvvTpxHZBBs6imD/48YGVbA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OxM+W3XU/BZ1rkR9KcIlqBB0qBodC7toy9hi9TNtHXE82MFsncEa+UOS5rOMoWz0NFIn/qqz0Zcom6fcnNzQrnkGAYdZAWo7dtQpZv3UmvfL9SU+M/f6SNN9drUBAPKp7WJ+m8+VDOYmqR0KJhi9ik86TUc4XJYK5jyMrKD8sbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PscnfzYr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b4d892175so8041795e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755854944; x=1756459744; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/D3BZdjh9JY8ctH8H47t9DwTnhsJG8Q7tetbG0g19Ok=;
        b=PscnfzYrMhLovR0YpNIQt4DZwDMDeAR7TtsuKf3f7+bPJY1xJCod5apGgXK7X2l74n
         WbYdpwqoaSs8bHm0C6UFgMXPDRvL6rXXxmqT1jQXcjJ30pR3GAC2SnVI4I5fyWvLd1r2
         AqkuiVGvsZEki1pENWNeJIPdYmVXIpIzfthV0unij21WK1q2IFrgNsFOtUwrUotJRlJh
         +DYCWkgPnNfLokZHljzy7gDlHIa4IuAb85RQUDHqB9fFbxp6W72nuN5CuP9Jyds2aIYy
         0asUpbDkvtQVbPgwb5+F0v3/ID+345PtB9WH97osmovYjHNj6D8XC6myxUEm7vVY6xFX
         GJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854944; x=1756459744;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/D3BZdjh9JY8ctH8H47t9DwTnhsJG8Q7tetbG0g19Ok=;
        b=iSyTMXp0+MkTuNuXIM8wXEH+NG+oSwbLXI8Zn4jTx7x78Lo9IdnH32ljIVA38wpaA0
         MIpt2cG7KHMY0M2TfJUjefijxGTrRLKmQlAS078hqTKj00PuXzUb64aJ0wL774ftSclL
         xg/I//Upr6RkV5oiX9frvaZHH5yk8bwxP97ryDoBXu05O8UVx9/h2Que0mirfqOShN0j
         Z8tOn7l7b3MvchAsXJAp8mrZUoOzuDkMjNi9M07D39eLivJe1uWOWOFxRP/FicPW1i2e
         OqnJkXnxsV/wxB37T8R9KldcR1j8fP2vZUYxBflMeVmC09E+AA1GjpGohHNhyh+eRSW2
         epOA==
X-Forwarded-Encrypted: i=1; AJvYcCW7GQzbpw+VDE2gEqo5XGOTkYXz5Yl9pV1epOY+ZTh/54dX0IOV95MzyaqC6+ezKbDJxKWp/tDblpV1KSNi@vger.kernel.org
X-Gm-Message-State: AOJu0YyOC+Siw01Ef+Y8d3feZPrmSCAzU0/Q3BL4GEbdlML6QWoyHWbz
	IlW189X9A7oYl5KPq+ooKQdaIeRox2IsMIq9AdOUlwah9RIBcABe/1d6saDefWs3aZQ=
X-Gm-Gg: ASbGncsxFPSa5E/NB7OUjH/mOgcB0rH1FHeXI/Iodm32IaJDeNZtZOrdDDFkkqq1qtP
	dkAMGNg+kYASyqrupFXEuiQFpk1WEgzQ+SdoO/6dAe67wFSWyJR15fPmVvVlDX4ynMsB1qFpYCU
	lmTGIXACqSLSE9rMNQb+/aVZvQpQd6m3EQdZdtQt9TQQ5s0FFuFKynfAZPGy7foGLAEJ/YrcjFc
	Hn7ee4Qu4ObSnlJenRglkJmjgbx6CDRMyNLq5e9ZGxMXv9iWqbqel7Gi5vwP6XQaUywuqCSFjjG
	ld9kc0MSp+Ae192N4NMqQIPCZUp1F1qlZEZ3nJMSgavG8a9i46CLtid+EB3ZVQX//30wsrRHg5U
	UA83M5XwhACcYCqeUE8qCpPE2ZnffSP2GIwqx+g==
X-Google-Smtp-Source: AGHT+IEDZwDvwedlmRbHo8vijFqxjapX7lnz425tPxCqmfGgoZonCtmTk3StURpDZRJwaZjUyT4V2w==
X-Received: by 2002:a05:600c:8b0e:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-45b53594498mr12969975e9.1.1755854943541;
        Fri, 22 Aug 2025 02:29:03 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:c671:531c:f2ff:2a7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e269d20sm33831805e9.2.2025.08.22.02.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:29:03 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH v2 00/10] arm64: dts: qcom: x1: Add missing pinctrl for eDP
 HPD
Date: Fri, 22 Aug 2025 11:28:51 +0200
Message-Id: <20250822-x1e80100-add-edp-hpd-v2-0-6310176239a6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFM4qGgC/22NQQqDMBBFryKz7pRJNK266j2Ki9SMOlBMSIpYx
 Ls3Fbrr8j3472+QOAonaIsNIi+SxM8Z9KmAfrLzyCguM2jShmpV4qq4JkWE1jlkF3AKDhulqem
 NpasmyNMQeZD1yN67zJOkl4/v42VRX/sLVv+Di8IsjK6pcg9TDpfbU2Yb/dnHEbp93z8qAn0Du
 QAAAA==
X-Change-ID: 20250813-x1e80100-add-edp-hpd-91209c5a0720
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Abel Vesa <abel.vesa@linaro.org>, Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Christopher Obbard <christopher.obbard@linaro.org>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2

At the moment, we indirectly rely on the boot firmware to set up the
pinctrl for the eDP HPD line coming from the internal display. If the boot
firmware does not configure the display (e.g. because a different display
is selected for output in the UEFI settings), then the display fails to
come up and there are several errors in the kernel log:

 [drm:dpu_encoder_phys_vid_wait_for_commit_done:544] [dpu error]vblank timeout: 80020041
 [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
 [drm:dpu_encoder_frame_done_timeout:2715] [dpu error]enc40 frame done timeout
 ...

Fix this by adding the missing pinctrl for gpio119 for all the boards
supported upstream, using a &edp0_hpd_default template in x1e80100.dtsi.

I ran into this issue on the X1E CRD while testing some things and had this
fix in my local tree for a while. Chris made a similar patch for the T14s
[1], this series fixes up all of the boards upstream.

[1]: https://lore.kernel.org/linux-arm-msm/20250731-wip-obbardc-qcom-t14s-oled-panel-v6-1-4782074104d1@linaro.org/

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Changes in v2:
- Define &edp0_hpd_default template in the SoC dtsi and only reference it
  individually for each board, since it is exactly the same for all the
  boards upstream anyway (Dmitry)
- The resulting DTBs are functionally still the same, so pick up tags from
  previous version.
- Link to v1: https://lore.kernel.org/r/20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org

---
Stephan Gerhold (10):
      arm64: dts: qcom: x1e80100: Add pinctrl template for eDP0 HPD
      arm64: dts: qcom: x1-asus-zenbook-a14: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1-crd: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1e80100-asus-vivobook-s15: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1e80100-hp-omnibook-x14: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1e80100-microsoft-romulus: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1e80100-qcp: Add missing pinctrl for eDP HPD

 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi           | 3 +++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi                        | 3 +++
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 3 +++
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts     | 3 +++
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts       | 3 +++
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts       | 3 +++
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts    | 3 +++
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi    | 3 +++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                   | 3 +++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi                      | 6 ++++++
 10 files changed, 33 insertions(+)
---
base-commit: 1aa50d938e88fcad1312467bd09be4037bfe68ff
change-id: 20250813-x1e80100-add-edp-hpd-91209c5a0720

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


