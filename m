Return-Path: <linux-arm-msm+bounces-35894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC3E9B0713
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3346280ECF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 15:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A52A1FB89E;
	Fri, 25 Oct 2024 15:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B+7f2XCD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A66918870B
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 15:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868639; cv=none; b=Tygtmo4VN6h5DAOZtrZI4n2T1DTupyIwBwaRHJb7B0oppFU9yPBK1gMWwrhyuZKXiu4buyjSHQFLyQ6H7JsogqLiJFfqSmKCy2y5kJN4IjpUmoAFuQfEfCZv0B2BHqZckf8RcAbZ1hDnKSP+2cm/IrcYmDxKhCxt/LfVdO3X/ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868639; c=relaxed/simple;
	bh=xfoORnG7BJgpYsszuYcVMwpN0RRab8ojk9gSAD6d/zQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kZ/uZzW1whoCALk3ABvZdOWjVlIwhf2qmcEkDpnFXzRm9VDFL2Vh5kO+bcYs5mLgRA49bTVm6nGLbwbY2omW/VjcMKKfAdujbEOa1BMfywhAXu43CfD4d9DHrB41HkqTLbiCpdvU14NdyoznqgWbD8R6cZq3Vk9XqDxOgMeumig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B+7f2XCD; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53a007743e7so2662084e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729868636; x=1730473436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBMgQWjciUW4UHYAr1mygReqy4wqLPHJvE0xLDCFl18=;
        b=B+7f2XCDbXC9VkLlCJO7eOhlicgVIzWbgaaNbeF6kT6fa6F/QbcT0jH9GnojaR8tKC
         H23BkqduDUVCkNV9dPUe4i7GbIAtTX/JDV0GYXIk4sDhAXbIM85Hf9V1CXH4sWE6M56p
         L57di7/7piCyMb/AoLhZhodRAx4tZC8WqZ8K4DbK5n4a9ADWqL13Xqa0XKW9AHyU9lfM
         S2b1l1gT5Sb6Z1ec7iebACFkD7QDHTg47eyo8yLGubKxf97z0jDI3xKuRre/QfbiximM
         XWOa2huxBzcgaM17AuEB+4BuicGuK3t/SjreJ39AposWO0k4+Dkh4XseVsOjBQnS7JGZ
         kAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868636; x=1730473436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBMgQWjciUW4UHYAr1mygReqy4wqLPHJvE0xLDCFl18=;
        b=XTmVvIHewcFAqZ7ANGrs0nkAi1L/qSeJvM6QoBoxqu4ybeW0Lubm3EX2I9z24Xv65g
         M/lZVofcvORWvcvZyK/gXfZ0M2KfIsQKFXKgrz5iFE3vn6Xdf/dv4vHmDdIgmbbBGzLZ
         WpK03KJtDHrmF2ilYsv0SL0mmcneI6h2EIeLbGjdnkWkMnvEWGejEXgPWp9dLKSKs1uZ
         Bc/sudRnJhLTtGuFQ9XxTpEjoART5QLkAJloCRlz2i/8aQvR/ka83waM175YFdEkh8xT
         eCXsGzqik9MBAoeRBRYuVFw+7l3v2WnKHPxqmj7FIuJljGWMMQ6j9PrhL/Xt+9vRmVy7
         kpFA==
X-Gm-Message-State: AOJu0Yz1LoFiPeMgMeXB3sMhCUwUiLsuNF0ieCFXEleakWlOUVm4jPQ7
	ZGbdW7pxgTGnH9HY/EIAwPHyd7zzDk4NTqWK1QjRgP5Lw3VmiTpVcCiptEZcvtA=
X-Google-Smtp-Source: AGHT+IHw33o6Q6BEaMaaqtnQ0f21ONG+7koUkJlYb5gDEIHecgviYqz+I+hT7AyKKDix7j48FckOaw==
X-Received: by 2002:a05:6512:2344:b0:539:f8c7:4211 with SMTP id 2adb3069b0e04-53b1a33e6a7mr5295180e87.26.1729868635566;
        Fri, 25 Oct 2024 08:03:55 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a915sm209542e87.12.2024.10.25.08.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:03:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 18:03:35 +0300
Subject: [PATCH v3 01/11] dt-bindings: clock: qcom,rpmhcc: Add SAR2130P
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-sar2130p-clocks-v3-1-48f1842fd156@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=907;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xfoORnG7BJgpYsszuYcVMwpN0RRab8ojk9gSAD6d/zQ=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnG7NSkS5DbNLl9SXHQKahpCgXEmSAddeHRTCAY
 OLsGm3v0nqJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxuzUgAKCRAU23LtvoBl
 uC1+D/950ATdnQeApqf1ew/BSm4GNQ8lbW7sSMJSXhEJZHW9UumPK01hVEcevcI3+XsB+rbQdOO
 xRiQLSSyBum7A8r6xoNcVU7FGqBhA0v4w2uhdRN7jFDS5ml0Ch9FL6XPgngmclkk3BZUYUg2Vqd
 ScksYYHqjtPq2HjDylgVdb99i1CC3Y4KIQV5x6BM5v8YcrZTcgyR0+DRvNOe1auo+ZQ+CwOoNCJ
 wKaEzYHXUtaZKfUs1GzqyqXe5Al0scWORygKzp5ZksjRfoU3BwmEEKlXOFN6IlNs7Mexkl4elSi
 C3rRH8CcjPzYKZzqgRWq4NlxdRWjg/+INj/y8/M5YIn/XBfkw3VNGx+BU3IeAh9kf11AUxsQdP3
 hrAB3UwNSbm3iPNmqLyls4k3gRgGkOAEPdmsHjif4sBDS+aLm7cBsRHZ8D34jlV+lvt9icrDm0O
 lyc9LoCJCHQGawojo0Qk64PZDCXEqrxSwf6EWATCL16ZUuVTIliPemz4lTa0ETUuHcFy1soRHq0
 ZEew9pz+3CNXzE8fNgsCQdw819skQkp0qG+F0fdUa2b4mXhE8Q8v3DJEmIFmIsRGJJW9S8hGiDB
 cTfQr+7JMVHET8qGpI1Dgp5cgsgAwAXOIYYbUbOHyVRECNQul21cgoc24VNMybTuiuU/jFiWAW2
 N51BhYYiQAKfsBQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for RPMh clock controller on SAR2130P platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index ca857942ed6c08cd4b906f18f6a48631da59ce9a..a561a306b947a6933e33033f913328e7c74114bf 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,qdu1000-rpmh-clk
       - qcom,sa8775p-rpmh-clk
+      - qcom,sar2130p-rpmh-clk
       - qcom,sc7180-rpmh-clk
       - qcom,sc7280-rpmh-clk
       - qcom,sc8180x-rpmh-clk

-- 
2.39.5


