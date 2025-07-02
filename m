Return-Path: <linux-arm-msm+bounces-63448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D974AAF6223
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 20:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D8AA1C45351
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 18:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242712BE650;
	Wed,  2 Jul 2025 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dC4t+w2U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF04E2BE646;
	Wed,  2 Jul 2025 18:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751482751; cv=none; b=sQ37uGhlMIUjwn0LXtHDMd5sqpf/ehc4WMUwkxz07wvPucohuWiE1sJtXfZ04PUbvuKuXZiL4p9g5qgjXRlmd0dc+1Yfiz0GwQCc7phKLxfbYzlAtiRE6zQU41Au4lNLSYtaGApNvtRlzDpX2E8+Lq/7TIvAx/U8iXcexFabubM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751482751; c=relaxed/simple;
	bh=DXbM91CgEjCkxuAzzT5JKDW/blmIS/P9r/NYKp++kJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z0jGGe2gkSgxhk9HUOZHRbaE7N+5w+60hIXtt05671kEt2nRfztUwlZc5dZQZ+U0/uu3n34/7bTSrIuMfJBHBVJc1HRvwMapBn/6uuHcJe3qvhToFyqzlHR4YGfmPzywCdammg8nbliJ30wZOrcRnmu+3ql07aX7aeW1JOxbhP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dC4t+w2U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 857FCC4CEF1;
	Wed,  2 Jul 2025 18:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751482750;
	bh=DXbM91CgEjCkxuAzzT5JKDW/blmIS/P9r/NYKp++kJ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dC4t+w2UyNiKQDyg+STh3AerNawMZziv64yH2Y+BFo5CP2E3Nk5OzV0OsucU90Ocs
	 8rdLgaRrbOk+pqRwoqesAZMWCKfuz9I9qubnOQ2fVMR4qxqBAPcM1fcAejbtvkkskI
	 sykcUc4Eb9JfHgDoF3O+An5phGbd3OrLLmd8poWDW4Zpg0qwpY/O3EgzKQjW7issdP
	 i/yhmRlaMH5jgMQyaFvwr1pwuRu4DLHnbPQ/E0Vh1BhtxI/DBWriPwv2vyJgHlLx+R
	 pJAHDKO5WYlfnc6gz5du8KPk+Vojo1/YDv5uacE/Fld302acdpFmNosVmUlaE9fspb
	 2goUpyNXuH4Ag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BBBC8303C;
	Wed,  2 Jul 2025 18:59:10 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Wed, 02 Jul 2025 20:59:07 +0200
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Split HP Omnibook X14 AI in
 SoC variants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-hp-x14-x1p-v1-1-219356e83207@oldschoolsolutions.biz>
References: <20250702-hp-x14-x1p-v1-0-219356e83207@oldschoolsolutions.biz>
In-Reply-To: <20250702-hp-x14-x1p-v1-0-219356e83207@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751482749; l=1368;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=Pol/dtLzZJ2i32WcUXC19GKh3aXInqtPj/XtwlKvYLI=;
 b=O/0tTVJf7pv48wPhAMLCcI3LiJIFevkD6HYUOF/RkA57CFax4wQYHhS7q/DMbkpz1l8ugar8p
 Hf/27Hzm0ZQAn/+XpiRbKZKa2ri90bfWqqbCEamNDNkV5mbpx3jz/Fx
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The HP Omnibook X14 AI PC is available in fe0 (Hamoa, x1e80100) and
fe1 (Purwa, x1p42100) SKUs. Since they are not completely dtb-compatible,
split the model strings in 2 variants:

hp,omnibook-x14-fe0 compatible to qcom, x1e80100
hp,omnibook-x14-fe1 compatible to cqom, x1p42100

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ae43b35565808ed27cd8354b9a342545c4a98ed6..d114b7ae4fa7b162a83a152d9bf8d3fc2d74750a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1148,7 +1148,7 @@ properties:
               - asus,zenbook-a14-ux3407ra
               - dell,xps13-9345
               - hp,elitebook-ultra-g1q
-              - hp,omnibook-x14
+              - hp,omnibook-x14-fe0
               - lenovo,yoga-slim7x
               - microsoft,romulus13
               - microsoft,romulus15
@@ -1159,6 +1159,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa
+              - hp,omnibook-x14-fe1
               - qcom,x1p42100-crd
           - const: qcom,x1p42100
 

-- 
2.48.1



