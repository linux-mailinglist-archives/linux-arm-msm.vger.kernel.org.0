Return-Path: <linux-arm-msm+bounces-47494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7154FA2FDE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 23:57:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 224A5165D98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 22:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7886825A2A0;
	Mon, 10 Feb 2025 22:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EXLycxGj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E8B259486
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 22:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739228239; cv=none; b=QXTkztGIEFJJA39eepUTsRPeo8MZ2Syc0o0LuCfyggDqkTF4n2Vr8yn7jUUCl31utL8m9ZvqyA0B7yEc5LwmdmunGUJO0DvkEurWUkzSFc8KqCJp914dKxZ1CmQsOVPoqDn99zZmmypaWOBx78AJ6JPtJ7/jG7TdqvR636wVpD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739228239; c=relaxed/simple;
	bh=P8Z9KGZ1EY/Aam7wC/XcwEohXdrrV9mPxenYs5nNxZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bJS6xR+mPbVdc2/w/MofWsjDaqy4/9UJ2iXRVFhPmNX4eKijgarENv5gADQzGiCdofK3nejbIcSJjdaB1160kangTo8MiIFeiIMuPd+zc7FVFVsdWHaVq9BdaTHg7mbXpgUFlQs+B6U7eDzu4gOeNQB2O5TO91KiHkLy/0uxyO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EXLycxGj; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f2f386cbeso90865795ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 14:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739228236; x=1739833036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AEi5P1T/woClFPNOO/HVfADRLd3wrZGmG1KagX0zqo0=;
        b=EXLycxGjiXenlEfRtNCGKg8kgcB51UrtvUPDtAmWQNvloa+lva1ykWClU0hGhdgQeV
         szfSI0SYiz59EYc3c8LCLL/CIl6fFceU4EEG2/gzeVWdY1asznV9Ya6kbUzPbHFrVjxm
         fvsoCX5SOzJ68fwcbvyvkwkIDmYtUjTkp8Z5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739228236; x=1739833036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEi5P1T/woClFPNOO/HVfADRLd3wrZGmG1KagX0zqo0=;
        b=YXQb/IMlB4ravKZ9UQI0j34RWfQNjsaI884Db4mG5X9ZEj0cCuoilY0AruYyEmOnD4
         nnCgyTP23+egIf+WCdpOgD7IRLuwd9N5SGVMLV5GCwuMMObafU6PAB8Q2DS0DnaMSpFZ
         Z/hryIfUHl45KubJQxyfSSyzL/y29iZ8EQQEbsHjBoC/fVYJW8WDxLGzdYbO/263fa7I
         5ATuo1/De1mI44khXc/odZkC20QJ6byZDoLapaCv0R3eV7gdC83yQpvlRQt6HlQ3zmZS
         DzCDuqYmhU7CMia2hcR33b6C7i/1zf5e9NiW9CPl6LDLX0jEoGCW97A29vp3PgM0+XD7
         fbkw==
X-Forwarded-Encrypted: i=1; AJvYcCVHq8TUIr3jq1J8DFp8V0cNiUWniLq4hi4gHM5aQUAXw/x7H2Jn7n9Q0EZVWIaDhKbknsV79RAUztSpxooQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxiejZAEDcOLJ/hQbasSbQWdNgZ7piyy0BjK6ZZR1i8XYxKwRqt
	p++28YELd0qpPiVJMenEgK9VhTfWNLJpkMl0Kz8skTBHgYwLECOQUqoz1yD+xQ==
X-Gm-Gg: ASbGnctD0lWr2Q/Am4398KSoR9zS62BoQl6qbe9FRmXx/Pt9fWz7PopaLjR36jkCSG+
	wKHdV54K6e9qk9kdvE8pO5Q8UH3ztX3wx93yC66OU1QCvvvNWWunKaRtuB1hVjidNpLC7ThorqM
	dh5qZCdsBi+XpY3bfJ1IgjlghMJXW3A9YZq34KXIrPYKe1S67K+DWDgMFsiATTUKtk7UeSMYR1+
	FaveTVwHoeze3vpWy5mz5hos8gDWKXKHwjqyq5hxKSrHko9idPIShGRR7mYEN//YIJYYNSJa8h/
	1RoeXw0G7olv7hqX4NAuf84Ttjo+7cMgAHV6K6wZtN0liRJKHovrD6w=
X-Google-Smtp-Source: AGHT+IF8+s1/Z9sleMTgtclTYSbjSD/tnuHHmxKYPG/4ilaOLCGwVt7wyP8vgrrgEddtg2CGTPOIWw==
X-Received: by 2002:a05:6a20:c88d:b0:1e1:f281:8cf5 with SMTP id adf61e73a8af0-1ee038c73a1mr27458604637.0.1739228235665;
        Mon, 10 Feb 2025 14:57:15 -0800 (PST)
Received: from localhost (222.246.125.34.bc.googleusercontent.com. [34.125.246.222])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7308a05f754sm3007589b3a.153.2025.02.10.14.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 14:57:15 -0800 (PST)
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
Subject: [PATCH v3 0/2] arm64: dts: qcom: sc7180-trogdor: Wire up USB
Date: Mon, 10 Feb 2025 14:57:10 -0800
Message-ID: <20250210225714.1073618-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
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

Chamges from v2 https://lore.kernel.org/r/20250205233016.1600517-1-swboyd@chromium.org
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


