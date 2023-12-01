Return-Path: <linux-arm-msm+bounces-2929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0C7801084
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 17:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED527281CC9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E584D11B;
	Fri,  1 Dec 2023 16:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LddZIwzl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793F54CE10;
	Fri,  1 Dec 2023 16:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF46C433CD;
	Fri,  1 Dec 2023 16:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701449206;
	bh=wLgR6MqTrL0B4AsUWLMzOT2VikZmtlYBcwK7nvTkcP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LddZIwzlhQz6gRegEWtKJcWDVOYAOe6RsF2z7+GpqD+WdWTI17vEZIvhqqhSupghO
	 WKaclVqZPynYBmatr+Z+kl3VBx+RtHASr0RsIYNar1XkLpDWJ7xm/yblPtWH4RBfoS
	 TNPuXaSWVTXlVgg8Sc1/vTLiapEL1o8/Hp0KZSCfPYZ1fOgLHDOUHnzstQ4SK2F9FY
	 HSulWjG/OkAXOcs7sSwbs66EbvuWEcsq0gu8olaKIqD2h+6XC+IaapQXd0AVVQDUt1
	 9keenpY4HXlVGphrBotJDPkdDQggMvQxBtOf/xt+w4sZHN9hR13q7ydt0hJDIe082i
	 50b3+G1yicRSA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r96fj-0003IS-06;
	Fri, 01 Dec 2023 17:47:23 +0100
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/4] dt-bindings: mfd: hisilicon,hi6421-spmi-pmic: fix up binding reference
Date: Fri,  1 Dec 2023 17:45:43 +0100
Message-ID: <20231201164546.12606-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231201164546.12606-1-johan+linaro@kernel.org>
References: <20231201164546.12606-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix up the SPMI PMIC binding document free text reference which
erroneously referred to itself rather than the parent SPMI controller
binding as intended.

Fixes: 9e5917288545 ("dt: document HiSilicon SPMI controller and mfd/regulator properties")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
index bdff5b653453..e36e5ce58136 100644
--- a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
@@ -17,7 +17,7 @@ description: |
   node.
 
   The SPMI controller part is provided by
-  Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
+  Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
 
 properties:
   $nodename:
-- 
2.41.0


