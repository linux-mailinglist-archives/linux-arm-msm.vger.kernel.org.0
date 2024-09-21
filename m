Return-Path: <linux-arm-msm+bounces-32132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D781F97DC28
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 10:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E007F1C20D50
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 08:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6C91552E3;
	Sat, 21 Sep 2024 08:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DkLovxu6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477BA15445D
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2024 08:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726906661; cv=none; b=GcggHBs4XdFf1SPOBkALxOwklo1lfXpqPcRqK2XV34CvKWRXrU9p5nEkj1AFeltmSArbCorSPuslRgLn5E3iEoDLqGcKna1ct3ImeeZpQzZMtk6p4Dec65dHx/bXEIyMquUQsZrhCoWyomtJjCE7N3+kM2D/vVKoimwXm1n+cB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726906661; c=relaxed/simple;
	bh=xLM1ISnVwa/GRZKkuzfezgSM5E3kbR2k0DPUIeRVKCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bO007QvsATe1RQvkos19W88nzgXRtK/mcJd/CVeentE5YGnOcwLGCmN5O5kCD1IQHXRBzrrNVD4fpRROevOMhPYdCMHP/54CMXNPMVlufwXznTr2G1tBDFGdgOof3tApOScXMRTIpy7t91my2KLldHldgHInc9yEz5kKznKSmu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DkLovxu6; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53661ac5ba1so2948841e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2024 01:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726906657; x=1727511457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmjLhN45ALPPiR+iRXWQ3K4t8AHpJus0NbAIqkjIKHc=;
        b=DkLovxu6zG2bLv74huUg7OrL4cbvrBlARZzFJhpbQGd9n2+Skj6hk5D4X446I6uuiq
         mEYTkk4Sf80XJ0isThjV3MdVaV8/GmeT/5jPNFTqHtywA9x6fZHpjYjG33SJBLFWTyCB
         /qwM2FPdRj09VpFenXVVCYCcJLdf5nyMDVFn0VS83ttMi39GksfpGHGBt8epuDT0LkUc
         FTcLNnf7vUjfArUu3Pg6nClr0BwnscGwDnOgp9RIq/TiVxxrs4Xk+iDv7K3R7kUdJrv4
         HjqspIJJuhEXGX4E1iJCS5rbIkg9YoIXSC13LUtJ1AwN9V25lVRKBaA2TW3oay+Hxjjx
         hZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726906657; x=1727511457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmjLhN45ALPPiR+iRXWQ3K4t8AHpJus0NbAIqkjIKHc=;
        b=bG7X6vIGgL4JT5o7KAwMaa0x8LqQ3KzosRZYWINQXe0Ipqt2uor2dgOfhO1ItZOZL8
         rbK8tdltC6RZB4oxRl8PLieqoAbQkIR1MwuFiKFKsu0Gih7MJJ4PIGrsN7ryXcW4Cccd
         t8Ot2Xzxh33Ypj1r9m0Ge99Arsb8gdxcyR3iL9jfdk2UmrmJWWoeFGgN2/VR1yY0j04b
         /YFli/S9JFt3/+oaLt/9ePyRCe6Z0TOoSDCgLb5eFQoBamJQ+ZdrjB2BCt7oM5BkQGeV
         5MbIuaos8BfApFHzkciygnexRPNG/QDZABx+sLc11+x/r0lTajxOZGzREID/oH8d2PN3
         1ORA==
X-Forwarded-Encrypted: i=1; AJvYcCUpXdgiR7hqsI2yfWA3+h21isQqr7Ea0lIG/HdItezB7LcWJNgj96fnb4rgy9eDCS0BobDnVvd/0rheTHZ2@vger.kernel.org
X-Gm-Message-State: AOJu0YzVYpnjAHbqNkKbYVEEkYm/0Sq24m1ins1vaXA7669/PieB5nYQ
	Evwdz34T0Koe6R2NbjkUuiIsa7M4q9ZbjqxrJDmE6qTHuE/1+1DV3CIhKwIrBA8=
X-Google-Smtp-Source: AGHT+IGxbdLlaIHZI3XMOG8yIZU4pHHubytur/pR5AgxpylOBi198gvBqPuSta56H37+ZeQhmJjWRQ==
X-Received: by 2002:a05:6512:12c4:b0:535:6cef:ffb8 with SMTP id 2adb3069b0e04-536ac338a9amr3458360e87.54.1726906657229;
        Sat, 21 Sep 2024 01:17:37 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870968d1sm2466380e87.175.2024.09.21.01.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 01:17:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 21 Sep 2024 11:17:29 +0300
Subject: [PATCH 1/4] drm/msm: move MDSS registers to separate header file
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240921-msm-mdss-ubwc-v1-1-411dcf309d05@linaro.org>
References: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
In-Reply-To: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3169;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xLM1ISnVwa/GRZKkuzfezgSM5E3kbR2k0DPUIeRVKCA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9q7RvmrvSzz6qY77lq3Y239d6FM0cAjy46E/LzRb+T8l
 7k7xzuyk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATWfKD/X/tKw3dxFsN4Ym3
 YpXVTZRYN9jL5NXWnOlYHOdqu9t9jWvgkaZ1dg9d/m195H6t7pqhXHZW3vPbCv1xiybfcZVc++V
 Dpt+F+mzlxzUmP1ofvWll2bBo4S+FXC9uy0ym9lCl9w8LbgucNHoix1W5a5bYwzKbPX9L3Jju2H
 VOve4vPsk2Y7K33OLwstK9t2LUFy5huLT0oIqVwgV7nT+v7z49EbNsq2WfFa/VM9tb7TvDfvJ7L
 1N3WOb5/1ebqSTvlijxz65FZ2y09hxzSJ88tYmxLs6zoXjeeTGFJYWhLsvepWpK/85wCVr12z3W
 jc9xzuuo6wzS9luXBKZYamvWSKsfZvv+tPuFQRuf9rY8AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In preparation of adding more registers, move MDSS-related headers to
the separate top-level file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile                   |  1 +
 drivers/gpu/drm/msm/registers/display/mdp5.xml | 16 ----------------
 drivers/gpu/drm/msm/registers/display/mdss.xml | 23 +++++++++++++++++++++++
 3 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 13110fcc46a8..db2174e2efa8 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -210,6 +210,7 @@ DISPLAY_HEADERS = \
 	generated/mdp4.xml.h \
 	generated/mdp5.xml.h \
 	generated/mdp_common.xml.h \
+	generated/mdss.xml.h \
 	generated/sfpb.xml.h
 
 $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
diff --git a/drivers/gpu/drm/msm/registers/display/mdp5.xml b/drivers/gpu/drm/msm/registers/display/mdp5.xml
index 92f3263af170..8c9c4af350aa 100644
--- a/drivers/gpu/drm/msm/registers/display/mdp5.xml
+++ b/drivers/gpu/drm/msm/registers/display/mdp5.xml
@@ -9,22 +9,6 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 <domain name="VBIF" width="32">
 </domain>
 
-<domain name="MDSS" width="32">
-	<reg32 offset="0x00000" name="HW_VERSION">
-		<bitfield name="STEP" low="0" high="15" type="uint"/>
-		<bitfield name="MINOR" low="16" high="27" type="uint"/>
-		<bitfield name="MAJOR" low="28" high="31" type="uint"/>
-	</reg32>
-
-	<reg32 offset="0x00010" name="HW_INTR_STATUS">
-		<bitfield name="INTR_MDP"  pos="0"  type="boolean"/>
-		<bitfield name="INTR_DSI0" pos="4"  type="boolean"/>
-		<bitfield name="INTR_DSI1" pos="5"  type="boolean"/>
-		<bitfield name="INTR_HDMI" pos="8"  type="boolean"/>
-		<bitfield name="INTR_EDP"  pos="12" type="boolean"/>
-	</reg32>
-</domain>
-
 <domain name="MDP5" width="32">
 
 	<enum name="mdp5_intf_type">
diff --git a/drivers/gpu/drm/msm/registers/display/mdss.xml b/drivers/gpu/drm/msm/registers/display/mdss.xml
new file mode 100644
index 000000000000..9354cfffb730
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/display/mdss.xml
@@ -0,0 +1,23 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+
+<domain name="MDSS" width="32">
+	<reg32 offset="0x00000" name="HW_VERSION">
+		<bitfield name="STEP" low="0" high="15" type="uint"/>
+		<bitfield name="MINOR" low="16" high="27" type="uint"/>
+		<bitfield name="MAJOR" low="28" high="31" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x00010" name="HW_INTR_STATUS">
+		<bitfield name="INTR_MDP"  pos="0"  type="boolean"/>
+		<bitfield name="INTR_DSI0" pos="4"  type="boolean"/>
+		<bitfield name="INTR_DSI1" pos="5"  type="boolean"/>
+		<bitfield name="INTR_HDMI" pos="8"  type="boolean"/>
+		<bitfield name="INTR_EDP"  pos="12" type="boolean"/>
+	</reg32>
+</domain>
+
+</database>

-- 
2.39.5


