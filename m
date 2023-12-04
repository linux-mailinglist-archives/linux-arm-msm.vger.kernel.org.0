Return-Path: <linux-arm-msm+bounces-3196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAF5802F1B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 10:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4B74B2098D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 09:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB041D524;
	Mon,  4 Dec 2023 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfilP1x5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B86E6;
	Mon,  4 Dec 2023 01:47:02 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50be3611794so2344365e87.0;
        Mon, 04 Dec 2023 01:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701683221; x=1702288021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6V8QqKWWTE8K+zwNUZJ+bcoYIRF8fZi/ENlPiKMrff8=;
        b=lfilP1x5S+R0uNXyNrJ2bcRUN6ChJVwL6RSdxX+D0ZZ0neu6hkc0ZWQ22tqHvIFXfL
         Ta9UJkwGXjwjAQk9Zz9t0gPuyy9iLeGySIjxVkl7pxNU2igwFkzLui/vDapXeNMm6ysr
         Q16ALpRMgXop9V19Y/Idd92ZGxxmVsIJ3JKF8DvoEVTZgYNYq8TOE3NG/p0yKYaKfvu5
         KVIYEjDGNlDs02D6a45kV6LcLINEiDxLnBbXb4Ez8HrOen53gcDYD7Y4dpocJCpVOcKr
         sYqdkK2SULtzGN94wGFhlZ5nNLvz0hfjZfL2CrlS9Np9lMBpAUrLZPf/lLNC4vWlgwuG
         sNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701683221; x=1702288021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6V8QqKWWTE8K+zwNUZJ+bcoYIRF8fZi/ENlPiKMrff8=;
        b=Kz6TS8qK8bDtbxGvNbIzGRvPAS1RgTG79CgaQovO8lVrnxO1YV9YrugnN7tKe8jBC0
         dTlFLFHiERrOCiznZ+Gl1AeerTtMEp3igPDiUr2OxmKs+tfypCee/yue25F/FUsPCALp
         StiVvcQOaW4ad9J4NgENs5+vEYFh9+RihUunQhdaXoHKDgOpgyXRNQPlKtuS2iMSmNLC
         4vDx8cujv0OWI9P8EtzgS8qEPSMxTUZhuKYMkFGceOR/WF9YOXMKe0tsfk1pk1hyzdiZ
         4/GoABPcLQiXJFxCGC33NoZjeYH+t3RKPBaTfMq9QMcNYgw1Tes4qJzdnodRSU7cvJ7M
         F5hg==
X-Gm-Message-State: AOJu0YyuPzOUtYe6HDhFHYlwY6Kca/e2xfVudxg6gRdQderNC9Da1HGk
	MteHyB46tnegZHfwM5IGEmJRPPBwOv5iQQ==
X-Google-Smtp-Source: AGHT+IEV0oVbT+JADWLD0RMW/EjAkdfa0Z2SYd97EXh9pcrjvDJpPM2Ud/fkLc8st6HLCk98K5bscA==
X-Received: by 2002:a05:6512:1381:b0:50b:fa1d:aecc with SMTP id fc1-20020a056512138100b0050bfa1daeccmr531819lfb.29.1701683220468;
        Mon, 04 Dec 2023 01:47:00 -0800 (PST)
Received: from i-vetokaappi.home.lan (dsl-hkibng42-56733b-36.dhcp.inet.fi. [86.115.59.36])
        by smtp.gmail.com with ESMTPSA id dw5-20020a0565122c8500b0050bfe28cd8fsm41506lfb.43.2023.12.04.01.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 01:46:59 -0800 (PST)
From: =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: apq8026-samsung-matissewifi: Configure touch keys
Date: Mon,  4 Dec 2023 11:46:49 +0200
Message-Id: <20231204094649.10094-1-matti.lehtimaki@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add touch keys which are handled in touchscreen driver.
Use KEY_APPSELECT for the left button because other devices use that
even though downstream kernel uses KEY_RECENT.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
---
 .../boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
index f516e0426bb9..8a2ba2aadf23 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
@@ -268,6 +268,13 @@ touchscreen@4a {
 		interrupt-parent = <&tlmm>;
 		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
 
+		linux,keycodes = <KEY_RESERVED
+				  KEY_RESERVED
+				  KEY_RESERVED
+				  KEY_RESERVED
+				  KEY_APPSELECT
+				  KEY_BACK>;
+
 		pinctrl-names = "default";
 		pinctrl-0 = <&tsp_int_rst_default_state>;
 
-- 
2.40.1


