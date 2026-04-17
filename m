Return-Path: <linux-arm-msm+bounces-103474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIN1MVTd4WmtzAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:12:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AD6417C26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D31530859DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 07:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF740341050;
	Fri, 17 Apr 2026 07:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ypKbL/9h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95FF33970F
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409675; cv=none; b=FqA/KPtpqiggPIfK/CzQEs17mUAVlseD+3uvQGWuj4l5oTCm6oiyZk3XbNJoIsn1FM189xf1M6DMyvCSLOj9cUFrnzxM19niLyOb5KuSvaPL0+GwFZQQ/eR5Mk/OTnKmkIE7x4Go2PzkdtT//G6Mjadvb8SeRc33iXS51LgXq/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409675; c=relaxed/simple;
	bh=AMCItOgDdHgKRdx1GXTFHeaC4r97dyq4obHVbtp3GHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HqzdEMF6Ohz/LWHIXAHkn4Zyjnlo/cjLGJLfPJm2KTIukqNw9vy8HKawNVwXaYhJ2kkK0z+TYPy8GyMAZ0ceK7cNKibLAFxMJiZzowZKl8zWpxO6yQkocE+3UQVqnzLamYsQoyvJQb3gaibypLwW6Nw28UkIWelGWbatGID4p6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ypKbL/9h; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-671dad7cac8so462156a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 00:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776409671; x=1777014471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvOfVZPOjPhsoW4F3DQC7Jn5+Am3jq15qDLt0sa1MzA=;
        b=ypKbL/9hVKV/zgm165L9uPUrp9LyC4sZX+h6STSboH+oGsxrbakQEQAdqSdUVGk/l4
         Tt2aU8DrjMAnoOxrKEWLURC2c7cFMbOf9qrLkjGVbb1Rl73ax7n0v1K6T2Tb9rc7bgp7
         iP/fCfhvk1I0ZXtR7KBYH1HiDIHAry+8A3eSK7x3HMciAYOdcJnxrJjIArmGiKeqKhnh
         gAQLUuhVKu1Dnya3bbl5cy2woe9zc4MWzr8sWns7tJbVyqOYRfk112bI0tiZFoJFmWR/
         6juvY5n/70YRUP5s0QvE4SP5oKbLB5ekAFftgCajuXGYK6gnHXWU5xiohE6vbabkbE7S
         wyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409671; x=1777014471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cvOfVZPOjPhsoW4F3DQC7Jn5+Am3jq15qDLt0sa1MzA=;
        b=oWHBfDp/iyLRa36Wc30gedxwK+K9Q22Tdgf/ezm+6F68UBaz+/u1+bg3kdPhjhhFa0
         L3IFEjYOtRgz1LDgn/KkjAJgK2FPp66aGUj2a4pDJAdXXCLStjfRronUk1sn9OII98es
         gT5I7Ne5kANLf0Z6cD2vzt2EnLrI9nzC1aXxJT3DkRLXKjf1kYCi7VvtcKy/b+LR/tlR
         ps7vYDxUe8Xou49eMBtqUo/aHIgTo9ZcV9gM6B+VnamTCWtU/t27Gbt2+T+5+RULk0sD
         9zmVKsQHDFy4LDOEYrzLreyves5a89qpgxkQbfCFQbb5w7NcbqTMoox2BFN6BV8T08LB
         qJbw==
X-Forwarded-Encrypted: i=1; AFNElJ+VO+Z4EbbDmVOnvu4fGWTfgjYrQ+pdeauNmD5xDIMgKKbPjQHJPKpPrIiSjgI4cuZpizAk6d14I1BuR+TR@vger.kernel.org
X-Gm-Message-State: AOJu0YwXGVGVeqKlXHLdEiwa2XGuSdEiCNFalGiwe/wrPg4cv/KCxLBM
	G7UnsaLmawdN1pZf291Mq8nULjOYO1fhyNEXQOsJ+JmmnzQ71GBG6lLcLm+3hSSHKO8=
X-Gm-Gg: AeBDiescSsawuSz62GTdmQyK2MNEmBNtOjiovKqp3k3NzF0RXCXoCYC5tmGVHBQfW6/
	6enqC+jJB6mr/rjXJm69pmtyDnlcQW6WcAiCSRLvStoNMOZ7cvoeDhevj9t48MJWgWYjVTcKIOn
	4EnJkApWHCMFcsDfNmKJ/ST6KDnhIMdAVs3jkRqB5XBRL2wZyhx/HNu9Nywhvj4QGnAw3AoHVtS
	HoitTBNPf4Zd/ebiXR+HIYYz6dPf6Iz64/+oUrFgMq/a45zS7AwgnbPIL1nBHlZFwr1ezJti4kP
	wy/A7DpFWbqUxmk2CxW2wU/RhOUAVqfPTrY4S0S+BhS8bhjHnqNscojX4y4cQo85bVTRaFMllXL
	Dr+any80q1eUvvAvgdmMVsKLxi4c/Md5f3itB3QnIHNHfxL+fVXD3ZQezkZ8+TPny6Uh8VYhgvk
	IZTXvyw78znO2Pp5EqZ80XDXBGU5aChWlUA/5l+dgIX7n0hWVwPWie/zntOZWg4/iWhrQKZ4pVe
	AKoLMGMqJgFdu8L
X-Received: by 2002:a17:907:1b09:b0:b9d:e69b:58f7 with SMTP id a640c23a62f3a-ba41945c089mr80672066b.21.1776409670939;
        Fri, 17 Apr 2026 00:07:50 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdfd27sm26448466b.26.2026.04.17.00.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:07:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 17 Apr 2026 09:07:44 +0200
Subject: [PATCH v3 1/3] dt-bindings: clock: qcom: document the Milos GX
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-milos-gxclkctl-v3-1-08f5988c43a2@fairphone.com>
References: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
In-Reply-To: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776409667; l=2723;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=AMCItOgDdHgKRdx1GXTFHeaC4r97dyq4obHVbtp3GHw=;
 b=hUIxkwNCfgNBT48GTiRI3BvsQ5rtFklAYZzv51cQl26o2DQEuT+YGDpXuqxrSQEZS2UEtKPQ+
 DXfgdvp/FGZBzOFwEIAp8Nhu5X+KFyue9GP1EMWKw+uLxVinjHuHvWV
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103474-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,devicetree.org:url,qualcomm.com:email]
X-Rspamd-Queue-Id: 32AD6417C26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
Power domains (GDSC), but the requirement from the SW driver is to use
the GDSC power domain from the clock controller to recover the GPU
firmware in case of any failure/hangs. The rest of the resources of the
clock controller are being used by the firmware of GPU. This module
exposes the GDSC power domains which helps the recovery of Graphics
subsystem.

Milos can reuse the qcom,kaanapali-gxclkctl.h header due to similarity
of the hardware block, and also reuse of the Linux driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,milos-gxclkctl.yaml        | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml
new file mode 100644
index 000000000000..fbcb5d3f3e3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,milos-gxclkctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Power Domain Controller on Milos
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
+  Power domains (GDSC). This module provides the power domains control
+  of gxclkctl on Qualcomm SoCs which helps the recovery of Graphics subsystem.
+
+  See also:
+    include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,milos-gxclkctl
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    description:
+      Power domains required for the clock controller to operate
+    items:
+      - description: GFX power domain
+      - description: GPUCC(CX) power domain
+
+  '#power-domain-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@3d64000 {
+            compatible = "qcom,milos-gxclkctl";
+            reg = <0x0 0x03d64000 0x0 0x6000>;
+            power-domains = <&rpmhpd RPMHPD_GFX>,
+                            <&gpucc 0>;
+            #power-domain-cells = <1>;
+        };
+    };
+...

-- 
2.53.0


