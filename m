Return-Path: <linux-arm-msm+bounces-33748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC759977E1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 23:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF1541C22883
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 21:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3DA1E7C3E;
	Wed,  9 Oct 2024 21:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iu6/xZ8o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508481E283D;
	Wed,  9 Oct 2024 21:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728510548; cv=none; b=E2neXGJ+OoxSLGXQEjGvqw7oFkBKLzyp99ucjnlLiaPnJDtnc8D3wixrdG5Qpg/dhoXA3zscpDBz5g8FZU4NJzYl5ZXQqdYsn6JzewuownVFjGCkfXH3Cwk/1rKpzv0oJScx64ORWgoVbbt07rsdUJ1TYotSItN+4l5Hf4KQMmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728510548; c=relaxed/simple;
	bh=8/V4mCz60Djcp4rXiN2Qk3GZR0mXJBHEXRg8u/t1mVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rMu6MF2HsTS8oZIUCZvtI6ytujfqDFgRZHzDEhKmPBLzOyMQ01aSRdfxLe2F1BP8Q41m8MAA2MHKjS6Qn1PEL9w73iK58O38QMo0X9N9B8PZ6b+hxaQqBL99kebxEGs+9CB9ZPZex7AwxYS9q+DO0Jln3h85UFsG7KI0xeOgiMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iu6/xZ8o; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7e9ad969a4fso154605a12.3;
        Wed, 09 Oct 2024 14:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728510546; x=1729115346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omks9Q4h4Sk44JoHLzJxf+QUQKqJEvhZ1YL1d9UMfmc=;
        b=iu6/xZ8oD01Y5fu/OPbtoMcqkL0VNgebj6qEso0TRaFXeUg4FB1oiP7q7wMIsIlwvA
         tWTkHy+iRdRML6z2ib1Edr/61DvC2UTEDVhNLHrt6RijQHOljTBpAO2QZYvB4s+mtbE0
         0fvrTYueOP+ufY19BrdJsse10ArI/ngcsr8EoEPHAF5MQQcYZjyBTiWgnXpE5P/HU1ZB
         144xD+PJxf/HcXb0iyRJNPVPr41cASOLIMpuzqSZhMZQRfN53bRpszw5F4ggRinlQ4QB
         vDABk2rxgQRqC2PoYcJimXQo7wn+w/ozHBpwkKjCCV5bpTaSNi9U1WBmM9pwqM+4znZC
         HqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728510546; x=1729115346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omks9Q4h4Sk44JoHLzJxf+QUQKqJEvhZ1YL1d9UMfmc=;
        b=R8aLh/X0nci8nEGsrELjt5071xQHMFGQDca1IaBLX4p443T1m0vbxa1JOWgf2WAISJ
         1TIz0qnAzcvNMymBORUA5U/ivUCbztaEMrkXDmlTKLaCNM17QfxJBuGtUCCkOajeakZ6
         /yGqaoJrzVMTsa+jIVydRwOLPXmXcMuaed6kC9nXV3sDayjQwmv4ohVgpPdskbnxFTPv
         T8T1b88PAGFHvfRiac7vYxrO45ZM5BiT7Vy1cctvpul1/5SyCdZu7yWKBHQQb382Wctk
         nCRhz+j3IKoOXz5bJ/HrwhY+O9pBv1o/ewDTtwxdX2GVmuDK6Bz/tMdqIwu6/OeW6oz8
         ytHA==
X-Forwarded-Encrypted: i=1; AJvYcCUGvfrpiYwZR0Kf4bx95Meywc2PBmp61lq1lSTXU+uKn/QxY5Ks62aW5jHasimdsH1Nu8J9gItix1POPfmK@vger.kernel.org, AJvYcCUjUJY4M0f8jAqzgj30J5Uz+ch3gLqoHpM5P4ax8wc5nEbsCChElAsEiw/GpEjUYr8R1S9bgiNQMxhOkkqI@vger.kernel.org, AJvYcCWFW2xAwq4xjyrkjqsoRIeEhRGTGIn3Lnt9PANq58uDLybE9YAklKFg7URDoTc55++MLiAe43Y2@vger.kernel.org
X-Gm-Message-State: AOJu0YwCRtaVCQIJntNm6lSCLiIAfwVMK/THLhsIDarj87sACSwcX/RG
	QB+6OXV43C38s8HncX6rEt4dhB4hFyr4CtL9Lf94mlFOxTjAmqCWXompKjwp
X-Google-Smtp-Source: AGHT+IGJTDWb4p1RVq8AM/pshnbsRHxFVfsJRJKLsj6ouxokCYwq4RiFeILnKKSnnCg/FTOOAbILsQ==
X-Received: by 2002:a17:90a:fe82:b0:2c9:6a38:54e4 with SMTP id 98e67ed59e1d1-2e2a2599211mr4000173a91.41.1728510546505;
        Wed, 09 Oct 2024 14:49:06 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a5707cacsm2250091a91.21.2024.10.09.14.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 14:49:06 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rosen Penev <rosenp@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	linux-kernel@vger.kernel.org (open list),
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCMBCA ARM ARCHITECTURE),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv3 5/5] documentation: use nvmem-layout in examples
Date: Wed,  9 Oct 2024 14:48:47 -0700
Message-ID: <20241009214847.67188-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241009214847.67188-1-rosenp@gmail.com>
References: <20241009214847.67188-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvmem-cells are deprecated and replaced with nvmem-layout. For these
examples, replace. They're not relevant to the main point of the
document anyway.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../mtd/partitions/qcom,smem-part.yaml        | 21 +++++++++++--------
 .../bindings/net/marvell,aquantia.yaml        | 13 +++++++-----
 2 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
index 1c2b4e780ca9..c2cc11286d80 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
@@ -23,7 +23,7 @@ properties:
 
 patternProperties:
   "^partition-[0-9a-z]+$":
-    $ref: nvmem-cells.yaml
+    $ref: nvmem-layout.yaml
 
 required:
   - compatible
@@ -45,17 +45,20 @@ examples:
             compatible = "qcom,smem-part";
 
             partition-art {
-                compatible = "nvmem-cells";
-                #address-cells = <1>;
-                #size-cells = <1>;
                 label = "0:art";
 
-                macaddr_art_0: macaddr@0 {
-                    reg = <0x0 0x6>;
-                };
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    macaddr_art_0: macaddr@0 {
+                        reg = <0x0 0x6>;
+                    };
 
-                macaddr_art_6: macaddr@6 {
-                    reg = <0x6 0x6>;
+                    macaddr_art_6: macaddr@6 {
+                        reg = <0x6 0x6>;
+                    };
                 };
             };
         };
diff --git a/Documentation/devicetree/bindings/net/marvell,aquantia.yaml b/Documentation/devicetree/bindings/net/marvell,aquantia.yaml
index 9854fab4c4db..5d118553228b 100644
--- a/Documentation/devicetree/bindings/net/marvell,aquantia.yaml
+++ b/Documentation/devicetree/bindings/net/marvell,aquantia.yaml
@@ -98,15 +98,18 @@ examples:
             /* ... */
 
             partition@650000 {
-                compatible = "nvmem-cells";
                 label = "0:ethphyfw";
                 reg = <0x650000 0x80000>;
                 read-only;
-                #address-cells = <1>;
-                #size-cells = <1>;
 
-                aqr_fw: aqr_fw@0 {
-                    reg = <0x0 0x5f42a>;
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    aqr_fw: aqr_fw@0 {
+                        reg = <0x0 0x5f42a>;
+                    };
                 };
             };
 
-- 
2.46.2


