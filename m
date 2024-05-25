Return-Path: <linux-arm-msm+bounces-20457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 067928CF0B4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 19:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70A9C1F21940
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 17:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3A3127E10;
	Sat, 25 May 2024 17:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2TUmFOK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8776127B7D;
	Sat, 25 May 2024 17:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659950; cv=none; b=srQyKeGMkeg8oq/LrI2Thl/H24Dkrz1mt75CKyUxpQ38pxZUcSW04oKWNHfuaP5MqTqvmG7DppLlem+/owMUh/SwmjONoxhFaWlljpkRjbNugr1Ti65qurhc/FrQRmh9iPWo8ToY9ZzIWyfapFCwu9Sov+srn9OgKy/rQRT1B98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659950; c=relaxed/simple;
	bh=lUqea2yFwGNIq6sj+nx1rImz3A55zFk36Dg4ihV1z94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EqItzjN2SRnuJucswLmxXubywbK24kC4MW34123JrG24H5owOlDrz9CGXNtmPqhA6iWl2aCNNf3NdFq+HtJcu/OLFYOjC8yHF7/eOShlykdx4q6cpujKuM3zIzXfhzK4FxMmd3sfzFaIIaaskRrIzSSbEbnY7hlCnyrqt51bHCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2TUmFOK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151C6C32782;
	Sat, 25 May 2024 17:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716659950;
	bh=lUqea2yFwGNIq6sj+nx1rImz3A55zFk36Dg4ihV1z94=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N2TUmFOK4bSweFhz036HpH7JQpKS3lso/bK61WJD8CWdXpNzkWj7KlG5bZApapFJP
	 QHjKnruPkv4F6HrbWr8a+wZwUhJa1KWh87+lFEW8EA47VqTeL3Cd8RP4gGYQl78wdi
	 El2TsnOKWtJQFWZUsAjUjNbN4dlgePkRf2yCOnmQV9w8CY0Vt3q4U1swKRRvcQwHbc
	 UlXrcGyic/8aQF+4AJhK7hucVXVgnVOqNojQqeBRv8Cwy/1NSGLw1glaE6cs0Lceu+
	 DsazAhwuCf2bRMB0Q1E7nwRIySSDgleIdEqCyOYbkm98LK9bwZ7oVN+oqY9+J4QpAU
	 epaAkyDEqlKvQ==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sat, 25 May 2024 11:03:54 -0700
Subject: [PATCH 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb3-uni: Add
 sc8180x USB3 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-sc8180x-usb-mp-v1-1-60a904392438@quicinc.com>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
In-Reply-To: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1554;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=dmNg93AHLxpMH+qIHHwCvQT1peGFxDY1+4JWXfr7d2M=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmUigMOOCEcxAvua4YFP35vriynDnCVsne1tjc4
 B0j99zbKsmJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZlIoDBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcX91xAAi+6hX9f2O6B/iUSyJFhI93cj6CB3cxv7Mm9MJRm
 99M00BuGzIyUBP5XFyOuSq7shg1qWVlwYd/KlvQLmIL7CgzXUSyjZ9xENkGmEU9QU0h0EKSq/eZ
 A0lixE9eir/+KNyaSLBEemXDdwWvjUPHQ2qsZLFQn+9M7l20LZfqjJmdWY2gBb7YWnmCCup2lTv
 19VrE0fcU9koPfVBBXjI0Dy349i6tMP5OwEnV2XFP2yh16K+iNBsFmed2mAcMlzJPK4B+ASkdY7
 a6YMI9A+DQBbPpykF8DR68/lK5vW5RS3YfenSmtM4AVBNoUgH/wMdCQ6mKv9Smyeqv1EnNjEL9k
 ZKTqbub+72naNDcFt67CHqyMLI2dmbIs6ekKgOaYoyfrOVP3jQlHn/yoSIYnX30aivvku1X1ZqT
 zJUer721BR+PUq/VfLy6w6+VVvarhJlYi0WA6z3Q6BS0HJKZTPPsdCRXk4pRO8vi866IPnPLFeD
 0suLSZgcnZRcvHetSxZXfK+oppTw35TdadwYdjrIXmLSSSWxuyDAm3g6RCNQUvrSpqR+a5x24K1
 XN3rnIYReKSrLBlYJ86/ThOvQ3wM7rEthVvjs70TZ1SxdSGs8J/hGGXsaNKdH+asD3ui0x4KH2X
 EEuOM71c1/tfpRObMzp2HphLITfcWljXT6QcrcTn4368=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The SC8180X has two USB3 UNIPHY QMP blocks, add a compatible for these.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 325585bc881b..5755245ecfd6 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -22,6 +22,7 @@ properties:
       - qcom,msm8996-qmp-usb3-phy
       - com,qdu1000-qmp-usb3-uni-phy
       - qcom,sa8775p-qmp-usb3-uni-phy
+      - qcom,sc8180x-qmp-usb3-uni-phy
       - qcom,sc8280xp-qmp-usb3-uni-phy
       - qcom,sdm845-qmp-usb3-uni-phy
       - qcom,sdx55-qmp-usb3-uni-phy
@@ -112,6 +113,7 @@ allOf:
             enum:
               - qcom,qdu1000-qmp-usb3-uni-phy
               - qcom,sa8775p-qmp-usb3-uni-phy
+              - qcom,sc8180x-qmp-usb3-uni-phy
               - qcom,sc8280xp-qmp-usb3-uni-phy
               - qcom,sm8150-qmp-usb3-uni-phy
               - qcom,sm8250-qmp-usb3-uni-phy
@@ -152,6 +154,7 @@ allOf:
           contains:
             enum:
               - qcom,sa8775p-qmp-usb3-uni-phy
+              - qcom,sc8180x-qmp-usb3-uni-phy
               - qcom,sc8280xp-qmp-usb3-uni-phy
               - qcom,x1e80100-qmp-usb3-uni-phy
     then:

-- 
2.43.0


