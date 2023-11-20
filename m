Return-Path: <linux-arm-msm+bounces-1246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B574E7F2154
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 00:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 388A5B21A67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 23:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15EDB3B28A;
	Mon, 20 Nov 2023 23:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SwxzExPJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4E6CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 15:18:01 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50aab20e828so2530743e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 15:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700522280; x=1701127080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFG5UZCWSj4c38SGi7sUkHkOSwjgQKhUp/xUHaHE5CA=;
        b=SwxzExPJPjvRgOB1RloZ4w57l77d/v1ZwZVgR4snrjwUcIKFomdKcqFHEK+FymobGJ
         FMiHDUWVKGGoDW8HIfIr6+ladZ+xeezhGlNtdpB+3Ob1IPGaWTrMrMkEBUaktmODravI
         CBriBq9+eyL4LwBCw7VyP6BLDimbe7KzKZ25vGRxjnmruvLWMQ3klpXfI2dnQfKyg5+E
         xC/WWS6iwOqmhCENW1c6Ce1Q4JtD+4fKtPUmAOse2RfHs6PJtgsWQC+242KPISGOobNs
         MMRFw4eGayuo5ERxubBILv3+h0tq0XgxwzOHm+/Ik9Ttmk2oCThN9xTdDktUDDxBA6NK
         gN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700522280; x=1701127080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFG5UZCWSj4c38SGi7sUkHkOSwjgQKhUp/xUHaHE5CA=;
        b=cN92UlaNTJCjhWa1shohr0nvfrKv10xVZY6kkqKuCBHnDQni5ZkowM6nTU2rSGIEu/
         fn0uHC6xx4qXVjcGjN4jCRovKuCLVhfnOzSbxlswVPLoOr5IXvU+h1U0Vf3NCHf6MMSq
         J0dXSVYOw2y5JEz7YwsPdSzFeOwIAnynFjlxy8OCSIWPTrkI3YjWBqF7VjMI32A82jhE
         zQzb0+0V13RxzR/dSGEv4aKX7dhzXGI8qT26JcO89vpbXzVAApjHaDx4bA6+9j0MhYkp
         regdWvIAdYknrbuBPaS2gvg+IhyZxFAGXKpRPdLh7cHmvAEmxNsJQCQtZUiSduyEHHNB
         MBGg==
X-Gm-Message-State: AOJu0YylXR/+M8S9W+/1IvkNi3lNGzMbmE/o4PgG3eSIvee/gJJJ87pI
	pw03+gci5d4mE5F6cK/gZ+5qZQ==
X-Google-Smtp-Source: AGHT+IF43HFbIPmn6HBOTMZR09V95y1irPM+XxX1kmWAOq9mfIqu2NLsmIkZAWWGweUOLoXS6AqbfA==
X-Received: by 2002:ac2:59c7:0:b0:507:9787:6776 with SMTP id x7-20020ac259c7000000b0050797876776mr6501306lfn.5.1700522279928;
        Mon, 20 Nov 2023 15:17:59 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id bi32-20020a0565120ea000b0050aab042c7csm677036lfb.190.2023.11.20.15.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 15:17:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Gross <markgross@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: connector: usb: add accessory mode description
Date: Tue, 21 Nov 2023 01:11:07 +0200
Message-ID: <20231120231757.2309482-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231120231757.2309482-1-dmitry.baryshkov@linaro.org>
References: <20231120231757.2309482-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add description of the USB-C Accessory Modes supported on the particular
USB-C connector. This is required for devices like Qualcomm SM8150-HDK,
which have no other way to express accessory modes supported by the
hardware platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/connector/usb-connector.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index c1aaac861d9d..b4f96ef85fb0 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -171,6 +171,18 @@ properties:
       offer the power, Capability Mismatch is set. Required for power sink and
       power dual role.
 
+  accessory-mode-audio:
+    type: boolean
+    description: Whether the device supports Audio Adapter Accessory Mode. This
+      is only necessary if there are no other means to discover supported
+      alternative modes (e.g. through the UCSI firmware interface).
+
+  accessory-mode-debug:
+    type: boolean
+    description: Whether the device supports Debug Accessory Mode. This
+      is only necessary if there are no other means to discover supported
+      alternative modes (e.g. through the UCSI firmware interface).
+
   altmodes:
     type: object
     description: List of Alternative Modes supported by the schematics on the
-- 
2.42.0


