Return-Path: <linux-arm-msm+bounces-39652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B51CF9DEE19
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 02:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7569B280E3F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 01:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90D3155742;
	Sat, 30 Nov 2024 01:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QvhQx38h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255DD155330
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 01:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732931089; cv=none; b=rsyYYGZuSNx+1OUXh51dV0TTNVcjDvlXAphC8hXpE1+q8fu6429VhOmOU5buv9a3JP1LwdoqqVLC7k7iTqK9Yxph56ANnFnlmescPyxlj23IJ4cbGwlTqeMJwi15rNiafMVNFnDerH3SSkTeij6Hhu/3jfAlMJXpJY6EQSn+Q+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732931089; c=relaxed/simple;
	bh=cwHGT8dW2fufdVjeg8a7nAT+ERCmV5CuNqJS2eXbLFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qsJsrDdkjzK5CnGMazJ9RmmzMBW0Zw6QUCMBj325sE/PzM/NOlJCOurSZoeibsCtskI4yXCDaapkx4o7JupwHgSHulD5VYWhy5C+3fPOKkB0eiwLmeNmLos9p5tuD+QLijxt4e80uufiSrYHR22dwKi6eCCSO+tC8m2cugf8jEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QvhQx38h; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53ddb99e9dcso2466664e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 17:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931086; x=1733535886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUBAhw6SG3dsXPAFEzT6mizjETu8TuHeYIqS7qX2o8o=;
        b=QvhQx38hQZi8XKLRmJi6P1rM4TAkRkIZAFAy4yZnv3+OUr2rbdSfuCRV3Vwh6/2LrA
         kyBnVNmX0hqibKFLiCSZMZhvBckiUxgYTvlGymvi3vyxOv3Oj4JYsfJjZrpbIytu6Q47
         YZU7+JplFt85KgETQY4NnhuAyOcM02NIC/GYFb8jm4MY4BeZJmxJRSM6cRs7C8XNlHSg
         +eaN/y/Intyxxtl4gDcZZbHTD2cd9dcCUBhwEvSp4jS+sEm8MvIVA5LVLxQOI5uPZEe9
         Y+pn5lYzOq8KAWk+EbGC9MyTz2rkqKaGF7cDnci6tPo/vuEz4pF+Srph/zN1kZ9w7uwK
         akuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931086; x=1733535886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUBAhw6SG3dsXPAFEzT6mizjETu8TuHeYIqS7qX2o8o=;
        b=bswpQTE1dRmuVEolUb7l6BoI6XYFo7lYWBreqSyuPS5NCPEAYYDjZ2+n0UWs6B1Fn7
         YRv4YOGcM4Qx9Qgkz7owMn/vXraanMPyYDPes5URwVvGvWYgM8CL58LQyN3hk94fJlBp
         eW1DJ3BsQr7MSnWmUGFXmS+KNQj3D5KOuQPcmzBDQYSCxVyd9bUauauswE9lMr4VOTdh
         v8rBVKRmFiDXNMpvoDGhXC9smx/tNX4vuXBik6So6Lbq/0Xwuc1zpy8ZDu3OlZw1I0YB
         Edld4oSgMk/ADQyqhsR4x1MpA7NXhEIc6bZ+PCkwhS5Q7IXZH7Y3CmxU/N9ggXo9+g4m
         HM3A==
X-Forwarded-Encrypted: i=1; AJvYcCUYsyF7cLGbsLi4EVZWMTHA+qDMRdgA7QgGraCuFPpk9MvR3MAI50UWmbz7IrEI1/ErfI63x7coOAB2uvmU@vger.kernel.org
X-Gm-Message-State: AOJu0YxqwREuE13pWxlAWL9yzqEOAAPfZnAYcvKmRYT+UJCzqd2GsmPK
	mVwQ4M329W2XRJliyUG6PPDJ+q5fQMtlM+UeoKoS/ReCHjtaTS5krvjVAXuiksQ=
X-Gm-Gg: ASbGncuCCmwMeXYI8WRWk8DB+qG83IVtiQP+4apk/zKCvYerJqamZuTyrO21UNkhthQ
	gyHYrouBVhFfJczZlE0NTsIL1Tf6FiZ5kiZZ8pILQ9B2oBP8ry3VzbwreclYS9q5+Gs3F3QrO8C
	J3zdDhbdlXuHXBgc5o+iuky37uKIr39Ly7L7UG6Wz2lf2o6pTj34U684R7qQJyQTy7M6FAcEC42
	LdwcImVOq9jTEMAXnJv/8JcdeqrMFDvNWvo4PKZ3QmhHsI4vNC+swaGPw==
X-Google-Smtp-Source: AGHT+IEPi+X71Xr5ydlpsLZUQnmiaX1oplH8lKawDP7TUOsj75l8a1wW89AwaS9jiffqrAY1bOLP7Q==
X-Received: by 2002:a05:6512:2203:b0:53d:e43c:9c64 with SMTP id 2adb3069b0e04-53df00de2b2mr8648482e87.30.1732931086317;
        Fri, 29 Nov 2024 17:44:46 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64a0742sm631946e87.261.2024.11.29.17.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:44:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:44:20 +0200
Subject: [PATCH v2 08/31] arm64: dts: qcom: sc7280: correct sleep clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-fix-board-clocks-v2-8-b9a35858657e@linaro.org>
References: <20241130-fix-board-clocks-v2-0-b9a35858657e@linaro.org>
In-Reply-To: <20241130-fix-board-clocks-v2-0-b9a35858657e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Leo Yan <leo.yan@linux.dev>, Joseph Gates <jgates@squareup.com>, 
 Georgi Djakov <djakov@kernel.org>, Shawn Guo <shawn.guo@linaro.org>, 
 Stephan Gerhold <stephan@gerhold.net>, Zac Crosby <zac@squareup.com>, 
 =?utf-8?q?Bastian_K=C3=B6cher?= <git@kchr.de>, 
 Andy Gross <andy.gross@linaro.org>, Jeremy McNicoll <jeremymc@redhat.com>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Melody Olvera <quic_molvera@quicinc.com>, 
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
 cros-qcom-dts-watchers@chromium.org, Stephen Boyd <swboyd@chromium.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 James Willcox <jwillcox@squareup.com>, Max Chen <mchen@squareup.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, Benjamin Li <benl@squareup.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=cwHGT8dW2fufdVjeg8a7nAT+ERCmV5CuNqJS2eXbLFY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm30t8SRmKOAuhUMuhgKfV7LHUvg4Wstu57so
 qZdzx/edM6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pt9AAKCRCLPIo+Aiko
 1aLuB/sECWiL2m2/MeQbPYtq6Q21sh6UP8on1KMocDd5jR4v6VgOSCOz7vTlB4l5sLpMYAXD5gp
 Gr8eB6kG/oGpdemcwWSVhmNvmySIxn1Ad0JMVx+PtXf9Pq7yCQhtYDzCQfbk2LuhW+c03cbq/5Y
 jrLwQC4RKjNyK9OS3grA3nKD5exT8t0y3XUKtIe2iuqnszRHuVxeXcQuAJcV1YHyyjP0EYYc4Q/
 CiW5lhaL0VYBdVZJNsiFgrgfsnsHE9vo9noJ1g9LC+Y5O6tLzsDB/WVwJIlunnAaHTaQZVuovop
 l6TzjBSgDM5Skn3CZZmyFNW5DkFut5i91qCIcxJizY5V0cx6
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SC7280 platform uses PMK8350 to provide sleep clock. According to the
documentation, that clock has 32.7645 kHz frequency. Correct the sleep
clock definition.

Fixes: 7a1f4e7f740d ("arm64: dts: qcom: sc7280: Add basic dts/dtsi files for sc7280 soc")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 55db1c83ef5517f82504816baeee583695065225..d12e0a63fd087461a33622e8771422c8acfdbc25 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -83,7 +83,7 @@ xo_board: xo-board {
 
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
-			clock-frequency = <32000>;
+			clock-frequency = <32764>;
 			#clock-cells = <0>;
 		};
 	};

-- 
2.39.5


