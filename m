Return-Path: <linux-arm-msm+bounces-49001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 510DDA40376
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 00:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AEC17ABB32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 23:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BDB2046A7;
	Fri, 21 Feb 2025 23:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RZtL8cRR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36991E282D
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 23:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740180685; cv=none; b=I0VLVvadR1aEaorLsbsj12yx/f/i0Jg+xHak4y7Uya+SzsLH09ruP21IvLRoPv12heqXsi74cCfAKaMjIoG//Feb0JJSICG3Pmi1vs3fWh3oD27nZMUiSr7Fsrjj3zzs/duERw1of4kl092tM97+djff27HSSxZLwYEFrWuw2DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740180685; c=relaxed/simple;
	bh=f51eqVy7xwWHEuczDtwNNkEGNpGXp5mse0YoxqxxuSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pvm9Ur1SeeTMVgUA6riAL9iCGYjyx6zKBR3g1bg72bwSLRb8AXKY1wrRY6kAFPoVdzeRIz/2GybJw/kMR8THcBM2y8gvRdHlXaednRX9cK9q96sTXCiVCnlCnxRBsGXB9U586ePO5Cqh3Rykj5CKZqsvTLmVUbUDqcltMW9JsGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RZtL8cRR; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-220ec47991aso37358105ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 15:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740180683; x=1740785483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=81FA3e/JZjjDAMLf5iojUcA5/pLMU3O5i7ad+AEyuhI=;
        b=RZtL8cRRevN4bA/z4199K3c/ybJuHlTdFkv3Owb9C4PomGVsLNBL2j8Sgdbf403ZeT
         ZC2GtdKsvFGGbMiApOG5lwfkWvbSOOEWrKAyRKWAfUssSfmUorrN8xxFQ0JuSACY9CAP
         QSXFJPyF7CAj3SdSefLZbnyM2v10dz4qXBrpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740180683; x=1740785483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81FA3e/JZjjDAMLf5iojUcA5/pLMU3O5i7ad+AEyuhI=;
        b=Thi+URpKtKEQPag5drD0ZYw+Lias3mCMsAA5eWFwLMJGM02LMiZ/uRygf8WWbZA3SM
         kNg/I5yk3IN5e5c9AHaP9HCSKFm7X4D1A4wZP9AkrUC2tr1L6CGWrwZmQZxXnHwsFjvQ
         kCPgX7Nh+ysAFeSwh+Sdz8D7pkT+UmqPaGlvLY22t95l+9j6Cm8GHnKddOd4DCk7Dd+k
         tW78av6lvUW6Y/3bawJDS1wXdsvuIkkqnKDJTbhRYZ9VRVL6lNqYmTzOO0+KmAdU/UkE
         6xDD7ebk2UhVlAStQo8RCAG7SXFWSzsLz/5dNCNAgIjgIT3mI1/68oGr23HoM5VIac35
         Qv/g==
X-Forwarded-Encrypted: i=1; AJvYcCVsBhfYnmg79SMB1n420UF1HVC8z4vUItEFlWhN693OFlALWBR6qo/YJaa/STWx+8weiAWaVRMiprIhJN0+@vger.kernel.org
X-Gm-Message-State: AOJu0YwKUMHELMvabOq7f1hzLBhGFimGgFwLB3PQZhKfaLw24ReUwWzM
	CNvkzVkYMJA6tkpTUPM3b3Wr6QBnd8eLE+ZvbdAU7xl6sGJ5cMYQw7PEJVflIA==
X-Gm-Gg: ASbGnculbNQ6h+SCD0Ns5niVBHs74STn2izJmUItUFPKAMdfvcuX3vdQolf/reHK2aP
	0heNweJjzRLG9g0gQcIR7IhIi/Gm92prIMdieOhoOtm928RG9YVBAf8cS/S/ZUJjaBnMYj/YY5z
	aEkmKxW/QgtEp8ufN/s0cZOzl/+V32Taig9H26W/d23W1kRFscUsjbP/06GKrmyv2U87BDqTB+Z
	1PBA80WmVqnkG2/DtN6G0tVJzMTGt3wdykCIfyF/mIpLdZ7+QCAt9mzBP/NfshLvsVpPhpnski1
	i6fhhAyw7yyLUhncnl86/RmlMlU47w3ftZRlr9LxpM/+ZbUrM4YCwQCBuzW5+sdw2A==
X-Google-Smtp-Source: AGHT+IGkH7xMxeGNr82l2STxZJtAA8Gv2n4NyOTr4CeAZCvwgPvVhf6sJzdIj4GQWhVoUq34JljyhA==
X-Received: by 2002:a17:902:ce8a:b0:216:760c:3879 with SMTP id d9443c01a7336-2219ffc00c1mr74674785ad.46.1740180683043;
        Fri, 21 Feb 2025 15:31:23 -0800 (PST)
Received: from localhost (222.246.125.34.bc.googleusercontent.com. [34.125.246.222])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2210001ea01sm113953455ad.176.2025.02.21.15.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 15:31:21 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>,
	cros-qcom-dts-watchers@chromium.org
Subject: [PATCH v4 0/2] arm64: dts: qcom: sc7180-trogdor: Wire up USB
Date: Fri, 21 Feb 2025 15:31:13 -0800
Message-ID: <20250221233120.3596158-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wiring up the USB hub to the connectors allows us to gain the proper
'connect_type' and 'removable' values in sysfs for the USB devices on
sc7180 trogdor devices. These two patches are split off of a larger
series[1] so they can land faster and because we've come to the
conclusion that the DisplayPort path is going to connect to the
cros-ec-typec node, not the usb-c-connector node.

The first patch adds the pogo pin binding to describe the detachable
keyboards found on some trogdor devices (actually strongbad). The second
patch is the dts changes required to wire up all the USB stuff. This is
sufficient to set the sysfs properties for USB devices so that the
builtin USB webcam is considered "fixed" or hard-wired while devices
plugged into the connectors or the keyboard are considered "removable"
or hotpluggable.

Changes from v3 https://lore.kernel.org/r/20250210225714.1073618-1-swboyd@chromium.org
 * Consistent quotes in binding
 * Drop unused labels on hub ports

Changes from v2 https://lore.kernel.org/r/20250205233016.1600517-1-swboyd@chromium.org
 * Make binding specific to keyboard and move to usb/
 * Update dts to reflect new compatible string for pogo pin keyboard

Changes from v1 https://lore.kernel.org/r/20240210070934.2549994-1-swboyd@chromium.org
 * Split out of larger series
 * Added description to DT binding
 * Removed DP part of dts changes

[1] https://lore.kernel.org/r/20240210070934.2549994-1-swboyd@chromium.org

Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: <devicetree@vger.kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: <cros-qcom-dts-watchers@chromium.org>

Stephen Boyd (2):
  dt-bindings: usb: Add binding for ChromeOS Pogo pin keyboard connector
  arm64: dts: qcom: sc7180-trogdor: Wire up USB to usb-c-connectors

 .../usb/google,usb-pogo-keyboard.yaml         |  68 +++++++++++
 .../dts/qcom/sc7180-trogdor-clamshell.dtsi    |  21 ++++
 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  47 ++++++++
 .../dts/qcom/sc7180-trogdor-detachable.dtsi   |  15 +++
 .../dts/qcom/sc7180-trogdor-homestar.dtsi     |  47 ++++++++
 .../dts/qcom/sc7180-trogdor-kingoftown.dts    |  55 +++++++++
 .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  55 +++++++++
 .../boot/dts/qcom/sc7180-trogdor-pazquel.dtsi |  55 +++++++++
 .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |  44 +++++++
 .../qcom/sc7180-trogdor-quackingstick.dtsi    |  31 +++++
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  56 ++++++++-
 .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  |  47 ++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 109 ++++++++++++++++++
 13 files changed, 648 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
https://chromeos.dev


