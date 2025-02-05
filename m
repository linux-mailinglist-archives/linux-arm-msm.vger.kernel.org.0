Return-Path: <linux-arm-msm+bounces-46987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D06A29D89
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 00:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3DFD166AF2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 23:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66FB217719;
	Wed,  5 Feb 2025 23:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G8K7xFkS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4531519B7
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Feb 2025 23:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738798223; cv=none; b=ERvDpDvrUki46XwDnXUWU3CLVWpNiqGv1OH5RRVE7V+dJG4ZRcdEBR7Ty4rubuKoT/x8KsaHIZy0w7teLQEBgKes0fLRHHxsRTlMOx6ONtmMEm6vl3R6XLjxcxDAMrgJv8AvTn7FlGWaLJ08ypPGunBMtX/pWHjCgpd8pbr5qBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738798223; c=relaxed/simple;
	bh=w0KqSvz4LKHnh40uBElw2aDPtTJnsxo3kIyaKh2DPsc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dx+t7lFlxKJ9UD4hRlYxDl757Hto1dC6MeCI/iCrl2yAtgBee03ra3ZHxPqeWd87EHUMW9JtRJ0K4OekHh+xc5nQKHemTsJXHy3AtAeGQvh7v9Qs7p4EPY8p6VLlJL97AKyii5iFzs9VmPNk7tlJOpWWlJ0e2O6UVZweKgdZyaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G8K7xFkS; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2165cb60719so6634305ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2025 15:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738798221; x=1739403021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LfrhKTgFStXH2HCRNCmE3wFhveRGNarb8z2r9ekUmYk=;
        b=G8K7xFkS9DuuuqiTbKM2/I6RKho/2q6A4LHzAMUYv1Y+aqRn8L3s3W40Qe1PlOiriZ
         Pb9xj4XlSoYS7m0KwTbzsFtM1yBeIEAf2uQ4OpzB4kUYDhkxRUAci1y6fZytaOux9eS6
         +73kwQbLtB6iXZYoD63KWYVt2atZCXrQE110M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738798221; x=1739403021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfrhKTgFStXH2HCRNCmE3wFhveRGNarb8z2r9ekUmYk=;
        b=PUMZ0nJiKbC+h6LyO8cpTgl0CwVXVXeFWGc3q8XgZf2e7I28qVyOubYXHW4+Y7BPKy
         QpLko2Qb24mpIL/KDOKXXj/Tkferaka6lL7jQA1f57dxrhX8ZbEAHNlK10m95ASMN3BF
         17a7UWJ5imqTmJkyMmVnV6jkW+WGfST1POFp+9h9M39YdThXrY4S5ZMASUAGapQO/9ih
         ZAt9dGOIJPgoYTnHmviAxZuzKpBXVGMjYdauGaR9BTSzKBltQBG9Q+eeVtkTWSZlaEfP
         n4670GVhXrShXwQP1jpKNbz6vh2LEb00YrIwj4fyXgXELHozUwwgHY55eaHNfzSPJA8C
         sdAw==
X-Forwarded-Encrypted: i=1; AJvYcCWNf2/+tbfIDaBbMH3jx4tu7SxXi11BMGSzbHbDSR3KagHHTCVCuSgChVu9gri1pU7Ii3tJlMLEh3yHLPYr@vger.kernel.org
X-Gm-Message-State: AOJu0YydNknfSx9FKtmCk9U6WlNMIaPTw8UBif1YzI87Bt0tCXoaNEgm
	3MxcACax0r7TrUi1Y7JWgXOhnRiwi7hMg3aR2nwfZCR1CpgFIEfaZFB0r74Shg==
X-Gm-Gg: ASbGncuJ7zqLx2rbOfD6ihGBG3ZMbCXBRh/i40PoXYk9Zs2VgyZEuvfhEAmCuilUMaB
	55AgkskJGyDdaSXOYqbiFntPJ9ZmTsbNXI4E6IO2+/jFRDA6ADgpGYXp2C/tbDj4zhorlnalnk9
	drsx0odRnMkFBqrqwMTIZH8RVh3lDVR6Y9tk3LavZhmkO2IBWDLjNhRp/xpK7EBqyQMwQZBR+t1
	Ox6+torMLC6lNxk64jH8fOLeA5dw1qKa0rMZTMA7zP8xn9Vpgbp6mQLheSuONBLtixMrCNW1WBO
	TfszsCJwUFqnQJyOavygSmtcQurhd2RptRIo/43/iW2LLhQAsGHayEU=
X-Google-Smtp-Source: AGHT+IHUo+FqElUk1sltTHIWznB6GdIP99OTajELLS9rXgQ0/Ee3VmZ7ONPYnmSuxZTKWCv2pLwwGg==
X-Received: by 2002:a05:6a20:3d93:b0:1eb:3661:da3b with SMTP id adf61e73a8af0-1ede88ad4a8mr7472061637.33.1738798219826;
        Wed, 05 Feb 2025 15:30:19 -0800 (PST)
Received: from localhost (129.135.125.34.bc.googleusercontent.com. [34.125.135.129])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73048ae7f79sm15435b3a.77.2025.02.05.15.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 15:30:19 -0800 (PST)
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
Subject: [PATCH v2 0/2] arm64: dts: qcom: sc7180-trogdor: Wire up USB
Date: Wed,  5 Feb 2025 15:30:13 -0800
Message-ID: <20250205233016.1600517-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
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
cros-ec-typec node.

The first patch adds the pogo pin binding to describe the detachable
keyboards found on some trogdor devices (actually strongbad). The second
patch is the dts changes required to wire up all the USB stuff. This is
sufficient to set the connect_type and removable sysfs properties of USB
devices.

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
  dt-bindings: chrome: Add binding for ChromeOS Pogo pin connector
  arm64: dts: qcom: sc7180-trogdor: Wire up USB to usb-c-connectors

 .../chrome/google,pogo-pin-connector.yaml     |  68 +++++++++++
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
 create mode 100644 Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
https://chromeos.dev


