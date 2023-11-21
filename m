Return-Path: <linux-arm-msm+bounces-1407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B58CF7F3773
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 21:31:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 216C4B2180B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 20:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749AF10F9;
	Tue, 21 Nov 2023 20:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XbUOLmjj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20E341FD9
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 12:29:31 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50a6ff9881fso8783531e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 12:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700598568; x=1701203368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFG5UZCWSj4c38SGi7sUkHkOSwjgQKhUp/xUHaHE5CA=;
        b=XbUOLmjjz9PPlcr3KzGO4M0K/yAcbwtQDQcaYeKxnPrVbT9XvSg/Q2rmlrffDl5t9B
         Zbx/LoXc9yq/h8eIFlX7r24EO5vPk1nyhtmHEep1JWBRk5MIOOmKaUUx31l0P+a5eGv4
         pwA7IXMAeeRA4oQh3c2aVY4snPBOnZaKcstSDTSA155gKBaFmOa2LAdFOLydJVqDOaE5
         2uOIOYt4E5jIa6MdShVxxgpL9MxqI5BwacvDGfN+JEWsAmaNUN9bTJ/qUMI43O/FV7oe
         XtqaeSWJgwYhQk6+7+uKsVRdhlVJlBEntzt3NuOCdYrp9erd8KDDspO90qKdASPXQc+2
         iY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700598568; x=1701203368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFG5UZCWSj4c38SGi7sUkHkOSwjgQKhUp/xUHaHE5CA=;
        b=EVshi+TRWwW9hzc4pe6/gInjqLKRnD6IDhAKrXwftpkApL6j4B3i9BF5dqCCcXMWLI
         UWXP5KhQM+UuPXyXSnZ4hz0fUN2KyBVRDReHVLSu0KTWRWuNCkdfe47DjQaM8uFvbTLq
         rFUhbfz3jiwibyLZfaxdTIkl+MShblXjm62Biuvm/0JD9MseHOzR+Q7spYfgYKuX+TFw
         Wq1RLC4dG5NcB7nlifY18s98NWN2LFu9as2+G1SJ4hIekdDvsfAk1EXHN34TK6afnzaH
         5UcR8afG1Gm/wHKl09tVivW0yxrSVZV6HG5IKj3IZsiLpiA5jBpkH1INfSLvTmI95OXm
         wvtg==
X-Gm-Message-State: AOJu0Yy1jcGisjfJnEnJJBKO9ynhzhkxQhOb3eZYML2YWLvmDKFnVFTC
	7MOPoyiYf7gZVh8b93hRwxgdZg==
X-Google-Smtp-Source: AGHT+IHdxm/QrmdM6SWBooHi4UuMpcZ44xT8udenVhL8SjC3GHrt+VgknHZ0o2wEJMoiWz88C1wPFA==
X-Received: by 2002:ac2:4c36:0:b0:508:1470:6168 with SMTP id u22-20020ac24c36000000b0050814706168mr204843lfq.57.1700598567709;
        Tue, 21 Nov 2023 12:29:27 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id h4-20020a056512350400b0050ab6112af2sm286287lfs.65.2023.11.21.12.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 12:29:26 -0800 (PST)
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
Subject: [PATCH v2 1/2] dt-bindings: connector: usb: add accessory mode description
Date: Tue, 21 Nov 2023 22:26:59 +0200
Message-ID: <20231121202925.2481471-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121202925.2481471-1-dmitry.baryshkov@linaro.org>
References: <20231121202925.2481471-1-dmitry.baryshkov@linaro.org>
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


