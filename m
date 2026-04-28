Return-Path: <linux-arm-msm+bounces-105077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP0nK5IU8WnDcwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:12:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F20E48B896
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28C833138277
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 20:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E44D3EF0C8;
	Tue, 28 Apr 2026 20:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EkLyTgPA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D62844CF34
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 20:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406872; cv=none; b=aKHCyxhKy7fYuweNaQ3esvmEFtK1MD5TXQl+D4go1pxyF0Z8c4bzS4kYsZHMxNgeceaeVTGOG56AmEigGuVOPEiyF5gu1gTJcEUgFN4GKjx3znjfbSAHIlSIBix7aFGNxsPqs5xwy9ETEmMAJzX/SoEqRQw5SXiB/I2HS7c1n40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406872; c=relaxed/simple;
	bh=5qSEGoSFEbZ9Aw2s104tTg8FW55x+SU2f7LQRnzdTp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AeULSFxJA0mD9Bp+qyoLKxSOxNyuU07u6Gxeudap2bK5ZFTJ91Nn+Sco/ju0klri0u58YQftKDH9l8MdrMTGv881+1RuMSs50T5qqO/X4P0wPvpWoRwtZLO7DyQ10OZ0Et3cWDFG+MYl8Qe0syYp2IRBwibIhPNpDf/RUSZCw8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EkLyTgPA; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2eadb000b8cso3156674eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406869; x=1778011669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63kFLuS2ZunRuwIKFamabno0yfYzwQFLWtzreaffIiA=;
        b=EkLyTgPAJVV8g7Dhrp0Xta6ycX7glzqwHLsIyM6rYiAoTSnxQkf84NcjPg1g8ZAYGB
         02u+JNwGAhNaeLrHDLXiCx4LKuKoEMGzXKh2lkj9FS0A2Xbb2HcuWWJVt0ROLOzGswlr
         DF24gepVJO8mgt5r7T8MULcNYgs65wQMv1h94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406869; x=1778011669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=63kFLuS2ZunRuwIKFamabno0yfYzwQFLWtzreaffIiA=;
        b=lNHzoeAZka9sUbFKRNkbaiIimGe6aDyCLqJJ1fZO3jSaduSBg0nFV3VpW4LvzfxwAp
         Fhix2T0jBUZvZZcKsdmeJjwI5q3sUdRykuzDw0sA6uUkoQfwCozH0aEMVdzGD68eJj97
         OgY0NIHNjveRiYSVb0glatRXXkw0axtKOKgFmuup2V5GQfyZtRT38QilEBJebqzqHBDe
         61lG6MPyoXjjcrOCyDy9lW5tm1TDFSZlN1OXIFE6apCzScIIL+aKMtLbCJvAwud7yzGc
         76EoK/zyf2hogGuDEy1e4+Y9R29H2ND+lZXFnBzmKjxLaq4NNP6V8V8FWWJXfEhpfTtP
         HjMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+punf0w87L0zDZ1i8hQvU/mz+zXEo2FR45pOExXsRypeJBnbej8jW9qFgJruDDm462F/EU+G6aUWBfAbMN@vger.kernel.org
X-Gm-Message-State: AOJu0YyH3xCMk5awbHdB0B26b+c/5Qds1TYW9JyH5R8caieTKzl5QWoO
	gHBMQH5n78O6nmKOA+1FGeYDZuUFVUHe6p/iU99jnty6KEEfibenna3YJEUKZyl+Pg==
X-Gm-Gg: AeBDies2qo4K/A/Gt/Dv96EC46IKBOegRhI0PieUWEmhbDuC6vjZOyYBgCfTimhEdgI
	EBJ7x/m24ZmJhl0eSI5BEopdUKpCCEJKC+TKv/PnQPDgcb68hT+6mMsnFB0y2nyztv+wNjKJjK4
	GstjQRMv1ydJ32nxOmj+HrknWC/Sw14+Z04W9mac6ZLUevrTgGCk4jOvG9LiskWefRLt5szLRKT
	7woDqvAwKYnC8illPn155f08bkR2L/JXS49eGUCKYnA3v4/7ktamy54THlcRUUudmu45EGyLcwk
	eawQzt7DQ71+nMIq+lx2Gc4amb187DuO/0/RgPsNz5GUuILs9rWgdi1DXCTZUNBO31JfiPLK5Eb
	WBQ/cDiG+XTdN6jQG3ohxhacVaZlDYUhtbi5+4EcnzRr8U719SMHtp8n6hMnJK93AS5ADpTy4ko
	O3Jxm22DBEYxQatzXH5FO13gBmp8PEh1ZtmHL+cAHfsDRQw+cU4ubOIZUBXdl3hYpira/I44R2
X-Received: by 2002:a05:7300:7255:b0:2ed:e12:3771 with SMTP id 5a478bee46e88-2ed1991b2a9mr467588eec.33.1777406869213;
        Tue, 28 Apr 2026 13:07:49 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed0a0ce761sm3064459eec.15.2026.04.28.13.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:48 -0700 (PDT)
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
Subject: [PATCH 6/7] arm64: dts: nvidia: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:58 -0700
Message-ID: <20260428200712.2660635-7-briannorris@chromium.org>
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
X-Rspamd-Queue-Id: 2F20E48B896
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
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,sntech.de,gmail.com,collabora.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105077-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briannorris@chromium.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,chromium.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,crrev.com:url,4.196.180.0:email]

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

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 5 +++++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts  | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index 683ac124523b..1f5222d43e62 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -18,6 +18,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x80000000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index f0b8c2c80aa5..a6d31650245d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -25,6 +25,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0xc0000000>;
-- 
2.54.0.545.g6539524ca2-goog


