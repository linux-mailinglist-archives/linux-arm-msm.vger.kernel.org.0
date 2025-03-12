Return-Path: <linux-arm-msm+bounces-51160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3F3A5DDB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 14:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A7FB17AA5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 13:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C623A24DFF9;
	Wed, 12 Mar 2025 13:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L3ttqbjH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C39245017
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 13:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741785272; cv=none; b=e4ZO/GXQzyCMbwLSQYz9IQaFQ4ENSsjR9PDtpU5fFeWEzZaUxtRKQdt74GxcQ8j2jzrTs+4f86LE5xLKWl9eayscrRFRLdqu4Htc9TtLcjA/CRlL6vQjf+I0THTkcio/mnxs13YE9FVL4oPL1WSHmEOMFyunFHrcRIlX0MNxfxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741785272; c=relaxed/simple;
	bh=lR6PjoPFKVsHG2J5Mucpa/CnvA+OdHPQdfRh6cSHZ2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YoN45trsaS8uCsev71A73a4wzIbumgYv4z+Ygz2qaZJ1F0yssvxJbGtYBDCH9rFvdSs2WPxrfpF8nzP7HhIU8hVEEYJOkyOx5AirVLWG6dGEQPGiRTtPNX1UjfoLv+kbAvJIDTTeOGHlP0vf+cBLrZ19HX/wwkG0Wga4oYqy9no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L3ttqbjH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0953d3e1so1458825e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 06:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741785269; x=1742390069; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XK+UGaMVwf9jHj43qw1MVxGsWYAAC0YY/TWDG0GH+T0=;
        b=L3ttqbjHI9Y1mRKi7gIR3Q98GU/f6HerfDDg8JrwXybtqQ3U2vZ1RGR6skFjkil51q
         qkIC9FJOlEB2UuQwckDWrMHaQVncFtvohkvR9hWmxuOdepaqB+S+bd+9OdxfKSILQkWC
         Xd82SUCk4fJowLI3f5dfF+XDHex2ouCjPxQcLa66P+yWEfD/o4/x9zzEkXapzBIg9KKX
         seY88mKI3FMgOgm2S80YmA3aVn6vSgR5ToGKntop5Hm81pCkE52ndmPbFMjnp7Co5CJ8
         CvWtkJTO6NDAgkAWxGwJJ1WKQ/23qBqEhLf++e+kjlRrGAdfo7E/ecvbvKnfHRplcuis
         iDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741785269; x=1742390069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XK+UGaMVwf9jHj43qw1MVxGsWYAAC0YY/TWDG0GH+T0=;
        b=WQ8TJWSOW0VwqEzc7vh/c9AGbskQs1nv/4hhVIPs0a8debiorPJc62OGIAyyBOl+Mo
         fk6V9hF9KkuEficLDz10q4aNRQ/XZuRO1lvKJWt4CLu4LSMU47+abAOGFt0vCYgYFu23
         dOEBqtDKIVE92ZGh/zfhmqo+TMpTzrg1QHRGgpYdTKvk0uYMSFFkIxRpsjUjtasUB7F1
         sTjRRl1/MbcHHijD64ymVnshafABr8B3sL/mXqC0+XWmwXWUntE3GbC64uUFY/8+OKpR
         WSK0079OCE3f59/fbfPps05e733QfYehxeVI319YQVPKZsTLIcAYMHpMdmZzCRAwNiMa
         q3hg==
X-Gm-Message-State: AOJu0Yyv1yqsqFsu7W7M6g4MpWqQ5j/810DTx3Zqsg87TishpDZv6njN
	6lAXLhCbMWqVVsLwNeLqRup2NMAO1l2goC6V4KLZvhe2fmyJOUrx6kWAuCgOEJI=
X-Gm-Gg: ASbGncue7xBPbao61w+aieuGGVBRsqe5v/NUU9K6RZIa8mgI2FE3N2f4FOSF+QQdAaM
	7YG4L4G2dLaGBEev8c0Fmz3ShTymxt9nYFpOEIM4TjJAU4eR4+BFD3OMtRJ1sor0ZULRQvKHJOc
	MgNK8KU2kj6bKZ7alCDc4kym9AI/z73GDX6/9PDTFAiMImX/v5rMXx4pznFZL3JrtY0j8+xGaub
	Ei5T9fTR9UGlsVWljxpWAPehWEFQS6u5Z7d0lg6F5umm1tPFC34sIVqjpdxSnK9lvvVlfAdPPhu
	IMC7by8SS92pA+SzUchVSzXQeci0vKX6CkqlN6jMgFfbS0zLg1sour0nBUE=
X-Google-Smtp-Source: AGHT+IFXxegfmgQM5h+h3H6IEhCsssC0UnFb5yxq2rS2ER8UYMHh3dfRMTJTzORYWe0axLgbEZSsig==
X-Received: by 2002:a05:600c:5107:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-43d01c12945mr32907775e9.3.1741785269320;
        Wed, 12 Mar 2025 06:14:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a8c5cb4sm20966745e9.25.2025.03.12.06.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 06:14:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Mar 2025 14:13:58 +0100
Subject: [PATCH v4 2/3] arm64: dts: qcom: sm8750-mtp: Enable CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-sm8750-cdsp-v4-2-4925d607cea6@linaro.org>
References: <20250312-b4-sm8750-cdsp-v4-0-4925d607cea6@linaro.org>
In-Reply-To: <20250312-b4-sm8750-cdsp-v4-0-4925d607cea6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=848;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lR6PjoPFKVsHG2J5Mucpa/CnvA+OdHPQdfRh6cSHZ2Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0YikXG84GYnmOWpnaAFgNMm4qTMRZq+93nStP
 4JPUnW3x0aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9GIpAAKCRDBN2bmhouD
 13wwD/9c+P+vkuq58tSq5wtvVVR/bzLWwcw9QndgJkiARmh+9lQ4uj8qikAIl4F4PyaOjYPv9fd
 pAoJXWLfCj2pplZWw8yfWpLGy+GRGShkehlu0HJLzqzdWZamMPQRSKX5eclCeBXhWRDSitX16S9
 W8OrKrDVTdOhTUwK8mYwUMzQjeCp+3S+sx30/XBvYnZx9GNYub5Lpp1E8g5eRoDeD/tA+R8du5E
 NTTkZPuriTwoO6ZR1pEOf0H9ON9bxrizmJyQseaYNUZ8fv148GYqT0BQqFXzwGQrxy5WDviMnmL
 BPG+qGgy61RVhn4hqztzE/4frx2Mb+YVqIOI4DSp0XhpZtbvlyQUWSigIAihwzDKATpgu7oStOb
 qU+k8zVlVQce8wpTqOqMJk5HAn0Ospb17mHNBg8i7Azg84BfBWD88Fd5Cw604jFuEL8NnYYuZ2v
 byhIeANLy7BaObXIPjIP5fjYHvGeydSKC5WKTmoYT+ngLi7fxkQRpmTsC48bCEdeYnadNLi7JnP
 A1Xdeo62nsoYyos7anjWmRf53vSUwDubUCHcCaATN9z7US0u733R+WIchc7Z5qwASQ0gBT4RKuU
 WHdom4aDfSieXHYDIpriIwx3/OiOVe+WzQN+ZfhikR216XUH4DBP0aQ2RNKuQYiUwkp+LGXT281
 wiVg/TuJ4mJIv5w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Enable the CDSP on MPT8750 board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 8eeed7f2f7766326cfc7830002768087e9783b9b..5d0decd2aa2d0e0849414534cdd504714402458e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -791,6 +791,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm8750/cdsp.mbn",
+			"qcom/sm8750/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	/* reserved for secure world */
 	gpio-reserved-ranges = <36 4>, <74 1>;

-- 
2.43.0


