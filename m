Return-Path: <linux-arm-msm+bounces-43227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE819FBC32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A014416B49C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A65E1C3C19;
	Tue, 24 Dec 2024 10:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S14I98az"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5917D1C3023
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035443; cv=none; b=COVEgJNCszdKkc9/yzD7hs7T7jOqDRxlgdOlhgCu1KB7wtvrphb+KgkRgiilBfAttqHjh6QGi+n6j/4fdQv3ADXbSImp0jsjI7Ce2X2pm+m7xN/S+4J/gHMcSeeUGR72UuPQ5st7wY2rUNEE4uWWG41W0w3RJT2fhNbK8fxLP+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035443; c=relaxed/simple;
	bh=rR33tk4iShQizxX1vNrKanPGs6fsj3vgKiMhLvDMp+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d8QetFJkJvjT3URkW5i83FZodwnrpO6MLGOahC7lt+5P8lbq+w+BRieg3b4GblMN/REPgvOSXeC+m4E3Kj/8S26zY/hGf7cLurHWe1CYTYxNrdIU+7ldgJbMcPiJ4+XErOWQiRc2lQ3YSTQ4JwoyszBH7tn/PHrzrOJuNwiseA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S14I98az; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53df6322ea7so6749170e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035439; x=1735640239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enlHR4jkuvtTrE3pGjdSHmUxNqvLGDczVHxXmenPlOE=;
        b=S14I98azOpmmLgC8Rg4l80LmiBhGFYS9k9hEurE8UqddYrhwfAuH2+XtdajrY74i7A
         4lONAAFTGSaQZ0BIzOfwCITNUv4t70yT+QUtbqlq4BN37/SuulSvK1LTuPPlP1gImo6V
         4N/tqSD4eRejXkemD/Sv010H9YGmb7zR9u2hgsXhJF7pIoEG04lYjxt2E+oLKYwFj3A1
         NHUpmxlNF6RTZeTnIV/kwNTWLgSFub7WAZNKm4Y9HrK0zvLobSBKQ5oTu4arPSD5Px7P
         zsWuWwzK6GuUeWyY/aevduwaSTljaoX6/5Dyj2cm4ZHj2iNk6+16JkmX/D9UefB00roq
         xSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035439; x=1735640239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enlHR4jkuvtTrE3pGjdSHmUxNqvLGDczVHxXmenPlOE=;
        b=WwzuBoDgadcqfdHFSaqk2DZ11ia7/eXL2d+cFg+45IC5qf2ypBiJF/roUY6WEsYTlm
         X27bdtmr0+Gz/+rh9/Voa94QkH+68gcoaywSaUgRc4C28VDMpzR/wWeB/g91aJsyK3IS
         xtFIlDb0TTPja8ZIwJoSlf/HZhJoKsuT80PlFBXaLH57xIXMeXKY+nVSMNyJHXhKI832
         TueCbJafx0T73pAhulCxgYpMQIrsj3kYjkm7ARHcNvaMjh3eNmjVsFgOtuIXe3GV/+JA
         5wl9HlfRfUWK+dheMwEuvUeH0RGvAteVb4Dqoryp5ni739REpO51+efA3TPwHr8u8RPZ
         o2zA==
X-Forwarded-Encrypted: i=1; AJvYcCUb5PtFOYPmV00BwyizI7q7mWFGJFAUZRgNviNz4bzOgcN3BkWoNhdMKGP0XCGkHcuDq75I6dWYkga1HBpk@vger.kernel.org
X-Gm-Message-State: AOJu0YwL69SiCM5O23uOvDZrrTPDjmHVaO8iFMmidHTH8HqwoTsatAII
	pveGmRaxToz56+2W9a2cZn4+kak5fsUMpprrqsl+yDRBdp4bltUjIGbji/F2jso=
X-Gm-Gg: ASbGncsr+6B0ra2bqfo3/1+hblUi4AsInpd+mzO+xsf3c7+eBmLSJuDmg/XbGhscRxe
	wkdcstWub/IfhAgV10BDRrvTlkyCemu/zeVcAYfSnGbe4c4js4XfVDiWQ3mKKFvn4XDUQHLZuhy
	sq9bE2Y+WrgTcIxB7O89SJsORNeyc6JCsbCTFgrAAUbeXJlFwX8AsTVPw072KfWTmweTBbdahUj
	MQICpsc7F7NrDUQ+cKp4+DvUIoTD43sCThOu0kmeMyrTcpBEoLOB8ohNKhPb3Vb
X-Google-Smtp-Source: AGHT+IE33j3OpeC0LkiXMY0BcJ0AvVK/vaxCUQ0afwTPn7x6Hqln5Sa+mOdqOulhAKpwASXBmZx8qw==
X-Received: by 2002:a05:6512:3994:b0:542:214c:532 with SMTP id 2adb3069b0e04-54229538b3amr4679142e87.13.1735035439554;
        Tue, 24 Dec 2024 02:17:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600596sm1576865e87.92.2024.12.24.02.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:17:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:17:03 +0200
Subject: [PATCH v3 04/21] arm64: dts: qcom: qcs404: correct sleep clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-fix-board-clocks-v3-4-e9b08fbeadd3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=910;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rR33tk4iShQizxX1vNrKanPGs6fsj3vgKiMhLvDMp+M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaoog3M3tf/lRnSZbZqYVXGhcJ9Mz4IIqFzU/2
 yvOKOtFgUGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2qKIAAKCRCLPIo+Aiko
 1aHIB/92B7+zTKkPhCZGUgVU9bp3zlKJ6Y89KZJam7RR3HqsFXnbCN6mxbAcP8WwGFI0bU599aq
 tHOP55sigjWQ7Rg1AS4x4XffLpDy8rhEqaKCsWy9/iyiZWK/DZs/FGIUf6Dw0wt40fUmdgj8+1E
 Yga21quoiQbtMdjZLitZavhVPS2KjQYLtpEJ1//iTBUvF9mutXT9YORJX9boR+Pyw6l1aX7zO/D
 13JXojC4YTynRvdbDvXWutWziFjbI4PTXNsHnuXLJqKkevF4Mf1tCew3zL+HeGaUap1Mf/mTA9G
 hXGkM/dY3MCHpappNoCGt0ehMmBYz8UZ1pOoHCOh93JRyKe6
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The QCS40x platforms use PMS405 to provide sleep clock. According to the
documentation, that clock has 32.7645 kHz frequency. Correct the sleep
clock definition.

Fixes: 9181bb939984 ("arm64: dts: qcom: Add SDX75 platform and IDP board support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 215ba146207afd25128692781926cf1964743655..2862474f33b0eab7c42fa2b22006f580c567ad2e 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -28,7 +28,7 @@ xo_board: xo-board {
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
-			clock-frequency = <32768>;
+			clock-frequency = <32764>;
 		};
 	};
 

-- 
2.39.5


