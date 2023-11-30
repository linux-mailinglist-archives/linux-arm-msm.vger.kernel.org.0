Return-Path: <linux-arm-msm+bounces-2740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FC27FF81D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 18:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 595E11C20F4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 17:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69ED556761;
	Thu, 30 Nov 2023 17:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTc8+qpx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EACC56749;
	Thu, 30 Nov 2023 17:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB183C433C7;
	Thu, 30 Nov 2023 17:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701365125;
	bh=vdx1NNQgu58UERU8Tsdj0HzBKD91c4adGn6nypp5e88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lTc8+qpxWuK0rdqA1+FARRSbdXot+DtmzyNeuQTpipNrqm/LK97DmvRs5r9Abfpht
	 NCjnrPHsxNQaZQXNe/j1wP/uqsZJlV+eO5DNmmoUMXTQhI9pmeARwhmrIhdnCyKFH0
	 O/NHlaDHr4Y+VY4AyMuXyq9vp8F6/Esay5ORqGIAbQS7dKaYuxS1H2NDyXK+21cdY4
	 LyTm9FF5vYDAcuioI+KQNsxAE/xDzQ515SirNAcAi43Tgdl80kIir95dBFCl6ZRUBU
	 ZJhpI8uPE0IiZa4yFwwaOOA3diEJ9fukpQZDgu8yxZYGGIWxBMSq76ldqoq470jj3/
	 UWUu3Tx7yfXrw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r8knX-0003Gx-1B;
	Thu, 30 Nov 2023 18:25:59 +0100
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
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 2/4] dt-bindings: mfd: hisilicon,hi6421-spmi-pmic: fix example regulator node
Date: Thu, 30 Nov 2023 18:25:45 +0100
Message-ID: <20231130172547.12555-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231130172547.12555-1-johan+linaro@kernel.org>
References: <20231130172547.12555-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The example regulator child nodes do not have unit addresses so drop the
incorrect '#address-cells' and '#size-cells' properties from the parent
node.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml    | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
index e36e5ce58136..60d5e6b3de33 100644
--- a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
@@ -77,9 +77,6 @@ examples:
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


