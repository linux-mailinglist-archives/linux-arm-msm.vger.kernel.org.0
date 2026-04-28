Return-Path: <linux-arm-msm+bounces-105076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CieG1wU8WnwcwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:11:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EF048B877
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CD4A311E8DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 20:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602C13D9051;
	Tue, 28 Apr 2026 20:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bbyseeQL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7CB3CCFC4
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 20:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406868; cv=none; b=KN8GdMdqDNy174/PEbA3R8vBhVFW5y5WKCZrFwIHVFPT+bE+Zk1zQsqUCsUDGabSjSrfOHmu4pmXVXKvAHdHJ7QxDATxHu+Bi1LzuVP44l5FhuMj/FpbcAFRkBDlSnWqk5C8sU+EDlCjEIa6QTbg8F7Ep7ol/sHDIYD47UOSVZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406868; c=relaxed/simple;
	bh=91Jr18vVzfVxquYQHVRz08LrBbzSjFimJpVSdAg42Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hVJ+jbq9hUCt7VwRcrMUViwj0Hu68BpwQ4O/yAuIF+lwXKZeJRIYDnPsH3nZZ27RVNzFPr9XaX+LJXTaPRdcKUaXUAGqxgxXaitNnFkKLneyqjhDzJG+dZkO9D5yYo9mRCFgkQI7cCsjI3SVwE8oyH4Ej72tM1BKwPyEqKiHL7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bbyseeQL; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12dbd0f7ecaso3258069c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406866; x=1778011666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4z+F35aj0Zw+rehp8tVxMlZOUqU6/YdKeXG9fNxlPfY=;
        b=bbyseeQLxrbYxj4aFb5rQ0fi5tCrycubCHc6ZKWBJmCXlVoyjWO3GbMIQcLWZwiJkY
         KQqrln8KBqns1v13Zkk4eN2wd2UhYFstxPQmaJDCr0wA1vwJL98K1rqe9o0rwwjdMCuG
         RMKYHSCJYkaI3U8KbSkcOnUSWJ5KtYjWGoaUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406866; x=1778011666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4z+F35aj0Zw+rehp8tVxMlZOUqU6/YdKeXG9fNxlPfY=;
        b=hjcjclpP6jaqYJWzSAYZNjfDyTmvWVNEUGq63Wvj159CROyANiYT5gcC8CK/TQ9BoW
         Y2PTf8iKLYN7APxiVXK89inmOHLRbd+pzyiVvyK058W3KAEGieVEwlwaIaXJYElQ/Yqk
         uPYWI8+CeOMcwiq/6hoPQmHatJeO3IEZuBwxYt3YsnpXYK1qXLANKBBm3CVJRM/D47rF
         D8TKzVa69h2AAzQs5WHfzjDmAWyeaa89upKuWcn/LVLSjxH4Qtvpy7/xUBEnXR+O3CH1
         Rtkll3ahgcnnJV14aiCBd3/2Rtm1mOQyl8unf0sRMKnSLWz1jinBund2qzlhaQn4eUO7
         zn+g==
X-Forwarded-Encrypted: i=1; AFNElJ9wV0ethNs6hbxxgBC+aNRJHARQkYlLwunlF/ftbv1OJxuBul36A2pWRqDnCgF88YTwXJ6u/XvWhwG2cQQm@vger.kernel.org
X-Gm-Message-State: AOJu0YzDF5H31wugzeBzVwMqen/hcugGtXJEuPR1d0/fl1lLoVwdcevB
	bHgVUY83Ld6AHTV7u5CbEoSjwX6uFtw0jMvW6tWi4TpnvaaPtmClC69BU7VCmaV38w==
X-Gm-Gg: AeBDiesSoNHpexqLzrHDZN/oscWgtbEvFTmZWIVrotIXnsvk4s9NgjpezfzCSkUPDj+
	kshfz0+kW/EKH3iNMVMuw5UOQW+Lv4BLAzPCj4ZtvHK8D+f+tCftYJYP40+nQk8iqHkzLgdcAVZ
	sezvMpruumbwX+MXJPTApuyk2dimawk5tFc83VRokIkUljCs1T9K0rsn2JfsoPaVzB49Sq2480m
	PHFkD6OKSR9lTZC1L5ktJYIi05KYlnIgjSmshPkGddOQOZNcp2QM1dXUZt4czl8OULs4sm3ZXi+
	U5Le3z+YZrEIY9Y/yP3my6wdCEMHjmHcOQ0J+TjUQr6cPerCOZnDdThw0M3V76wazRy+Tq3JQgN
	D/ctvi9ITw88D4Jj5Y37cwNTPX7aySqRiDJoFTyCUGo4wtRGkO/6nvQR+YiFB24aisqnJ/eX+9Q
	EOpttiwhGkWEN0LsDAoUfRrlLi/OlBO1Aw0AeJL5KDru1teI1bc3EsSvfRZc8/52vBvNts5wmx
X-Received: by 2002:a05:7022:660d:b0:12c:8b9:720c with SMTP id a92af1059eb24-12de2a330a7mr383827c88.18.1777406865408;
        Tue, 28 Apr 2026 13:07:45 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12ddd9a63a7sm3079240c88.11.2026.04.28.13.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:44 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>,
	linux-rockchip@lists.infradead.org,
	Julius Werner <jwerner@chromium.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:57 -0700
Message-ID: <20260428200712.2660635-6-briannorris@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
References: <20260428200712.2660635-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 16EF048B877
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-105076-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,sntech.de,gmail.com,collabora.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briannorris@chromium.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.996];
	DBL_PROHIBIT(0.00)[2.98.90.0:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,chromium.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,crrev.com:url]

Chromium/Depthcharge bootloaders may dynamically add a few device nodes
to a system's DTB under a /firmware node. A typical DT looks something
like the following:

/ {
        firmware {
                ranges;

                coreboot {
                        compatible = "coreboot";
                        reg = <...>;
                        ...;
                };
        };
};

Notably, the /firmware node has an empty 'ranges', but does not have
address/size-cells.

Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
non-translatable addresses") started requiring #address-cells for a
device's parent if we want to use the reg resource in a device node.
This leads to errors like the following:

[    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22

Add appropriate #{address,size}-cells to work around the problem.

Note that Google has also patched the Depthcharge bootloader source to
add {address,size}-cells [1], but bootloader updates are typically
delivered only via Google OS updates. Not all users install Google
software updates, and even if they do, Google may not produce updated
binaries for all/older devices.

[1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
    https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
    #size-cells for firmware node")

Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating non-translatable addresses")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi     | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi   | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi  | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi  | 5 +++++
 6 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a0573bc359fb..777da2129e77 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -16,6 +16,11 @@ aliases {
 		mmc2 = &mmc3;
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index a8e257b21a88..a906ec1ce672 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -21,6 +21,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells <2>;
+		#size-cells <2>;
+	};
+
 	backlight_lcd0: backlight_lcd0 {
 		compatible = "pwm-backlight";
 		pwms = <&pwm0 0 500000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index ff20376a44d7..2b327d9ef65e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -26,6 +26,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		/* The size should be filled in by the bootloader. */
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 8e423504ec05..ed63c74cf238 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -41,6 +41,11 @@ dmic-codec {
 		wakeup-delay-ms = <100>;
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		/* The size will be filled in by the bootloader */
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index eadf1b2d156f..b3850be25594 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -25,6 +25,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index f1ff64a84267..4992631dd504 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -42,6 +42,11 @@ dmic-codec {
 		wakeup-delay-ms = <50>;
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
-- 
2.54.0.545.g6539524ca2-goog


