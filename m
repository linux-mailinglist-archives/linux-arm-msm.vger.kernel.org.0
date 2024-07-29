Return-Path: <linux-arm-msm+bounces-27279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6459D93FB63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 18:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EC342829CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 16:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF35145B38;
	Mon, 29 Jul 2024 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="2Gjq3jGe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9856D2AD22;
	Mon, 29 Jul 2024 16:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722271164; cv=none; b=dhZVbkYoLn/DLs0AWgy/zZqP/XbxVq+q/9qvdQxIr9b6S6EA+LLyLXAMKDszbWF1AOyV1t3lUnP0ohfUyo8Y6f09F1z00nBEejTx5DZEGImbuvmADc8HYPx4dV2iy2+xE6ld0GlIe65Y/PUzzgkmQL8XN82+f5R8WvBCnZ5wCmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722271164; c=relaxed/simple;
	bh=2wODV6djH9wjbf4V2uEFBc037KUNLQ0wHfZaQsWKfEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cEHFq2TpMGgelwhk7IOPIXkbCQLJJ7lPNzTA1mRlM6nXpUAkGDDg1ox/q9HG1tKMdKBrFigE7N+yElez4E4j87Aa6Qd4MYn0oJ2MmozMitY6KTwufivbQq85MvVbF58D039eJ3OqYlAZEqaljBKb7AMggQ1Nq0rTIAaHPy433jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=2Gjq3jGe; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 5154C403F4;
	Mon, 29 Jul 2024 21:39:12 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1722271152; bh=2wODV6djH9wjbf4V2uEFBc037KUNLQ0wHfZaQsWKfEg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=2Gjq3jGeFBs/pIPN3P/SON1lFv9CR0QeixqTNl6Vzcs7OTsqGdN2+BCWUp8WYkL/N
	 gUIynq53TwZVnF5+fqgDugqlkkRjZBJFPBQO/clsxQ9+AcPt8+gnWvpqDjZ3CEukYA
	 PLSZqFSx0VZjADsEsCwBHhLzUjG2zR0PoO7UDfN8ah/Hcoe8SZyureeUm/hjdOeQii
	 0y5W8193Gs/yYbULjPYJJXxSdwO5Ab17Go5lv7vPTPhFbq2bO92Y0jOjj4rqANRnkV
	 hWqcHgnvNEMlVRct468nuBdAhV8MyvtbT8RPhaNvoSn4WsoVlVnxpxSyxmufOx1Miw
	 UHuavUS7kH2VQ==
From: Nikita Travkin <nikita@trvn.ru>
Date: Mon, 29 Jul 2024 21:38:47 +0500
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Add msm8916/39 based Lenovo
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-msm89xx-wingtech-init-v3-1-32c35476f098@trvn.ru>
References: <20240729-msm89xx-wingtech-init-v3-0-32c35476f098@trvn.ru>
In-Reply-To: <20240729-msm89xx-wingtech-init-v3-0-32c35476f098@trvn.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Nikita Travkin <nikita@trvn.ru>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=2wODV6djH9wjbf4V2uEFBc037KUNLQ0wHfZaQsWKfEg=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBmp8Wu19lYPWLBAuSXGogtKEhLq8++SLfrRERlm
 Jhiq7NwjOqJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZqfFrgAKCRBDHOzuKBm/
 daHmD/0SiI9dWMSsnClOL0jOI6JetuCPve3qZSJV/DmV15jqkAEnPPvmiBhN2p4RMT5XOJub6IU
 K6Vli66I/Y1J9cRB211PjTGuf395/1eSEqHJcg41xmRy+2nyULExHEcfoMi7Isu5Q5IztX0anwE
 ctY60luRO48R4vB63shW02jd4VmPR6HeGGH8seiVNG1t2XqowcC2MHVum92cCaqHs76x/7k7P43
 XXIxEdrqJ0nMYhG3exKG1uf8cPzuobNtfya33ozOkhXS2fMZObRF6JIuTxG/GW8nX6B1BaczidR
 3io/JyI2qoU1wmKXIpURPAHJ502tmGZ5LqZHfgkhTd+jBgZPKqwJeQQ8RS1gPuP2iOLHhssnfHD
 WrFXBeOZYVmjS3b0QHWn934cp8KNWz/UrcalKeDQPsGA/WSFlnikGFOZPxvWHwQ3FsCeg4GgOQW
 NktCVaG8oP5el/sKbCfDP5fFeugWF+gEXuaYP9MvmflvfCcEbEB9uqvygalknvOI6a7UMp5k/vQ
 BI/oGkXAT0IQ77c6Y407q1u9CV+rpDm81Fqxja2o1ADG06HmqzaChlpFxPoTChSK1Yv8kxxdodj
 lehvIujK/O6BpnDBWfZp+9voes4y4pQkCEfxsCgMfKF+u7B5LkzLKOSWSbMFEF8lpbKKy9LRcqV
 XALuKQtcPfKTeAw==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

Add compaitble values for some variants of Lenovo A6000/A6010/A6020
devices. These devices are based on designs from Wingtech so use it's
vendor prefix and part numbers for compatibles.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f08e13b61172..a3f28f08f5d6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -155,6 +155,11 @@ properties:
           - const: qcom,msm8926
           - const: qcom,msm8226
 
+      - items:
+          - enum:
+              - wingtech,wt82918hd
+          - const: qcom,msm8929
+
       - items:
           - enum:
               - huawei,kiwi
@@ -162,6 +167,8 @@ properties:
               - samsung,a7
               - sony,kanuti-tulip
               - square,apq8039-t2
+              - wingtech,wt82918
+              - wingtech,wt82918hdhw39
           - const: qcom,msm8939
 
       - items:
@@ -234,6 +241,8 @@ properties:
               - samsung,serranove
               - thwc,uf896
               - thwc,ufi001c
+              - wingtech,wt86518
+              - wingtech,wt86528
               - wingtech,wt88047
               - yiming,uz801-v3
           - const: qcom,msm8916

-- 
2.45.2


