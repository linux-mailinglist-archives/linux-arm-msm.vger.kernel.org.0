Return-Path: <linux-arm-msm+bounces-51082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AADCA5D3A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 01:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2310F1881F9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 00:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E354D2F24;
	Wed, 12 Mar 2025 00:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FVHp8Dh/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086D9CA5A
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 00:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741738314; cv=none; b=uGV+jcMnQGJLbFKJD6tq1TKuhE6mUgcpSJHsn0RQ9RYHsP4Vn/vDW1ZBku0u1B0U+uEaDFW58MD0iIAQmfadRPq2AMPfGf5hoU2vLs4SRJTul7kgOE0X9bNVWMSJIJ889dV142ClX8+QlxOdpRt+3tjGvZNAgKmNEy68pLsACO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741738314; c=relaxed/simple;
	bh=Vhpu6RqhN90u1GFEqS8WZ68QyeytV3y1M3LAhe7iHhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qzafr6rCFDp6AV+WWFhahRFnaSmLKsdJoAe6KKaKO13St9VW+zVTRgPpUK/MdsoRgJyKVbwNQj1ECtB9PIj04jWgxvMO6udI8wEoyqHQf7xlJjWC1QNWejPis0uDBtMO9B0Nx29USvoUZeYQiDmyDVr28IB6LBqrGJUGmP+d9To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FVHp8Dh/; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bf1fa94d6so6588591fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 17:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741738311; x=1742343111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GkhK4viS+WCkr+deNxmeottlEzNcM+YTsy00vrKebc=;
        b=FVHp8Dh/3bSdcIFcKNFTnNc5jw15nxTOgqhN5Gu/6GOHEz9ZNf8Hm1hTZkE4vRFHks
         LCZCsXlcuBSpFqZEaPF7X++Dv+bTFAbjSk0BOgxTo2eHtHJXYiePUZV/m9rWpRtD82tg
         b3gcWSYka0Hz0DrWOv5x74cZeH5pAXaFZQEX7gPNZ4o5KQxlrvT5kQ343lqJLwQv4fv2
         8z7HtpdRu1ocyzPVnz2PofWuOstkuAOCTyXUfSKlrTk6DOd8nj9Zt8WZu5NOGNlrhmZQ
         C8/S6ON+72loHvTCvPSpR9IeCJ30iIQ5F/PD1if4UrXFDEtT4vCFe6y0Vwcj8pDGnznf
         G3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741738311; x=1742343111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GkhK4viS+WCkr+deNxmeottlEzNcM+YTsy00vrKebc=;
        b=kCJdtwv0zdJCTWxajiFB4j3QJJVFB5pHwXjgC4YYzkMq4sQ3J6YT80mJsEZ/zihOxC
         /55HvxdmqoV1hEF8FM8WtMbWPhPW0hauAwtr4dJUbIs2ArfcJbrJQGcDNLVrKzYv9QBe
         LtFKfsJcUw4ks/35cPHHBZbY5G5i8CcvTIqGnrLzrKSiM9i9f/ev21DVuLFD4SH39BW7
         ADQGaoh7gYYLFNWz6Pg6Yx22XAGhrHEez35MQ6lKS4p7fJuHyzfYs7t14n0F7zJt6yIk
         /2jOTzWD2Fgi6aWQZY5/nYM56KYA5+wneXc4Jd759IkPuM29MpdA4lE16mlWmRxOBh96
         Z/fg==
X-Forwarded-Encrypted: i=1; AJvYcCX6C6t2cFpA0kFcNkJvuA5n0tIMP4uT/9flJ5/mo+C3R+6QCXTmOAfvuia3nslwP3XR5ou6btM6UKxmBAC+@vger.kernel.org
X-Gm-Message-State: AOJu0YzYlW1Te74jC9kDqyderhm+xZUVeWcK7kmAmiztRlkgTujtEzo5
	oXCoGpeEKkiNbYjtRYNSb9MFhyxRTc4JsKXypPvRTSpjuDJhFBUhuZqb2OvS4xE=
X-Gm-Gg: ASbGncuzitPuV6aenpiy6eHV6CT/ls7Dapkz8/7DN0T6tHa0XonCjXo9VVFwt8YAMGt
	ifTMvGLVA3iI0Klkfiv8HMb3usvk/CqGXa3U84u7OrL6FDAr4oOhEkgJvZavwNtKFU9l2aIlazO
	PU3neiYLQMlnjDlUwHWO6rmnP5xaPfxTc5W4IuE7b4t5kAXxrSXrY1PHNChcl842bDML9XApaV3
	ebm5L7bjAnLjlOOYTN5d9K8T663m41WrC/+rSgHwPJ3lwiuqeXRogLnVQqUhwA1H/hgNHwaOQQ+
	e2fGkGN6XA8xyEj4K257JKV7blkTIZx/s/a88ZEIg8tJb38ngHHdWIlyk2mb5CrhBhhwwpOZoO/
	nbIbN1IfqYPNdeZyDPdnadzei3u+fxfcNHg==
X-Google-Smtp-Source: AGHT+IE3aGg2miikjmCVfSPDVDV2u4JxCl/JvcqcglMLCCNbR5JO35QkaAxLbPimjVUrfG9XbI48eA==
X-Received: by 2002:a05:651c:1988:b0:30b:bf18:91c9 with SMTP id 38308e7fff4ca-30bff4150femr21070251fa.4.1741738311067;
        Tue, 11 Mar 2025 17:11:51 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bfe741fadsm15984251fa.10.2025.03.11.17.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 17:11:49 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sm8650: Add description of MCLK pins
Date: Wed, 12 Mar 2025 02:11:32 +0200
Message-ID: <20250312001132.1832655-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250312001132.1832655-1-vladimir.zapolskiy@linaro.org>
References: <20250312001132.1832655-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add fixed MCLK pin descriptions for all pins with such supported
function.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 144 +++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index bf5e238a93c3..526ef2ae8ac8 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5792,6 +5792,150 @@ tlmm: pinctrl@f100000 {
 
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				mclk-pins {
+					pins = "gpio100";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam0_sleep: cam0-sleep-state {
+				mclk-pins {
+					pins = "gpio100";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam1_default: cam1-default-state {
+				mclk-pins {
+					pins = "gpio101";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam1_sleep: cam1-sleep-state {
+				mclk-pins {
+					pins = "gpio101";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam2_default: cam2-default-state {
+				mclk-pins {
+					pins = "gpio102";
+					function = "cam_aon_mclk2";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam2_sleep: cam2-sleep-state {
+				mclk-pins {
+					pins = "gpio102";
+					function = "cam_aon_mclk2";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam3_default: cam3-default-state {
+				mclk-pins {
+					pins = "gpio103";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam3_sleep: cam3-sleep-state {
+				mclk-pins {
+					pins = "gpio103";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam4_default: cam4-default-state {
+				mclk-pins {
+					pins = "gpio104";
+					function = "cam_aon_mclk4";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam4_sleep: cam4-sleep-state {
+				mclk-pins {
+					pins = "gpio104";
+					function = "cam_aon_mclk4";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam5_default: cam5-default-state {
+				mclk-pins {
+					pins = "gpio105";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam5_sleep: cam5-sleep-state {
+				mclk-pins {
+					pins = "gpio105";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam6_default: cam6-default-state {
+				mclk-pins {
+					pins = "gpio108";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam6_sleep: cam6-sleep-state {
+				mclk-pins {
+					pins = "gpio108";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam7_default: cam7-default-state {
+				mclk-pins {
+					pins = "gpio106";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam7_sleep: cam7-sleep-state {
+				mclk-pins {
+					pins = "gpio106";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio113";
-- 
2.45.2


