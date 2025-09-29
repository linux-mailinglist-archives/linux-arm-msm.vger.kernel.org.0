Return-Path: <linux-arm-msm+bounces-75480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFFABA82C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 08:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DF121C08B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 06:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B688D2BF00B;
	Mon, 29 Sep 2025 06:47:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F59D271;
	Mon, 29 Sep 2025 06:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128458; cv=none; b=dyctifbHLKuznBMXaNHuHyGE0+gfiT9x5BQ52joUawxDhfE6L2Hl8xFzFtYbLYe3FG7W561qqdkEKClkvAgi54N/AKuBCrpucirQJzyTnKJdzB7+r5WYvh5B5YYbma0lJEQJLq3yZLLSutio9NWeJWpl7hNt97LuPtSoDMNw/e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128458; c=relaxed/simple;
	bh=+iv5zRGMLQo5WENFMbbcB6yHAuv5xbx2teATjhd7cMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B2iUOzamuQ/HoP49RsukauE6ZMnARH6rJEOVsUXwBLy13b8rTUJvKS8lhUi0xPwNQ8Cv3WWEmn7IhsS3nUk9L18EY1i5LmPncY+SP53/1MuGfpdAhcTD0ip+9hGPtFdhIPdjJbL4VE5a/OZQYFhzeTFDW4p6kQpPl32hNuKJlgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1759128412t6c5db7f2
X-QQ-Originating-IP: X/z+cmFFEoiyXZHBx+7oyPnTrWlM42QeXgFKXycEK0s=
Received: from [192.168.30.36] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Sep 2025 14:46:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6403738838587250170
EX-QQ-RecipientCnt: 10
From: Xilin Wu <sophon@radxa.com>
Date: Mon, 29 Sep 2025 14:46:41 +0800
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom: Add Radxa Dragon Q6A
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-radxa-dragon-q6a-v5-1-aa96ffc352f8@radxa.com>
References: <20250929-radxa-dragon-q6a-v5-0-aa96ffc352f8@radxa.com>
In-Reply-To: <20250929-radxa-dragon-q6a-v5-0-aa96ffc352f8@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759128408; l=921;
 i=sophon@radxa.com; s=20240424; h=from:subject:message-id;
 bh=+iv5zRGMLQo5WENFMbbcB6yHAuv5xbx2teATjhd7cMM=;
 b=aE3uaE3aemyiR2TtttAGaYIqd+LoXaA5gfn1X3QVXSROpKkBzh6b+ZxtZoP+hTBue8zSNa0FS
 smPfz7v6c7pA8AjvjFZofzirOLAZLNvg0OGpofvOPcsEFD6nahN9Q1Q
X-Developer-Key: i=sophon@radxa.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NVgUsgecbtFO33R2cRhuQZ6TnPUbRfmYf3dbtaAr0/x9/tRF3U1ipvz5
	QJYxwJL2GX4zqMY+fCFwIetK7iSeb/MHrvlaaRUTveBS6IIuURNbWMR6GKXJLSnCTsp1Kzt
	V+xTkjHJNT+SwXaUF7k4+x/W3sNB+ygjzJ+kSJw1ENMxxaw9VKM9WvwqZv8cGQ8wzUWPKG+
	9xBLYQPCGttWmOXwg9nm6tjVcK1YUOPoVqbG94/ARFiPcY4ovQe1DEgYXls7BZuECN4xyGM
	JoHPJu+d536krMeBFWqkmGuQnTCQGGSQS+oSGfab7cx1eaPOopEuiuHD9vbAAfoI4hca8R6
	z4dFeYO3as8xIqQZ1oWcxHR9TaXU5hvVVqiRuYMeglNVlv1QhobMjeiUwjAH8gy87HUaf5F
	ya5MOGTJW9KAzmszL68FS6pKSG9t4d770VQdfslqTaWGaliIkz2ghsqkJxHpR70GscNhw5o
	QNnQX//064ZFl9fZ23sN7HDiUoizHzzHKR8WtVIabHJUWPMm0gI8lApgUd9i1G0+szR66OM
	96XzkSsUHYaXHQWesc6+EhPwOt6bmrrQMDU83daFL/hZ0leslHC6i5Ceo5HK+p1dH7xymMD
	wmrQzMeFTQqz8Hb/ipz7VSTgNcWxWBHrHZ49aubK8pvQBoNqeO7NAatzF6+g6WahW0DSws+
	gBxg9OyIl/DMzpQVme/UTomQX9DMi+z3IwZ9OoSfh2kCk1JGVl0+SDEvg3BrQQbqeZjf5TZ
	P26FRaYqcikDo9JIAjNr/wPd49ymTx6WMJdjEHLEgpisTnXVzeyxzZ8GaYBHa/k8LOzPnkR
	SfjBK14njWWKCyj2KLGX9wkFRJ405mCB9RgxZ6O2svZ6lCynPLhWrl2yWkqVc2E/m08Tg1n
	BSHnMdDLxYh1VuYUDzawL2maEpkD9/kGOyuylMFLveeF/nTPW/PxpU2hTmSMJjgu5BfEa3v
	RbZsKoPZE50ySVLyzxPjl+oQOMr0rPwVVkjg9GaccexJMUA8tB0v5H6gM+b4tPgUHHw5v0m
	iC6LaxM0Yx236OvOf4
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

Radxa Dragon Q6A is a single board computer, based on the Qualcomm
QCS6490 platform.

Document the top-level compatible for this board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0a3222d6f3686f1647b9e2ea192c175b0b96d48a..a7469a51adf0d6ebc1bf25acce8f125a844dcdbf 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -339,6 +339,7 @@ properties:
               - fairphone,fp5
               - qcom,qcm6490-idp
               - qcom,qcs6490-rb3gen2
+              - radxa,dragon-q6a
               - shift,otter
           - const: qcom,qcm6490
 

-- 
2.51.0


