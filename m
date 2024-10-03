Return-Path: <linux-arm-msm+bounces-33060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB1098F967
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 23:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E99581F2187F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 21:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082BD1D017C;
	Thu,  3 Oct 2024 21:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCGxbuNG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822B01CFEB4;
	Thu,  3 Oct 2024 21:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727992686; cv=none; b=sqwMhB+UBoTCYh4SDtEUP8vc1gDBeSb22IAxGRWSTb4apeBolFit7sz3d9MPZcldyImWTEyrlG2GfzGZDfQ3bog80CWDPzEObNWsUBjaoB68GztvI7Uno3vkUW2P4QZPBLLqcM6R1/8d2HGZKtEkuMq6Q/m4nmxc4BvbZ/fLO2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727992686; c=relaxed/simple;
	bh=AITe+joTDTE1ceSIiMueoTWM94jovWJaA1azP+bj0KE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RvdMnbjnuFpzHizJof7bNtO+GsugB8eQytTSKQxfpqM1oogIOz/GtEPQ0vOGs3bJIY62z+Y9oVqoBEjYrRTX+dY/UkJNknB4l3IVvnINrCMW7FNDdCVIzSXu/UyAFD7wbefKHQf3llnMof2swR5S7rpaCxzYs2oFuM/tjXqVsmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCGxbuNG; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-6e7b121be30so942598a12.1;
        Thu, 03 Oct 2024 14:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727992685; x=1728597485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoWKDt0SpQuuIThiGyg8a6unwje1fIaaXWcdpLVdhAs=;
        b=dCGxbuNG+KtnxZ41BD7ijOPNbfNqNT3+tItt7PCCvUfdBsAXAHNW191iwoUCFp0c82
         trW96s5biPihv4t8PUH8MEiBVs1aAHqSqU+fDiTmIfRNSctbhX9PgiYXRsjsGfySiQ2D
         wlFIHvvUT6OM1/437R4KPDQBFoExT7M2akNDIE1gCSGUP6CTqo4n8AFTkbt+Rw1jMGAX
         BGTsBSwHIp/rlDeyX6kBc4qP0s1XEqiLf8hf34cAk7DC/FPmOQUdf57jc2T4lwi1LRY7
         rqrWyie1RFX+Np7RSUdArI9xxRktbpTbN68bdyl5rfZVcj3h+D0w5rNkYysJolYeO7ga
         7HmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727992685; x=1728597485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoWKDt0SpQuuIThiGyg8a6unwje1fIaaXWcdpLVdhAs=;
        b=STyiuEsqAOW3DQD1XXoDJBbb+SczPfsAj2bD8GE592E8jr1traH5q4yvaz+De0KbXV
         JSS24tpDezYBz8AUoDprXOXkdZDJV8R8Q8NzAfIqH2TLEuXoijUNlNsrXKlJnO2+njll
         wXlK1HvEeT1FhgLj7F4U41kY7oP5x8WdrChQ3JQENkE0sNZae2UdAj6//3NnpvI7IXOO
         /vITC+omx+gJThlafA1ZFN/Y91pi+cCLm9WIkVaxiayMlDGMXJumDQTf4oXZMBoFVq99
         bdTjK+Yzamte5icsoewE6kzz5HhSSMudMhni4QX7zxutL36NHVK2q948o/z50LIIev5J
         2DDA==
X-Forwarded-Encrypted: i=1; AJvYcCUbRJDkqMCwIzP2lkQIF4WqG80pzGUTOiuffhZhe1DuMTttTjBUxXd5NfgPpK5wjFnjEBmrCfELAYKO724/@vger.kernel.org, AJvYcCUsPrCCnmvaQxpo4gC8yrF3L9S2/cdIqkffOo0AKb+DsrpkcrxErOw1QS+sAAJ/EOTQhm2IKSrv@vger.kernel.org, AJvYcCXX87igfdtW9081sFN7V2p+gnKHIJs8Ztp7UiD9qaOHkXVHHQZCcbRg1ihl2c+QjfCdtxPdQFpuxRi6n19q@vger.kernel.org
X-Gm-Message-State: AOJu0YzeX7scgDpC90jRWLEDy41tWUyWjgsvphSjm5AYowrrkFgTYCsi
	Ln2nU9pNGggw583bEwiouS9rcux0OpVIo6wYmVlO5HLloDa08uJbvX2Kn5SP
X-Google-Smtp-Source: AGHT+IGKkbd3xJEakgda96Mzg7E21a6ZE9bsKsHRDvZzyTa8MLym/gUdPLpgQwzRTLIL4veRP+kBKw==
X-Received: by 2002:a05:6a20:9f0f:b0:1d4:fac8:966 with SMTP id adf61e73a8af0-1d6dfa27e8emr889256637.10.1727992684786;
        Thu, 03 Oct 2024 14:58:04 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d6e67esm1863026b3a.39.2024.10.03.14.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:58:04 -0700 (PDT)
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
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCMBCA ARM ARCHITECTURE),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 5/5] documentation: use nvmem-layout in examples
Date: Thu,  3 Oct 2024 14:57:46 -0700
Message-ID: <20241003215746.275349-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003215746.275349-1-rosenp@gmail.com>
References: <20241003215746.275349-1-rosenp@gmail.com>
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
 .../mtd/partitions/qcom,smem-part.yaml        | 19 +++++++++++--------
 .../bindings/net/marvell,aquantia.yaml        | 13 ++++++++-----
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
index 1c2b4e780ca9..8ae149534b23 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
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
index 9854fab4c4db..f57a6e7d0049 100644
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
+                    compatible = "fixed-layout"
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


