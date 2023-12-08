Return-Path: <linux-arm-msm+bounces-3899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 530FB809ED7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 10:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E869EB20B29
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 09:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0E8125A3;
	Fri,  8 Dec 2023 09:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uEBgXbZt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4331737
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 01:10:34 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3331752d2b9so1366264f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 01:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702026633; x=1702631433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNLG30CN2zegE/M7jl95INA4rCvQrv07QBb0d7Gkeww=;
        b=uEBgXbZtxIIXWocqukMR7esUC+HnA3A27K/Ltu6PyX6AbGcyP65pQzWVfOCJumk/22
         /UPeKtNEBeaIyZTcqT643edU92af6LGqGVzs+twU6P+GTPdYpACgUgn73A8uSL8R+oDP
         ZW9MJkgUKBXrinGmcjnMny/9RB620jUPvwPBwPDYOWLYSKhyRTQRPAvSWEzfgeaqNYgh
         oQdk8E++MA58mkdw1yjkHsCt7ByM7/EEC5ZcaI1atiWVTSZTdqcFvE9f+bPb+P75mzJX
         8H2WWrtnQI6/s7XR+0Sa54ewNx3k2TNzQEWbszgdurh6TzJULhhxmKS1yd0A3jWb+GTV
         xTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702026633; x=1702631433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNLG30CN2zegE/M7jl95INA4rCvQrv07QBb0d7Gkeww=;
        b=Fu2pduVQ3eZrAsu7K+CMHpa0F9CeaeL9jZ3J2zuKBxAj5K6UHsM0Vs07gCFAmA7SGL
         6YWl54R2PemrgGdZe0Wf8E8q2HFx23JAL7a2gaMB7w5/nWyNE81D9ykB7I3Y91g9aZsE
         fKZ5/0AkvsJaTJzy2I711J2YyKjzLKhdEiV0PnIUXBXyA3qxRLreARZZdfWllBUgJA6I
         boS/tETf+qN7kB7tlVSt8fbEeHs6CTOuhcPRZC+yO3T4CXfFzf48GTve/+3gPzLvwbGk
         pNxeJ58oES6D+C2/i80qLvMzDf9YW3bdE2oGe+6Vjon90/M+rMTUhjjEb6w2d2rq7WZo
         dljw==
X-Gm-Message-State: AOJu0Yy4d5dkkrOqa479AjIIRvCw096vD/0AKnzaCWgwXudQBl5nWtCM
	hh9NnnJEpcR6W+PFxgUKm5FsVg==
X-Google-Smtp-Source: AGHT+IHx6Uzcak2KLc/VpwAnz/YzCDmjo98fnzg/Xudc/sXEyD36md+4/7yGRsrIODiWnAYGrk4xiw==
X-Received: by 2002:adf:e883:0:b0:333:2fd2:815c with SMTP id d3-20020adfe883000000b003332fd2815cmr2461364wrm.121.1702026633215;
        Fri, 08 Dec 2023 01:10:33 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b162:2510:4488:c0c3])
        by smtp.gmail.com with ESMTPSA id a18-20020a5d5092000000b00333415503a7sm1572705wrt.22.2023.12.08.01.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 01:10:32 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RESEND PATCH v2 1/3] dt-bindings: net: bluetooth: qualcomm: fix a typo
Date: Fri,  8 Dec 2023 10:09:34 +0100
Message-Id: <20231208090936.27769-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231208090936.27769-1-brgl@bgdev.pl>
References: <20231208090936.27769-1-brgl@bgdev.pl>
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


