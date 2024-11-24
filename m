Return-Path: <linux-arm-msm+bounces-38969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 039089D74FE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 16:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B07B0B3B7B1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 13:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C0F1CFEB5;
	Sun, 24 Nov 2024 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eNk8etjH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4757419DF66;
	Sun, 24 Nov 2024 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732454420; cv=none; b=fxbjDDpqVWwl8dtWgFGBaOZqBGOpKpFIvNdAOxzh4NI6l2fjmPMwKhBU45hItCRNex2g9WqEnEmZO0kiv7ko81yr8ZC+9AdnbieqxWbYz/aopNLXAA6PNGTjDww7OUl7SbLwcENQ7mlF7h/R/C11v64Mbr3R5HNpm/QMSVk6LlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732454420; c=relaxed/simple;
	bh=EtfPh7PgvIA2k3juLObv+tMNxfZuebaJ1CXuplChEUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AgAqRXHQV+b4wQMRortLjsa0uw/QJyIR40nQ+91AV16GU7ABU/ARL8cW72cQBgIopWfaHwqYJ4FzaitNmKBAdrif6y52zntKr0OrdARxI095Xh924Nw5QkTm20q+1S8fBaDtSVhAxgIIQ++xu9yf8dnRmICZe43XNrd5AuJFj2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eNk8etjH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D997FC4CED3;
	Sun, 24 Nov 2024 13:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732454419;
	bh=EtfPh7PgvIA2k3juLObv+tMNxfZuebaJ1CXuplChEUI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eNk8etjHWufM+BYvEbgLvVmp/uC5CYLxF/BDcStanyJehKA4qL6vLuREGM2ddl+eY
	 DJ+tLi0IxSYAz8M7Jp68YaYpkG7vBBz0MoJOEB+CxTu/V5oCXW5Yg7oEaenI61kAL/
	 lDazQZqp9Az2PKROHD5I2SLG3aO6x56uvLH1FS1JDP9BiQ3BCUtzlZ7/VoKN+1BnxP
	 Y661aOb18ZWHGli0jFLbp6SjQCVgSpj3CIoTmSdaPm00KPY7lDLPs6pHgk+hI8+HdB
	 JUt/NO3DAaoUaSfHPsV7oKrwyUAcjY9lZx65z6V/FPEHVtVY/vxcyny2WrSUg6A2Mx
	 rtoXCK53N4JNA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD5AE668AB;
	Sun, 24 Nov 2024 13:20:19 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 24 Nov 2024 14:20:15 +0100
Subject: [PATCH 1/4] dt-bindings: arm: qcom: Add HP Omnibook X 14
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241124-hp-omnibook-x14-v1-1-e4262f0254fa@oldschoolsolutions.biz>
References: <20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz>
In-Reply-To: <20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732454418; l=935;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=XL2QR5fav9PTm4bj2aAabfeiNRaT7RhXzBiXmBI/OBE=;
 b=vlJcJ1R6tCoInUkDdhDqzBlrIKNw4mub3QTLW0OBoLbgBex8YvyWkUGcNgnkaj5u/zmvGgWDS
 Mq7S26+sOkaCafSSuDYtrliqEzfC8RMLYx1YLXyoqtZBPgNeEn30cYy
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



