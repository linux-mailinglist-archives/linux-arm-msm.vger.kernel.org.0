Return-Path: <linux-arm-msm+bounces-26654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC08937CBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 20:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F73A1F2249A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 18:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCD11487C9;
	Fri, 19 Jul 2024 18:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqiHl+bL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08351148316;
	Fri, 19 Jul 2024 18:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721415185; cv=none; b=aUBJJD01rJqGNIsRnsrhXH9opnCfaAGzTG2ocajCYfeaYCyVDnzWZ5gcZeqeR17GX7Tm/l6LFDexV/9juDnWtbyrrdb6hJZ/B/lJSX7f7gYRBh19UuqOZsy5PKIMGO574mGXHSj3nu9BTFtPaB3nYgZmuv9TS0inzTWNf55+FM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721415185; c=relaxed/simple;
	bh=sA2Te0wySkcv9R67I+V+nrhPN+SJSYf6KzI4u6YKWMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSWnt8c1psxrBKMe2Hi/QeMDZwEWGd0e1MwNj5O1EZ1r8Q+CmZi3WQdEZIm3GeFnIcAlba4xkIFzkMzKABEgfHnHQ/ZusaTBHtVmtN7xuF/84eFERUq3qEE1b8bVCjFT/+EVPO3fH0K034RHZ3DNStJVe1V1AEKCHuVoWGc0PMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqiHl+bL; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fc66fc35f2so14269685ad.0;
        Fri, 19 Jul 2024 11:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721415183; x=1722019983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJXJPAJ6qeai6g7MHlvto65MwlAA7XvrgpR3SSHoifM=;
        b=UqiHl+bLNBbx1oXVtx3l1ogpL1HQfPzFS3tTuaLZntWlglddV8CASOGxqOFXVNX1sg
         K5UdMKck9Ct1xcn9E/KMgjlytf5PWsAwdMa4S7alXpTzReRWsffuxo4MINh6Utr3p/T1
         i/At5IIkSDifnhFywHmgxottXB3Gu/0hYtDugvdKiM2wE3qLG7rZqKsMMWeh6V1l55AX
         TYSB5vhLrTDxjc+N3Qe+tkuwXeQwWFRu3VbFGNK3kmSsoFaQiCH8LV2nRpaSU4bT4v3T
         z7fyWxgmmbr8t7uXRsUesmOPPV4fyhqh/fInkaXd1zxvuQqIXY7aHXR4M8cuPuQW9CHs
         5Ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721415183; x=1722019983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJXJPAJ6qeai6g7MHlvto65MwlAA7XvrgpR3SSHoifM=;
        b=UTVda26xclpyLa23VTGTB0K2l3qFXGxoJ4evbS/5KjcmiZVxTXwcsgr/If9TkZd0HK
         tuVB7N2PGCZ8LbnoYhuZUoyaXO4Abp6qJIdyMz5lhHnmKylfcLTAa30Bf0bCfig8u8U7
         JfGhLS1OiqYdBsX1wl/mav6JDLN5W96KJQzR3iWHtGlkq+PRRhnQjxFernlsU9BfUziS
         M0wtEGmbeUieZld2MgjeinSrukm5GqLzGjFUuD8yY3UAG1rF+oSXavEEGS2nHVoP+zVG
         nVuHzAQ5TnD5PapHgYW7lUKJAOusBguSzAK97+6E6denNUPAVl9NzLDwgVAY9y4qNqXG
         GCZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqdoa0v/zoLLVwn0tZtTJAPwKvtQQSejSwc/oOjirDwONUmpwSEoV1eBHRojRqxNwb/G7g8+dswJBGYaMipWTgyU4d5BQq5iiT798dmExWUA5Q7ziRJupljWzmJz73DSwWJycY8i9luA==
X-Gm-Message-State: AOJu0Yw7bq5VYtk/DJlNP72bK6O0B07Uu0GG/z0Ba5WLDRr1iUPPpwFj
	9mvqRx4FJKHEpAbL2YCsIw0Nhn6O6ktW5E9byhI46g8pL3rCtxI9X/WaHg==
X-Google-Smtp-Source: AGHT+IGVarVLbfPkNwMnpHQvy8AxhW+eRxt1CZVPGxTIrFpjhflM9x36Mcrv04X8vdb8+1KLyhcKUQ==
X-Received: by 2002:a17:902:eb90:b0:1fb:129e:69fc with SMTP id d9443c01a7336-1fc5b5b84c5mr83286585ad.16.1721415182608;
        Fri, 19 Jul 2024 11:53:02 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:3279:d3cd:5dde:c799])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f48875esm7921215ad.287.2024.07.19.11.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 11:53:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Doug Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rob Clark <robdclark@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] arm64: dts: qcom: x1e80100-yoga: Update panel bindings
Date: Fri, 19 Jul 2024 11:52:50 -0700
Message-ID: <20240719185250.4877-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240719185250.4877-1-robdclark@gmail.com>
References: <20240719185250.4877-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Use the correct panel compatible, and wire up enable-gpio.  It is wired
up in the same way as the x1e80100-crd.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts   | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index f569f0fbd1fc..28a6ea5a24fd 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -592,9 +592,13 @@ &mdss_dp3 {
 
 	aux-bus {
 		panel {
-			compatible = "edp-panel";
+			compatible = "samsung,atna45dc02", "samsung,atna33xc20";
+			enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
 			power-supply = <&vreg_edp_3p3>;
 
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
 			port {
 				edp_panel_in: endpoint {
 					remote-endpoint = <&mdss_dp3_out>;
@@ -663,6 +667,13 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+	};
+};
+
 &qupv3_0 {
 	status = "okay";
 };
-- 
2.45.2


