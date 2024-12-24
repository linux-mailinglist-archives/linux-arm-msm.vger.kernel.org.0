Return-Path: <linux-arm-msm+bounces-43233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D37D59FBC3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 137381881805
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1744A1D9A5F;
	Tue, 24 Dec 2024 10:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HaKDcpS9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492C91D86E6
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035458; cv=none; b=IppLpEe2JUDd/G0nUXXeDd5N/8BVC4+qfoV1doLnWdBpgI0h7OWmd2TNJWmosHT8fezriNhh+XE/OrA0Af1J0jr9MMtkG2kdTYZnmbqY8vHkw7tC5Cny/5UkvjNAEquZe8QANVRIsKr9m/+8zS5mg+b6lNT4t6hpidplzPHz0B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035458; c=relaxed/simple;
	bh=o/j8/+TO8OD48smfSUKUdOz/ApCt6Naf9bzdvgRGXWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fkQbELWWNxDXifRmeBBP3Ted8V6NYVnp7lYClPskadCFaCr7Fl94oKvc6ZXXzP5x9eOviJartWy0DSbH46Id2bQyMSM6f+/rgrUgRCwy/lec/B4y5wBAj/sjoXbWIzns6WwpVd21l62HAjzLprRkrNWt23rJhxyL03kjJI52tKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HaKDcpS9; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401c52000dso5682870e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035454; x=1735640254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUt/nlVp4F9zk9gauat9gnZ6HMkU6q3REW18DcUkNb0=;
        b=HaKDcpS9C1eRQ/6QJY19CCcIaBzf46mXJ3PrYoLdc0Sep1xZ3ydUvwI7AP+4P+7/E+
         COUVjPCntHF0N9eJ3DpIhlH2JaKjhz0JkAxsNDODm2C4ddYyBX1ADsphdaMQticwZdgI
         edTvIj+FIC7FcGwn64JXD6nU/JLO7n6mXvLDdywXgQAZFWjNiQdBLGggi7eCPYsiGzZY
         +t9Jy5aSXeg8mP3rg9Don9UPKH85Vsw0Ieyc5MI5Xk0dX5PJp7/IOg7Eh4K7ZyXIuMuI
         IWGCAqBKq4HyI1ec0cc/+h3NijAsSMGusevUjvyT+6ybx1VJKd0Wx9Hg5I9NpA7O9xGl
         MpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035454; x=1735640254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUt/nlVp4F9zk9gauat9gnZ6HMkU6q3REW18DcUkNb0=;
        b=LDYO2nyf33jhtv+y9DryDlwuII1nEFgsRz/K63+jSivs2HcqefSw/rXL6FvCzmJJ4c
         oLdCzL1bMcLiZHyM/bYLvGQpOt/zXIfS8cCQdUZiqQJlrwbVumJ1ervoh96uua+ao8/5
         jmEnrVcMuTr+p5voqJ2T2pwxJQzjzEmcap9ULKWnH8pDgd3HZUeN/bzMytDiwRfN1u43
         /lpK8xT/ZZyB9PnVfoQFylzBwhGCoL5E8XscQw/JSc4a4PcuI6f47m0KmqJW6wjDmgF2
         K5F3zjCDRDPlSMrIe0Vnz/ccx2XdpgCVDG4GvosYuOT1c3eVo2zIQ+Zdvzr1QFP9QYAI
         bjCA==
X-Forwarded-Encrypted: i=1; AJvYcCWNlJvj575tgQ5Q/+f8Y7dMK4J5CcKY879HTCWihddNMN/cG49x/AU6tPPQ1bYM0I7KpuiUltMMnqWvbj1f@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ2Zn9IgMhLek0Lttv8+ahRUTC0F3BFSvgBoDFTcPRpW9GI74f
	wCL+KiKXfC0zKv19x4Or4B+NBcVokC/pMXejTaM2NVC1PzGqrMRYhXJNV6YcSaY=
X-Gm-Gg: ASbGnctEL2kUHBvaogaIiRq7EuFcmUc+V+5hySiqsE+iGNxCo41LS5lPW5gdXZvkh8r
	kPxxO37BRgZQrBnMYxm41oIHWEYrYxhYhGgp+LnVyQpvmIPL2Naq0xHK0fkxGZR5Shlf4VNH2fO
	mVT3amX7QRjILUt8GhPxJtV7rDTjeQ1VzH2+or19PQAIOUay/++BuhK8zaJdCptApAg6Mn3lMyM
	LOvWN9q3NaamOWYY+WW+hoqZRbkzSPj3qGaFjGPeNTKhk7PL6ruD7gRqdTOZkHF
X-Google-Smtp-Source: AGHT+IEgwKTpv91FabsYyZ0eXuR2B9+NxFkgzXk04ZH6cVMiNUzaaUM8Ydornbg8z3+P6HYzAKUCQQ==
X-Received: by 2002:a05:6512:3f20:b0:53e:3a7c:c0b5 with SMTP id 2adb3069b0e04-542295228e0mr5587068e87.10.1735035454526;
        Tue, 24 Dec 2024 02:17:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600596sm1576865e87.92.2024.12.24.02.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:17:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:17:09 +0200
Subject: [PATCH v3 10/21] arm64: dts: qcom: sm4450: correct sleep clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-fix-board-clocks-v3-10-e9b08fbeadd3@linaro.org>
References: <20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org>
In-Reply-To: <20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Leo Yan <leo.yan@linux.dev>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shawn.guo@linaro.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Zac Crosby <zac@squareup.com>, 
 =?utf-8?q?Bastian_K=C3=B6cher?= <git@kchr.de>, 
 Jeremy McNicoll <jeremymc@redhat.com>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Melody Olvera <quic_molvera@quicinc.com>, 
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
 Max Chen <mchen@squareup.com>, Vincent Knecht <vincent.knecht@mailoo.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=888;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=o/j8/+TO8OD48smfSUKUdOz/ApCt6Naf9bzdvgRGXWo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3pWlyJ/0Y6/KU+eet3Pe3VzyomWjZKpJ9O/3PznI7ldS
 ZFlm6lGJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmEpTM/t/3jOMPZotf7s7X
 DC5s2zFN73LTilCFpGRriatnCh3ntl8LE68MYDtRLBcSO40vT737wrH+kytyG+MXR3UpT215sfa
 C8N40YT5WtWWaYnWNTx8L3FNYqnm4caPX2Vz5h3NUHu2VdlEP9yiWT/Fr3jrx1fflJjlCnWk/W6
 wm+9w5+evn5Nm8f/cVWVSc4GzbJtXwzyJQ78jKUoEzk9Z0Hcg/WKC5UVqpUV38UP3CQ2I6F+4dW
 d2yJuiDYfprc/0IRqPi9pWu3ZrHp8ZJhhgvC5yYtzZj1rStO/jS6l26EhxPp+qqW+WUsn2zf/ax
 5GZQxtyTOvqmQr2m/d/qF0wP+5a1+k/MhZAK44j2vSLPAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SM4450 platform uses PM4450 to provide sleep clock. According to the
documentation, that clock has 32.7645 kHz frequency. Correct the sleep
clock definition.

Fixes: 7a1fd03e7410 ("arm64: dts: qcom: Adds base SM4450 DTSI")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm4450.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
index a0de5fe16faae5674efb0070d4017983c86603c4..27453771aa68a1c4dbd2a986af6785fa05db147d 100644
--- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
@@ -29,7 +29,7 @@ xo_board: xo-board {
 
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
-			clock-frequency = <32000>;
+			clock-frequency = <32764>;
 			#clock-cells = <0>;
 		};
 

-- 
2.39.5


