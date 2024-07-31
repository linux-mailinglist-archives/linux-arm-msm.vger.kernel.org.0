Return-Path: <linux-arm-msm+bounces-27456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B1B9424E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 05:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10B351C20E90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 03:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27E6182BD;
	Wed, 31 Jul 2024 03:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C52lssOa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB9218052;
	Wed, 31 Jul 2024 03:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722396018; cv=none; b=fXoChIZLVjirejvk4Eyunz0mOW3lD0Z7PgZT7ywsdqCLoTanv0S1nTDNGElNJbMIMwf1FEdFe0q7fHMMxlCv4omdvFgDyZwWYyeAJbobCKJn5RB90UDxyYlr+JT3UdBxFoWUdOcj2OsgU9q5cNqR4C6MULyNbOvqr2PObkK6mXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722396018; c=relaxed/simple;
	bh=Ckz+7gO/R99Q5/0AYfleHsZDa6v4GaHEVO7xQa/zuo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bY1sHTPM/EdNPLZhPFrHJ5uXipvnDR+1d28Hb5Y16/XsHKH+d6Daq3mhDZHNmAZCi41XP6KEK2EL7qbNfdkKm6OjF3L6xCmO/np47+rYO+l44Djk0IUGcfQ3wgGOtP5IO1fMiS7vWvaCeYicpF1SXRHzYWXvvPq9CcofbH0ZT4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C52lssOa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A2DC4AF12;
	Wed, 31 Jul 2024 03:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722396018;
	bh=Ckz+7gO/R99Q5/0AYfleHsZDa6v4GaHEVO7xQa/zuo8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C52lssOa7BXOMbjanc/yquwBARC1kzcy4kTBnO0HXdy3sloicnadz16F86UKKyZIk
	 mOH4lcn/v/Nw2dHJyoG+c4YjG2jU4n5CCjUN8WF4bLMij1pwdr63UjAHuo222FT2ws
	 Fhh3B5fY/tksNfaqu8IFib6HTNMchA3Nc5ukV9DcYuInQrb0QnSm4XEwo0RvWdG7DK
	 pZh0k1fl+zjYayWzjkcpsfnYb8e/Ob2TZgfRj97U3tZB1s12U9gykb3M845ZPNlljy
	 tnxZfLP90H21okcoF4bCoEcjriYzpg1DlSUSHGd2KQxQOaCA2/IeL5leiVFrcKm/u4
	 /xRqnBB9srp1w==
From: Bjorn Andersson <andersson@kernel.org>
Date: Tue, 30 Jul 2024 20:24:38 -0700
Subject: [PATCH v2 1/7] dt-bindings: clock: qcom: Add missing USB MP resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240730-sc8180x-usb-mp-v2-1-a7dc4265b553@quicinc.com>
References: <20240730-sc8180x-usb-mp-v2-0-a7dc4265b553@quicinc.com>
In-Reply-To: <20240730-sc8180x-usb-mp-v2-0-a7dc4265b553@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=923;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=5GIKdsD9j2k4HggTSRAKKOW/XngCTtSO/ui2YkCAQUk=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmqa6HhTueIhblIfNLfS8VxWLnLeXMKHIGi4Jtb
 R95JBkXfRSJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZqmuhxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUt5A/8DToKvnRG7NF3nQXVXgTIRhgNWPtD3pVZqKfCoB/
 DEYrilVjAxadcstlaw7awqVlbE163z8jbb/d/OsP49AnXeQZCPdYoGWzqdjI1RoB7yTRfiEGgR/
 AbLmdS6Fz3bbKCNCulqX24jEs9Mb3vlksnGRVaH5FwvOaq2sEhjsFaAEskUXZEDexEaeOpRTPnb
 N/Pk1KDv7tJjMYY7v2inU6qT4La7vIzMTTzRuqQ6UX780fRBsQRqoI4iDDd2pEmWbQkKW7R3ydt
 +wx+g+9zoum7pEgBYcQvOOl5bTEGwlO+/3KIp8BXktZJeEGz7ICRJ+Xpwa8vQ9oTGEvS0enrJIR
 /+4wLj7e9vGBli3Ixv38VjqB7DaAkqrOtRe9Hd424KGh8oMwLSMA8f4m7TVOl+cWG2Oo0KY2FHt
 vOmXrRyYYDdR0fVG6AUey0UmGuHT3SAkquWoiY1HRyvSwtleDeaQ5y7qShq9/RwqFXcBswzaTIR
 AIOVBW7vwCWhKmIjGPrr8bEW9a/yOpE/ON2lvMRNG1Xgd1X2tXP4AK67SoA7So+us39O+vIY7ic
 EgCAN2wpF+auy/UhP5G8+slibJ5ZMFh6zGmJzuC3P0XgMj3GzJ4qaiG5rJKon+HWsZyM+8Guqlg
 WAjVF8PBsDpsokSq9t4Gif8lDqrcrdkKv5JqdJjW9R24=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The USB multiport controller needs a few missing resets, describe them
in the binding.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 include/dt-bindings/clock/qcom,gcc-sc8180x.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc8180x.h b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
index 90c6e021a035..487b12c19db5 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc8180x.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
@@ -294,6 +294,10 @@
 #define GCC_VIDEO_AXI0_CLK_BCR					42
 #define GCC_VIDEO_AXI1_CLK_BCR					43
 #define GCC_USB3_DP_PHY_SEC_BCR					44
+#define GCC_USB3_UNIPHY_MP0_BCR					45
+#define GCC_USB3_UNIPHY_MP1_BCR					46
+#define GCC_USB3UNIPHY_PHY_MP0_BCR				47
+#define GCC_USB3UNIPHY_PHY_MP1_BCR				48
 
 /* GCC GDSCRs */
 #define EMAC_GDSC						0

-- 
2.45.2


