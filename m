Return-Path: <linux-arm-msm+bounces-70184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D49F6B2FB16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 15:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55C6D1CC19C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B4E35082E;
	Thu, 21 Aug 2025 13:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AwDa86Vt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582A434DCDF
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 13:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783463; cv=none; b=Juux4+9vt5TIT1pPlW/8aKIdKqmFba7Eof7wgpmk6vC6yYXOREbZu4jt+UL7Emx/dRX3LEaOQ0l71FQL4YtO8Qva8PyVubc74uprKyx80TXO0Us2G/ZBlRF45GSBDW9OyWZw+kltdu+LumI4mOnXdTZBLL1zfg0RlXl8eH4R9Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783463; c=relaxed/simple;
	bh=DbsExdoRyp3kdjCk0epdoDIR0B1+3ES9cdqkRoNTHi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r439m3TJ4+fVapAIU5ujIFrifVhRepkx3qIGdMUMZWCDltpP5Wr2cAbio34e1oWxdBfSkwhET4mab3R7QCkuE31em86XVNs2ypKfbABinAzSQ5bGTh+AVSWuZ+ITcuAdcvMRQbF2qqFoqkreASL6UDuDrJtoMN5FULkaWjZx7Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AwDa86Vt; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b0990b2so7367855e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 06:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755783459; x=1756388259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5otisq1c/9/dwhaTo3HsCPZ/30o0nEKHZQeBlO8KVEI=;
        b=AwDa86VtvaSxHS3ppCzDF66mhlLKgsp7de37euMR7eShj6DWFE1GWfuft6eo513720
         wgVI51R0deL0rPxzyx/GdsseBVDgokNC3lGquAfCj9XTmCoRIT4el93O0aK2yj8FhmSN
         a6PprRhR7j5OgXDk2QGvyrPrTx79n43CAVZLQV83yFsE5lRfuYMzlayKLq/zgQmFvZdw
         AFZXu4AaqG1ms9B0BeLUwivbjCc61yu/P7t+DO1WZ437jVxB1+sejfZrmfaUSijoDasQ
         iUepdoECf6onRTjz3r/nNAQKn01RowEANrmwtHEKZe0/Y1rH9zQsjR8pIsD7pTXb0k7x
         LthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783459; x=1756388259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5otisq1c/9/dwhaTo3HsCPZ/30o0nEKHZQeBlO8KVEI=;
        b=s3gWW0BEnC94QoPLiO37jK/+LHa3eqFuFmsq6dvs2wSksIrIU63mTPy7Srw9ip3f2/
         VGn3hPaK9GoKjsznejZLe0YfK98PH9ovHvtpEjDkRhBOS7D2D8eCFcoxN7Ufqle2kMxz
         slWsUnR4BcGK3m06PrVVNw2uZu1u69pwrVtiGPai5tTTJ5Galv1mHahmYaaJlQhTih/8
         /XEcxwiRxHGut104uMK65u1x1xzge6WqftwPgaLP2DXLaSfbmWyWXRDadh3Cs3GRBG4F
         hlEKRKKxlgf6/nF7yJci9iLd01v/QwbvMfHZ8U4McMchoF1NXuZQ5tH2NGhlFWUdU+sA
         kDBw==
X-Gm-Message-State: AOJu0Yx5bJoFwRaLTafjcYrgpwvGO59jqWO7oW89u99aQIE/bihXQKnC
	Ye4YjOaaG+EHQbY9GJot5GF9PQbrsl+JrRVeHqnU0DEqFiwl2J8NbmycPnSZZM1vyhs=
X-Gm-Gg: ASbGncvdI13xoB8V9b46vvCvqO67iNxNCw4LBiwBI7QxaYsNCKmP5cjRjGEKg/Z+TBU
	eh8jhSPReoaP4Est9axYVWU/tXYhucTqBxwXaG0jFa0lNR/Tx5lQ1a2nJZtsw79NrZb5qunz2Z0
	VUCeSZmJPKeEk4xoB+BOCSCb1EueiBhrcC62WUY8Xo0f5IndwPicBUp4XJMN9XweK6RL/Mv7D5M
	nG7exzBK5ci8wrkqAYCpZ+2QEtCLPmjfhe5ramZu7QU/k1mlbN53lFCBHCJqgHOxtVjwBJnVlRI
	MpkglHsKWhXSAU4Jn7NaNqqftgobEdQ5JjLqhw1lmXAZ9HzT75WrbtSz4EjgLCmMJgiFl+CIfXw
	+z1MEeVrBWi9gnVWiPFkKFdYhQocnNZg80rjNWrI0VLU=
X-Google-Smtp-Source: AGHT+IHEs+R1LKsR9RVEL5YYkxKqu6VpP01t3/djpZn+0eRzKazkU80lVkXlPQRhE7sU8srwi0gBgg==
X-Received: by 2002:a05:600c:4da3:b0:45b:47e1:ef74 with SMTP id 5b1f17b1804b1-45b4e8f8e38mr10664155e9.35.1755783459514;
        Thu, 21 Aug 2025 06:37:39 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4db2ab4asm28937605e9.8.2025.08.21.06.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:37:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 Aug 2025 15:37:29 +0200
Subject: [PATCH 10/14] arm64: dts: qcom: x1e80100-dell-xps13-9345: Set up
 4-lane DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-topic-x1e80100-4lanes-v1-10-0b1a0d093cd5@linaro.org>
References: <20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org>
In-Reply-To: <20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1070;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DbsExdoRyp3kdjCk0epdoDIR0B1+3ES9cdqkRoNTHi8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBopyEZ5bn6oS1bR4zPjt8iIEQweKLkClCLGnRt7W1C
 1cPXKJOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKchGQAKCRB33NvayMhJ0YczEA
 CrvCBjX0iDeoT0nlZ7oER3u7O+Ltxo+Nv7nP4Lk9T71+ST0I8+LDMTWDuzMw1LsiKxlA97GmyUAxTs
 xhYaU9VyTYEn+UNdUs4qG8Afy086wcS9ANcCUxFKcD+1elSPxb3VdEHiaG01EnGYMBpknliuX3tnXw
 brFP3r2Au74Uqk0YJUl5aJaiVt940OIuUVZoV6GV+rFAJY9uNCjoGFFUTwQZDUuDDsvEvb4TZXqzl7
 u1a1hviq69zK3pM+JwjnKELdJ+jHNcKsD9dkpgCMEueDXgsQNprIncc5QRbeyqt/4GYXr9NyTTUUUD
 my/kdFGG8+NkOTGrUtbl+obqfmCB0y4AAAyxT5PUYEOw4QUPXBRuaRBCckEL5c8hf+bXWsguiBia4C
 tzki3sRoQw42ifFk3akW/urDstvwGrxw9sKQRxi8OtCBZKWFRxgaz+X7sx8k9UTKf50Wq4Np3VgJxk
 6PzaMKw1miZn0TcuAt/P2a85t/Ur7LaffzXHVICVzTRTiSPpp2ptlolbZD6aN35dzVse50zS40TVVB
 lOa6Efw9ALi41a1m1F5uSQud+/8FA+Vqc4SE+5W6Q6iFm9f0MqkD9tuGByrNjw6lzbDSKcweYgW6LT
 QdghTIE41oMQQ6bh/BagF39pJWiPVKn53zhkpgVssBlI776e6AtVCC74Fa+g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 4 lanes for the DisplayPort link from the PHYs to the
controllers now the mode-switch events can reach the QMP Combo PHYs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 6b27067f0be66b5c41fa681ff3b4f535100bdf59..293e557ee07e0e622984d6f869a5f79a5766ed18 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -884,7 +884,7 @@ &mdss_dp0 {
 };
 
 &mdss_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
@@ -893,7 +893,7 @@ &mdss_dp1 {
 };
 
 &mdss_dp1_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 

-- 
2.34.1


