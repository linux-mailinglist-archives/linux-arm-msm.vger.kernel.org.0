Return-Path: <linux-arm-msm+bounces-15025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A57AF88A715
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 16:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A18632677C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 15:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C43127B51;
	Mon, 25 Mar 2024 13:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="24BaF3aY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE7F13E8AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 13:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711372626; cv=none; b=a3Bbb6he6iGO4uFwPqfP5nxGxb/+rLImiatBrmZmKO8vnNG7e/8H1yBaN3iolJeik/hVg2mQjOxk9p5eNG8miyQ6RtZ0qIQkSaQ+9zKet5WOGT4wYUeKp+eGPmBRycHMe4q7XnVu/G3MP7Gi3xJmbDMt080vZXN/5DrWjOztDhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711372626; c=relaxed/simple;
	bh=wf7ju8vqsLnPRCFf/XISMutA94e5S8E6OhesXhPqqxY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aBBbX7WLRNXP4g0Us4fKX2Y1snSBGbpRbZuLzL+UmpSg2Bhfcl71oNrUp0JfK2EwQ/Mpi0ySAyG1V0V6FdgB+ZWGdkfFj4z2P9M9+dFrOifTU9DIJh+A/UjPXsnH+7zE5RO38rl34viDb66DkZkoBm1t44P76rYYEh6OO+nv4so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=24BaF3aY; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4148c73255eso189415e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 06:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711372621; x=1711977421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+WJda3ss7hoIdDj+/OQZmjsnCcOcWE53qMUaI5LDqg=;
        b=24BaF3aYujXFjNyCLTxmz/p4l0ezw7gLSIA8/bm3tS7bC+qugn0NwR02EJ4EBcrhlB
         ZCK/GmFXD69os4Hgc1Lh0rmIDpNKmtxLckrnz8C3XxEaQB2bGWMjUTsaVOK3zteU5Wit
         f5JzIDawC8nwMSySn4zvUV0rj5bmO45a++qBkEDvQfF2JiJAMTlBcPPnP+pyy31K0O8/
         P/qPGkdckfnaaaIP85VRaLKJC/8GmvwCdcGR69URLyo5Z1UBkZP+UTf/CJdqaoj1TQWm
         wiXGe6dZgPLrLQJYbp2col6qaqiVj9FuoZxPgDvW94zZEiyb9lAe16I53E5nxGZLR052
         rwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711372621; x=1711977421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+WJda3ss7hoIdDj+/OQZmjsnCcOcWE53qMUaI5LDqg=;
        b=q0lnrC1AF1hBsk6RytPk1mGLoZRHbN61AS6+hXaHTqxjdI8yWg58uib+tqXiRm/Cp2
         Nn6DdIxv8Vkrwy7gHvHiRSAkumHa99Zst60Pf9LK+zyr0vIvhHUxpPKivbaQqJ+7OroQ
         zE4r6HREi+2G9S9/OCa4Clx2QDHa6ExpfZF/7mOW/hkh9NrQN5ttJyuO3VDg8vphNmMS
         3hysW38RP3ctoElc6r7wxkZodaKxxfpZ96AQo5MhFiwPTJb8ZXX03P3/BbHij6ISxEL+
         ckeQMxj8lL7l4tgjdsMtwKdANQ9JDWAJCDlYN+LrpGJUtTXDYaD/l6huCnxaFnziGmRt
         LCrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqhIZ5pTUROPK9YnP+Xi/iNsC/QwUqZcQRKXe4agIrIBXX7aaNQqm/itTFLoQxExwzQtlsQiYc8S0h+Ak2YuX6IArv0fze/UYoXAzezg==
X-Gm-Message-State: AOJu0YwVQRLCm5JDizKxRtP1/408wjqclpFWxtF1THqkGGNsA8LCR2Ge
	b1fAeOM+aPOEV/iArhnnZKH9rr1QiGe2l6i0wl1uuMpNqJHcS2mykMtx0gfTOT4=
X-Google-Smtp-Source: AGHT+IHrGIgcKSHFDPU7oqzDQS0x8s+zHke3Mslpoj4/V9XzWkb5PtGf2llHH3pvarPz9u9Ic3zPsQ==
X-Received: by 2002:a05:600c:41cc:b0:414:245:f6df with SMTP id t12-20020a05600c41cc00b004140245f6dfmr4966316wmh.21.1711372621200;
        Mon, 25 Mar 2024 06:17:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:861d:8b72:a859:4ce9])
        by smtp.gmail.com with ESMTPSA id p11-20020a056000018b00b0033e75e5f280sm9485245wrx.113.2024.03.25.06.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 06:17:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 03/16] dt-bindings: net: bluetooth: qualcomm: describe regulators for QCA6390
Date: Mon, 25 Mar 2024 14:16:11 +0100
Message-Id: <20240325131624.26023-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325131624.26023-1-brgl@bgdev.pl>
References: <20240325131624.26023-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

QCA6390 has a compatible listed in the bindings but is missing the
regulators description. Add the missing supply property and list the
required ones in the allOf section.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../net/bluetooth/qualcomm-bluetooth.yaml       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 528ef3572b62..d844acaec1d3 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -62,6 +62,9 @@ properties:
   vdddig-supply:
     description: VDD_DIG supply regulator handle
 
+  vddbtcmx-supply:
+    description: VDD_BT_CMX supply regulator handle
+
   vddbtcxmx-supply:
     description: VDD_BT_CXMX supply regulator handle
 
@@ -180,6 +183,20 @@ allOf:
         - vddrfa0p8-supply
         - vddrfa1p2-supply
         - vddrfa1p9-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qca6390-bt
+    then:
+      required:
+        - vddrfacmn-supply
+        - vddaon-supply
+        - vddbtcmx-supply
+        - vddrfa0p8-supply
+        - vddrfa1p2-supply
+        - vddrfa1p7-supply
 
 examples:
   - |
-- 
2.40.1


