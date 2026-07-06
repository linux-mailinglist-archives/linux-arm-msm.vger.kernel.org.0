Return-Path: <linux-arm-msm+bounces-117016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UjHAISIOTGoKfgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:20:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABC97155FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:20:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117016-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117016-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0525630B2BF3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 19:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC703D8104;
	Mon,  6 Jul 2026 19:23:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from MTA-07-3.privateemail.com (mta-07-3.privateemail.com [198.54.118.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8953D7D8D;
	Mon,  6 Jul 2026 19:23:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783365789; cv=none; b=WMM9UOznQWpaLCpvk0tkSleM2va1NEUUw1Dhw2FvAbUVofSYhjdttZ6G4EYXnb0EoetV0cPbpNuqDRActRR9Pcd3CNDc/TRydrDLepgprKoZtk3adnmeF/uGvhwE8p0Wbcl7Br8GaanDM/H6+P6sojxTtU0y27JJ6578zuDC1xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783365789; c=relaxed/simple;
	bh=9Rvy9UNyov1mucllfgzUuZcbDduE2WQ9Owjuaf/IQIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSBehkr9G4Y5wqW47AsERjPfoBNCVjPIfPTTfV6v9Avl9Yilj95iIxO7EFsNpNd1aZE9PSbMfqMc1bfkeDTRNlmuCcBwERIWiozdH5A1mTPya3TpHQsJ39WjiGD/G6/OdtB3lD2+DjVO2wnTJtFYrySjMAtO5Zq6FO76SrwbEGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.118.214
Received: from mail.privateemail.com (unknown [87.215.145.39])
	by mta-07.privateemail.com (Postfix) with ESMTPA id 4gvDlZ3HZGz3hhTG;
	Mon,  6 Jul 2026 15:22:49 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Mark Brown <broonie@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ASoC: dt-bindings: qcom,wcd93xx-common: don't require micbias4
Date: Mon,  6 Jul 2026 21:22:27 +0200
Message-ID: <20260706192229.144137-2-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117016-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[catcrafts.net];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:jorijnvdgraaf@catcrafts.net,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:luca.weiss@fairphone.com,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[catcrafts.net,kernel.org,gmail.com,fairphone.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,catcrafts.net:from_mime,catcrafts.net:email,catcrafts.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2ABC97155FE

The WCD9370/9375, WCD9380/9385 and WCD9390/9395 codecs all have four
mic bias supplies, but the upcoming WCD9378 only has three, so it
cannot reference the common schema while qcom,micbias4-microvolt is
required there. Move that requirement out of the common schema into
each of the current users; no binding is relaxed by this.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
---
 Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml        | 1 +
 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml        | 1 +
 Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml        | 1 +
 Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml | 1 -
 4 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
index f94203798f24..c6dbfe341370 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
@@ -31,6 +31,7 @@ properties:
 required:
   - compatible
   - vdd-px-supply
+  - qcom,micbias4-microvolt
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
index ab1c6285dbf8..f74beb4169a5 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -35,6 +35,7 @@ properties:
 
 required:
   - compatible
+  - qcom,micbias4-microvolt
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
index 85283f94465d..a70d70a05355 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
@@ -50,6 +50,7 @@ properties:
 
 required:
   - compatible
+  - qcom,micbias4-microvolt
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
index f78ba148ad25..61e437378cfe 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd93xx-common.yaml
@@ -89,7 +89,6 @@ required:
   - qcom,micbias1-microvolt
   - qcom,micbias2-microvolt
   - qcom,micbias3-microvolt
-  - qcom,micbias4-microvolt
   - "#sound-dai-cells"
 
 additionalProperties: true
-- 
2.55.0


