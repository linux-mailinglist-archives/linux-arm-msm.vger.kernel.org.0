Return-Path: <linux-arm-msm+bounces-33072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D9598FB59
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 02:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC6D41C227B7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 00:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02038154C19;
	Fri,  4 Oct 2024 00:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQUbGIJG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAD41D1E9B;
	Fri,  4 Oct 2024 00:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728000035; cv=none; b=hMabDoV13YRyz5wSF6vf4YvUeV979zxZo4vWZVB/rXh3M5uSp9Q3EOdVtTihYFNUz9oR4eWuTGaJznJ/dfhJpsGbvCZniYTANlAiGq6Rxi7Jg1Ecq+3m6+8DFjaA6UHZVOKMOToxz+BaMdV3KrUMU0I2i+MWmXcFOgYvVnv+ca4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728000035; c=relaxed/simple;
	bh=0YcDLsbwBepenWfoJZWFdsKWsOmtv44Xzd2Zv1XAZdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7bLhgauQc18A8ZTw18eq8zumYj1PsStLbCVS9Upu7q7FoVjeg2wQXf1e9h09v2pMXo4jedR7GK0dr5I0TloicMpzbWV3E/IVYeM1qrTH2S088wEIggUiMYNlqiLqQHY0ChUoAb4bCBPrCgfcfNWTXdhU+RqLKXF4zhMDLwVml4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQUbGIJG; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71798a15ce5so1951770b3a.0;
        Thu, 03 Oct 2024 17:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728000033; x=1728604833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPG7NWLbTV1K4yXh2AqTy27S5IzvT22XN7gfixbpbfM=;
        b=XQUbGIJGlHkzXMaNtSuNURtXOGI+Yfqmjm9isHIBMzo2WG4pdmeYBTvoc3/tdSejdL
         +TISWZYO5Y+MkiY35YA8IUp0iOufi+Bj2wT9ekdC4KVBrU7fc+HCNNThrSEoMn2B1zVB
         YxDzEG3OhpYAPTtEFZsb4ZFYA+yoI84HF/40xP5/E88BSQ935TmDsBC1XCyzSNgA6w0l
         aGpnYrvkoOPFsnYSMS09z9nwszHWCedLlLYuPYalStAykUyB3g3+y4OgX+FOuwfMdKXd
         Q4FG3FvoCxz1mU/18J7AGiXrAfJ6jN4b45ud0zLYMFRCSv3nDZVG4hB3Ge//r+/ki3Es
         QLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728000033; x=1728604833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPG7NWLbTV1K4yXh2AqTy27S5IzvT22XN7gfixbpbfM=;
        b=HSOjdj+LBMtVuZS5Z/gTCBUNJjvMcLLqqybztZGkoKMHF50X4dGeGD3gQlIGWSqnvj
         /2Cbi+YSlI5xl6jAKq9VBSbfYCZUad2qCJtqKNqeptjaMbhIWc+PFSKRNZBlD9nv/CkI
         cvA3sdkn/nHqkZQcBUR7hlOvOj1xQBgPfclUh2cgN4j0sC5+dxGycs6msSPNs+Pc5JHs
         ozkM2zEOktzOZ7hb6p8x0W3NlMvqU/M6dZ2VKnBUNKRfen4a0godqxAuw+Bu25Gt91fT
         RBsTy0G4bafgtdi88TabEBaihygcPv/VrbCtJle4zINo+uSu9ydv3Y0hTeLNDoGPQbdF
         Hu8A==
X-Forwarded-Encrypted: i=1; AJvYcCUypgd10SQ8wctiRp+R5QYYJKeMpSIfQOQnLWaeda48KOswXOlPcQuLgiJkeQUMzTd0sldhC3fw0OdqrFNo@vger.kernel.org, AJvYcCX0HQRLK+yDQECxNT7mCsZmKRYdyBdLkJ+q+cDi5tuEzfX6qh8eaCb0JxPmXRZ32qHqEovT1d5j@vger.kernel.org, AJvYcCXPbc5TXNaSoHWxsvKJ2CIjjgshdixNSB+GGJLrPRB/SvC9kAPBIOJ4WorBzt6/fik/QM8pxWXy+dBQZVIt@vger.kernel.org
X-Gm-Message-State: AOJu0YyGusOhfrqqK08OxeL3+sS5RQeTOtE6xqZAaGnPQor5X40PKjvb
	HzvbPgjJeMWEaFhFG/E/ABItPGt/HdFf73j0yoUJostgaACY33mjtVP0uf0L
X-Google-Smtp-Source: AGHT+IFRpqusbyBChPGJdLDMkF4flvi5LdGXwNB5TEbIL5IvxwzIRTPeVbU6C3UfDDB2eSYpuaFaIQ==
X-Received: by 2002:a05:6a00:238d:b0:717:92d8:ca5c with SMTP id d2e1a72fcca58-71dd5ae0c7dmr9336561b3a.3.1728000033244;
        Thu, 03 Oct 2024 17:00:33 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9cb0b28sm1983047b3a.0.2024.10.03.17.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 17:00:32 -0700 (PDT)
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
Subject: [PATCHv2 5/5] documentation: use nvmem-layout in examples
Date: Thu,  3 Oct 2024 17:00:15 -0700
Message-ID: <20241004000015.544297-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241004000015.544297-1-rosenp@gmail.com>
References: <20241004000015.544297-1-rosenp@gmail.com>
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


