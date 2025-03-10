Return-Path: <linux-arm-msm+bounces-50846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B04A59747
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 15:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD2393ABDBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 14:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27454211C;
	Mon, 10 Mar 2025 14:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y2S9Tz16"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF3B22C35D
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 14:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741616121; cv=none; b=uy02eGEQrVi/6JY0tIqgFQ6K5yAQdbym5h7zniOWdpGNGT/ooyUaJQVgL/Z6SttrChWKsR56w33I95GB0OF3Sh89YmBu25J8kkXORB7HZbcYNiP53z4mB/15xBRreE8xLarVWrKgouEsZp0HT1DgtaI3dc1DeSEG+Y//N1DCStc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741616121; c=relaxed/simple;
	bh=0cnSqb4EHHZH1jZBocUugKDbkHDTwqCmWiPGEzjYk3I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pNWDtzayiiAH/pal/JU9HeUSBw8M+nhoVj3EKraJ/WqHXYNmJObmgVn2W8bCDctWpIaZcI1xofRt9A+akCmu1MkaDMSyrvNUNhOpSkTNK3w+cfJSjgzHyiNLjM2tTpYolUkCw/vRg2uK2zao4doH5yAwxp8tvWE1Liy7C3hiv04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y2S9Tz16; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso535669f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 07:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741616116; x=1742220916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oiOvI1jdSHYxDi7DOGuskPixkiPIYyxQOmAzG/sEzYk=;
        b=y2S9Tz16E7Ok9SWlYeU+1GkjzYLpSj4xLpoL4ZJkTlJokLP8NpQvuaD0mN7u0nOWR9
         7veEt7+suL8RjFXm7lJLZmxzcPBD9sQx2pI0ScJmhdq8UXy27ZXLNA/4mRVdBIUODcs+
         op3TViYfzVRDVAob0pKjUnJdAT4RMg4n7tVpgh5mi7TPzy7mUlqWcuh2vSwBaxmm24G0
         BpbcPc62HeIo9pY7nVr4N3ruuqKHAqBqcFYcZrBoifZmLgFwGztK2kbb11hh1cmRFjE/
         MoDk8+ffCTA6dZXlnmMblUYaT8XHfJ/Tq8z6LlzAGCb5lGGoALUBONJGpfcDUCiHKwN1
         2LLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741616116; x=1742220916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oiOvI1jdSHYxDi7DOGuskPixkiPIYyxQOmAzG/sEzYk=;
        b=pZbLOk7DT7wxZfXtCgvo7a0HtXBuF79fCNrf6Iim72193ii6I0DmcOf+PoJukcP3D7
         +jYhgqs8kWVVDZXipC/wZZhoVolal4ww69fqk6X2gWMFGhsc/dtinuCUQmGecW1G6DWb
         1qLil2lMnX7oOjOb/M+jW4Nk9vsNbPmG3/ktCnYu05z4/HFM7ZB95A4WyP8Ixh44Trgw
         SxQxnyE141OCKMWRx/7Qjr5LtLW1NDA9QSHynfmyQG7eXp7XZcEPid9sqqKfuJhZB0Uc
         JckFHH2U4LNOdShB+8F8zSml2ouPnGzissVsApUzc2DGH+UgpRz4SdCD01XBCnPrpgyw
         jfxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNZYrZN4UwYAK/7R+MDGyvms2iK3MwQM+UlEsPHzmFzzt9yPwsJ4KJWhToW0vGA6AcofAzipP7MBXmKHGT@vger.kernel.org
X-Gm-Message-State: AOJu0YwEaNwW3J060qKPvhCty7CV1Yf69XlEZF5VSMyaPL99gj7HGCgq
	I4QzBqD6qkp8+bJmeRXFfD7U2AlZ31NfPqHhknSCNaaMPnVCBhGkS+R/N9UDdg0=
X-Gm-Gg: ASbGncsn659CFbBp5o2uRb78B1Ovh+yjQlu+9+Sd/xZMhjEhFltoWxEV8Z9a8nGDf2H
	wx2IqjCVGcRNqQqJh+krn0yIVyLo9EAHupCE5fVfBJb7R2rW7JUtPitlIe+Jm1BMbuGkVOUPr38
	PlEjmolUczpqk5wUwAty5WURVr4IVkSfc8exjKEbpHUptU30NJYy90M/uT2Rl+lgo1BSrX9XWz5
	9Q3x3UQ027v0veG4hBMSXjWgOn+gcvsynsxB3lfJliMVqdjpfCMZvTSU3zKmQOfwAvSASDc1Xg+
	G2+eAppPrnvNJjKpg1KkBL3W9TctzPjHFB9j0YiOqYuYb2Lo9P2GoA==
X-Google-Smtp-Source: AGHT+IHa45QnkYD1vqqthYS3xXFkFKfr9pmWfxHxp8awb40Um6CRd646Vsb+NIScIuubTXcOwu6+Lg==
X-Received: by 2002:a05:6000:1a86:b0:38d:e48b:1787 with SMTP id ffacd0b85a97d-39132d1d1efmr8985888f8f.14.1741616116199;
        Mon, 10 Mar 2025 07:15:16 -0700 (PDT)
Received: from hackbox.lan ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8da097sm149824545e9.17.2025.03.10.07.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:15:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: x1e78100-t14s: Rework devicetree for LCD and OLED SKUs
Date: Mon, 10 Mar 2025 16:15:01 +0200
Message-Id: <20250310141504.3008517-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Thinkpad T14s Gen6 comes in different SKUs when it comes to
panels. The only difference that is important is whether it is an OLED
or an LCD. The way that backlight is handled in devicetree between OLED
and LCD forces the need of two separate DTBs.

So create a common T14s dtsi that describes everything except the
backlight handling, by renaming the existent dts to dtsi. Then make the
legacy dts the LCD version, while adding a prepended oled dts. Both
include the generic T14s dtsi.

For the OLED version, I do not have HW to test it on, so OLED specific
bits will come at a later stage. Still, add the OLED dts in order to set
the stage for it.

Had to format it using "git format-patch" since b4 doesn't currently
support -B when formatting the patch, and the renaming of the dts into
dtsi (plus the panel properties being dropped) would've not been visible
enough for reviewers.

Changes in v2:
 - rebased on next-20250307
 - Dropped the RFC, as it seems to be agreed upon already
 - Added dt-bindings patch to document the new oled and lcd compatibles
 - Added panel variant compatible strings to each dts and included the
   the panel type into model string as well
 - Changed backlight PWM period to 4266537 to match exact period the
   PMIC can do.
 - Link to v1 (RFC):
   https://lore.kernel.org/r/20250306090503.724390-1-abel.vesa@linaro.org/

Abel Vesa (3):
  dt-bindings: arm: qcom: Document Lenovo ThinkPad T14s Gen 6 LCD and
    OLED
  arm64: dts: qcom: x1e78100-t14s: Add LCD variant with backlight
    support
  arm64: dts: qcom: x1e78100-t14s: Add OLED variant

 .../devicetree/bindings/arm/qcom.yaml         |    4 +-
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../x1e78100-lenovo-thinkpad-t14s-oled.dts    |   12 +
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 1194 +----------------
 ...dts => x1e78100-lenovo-thinkpad-t14s.dtsi} |    6 +-
 5 files changed, 77 insertions(+), 1140 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
 rewrite arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts (98%)
 copy arch/arm64/boot/dts/qcom/{x1e78100-lenovo-thinkpad-t14s.dts => x1e78100-lenovo-thinkpad-t14s.dtsi} (99%)

-- 
2.34.1


