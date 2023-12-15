Return-Path: <linux-arm-msm+bounces-4945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1711814ED3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 18:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D5A32874AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 17:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4E64122D;
	Fri, 15 Dec 2023 17:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I3vTY/Iy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BEE41860
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 17:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50bfa5a6cffso1070493e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 09:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702661411; x=1703266211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXxEPbVpvlpkz5h9kq5ZSDoZpnxMYJx569OmkvoDVuM=;
        b=I3vTY/Iy2/cM/mTDsAFfwVM18esevBF22FCDo2fFzsj2xHTqpl/wCnCvIPN0s77HCE
         Vxzq/kbV0WI//vRJ6xmfGov7xOmHCXX0PbfHhh9vXDz8vubrvt+MjFxCOCios16uFdqC
         8Ajg98hWtjaDk0/awvA8xOyvibBTp3WeQVhnzwA5n6InF3yM6Kqo1QCD89YLlLFjIzfM
         TTZIdtHc4y6637SmY5lytUxahImvLnU/VGmJSi5IDnzeF9VglO8ZWSeglk3jM5eoj45J
         24yyJHgrPQbX7wCP+KkK2dW0ufJnrZtgCMDTih729TvzVj5QLyhq+wuNcCs9eRr0Ulcc
         kydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702661411; x=1703266211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FXxEPbVpvlpkz5h9kq5ZSDoZpnxMYJx569OmkvoDVuM=;
        b=seFS7/RCUjoJ8vWuz6woA5CoIzcXFfZaB6uTP3z9Y1Sez6ri9LUIXgblhUH0N6LEAm
         A4l9oi73Vo5hzv46n7R1UxZ7BgQbwNuGe0KsWYk2zedqPR+g1DY/WwULPkIVaymZR/bD
         SdPfXz48ncU2MWtVHBlB3oNprmzQ3OoyoITA6r1tryVYT+d7PqXYy6zSgPaxJx5gfNmG
         hgCM9aecisHH3MOe2BVfXvq+7EdgmDmTPu9M16VeFtIDYR0IxO+LwnNWXJVdr7iPSI+p
         pHXKB8fEzXzv/HKeT/6aPgS3wG3nwyEnxSlDdQMsmBn3twTajRR9Dt688NrtMS0XPyWF
         aKHw==
X-Gm-Message-State: AOJu0YyUbXqQmWxeLdh9BkpUaDJfCQWpZ2GUmX+HGc0eWrfd7v1Oq9y9
	wUvPxw08emMfA4Z4Tk56yfbIcQ==
X-Google-Smtp-Source: AGHT+IE7218glxhiZz2gh4AtA5kRLKfEHG0lrOJTOLYEAG1ZqxJ/q1RgeGY0//AHef5htJVVywJzcw==
X-Received: by 2002:a05:6512:3c9a:b0:50b:f2f4:279 with SMTP id h26-20020a0565123c9a00b0050bf2f40279mr6961634lfv.110.1702661410833;
        Fri, 15 Dec 2023 09:30:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (85-76-13-188-nat.elisa-mobile.fi. [85.76.13.188])
        by smtp.gmail.com with ESMTPSA id g8-20020a056512118800b0050bf54b9f18sm2202274lfr.113.2023.12.15.09.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 09:30:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Rob Herring" <robh+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH RESEND v2 1/2] dt-bindings: connector: usb: add accessory mode description
Date: Fri, 15 Dec 2023 19:30:04 +0200
Message-ID: <20231215173005.313422-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215173005.313422-1-dmitry.baryshkov@linaro.org>
References: <20231215173005.313422-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/connector/usb-connector.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 28660b931d0c..f5966b3a2d9a 100644
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
2.43.0


