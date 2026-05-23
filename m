Return-Path: <linux-arm-msm+bounces-109480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NwyNup4EWrymQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 11:52:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC895BE5BA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 11:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E03F9304FB90
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 09:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E590387362;
	Sat, 23 May 2026 09:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rQ68ZHkK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40E6381B1C;
	Sat, 23 May 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779529537; cv=none; b=Hyit32BBvcKPWdzBSCogqbDLVThcI7z98tAAlDUSEOcszDKDlNhHnwNGmIffgaelHKQ/B9bVazG1vAzTgKYpox1D+L7ZrKRo/UaztExP2AanO6zdTLzB5MbHNSSznOagd5JG9hdDvwe5kd0gSspqh+QIL5qFMUsqdwMz+pFzlxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779529537; c=relaxed/simple;
	bh=yEKmbM25ZK79+9Dm2ryr4EnbB/tCidnNrRNzd/qSNsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KZuzoMLLJzdacRaNN0etaoeT33Ql6uF65X3FtjUbMufnV3DLh49PDPDBqFmRk0M6Hz2pKQxKBkOUOwUqZavdBk2DTx3wvobZavPUXQXh8c8Ndhl0szhDsDyeaxg8zQWnmC3vlWEob+YFhycwrwaNSmaLlT3MKCQhH4Z0jdz6qyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rQ68ZHkK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DA2AC2BCB9;
	Sat, 23 May 2026 09:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779529536;
	bh=yEKmbM25ZK79+9Dm2ryr4EnbB/tCidnNrRNzd/qSNsU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rQ68ZHkKAQ+34HIBg0bzdFEKokX5xkJmFz8BgGTO/k05EhpYc9qZUDKPJ/Uv+MCjW
	 k34s2l1LSFlw4iEiqzJFnDdibHWySKeYdgL5fnproIo8NfuDt8CsWhJHCJnQZiToRv
	 xMxvqi8avlTEmheq6ITRw+GnJV5Y+lSC839ZnDUxdCJelUdmjF8ghquop0KNt1og4J
	 JETSA+FTFC4i7T8VrmUbd1/lTq1JAr25wRsTbJQjlBBrSl2w3X5R75QG9NxGCRiWSa
	 knWVbu5s+FYbWNhugLCO6v9EuNvQW6thUpyUKHULgSRrUI/+jhVS0/QFh+Tvr8IKkV
	 mGtxNCHk1ovmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7894BCD5BAC;
	Sat, 23 May 2026 09:45:36 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 23 May 2026 11:45:34 +0200
Subject: [PATCH v2 1/2] dt-bindings: input: syna,rmi4: Document
 syna,rmi4-s3706b
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-synaptics-rmi4-dt-v2-1-0645122babdc@ixit.cz>
References: <20260523-synaptics-rmi4-dt-v2-0-0645122babdc@ixit.cz>
In-Reply-To: <20260523-synaptics-rmi4-dt-v2-0-0645122babdc@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=0q+JIIsIzsebe835sf4TIR/9lu8nbddLJDq/K03juvc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqEXc/BdW8VHYyGBhmXrqsBIYZ6AHtA/jYbsEId
 Bhl3OBhrMiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCahF3PwAKCRBgAj/E00kg
 cij0D/9yltRG0psQbXfzevFnU+3syLSl+yA++BRC7ab1DzK6eCt6hCM2iRhDXKExsVub/Z+1Gt1
 WTVUU7xdFr6GlLps03hz+oOVQ/a3C2+2Q7G2EByAfL+HcSrYOmACnZOLW8va9998/ZFBBomqEH6
 udbD5bGzROYOYkwI8cXvGouIYU7W4c2GhLznOKELC+0qOGIZau7wXxOL6OSZf3s30k6Q2rAHabW
 3yeIZ9BldW+HiN44Ym7stvdjw7O9ICiwN9Z71/Xh0V7C6310QIAPT6roDal+rJ1LmnRyimG0NTE
 n99EfjbCLq9oX2Nx8YqqlRvNpYfwEZYIcOVLlPwoig+A8wr3jZsY7fwqtqmmMlQg7qddppffg5r
 Xg3bHJszoZ0iaR/+7YKbvcIitIb5uf7caUAvLk4Qs0fBTr89KJ+nL4+GgLodhJpurJU+41w6MdR
 bR2rhZrn9yLMp5XmXoXoroFtekCml3o7dBo+5wPPp+MJ349KM2JzVMEoflxToGQEN9LH8ZXoQA+
 kScG6CA7yXupZjFNuJYy/UsFBe3jIEP/qrdhtKyIPVmDzKXGJIzdjyqCyYtounpz+UlAWZ50Lqa
 W6WmRcruhHw5qqTEnbojLi0FG8ZuOBVKn95SqLjLxykeMDJSFSqBXU5Mk2Lc7+5Og7BgarS1p7y
 col9cX5brln3dEA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109480-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,zx2c4.com,ew.tq-group.com,tw.synaptics.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 9BC895BE5BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Mostly irrelevant for authentic Synaptics touchscreens, but very important
for applying workarounds to cheap TS knockoffs.

These knockoffs work well with the downstream driver, and since the user
has no way to distinguish them, later in this patch set, we introduce
workarounds to ensure they function as well as possible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/input/syna,rmi4.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
index 8685ef4481f4a..fb4804ac3544d 100644
--- a/Documentation/devicetree/bindings/input/syna,rmi4.yaml
+++ b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
@@ -13,19 +13,24 @@ maintainers:
 
 description: |
   The Synaptics RMI4 (Register Mapped Interface 4) core is able to support RMI4
   devices using different transports (I2C, SPI) and different functions (e.g.
   Function 1, 2D sensors using Function 11 or 12).
 
 properties:
   compatible:
-    enum:
-      - syna,rmi4-i2c
-      - syna,rmi4-spi
+    oneOf:
+      - enum:
+          - syna,rmi4-i2c
+          - syna,rmi4-spi
+      - items:
+          - enum:
+              - syna,rmi4-s3706b  # OnePlus 6/6T
+          - const: syna,rmi4-i2c
 
   reg:
     maxItems: 1
 
   '#address-cells':
     const: 1
 
   '#size-cells':

-- 
2.53.0



