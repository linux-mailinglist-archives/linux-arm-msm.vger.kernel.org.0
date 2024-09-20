Return-Path: <linux-arm-msm+bounces-32112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D69B297D956
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 19:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BF4DB20F52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 17:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF7617E44A;
	Fri, 20 Sep 2024 17:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQb+wtqR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E52D2C1A2;
	Fri, 20 Sep 2024 17:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726854447; cv=none; b=Cs3UKgXpbZLnQKetEvmpbRz2GnUVWiMIbOozsuWBQ2JdQTyD1FrDopZn3jtLpPcyNY1WfOhAobNjgrMiSeaETtdo0UZAkugSUo3B16FtuAPP/bRJKUA/UUbtAux9vY0aHjimScu3qg0fOBdlKv1sAPThgYJxlkn6hGtVd3mcSTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726854447; c=relaxed/simple;
	bh=V5IZaW/EHvmQIFTZpHgJ9U1K9XqWMypoJHd7UKAxFgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F/bjEGjnnosvVR2s32rdPAqzyxkQmeR6lGY3WSiToaL/Bik9ECs2li9O8kQKTPwX3d6GLAiq0RHqh/dzYs4eq/T0ZnjpBvtAHxqs9Ca/7AnwNRhVPhfni2PN/PiiQVV9QykmNznDp6TSOoKEW0TLZYl/8XSLNYhLJ9nMV/m8IeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQb+wtqR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F144AC4CEC5;
	Fri, 20 Sep 2024 17:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726854447;
	bh=V5IZaW/EHvmQIFTZpHgJ9U1K9XqWMypoJHd7UKAxFgQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dQb+wtqRAv62MCy/KtJwinLiOS32ffOBpgqxqRQcXBWwS7nOQ+tn3kNBEEYlsjdTn
	 MWh3TitLVgZvBAhvZiNxs9yD4zBGVSUf192SE170Hnx6RP6GL8AdNkbyN3uBJXTqXu
	 3aX+vJ51BIkCspq0GBYnNx7gCMMfS4qzUnekHh/rAmPjy8z35XLfUIng7+Ynkl8TY8
	 +iakEZe1NFT7AivlBXQxl8x+4U08HXhEY6jaULNNzwUml7teanRJTkRj7/j0sYXckl
	 kZjXUCo4GroXgZrYVOM0llAR30m5GtTYw7SMRwcHDNO4tUnIx0ZsLiNo+MhfVqhBKP
	 BgkTkkW29Vjcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDBCCF9C62;
	Fri, 20 Sep 2024 17:47:26 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Fri, 20 Sep 2024 19:47:25 +0200
Subject: [PATCH v2 2/2] dt-bindings: arm: qcom: Add Microsoft Windows Dev
 Kit 2023
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240920-jg-blackrock-for-upstream-v2-2-9bf2f1b2191c@oldschoolsolutions.biz>
References: <20240920-jg-blackrock-for-upstream-v2-0-9bf2f1b2191c@oldschoolsolutions.biz>
In-Reply-To: <20240920-jg-blackrock-for-upstream-v2-0-9bf2f1b2191c@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Merck Hung <merckhung@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726854445; l=743;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=6wRSNxIph3/qSJRgFI6zNdBzJg2ZkmeHrrkm08D757I=;
 b=Ppcbw1ZBVtgy6EykM9PdkoSciMcXAJkUwDpu42Q7pxQAD/BM68+EbOG36QEy86ztlrcN7SzZH
 yn67FO+fI18Bm/QGdOVL2TaisMH5m3qUagZI2tPd7X3g7n3nVAtFJhd
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Add compatible values for WDK2023 with its codename "blackrock"

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f08e13b61172..cbff0313155e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -812,6 +812,7 @@ properties:
               - lenovo,thinkpad-x13s
               - qcom,sc8280xp-crd
               - qcom,sc8280xp-qrd
+              - microsoft,blackrock
           - const: qcom,sc8280xp
 
       - items:

-- 
2.43.0



