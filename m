Return-Path: <linux-arm-msm+bounces-102508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAugBufF12mdSQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 17:29:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB543CCB0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 17:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 299B73027CC7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 15:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FB03E025F;
	Thu,  9 Apr 2026 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZ8DTXT0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E3B3E023A;
	Thu,  9 Apr 2026 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775748416; cv=none; b=KQMkJjDxHQMpBOByLsxBlIAiD844KkQGveYpVa+ArcqzBzRqkAx2enfgkyVXEse7dZ1+i2DpynvmjaQ8ccv7dyYu0zYa7hOmwruQj7yp2x2HTBxYDfhKbML5IYYe6HZoWYwq5G5W10gmBNWVnSkpipy26awoMK/7N+SC4fjJ0S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775748416; c=relaxed/simple;
	bh=8ymOGtV7ZYio6bX7A1zy+b5IP5On8ZOjobHhJ+TuRqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rUzH8UfYi68BDCZSyZw2e7jDvQhk9AJKHqBe7sj6JhwLKDux3FQu3gMxJytdUz/YO3XGpbhL3Kpvi8j8GmMUzMlApwDCjZ52/Q4PgbVRFgcSNvTFC85/giIgVMJe2EFOdoA9x1/WEFUEHYWaBcfsEGEeZR5b3yH9X4hMhlePS1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZ8DTXT0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04642C4AF15;
	Thu,  9 Apr 2026 15:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775748416;
	bh=8ymOGtV7ZYio6bX7A1zy+b5IP5On8ZOjobHhJ+TuRqU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lZ8DTXT089BydUepdggVRKFqqkz0R7XAUvZ/XWP59JHiKzRUK8H9RRubpKiwbTZbC
	 abNpTXNv1Ywcgm4tvCLvky8k/NFbiDxLafFKvSEY3gf1OaxMcidkC2RRLHWHCgp2bQ
	 7o1mQliod960zQEnsLwn5GzoXmlDzUL24fCN069rL4Zt+H6tkgDQQrwPmIQGqIAQl3
	 zsGjQkHrL0gYVwBfA0Io0D8RYOjezAjalD44xcDGOJWiQsLuaXdpgoZ8gd/fsqBNv2
	 qQNX3hiXjVDPNi6MQP0RHduPPoRuq5u8ZNG9B6U3qvXei93y4v4eVIP4TUG1PUf51Y
	 ZhRKaGB5rATGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1146F31E29;
	Thu,  9 Apr 2026 15:26:55 +0000 (UTC)
From: Joe Sandom via B4 Relay <devnull+jsandom.axon.com@kernel.org>
Date: Thu, 09 Apr 2026 16:26:56 +0100
Subject: [PATCH v3 4/5] dt-bindings: arm: qcom: document QCS8550 RB5Gen2
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-rb5gen2-dts-v3-4-be736355d4b4@axon.com>
References: <20260409-rb5gen2-dts-v3-0-be736355d4b4@axon.com>
In-Reply-To: <20260409-rb5gen2-dts-v3-0-be736355d4b4@axon.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joe Sandom <jsandom@axon.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775748414; l=1053;
 i=jsandom@axon.com; s=20260319; h=from:subject:message-id;
 bh=X7bqqJqdT0hN1KiBNbd6ABCxR6gi8MIYVUn555bOoDI=;
 b=iCstqQHcRq9KriSiEm3ZYhT0i+DUXIrxGMo6841o/3nBuPW3U8+2MuNLl+Enh2H11bUqPBM/X
 Oq9oFCUXAsCCBvixFCixf61zzTk8+DrjWmDyuqTFC+/Q0Mzibj7K7Tk
X-Developer-Key: i=jsandom@axon.com; a=ed25519;
 pk=Q/yflwj2WhkgBVTskrS9Vl5oScD0Bp3vTzDi+OxskTo=
X-Endpoint-Received: by B4 Relay for jsandom@axon.com/20260319 with
 auth_id=687
X-Original-From: Joe Sandom <jsandom@axon.com>
Reply-To: jsandom@axon.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102508-lists,linux-arm-msm=lfdr.de,jsandom.axon.com];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[jsandom@axon.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,axon.com:email,axon.com:replyto,axon.com:mid]
X-Rspamd-Queue-Id: 7EB543CCB0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Joe Sandom <jsandom@axon.com>

Document the Qualcomm RB5gen2 from Thundercomm based on the
QCS8550 chipset from Qualcomm.

[1] https://www.thundercomm.com/product/qualcomm-rb5-gen-2-development-kit/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joe Sandom <jsandom@axon.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 1335a7bee397c46e8dc62806091531e32b7327d4..f9f8001e3e6b66e3a926255bdb15363f4c7c2b66 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1093,6 +1093,12 @@ properties:
           - const: qcom,qcs8550
           - const: qcom,sm8550
 
+      - items:
+          - enum:
+              - qcom,qcs8550-rb5gen2
+          - const: qcom,qcs8550
+          - const: qcom,sm8550
+
       - items:
           - enum:
               - ayaneo,pocket-s2

-- 
2.34.1



