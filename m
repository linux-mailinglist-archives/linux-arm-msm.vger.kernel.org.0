Return-Path: <linux-arm-msm+bounces-70188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71931B2FAD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 15:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D7B57B6912
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87142F6164;
	Thu, 21 Aug 2025 13:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0fZrwTA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F34B350836
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 13:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783466; cv=none; b=CxIkLMj/VD35gZA7Znqqpj3O0ds2Q5E8Ir5f1x5x+pBFMRRTHjr3rAHK838yImL0LYDdmLW7mZnDzZNIIqXHRl/yN6h54q69ZshPmXd8VEzbiGlBlqXLjuFteGELebYfzu34ToNOgHUkA5kBNorr5ZJIR5x9bLwWe/THaHkevzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783466; c=relaxed/simple;
	bh=MDumoLPRgnG21ddAMdGM7mX8aev/cn1X2NDxfYOafS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UyDA5hrwonblk0npSazoKouZXsvtovVKOVohXjexcrw8p4L4u27mS9u2+UPAYZx0utSqghbR5CadZo7C8Io2Y1Lmr/xStfAP6Vd+cv2gh2f2KN3iAK6GTD0D+UkPlMCytXoYoAeojBOvD6PEozHxZNeAHgM27UJCeMA7uFsj8F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B0fZrwTA; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9e7437908so683341f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 06:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755783462; x=1756388262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIfb8GDKSVhuere/D9IHS19GORsd7FWNJn8vZfvPhkU=;
        b=B0fZrwTAAYmpuyH68oF+4ekapBj2TdlC15v8m5Fy+T4hDq+5bQUcva6ggO+oh4A4/G
         fLC1lKjfmSDfrlh+KVl0QdNQ946XgC2/s3ikQ31/uwQRRPuqUtH8f4qANLlEeS45c1KQ
         8xnqEBgKo6c/YTZKYx+Ff5BtWL+bFWWtdvg+4rogdYQgNCYW6kWNNRbYvoXfuQs3T6u6
         98v9g4sU1b07jjpEQJBSkvmGJ5YSb4fhkMWaLrGms8HhS2y5T5/Mlj4k2i3CK6dYHJOD
         8w3qyRm7AUTFjC43tdWkM3PogM6csdL8ouDWXRUc60lto4pd0+IPFWOBOpDsetOudNq+
         yO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783462; x=1756388262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIfb8GDKSVhuere/D9IHS19GORsd7FWNJn8vZfvPhkU=;
        b=rhB3MdyuBTwlFr3M6ph4DVEKW0gM3+uu05zRPbL1Q2B/8MaBiiA998xobNSxVMNFe6
         VzGLWLJ1z6QGpnVTXulQowMaR78jLo+l4IEp5adJLyu4IOZHyIPM6weW1vcE0+UFEpDc
         ZUIEX/fwcivh1ZfayLx4Mkr/2NTMhRb7/3hdjiNqXIqCvNE+1sI5c5+7hSjBRwF5EuI1
         hPuJP5e/7f97Xhan/b51F/rysj7munqJXobqLlEc5hythRJ0Zh6kW1O+HTGI2qvLtRuQ
         +e2bCBmB0YKwHmI3VUhy5sXndibXUb4X8c922N33L//RuTsJS8pwELYzL/U/yG4D3CQs
         3+yw==
X-Gm-Message-State: AOJu0Yx0CzJ8mWcpXYQkSLVQGCFz4swzbzGiRXZ48qO2f56Jl2MYT5Gg
	/sDvRB2RzmbLuVDwXxPdFaW/v/Y8s3pFFJFSD3k6fW0Ex3gcGJIE+eTt2x73wBZllQQ=
X-Gm-Gg: ASbGncuV8hlSQukZ6udKbEzhv1mE6Wrx4p7rKRpJc/jp4hokPTaXTlBp+9GAxBbgyal
	bXG01F6sTNYsJuEyIFnWRhYbrMwLCMRxVMkzZbIHT3yiSSqo7muC0TcH0n4uW2Injrrfm3prQ9w
	a2aQOQrGCPFXpXwGN3ZchUtr4z6eSq+ybM9jwz2/9+zzZ3ZacGTIxN1gx361v9nrciIaPck3ebX
	pG5JEb0rCk3TWGs7Cg2nreCV34eivFnw5HtdkIafSN4fJRWzYLo3fwiNug+bLh2+CGn8FrUsJtM
	TbOZqC483es4zCsnT6AfLBHu1TgqqSUZ7Ol1RkfZKu4yeCC9GkzsORFrbWCIZEZc8NkL6VIu9Cg
	wY0O4zagqS8VtUZWEXjHX3hsS5t398VpJWWCxg1fGNc9BZm1+A6pSTQ==
X-Google-Smtp-Source: AGHT+IGAMxNVcohXYAJ5GbmACwvE2pScMCmZryhp/E04ikJzamohgi8RLRLJ8BAPRWOyVizEN3ZqmA==
X-Received: by 2002:a05:6000:1a8d:b0:3c0:7e02:67ba with SMTP id ffacd0b85a97d-3c497741fc5mr2094220f8f.62.1755783462167;
        Thu, 21 Aug 2025 06:37:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4db2ab4asm28937605e9.8.2025.08.21.06.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:37:41 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 Aug 2025 15:37:33 +0200
Subject: [PATCH 14/14] arm64: dts: qcom: x1e80100-qcp: Set up 4-lane DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-topic-x1e80100-4lanes-v1-14-0b1a0d093cd5@linaro.org>
References: <20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org>
In-Reply-To: <20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1208;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=MDumoLPRgnG21ddAMdGM7mX8aev/cn1X2NDxfYOafS8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBopyEbIXU5KNA9DhqLwLBPoUJ/pOBh8ygbgYUt3OJ5
 /2JsGZCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKchGwAKCRB33NvayMhJ0ToXD/
 4ntYvIo6UwxTZAIkUZU/uW2zyJPCEinfL8vLzDwo295QzedMn5P8OKH3GV5u0eUK5tatO5mND03fIN
 VxRAp6z8P+IJrrldOuuuiiQDl0abWYsdRkDlWggWsUgK75ilUAS7Ymp8JEKN8+QDhLV/0EYe1KqUTj
 wN/w3pfYq4SeaDMqGUQVc1pAVSjVzdSJg0q9SZaQGbgNPT7QAvWoXZ9dhcWSFqtiJrv/z3MA5ksOgF
 uG7sDo6kEab1NEsP+TQ9YTjRW+JYketvIKHxT6hdZzQfCD64WqmusbMHxthi9RutKjguhl4j+VEJAO
 2Vn+jNogYuerK5o7/RxI7cEPSOawRGr3safyDdnfbVhixdDXbFW0T/CayAkaPwAw+uyDqUk18+MSN2
 E+D5bM/UbBSLXqDTgJr4qEPXkjbHeKepdLYb5XDM0M3G1+hfy/dRozk4fnF5kQa2jvE3u2j60a+dVd
 PxtU3NIfRRWjU3GwNIwuTARs62/siM+ONW0MbvifONag2Tp+AmSyIJ9QAxv1iWO7myCcoc5fZdzaJv
 veF0NZ1LWsXxp9T04aNYTlQGzoEwWS939oC9QBNo2BTqGmJpmt6HyvYqf4odz7MBwbvQsmEQbI8zJ5
 rEcjrzsc0/xDgHpXroTtP0/4x5LHRh0vp4wZM6HWOdJm4iWh+AnYgUn7ysCA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 4 lanes for the DisplayPort link from the PHYs to the
controllers now the mode-switch events can reach the QMP Combo PHYs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 9369b76c668b5c008fefd85d5ca18e87ab9ce93f..60a0318b696abd8748f42f1e53597fa710df6f7c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -890,7 +890,7 @@ &mdss_dp0 {
 };
 
 &mdss_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
@@ -899,7 +899,7 @@ &mdss_dp1 {
 };
 
 &mdss_dp1_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
@@ -908,7 +908,7 @@ &mdss_dp2 {
 };
 
 &mdss_dp2_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 

-- 
2.34.1


