Return-Path: <linux-arm-msm+bounces-49389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEF7A45036
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 23:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 354D718926A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 22:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46193218ABB;
	Tue, 25 Feb 2025 22:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V/G2h6y6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCB7212FB4
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 22:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740522643; cv=none; b=JslAxzBJpc5stE2q0w+0mzxAspr4OlTyh1ypuvYXMbt4PR2B/alcBITbMQVPjj89IEkkekUBOaEwuA1y0pjQwbFGq8cGCUy78D6YFKcUqFk3IxLKtQddIFn7sJ/zZZvmEG5HUtkgCcD5TQcRcEQnmwDjUU4OA2TNzfYkJDxhYC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740522643; c=relaxed/simple;
	bh=oxaCiQCmqeAS1epekehXbElGJ+m3X0CqMo4HcDIs+cU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NQGaOjjYOlAivg4g1iN2eftJGIBWGQ7Ddi2+djL+p8lQNjMZRZjTo0k5kR6zSI41kfLz4i1tziuP3eHt2PP1VviefULQsFdXzKICE5BO1Nn6Z4V7vDiH2UANRlT/lh3uirAijHuBoLWyzGvwebgL5NR7fkOgi3WXgP3lZRNtXKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V/G2h6y6; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220c8cf98bbso45199355ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 14:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740522640; x=1741127440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CxPMcTd9qCEBN074ty2w+VRI4Bnqdaah0BYjoLFwE7k=;
        b=V/G2h6y6WpI9gq82abt50L/6j2hctNFDFTZRmxxfcq/BO+GOZB5XK9hd/wDJKyw68/
         MuyHdGZHGdBkNQ0nx0kGZ3EkLIj2dw1MoR7Xdsux5FoWwCUhT0m320Vjrn7CYMPLT9NV
         a1ljDIF3nG9wEYDOh6yxsFIDs50T8Tge7ncfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740522640; x=1741127440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxPMcTd9qCEBN074ty2w+VRI4Bnqdaah0BYjoLFwE7k=;
        b=NCPjv/VtJX0+NlHN+qWG92RreuBi2WtjGkD3eLglC2jEtt+U77iIP98JhpHcb+QS97
         4vCj5fVmf+RjqoIOhG4Hp/Pgsp4zx/ck9DwfsCAjf2rZ5fQiKqBmPZhf4eD4qtwh4Sob
         8keLok21sUlQ3iU9a2PDhElGt+VU3CUxZ+DsN8z/03HwbFkq4IZ5hv6yvQPJZFVg+PRH
         ZTsWELszirVc6gv5ov/pGCk7vCrrbE1tYDBb9mgMi68jeIbiGCIz/hBldx6Yu+9sIlSA
         hJaOC/3fwqP7tVZNoiS0qYnn8nbooxmslzCzTZiqIkP8rScwId0L+b1/oOzeB+3Wnis8
         diDw==
X-Forwarded-Encrypted: i=1; AJvYcCVQugUUWZVq3WI133N3T3JSnIyBVB27uAHrR2eN8rhbU+Hr6q4xuRqlYAsura9qGDoO/2xfqDj6XCYmTpJu@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp4y3GaTpBk0VQqtjX1cb+zu+d2/yA4vYxdIubVGlog3LnvLbm
	PrjbgHwEXNxWWg5wAidq2F/GcPjN87+9CpH2nLIktEF7B6m+P9wHnNLC/SW4bG6GME6W6FdWldY
	=
X-Gm-Gg: ASbGnctCs5udxx2QwdY8oHVS1T+2796bLdHVz7ZdHE+YMBvVkTQigTBvv/DFK4SLcLQ
	4EUcMj/S4+sEEHo0HrJqJaJfgYKJ+wPhTIBKMBkUZvcZ64U8vk3yZVBpGDggM7otXMA4bnOGitN
	Yk3Bh+CQuys4aWXT323qyrmqt1Ar1o/bDfJHZxhjHTuJIM6C/CbQP8Hbb3SzhDfsoYwrfJsoHHr
	1705OwQmQxljEgUCvt8WCQHGp4ORaKew1yDijF+AVi6s6SNCPgCpstxLyqDI24EttlnQ7HFHJUu
	y1S1fft7VRpWE3h+CpoRJA/TIIK+u/vFctR0xUdhleK94fZL2SvIrIeo62OkjHc1eA==
X-Google-Smtp-Source: AGHT+IGfycDzz2jrkUoYR/BFevUgFFIrZzQind7dUvVF1+Ua3fNlMG4d7Bly/f+2404A/5GyvlX3Qw==
X-Received: by 2002:a17:902:f64c:b0:21f:49f2:e33f with SMTP id d9443c01a7336-221a0ed7885mr305363575ad.21.1740522639971;
        Tue, 25 Feb 2025 14:30:39 -0800 (PST)
Received: from localhost (222.246.125.34.bc.googleusercontent.com. [34.125.246.222])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-aeda7c9079dsm1949830a12.23.2025.02.25.14.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 14:30:39 -0800 (PST)
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
Subject: [PATCH v5 0/2] arm64: dts: qcom: sc7180-trogdor: Wire up USB
Date: Tue, 25 Feb 2025 14:30:35 -0800
Message-ID: <20250225223038.879614-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
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

Changes from v4 https://lore.kernel.org/r/20250221233120.3596158-1-swboyd@chromium.org
 * Add newline after property before child node
 * Pick up ack from Konrad

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

 .../usb/google,usb-pogo-keyboard.yaml         |  68 ++++++++++
 .../dts/qcom/sc7180-trogdor-clamshell.dtsi    |  21 +++
 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  47 +++++++
 .../dts/qcom/sc7180-trogdor-detachable.dtsi   |  16 +++
 .../dts/qcom/sc7180-trogdor-homestar.dtsi     |  47 +++++++
 .../dts/qcom/sc7180-trogdor-kingoftown.dts    |  55 ++++++++
 .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  55 ++++++++
 .../boot/dts/qcom/sc7180-trogdor-pazquel.dtsi |  55 ++++++++
 .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |  44 +++++++
 .../qcom/sc7180-trogdor-quackingstick.dtsi    |  31 +++++
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  57 ++++++++-
 .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  |  47 +++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 121 ++++++++++++++++++
 13 files changed, 662 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
https://chromeos.dev


