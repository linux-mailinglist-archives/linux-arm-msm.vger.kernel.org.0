Return-Path: <linux-arm-msm+bounces-84844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4EDCB1937
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 02:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43071311F8F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A58221A92F;
	Wed, 10 Dec 2025 01:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mkB2lDx5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE0821771C
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765328753; cv=none; b=P6jsZYd7aQX1vYIze4gQ2/Hiym0RB6l4izC1meoezkuJV2JYOspTbCYDtY12uXQyDPjTZujZwuLnmcuxp+pLd2fmg97LUcRHcTqA0dPkaGA6TzZZSZSnSVfZElbz9jIk8HqP993IdKTTPZTJR3G19CYbttUoTdE5TFpjes6CkXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765328753; c=relaxed/simple;
	bh=cs2ROINLZYbi8BGcsQ5ZsjpjD8nNHjdVuG3v+tZmqdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=maEHnG9L9puHK9vRgXeGaUhgrTNM/Q/FIhXDyK0O0/eZvd8AZCnAYgoQxeZs6OEDWQRHl+8zB9K6Qvs9VL1E2VHUGziOFEUrPGdUytNx+/0ulT5Qe2ehwSvr+JkCzftd+mRw4Fvum1mq6ZnYs/a32n7LuHqWJxTnowtqjqUYjQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mkB2lDx5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47774d3536dso3549275e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 17:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1765328749; x=1765933549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G61t03ohH/z/XV0khgzgfcMzXSsyCROO+wthBFVYyxk=;
        b=mkB2lDx5e5rwwi1Ziq2SO6Kzm84NU3rTkwxc9nsC8pI3S0pelsJHA/1W1yvWh6GfDI
         BsOgpqYBURshf+K1BMomG3ar+M2QESPLLJe8rHhzt8jANM0QghLSPl06ASdfgG44dy7P
         dJ0kutx1zQc3w1x8ZnBu9sL3v5J+4UVpvOrbqVCqdKNsXx+KLKeZa95Jvz5o1wWAZ/fe
         rmrgbHTdJkk9eOo8fES0Pa86aevb7pCpBWc9H2M0hTmJh158uu1gu1Ugzc506X5m/LXf
         TjEdArMXImDlvCH8xhuZYpKJhCCWKvWViH0rsfhWhHVCePr+NDy1sv8QfS0vUP4lNuqk
         EYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765328749; x=1765933549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G61t03ohH/z/XV0khgzgfcMzXSsyCROO+wthBFVYyxk=;
        b=jZ/7fILXk35dghSz4teicrx4X0wf8iA0xPUYeOpt3mOonBCrcRLwOuqmJ4+OoxKqLq
         u2UqeB2sRMLgSj04CuZpwK7wlKUbDb9sLsix1YMxiN4Zrv8q/RIJ9VWocF1fI2dUvus0
         Vfd+XTKd4wrShWNwVxr8iFpv6qzd7Nyf+O7h+4T8XU9fxVQ9dE1sqzMFdiLtDuaQkY7m
         IColkwBS9fVF3qbnfZncTuNLoCrfpAkWOiET8lz9CAEM4+tZkB+jPHlCXFvxqG0O+gq2
         j8OPW7WzAX+CBu0VMx4xrMtZE9egM5i6g6gp7qUHRLfbkKKe76dVTUKl7bg9LE8b/xQo
         BNzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRI+E0x/xImPevKoCX8slPhckiIi2VhoE0RB7oyjGkMoLdJOFU5OlmgdxD76AH4iuvhn/6MT99D2dJ0sNR@vger.kernel.org
X-Gm-Message-State: AOJu0YyVm4m0AY2psWgHnyKCkR+ocHw4lpFynOg4fngIaN6eSCf4+rcr
	92s/LWEanqjdYYrD7J9Qr5yMQSR3SH79IlgTa3TBXnh6tJl2rVzeMUwB6Ma9xqsqyUg=
X-Gm-Gg: ASbGncuqBtmtqkEADRCD0hrmnB2ZTl2R1d3+5YsVpQXn3ZF9yaJKfSLbDlOQGmO9qRw
	L/Xq75DPUyo6I2L4jQAzpvECl1RUhqTxCwI3evGqV2aRNqW2WilYEpZUmZTVoK3Zz3Y/HOLcCSp
	DmrT2swuH/e38ogDQciMijGRk64SmKmjZoBq6y98SqNXSAh2FZTufUC9st1hG+lCBBJKu/74kLR
	osKUmhnGA6lqRayY6XxPzMPiq+2gjNpMhxGe82bjyHmiicz6/9K0M0rg7HGb5FJOYC5T5LOHT9A
	Ol/k+7y6HXGdW/BxbyBWGL87pY27mO1OJVAxUZoXMAU9iq6U139LajjxhyxwydP8IyElVUsrYQA
	ujVdx59gIhNQQW9w5eYs0Hfdvwd4DL5q4B9OMPNr+3ClNnoKsFzLyso5AEcuxDj0W3L3tOIVx3i
	vF0FB81f3MwFIVt+dVVN66c1dUfUWLkVCGe7x5QwW6C3R9KEqo26O1ZMopZZxi
X-Google-Smtp-Source: AGHT+IFEGfjPiVQGshkO/20ig42r1aY3hbFJDhHP5lh9K8nvPlehfynniudzGdwdIlbKiqWq71Akxw==
X-Received: by 2002:a05:600c:888e:b0:479:3a8e:c85c with SMTP id 5b1f17b1804b1-47a7f969677mr27860525e9.18.1765328748862;
        Tue, 09 Dec 2025 17:05:48 -0800 (PST)
Received: from [10.200.8.8] (p99249-ipoefx.ipoe.ocn.ne.jp. [153.246.134.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf9acsm163206575ad.28.2025.12.09.17.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:05:48 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 10 Dec 2025 10:05:29 +0900
Subject: [PATCH 3/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add camera
 fixed regulators
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-fp4-cam-prep-v1-3-0eacbff271ec@fairphone.com>
References: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
In-Reply-To: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765328733; l=1911;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=cs2ROINLZYbi8BGcsQ5ZsjpjD8nNHjdVuG3v+tZmqdI=;
 b=LXFLCMuznT9I2R4i9n1Lfv8o05COPLbPk0j1FGBCLabG1z515SK+gadOEWSqZVdy5/5+brTjg
 OzlfbWjz2CWAiVOg0ylUP/stmYcR+5gZDSnIQew/hA/iutOQa+F1DAn
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add multiple fixed regulators that are found on the phone, which provide
power to the cameras.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 40 +++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index c2f856a56b2b..0cfb24e3941d 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -246,6 +246,46 @@ active-config0 {
 			};
 		};
 	};
+
+	vreg_32m_cam_dvdd_1p05: regulator-32m-cam-dvdd-1p05 {
+		compatible = "regulator-fixed";
+		regulator-name = "32M_CAM_DVDD_1P05";
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+		gpio = <&pm6150l_gpios 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_s8e>;
+	};
+
+	vreg_48m_ois_avdd0_1p8: regulator-48m-ois-avdd0-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "48M_OIS_AVDD0_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&pm6150l_gpios 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_bob>;
+	};
+
+	vreg_48m_uw_avdd0_1p8: regulator-48m-uw-avdd0-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "48M_UW_AVDD0_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&pm6150l_gpios 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_bob>;
+	};
+
+	vreg_ois_2p8: regulator-ois-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "OIS_2P8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&tlmm 72 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_bob>;
+	};
 };
 
 &adsp {

-- 
2.52.0


