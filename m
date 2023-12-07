Return-Path: <linux-arm-msm+bounces-3627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C2C8083FB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 10:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57878284169
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 09:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE558134D3;
	Thu,  7 Dec 2023 09:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CQ5OKXtB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B6101726
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 01:12:12 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40c26a45b2dso3897005e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 01:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701940331; x=1702545131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNLG30CN2zegE/M7jl95INA4rCvQrv07QBb0d7Gkeww=;
        b=CQ5OKXtBgoLI7WRNq+gepaxQthGmLKGMx/xDCrEKKseT6EmHhNOF1vEOQLq2E9WTOP
         MKu0hz6n9mKExAoQ4PqKoFynIwUdWJg9vgrMA1WUn2566fcgBFrPPbZLVFSE7QVdaCGw
         DASzFHMY05UvH7Bh0+qnv50ZQoX1ec4Dy0evFsX4GfltgaC3ZNfrHgDV16GLJgLyN4DD
         kuhEpFoXt4Btqsl9kroFcOhC6mZxdNJj7VUgC3g+Fi3Jx/WJj962PuljGcoXuzufHJgb
         +wlD9p5igrvKvDmiFS8dNvnsqlF20MoeYZ34bP9c5keQsE9xvV+GFyXHdtC7+p+zjvXk
         HG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701940331; x=1702545131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNLG30CN2zegE/M7jl95INA4rCvQrv07QBb0d7Gkeww=;
        b=wUcD4CWg+OwNe08dts9NO8mv8TE8oeFIE4A8pD/59GHYid6RblbYDvk3IkXrLKCVJf
         ObnkwNwHC4avg5QDZPnHPADOvs+KxMtu4fiphobvC6GzaU9JSoOwY7oamywhh6kA6Vwe
         f9hUQJTx2jWnMmCGdskYmGKpP461ja75QFrAhDUNUz2K44eZeTZtqXdHD2OhTIbeUvYn
         YOzFE3PKFUMxaxMfvV05L+u/JrAK4nMPDOQh/iNSBx9n7GunZgJJ8D8g1OV308bPfUTn
         RH4NMTO1FKjJH8tLA0K4t7iNVbvrrNVxGw7V5WDFKYIamKjVfTCFEAmYr3QBQamklbBY
         M11g==
X-Gm-Message-State: AOJu0YzeQk4Ypr2E1PlXtexfhMT0lXd43i+vE4kkLLTZyI06s5mLuYEg
	Wsdjmm48XT5h/cusKG/p5m81sw==
X-Google-Smtp-Source: AGHT+IErPK+hX/Ij8xcH1pt2rolGWBmbdJU42c/YHeF/TrT7Ywo/oD5Kt5AujnyiPUZWxwdSbkeY5w==
X-Received: by 2002:a05:600c:3553:b0:40b:27b4:b4eb with SMTP id i19-20020a05600c355300b0040b27b4b4ebmr2418920wmq.4.1701940330981;
        Thu, 07 Dec 2023 01:12:10 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:de32:8b0f:dc9a:4dce])
        by smtp.gmail.com with ESMTPSA id y3-20020adff6c3000000b0033334c3acb6sm896009wrp.98.2023.12.07.01.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 01:12:10 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: net: bluetooth: qualcomm: fix a typo
Date: Thu,  7 Dec 2023 10:12:00 +0100
Message-Id: <20231207091202.19231-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231207091202.19231-1-brgl@bgdev.pl>
References: <20231207091202.19231-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Spell supply correctly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index eba2f3026ab0..ba8205f88e5f 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -69,7 +69,7 @@ properties:
     description: VDD_RFA_CMN supply regulator handle
 
   vddrfa0p8-supply:
-    description: VDD_RFA_0P8 suppply regulator handle
+    description: VDD_RFA_0P8 supply regulator handle
 
   vddrfa1p7-supply:
     description: VDD_RFA_1P7 supply regulator handle
-- 
2.40.1


