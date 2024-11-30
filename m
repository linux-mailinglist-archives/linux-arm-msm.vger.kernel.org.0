Return-Path: <linux-arm-msm+bounces-39649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE6C9DEE10
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 02:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 419D61622FB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 01:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2894C148855;
	Sat, 30 Nov 2024 01:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DzDLeMhd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A37146A6F
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 01:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732931082; cv=none; b=Lsbacok28VfbdXCdiz3eBlb3ho3IMdtOGZDoCp6Hn8Zl3BTneR93EQfkElO4WZbZDJwaC5354v68DuTFdW2eGvZW7OgQF5sV8hSE0r2GqChDsV58iiFzQz0ZEb2ImLN64XljXuycISIagLZqk6+pcxkEDWSSO1uyn30S+WVnbzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732931082; c=relaxed/simple;
	bh=dSm81W8OxeK3gTXqKdadDd4ykcQub/N1yof6klx6nCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FbI0MZX09sHCrYHhDX9LBGeyknCxKXZazZANh+xi7b9cVg+VL1pY1z1ID1+Qv2zn0FU6+9IIGRT/yfU5anrvYtdlxxe+1upDy0irOmRIdsCVm/IUBaI5RBELh3BGGoUbSOtoKCN2jdRu+OYY8dI75aPNSQq5u2oC+Uby++PVZ7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DzDLeMhd; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso32053101fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 17:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931079; x=1733535879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtqLBuuxq99YjBu1NlJsyy1afZJqqcmeNdDxNGeJwsY=;
        b=DzDLeMhdUF7BXp2N82Ep3avwdv1nvzlokqfRCFzVLPPzf9t3xeW5KKfZh0evye8pqL
         uuRdy72EyQUMOgDNgRdBRl94+M0ppC8Gl0abL3hq3mcZWsPD9zH7VgGeatEbPg9q4RNS
         HIfj3C8oLuym6+VB4TYfiJnJhyHuzxLcyLm/WKf81JmzWCjpGvFoO7rB43ZzF+zzQfDv
         rl4LccPf1i6QH6HAHu/xIaJB8qOxMcWETtHGe6e+xUt/gPd9vIQOW5E+UIdrC6vnp4si
         U6xr1yExsbu7lGzfeCblMMGUpEd0S4lEVQVi2c4Euv7U50vmD9IjkvJ56P/+6U/ofGdg
         V4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931079; x=1733535879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtqLBuuxq99YjBu1NlJsyy1afZJqqcmeNdDxNGeJwsY=;
        b=ugcICI8jAE5MQWdMe1jqBuXZN9Ktg6TsUPR02yVePS+VcQWa6TtE5Bi60E/gqNkl6m
         tBqWjVImEOcyPhAoWdvZOrRE6tXDF9hBH9n2MDU9U2a711lK1XNPwE2znZugTLihdoE8
         yDpRlj465Sp/H95uoP/izCYhtf9eP52LoZ1eHXPOsxmmp9Bv3RwoJ5CB0sAYyaWvFDsz
         oda7vsAWAwjdrcXzhSsMqneXNVPlQT5rJ4a7/hS1t6lmg2izuzCUhRktXSYynB4UkdGF
         BwLqUMtJhNzJQolizvonl44yMgZ6HY4G9jnetN7yCDnRESvxt4lKux+/JzbCtNSWs7VD
         gUqw==
X-Forwarded-Encrypted: i=1; AJvYcCWvD8r7antwPks9BUUzATCmDsBrnyY81I7jd2A8eohDCEVGl1uwoeg92br3D8zR6GmOWG2yLvrztWfgi/XL@vger.kernel.org
X-Gm-Message-State: AOJu0YycuNAaPOam3e/OgzWLQ7waleb3XeGHjKNG03lTOChttKjqgSUi
	k7SrvE2gO+1LWwtMW10a1SpI4nPp5HB9HzkzknjGfqh3MLbcafoJFwQW+Pp7vBY=
X-Gm-Gg: ASbGncvg0rjpQmJ+cd73WkGib66jlL8JHO31FRmoNzjzCuOFfzOuQgFhRyFzIzerJyb
	XRgJGP0x1C2uwlPIiod0hnL6indb5Cli/7ncrv3IR5GN4ELbIinBgI7IOUOmv47bn0jnhRJBWnQ
	I/Vb+GLsljQX31B1jffxFqT5faxMc0fwd13h3NezA5vTaYipw9NHpWeHQ6jf748Hco4cKWfSyUF
	fcrUG9akhbUEWELWa0FPJ2cWREZJ4Kue3nqft2/q0/lkEDoV2mCeJdXTg==
X-Google-Smtp-Source: AGHT+IGYgTmfRaFR2G/p38hqO9FJGUXzbehvqrCJ6hjgSua37KjKCd2gPuOO6z8ID6MTBElDI3O4Vw==
X-Received: by 2002:a05:6512:3d0f:b0:53d:e65c:e33b with SMTP id 2adb3069b0e04-53df00d11bdmr8151109e87.23.1732931078647;
        Fri, 29 Nov 2024 17:44:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64a0742sm631946e87.261.2024.11.29.17.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:44:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:44:17 +0200
Subject: [PATCH v2 05/31] arm64: dts: qcom: q[dr]u1000: correct sleep clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-fix-board-clocks-v2-5-b9a35858657e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dSm81W8OxeK3gTXqKdadDd4ykcQub/N1yof6klx6nCs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm3zji8ysP4UCyVSUFXQNYuboVWy0jiybtvMa
 Vceh82CBViJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pt8wAKCRCLPIo+Aiko
 1ZKuB/42Y3fJ2gZdOCfRli2Ua8j6hXuPAaIHMdEnD+jW7pLFAr6VpHuA9ETSrl0IJ7cPwlD/TMR
 JlinKHMOQZDJJFY0XFZsbpNH6OG/CPD5hkBW8SOBqP+ENPcOB4UA5YNphR3SGrV6v2baJHhwbJx
 yyY40TSWwNNf/iFBFq4r59nXkNWD9BO2ws4ncc74gJ7mIZFIrCm1TdPFsWRJ/Huo7KGXXch1slc
 +TmutrSynN2fPh8nKZVLvoesQIBv4UiNmnSzxO5cmwdsCfKVqaE+zKgTkuCL1cYJHySwP5px6CK
 xAupWdrwm7dz2d24Pc6lpbwbVE8NADIv1Cb2epwoEHjheMLF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The Q[DR]U1000 platforms use PM8150 to provide sleep clock. According to
the documentation, that clock has 32.7645 kHz frequency. Correct the
sleep clock definition.

Fixes: d1f2cfe2f669 ("arm64: dts: qcom: Add base QDU1000/QRU1000 IDP DTs")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 2 +-
 arch/arm64/boot/dts/qcom/qru1000-idp.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
index e65305f8136c886c076bd9603b48aadedf59730a..c73eda75faf8206181764df4d1ea32f96c9cfcd0 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
@@ -31,7 +31,7 @@ xo_board: xo-board-clk {
 
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
-			clock-frequency = <32000>;
+			clock-frequency = <32764>;
 			#clock-cells = <0>;
 		};
 	};
diff --git a/arch/arm64/boot/dts/qcom/qru1000-idp.dts b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
index 1c781d9e24cf4d4f45380860c6d89c21e8df9925..52ce51e56e2fdc51c05fb637ed4b1922801ff94b 100644
--- a/arch/arm64/boot/dts/qcom/qru1000-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
@@ -31,7 +31,7 @@ xo_board: xo-board-clk {
 
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
-			clock-frequency = <32000>;
+			clock-frequency = <32764>;
 			#clock-cells = <0>;
 		};
 	};

-- 
2.39.5


