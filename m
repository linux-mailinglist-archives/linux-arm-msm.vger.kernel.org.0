Return-Path: <linux-arm-msm+bounces-20467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AE88CF0EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6E02B225F5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 18:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DE7127B5D;
	Sat, 25 May 2024 18:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NeyWzhWC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B06F9F8;
	Sat, 25 May 2024 18:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716660047; cv=none; b=kD58f0R94PZT1wAxyGErbfjYsILN/ToTXS2GTwUxmK64yeKIQ7leh+qnN7dZO3mLVm4BIxDO8586x0aByuX/5JLszNP2PRKqMmtnuPb67iXERabPe2viJxRhF+rAJcMMdPGQ3HC5NhYosE4Ss8A1nKbeEmXkctLkZbahSvXVwuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716660047; c=relaxed/simple;
	bh=WTUferHCo9WFPFc4jvFPPGvl3/PJJmknm08eNpl9uNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GwyPUnr873r2Y4W3rtfCeOx79ZNXkk5PsZaG974ZrXWk1hrIM4J+lFfc/eaNpkN6bylLhvbxipJIoRaI9ilMhK52zNMKqxRiRu0UcRn0nxw+aArWyJR2G7X2xH9vSy3jFxif7Lq+XJwSTMDhUTNW5zNwVGbDQPWevDfZryq+gEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NeyWzhWC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E28C2BD11;
	Sat, 25 May 2024 18:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716660047;
	bh=WTUferHCo9WFPFc4jvFPPGvl3/PJJmknm08eNpl9uNQ=;
	h=From:Date:Subject:To:Cc:From;
	b=NeyWzhWCCMVLXOqnKzwicaR+P2Zp+xmL8pUvWvMmonT4RBa+ZLTO1rw97grJVp8sN
	 hyXEliv8d3cp89YFISpbEe1MhndxxAvWBrtJhlXsKTeA96kfs4F2rG9vYUo/jyMPqG
	 dY3SDVsRnjE2QGNwQPK7XKY4/TQxgob9OVc/c72QuLC+8KZcnvTSWWk5Z2mm9Uf6Bo
	 ipjVQehuvI4aNFTar4n8jL1CKl10DUWcRREepFdSFRC+iaR2mjhuD7eLw9UxtUsqmR
	 ATUwZx2mGPkSCPkdIlhuEmLm2RKeij3gMBve9u2kY/oN0T3B8crweutAojWiLChKl/
	 VrvlmyOvqnaVA==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sat, 25 May 2024 11:05:31 -0700
Subject: [PATCH] dt-bindings: interrupt-controller: qcom,pdc: Add sc8180x
 PDC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-sc8180x-pdc-binding-compatible-v1-1-17031c85ed69@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAGooUmYC/x3NwQqDMAyA4VeRnA00RVnZq4wdapK5wFZLKyKI7
 27x+F3+/4CqxbTCszug6GbVltRAfQf8jWlWNGkG7/zgRj9i5UDB7ZiFcbIklmbk5Z/jatNPkT2
 FSCQy8ANaJBf92H4PXu/zvAAjFcKUcAAAAA==
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=QkJM5gGh6CBEFtKrdSsF2mNdiYW9/CwgDySvZ3GxKVM=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmUihvU5XGXhce22YCS/OK3DJep1UK2XQHoZrym
 uGk83kzaNqJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZlIobxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcW8AxAAzhqsGgW0QSuyyhhpzuZlTGQ4muTgrdlQ6KFnu9h
 T15m9iRmFzjlwF1YHk5aX6coNdoC3tQNOViqqUkY53GOZbSX7TBpX0GProDMFF4EkPQp98NN6UW
 qKZmLK/m3BSPzBS7PgvDgPCzZ2qqU9i+24OmcysEtVA0qVnpM3Pdc9cFE4nZ6FInn1utuNhBgCT
 aJ+3ieESQf2l8A1EqQ84iyrzE33m75xasZVimL/DikZPaXdoMc/YHo7QSDozsIJt66x58xx2Tb2
 fN2n7LfdxNqB+ECs//Gu0361/94SqC1ZJ5TBjlaViaupRwkJ5Kca85C8z4bB8HrzGBNC6PBbIhk
 j7/zK9j74iqQZX4hsJfXl8n8qg011SIHVj2Wiw+raESSuKpbzUrtnjFhP1pbzozxjUaWcLaq1ww
 3Q56ki9cPpzYSaZqSweggNcXdvlAJq7gLIWq4GGS0wD3YvgT6QJKhn5qkOvQnt6K4cEJW6CSDKx
 qcPrAZ95ZkcyvrEktVIYAVCtvDdWvcxvTUdYBBL1i+adXPGMty5C+7CuE90dSDC1OHtYjXea0/z
 /A9lMcSnQKtcvhaD4/8WEGaDATaoawcNx/RIM0wCZuzxyasIG9ZeJZ1pj3LtEkcQPHtaiKEcE+E
 LsJjMnbdc+MhP6S58I9gxcf/EUI1TuQAZluHfgZdjnqc=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The SC8180X platform has a PDC block, add a compatible for this.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 4bdc8321904b..985fa10abb99 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,sa8775p-pdc
           - qcom,sc7180-pdc
           - qcom,sc7280-pdc
+          - qcom,sc8180x-pdc
           - qcom,sc8280xp-pdc
           - qcom,sdm670-pdc
           - qcom,sdm845-pdc

---
base-commit: 3689b0ef08b70e4e03b82ebd37730a03a672853a
change-id: 20240525-sc8180x-pdc-binding-compatible-c218a11dd4c7

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>


