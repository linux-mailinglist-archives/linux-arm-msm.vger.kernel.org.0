Return-Path: <linux-arm-msm+bounces-59531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26884AC4D4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFA717AB01E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 11:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13F525A2BF;
	Tue, 27 May 2025 11:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVzil5Ga"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04D2259C93;
	Tue, 27 May 2025 11:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345227; cv=none; b=lFAAslFRz+1PTtUoWK49XaqD7fVI/UawwxgrvIKO5EZw+75tqhvDyxYU3M5d5JfK6ZFKoQV5xjW5iIffvAe+taak/mnha7/3w18UgrPkWEsfSdvbHclGwsxlzFBVmgV/Ue6s6BgVKjkjAnw8S0TD8A33Q/4e9MwTNxpMuD9Ybbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345227; c=relaxed/simple;
	bh=+pWI2uv73LuA3ddN/AMm/IroqKUSVjOsKAkr3zNnrkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fg7Z2ZpwsXuJYVSqjOQu5ftQrl+1yzpmOahuO0bg0znbpgxStiR56anm65pM4g5DwzF03nQ+ekgrQpIWypoFdJUYi+RnZS+i500z4AW67IT2pSddjlVshFQCHatUeFVZSh1aBpPC3SnyuwLoA4wGRGiwb+daC8CtYZat6M+zjxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVzil5Ga; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9C2C4CEEB;
	Tue, 27 May 2025 11:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748345227;
	bh=+pWI2uv73LuA3ddN/AMm/IroqKUSVjOsKAkr3zNnrkQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LVzil5GaYmtvAHuv8MwfbMfVncaM0pxEwSf/LCJztXYxpTGzGR8qF5EaJ+uVKZYOV
	 98mVCEwQ4wD+LpwOA9xnefTdrMffp8K2CFKGiyBjcINtR7Enifu4fPEavpkO61TZQL
	 XUSyDvyD8oJ9FMqVZQTGyFOYE2yhnogYdOHOlIMWZtw/kcN05V8QpOX4iIQeyyyE7d
	 YfenuXvMTA6BNdNswcMt/jhDybhm7BkafJXEZAcHWdVPM/X4XLWoFe8Fs6LnIXnvAu
	 K5yn8GdNNh7a1MCnitV+vcb+TwjCZvjnhmwJ71BcM2rsdeUdH1kbvMxk9PJN1Bnsxh
	 YV/nNpQITGDPg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 27 May 2025 13:26:42 +0200
Subject: [PATCH net-next v2 2/3] dt-bindings: net: qcom,ipa: Add sram
 property for describing IMEM slice
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-topic-ipa_imem-v2-2-6d1aad91b841@oss.qualcomm.com>
References: <20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com>
In-Reply-To: <20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748345210; l=1535;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=wy6W0XXSLjyCDHmSQRFlaw12jjvq142qLvrrsqdi92A=;
 b=ZwAmY8A5qtj3mRShkQvUPRymkAFN8pwoB9WyP7tRR8otCO5qtMTUiYqU4dbg11pbjH0pRpIVF
 vEG3yKqY1I2CLGebZwU5v9XnKzvfnRIBi1ry+VIL8n0K7FqfRN3ZlFk
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

Reviewed-by: Alex Elder <elder@riscstar.com>
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


