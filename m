Return-Path: <linux-arm-msm+bounces-110900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q9uuAtfAH2rOpQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 07:51:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 48161634661
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 07:51:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=hLkBtEdy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110900-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110900-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B8475302BE9D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 05:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865ED3BB105;
	Wed,  3 Jun 2026 05:48:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound10.mail.transip.nl (outbound10.mail.transip.nl [136.144.136.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED01B3B5E19;
	Wed,  3 Jun 2026 05:48:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780465703; cv=none; b=S+2FAeUSerz+AvX7Ek3ltf1Gh72HLPczhFQPkdg5wJ0rntlx5GfJNLmw4gQny+0ysq8/rQr0GvZ7ZABoQy4bCoAZiGkpSbQ3qsm+C84HD04d46ZjchDVWa8kdajhVm+5xrUys9SXkv8WM1eXJVHaWpLIwdjHpu7CxxUYf9DXM5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780465703; c=relaxed/simple;
	bh=sOEIwqV2S1Sc0vz6oklk806XGYfeVHXnzrAaUglnWVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MPg5HeUXyW9jH6JGsRvvEaN24PBtejHSR9Cemp1dK1qPEou8uiQ08lN9mi2TJOcrygud3/HUo9oWLWQ6dVc6hcxFi2bWDSJdekW1cZVRS2X4yPJTakp2I72mV7uLJqSDe+tE8GsXvc4mUwfH50HKTsiK2slwuQX9jBpqjdl5nO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=hLkBtEdy; arc=none smtp.client-ip=136.144.136.17
Received: from submission13.mail.transip.nl (unknown [10.103.8.164])
	by outbound10.mail.transip.nl (Postfix) with ESMTP id 4gVcDp69kyzTPNQp;
	Wed,  3 Jun 2026 07:48:10 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission13.mail.transip.nl (Postfix) with ESMTPA id 4gVcDp27W0z3fCxJ8;
	Wed,  3 Jun 2026 07:48:10 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH 1/2] dt-bindings: phy: qcom,usb-hs-phy: add qcom,vendor-init-seq
Date: Wed,  3 Jun 2026 07:48:08 +0200
Message-ID: <20260603054809.565723-2-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603054809.565723-1-github.com@herrie.org>
References: <20260603054809.565723-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission13.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780465690; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version:content-type;
 bh=mrlcs1D27PXPLxt8+cRL/rXLqNpuksf4zApbZFH8i+Y=;
 b=hLkBtEdy3Yka9/a7Ga45aI8KLYaM5SR7TxpGV+RwPu7yLF9C+W4VWTFs6qXQbS3aB4syQ5
 amLri692kB1Y7Ym/xMvlgkRll7kmZ9pokiHzExImT0iJZaSwZb1+q2as3iWLr3LK4I3Ngm
 oT3MsFpD70Kw9GA8k1KW3GnNZlxXnvryMJFdkp0KkOUYOfzJ6LyTwXQNPOtZVUvFEoFxa7
 ZVQ/jIKrKxFivfbQRQWvfzQ2GKEvceXJ3eOcl9jnvK5BssANqM49UYQlP/m7o5tdNUP2WU
 LZIszorttoPaFc7i+tJQsTJmKeVTsESfnXZbubEvONQJeh1YdXHc3zlhaDQbTw==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110900-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[herrie.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:github.com@herrie.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[herrie.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,herrie.org:mid,herrie.org:dkim,herrie.org:from_mime,herrie.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48161634661

Add an optional "qcom,vendor-init-seq" property carrying raw ULPI
(address, value) pairs that are written after PHY reset.

Unlike the existing "qcom,init-seq" property, the address field is
NOT offset by ULPI_EXT_VENDOR_SPECIFIC, so the new property can
reach the standard ULPI vendor register range (0x30-0x3f). MSM8x60-
class hardware needs this range to programme pre-emphasis, HS driver
slope and CDR auto-reset bits the legacy msm_otg driver used to set
via platform data.

The "qcom,init-seq" path is left unchanged.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 .../devicetree/bindings/phy/qcom,usb-hs-phy.yaml   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
index e03b516c698c..b9eca670419a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
@@ -85,6 +85,20 @@ properties:
             the address is offset from the ULPI_EXT_VENDOR_SPECIFIC address
         - description: value
 
+  qcom,vendor-init-seq:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: >
+      Flat sequence of raw ULPI address/value byte pairs written after
+      the PHY reset. Each pair is two consecutive bytes:
+      [addr0, val0, addr1, val1, ...]. Total length must be even and
+      no more than 64 bytes (32 pairs). Unlike qcom,init-seq the
+      address field is not offset by ULPI_EXT_VENDOR_SPECIFIC, so this
+      property can reach the standard ULPI vendor range (0x30-0x3f) —
+      used on MSM8x60-class hardware to program pre-emphasis, HS
+      driver slope and CDR auto-reset bits the legacy msm_otg driver
+      used to set via platform data.
+    maxItems: 64
+
 required:
   - clocks
   - clock-names
-- 
2.43.0


