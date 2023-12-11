Return-Path: <linux-arm-msm+bounces-4232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E3780CFE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 16:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA08BB21562
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 15:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9566F4BA95;
	Mon, 11 Dec 2023 15:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kRblFCtQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83431CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:44:49 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50bf26b677dso4358266e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 07:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702309488; x=1702914288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSK6mZ8dw5NPtYdF0SRIR2pFCQDMWgaic2V9yiXRbes=;
        b=kRblFCtQ9E7dVNB4QULppxR64rUSx5msOMDbyZKv8a6BNOVfXdDupgVzD2gMPZ6IZh
         lnP4bTiuh+B5/Zxk/lcMTMLjM7S6XIynigdNk5/l9ZH/mQmHwDRW1WCLv81OqZQVvosV
         R2ZbjpQRIZYVTf0BNkkDNwjk1uk4wOVvGCf1z7iVyiPw+uVN0F+pSUjCWIsTKp67AH3E
         4KfmZ0ta60A50vqt4+2o0/TlopIoyq8S3J4UKtFLB+vWCU8n0UDP2wA4BNn9uiTQgzXu
         gxi2E4w51UbNPXlq9qzEzdAzQ3kFI6ZOdCZ6/ZYPchXBt44dqkeR46jjmg9u/WgUlKX7
         BOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702309488; x=1702914288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSK6mZ8dw5NPtYdF0SRIR2pFCQDMWgaic2V9yiXRbes=;
        b=lSLobhaUcwBzt7w6/6b0DQafWU9mtKGulGX/S0uUgLRNyMvK4QUY0PUa/uWsmHHLKn
         N0u6vW53j9Sz4u4IrnrrKUEApqnerxTLOVlMEtSXUU9k0vqGAxJSxMQR4D2D9XfSaRAd
         oXf3oE5iOWfkroeUKHJDbmh5mx1oAXLO9jESnpwTgQY90sfWbpPqEDtB/3CEEUuvPC3n
         wGxK4p3pum51rXhztRFcQi1b0hqTgGL3HtZjtIxGEAj9MMlyw5Vih+6WXGLvRLHHZTuS
         6e9gMJ1ZCpQ98NP0UYo2CeSYq9X7B3jGRxO7ONrP3dFsFn/znHAy1iCtrCi26VAuDVhy
         lgZg==
X-Gm-Message-State: AOJu0YwNbnPwScwD0bJnl8Mgg7QIywidVNQ2IzhMmd7OuIhHE5eAbNuh
	djZBf/kECT8m1TPd033qLDrGlw==
X-Google-Smtp-Source: AGHT+IFswBGhPJF8OSSb4EYKPIsJHib8hdzLokZ9b6fqCBPavnujwJZYpKaaXCUUP0UheLDOZEjz1g==
X-Received: by 2002:ac2:491a:0:b0:50b:d764:290b with SMTP id n26-20020ac2491a000000b0050bd764290bmr1115916lfi.163.1702309487906;
        Mon, 11 Dec 2023 07:44:47 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c5-20020ac244a5000000b0050aa6e2ae87sm1109646lfm.2.2023.12.11.07.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 07:44:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/8] dt-bindings: display: msm: dp: declare compatible string for sm8150
Date: Mon, 11 Dec 2023 18:44:38 +0300
Message-Id: <20231211154445.3666732-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for the DisplayPort controller found on the
Qualcomm SM8150 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index dbe398f84ffb..f850bd9b8263 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -28,6 +28,7 @@ properties:
           - qcom,sm8350-dp
       - items:
           - enum:
+              - qcom,sm8150-dp
               - qcom,sm8250-dp
               - qcom,sm8450-dp
               - qcom,sm8550-dp
-- 
2.39.2


