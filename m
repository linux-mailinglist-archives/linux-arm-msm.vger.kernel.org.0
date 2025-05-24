Return-Path: <linux-arm-msm+bounces-59289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF02AC2F6A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 13:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 751FE4A5365
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 11:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D991E493C;
	Sat, 24 May 2025 11:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nB0LJKpO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6245D1A0BC9;
	Sat, 24 May 2025 11:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748087325; cv=none; b=tdrHbatQWeQV7eBXVhBXbVAbSxKT87ygxmhLlJsIocJFJ+/YxSi+1k6097mh4BkUb/XgVP+sbcVmuwLwJbCk6zq8V/JgkncDEkHKtmmQInrxRBPqZXZLjCAgxpndZmrt3hhOlAUfoSIqLWzq7GfPrM333M90lxQtusRTHaXHwCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748087325; c=relaxed/simple;
	bh=NywEqeDWKIE3DJOODAgld7o8NJRiMHAFoJbk7OTyI6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cuI+7X9XSMXfQtYrHcf85Yju1AnuyWj9w8HTIKwuNZu6Dh47wp3IfdMMDBbg+Zi0WiUDaQGZ/PKOdNtRvGtJotIGuvx9mrk6Dtv13ld+zX1GcB4lqDV7fVTSpY8q7pIEBazqIf8FTkU/g43TLF3gTOQdfcxpUsLERBWFKqI/5Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nB0LJKpO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C91B7C4CEEF;
	Sat, 24 May 2025 11:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748087324;
	bh=NywEqeDWKIE3DJOODAgld7o8NJRiMHAFoJbk7OTyI6I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nB0LJKpOU+1i3Fb3HOIkDUnSfV/jv4oF7+KVHQ8zy8IAFNzUoLPa/Vm/20ArNUYsd
	 ZnXuaH9tiBSC5MjDpsZMbA3oApTAsEAWQQVWIOO1z1YrkAyH2c5Y4mJ4uIbtQq+xBB
	 v2gtHdQo4uY97333nrDf582EuzfVf6l7RlM6K32wv3KI5B3hiygjg27DqQq+Hnu4Zd
	 SVUhiSgjDvdHaQ+lN65Wv/qfS8rYftVPxKfzRy8GGPHygsLmqM5z9PUzStBY2gUmKN
	 E4auDM7nG/wyvi82OmLNi4KtlBDK1Mtt93Ozyh2C85uXl6uPEZslEXfB1N89DNDqOg
	 Vv90zS2k7/tIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C01C54FC6;
	Sat, 24 May 2025 11:48:44 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 24 May 2025 13:48:36 +0200
Subject: [PATCH v4 1/5] dt-bindings: arm: qcom: Add Lenovo TB16 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250524-tb16-dt-v4-1-2c1e6018d3f0@oldschoolsolutions.biz>
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
In-Reply-To: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, linux-usb@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748087323; l=905;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=2g8SM9lGMgdWyCMNBhCp6KQKXsIP6Oe0w1ibkHBucW4=;
 b=Wz0//Ddp0ynk1y+wLXag0G7hb7qUuHWy2ahD05kcIWSS6bYfJVYAGHT6Uow2tcpFP4obIM4qe
 90MvLuStpOfASL+lUfdfrqgdYh0GzIiKzKwdMqzAETTWCCRdbA5GNVz
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Document the x1p-42-100/x1-26-100 variants of the Thinkbook 16 G7 QOY.

[1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7_QOY/ThinkBook_16_G7_QOY_Spec.pdf

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 56f78f0f3803fedcb6422efd6adec3bbc81c2e03..5654aaf825955f8000355600c0ae35b74676273e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1153,6 +1153,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa
+              - lenovo,thinkbook-16
               - qcom,x1p42100-crd
           - const: qcom,x1p42100
 

-- 
2.48.1



