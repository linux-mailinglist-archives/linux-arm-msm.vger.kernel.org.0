Return-Path: <linux-arm-msm+bounces-59530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9DEAC4D46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5AEE3AB991
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 11:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B2125D91B;
	Tue, 27 May 2025 11:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOZDunQV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A051D90DF;
	Tue, 27 May 2025 11:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345221; cv=none; b=a4+rfpTsUR5qUQ8+mvJms+Jg+udtqj7/tFgFwAs5uCLu7tZnSLdGFl01V2TUvT3uYR+PhMUm/+Kkpjvc/sOubWOyOasffZHFY+lPflEfrLpB2XZjR+a49BqQJFBDOo7x350So8hEgF6A11KNJRfohVc40zhJHOsKTDbCkRiKgZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345221; c=relaxed/simple;
	bh=RzE5TMPqSWBAoLoYOZQAHdRixdggTxp/LurkLkzNxCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l3FVBfyWQIqB4ZVooA1vvQ89/u1cw4834B/Mr60cReaP/U1f6ijMmJOu0SmzUwUzsPTJGZz/ZDB1hV5h/Tzn+RvHcyGuS0+9Zu+gO2vDodWJ5PjnRfGq+Jujr/Yt5qj4QjRPVeLXTjItqfeo0gK+uFrBK2DbVWmEicBi2LHYQCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOZDunQV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662F4C4CEE9;
	Tue, 27 May 2025 11:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748345221;
	bh=RzE5TMPqSWBAoLoYOZQAHdRixdggTxp/LurkLkzNxCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VOZDunQVVQhVw0F7pFBX2oousRbHecXdX1abUMjg2Ukxz+er4Yvb1e3Yu+mYkqbGQ
	 hNg54OEI0X/+VwxhliZznMDngYef5eRo3k29GQr1C86nebIYBFNuK2Mrpoy0b/dxTK
	 z9NTC7w5eoVexXBPCQh7oNkWOlv2KbByW1Fanw/Ashr3MPT0W3XX66V3WRA5uhCYB3
	 uQWVlAnTQClXGcyuoZMz1Ju11Q6Lfx6wLp7qhrynkU/kxBoLKzTFJ0iZmW1YQrByjQ
	 BqVjvwA0iITY4uMi+0cLy4GeRg3GM7CJrvpLf3UDcNXmnCekQwrPvLdwQYqnYTPPMP
	 J3MHox9oGeeBg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 27 May 2025 13:26:41 +0200
Subject: [PATCH net-next v2 1/3] dt-bindings: sram: qcom,imem: Allow
 modem-tables
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-topic-ipa_imem-v2-1-6d1aad91b841@oss.qualcomm.com>
References: <20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com>
In-Reply-To: <20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748345210; l=1277;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=rwN85ir7N7zo2PiOr5IwGAvJoCL9mLf8PNoMJ9xFncI=;
 b=SEOAGbOawmTHcSYfaWviwgMAQNMgZ3SXOb8NLk5DDitvvJ//bDxCFvGnI5SKSt+H+YN7S7seq
 TG0uR5+ymdsDunODAw0ZgzeHw4TzrVBtfK9fwEKIpAT84ksog7AYYkX
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The IP Accelerator hardware/firmware owns a sizeable region within the
IMEM, ominously named 'modem-tables', presumably having to do with some
internal IPA-modem specifics.

It's not actually accessed by the OS, although we have to IOMMU-map it
with the IPA device, so that presumably the firmware can act upon it.

Allow it as a subnode of IMEM.

Reviewed-by: Alex Elder <elder@riscstar.com>
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


