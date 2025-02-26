Return-Path: <linux-arm-msm+bounces-49532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 258ECA46311
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 15:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26315189DE6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 14:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2138321D3FE;
	Wed, 26 Feb 2025 14:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="hxxx/PkJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5DB1A01BF;
	Wed, 26 Feb 2025 14:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740580672; cv=none; b=F2iiIyamv0xgV8E5ZRGqBY4waC9yQhUAAk+cwHeaK/BFe8qsnHWytxU9UtdjPJPp7XMMlaGXiqidjYT5TF/MUV7NFPE6b3+so6qENhorxbyFDqWuFR6G2vPC3DwHUmamt6QNVaWeRHHgKdQVaVazHdevqDJf7+o/BWJAee/6RrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740580672; c=relaxed/simple;
	bh=J3OeqIzPFKPB+WA/gVtAcJYjDsj3Dkc+2pfbrvfQvTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SsAzatdtZMJzI94WJteMDbBkXHFh/UEJK+ASz5/UyuBriRxJ0lQYkQr4y/l2wuSvhvQb357bGYWasrWztC5NGUTWOqyE3nwBsKPIUnNXZnBGoxEPMuevwK/Jz5ONlRn7iMZwg3erkVYYkxlsHz8AVzonz6pWVtUYTg5IucbnGuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=hxxx/PkJ; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1740580231; bh=J3OeqIzPFKPB+WA/gVtAcJYjDsj3Dkc+2pfbrvfQvTo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hxxx/PkJHwL8ZiOa00+T5buESuDGINQnL+oJ8Sr8CxgI10gsQ4c+Vc/HT6wX8950H
	 cA7YwIFqH4WGXSj8ve86YDchoEi/RLUnJPtbgUDS1JM5jsRFKctX37ljXi9Y56MG8e
	 UZaD9ptn0ObvboWzwc8B428ua7R2Pg/+6YUdJ5Ou7fcVDvYdRbTGaOJLe9h2qagGdN
	 57r+T/lxJVqklr9k5olZdsGOMO7dK4ScovcPtHpePZoa2i15sOdff9zZ0/Mhx4XnLa
	 kvfN2YRSkN3O3pQNpGPsBA2LS341Frg82E3fVATWCkLtiKHeNLvirVmmWbL1ZU0FLa
	 eHA2gicpqaBBg==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 732CD1B2BE;
	Wed, 26 Feb 2025 19:30:30 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Date: Wed, 26 Feb 2025 19:29:56 +0500
Subject: [PATCH 2/2] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine:
 Fix the overlay root
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-qcom-nonroot-overlays-v1-2-26c6e7605833@trvn.ru>
References: <20250226-qcom-nonroot-overlays-v1-0-26c6e7605833@trvn.ru>
In-Reply-To: <20250226-qcom-nonroot-overlays-v1-0-26c6e7605833@trvn.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=J3OeqIzPFKPB+WA/gVtAcJYjDsj3Dkc+2pfbrvfQvTo=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBnvyWDJ2WBTpOYZfIs+9+zBKtvdFf9ztudPMBP8
 zQIfFvlC0OJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZ78lgwAKCRBDHOzuKBm/
 daKsD/9IoHExUKzuCp430E/igBf1wm9tCaa5dwlpz/8QjCxhGK7Ju5bT/DyoSijd5b5DXYNGYmq
 JofB+E0BqDvkbTRKel67UCXQpgFR9H2VGiPcZTbWcWNiSyLClZ3w367Yza1C1WPWMoprzDkvw5g
 YeYXXcIT7shij+TMOZoGSa2c02dH9ryNUFlXI2pyKeabc//v2jzn2D5dP1PFWuaS09R80jCKIjz
 KTh9k+jhp+8SnLRZLnpBEXMVEeiG93UXH5v7cAPbeNuTmP23F9rGIMsJdO9SEb7hPOP8ywlx1mS
 B2huuaoOKHvWtYj2qt5wVZqnNgkaIuA0pX72IocU76FaQNPf/DHBp70AOk04Usj6zY0ShdTfDP8
 lPPmoLAIF2UbHAfVYwcoF4ovb+HO+3xU39jK2cq7QOO36/uolYfOFE4yWSHXraZMpq13bBcJ+lV
 6tiWR6Wz5qSk+t/R8IpJiybuDCEQrljOsxGmkxc5y9KfInWqpGcF29ko2eqgcrg+cd7DrNsChT0
 dCCHWFdKbnHcyKV5rxdYkVQinTtFxZIdiHnsV+iiA+gxj61M/pYFQ+jSxNAH6aU6WiOaOcfAnkA
 yj1+MH84PcrCJhCVTKSzazzISruGBL8IM0F7tvVKP65sSdxd3eak8lIOEitLIceG+H9r/0nEMJK
 oLoiz1DrXs4Nnqg==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

When converting to the overlay format, it was missed that "/" in the
overlay corresponds to the overlay's own root node and not the fragment
targeted to update root of the base dts, which should be "&{/}" instead.
This results in the cma node never actually being applied by libfdt.

Fix the overlay to use correct target node.

Fixes: 30df676a31b7 ("arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Convert mezzanine riser to dtso")
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
index 59970082da45203311146cc5249298f6188bf67a..d8c0021b23cb51bd19e1826b6cd8544f9e10a2fe 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
@@ -9,7 +9,7 @@
 #include <dt-bindings/clock/qcom,camcc-sdm845.h>
 #include <dt-bindings/gpio/gpio.h>
 
-/ {
+&{/} {
 	reserved-memory {
 		linux,cma {
 			compatible = "shared-dma-pool";

-- 
2.48.1


