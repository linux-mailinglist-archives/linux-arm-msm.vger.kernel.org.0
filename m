Return-Path: <linux-arm-msm+bounces-46823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C53E7A26593
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 22:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A734D1885723
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 21:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61F72101B5;
	Mon,  3 Feb 2025 21:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEm1LcU+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822A121018D;
	Mon,  3 Feb 2025 21:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738618175; cv=none; b=VNIRId72flcw9FjjAwxSoS+HnVr2SIt+8HHqBJUXVKY7vKo1RwelatKjW3WbiD1lCMUnOdt/t8pSi74D7nqff9gRVRwIMRgojIpRVGxfG/1VdF5n1jE7zV1JTF4fW5BrxVHRDpjtX7Ai8KvRsnGxRzwEj341RK3oU5OjLrtInZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738618175; c=relaxed/simple;
	bh=BebvpPREciDqkWSJZ64d5uD1fgdX0OpQuYFwZj5JRgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H1uzctoeLlAQ6gulEIua4iyk/tJT6+OtfKAVPiUtqrgqn8jBJRqvY7cxGrK/lt2pNr/GGuSpPUHrEztciST7dNjp75x5POe24bnuobWaNClhaz17hHc24zZJ9Gds67mFg0+PN7bvYbu+LWBXJh6F9eG7gzyW6S6dwrHWnLKKtfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEm1LcU+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E5BC4CEE3;
	Mon,  3 Feb 2025 21:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738618175;
	bh=BebvpPREciDqkWSJZ64d5uD1fgdX0OpQuYFwZj5JRgM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eEm1LcU+ACo0yxGrYyt9C4HmP7/4/Qh0O04OBFHKGwkjI+smn3Lb30EyoZOu9yKzj
	 X1pqMpJh/jkO8zqibLiS5IUnsHB1LklGpH2CWQ8o39gqGkdTrkhNzZaLeWKY3OE1m3
	 691eCwS69+ZYI5WJsU/YmKpSzWT+432adlTzm3dcEyq6xxBEM17h9qBMbQmBd+nZYe
	 N3wDwZt7iZW89jIBGlvwHfnEIpmo4O8bFSCG0UlEUpTNwpVAZP4uOxSIIhOG9iPtDv
	 yP2/XI2mq46aBhDacgiJW4O7tirUECBA2Y/6YIHgPSLbSD5ZJ0JMAoZqzj/P4FNRta
	 ZqSUpng4m16FQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 03 Feb 2025 15:29:13 -0600
Subject: [PATCH 1/4] dt-bindings: memory-controllers: Move qcom,ebi2 from
 bindings/bus/
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-dt-lan9115-fix-v1-1-eb35389a7365@kernel.org>
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

The preferred location for external parallel/memory buses is in
memory-controllers. 'bus' is generally for internal chip buses.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/{bus => memory-controllers}/qcom,ebi2.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/bus/qcom,ebi2.yaml b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/bus/qcom,ebi2.yaml
rename to Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
index 1b1fb3538e6e..c782bfd7af92 100644
--- a/Documentation/devicetree/bindings/bus/qcom,ebi2.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/bus/qcom,ebi2.yaml#
+$id: http://devicetree.org/schemas/memory-controllers/qcom,ebi2.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm External Bus Interface 2 (EBI2)

-- 
2.47.2


