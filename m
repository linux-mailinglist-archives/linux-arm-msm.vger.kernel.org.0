Return-Path: <linux-arm-msm+bounces-3529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5EE806DAE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 12:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BC1D1F21529
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 11:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D3D31747;
	Wed,  6 Dec 2023 11:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kkWOUTBE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5662E3172A;
	Wed,  6 Dec 2023 11:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC36C433C7;
	Wed,  6 Dec 2023 11:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701861461;
	bh=SGDDtanpuy2F23oyCza+p5DlVsIoWTxJOOMzvs5zlaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kkWOUTBEiXapYrbVBAwbZ4TRaU50H/SRZeVWkIsHXxrJrrqpudu9m/shx+NPO9/7w
	 Ocvr/C6SnwgIkgEWxC/f+2kfViekOgLNi+zlP/N9ugGlxEJbVtEJdPaDE/efW9o35T
	 1kxdCrtiZzK2HuryahEBS0/chuQCzSzTl9WkV0CLOaDPtBwIZy0HK6238DjL9MaGVV
	 L5rGuAVGERlCQvbTHzXnWqDVFOYhIjFz/OV8PeLS5667rzR9onPgo/iXGGlDXIeHqy
	 oRSa0UnpiuwPjwdgpgGRwXDcfRJwgYIECfej++iAOgqHiCmhARuX0vNE12fAiZ6QDX
	 g9PpsR97PDp5A==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rApvA-0001wG-1i;
	Wed, 06 Dec 2023 12:18:28 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/4] dt-bindings: mfd: hisilicon,hi6421-spmi-pmic: fix regulator binding
Date: Wed,  6 Dec 2023 12:17:52 +0100
Message-ID: <20231206111754.7410-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231206111754.7410-1-johan+linaro@kernel.org>
References: <20231206111754.7410-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regulator child nodes do not have unit addresses so drop the
incorrect '#address-cells' and '#size-cells' properties from the parent
'regulators' node.

Fixes: 352335a6aced ("staging: hikey9xx: hisilicon, hi6421-spmi-pmic.yaml: simplify props")
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml       | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
index e36e5ce58136..45cd6a613a91 100644
--- a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
@@ -42,13 +42,6 @@ properties:
 
     additionalProperties: false
 
-    properties:
-      '#address-cells':
-        const: 1
-
-      '#size-cells':
-        const: 0
-
     patternProperties:
       '^ldo[0-9]+$':
         type: object
@@ -77,9 +70,6 @@ examples:
       interrupts = <0 0>;
 
       regulators {
-        #address-cells = <1>;
-        #size-cells = <0>;
-
         ldo3: ldo3 {
           regulator-name = "ldo3";
           regulator-min-microvolt = <1500000>;
-- 
2.41.0


