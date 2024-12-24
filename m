Return-Path: <linux-arm-msm+bounces-43232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AEB9FBC37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 080581889A08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F541D935C;
	Tue, 24 Dec 2024 10:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lzlQxLnL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDA11D90BE
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035455; cv=none; b=dQ8DlbxEkFRSn/4iTzSvnWqh0lFCEZmKFJGcc2CZAwnrVFqVS1WEJKTJ5OscbTrhej5RbnhC3qw81fJeYyRnR8JWF6Chwid8qWsOihWkYMW45NvokD+UmT6b7IsVXa617CEorpqD+Q6acJSKSB/yUU+jPclk3C1gn1li9BHLYHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035455; c=relaxed/simple;
	bh=uDWgj6B6z6pMSFBL1pDRW22fgNDuN+DRFtZx84ZsB8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TmKXbic0gg+QM7VNsaqMIPY21hQWSzioX7kF0jmYzJiwChtAlrSRaDBWGtUyfgv/R/FaU1+NUhmPIdSoR/JmHHVPWuiVd4F3sVxKZbbxfOreXL7Jdo+E4QoVyKRzq41KbKIKDIjRzMEo43XJGy3Gyue+1A+T3ionMa2mLUGRHT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lzlQxLnL; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so5473364e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035452; x=1735640252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxVAhSI1dX8Y6W0tSBQjxOhCXgzeLbOBHuH9XXWIbIA=;
        b=lzlQxLnLNnRaLC2hKSESyPAg5DNWCvpTTFin/vSeK2k+tXprE64WldGivvfaDeGcUJ
         2ZPq8w/K33HM4y006hnIizssuQgi5i8tYxNEshRtnTO+UZ/ufVWj2/vQqYUo5PvRbF39
         31jb6CfK7ej6qDnl4NywENKLM1vaHg3Xp3XcTzhykOcqTTOksUoYEpTXriv5jypSOChC
         tS/fmAlz/1TobkitNU1suVooLtbltUJus6M8IWVsX2iBj03H5xIWqRV6xLuYAxzqg+Gy
         i+Poaewzadj/HnrqzBFB3jq3viSgFIDC+ZSwD8kw0hNxNTTcf17ajiKqBPABZW4HlfdS
         6Jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035452; x=1735640252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxVAhSI1dX8Y6W0tSBQjxOhCXgzeLbOBHuH9XXWIbIA=;
        b=gk+uBhHzf1BnATch7Fu/669IF8DCepiaiDcdFkl4dlzqJWq9i71RBr+FhzjmAr3rc1
         1YeJd7Im8ZmwJqLjtGbGep5mWrCztOXkxxe7nr+qzpd15UScGvOzfElZOVtuAiqb4qbk
         bj7S3MnOcv90DmAkQ2jBbF7+Q7PuSRY4Vgmnt/pkhql0sXig0qagHWYbmWL2mclau97w
         0jZ6dwwNqzo7cj0LSkBLXimia7FfHrsnMgDM8Ujc1AZolr9fqUZmZrX7c254JEDU6IJP
         xUjBkY+fGobldeQvu2tHn1U9neY1RRf9APPh347f2gA0MO/VxT7XWe45AQML7j9ywxPR
         5ILg==
X-Forwarded-Encrypted: i=1; AJvYcCVl+g4x4L+sxxR3cJtq0LC6dkfIlYxEv0LwOzCAlmHW/7EXe6LR8h5B2FWogBjuGLVCO2eiutY09BW0tO3Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4A2nAoXH6J6TlUnKOehdelLE2yTCufFecsJotNao8q3O/6nZz
	mSmSzFxljRiHTmuejUTOGPavDlzG4e2CkYjTcBlXcg1ZmpZAruggrYhwvRAgVck=
X-Gm-Gg: ASbGnctB0GrEYikrz2tCgPCRrIWOf/bF2yxJSy5E1mxgIpYL7je829jG7DPA0oC0mt0
	cuNO5iwxAaIZTYGwZ6EyzhkFhJXLt9fOgdhEldaEP7JwDi/Z/WUR3vhKxAwCadGPh+XNwELwFER
	iIJq38H1ozJLFSFBMUSrhTTwQd0kGLJE2AH4xesuEJ8Kp3Zl6lmTp+RY3onbvuLj/ja0AQd9aHT
	80cLuSCDqE9DKwv8Ipy+OqWMlGZJtcxVOWvv9h0D9l6+Qj8SJ/xQ3ylT2+xuxg6
X-Google-Smtp-Source: AGHT+IHuGDvLVZ4PycC4JPwV5tOsJ2guIGpOtjugHy4Znfe+TKUvWd3SKYfFFt19eNjo1TR11JhhTA==
X-Received: by 2002:a05:6512:308d:b0:53e:335b:4348 with SMTP id 2adb3069b0e04-54229582541mr4399202e87.40.1735035451945;
        Tue, 24 Dec 2024 02:17:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600596sm1576865e87.92.2024.12.24.02.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:17:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:17:08 +0200
Subject: [PATCH v3 09/21] arm64: dts: qcom: sdx75: correct sleep clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-fix-board-clocks-v3-9-e9b08fbeadd3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=905;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=uDWgj6B6z6pMSFBL1pDRW22fgNDuN+DRFtZx84ZsB8Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaoohP7h7cVtctxfPbj16fMwxaYEJ9+KmTDopH
 Hz5PDWg04uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2qKIQAKCRCLPIo+Aiko
 1ZGRB/9DjghrTVvnNixgMSDWg3D+uqLGChXSkcNOrjhQ0OKlYH0TRaX8xbW35/u4NOYe3FN4+Im
 zrCE5ZxzvTPy2O2+NuHHss7W8X+qSG8Pr2ZcoZzlE/wW+nwl2Ecui97DxNSzCzOTOHZ1zJkOgXO
 uu22n2tWy8zQlrtZHQJPuFu3/gS9/SMjV+XD3wQ4L6Mkhtzbuen1caMIz+Gklm6erpaUp25YJ5a
 wZQeSCVPYdgeDfj3jLhBAv9R2Znui3VMkIZxKCuDo/mfhhEYld1jjSqBI5nmgIM4s7/YFr2hFXI
 NfdjmjMUZ9kNhHiXhXrGxZdyf/qvGXTZZiltQMJ9ovUMJkx7
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SDX75 platform uses PMK8550 to provide sleep clock. According to the
documentation, that clock has 32.7645 kHz frequency. Correct the sleep
clock definition.

Fixes: 9181bb939984 ("arm64: dts: qcom: Add SDX75 platform and IDP board support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 5f7e59ecf1ca6298cb252ee0654bc7eaeefbd303..68d7dbe037b6ac49c746171e8dabd416c8813a38 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -34,7 +34,7 @@ xo_board: xo-board {
 
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
-			clock-frequency = <32000>;
+			clock-frequency = <32764>;
 			#clock-cells = <0>;
 		};
 	};

-- 
2.39.5


