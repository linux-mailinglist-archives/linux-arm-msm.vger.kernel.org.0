Return-Path: <linux-arm-msm+bounces-20830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9418D263D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 22:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B0BF1F2A265
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 20:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3924C17F37C;
	Tue, 28 May 2024 20:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I4f+aIH3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746C817F371
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 20:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716929026; cv=none; b=UzW48kpn1nGoXNVLdqAz7PoA83FlyjEVBj83VPoDJgevl97CrwGWM4+tFgJ9dS3eZZLgwsWYl6h/wioLILLpl/4RxiHCYNU23ZkOGy9bUgJXTe4Ksb9qoK970OF0J6I+GzEXT4o3bY6VKpH90yyrY1T5s7WH1VTdzln1aU/03bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716929026; c=relaxed/simple;
	bh=XAt6DL1VR9hVvuY+93ZuaPQtdbqMKNXUv5SdCXSc/Gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V88v5FbVaYimknW+/0pjOFtuibWQL32BVrdkAKs1PtSzvD15KQ50moWHXyRd8/qrZxIcBH9tuQDhYtltZTNDchJ7B3HMeKDcrNj2TtgIkBH6XQ8Opnbphlf4fgmxkSwMiyb1e4JRuWQJ56xhX2U92fts9weJyWJ16wmL0t9CMT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I4f+aIH3; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e96f29884dso14015191fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 13:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716929023; x=1717533823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GVQnFMigylZLrd8REetB+leXaGU3JW+I/8fg5hchdrs=;
        b=I4f+aIH3WHcujX6YhNFZbekE4zDsltFYSOJ71pjggPD3NiKIySNY645/0VnNqorwbD
         WCtg1LIK+sogdi824GyTXR98zgIsDPDMdAyngRQeQnIIX0T4TZgrcVZ+Y8HvbsosfYMQ
         i1zj9WLfuDTRFEEcYDQ6wSdCe30EZrA5UqP0BfbZNGs0gkQrklv6nvRkkBtioSsXmJz2
         e4FgCeJQ59O62kavxCl5CrLsOo4laeoO81Y9clEVAdupS34nNWzrEZgFsdwx+XT0+IxG
         9Bm4FzA2x4OXV1j7/v+4rJ2Tjfwb7t5Uf0B31ptwK4bIysuodc0MMr0jPhOZ6ZVatwma
         gX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716929023; x=1717533823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVQnFMigylZLrd8REetB+leXaGU3JW+I/8fg5hchdrs=;
        b=LeUbW6ADolHl0TS8Y1tXMWKjV22qeixTs21l1Vbv6MQBKvMgz9syBDDLQOXXmUc2t1
         lXZcGr0aZKQeWJnv022ed8rS1SiiWv94/GzK2hX0rTeq0BU4+IAt8dG5rnjaRZi5PTfb
         lJEDuP5wJ5Y5G+2kz/9nMgm312CGOrd7E8i4lS3b0D1NKpjuiXYb5VSZgBoi5Ll0Fdxs
         3XfEE9AjNU1rP/VpWWIs+NGiC0XpThfCZi8uBxmIkXski3TiKWWTDPCIdAByGW8wRwm9
         V3Ho7qcDKbllCM33zIBCcunhvCU33n7afzytKwOonUUtRFQFm6+djk8c26kZQFKm7MD+
         vNDA==
X-Gm-Message-State: AOJu0YzSn6XNSAi7GkRpGy1NrK2xmZRPQrNk/TjvyKOBrZhrt62XH3zc
	30Pm6iyHIVv3j/E62PwFTFz4Yr2URj7tfWB1YuflXufTSzoi45+yP0gsnNqp3fA=
X-Google-Smtp-Source: AGHT+IHVHeajDHd6qdd5x2UkgTcqFj1SHcaLWQAgJMko+/ZSGPi7u3g15WtZS/u/HbbwXNVpy/GapQ==
X-Received: by 2002:a05:6512:398b:b0:529:a2d8:3009 with SMTP id 2adb3069b0e04-529a2d830e5mr9339701e87.43.1716929022838;
        Tue, 28 May 2024 13:43:42 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b885sm1095493e87.127.2024.05.28.13.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 13:43:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 23:43:27 +0300
Subject: [PATCH 09/10] arm64: dts: qcom: ipq6018: fix GCC node name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-qcom-gdscs-v1-9-03cf1b102a4f@linaro.org>
References: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
In-Reply-To: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=759;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XAt6DL1VR9hVvuY+93ZuaPQtdbqMKNXUv5SdCXSc/Gk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVkH1LSiwgdumsgN7GI245iREE3NREdx2ZgLHa
 1ME4D/iDMeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlZB9QAKCRCLPIo+Aiko
 1fXxB/4+uShtyPhphN66oTyjSctjPUva1y9XMTYRROE29RtE94JE73NbUtcMVJJgOE1oDwPnP+D
 4liFSdcWQZMiUHO1d+T3wnem84erFzMt/BqiJHrXXI5w1MT95sXL/bd2uj7ksVWz1VmnHtDaiEb
 lXmwH1z43/so813V2L8Sl02GILAE2Gp0ePwla2E4e5UJPQEIKMXRBLqVbm56cjP5E03TVL1UctL
 zC4H+ig9J29WM29ddZ9n4Zhpdkq3+lA3DtzKrqspPo/M6Tcz3hjHf4m3f4+a37C03J+ig5zZ9Vf
 XvBIAtPFpTH/4m0x03evWqXw5/89NI7cuPP4yXRDC7woES8K
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Device nodes should have generic names. Use 'clock-controller@' as a GCC
node name instead of a non-generic 'gcc@'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 17ab6c475958..a84cf62d843c 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -396,7 +396,7 @@ qpic_pins: qpic-state {
 			};
 		};
 
-		gcc: gcc@1800000 {
+		gcc: clock-controller@1800000 {
 			compatible = "qcom,gcc-ipq6018";
 			reg = <0x0 0x01800000 0x0 0x80000>;
 			clocks = <&xo>, <&sleep_clk>;

-- 
2.39.2


