Return-Path: <linux-arm-msm+bounces-21737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A47C58FC721
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 11:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EC4528149D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 09:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26AEE14A636;
	Wed,  5 Jun 2024 09:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BZt5xSeY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838724965C
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717578055; cv=none; b=dDeRsg4v9ZtrfUV6kt7+dmUtbtKGjgZeGCi4oKkLovrTQHQGCzarDg216GMS6pTDMC9oA64fvjbNNc+BUkk9eZH+odw87vH2rzMM/WaGMn6S1vbUu3QKDzQ2zhJVjklhf26rUZs93b5/jAHmOr3L1QDXF1XKMNw0ZuqvDR7k0Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717578055; c=relaxed/simple;
	bh=9yh9Jj7C37WppCl5hvMNk/vvdbjaMhMMdTQpdn4iFTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RH9/yY66qxd46cl5wyQ76qFexjNJrZllYuF0QifNTi4ZeY7VHo7Cgb8MVUxpJzgg1gJVwsthmuXCpMQaI5WztGfhEc6BmquBhF8ULaj4/ggV0cigGKaawoh+HiC5//ECPigv3AClOj5elz5ytC2tE1SZVtJvt8LsfZsK6lcpfJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BZt5xSeY; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52b9d062526so2973271e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 02:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717578052; x=1718182852; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B3Tk2U7HTqKIj/hqVlEfk2OBhTexRr5WPJf6l5fzSJs=;
        b=BZt5xSeYluISP0JmL44vCun2m2qmO5Y+HdcC0xo6VKBkGJtECS6Y+2sjVbpOfpVxCv
         fI0PwWYK3sD075AdaKGzkHmDhDWQvb/D9fos8LdapxgG1cSGnjRFYIIP5HRQHNRhxfhi
         6e8josy2w9gx+IfCvoRzLzt3knrkgj6tndcJe3ygN1d/85fJeUNIGouApPTRNQTb8hGv
         h+sKceZmpKtNOZVs7f+DKnFgUQawV7tGm/VAryU8DWjO+xbRfvxiMudJ5+/DYL1C3sE5
         A6I/8f/6F0WaY8vLZVmlHoE4i7mm/ohFO6roLUbFi9ZWu9yI/XQS1AepHcqwf/iFaRtz
         0B8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717578052; x=1718182852;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3Tk2U7HTqKIj/hqVlEfk2OBhTexRr5WPJf6l5fzSJs=;
        b=XPs3LcGJx9BC3cB5uBzbK+Isgm3K3nLPwC/B8ablJe1CBChf3LZAc4LtvQFG5Y15IN
         YtD3bXIFEKLIoaA5V3aTwPbtpS8TKAgPdee4CjksFj+oi87d/hvwFjk0mWz2l8e3z/AV
         w6LZqcH4JnuIShEBFYJuzI9EwJMP3dmS0Sf2opvZwWMC5mo1BTENYvSWoT4vfo/DUVvd
         XN5FATSPk05nZCbRx2HwREkSnM4/8kr/BTyPtHDDA2FEBlxyxr1QQpcPG4e4U75DSKhN
         WswpxyuykbgWWtq7M0Xx4/J82FUWL2N/CdGYCkpEAvtz6nAGv6PiH9yX39zIoaJXNfa7
         pELA==
X-Gm-Message-State: AOJu0YwGf0aRthIWDNEeXErCwUKTd6IHzRTaIh2WrB8f7HpqEt3W57GU
	tz3uDGTZkYjvi6rsc43bvoVud6CiZlWwLI73Jdfx3zv7EHA5ACDx2z0F8ax3aIY=
X-Google-Smtp-Source: AGHT+IGgMsQYDZf+T+2JFeGFXZxkfjquCVgkpQ0V8wX0qzieWBZ13+vh/5Xn/Om49PGOHagAJGmarg==
X-Received: by 2002:ac2:5486:0:b0:52b:401e:1b5e with SMTP id 2adb3069b0e04-52bab4d30c4mr1113833e87.17.1717578051715;
        Wed, 05 Jun 2024 02:00:51 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d764c6sm1732196e87.123.2024.06.05.02.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 02:00:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 05 Jun 2024 12:00:49 +0300
Subject: [PATCH v2] arm64: dts: qcom: qrb4210-rb2: make L9A always-on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-rb2-l9a-aon-v2-1-0d493d0d107c@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEApYGYC/23MywrCMBCF4Vcps3Ykl1asq76HdDFtYjtQEplIU
 Ere3di1y//A+XZIXtgnuDU7iM+cOIYa5tTAvFJYPLKrDUaZVl2URZkMbj0hxYBOm95M5Doigvp
 4in/w+9DuY+2V0yvK58Cz/q3/naxR41XPtiPlfGvdsHEgiecoC4yllC8PlSoFpwAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1350;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9yh9Jj7C37WppCl5hvMNk/vvdbjaMhMMdTQpdn4iFTA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmYClDuJrZrHHKcqGiWrq6c/hDyfHUGBT+ol2VK
 8DIgK0RA1eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmApQwAKCRCLPIo+Aiko
 1cptCACW56FLcmDkRPcZP2QrAxuI+y8yO4vKMRIiZBPZ6UiqLktkLJlMUalhygs7uKNrTEqOt7h
 YDQn1p5NaCd9Ldw9IRmuo3iqlVRLjwKLCgrsMZt+vnaOX02UDSzuMCDrLepbq5FJrPx/IcXEF/j
 KdSm1GjpMje+foCUwdnLvxliUfpTgkQ8RtHjxWILp9S11B83+gkN0S3i2rdv3L4a6vI82FcbF1i
 dn/D64kf+KK3SYBYSZvDwDnSAMpoywlF1xt68q2kr1uNHJVNKW951SRRCtdp7nch295uH14pRdA
 V8CoLP1s2ePuB83zt1LvXDy/eremMJRAtzuEsKEJAL7LBcDa
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The L9A regulator is used to further control voltage regulators on the
board. It can be used to disable VBAT_mains, 1.8V, 3.3V, 5V rails). Make
sure that is stays always on to prevent undervolting of these volage
rails.

Fixes: 8d58a8c0d930 ("arm64: dts: qcom: Add base qrb4210-rb2 board dts")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Expand commit message to mention the affected voltage rails (Bryan)
- Link to v1: https://lore.kernel.org/r/20240603-rb2-l9a-aon-v1-1-81c35a0de43d@linaro.org
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 2c39bb1b97db..e0c14d23b909 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -403,6 +403,8 @@ vreg_l9a_1p8: l9 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-allow-set-load;
+			regulator-always-on;
+			regulator-boot-on;
 		};
 
 		vreg_l10a_1p8: l10 {

---
base-commit: 0e1980c40b6edfa68b6acf926bab22448a6e40c9
change-id: 20240603-rb2-l9a-aon-d1292bad5aaa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


