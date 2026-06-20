Return-Path: <linux-arm-msm+bounces-113890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FuZxMrHTNmpQFQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 19:53:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1296A96E4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 19:53:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etehtsea.me header.s=sig1 header.b=lNGYJIZU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113890-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113890-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC3A1301B914
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 17:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37863451D6;
	Sat, 20 Jun 2026 17:53:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster6-host9-snip4-5.eps.apple.com [57.103.76.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CA43438A6
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 17:53:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781977998; cv=none; b=QfZcsIsaD8fUp8sPptWTsHax5L9Znb1kaWWrJ6vLgtEYyj/z0FeoIMp8WWbxvWMG18iyolOOEExUqWZnKlL2YEWogYGBiUBJK7Hl9xZE3vmiRdjMC0jc1WEDIYtAZWpgaRnDvqTa3xrEyAGlMuHXznhHU6vl9OU+cPtNUdyEUQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781977998; c=relaxed/simple;
	bh=Spdbueyfuz8uMNAHc3aXLkzTXslDIABc7BDDWY7Qdlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VWb2GR9JmqZBM2RerSmXDOAdcVtSYvlQr5VxC5CZyErerUXUz4Fzcp/jb0PYionpmqnJr1mcbyQSR6+DXDgV5nwIkmnd5wH/YtRhsNI7bmLPq7ypCvpWZaR3MTxZxTWrcb1hO9yokHfdqfbr1e/R4QQox0WGud2yUM/TeETUSaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=lNGYJIZU; arc=none smtp.client-ip=57.103.76.196
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-1 (Postfix) with ESMTPS id 9FB4A1800092;
	Sat, 20 Jun 2026 17:53:14 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFIfVxhNC1YMGQZXUEsbDlQXA1ccVkVcGEMJXQVXHB0eQ0VbE1UXRgkZCF0dGQhHHwowA0IOVgNDB0UALRkcV1BSH1cYTQtWDBkGV1BUEVdQC1kCQg9IBV8HWgVFC0kDQwZSB0YKVQBAWgpbHHkdRwhfH0EVWFZeCAlLRglJHQ4OQhhGH1QnVwJaClse
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1781977996; x=1784569996; bh=qXFGG5ROoxDwgg8Mh3+2KsIvg+hDI0p5sUvKNQ3jUYM=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=lNGYJIZUrYYrMrMlB3u+ifFg+tjv6bwbbPIjjhihLsZm2ga3N99ga+glXU8gDlR+LjRPungTz3ac3p8dtFmHIknJ4TDP3ZWWahFJW2YGl8P2woC29pcy/+7m0RIuNXFaudL11xlZCqVFKaSRNalH65hmjTq3R5ryu7RRw0e6PbpxkxG1Md/SGuefJ6DSUjoQ25sTlpJEfPL19QZQ8jSKgIWkH0hF9jfDEM+CnRppMcWRxFnY+gNOG9Q5UJ8/UGd5AOGKkE2hvBU2XB15JAp+pCU8eZlSV7fWIryETqLJLeq/GrE+9SYfLzndx+p4wjYArzKhUWNZc4k19werH11nHg==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-1 (Postfix) with ESMTPSA id 699C61800192;
	Sat, 20 Jun 2026 17:53:13 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Konstantin Shabanov <mail@etehtsea.me>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: arm: qcom: Add HONOR MagicBook Art 14
Date: Sun, 21 Jun 2026 00:51:56 +0700
Message-ID: <20260620175210.19563-3-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260620175210.19563-1-mail@etehtsea.me>
References: <20260620175210.19563-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Q4tO6tRd2WIpsXB5vmujMrGgvBJ8h_Dk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDE4MiBTYWx0ZWRfX5QG6QHGaQRNC
 vtMDyzE6+7BEePL8p7XDSW0+WmHG32E5wtk+TTAaio0F6mImDTTF+4lVm5U0no/7qyVhaDQpX9y
 f+MLZVELJF2K3iOk6k7FDBt1qC5F83rOWpmvr95qVtzSUuJayPeRgVGsDc7GuOuMK7LWa09S5Tb
 6V0cU105FivtxD9LMZiAUB4oBiMkmyXfVJ2voyvUCWwUzeUWAPgbNq+XzRFirzqSc81G9UfDEmj
 F5zfe39gR8PPegpqS4I7W1j5rV7bEI9gtpqc0DY6ydzdnacNRJK0ka/eyeF6xmuvXnirurYcE3T
 OYCF+spLBlZ0n1X8pqU
X-Proofpoint-GUID: Q4tO6tRd2WIpsXB5vmujMrGgvBJ8h_Dk
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mail@etehtsea.me,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113890-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[etehtsea.me];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,etehtsea.me:dkim,etehtsea.me:email,etehtsea.me:mid,etehtsea.me:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B1296A96E4

Document the X1E-80-100 variant of the HONOR MagicBook Art 14.

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..fd985f8adb0e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1160,6 +1160,7 @@ properties:
               - dell,inspiron-14-plus-7441
               - dell,latitude-7455
               - dell,xps13-9345
+              - honor,magicbook-art-14-snapdragon
               - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
               - lenovo,ideacentre-mini-01q8x10
-- 
2.54.0


