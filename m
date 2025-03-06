Return-Path: <linux-arm-msm+bounces-50547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F327DA55436
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 19:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 576BE7AB311
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 18:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FC525D8FE;
	Thu,  6 Mar 2025 18:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTRZtH/s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F021F25A33B;
	Thu,  6 Mar 2025 18:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741284645; cv=none; b=A1jCIw5WKeN1H5gEdtvu9GujXyZESUqNB/q6RrC2xETYHd+IcNlLFdlHMEdkzIiT3a6Td4LfZmdp61BupCNFcvPkh60Kh3d/vXg7kjx3w5V7viCWNmVbPVySPCLMgQcDINJkS2HhfIK6izNc/YYJZvkQ2syXuxAba+G2EYuQJJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741284645; c=relaxed/simple;
	bh=MmeueEhfG35aYPhedmw0XV3vfAg+i6SnMzy/C13nxeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VO84hLquyTfpeBrgNp71kU+Varb6PxTHK+dw1RCK4jOqb+x0Maxj7+IdvyTkVXUd/dYlFm1FOFlPcQBlLxAt+oq5mmxgILRkEZ5LUBZ96zlMOEtUOfuDK2/hxjaYp9cSvj6pkttZtIfso1aeD7Cei+YkyeO9epKuBB6DQB9sIEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTRZtH/s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FF8C4CEE0;
	Thu,  6 Mar 2025 18:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741284642;
	bh=MmeueEhfG35aYPhedmw0XV3vfAg+i6SnMzy/C13nxeY=;
	h=From:Date:Subject:To:Cc:From;
	b=WTRZtH/sunMSvaH3dBZeXX9MR75vZei25pgxCfl80+2SJEy/vYzWOtDqbFcrjoL5O
	 6f+EwhJJOOzFtVl4vc0wDKH1kPJNRT1ZSbR6wlwfFS+7fHn7Q2aLOtX//p8vtTiWHE
	 M2WSzYPc+opjGpNIvdsJ7jAAWnLSAmaOqVgTYXyXw3u7ig6dWzKcApWASBnojsPefe
	 l7oXvu5vU0gBts28l1Z18ZjVydxsSH7nGMWcf79EfwwnpcpFhsgcaMG2olbvX0daZI
	 nkM9KHYrbzcDYpHvssJ4/4E8ggJzHyErxgVVw7wYAXzZCn38cutTDFQRIN5H6bJGbK
	 89m3gywmQNEYQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 06 Mar 2025 19:10:28 +0100
Subject: [PATCH] dt-bindings: usb: qcom,dwc3: Synchronize minItems for
 interrupts and -names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-dt_bindings_fixes_usb-v1-1-e1e6a5bde871@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABPlyWcC/x3M0QqDMAxA0V+RPC+QKeq2Xxmj2CZzeWlL40QQ/
 93i4+HC3cGkqBi8mh2KrGqaYsX91kD4TXEWVK6GltqeOhpwSVkD8uK8RtY4m/vqJub+5jEQsRc
 eH2N4Qj3kIlesg/fnOE6Cc47TbQAAAA==
X-Change-ID: 20250306-topic-dt_bindings_fixes_usb-c00dbed787c9
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741284638; l=1440;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=XxDVcrBfp4ugTwbs0E1e9mI0LVJPlhX53QIFidEHR5w=;
 b=W2am1+pvqkfC++LVWF5xtCF7DDe1tu8/9Xex66QZQKYazed58yFJp646GViP/l7ZRqpj15Ue8
 buxlH3/cNeSDHywlMFRcHb887L1dXv/uIwPitsb9T8VBRgSuLwtkZvq
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

It makes sense that ARRAY_SIZE(prop) should == ARRAY_SIZE(prop-names),
so allow that to happen with interrupts.

Fixes bogus warnings such as:
usb@c2f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short

Fixes: 7db25e95589e ("dt-bindings: usb: qcom,dwc3: Fix SDM660 clock description")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index a2b3cf625e5b3962f3acfe93de02f3cae2b6123d..64137c1619a635a5a4f96fc49bd75c5fb757febb 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -404,6 +404,7 @@ allOf:
           minItems: 2
           maxItems: 3
         interrupt-names:
+          minItems: 2
           items:
             - const: pwr_event
             - const: qusb2_phy
@@ -425,6 +426,7 @@ allOf:
           minItems: 3
           maxItems: 4
         interrupt-names:
+          minItems: 3
           items:
             - const: pwr_event
             - const: qusb2_phy

---
base-commit: 565351ae7e0cee80e9b5ed84452a5b13644ffc4d
change-id: 20250306-topic-dt_bindings_fixes_usb-c00dbed787c9

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


