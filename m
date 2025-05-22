Return-Path: <linux-arm-msm+bounces-59143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD9EAC175B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 01:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B69A17AEF12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 23:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99A72C2ACF;
	Thu, 22 May 2025 23:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nsPIJMpx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1EF2C17A5;
	Thu, 22 May 2025 23:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955389; cv=none; b=mI8Y9yoeiCXtjoBOdea4ohZgXvtCDQCYmx2lOGojv+i3TwWUmOX03gQLYiVxo98k3+jLuktN+Wn1i0MZaEIZ1gRnJzgFVMx72BMNAHhFEbjbPKZlrbPqFUWTPe9eg9mYcDR7Rx8HNgrsr64bPnq7ZeARKmwju+XM8ftsCJvWslw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955389; c=relaxed/simple;
	bh=kTJ/5enyVVZomi3+e4FO8IF4AnuqDJ0SR4Nwc9fceMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JdxsSGmD2NeQjDN5/If05RukVjnxqJeYGXLng/cuuOetiTQs5bl1HlFG/6hD5OIxH7YsxX/1v3DC8sIAJFYa+4jSUrfbWqXmyjwvYmwuLZ0L0DOs1BBkLky20St+etUQDY/+bWEjOtPNVy2NT2vZGv5OOrJVa+hwisbknd3dCYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nsPIJMpx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4DEC4CEE4;
	Thu, 22 May 2025 23:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747955389;
	bh=kTJ/5enyVVZomi3+e4FO8IF4AnuqDJ0SR4Nwc9fceMQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nsPIJMpxw1uCKasVj/qaOvDHZuogQ1cseD8n5cqC0QiCLZbpv/qNhqfN5i4431HiJ
	 bsmzHEUo8JSRpZ+D+G8JQaF9YgwGWNo5EaW0chcCFHsvodZ05deXyxWjHRCpBbvx6i
	 X4JyL3m7giOqPXKcENiwTW6noGcRe10oKas1qZpToZ5+dU9CaS13gDw081YzgjDfmf
	 f3RXZSJxbuT3zxVl5AmhHaefdprfzgiWauZcOVb9Hs77GfQxcY0EtxtdrQREie55Fq
	 iCRQ6mZMQBahfiDTuj9dZJ0VjxFq4sQSIxsMJDUyATAE5BsmdErjG2hx16QtJIVfeK
	 fwEmeCD0F+oHg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 23 May 2025 01:08:32 +0200
Subject: [PATCH 1/3] dt-bindings: sram: qcom,imem: Allow modem-tables
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-topic-ipa_imem-v1-1-b5d536291c7f@oss.qualcomm.com>
References: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
In-Reply-To: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747955379; l=1231;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=JB9nIw5MC2KWC1FO51nznYYBZno9BnBLBQ6/3RI54l4=;
 b=CSxvK53k+gMK1/RMBfqzeXps13c01LkjZmL+czd/bFUyqEl0XhVOEPrEaubnhcFiYUro5v1Cz
 aI6PPRQ6k8SBYR0r5eFfXKynnYnDUbLyx80qFfmovBAMDkNbFDW7Wxp
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The IP Accelerator hardware/firmware owns a sizeable region within the
IMEM, ominously named 'modem-tables', presumably having to do with some
internal IPA-modem specifics.

It's not actually accessed by the OS, although we have to IOMMU-map it
with the IPA device, so that presumably the firmware can act upon it.

Allow it as a subnode of IMEM.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 2711f90d9664b70fcd1e2f7e2dfd3386ed5c1952..7c882819222dc04190db357ac6f9a3a35137cc9e 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -51,6 +51,9 @@ properties:
     $ref: /schemas/power/reset/syscon-reboot-mode.yaml#
 
 patternProperties:
+  "^modem-tables@[0-9a-f]+$":
+    description: Region reserved for the IP Accelerator
+
   "^pil-reloc@[0-9a-f]+$":
     $ref: /schemas/remoteproc/qcom,pil-info.yaml#
     description: Peripheral image loader relocation region

-- 
2.49.0


