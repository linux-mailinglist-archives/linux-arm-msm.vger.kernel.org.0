Return-Path: <linux-arm-msm+bounces-10707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B3C851B44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 18:23:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66BD728C408
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 17:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328563D978;
	Mon, 12 Feb 2024 17:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kw7XseNO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448583E468
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 17:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707758622; cv=none; b=BXHvdoIKump9KLS5M0CO3z9zq5+CQBvww2yLglyISmywUTxgSFrKQbBsFqUuXIO2sKSblofXlVz60TZ0U0y6hvVgt7/1VD6GnJklRZjuJ5RUBbbmDXVp1HeDXVueUlR8bGYcDdQpisPDa52rcOPaojXwbgDyXVwlfmZWW4D+qbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707758622; c=relaxed/simple;
	bh=sofmcUHFrSsRqgPeeSwX11oZTqFd4uStpGltcl3i2K8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Sq3hL5xQ7qBuJdwIZ9WH12d8pp7akU29SGxuPgV2lgUdmdAuzpXehYM+IwOxaht8uHkdI3pYROPF9jreJ+uuvPMhCN1BKszFZq8dUDTfKEH/eoSk8QALYtrLva/ZulhUJePzB8byjq4ZcuXP37ZK9lyN1r2TYR4fSPAolrc/YMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kw7XseNO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-411a6ada28dso3335975e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 09:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707758618; x=1708363418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/eslJc6t8FgQCK9mas7bDa4yNb2WxlkjcF3wqq624pU=;
        b=kw7XseNOMt3b6KhLGvox+JJWt5N8u+wumV5QwXi4kiKGtp9sjJTIRx162wmM0WntoY
         JLEWF9t9+GCYmteYjt88C1mdn2Gz7a/piBdZRjYEhUF7xUZ2PEzzCAN+tkQekCE/s3x4
         NhKnZI0wrqJMZtOyb58h8wYHR4okyI4mBLythZtMwIOq7cRhrzwEyr/YzmBNsnqcWrnR
         i9VjhR2FKBF4iOg0hHwHKcKRJrBy6Bi+FlHwpjDFopJsgqU8+yiAW+okevYcxUjeXsNk
         P60yo+xxDfpxxPaqJOi6Vcq5/QCKXcBN1db+VqErHJU+ZbKVnkUs/K06k3+WorXNcvYj
         b1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707758618; x=1708363418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/eslJc6t8FgQCK9mas7bDa4yNb2WxlkjcF3wqq624pU=;
        b=KdDUK1R0j3flSghXEAEGyGhPPgRjr2K4MwpNug5LZQrCMRv2udKDrdCQlzyoL+ADuR
         HQJ9j30vlXmbk020mb1OvAE72ZBCAXoCNh292SGjG9Q7GG4DVSP7dlc6R4V2iNSFGaGk
         emPTf++uM/rnEGMiJ6RdcomCri8HEhKNKYIsi+d9QyjWT0MH7imFD1TWvgHZvKMhq2eK
         r7qLUe7nowLOhbg+OzRMp6Mk3lC/E+TbA1LfiyjlLVFtRvxe2fzEeTHvwPWyaX7/OcOF
         A0BAnVFfJ9tA/+JzgSYQ/igKWbTp87Ns/vVRr8H+6hEGi7GRJNc83RCaY6zX6O8AxWNC
         8TGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ0ssuQhNZCmnZ40SPkrvQTgN5sPimePFRMeuxju7U1wzRxJrwkovuvkwSjUQdV0vbXIkU3GnjzBNfQES/SBqTMnaSfrfIytpFz4tLFQ==
X-Gm-Message-State: AOJu0YwuF0yxbKgfjS+PNx+EHYrEi4l1IbdyfZq2aF3HFtk62HbAQxmr
	WW0qnwehWCIM/vpFVGJrKwaPoo13UYb2PFKtdz4dR0esMK0Wwxa7kERwdpE3jrk=
X-Google-Smtp-Source: AGHT+IFVxtbsb2WQ+jwZa008fgojeqgjRlYlMaM2ykmzx1woC1CO/XtBUKH3eNCXodCmTZTCDEnyxA==
X-Received: by 2002:a05:600c:600e:b0:410:be25:12bf with SMTP id az14-20020a05600c600e00b00410be2512bfmr3387465wmb.38.1707758618482;
        Mon, 12 Feb 2024 09:23:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/glzWdQmMgcXw+DGQBL6Oi3Zv6d4XaYB9wXHL5YREvDIvCp2n0m1uLq5wKpIVvDMKD6QUp0lw2J2XJGQs3s2EwQf5cDtTMtIH09WBOHJpKmKxB6UlQO77/ujjSGKmYb4rYKCb5NLMQiVlcrnDXzJUlg3bkhkdqh4rrlicTEnV6TBSTnlZJ3p263yC12hBqvVATFx+/mFkQuKit0HebMD0LyJfzi1o5E4zwIX3p3MOlgOPrWEjNcT6d8DbjTAtPoiZBs2o/lc14t7P
Received: from krzk-bin.. ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id p31-20020a05600c1d9f00b00411a595d56bsm954051wms.14.2024.02.12.09.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 09:23:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/5] arm64: dts: sc8280xp: correct DMIC2 and DMIC3 pin config node names
Date: Mon, 12 Feb 2024 18:23:31 +0100
Message-Id: <20240212172335.124845-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the TLMM pin configuration and muxing node names used for DMIC2
and DMIC3 (dmic01 -> dmic23).  This has no functional impact, but
improves code readability and avoids any confusion when reading the DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi                     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index def3976bd5bb..8f2e9bed0679 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1202,7 +1202,7 @@ &usb_1_role_switch {
 };
 
 &vamacro {
-	pinctrl-0 = <&dmic01_default>, <&dmic02_default>;
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";
 
 	vdd-micb-supply = <&vreg_s10b>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index febf28356ff8..38351e8ea8b3 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2978,7 +2978,7 @@ data-pins {
 				};
 			};
 
-			dmic02_default: dmic02-default-state {
+			dmic23_default: dmic23-default-state {
 				clk-pins {
 					pins = "gpio8";
 					function = "dmic2_clk";
@@ -2994,7 +2994,7 @@ data-pins {
 				};
 			};
 
-			dmic02_sleep: dmic02-sleep-state {
+			dmic23_sleep: dmic23-sleep-state {
 				clk-pins {
 					pins = "gpio8";
 					function = "dmic2_clk";
-- 
2.34.1


