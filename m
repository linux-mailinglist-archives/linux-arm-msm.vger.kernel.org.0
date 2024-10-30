Return-Path: <linux-arm-msm+bounces-36368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB9F9B5C49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 08:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFEC31F22A3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 07:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0631DDC2E;
	Wed, 30 Oct 2024 07:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RmDMWhA2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575E71D63DC;
	Wed, 30 Oct 2024 07:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730272176; cv=none; b=dqQm1wGyzaipZroUxWNMyOdzM6Fzv1V7IcALYrOB3EfwpDsw2jUfttywXS19TPpn+iv0pNcP2KHlCQ74IrMases/mb6jHrV/vYCL0TPaB1kkVt034q4MgBvnKhDuwisLuGvVF5bp9UbhgpU9XyLINtWCckRM71KMXDzK2TckqM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730272176; c=relaxed/simple;
	bh=KT1efUsWdV/8xB40/Wnf+QtoYbsdYN98OKVjhQNdov0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tExUBsObo8J8R2g6x+aqDSlB9qv4y8WNvRx/wxYnQzdgHG7RHBsxqCvDoUjprIgPyzSNL6roFNkplM2XiZ5NWALPHow+O8SL5B/cFKrZbyi2iTNbCDBONYHCgA3Ue3ntzJFhvpyUI4b6qtc8A6/1vpXiMsXYC7cDKxpnBhixCPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RmDMWhA2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9CCEC4CEE5;
	Wed, 30 Oct 2024 07:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730272176;
	bh=KT1efUsWdV/8xB40/Wnf+QtoYbsdYN98OKVjhQNdov0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RmDMWhA2X5cRN4HivgHM2arGyvDdj02riL8mbe480NnQtRzM2bgjosgp4dtOVjP8q
	 h9xitnypUQ8DmJN/quc4Zrj7bm1sQmTKtzgTMMTsUV/3WokgvHqx0+K6cFxMsEMmjL
	 y0Be1aatj2rkGHOG5D3DK8Fv6HoifTaOAAAXI6szdI/NcvgN9fERnW9Gh9QFo5xzAX
	 c3rQbjTeP/wH2DO4DZaHpdRFO/q36jpDoDaP6Cnpcvu9yKpE8EtrpKEDLi1qdj2hyk
	 P891hphyt9bw482gQc87TUL+1h7M5Uk4Ou/m4ZmcWKquO4el8GxgtAMcImUjEDhzDg
	 5e7Ty5THRvGMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F1CD74951;
	Wed, 30 Oct 2024 07:09:35 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Wed, 30 Oct 2024 08:09:19 +0100
Subject: [PATCH v5 1/3] dt-bindings: arm: qcom: Add Microsoft Windows Dev
 Kit 2023
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-jg-blackrock-for-upstream-v5-1-830c938437ad@oldschoolsolutions.biz>
References: <20241030-jg-blackrock-for-upstream-v5-0-830c938437ad@oldschoolsolutions.biz>
In-Reply-To: <20241030-jg-blackrock-for-upstream-v5-0-830c938437ad@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730272174; l=1029;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=kVFiw5iTYnaFdKToApkPnG1lOIfe7ZmaJD+ATzZdQIc=;
 b=+EV7Y4Yqh4aXWX1jSniZSu46+ZRM4ViEW+xoZ+ZWCxmLmjJuXzFHoeYBBj2qzHLXQrxbhNpFx
 2C7CYC+v4HnByYyZX6ALI4CVWsVLmLwL651cZxGMQr1T/9zGwokNBEL
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Add compatible values for the Microsoft Windows Dev Kit (WDK2023)
with its codename "blackrock". The Dev kit is a small desktop box
based on the mainboard of the Surface pro 9 5G, intended for
developers to test/build arm64-based Windows software.
Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0f18cb35c774a..32381638b6f9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -823,6 +823,7 @@ properties:
           - enum:
               - lenovo,thinkpad-x13s
               - microsoft,arcata
+              - microsoft,blackrock
               - qcom,sc8280xp-crd
               - qcom,sc8280xp-qrd
           - const: qcom,sc8280xp

-- 
2.43.0



