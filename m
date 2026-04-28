Return-Path: <linux-arm-msm+bounces-105074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKQ+Ox0U8WnDcwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:10:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C35448B822
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D64330FC667
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 20:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE7C3CD8C9;
	Tue, 28 Apr 2026 20:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YsZSCazp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AE83CF05C
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 20:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406860; cv=none; b=RmQFRvEcMoj43zsNUzKxLG8NLafTHM+EQZAruOkQ1ohRGxSQS0WOdd9sNpRKoDCV+xpS5kyQ9K8hMA5ubJslkFW0RmXuRNuJavq6+pM/id95BeGZPoRlzIZmHREy1HCTZWGQVzPeZDDbl+oJt5TxkJeJHiDLTe9r4qZTQ3h6i08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406860; c=relaxed/simple;
	bh=pccXu/UZ0/UgmYrUTp8RKqR5INDSko9XT3nrfNvRcuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTwjX+4Kp1rVwrjalReDdHoRqCc2yPx5SH9DLJxr4dD817gflglbrxQNec7KgvOCpvstkxnSH7odk8+qoq9/ADnHOIUB+JwRjUT20HMs9nyNpqZxdv1mCtBuwyQaQRtB3hHcc0OHmuP7Jvgfo/8lzdAQUOAFIlVdbh0WFWfrB5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YsZSCazp; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c8ccc7755so12672457c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406858; x=1778011658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uToK6kNcjQgBzaJfDVLEV8EKOZh7WlLcbjBebhI/n24=;
        b=YsZSCazpGJCwN1OHhygeQxjMvJ61gGu+mZ8LXay0+dPCXVw4xGB7j/uyrJVCh97r2D
         FMBgU3xmB49yHnGUh9bDt4ugHcJf1SNdc12w1J3iols17UMOBz1eWS0Vvuf5S8AoTjLW
         74dutQn67ErHSMv126frgLeUagzwt5H7UJ1rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406858; x=1778011658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uToK6kNcjQgBzaJfDVLEV8EKOZh7WlLcbjBebhI/n24=;
        b=XuyzetTfOoCxvo+W7NCetPNMWGxuMvwuMmsljkwZRGEtCqg/Az+b65cc4HtvmyqLkv
         nGwYc4SCLySUI/cc1vMltlNwTCfQC1XZEYqZN9j/FQ1JpNFlcC3x1vIp7EweF25m6N8j
         G3jPMVdlUO3mjWqtBzcM3PxbFUXStLn4a2OIz4gBQll2PDi/lLMydjoLXRfpHqhsJf9C
         9A3oc2rUCSu4/u4jVZkV8Q5Fz/EFZUS5fuKjEsBvcvgwzT1eHJx860HsuwMRA7i4WvCB
         bDzeAQPQAIgWIhfYzWqmJxDmJI7Ybyk/q5hR84AqghM+Tn8imBkZEoiUciRYIdY+dnji
         zdXw==
X-Forwarded-Encrypted: i=1; AFNElJ8wVCemaUrNe1wupUGoRzrdcfdWCCyJjCWUy1C+bAQu+TB073jXhkX1vIr3npzXS87m7l8qaQjK5Iokqxe2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7SVUxRwJ7nIGxpFFeDy80gxeSalyADFZ+42FYnO2KWRERt86I
	qpzzwNfUHpisU1DSBMBNhPj++lIPdfpf6Vw8tuQqSTnNMdOW88BWOZfEVswGGb88Ug==
X-Gm-Gg: AeBDiesMo+nYKpz6SPW2AB27Snn0GZKnNK2uvYP7hKTauxPhy6L+MEIXDDNhYpET/qI
	acV4A8rLImJuRf8zSdZFVx6KOcpaHiPUz3MQAc+Ct+ewDrZNiUQMcelNXR/gWzIDNceLWEAt1aE
	3o3mQHckKUnae3v7orm+Qka/Q3XlqJLWjmWube16wApQ1Cserv4LVItMAq/C40CHQNqrPC7E4Hw
	JzDXmwzFenMH0n15u6BW8ARlIJn3PY1Zl/GcEH4r4vi19ukNNvh88UXgvReDqKTGgELbKefhqWi
	CdFJOpsvhbbdT2TFSmKVGR9/pBrTgvfVNXJ93aL2wfPW3b5VdVhIsY6WcTGKzafZewERxRDcMAR
	gTGdheIOwvtbnUDEtBL2LmER07k0Ukl3m1X4lU9qE/Q12kO7XDnsK6eza+6nL21SgvJ80ReEGqi
	SFLacnHeVp4x4RGFP0JYgpkYLMQ1acoqj9aWUuMUjXhhiBQ/W04vXsRllGZuz5vVyKimSDx/f/
X-Received: by 2002:a05:701b:2505:b0:12d:e126:b7c7 with SMTP id a92af1059eb24-12de126b941mr735154c88.14.1777406858194;
        Tue, 28 Apr 2026 13:07:38 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12ddd933044sm2796623c88.5.2026.04.28.13.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:37 -0700 (PDT)
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
Subject: [PATCH 3/7] ARM: dts: nvidia: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:55 -0700
Message-ID: <20260428200712.2660635-4-briannorris@chromium.org>
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
X-Rspamd-Queue-Id: 6C35448B822
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,sntech.de,gmail.com,collabora.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105074-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briannorris@chromium.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.994];
	DBL_PROHIBIT(0.00)[4.196.180.0:email];
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

 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi   | 5 +++++
 arch/arm/boot/dts/nvidia/tegra124-venice2.dts | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
index 974c76f007db..89a749cb8933 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
@@ -14,6 +14,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	/*
 	 * Note that recent version of the device tree compiler (starting with
 	 * version 1.4.2) warn about this node containing a reg property, but
diff --git a/arch/arm/boot/dts/nvidia/tegra124-venice2.dts b/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
index df98dc2a67b8..059ee6c5b13c 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
@@ -18,6 +18,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
-- 
2.54.0.545.g6539524ca2-goog


