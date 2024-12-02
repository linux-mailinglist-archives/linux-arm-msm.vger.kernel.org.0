Return-Path: <linux-arm-msm+bounces-39940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A639E0C5D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 20:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ACEC2844C4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 19:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350A41DE892;
	Mon,  2 Dec 2024 19:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSR3gwdJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069FB18E047;
	Mon,  2 Dec 2024 19:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733168492; cv=none; b=ZkE4c1i8p/q8DyLsIDNdrt4sF5Lilcw4NmogRf3dUH/YnrgRp6XpChMN+K6nIQzI1PGUWAbDueOSU9abaou715ejnBRTRarYtcq4+00pmasb32ObpJiysBkXJhSGIWijkTIaBtLXMWQ0p5cxTXrgz1M/unp7WM82MX9Q3v9jUAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733168492; c=relaxed/simple;
	bh=hKo6wpT2lQ4WiPM+HGouzNx2yDZfJADULnxPu3Jm2o4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DaJKQglY9yBpEiuFquTpV6Gc5Oasxi3LJTJAwdgI7fQoyLSZ7SQ/r/dIR84Bfx+ejovK/Y4SRyzqG4NNOjHu2wWxZTejU+v7gEbpFtfvrI7i4m8ObR/a7IE6bu8/dkbpgjtW4UbjVjRNFXqCu/IQsWgz6Mr/VvuozP7id5rSutM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSR3gwdJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4A0FC4CED2;
	Mon,  2 Dec 2024 19:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733168491;
	bh=hKo6wpT2lQ4WiPM+HGouzNx2yDZfJADULnxPu3Jm2o4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KSR3gwdJTThmvqpQhInzJde5fzJkXVi8FEAbFK1L+ZB4LGFQEyBKTe6iJ8ytHkatM
	 a5thDuMAXy4YmQ/OasyYi4FmS2aIbm9IYbl1+hNsZ2d2oTwcwLObjco21nN10pNjey
	 UGvQAi8sDAthMYRjsd0QImUNQFmniXxRUUM/im1++dleVBL2JVejv12HiK1hyK2zJs
	 Z6h+CJXMIG+6Qix7RshL9jfSYFCf2n9uyTn8JPwfIOWFXAqqKkw8BQeBkBxRMxLMvt
	 LLE7EcHQE9CSE5HwM6pfZeBTLCYFmO+qfnGA4mhpeaX5slhJL17WcHXinjXgzVYBAz
	 Pc6L3diSo2yDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECD4E69E8B;
	Mon,  2 Dec 2024 19:41:31 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Mon, 02 Dec 2024 20:41:29 +0100
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Add HP Omnibook X 14
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-hp-omnibook-x14-v3-1-0fcd96483723@oldschoolsolutions.biz>
References: <20241202-hp-omnibook-x14-v3-0-0fcd96483723@oldschoolsolutions.biz>
In-Reply-To: <20241202-hp-omnibook-x14-v3-0-0fcd96483723@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733168490; l=999;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=zU4xt99XOiquqKqTwjoKoYgCTiyjZq1Va7AXUhaFOkI=;
 b=kZsnRZy/xaaxuoOszu87w1vJ1DbDMbgUZVYu6L9F8XebvDhgt/xkShhLJjfdtO/8cl4t3lZdk
 lDaRGT0ERZVDILVvnxa9418kfUchhW3VeVw3ei5lrrBwalXu2SKUqTt
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Add compatible values for the HP Omnibook X Laptop 14-fe0750ng,
using "hp,omnibook-x14"

The laptop is based on the Snapdragon X Elite (x1e80100) SoC.

PDF link: https://www8.hp.com/h20195/V2/GetPDF.aspx/c08989140

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ca39903935104..62e197a1e7603 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1103,6 +1103,7 @@ properties:
           - enum:
               - asus,vivobook-s15
               - dell,xps13-9345
+              - hp,omnibook-x14
               - lenovo,yoga-slim7x
               - microsoft,romulus13
               - microsoft,romulus15

-- 
2.43.0



