Return-Path: <linux-arm-msm+bounces-105078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2I7yLcUU8WkcdAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:12:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4586348B8CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E5593069544
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 20:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17963CCA15;
	Tue, 28 Apr 2026 20:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dGM3kAzT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854C03CF05C
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 20:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406885; cv=none; b=luwojarz5lzdkMQU/M9HKId4hDQeT9DdZxWeWMHvBdOXbiiq4nB9+kAwSd58P+KKwhWssH1MetTI2z5aMJ7L3UPunfkmrmFrC2AJyQC9qlI4a6rxvbPVBo469XnZuL/HBK5YzbQyu+ELNdMmVy6i71ga3+A6K9pYJZuF/uTKBHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406885; c=relaxed/simple;
	bh=U4+LflP710DVR4kB1UOr2zgqsKpE/7u4FQUoCfyFE04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqPQWTSPB+Yg892SMMNJAGtn0lmqWtCq2N+gniRLuvHDz9z61tpJksxtDwjl8Or/NmBtwOG0hoEWOJnhebCdZFQUdVO5jB5YacyCXQjkgSR2ngA0oa+GD78sq4GaIHGW0OwJ4NbSJ8quL8k31T45MBXESz9xq8q6+/7e+UfHm9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dGM3kAzT; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12dcdcd54adso2004890c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406873; x=1778011673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gK+EAT4GmZMdYdv/TPcw5cMAUzBnAuCqdYs+Qlpxwc0=;
        b=dGM3kAzTdCwfpk8x/dsiLIULQBN0/rsvWnK9tWm5qb+YMetfKHeARagEVQClBucyDT
         kxCxr1k0k8XFmT0pIXfH6zW13/lEGH1P4tpAgZkK1wk4qJ08LvN2M7ZL5PjJizcRZHHJ
         Lq+JcbuWLeRAV11E7Qu3muOuMKTPmIhmwHgw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406873; x=1778011673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gK+EAT4GmZMdYdv/TPcw5cMAUzBnAuCqdYs+Qlpxwc0=;
        b=nI2AZZtaRX9r0lYfiW2SHQJW6RHRTMkepkno29chA5glzIDABJVEar7retdCfAcZ1w
         zNXqCF129FrvI1TPJBihblLlv6hzG53NYL/R4MNwcDqML891yP3JmrcWW2Gulj4EThhE
         o/YiegD4WVKMWgzcIe4JG2V7mW8Ly3Xz/xvQw56e8fpb5D/JPxv2kd0m6I+Jy0GBnlyb
         Gs7RYnqAgZ1Fo//RjDEZezTrUrHIpHItSHclS/ABTXgwHmXsQd09GQWurTjV4TK8CkxU
         G3KAcNwUnvcHzXd9PUh86XWlGtow0NY4ZIogMWYCRkv8zFeRpG5GFR/tXTpGr5jQAQPc
         Qttg==
X-Forwarded-Encrypted: i=1; AFNElJ/+yj9FXmgk+wTqfTKd5jnoG8a2enqyCyDB/rdsQwx9sv2Lce9qzwUdTgPvb+vs4fL7F5oBxysOv8z03sEI@vger.kernel.org
X-Gm-Message-State: AOJu0YxLTx7OwPz0glYy2m7rKnbQ5VyY0lhaprunE2oYHQBddRJgSwtW
	c+xvVmHLyKcsDyRwP8E6/yJ0PHkiZgNG7kS1xqHMpIureOYOZjbpTUS+BIV1iyBCfg==
X-Gm-Gg: AeBDiesKebe+gg81VHWfKzEp+hhD2uteo3nXeSXhPTsfnYgMARSqjjxY/LFr1ZYlcKO
	QPDsXbdQrVhXWN/n4+yJqicuQ+/OygjJe9l7LpvBuM5tP84XtEHVG+P1pdP+53TImyomYBxEm8f
	dJU/wnuNpc+A7V1vw8WBs4QDT5mX6dJBVQXAn9Gwd/GuFkS2axxIVk5x573YdPowxVfudi8jXhO
	bI5VpYtjnKUTVentnqMgdOFwtRL9kG3Ea77oJSEpXlPF3ory0lHWmplzYmgf0qh4RU8RDjOi4YX
	YPX+WUDl822rw5YTd9vxLUz+q15M+agIsJ9C3NPRvFcElPCRL+wTdIB/cNunDnzkPhqJDQNt32L
	0Zz5OrtP+7tfTG/HvflmpGwG6zqqLzdxdtSjChigT8+ZLkB3aKrqibVWv6ghKDJKFDQpYvQFAlG
	6b70tclptaOJsXbUFQyyju4DIOxzsy4WTsJRquim2R3YkityGLzKgKf/FqDt/isdvETtfiYsuo
X-Received: by 2002:a05:7022:b96:b0:128:ccaf:85d5 with SMTP id a92af1059eb24-12ddd959d36mr2219620c88.15.1777406872635;
        Tue, 28 Apr 2026 13:07:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed0a10678csm3167991eec.24.2026.04.28.13.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:52 -0700 (PDT)
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
Subject: [PATCH 7/7] arm64: dts: qcom: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:59 -0700
Message-ID: <20260428200712.2660635-8-briannorris@chromium.org>
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
X-Rspamd-Queue-Id: 4586348B8CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,sntech.de,gmail.com,collabora.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105078-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briannorris@chromium.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 5 +++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index b398f69917f0..cd4a0e281cf8 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -99,6 +99,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	/* FIXED REGULATORS - parents above children */
 
 	/* This is the top level supply and variable voltage */
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 5c5e4f1dd221..58ea0532c0fb 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -25,6 +25,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	/*
 	 * FIXED REGULATORS
 	 *
-- 
2.54.0.545.g6539524ca2-goog


