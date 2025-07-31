Return-Path: <linux-arm-msm+bounces-67276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D18B1776C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 22:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DBF9565B2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 20:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E305426A095;
	Thu, 31 Jul 2025 20:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RjlNXhDi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61836261393
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 20:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753995101; cv=none; b=CxCO/ADd8Awtkdh8RdHYO50dVmD+R15Dru5spj85Ah6ocb/N67TIZVFXasrPMwgupPhg5TCnyk3XS55mTB4b5gq4dR8RXpFhlxiOu8jiLJC4KlJY4k8SFzzS1MXBtHCE5L9JoyuMKpeLVAi3sWIUjQ5R2RvUD79YT2ibWrL7KcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753995101; c=relaxed/simple;
	bh=2IIOOJv4YbwpvL/BVb0O1hrl3nXkJFZe7UmfdKaEDFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XWHCxDh26hiLY5+YxVnEmUt4gTca7zL9QFV33snJdzNyeTfyHd2KDRhAS0baJZ1G1Cm4CqZMmwXAwbFLujP8kO8ZJcR64p7WANPKiZ4NcJ+qrDVkk+LGoTooO0pfB6vXgQwX+0JTHg+qfA5LZ+TxegSSFbwmse++Dj0P3MSLALE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RjlNXhDi; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a588da60dfso530853f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 13:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753995096; x=1754599896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ei9qPm0AghIdMsWdkzn3tm12w3Iv4T6xpOfxLvDOo54=;
        b=RjlNXhDim42iuELl+r2Y2SFERu1zrqvVnlh6D0YEg0dUsPso4XUONHFTaKw19dYarg
         bdmpKW9qhvNAHoGnZJ9m4Li7J8hC9ZKN8aW0TUwDQ70ZzpUacHfI7ngrT8yXAuslMKJx
         Q7zc6AlPMXp9f5QlfGdfY1jsBkIxfk7+0otMCNizjBC7P0c+cDvPASep5oXY37ep0wUa
         +bkc0P4LrYG3vj+PzlAghzvyzIcAU2Y7YESMYG5h6OkQZaLI+qwSzyGGRvKwfKCJhlCx
         bLm1rjQAI46QHvfws5gTiwE7efBH6qnn8l0smLXmDGtdFbIk7QoKr3FF6ZnXAxxJthfa
         aNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753995097; x=1754599897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ei9qPm0AghIdMsWdkzn3tm12w3Iv4T6xpOfxLvDOo54=;
        b=bS3+a7Jfxh6AQqkFqkABL43s5sOykJn/nM/6UM6fxrTHiGNG37SufrgSDVB28p7z7c
         9abPYWJsH8XBYm0+AOqrVxk6LljPMYARurI/WYMkZkZ/LVpBqvuH2Awmp5MrkT5N9A9G
         eRBQqkyBlA4Ir/oHT+MgOXj6TA/NJH2benIG0wbnDYozTu9r4Vw/clpvL9Hj/KXkZuhs
         SI8wZ43gOhPTbnNk4yT+O16rbFpqWGAOO6Vzy/O32653A9/cqKnEQgzl5v1OZZR4ADGp
         wZ7YnLi+0yjbjINQcdTsmenL2OfoBR77YSFC8GXJY4DBM3kT2OySJ5yLZnkgxAml/LQE
         gp8w==
X-Forwarded-Encrypted: i=1; AJvYcCXxESkkg1LE1O0QU/tb1TeTgDYBdu9q7Mv8/hAcPygo+aUsyHot7s4EaA5y9lDkrrAGj71LZzLS+5KymQXg@vger.kernel.org
X-Gm-Message-State: AOJu0YwPQFXYcpnm8hLkvm8GNrkuiF9kwhs7keMyP76ev4Hx6zT7VO3+
	cx5V3g4Ips3PY50zkugc8hOwFIlKfc4sBwZqa6mqyBwDHxpApCwaiBFrx/UGasV/k8I=
X-Gm-Gg: ASbGncuOrxFpA/PXXPksVSwBxwc1Ym4eUFfnwtqKDFZ/CqcfVMVHhhXGcdNUgN64rzB
	6JXkYqi8xcMG4UFov+5s7S52FiCXjf/y+wjn6NS9BSq+ZniNStCau2LQruLgHG4WDeu4XwDSRBe
	PSnE8g9gTITX0Pnrusr4cjIijzu8BBKf+fTNHcgVM8JFmacFx/K1i7+/dx8Ll4O+eZAbTJQj96A
	/imOtDsmjW48bhEsdQqmnrccGx8hZuVAaVBxpIl0d8Z/uZjv8Whf7RzYgiwB58Z8oapn1J7fCxu
	Rfay0OY1DRcC/v8mwjGPVwOpSePbjifshFVEK5ZpYeKueydFhNzx/DXIRdiXH986qeolzfNpQ7L
	bBiK+eaTTO7qTnuUmyQbsR1S5u9RclI2jh3owz/appHYJnPUVuvFgfF/qoRVDWwUh
X-Google-Smtp-Source: AGHT+IH+KHeZWb8a1D1rLbJA4G+v1vrxTCGhfDWrNtvL4qaj8u5TYdnSOR5Qo8hrL6uX7yBxutp8wg==
X-Received: by 2002:a05:6000:1786:b0:3a0:b84d:60cc with SMTP id ffacd0b85a97d-3b8d343b05dmr196772f8f.2.1753995096563;
        Thu, 31 Jul 2025 13:51:36 -0700 (PDT)
Received: from localhost (dsl-217-155-193-229.zen.co.uk. [217.155.193.229])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3b9160sm3534633f8f.21.2025.07.31.13.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 13:51:36 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 31 Jul 2025 21:51:26 +0100
Subject: [PATCH v6 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-1-4782074104d1@linaro.org>
References: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org>
In-Reply-To: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 devicetree@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=2IIOOJv4YbwpvL/BVb0O1hrl3nXkJFZe7UmfdKaEDFw=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBoi9dWQLp6O5DslUOJC1AF4eOEKb3goQXj3m2jH
 al5BjwpQGeJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaIvXVgAKCRBjTcTwaHBG
 +NbDD/9jkYDOd15vrbb49+K+c8aKuJACyRfHhbGIGM40ARYVhOG9I8RPGsIegUMP0UbubhRmVgM
 eecrT62ywMcqveEqnK6faWVwyUUt3UIsa3t3kmdLACP++xo2RcG54vZK/Kqj2v/V1CHAyqXom+w
 abNJOlMFpZwpKLrOHdnMjDXz4UCpU6RjD8dkZ/4dil25UVFhst1oZcBeq3d/vq6zrSAWQ7x0vPF
 MiiqVMgHv5RPZifkYHXtNqThKhyDQmWA+kTli//acCH0iQl+IMz34PnTKqxgeWr2FmceuDmSvwo
 6SsJ8s0HjcpcQVxiRz2RPvew4pUmMPr8HGZpBaAZa4z6jn7N6wLZpYflIj+Mwj6ZcDLtPZopSJc
 vRhTv8rmbW1d8CayCldqITHONoXUSkwHjIHxrIWu7LKFnAlKR/BT5MYNPDiREOgG2Kkgv51GrIl
 IGCbQXOcA3jfX+OzsdT8a4lJU5KM8hlwn4nyKZN+k0dKW3Wm5C6GD2rv6J+SL5np1STH9SBrxKa
 sWzCV9P/Cf+g92czF9+CeiA2GTfRh9g31p9DFilpWHG6ehCM5atmtmhGcR+39t51sLYZafYUyoV
 CS8XGOdpAERq8xf3k3dP6pfBoI8173tNt6G7dx7zVvG3zWIzwXMX6/XlsL+Z3tIBbRFJ0T6iNaf
 cn7FU3+Z+iFkkfg==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

The eDP controller has an HPD GPIO. Describe it in the device tree
for the generic T14s model, as the HPD GPIO is used in both the
OLED and LCD models which inherit this device tree.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 3 +++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi                      | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index ac1dddf27da30e6a9f7e1d1ecbd5192bf2d0671e..c33dce6fec6746cc7fe2f7a1ab5e9f99feea5535 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1008,6 +1008,9 @@ &mdss_dp1_out {
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
+	pinctrl-names = "default";
+	pinctrl-0 = <&edp_hpd_active>;
+
 	status = "okay";
 
 	aux-bus {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 5e9a8fa3cf96468b12775f91192cbd779d5ce946..8efd045af778beb30831f3af5ad2b901a72d87d7 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5779,6 +5779,11 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			edp_hpd_active: edp-hpd-active-state {
+				pins = "gpio119";
+				function = "edp0_hot";
+			};
+
 			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio0", "gpio1";

-- 
2.50.1


