Return-Path: <linux-arm-msm+bounces-85150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4A7CBA899
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 13:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0A7F30DB8A6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 12:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DEC30146E;
	Sat, 13 Dec 2025 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWjidaZD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109771DF75D;
	Sat, 13 Dec 2025 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765627223; cv=none; b=mRydWs6hTk0VXjnAW9+Cu0WzYQJ3pzfZx4utlHn8ipFiN9Ny1e/VFjsiT2jeHlfjI+2AQz7d94JbeCD9KXuObs+zpPEW5YZMI87MTlQqd8FUkj+Owf/wLYGg54FZ40ktBUg00cLihPEDamF5eNJAgLkQaWIlDHcvMPq0c9Nwks0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765627223; c=relaxed/simple;
	bh=LsAJIhrm9bzt7mSQU8oFFjwtQ0AC3TcH9tL6y0V0y1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QAnoN+P3M53z/hCNMXgIHiiXPmft7yp8enhUY0ihUgs6mGZZchIzPyNzn5BaUqfU8Ie9ReOHhxrNWch2WLOGWSzOgf42lDcfwiDJ6E1GSrjcrt3cUebk3WJ9e/21ctDzhyxP40a+SZkaieGfj6XRMLaN/D2bLyJ0qf4tB80n1ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWjidaZD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D18E7C4CEFB;
	Sat, 13 Dec 2025 12:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765627222;
	bh=LsAJIhrm9bzt7mSQU8oFFjwtQ0AC3TcH9tL6y0V0y1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VWjidaZDXSavPwKPVjRkSpiTJAjBvKqC/1LxuFnF49ZZFuoOwLUgt/cdsEiwJTtgK
	 W/WTT4/dknVOb9kp5WxCka7Uos7We72AOAHZU4bTU0VlYY+4GWBtSrSNilW2eX/6dM
	 dZma5CDBgdH28ialCjGnPvPss7QQVE6JmevsFziupEkc9iJ13eFJvycqPwIzu1X7zB
	 eWmb4w3qbX65en6o18w0FMvLLDf2j20AhKJzFz/AWIeI0ROscAifuyvX27Zp9xmD9q
	 mkX57wkZsae15sovghR8O+ZejxMlqytUKTSyJ8W3jBzo3Y5o1Y5Xve1mO89JiL8uAi
	 LulNZSuByxEOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B35D5B157;
	Sat, 13 Dec 2025 12:00:22 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 13 Dec 2025 13:00:21 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: sdm845-db845c: Use introduced
 platform wide cam_mclk0_default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251213-sdm845-mclk-v1-2-197bc947d4c6@ixit.cz>
References: <20251213-sdm845-mclk-v1-0-197bc947d4c6@ixit.cz>
In-Reply-To: <20251213-sdm845-mclk-v1-0-197bc947d4c6@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1459; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=R7wOc0/W3li22Q1J4/X9qHO1WroFHpmXK6iETy2cixs=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpPVVV2U1w3Lv52MNqjwbzlO3Q9Z3+2zXGDIi1b
 fZj7gY/pBuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaT1VVQAKCRBgAj/E00kg
 ciqqEACXJbHxjZ3BLIDW/tuHXpqh/j4bDcR89FPsnNqFZ7fXbJZJhZSErUwV+tn0KH88XJinS/k
 6QTw3qzim1EDuILqD4daWRbkd5kV/Fh5aHSR/EQp4OGycl7wRRmRwrFOqykdjZ1BDj62MjWVj6q
 4MNLeqa41tQUpb3ElJAm/JKn/3jK+S9PwcF8gtFNwhrKqnFmRoXptHkRmNzkUPrqJuSrXcmL7jk
 2cXLrQP4Bv5E3gDqhFEEeqsucmfFVRXlJ2DWJQnujXmSiMAhg2T7NAPTWYoaSo8QkDbDju3CQTy
 7wspl0ibtKHWX+fm0m0u8a6ss6TBqM1Ta9Fiz6EraPj6M4LHwUuAD9KbtpU1miw1hqCK5yWngyo
 rHHXIUtOkDHvxlJO14zP1g2eY8H3X9QjySHDa1RbzLfqpEtFRYc06vmXY/r2XAgD4Rgnv1d2XqV
 W0uwc53Kq9PPELEA4Q00ljmmRPrRNfRRB9rwy6+UWah8+FjOWbja6RKK9vSluj1WMYDcXmezn1M
 8IclGpllQ9BvZu7Gc7IWc2S75Aua47GyFKpDne3FlZ2rrBDnVb1IxJXRS1X+fMY8XLq+GZE5eu4
 AsXPlHa/OgCfF7ZeD3TUFWLYiQdPW/wGjuPFHk/naQX/jTZQsL9vy369S8dO1yFQwQu0pZoIcYj
 tAMG9k5VmzdvCzQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

All Snapdragon 845 platform has same controls GPIOs.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                       | 8 --------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
index dbe1911d8e470..f6c2c98970d76 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
@@ -40,7 +40,7 @@ camera@10 {
 		/* CAM0_RST_N */
 		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&cam0_default>;
+		pinctrl-0 = <&cam0_default &cam_mclk0_default>;
 
 		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
 		clock-names = "xvclk";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index ce23f87e0316b..981d19c20fa1f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -877,14 +877,6 @@ rst-pins {
 			drive-strength = <16>;
 			bias-disable;
 		};
-
-		mclk0-pins {
-			pins = "gpio13";
-			function = "cam_mclk";
-
-			drive-strength = <16>;
-			bias-disable;
-		};
 	};
 
 	cam3_default: cam3-default-state {

-- 
2.51.0



