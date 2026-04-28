Return-Path: <linux-arm-msm+bounces-105072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OlxIwIU8WlZcwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:09:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2C948B7FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E3D230EC463
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 20:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4AD3D47C4;
	Tue, 28 Apr 2026 20:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hYGSZM89"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DA43CCA02
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 20:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406856; cv=none; b=UeaZ0bxWscktLUAOH6eg7F081CXr9nF7wlYiU6Xhxt6guZti/L3co/vuLmTmCOJBLM6SY4efu6i1iqzLcH/+tj9Y1oGpcgmirtDyUxfsb5Pxq/4/k9n4qonDn7KKdSiRNC9tEAZUSQ9u0doiAykXR9qOd8DOIu9m/LsL7AczAYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406856; c=relaxed/simple;
	bh=xlJmeP+PJelIrVWVbvw6zF4EvPRmj3ee8OfUipPJo0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnhv7L4mH4J3mjQUohfaoT4yvjAwrRBdv/Qj8knagnnjxBT39zAvrdArgQ1BS29bMO3NTTjg5ZIZT/dDcKGgcXPLZCRtnUS7WVPA0W0kWvivd8hnOSdcqd99Z9o6rijo54x2cNrSQXumhdR6uMNzoYKg1Pe+cHdC3zQ+/hRG2/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hYGSZM89; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2d96243c91fso19351322eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406851; x=1778011651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZddyefkooDQKnc5O6I7CXwcRuSu4lPrXGIxW3LQfo4=;
        b=hYGSZM897QKQ5m+LAhH+lO8SS8phly+jGg8Ckq7yAM4gpBYqZprOmOi+vB/G0NglCG
         sGYCaSwiZKRJxJtfzqU50x/OCyuMNMmVuFBqXF3yfnpcLwLCqSJ6sYvPAEen+OiSuybQ
         ywMtsaehpdFVYctkpSpR4gNQJFeZtxTGQbtVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406851; x=1778011651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oZddyefkooDQKnc5O6I7CXwcRuSu4lPrXGIxW3LQfo4=;
        b=DXoCeE7iCiB8RhhBSF9MfrMcKOokypXDPfFuRCWPmRZ6uFR1QGK6Ko11H4Bm6NxWgo
         wnxCYKMVNJkOAyPT/yy5bvR1AgLrw3ugyzeZUxqC+N9poRiK/qMLuS1zyiAQbwZJEq/d
         qnc1rGVmhN+Bx7kfwgyUYiFqyj5xz7MoOTD0UGrDjbL72E23EzgOFab14iekrM9jURlM
         nshREOhos7P5Uo3Ns3J67bszdfyoIqNKtkWqRatXiETW8LZdVn8i4qlbBeQcxZWhoJgU
         hrMU497XQwFi78syOZRBLcFmrL5DSd6NPhV04ZSrAa+3KCTLWYwA4ZzmEsUKuvQUNYLT
         qtOw==
X-Forwarded-Encrypted: i=1; AFNElJ83mOYdY7y2GDsmF2oKfzy+pyCQZg5+r9U85QvGWIFLNjux9dhv6C1wXwbzcm/CfLb0rK2JLAfaOXmBUWer@vger.kernel.org
X-Gm-Message-State: AOJu0YzWT27Jisrd1UA2eXyZa+2tAZql6VGJY6bpCaOFCImKrka7u/xo
	S6sz6HI07uw00f3iH/xRcDKJRfDtU/GyzKYn/kK7KjrjBVsu6aDHh07TI5zApnDF6g==
X-Gm-Gg: AeBDietHRRSD8o40REd+k+Y8yrlOzkIEodtZPjn/yirANG1jQliB7NQn4jTtfMtGIO9
	yOeuWGbC9urzpulMk/iOMhhO+NDSmP9HpiVR7zTeQxvePEtWCiOoCkWh9FQREhH6cjOCY86/fDd
	RkmzJvayR+Ag/hu28VBzKPGpDqqzNMPsEf3N1v5NN3IqBRdHkuPeQpqvw0kR6Fl//MuA2okwIt9
	zg5jPX0va/Oc+Bk8ZE37RY4s4qtXqRldUnEtgC6g4gGp65U6B5+7Lv2I5Ek1U/b6ZnmzhZLJc5l
	TtVKNchrakxtjcGHMNP36NIvcZUhXdDqacGapB+Ektb+iND2NqLUErYsIT9nbcOdqcbMrxElP6E
	yzB+u8XQ8f6lzXDYlqPtXLzwNg/IqVM+IPMhz3/WImFKBz1N/GC8M6RjmCJXtoVcklLn9GFHg8H
	Mqfl1mVWZD8Wal9P563tT1uWnwJdFhFnOlSnmy4PWyaqD3koumDDMa7hcCgFgMoAY8/cwlyjob
X-Received: by 2002:a05:7300:fd08:b0:2ed:e17:d50b with SMTP id 5a478bee46e88-2ed0e17d6eemr1499097eec.30.1777406851181;
        Tue, 28 Apr 2026 13:07:31 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed0a10650esm2873589eec.22.2026.04.28.13.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:30 -0700 (PDT)
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
Subject: [PATCH 1/7] arm64: dts: rockchip: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:53 -0700
Message-ID: <20260428200712.2660635-2-briannorris@chromium.org>
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
X-Rspamd-Queue-Id: DD2C948B7FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105072-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,sntech.de,gmail.com,collabora.com];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briannorris@chromium.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim,chromium.org:mid,crrev.com:url]

Chromium/Depthcharge bootloaders may dynamically add a few device nodes
to a system's DTB under a /firmware node. A typical DT looks something
like the following:

  ## From a RK3399 Gru/Kevin Chromebook:
  # find /sys/firmware/devicetree/base/firmware
  /sys/firmware/devicetree/base/firmware
  /sys/firmware/devicetree/base/firmware/coreboot
  /sys/firmware/devicetree/base/firmware/coreboot/ram-code
  /sys/firmware/devicetree/base/firmware/coreboot/compatible
  /sys/firmware/devicetree/base/firmware/coreboot/board-id
  /sys/firmware/devicetree/base/firmware/coreboot/reg
  /sys/firmware/devicetree/base/firmware/coreboot/name
  /sys/firmware/devicetree/base/firmware/chromeos
  /sys/firmware/devicetree/base/firmware/chromeos/readonly-firmware-version
  /sys/firmware/devicetree/base/firmware/chromeos/active-ec-firmware
  /sys/firmware/devicetree/base/firmware/chromeos/firmware-version
  /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-storage
  /sys/firmware/devicetree/base/firmware/chromeos/vboot-shared-data
  /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-size
  /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-offset
  /sys/firmware/devicetree/base/firmware/chromeos/hardware-id
  /sys/firmware/devicetree/base/firmware/chromeos/compatible
  /sys/firmware/devicetree/base/firmware/chromeos/firmware-type
  /sys/firmware/devicetree/base/firmware/chromeos/fmap-offset
  /sys/firmware/devicetree/base/firmware/chromeos/name
  /sys/firmware/devicetree/base/firmware/ranges
  /sys/firmware/devicetree/base/firmware/name

The /firmware node has an empty 'ranges', but does not have
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

 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index 7eca1da78cff..2f9e39671efc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
@@ -18,6 +18,11 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	/*
 	 * Power Tree
 	 *
-- 
2.54.0.545.g6539524ca2-goog


