Return-Path: <linux-arm-msm+bounces-59144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA63DAC1762
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 01:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FF151BA49FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 23:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA612D0273;
	Thu, 22 May 2025 23:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZabzY/Yb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F162D258CC2;
	Thu, 22 May 2025 23:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955395; cv=none; b=WPQCJjB1FSidhcWpPt0WsKhFx8jZYhNIxVJzATEsaBEdAQipqvyxjq/erbiDdwH5vZBiMzEidIJV1w7XyTL5AEdvTptWTkeSbhW1BjoBcDtaVYRtpanebRBxi+4DQQ7NSFMb81JeHwzihmR1x1k+dL+i7Tuu/yPKrLsDH8mlj7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955395; c=relaxed/simple;
	bh=kMPYYZuS/QJqqrivdoubC5Yelg+gIuqU0mSYY14p948=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uAhFT1NjnFx+EJUlvqWejlKjeRr6H5gPBe3kMb4WIPVpIrGqeckJa6BIXCs/3upYfbizRtFvNeoU4GghJSl2zqtS58tyoL01wsCFLhe5qs6Jb9R6q4jozbuxYGPVRrv1W0aSDEr4vnMCrzNXyCmNrksZpHdRLM7aE28Ou6bNEkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZabzY/Yb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A944C4CEE4;
	Thu, 22 May 2025 23:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747955394;
	bh=kMPYYZuS/QJqqrivdoubC5Yelg+gIuqU0mSYY14p948=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZabzY/Yb5hwq8uX9we+VwTgKxJZ9xicuH1fFXheWEcEnM00FRP0CRRTgEbcZM9jSr
	 34rrzqOuagSGitJnAaHxjcsoBz4dmv7zau02oc2p/b/4RjDlPydc4BlrPQgH29esAX
	 jZKeaKgNErE4FiqlTPX3cpJ4CeoG2aBQ1t+FofVkNSR/Wo7i5PpNaz8uEaV8X6pTSK
	 HBnIevuK3o6pzAslk4zspAZIO2ukM0ecTP+ftD/1hS0968snz8gEuWUG/9TSf4Qk7K
	 MEfwSVa1LJlLRX48PewGjzmZ02h0hqYlbdjq+WECD015/oDeeaGiffSbtBmGy/PRT3
	 X6DCFXLPNoBKA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 23 May 2025 01:08:33 +0200
Subject: [PATCH 2/3] dt-bindings: net: qcom,ipa: Add sram property for
 describing IMEM slice
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-topic-ipa_imem-v1-2-b5d536291c7f@oss.qualcomm.com>
References: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
In-Reply-To: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747955379; l=1489;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=xCDZ0iThgX8rJN0xG4Yf/rk8aYWhnMvh5eQO5JlQqL4=;
 b=UQ2lqepFJ2j/Lu39sbZwe/jv+9ot6iMfprBEx6zwqAsj5mdZI6tbP4ENWfr9B9Z5MiLrpVe50
 B8Xd7eHH89NBvdmR9vII54be0xjojyhVoabeo6OfuzrtGFxnvqswr7q
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The IPA driver currently grabs a slice of IMEM through hardcoded
addresses. Not only is that ugly and against the principles of DT,
but it also creates a situation where two distinct platforms
implementing the same version of IPA would need to be hardcoded
together and matched at runtime.

Instead, do the sane thing and accept a handle to said region directly.

Don't make it required on purpose, as a) it's not there on ancient
implementations (currently unsupported) and we're not yet done with
filling the data across al DTs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index b4a79912d4739bec33933cdd7bb5e720eb41c814..1109f4d170af7178b998c6b7d415cc60de1c58c5 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -166,6 +166,13 @@ properties:
       initializing IPA hardware.  Optional, and only used when
       Trust Zone performs early initialization.
 
+  sram:
+    maxItems: 1
+    description:
+      A reference to an additional region residing in IMEM (special
+      on-chip SRAM), which is accessed by the IPA firmware and needs
+      to be IOMMU-mapped from the OS.
+
 required:
   - compatible
   - iommus

-- 
2.49.0


