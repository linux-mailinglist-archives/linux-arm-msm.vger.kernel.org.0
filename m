Return-Path: <linux-arm-msm+bounces-73470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F791B56DE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 03:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3CE23BBEF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 01:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B31B1A83FB;
	Mon, 15 Sep 2025 01:32:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B43815E5DC;
	Mon, 15 Sep 2025 01:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757899945; cv=none; b=usoqrgYy8eEeVfQ/p5H0Ix7l59a8FRwIkbb6cFOa3xtXw1hj2BoVA5iRFSHMiIqJ3Ez58sa5H3Ge9Jbw1RWiVWoNwxWL9fokOLu6moEi1XnwHGBjEcDKEImuFJn75K01muhUrfmL58Ejyw6mV01+m+4jZ4pWfCqbU3A9ju5YQS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757899945; c=relaxed/simple;
	bh=+iv5zRGMLQo5WENFMbbcB6yHAuv5xbx2teATjhd7cMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fNCyzlvW/paVPDQ2IaIeNmzo7WY6OC8eietVYopLxei9hHn6r5TBUCTQ93B7hIJ0bbTBhFd7IF8wlvzr9YmMClNuZ1646/N7FBk3T78cvPNFFmvXdzhVtw6fS6B/et36/07UZ4U4cxq0zrNCUei4kC5bCIi3XgWMpMeVmXmHuzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip4t1757899919teb409d92
X-QQ-Originating-IP: yqCn6aI40die4BG8zyG4KIV5i2TV3/wxilsAEP8YMo4=
Received: from [192.168.30.36] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Sep 2025 09:31:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1962331146706820559
EX-QQ-RecipientCnt: 10
From: Xilin Wu <sophon@radxa.com>
Date: Mon, 15 Sep 2025 09:31:43 +0800
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add Radxa Dragon Q6A
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-radxa-dragon-q6a-v3-1-a6c32d988ed7@radxa.com>
References: <20250915-radxa-dragon-q6a-v3-0-a6c32d988ed7@radxa.com>
In-Reply-To: <20250915-radxa-dragon-q6a-v3-0-a6c32d988ed7@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757899915; l=921;
 i=sophon@radxa.com; s=20240424; h=from:subject:message-id;
 bh=+iv5zRGMLQo5WENFMbbcB6yHAuv5xbx2teATjhd7cMM=;
 b=/6/uNNrlLeTFZPUTZevh418+1VuPjuijTTrzlKphDlk98jFHNjK1BjjI8ZmIq8+HhLSp9xhpX
 6bUj4pK1SkHBNM/zvENXgbeKb0aFuda9ENU0ef+nhYe6DL96Z/b+K9c
X-Developer-Key: i=sophon@radxa.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MdoRYM9mYrydlmEEGK6fP8eBx5M61en+IsZJaEmnhpZbkz+W/w4KMCQg
	/aVK5hi4g9fLjwxmlx1pbR7LKIfa88ap1M/JH9FEwJ3PEkGrSuipeNdfWuNmeDZ7SstUYIl
	DgG4SPRl3MEYpT0SarGUI8ppSa7FQE8TllXVIPuRgoJmTaxkEWrQm9NjI0d95SsDAYo2527
	FGb7uvPVwyTvwHFU0GBW+40CM+9u/ZybixEAto00ASZmcENvQ5kX1h1qMAZenv7/DqXSQmU
	UsCKBkwKq+Td3gAkZZxFTMWz0NzxS8rIQqWYRWRV8hmiaLhDbaj58APcvjEvdV/u5/SuPtF
	762VNmQyuAAd9Rtdrbou3IxjY1rPRtOFsoy5g+EpnKks9ascBSzNCZIH9z7/E1pajNKfzqn
	kCuTX20NjKhag5jddtjWsABuDLBQKatLUIP3TL6/gxv42BDPpvswaKQxhYR4Knm2QMCGo0h
	vFnQNPJdQZTKmmJOqb0U50wzf+J4Xxdtfz2yrQwjEF3IcazeBaIlup7mEEu+wccMBCnjVUp
	jb7sm4EawPHz1yuhvX9qhJ7lLnpn5C2LDUDM9GsmjOt0AQdcBGdwYopzFGIOQIwGmS6zcE3
	kDlNhN67GUTwjr0lvrplhsJtaLRlqLXlZ9H1cf8iV2TQr4pyt8QLQjgZuPveT87+4Y0/VLN
	n6tSdrY7q9Xoz5FrvHnMFfBqtul/v44Sw7n/Q7NA5q8qCR6yvB2w0bcL/MrdWUjSydxD2Vp
	CU1OBtz/yfpCmdrQdBqiRJe/aazx1zwnq5Zafvp9aIpWIoDSEBay8hho5xJuCxLkhb6OAPt
	x3AX+ND2P5K132vXxPOngqvrhb7dJrs2d07stv8hZQrsPyxzS7VL3CTVYo5FOwNEm6Pdlb6
	gpbXSf3AXDhDGKrWtObfZ9f+6gDKHzNlmqvqj50YV2AXjsw1AFDSF/padg4DjE/uBB+sTd7
	EdCpp4VBIzouwNQ4Fvlqv8mCwV1sCQEb8pT9p61W5+Vt4/KCSr5Tt4lYIDDNL9QY7tuk=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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


