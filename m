Return-Path: <linux-arm-msm+bounces-39659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E94D19DEE2F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 02:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B075B230DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 01:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574A019C543;
	Sat, 30 Nov 2024 01:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OeQilQOW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8322713A3F2
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 01:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732931108; cv=none; b=Zh8cPdR4Cqtx0nNILooulC+HRLE54oRmID9wIzr964d1YTJjXjxYAI8qZJH3v+Zk+lTGRLA1Q6/EeX6BWU1+h9svi4netUpXtJxJMT+AUNmJ/9H3FvuLYq2e2lYkYRzl9g8q93pFkgjDdzktAcPNVrBavFrf0pFYlFhQPeEoz3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732931108; c=relaxed/simple;
	bh=kRo+lLE1W0MzRHuVjiZ53lpqFjRc/n5gL1+u9Wg23vI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kq7/j7fDuMxJ+ABy+j74YcNbEAbgMhd/qsz4kAEQScq2vfmnvJOhne/0tyQZGG7HaFDpNTNyKL8xCOlS9LcTYp0328ouFqOKlpDNIhbNFLDIcqmjvXt+4Ka+Kpxg2QvVyK6rFa3IwQGSTwGzkeeumV3BVqbAryf3exYB+5BaZ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OeQilQOW; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ffced84ba8so24409331fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 17:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931105; x=1733535905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vWJlRrn7HaBkpMiZ8jEbjKA4hpcZtQM8jkZV0zeKFag=;
        b=OeQilQOWm8jE5BzOKNtAUzi+Em7fcCuTKcBFP88sjXc64qRAKFThW+qM//lSqNr/ou
         9z/f95b9UlbndyNQg8LBUM8VAARNaYYpV46s+MVEyDItGX1eaRNwTGcoyF6pnJgG03ZY
         omGk1lpXK34WBVNC4UBYuGcZPdog6+YaLy0zcgwk5Rx5XEdplGn29PrCTDyJST8+vmM3
         KSyY/6zuMVylF0y8kABWusi6eIAs9ob0XwvlPiz0ImacIavs0xibVGNZVuR4edeoMeE8
         WQb1YxT5BApOvNMCYIG6WGtWz1pb7D88TsnC02RZFqbBDUS7faAnMMy7r54wiw35gyoi
         3SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931105; x=1733535905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWJlRrn7HaBkpMiZ8jEbjKA4hpcZtQM8jkZV0zeKFag=;
        b=sBuuxJPON4L0ehCnoyXoRhHf1H1G8pSmVaokrBNBUh8k10FSDovSN/I1fb1TwJYpDW
         g1nQCQzD6vZJqFrtAfCLvhjwE7XiRlTZAhNyWLl5IXmRwLRWjyTwte07a/2cB+mQS4VH
         djOy3bFIQeYfUV643txnsjYihmFB8l2i5sfdIqZNfw2jTHmlXu0QcTctUh10TTN+DnN7
         4NrUnBDFd6p5OHXQGpRA9dtDaVzJbvV3ExwuCSMVeXjFbDOvVE+rLRubqS0t+ZVEkUqt
         t9BMM2RkRXrtqKr70eP/bOiLNwjjWnBmLuP7TaXbGV5x+r54BVsI9ZT/nq1nF3/Hzke2
         5+9g==
X-Forwarded-Encrypted: i=1; AJvYcCUjtu9gqkprN8u/IUstuOqBSRJ+JOUPZDRh6BnyAS4bxXRkd7zI+uj6OMxea7ibRN+5PzIz+UrlR3Wf6ffV@vger.kernel.org
X-Gm-Message-State: AOJu0YzkgNU8HBLcbxe/yhdy8fPkWOZ+M7XBSD9QB9mcfADh32zwszaR
	bm7KRPOptff/F55SoodnxxVx1gqIuvem+Nauc9gCxJa0/gnMtC4NEGvWcdGd278=
X-Gm-Gg: ASbGncuuobMZDskIFl6LqYl9N8+z4yZG4C+u1kY2hOxHMhmaznk8nRFULh0Kp+0MSoS
	qiGOe0LrR4TsgMvtEn++NvvZET44eiDOcA/0NUgyZ/nManH6AsakYNJfRmdWELzRMRxI4wNo4HP
	4SOmorGwr8i8mgj6wP3zrRlPP+5RnRGbn8jaBQJVuUBZMkxiFyRO7XvDlMm2UnjG6/ihoxtwzc7
	Io5U+VY0ENA9v+feHoYWX98GSzq8lRbrcacVmq2IZxMbKnBENwdtFXE2A==
X-Google-Smtp-Source: AGHT+IHtpAzMikEAK7LIlcO0JKtu8SItRJVZ6GzYK/XMB1Hrlh9NqSRl9WgPX6B73s7i21+jukDupw==
X-Received: by 2002:a05:6512:1249:b0:53d:e5cc:d06d with SMTP id 2adb3069b0e04-53df00d97c0mr8785917e87.27.1732931104656;
        Fri, 29 Nov 2024 17:45:04 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64a0742sm631946e87.261.2024.11.29.17.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:45:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:44:27 +0200
Subject: [PATCH v2 15/31] arm64: dts: qcom: sm8450: correct sleep clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-fix-board-clocks-v2-15-b9a35858657e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=891;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kRo+lLE1W0MzRHuVjiZ53lpqFjRc/n5gL1+u9Wg23vI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm31ZCubTdxrQSYCqGPtgwvvXuH0vanV5BbkQ
 E+EKRfB7JmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pt9QAKCRCLPIo+Aiko
 1eSBB/wKjVAzUj5M6b+XByRsvi0UZPlpv5qTLjszhyTKQzXl2fkADYu43wP5syy0QdmbuQ9oV9f
 Pk24fHsozeixUuPa+Z6EvgRX83KZiU/7t9t8czMg+tvMIzv5BtW0aXD3GwGZ55ure1p/UpNygKx
 U7DZrgFebI1njHwsrPfHpsH73HqKw6WQsPS5iJ2j4C9pd7VkanjsEcGzZFgxzrYEm78cwINl6Zz
 /tJc/vKNrB9bIVGKVX+vJbotSAj1ky9FNTJAXzQc6EzhqfT1JyqDB1JKqMofM+EARBprGS8BfOp
 G5mv4xPQba21kxtcVJsJM0ML9/me3tQ/1n1hOmMS6RQeDGoV
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SM8450 platform uses PMK8350 to provide sleep clock. According to the
documentation, that clock has 32.7645 kHz frequency. Correct the sleep
clock definition.

Fixes: 5188049c9b36 ("arm64: dts: qcom: Add base SM8450 DTSI")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 53147aa6f7e4acb102dd5dee51f0aec164b971c7..7a0b901799bc327b9d31bd84e8a00fd62b451596 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -43,7 +43,7 @@ xo_board: xo-board {
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
-			clock-frequency = <32000>;
+			clock-frequency = <32764>;
 		};
 	};
 

-- 
2.39.5


