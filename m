Return-Path: <linux-arm-msm+bounces-46826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B40A265A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 22:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBF293A2D33
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 21:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762B9211A19;
	Mon,  3 Feb 2025 21:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ViNi5+at"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB77211A0E;
	Mon,  3 Feb 2025 21:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738618180; cv=none; b=Cfch91IWsFD78g1Ez55kIkZMN3aO041CPdFMmCBJTRdnbDYflPGEDetO4cyB/wqQIFvqXglZEyn4s1rwoYgV6H0yuPRqMEMAMPPuRCj0i/asL4sGij7n91LhkesiXbbxMShnKxSyAmdfdlJJipwsnnlakya8UhkzcuslViooQzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738618180; c=relaxed/simple;
	bh=gH86BnBn1M4iZA8c/LY0iT+xjsDYLG4Lpb3OpxlxBX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=msVlyi3Uv6ogpETfkLMj2fylAghUKWgD0l8T4mCa3sNGNt6u83+cXfStv1DZEV90Bzc4b+WjDNQngBe9YXYTFYpHRYtTvRIIvs1+z0tTY1A/ofZrmwVZ5iEzUtW6DiPsigpb5KcnXo8kFSWqhhYHrS6KP8QpNbxGPpIjq5Uq/v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ViNi5+at; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F8CC4CEE3;
	Mon,  3 Feb 2025 21:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738618179;
	bh=gH86BnBn1M4iZA8c/LY0iT+xjsDYLG4Lpb3OpxlxBX0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ViNi5+atd52ZE2v0na/nWMNohfRf5VMWshiKPTgLSEkgGjw1LZ7nzVD41O1hjsP4g
	 njZTdAUeoQ9KSvJwqn2rqtqwiIIMUn0Mj7/nkCwHFGp3MgX1/8RNXBIC7VSthXIVtu
	 t0m7MtdUlj1rgrDQXEUq60TeBAdjRrtYEZv8l8orFj0e25fY7bbCxkSltgrgJuUnOq
	 uHF6tCE+OT/drh+aumnOFYdIZ2T/lErOxoMLacLt0uAk6n34Bvs/aH/azIEbyHvoRc
	 5iP6zFmUKURefAzd1p7NLHr2l/GpcOXan2C5aYCLCn1BJywy7C74sycMpegqE/cHo/
	 uQf5wqyD+9Myg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 03 Feb 2025 15:29:16 -0600
Subject: [PATCH 4/4] dt-bindings: net: smsc,lan9115: Ensure all properties
 are defined
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-dt-lan9115-fix-v1-4-eb35389a7365@kernel.org>
References: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
In-Reply-To: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Vasut <marex@denx.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15-dev

Device specific schemas should not allow undefined properties which is
what 'additionalProperties: true' allows. Add a reference to
mc-peripheral-props.yaml which has the additional properties used, and
fix this constraint.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Please ack and I'll take the series.
---
 Documentation/devicetree/bindings/net/smsc,lan9115.yaml | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/smsc,lan9115.yaml b/Documentation/devicetree/bindings/net/smsc,lan9115.yaml
index f86667cbcca8..42279ae8c2b9 100644
--- a/Documentation/devicetree/bindings/net/smsc,lan9115.yaml
+++ b/Documentation/devicetree/bindings/net/smsc,lan9115.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: ethernet-controller.yaml#
+  - $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
 
 properties:
   compatible:
@@ -89,10 +90,7 @@ required:
   - reg
   - interrupts
 
-# There are lots of bus-specific properties ("qcom,*", "samsung,*", "fsl,*",
-# "gpmc,*", ...) to be found, that actually depend on the compatible value of
-# the parent node.
-additionalProperties: true
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.47.2


