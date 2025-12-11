Return-Path: <linux-arm-msm+bounces-84959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFEBCB47A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 02:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08A4A304113E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 01:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E2226ED56;
	Thu, 11 Dec 2025 01:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXeu4XAP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6919726AA91
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 01:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765417762; cv=none; b=X03JE2QD7M3qz512Sxqvpp3zyjb7lrd/qsWqDry9X0ownBcrPB7AOp8GpjAfn/sS/HWno4k1B2X2R/GbaZ8JjLTEntfWO3kQ9MvX6LLWFdzqNeksXaiCjGKEK7afHzNj4P2e9QmTqwYZxbNQqSrV6UFIdmAUL6a5mmFM92z7JF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765417762; c=relaxed/simple;
	bh=eKctyCCAfDrhBUEBcPwgI9lj1QLDPhGH+AhjDzK1u2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CVFscQQ4KpTtlmg2DsyNRaCkpX9rl3ULA76UQncWfyvAZmzNc9pB9SC4PfAlz4qfKUqvJk5nrqONm/yxstEA3Wri0Gu+sXq1jh1zW5KXkTtMSRIwmPFu2RjeIjAQTGGyodE75wYW906bhlQJCbHJuMFfDD4sTUQTtbrWNuA72jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXeu4XAP; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4f1ab2ea5c1so5297451cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 17:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765417760; x=1766022560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KGtV4M5CkIi/MUg0AIlnUx+zFblebrmxOcrF7c98NQ=;
        b=eXeu4XAP9WxJBvvOlo0/B7viuoZNi+mhZfQtBuwFbwvyrTwPJC2SJPg9TI3dSugFQF
         XElOfXJI6tjtx7YvdxZLKcL6EqmadOdukl3H0P0/4gmSFXcVJ2m21NnTGgn9MIYZ+oS+
         2r83ynL+YohSe3eS7b4uP532zJ7aUa1c9t7slD0u5akmXUmOTSIPmxubmNjiDSgvYAi7
         6IvbI/LI3Bd+Z5POv24GzHuR0ioT4avn0aIMO3gAOocxYqYlGgVvIOzQ8V/N4I71d2Ck
         MgNstrHmwlbSIDltWfI5wNzlqlQOzplPMf0HJKX9czMoG2jAmeacLA500ZpJ+TKUAzdF
         kbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765417760; x=1766022560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2KGtV4M5CkIi/MUg0AIlnUx+zFblebrmxOcrF7c98NQ=;
        b=ADk8d+KyNlBN9vdSc9E9kRzcYBaVwUMWGfWJxlVA2EC4JYE1J+moH522WHHSnLi0Km
         EAnMwErr4sRrxivDex4YvAB4maNFgbIHzYRPpWCZy5bXdJxKXSa71TQxxZ92AkKdJg/D
         9zAE/vEQtcGlj7FvSjWUxCJQNMhWsf19mf7rG/Yhh8wKhK13kFyzPZbuqTt3LOSSd9Ad
         efVHM+kOv533Bu7MfPJZZeO7COcZUpiAsDhFBi4z2Rd/2qSHjdLzDjvmbRAwdmta9RPc
         YCgqXno5cmmtqCQ8B1tBtdzDZ/JISIaZuTk9ZGRNUnbfkdG70Jwq2MrY+fwogb85qhaf
         Jtvg==
X-Forwarded-Encrypted: i=1; AJvYcCV4z191ePezpr6JQvQlyi59QH6PqvdXOtcdC9oL4cxeisCG5tf+FVjN2F5OgQnS69UYE6A8rv8zzXz7Mn8u@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2OAWqDyCHMewli0MSZ1jIWjU8EI33z5H4xRfZG/I6iklQ1SLb
	B3gA96BRGGxJK2+cghfQ8C5MYpmb1ua1NKMeAsre9HPTwJ54GqyAA/lY
X-Gm-Gg: ASbGncsj1OdW6wUEaNyXP6efq46UtWGS1CzeA1ZFO5JzvKqHqNN4lrEHwQrqbNiFILa
	c1mrS4ciC7IkpqwGC2D3LfMtWGY878zmiZF1Q6PDiZ+zeHpgkfdNgrQBd0iuqucX26bDzl8Q2Kd
	H2jaK0jXPuyKSw56FjleEMg7L7OiQbLMYMsLud3Fepvdyv9LLnJvl5wFzWFLORv4F73yMnUoyaI
	KsvH0jctOxIgLqGuyBv+a4IDHmMYYvzf45+mfaMmQJ5Rlny9czLJ9mErGK+PxzaUu8lyDe9X+RA
	0w6dr6aO1hLeRD+ljbxFUsvaNKLg7Xq0pAXnkA/6Bsb7SHK5hKuaW7gnKIPw0b2zmDAM0lLMzpW
	3DTXx3B9pgddCJ7eMFLqXMGWaCjGquqRMA1mdtZLR4coB5+MampamKtE7qelWmw7T8BwOLJ8JF0
	lj4XcvJdPydDDQ8Q==
X-Google-Smtp-Source: AGHT+IEHGFsZyx/nVfYXZ5QvErj5OZznYgvQNXzSO7zb8bnJmymaeGQswuqQ9EOEvZnOAOHp3amI3g==
X-Received: by 2002:a05:622a:8c3:b0:4ee:56c0:712f with SMTP id d75a77b69052e-4f1b1ae29c4mr60256041cf.76.1765417760232;
        Wed, 10 Dec 2025 17:49:20 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f1bd58d034sm8948021cf.5.2025.12.10.17.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 17:49:19 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 4/5] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Wed, 10 Dec 2025 20:48:45 -0500
Message-ID: <20251211014846.16602-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211014846.16602-1-mailingradian@gmail.com>
References: <20251211014846.16602-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera subsystem is added for the SoC common devicetree, but the
mclk pins should also be common across the SoC. Add the mclk pins for
the cameras.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index c275089237e4..69e84cd8ed27 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1190,6 +1190,27 @@ tlmm: pinctrl@3400000 {
 			gpio-ranges = <&tlmm 0 0 151>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio13";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio14";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio15";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio17", "gpio18";
 				function = "cci_i2c";
-- 
2.52.0


