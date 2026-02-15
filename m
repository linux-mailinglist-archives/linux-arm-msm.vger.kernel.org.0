Return-Path: <linux-arm-msm+bounces-92872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qP2MDmcmkmmGrQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 21:02:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D2213F8F5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 21:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5B7C3009556
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 20:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B232673AA;
	Sun, 15 Feb 2026 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gf2ZDcLW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723921548C;
	Sun, 15 Feb 2026 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771185762; cv=none; b=CbnKvL3zL2kVEsPcG4+PqmPNddHRnNt7Q5cb4jsJqp4zi1KkbmkSE9zA8pyfdNXsDDGRMbmVzRwP96a4nn1vq2xMiCXod76uyWxuyf74PzyDcI1lPOXJw01n+BnKTRp8Euj6nD4dFYV0qXE8Ca0NWlCuhRaBt8QudKvDF4cNvyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771185762; c=relaxed/simple;
	bh=P9JtAwWdXihI1s5S3QBpOen7buRI2icrD1xD1tvM40c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IEsY8F7P9OyBXPfCg+11yD1fOD/ay8MB9v1x94ZdAz3WYJe5mr618KfGiVGuO3e6qVdqwvJCUo8MO/oFrxO8cLV8R5KxiJXf1RE3SHiFDMofRM2YjHIb8gdu3qx+N1uUyi3tsKOP+0GitRZ5/ghnN7hXFmiHctU1kxOIcTBfbb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gf2ZDcLW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DE65C4CEF7;
	Sun, 15 Feb 2026 20:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771185762;
	bh=P9JtAwWdXihI1s5S3QBpOen7buRI2icrD1xD1tvM40c=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Gf2ZDcLWBPjeG6milFN/g903DmQLm2KIygfWpcNlgTMBQvmAzcHsCs3iae2W/lKuN
	 2mMyO4n85L+1wctn+lZ8y2Z8lsLIuY0P1lWkZFGUsVNCkHIv/eUjTqGd/oQWv74/4N
	 aoFnvgX3BpsE3AKgv6hE89nY5ALz1ng4nQjUM+jpdI8bXVTZ3xFusoyA260jyMF1jo
	 OWtj+9AzCm9FGLrxd1mtDE4a1svI5kwDYwGPdM3rCDs7031h6Qu2VCK5/OKVVYJAfE
	 NfvNURGziHo/tTSmIdXS3XpbKGHSWAEY5g0Li/iYO4WtlEOw+AhI0WXF8zXUBwWMZh
	 rnYC5w+O/vxcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55F7E63F10;
	Sun, 15 Feb 2026 20:02:41 +0000 (UTC)
From: Paul Adam via B4 Relay <devnull+adamp.posteo.de@kernel.org>
Subject: [PATCH 0/3] Add wiko-chuppito devictree
Date: Sun, 15 Feb 2026 21:02:00 +0100
Message-Id: <20260215-wiko-chuppito-v1-0-9ee6b89606a0@posteo.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADgmkmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0NT3fLM7Hzd5IzSgoLMknzdxFSLxDQTCxPjVDNzJaCegqLUtMwKsHn
 RsbW1ALAuLPlfAAAA
X-Change-ID: 20260215-wiko-chuppito-ae8af4843e67
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Paul Adam <adamp@posteo.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771185760; l=1200;
 i=adamp@posteo.de; s=20260215; h=from:subject:message-id;
 bh=P9JtAwWdXihI1s5S3QBpOen7buRI2icrD1xD1tvM40c=;
 b=ZmAXkTj+15EekGnrE9s5rYxmZGHeFNVtQhSUQ0OgQJnYq/6+fO6lylgpuozQ0Ias8Xts9KZ+I
 cdwNhm8iLFIDVQZhc0dwInHLumgPKwmhKOMAE7qf9ZjpnmxmyUv/+0d
X-Developer-Key: i=adamp@posteo.de; a=ed25519;
 pk=mtrPhSn7htywc4S5zrKNrWM6laAdfnaJzIs0BDiCyAs=
X-Endpoint-Received: by B4 Relay for adamp@posteo.de/20260215 with
 auth_id=640
X-Original-From: Paul Adam <adamp@posteo.de>
Reply-To: adamp@posteo.de
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92872-lists,linux-arm-msm=lfdr.de,adamp.posteo.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[adamp@posteo.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:mid,posteo.de:email,posteo.de:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A1D2213F8F5
X-Rspamd-Action: no action

Add bindings vor Wiko SAS and wiko-chuppito
which are used in the devicetree.

Then introduce an initial device tree for Wiko PULP 4G.
Includes support for:
- UART
- USB (no OTG)
- Internal storage
- MicroSD
- Volume keys + Power button
- Touchscreen
- Backlight
- Accelerometer: Invensense MPU6880
- Magnetometer: Asahi Kasei AK09911
- Hall sensor: Rohm BU52021HFV
- Proximity sensor
- Vibrator
- Earpiece
- Microphone 1
- Headphones
- Wifi
- Bluetooth
- GPU

Signed-off-by: Paul Adam <adamp@posteo.de>
---
Paul Adam (3):
      dt-bindings: vendor-prefixes: add WIKO SAS
      dt-bindings: arm: qcom: add wiko,chuppito compatible string
      arm64: dts: qcom: msm8916-wiko-chuppito: add initial devicetree

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts | 371 +++++++++++++++++++++
 4 files changed, 375 insertions(+)
---
base-commit: cee73b1e840c154f64ace682cb477c1ae2e29cc4
change-id: 20260215-wiko-chuppito-ae8af4843e67

Best regards,
-- 
Paul Adam <adamp@posteo.de>



