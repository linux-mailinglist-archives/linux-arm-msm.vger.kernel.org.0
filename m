Return-Path: <linux-arm-msm+bounces-35897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADD79B0722
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E73FF1F23D8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 15:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F5220D4FE;
	Fri, 25 Oct 2024 15:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RvBUHz3f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227BA20BB3A
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 15:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868647; cv=none; b=g+xVl2MKY4bPvM5JLnmeM4WC24ZRne0L7Z85oq8uuB6fiRDb6H/BDuwbS7i/RjdR7heuFCYvnfqTxDd0IjG3uSI26CHJdMRysGPXY7cE+1f6jwNrbleAJTlniWoxzwS5nE72xjcPUkwEd1N2cbh8w2FD29D6+9sqKG1pYHRQqlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868647; c=relaxed/simple;
	bh=1S0e8INDTJp4RQZO2xifYyW0FBrz3v2kT78lT89hhEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HSfOkUxmuZn+F9CH2vzL1N8jKfqmEmbDKRS+sUQ/4q8q4oZ4ZEfw2MIrcG+yg/aFRHOrUg6Cq5s07/0K32QzAg62Jk52rSECoYUaxf2gGlTRMy7DIbHozwWxnAtX/vkv6W0k9RTGbhGG/1xyLPJp4bUeM9HcJ6jDHRe5hoI3oSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RvBUHz3f; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so2312336e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 08:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729868642; x=1730473442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQiTcshw9Ox4It49mqmwWy0sWX4h7q2ja8AFVlIbjLQ=;
        b=RvBUHz3fjIK8uin38Zh0dDgIkbG4BBNFViWxn7EQqrfRbVhutFLSoewvieblVAPwrz
         Ex4Cvn+VgFd8v9blwIYtibJbY+2Da2yA1TIjTBgSUhvHQSTMjCN3EYVKP61SwuTb5Zcj
         fwimA8JrfOqRnEyALF2WND6MRozCYa7EpYBonupzAjWRfA45379eMdpXaoH6hpf5RVxl
         qIXHvzl4Y/R4cM7L6d8uPoDjN6JwZWQGb+IaPjgQXIg0PkH1TUZ3TMWua+5z0zeHSKoJ
         qIUZ0xe2i8yuSlhsg9IwNI7rXV6Q2A9r5ffcx10Bz4lGGccBDPkoc1zv+rf+MVGg0Vrt
         GC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868642; x=1730473442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQiTcshw9Ox4It49mqmwWy0sWX4h7q2ja8AFVlIbjLQ=;
        b=ez/obsEMUA3x7I3HsmQgQDrrNG3fYiXi1JJPRl6gFtW5j6XGHHKxLPIeEum1QFu2OL
         HiVxEKItN1w5isIt0H+1WjZQjlaQSrlNu7bDTz7AMQ2ftA04cSq0cS7Fu7ydXeS5DN72
         mjKtI/Bg4Nnixkco4kNXyzHguTImHByj6CC2tzIocZri4Fmk8U/tlThhGIypVYS0+LGB
         D27u/ALCV6LPm/x1po/fKbfvnzdh6weFFKC50hgyQ6SUOHnj2C3IRUINZz/m99MupZsr
         NQzQC/aJG4pWVJgqAGG2h5cn9yzjla2h8HQG8OU216/wwkh4VGFHU8aQEqZGDsebAu4z
         dTJw==
X-Gm-Message-State: AOJu0YwhZuekm4uVzcmFQb+Uq8NgTv9TrcnpE75mvT+8FFRSnXSRBSNM
	uj8IiOP6i628r6N2DzrgVVPYQhlEkxJ0LRmUpP0e8vBwvpyljjm7mlumO6bP7CY=
X-Google-Smtp-Source: AGHT+IECfUMNuij0OEb/viOuZg2ykGWBGYRB+L3RTyUW9yp9zGDcfJayS9bbOjvKw02U8IhZ8RCCuQ==
X-Received: by 2002:a05:6512:6c3:b0:539:e279:b3da with SMTP id 2adb3069b0e04-53b23df5806mr3956862e87.18.1729868641818;
        Fri, 25 Oct 2024 08:04:01 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a915sm209542e87.12.2024.10.25.08.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:04:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 18:03:38 +0300
Subject: [PATCH v3 04/11] dt-bindings: clock: qcom,sm8550-dispcc: Add
 SAR2130P compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-sar2130p-clocks-v3-4-48f1842fd156@linaro.org>
References: <20241025-sar2130p-clocks-v3-0-48f1842fd156@linaro.org>
In-Reply-To: <20241025-sar2130p-clocks-v3-0-48f1842fd156@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=1S0e8INDTJp4RQZO2xifYyW0FBrz3v2kT78lT89hhEk=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnG7NT8z9plW8KBjZXRmqz4/Zirb2WORwUh6Elq
 whtvHvwDa2JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxuzUwAKCRAU23LtvoBl
 uO6ID/0a+ucu8G9rRD/BvzGvMMamQmTfEZo6qDwDWU3+a+OZGpDwtCMrMYB+/D/Hu8GNFmCEBFl
 1OGOfR2VnHKO4UVVuLRAFIatum8YkT1vLjRk6iN6r+ci2plZx5KkenZsAHQXBrNgeThWDC+kClJ
 oibti16QVR8itcQTq1AxflFr67NHj2WackmXS4/2gTs0l+fcBJ8vkGT2UY5re0bbjdCg29x/UuH
 8n7MgnaTP52hKM7N8uBqR8trcerBbt8KW3ZN67jfsRUSKG08v7J3sxUuaEw0QCh2YERaCVVQqah
 tsY0XGGFGWU6W/1LhBLQLXph5qIOcvuqKYXg1T2as14PWm9NBIhJuhgNvyAY0mJIqvTqg25IdsT
 yI+R5+YQaQAzW/SkxINMdTRNBPd14+Fajz4kMFKyJzanbVPo3/Z13FKAcLWGj1BnrVhgJVgQyuB
 jak8teNq0RZrJVf0wuDwbvAynf4khf1Fs+3/gwM1aOp+9eGohIEGmsTlS2g1ItfdYAkl7uxOqtO
 j7hWJAQCFej9mMLGFtPEyF1pudMEDZzDvKOSUCbTCSJDwirFVLmJo049JpmLwl3jEySZmdRY54i
 GGAArelXcBcm4PIUD6oJALqnZpg1iOsYNBl/3ecNOju5WR/aittVdLeej8GbMhXxO/6jdydt866
 wDjvLKaEXoIWrLw==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for the Display Clock Controller on SAR2130P
platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index c17035a180dbf3dde715a281bc54165122739618..c57d55a9293c214c4c101902cdd9603074e2243d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -22,6 +22,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,sar2130p-dispcc
       - qcom,sm8550-dispcc
       - qcom,sm8650-dispcc
       - qcom,x1e80100-dispcc

-- 
2.39.5


