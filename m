Return-Path: <linux-arm-msm+bounces-20165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1458CB4BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 22:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E9A51F22BDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 20:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A02E149C74;
	Tue, 21 May 2024 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FzgKnagN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02EC55C3C
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2024 20:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716323453; cv=none; b=LWNNqoakBmWmHIuTVozJottGQGEitssIHLMgSDw36s7Jj7NzhaUNQsJ3qy2svGftYXsIiWHHs4VvBNtHMD+X59ZhatIqg0eochyLNqTIbMsGspZYXjh9qG2N7m8mn1ZcCDTKWV8M28LzDlNi1a7vlhnrjuowUD7uMT3uIYF46JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716323453; c=relaxed/simple;
	bh=mMkzAyWz/qVN9O2XMqdjyNpMMewXubKPHRJ1nIx25Rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EsbelJEej5ySesVOn9w5mUD16HUIDAagGJa9zV9XNSkWD4mu8bbw3keXPruSAlpVRV050UbXXnfYB9NSAbfKuNKiRCQVoP10Vs5L/alDyL52V93MxM9Br0jXZS6RBKVaoO292stpEe+7MVpSaIrwveODTXbHixtdy5vyzWsGoSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FzgKnagN; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52449b7aa2bso2995422e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2024 13:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716323449; x=1716928249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pp0wgsOf+otlTEcxeglIqsX7pRYpEdZKxDMC0pyUGd0=;
        b=FzgKnagNn332CgOgZlxGOZxxV4fDLxEM7R4iRSH2GsI6kZ50HFodr/ELTEzt9NlerI
         9BopCnNit6OmxNVGZoQEdhT8eKoB6bv0cmtIOElQR0vi2aVC2MTUP379XfI7XlpK1mYE
         AY9AlVgNnupjCf4cvjGJK5igSg6USlHBsg0/kj+qeCQI8oGOQLW7clAl+Ga8KIjHLNAw
         qgTI2odD3cMCQ1l+sUn9GzaYzHOZWp0cy2pX+YZgA21/7bWWvHecB4/ORr3gRUf3tXiQ
         FG+B0QD8hoC2Z1iu1hjADLROnR4229G1V6mS9OiMzcno0ZV/Y4D1DUqIXoCDQN9OXTza
         +nOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716323449; x=1716928249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pp0wgsOf+otlTEcxeglIqsX7pRYpEdZKxDMC0pyUGd0=;
        b=rbMf2j/683CDgPnVWBmeEKpLxTf5H8E1pYxZ8HVD3++8JGa5g0quLXV7fHAopgsL0T
         o6j3g7YmXciosfEtlbbvIm2BeP4GhhJsN0+M33n93qm3VLxZt5jzXZGMiZuBRPSTTZT8
         foJ0eG1IV/Y7zGdgrm8jKMFe8oa7RfnP+r0nn5m+xbuZq+Xh0K/RGx5TmuOYij2XbtEO
         XOe7Zv67AW773mgmrp6GvOk005N8hSMKkU7c7hWoloh2GWtW4OABE0vwEghLlPthDp8o
         pPpEanGLYSy1zD4+5GxPdyXttQXABIZg27p1Qwe5trtpC7o5RKpyUSU6h8zQAxnsYnq8
         LE7g==
X-Gm-Message-State: AOJu0YwgBkJoMfeGytaXfNb3qJkjkIPjo1pdXpMjMLpr2ps2+S6KbohX
	LMrDUn7pOEY5F2e6ABnLQotQjtw30QlV7oT8q8sky7kybbg3Mi8pXDYU7XHNy1E=
X-Google-Smtp-Source: AGHT+IEx8QHVp0uTJ2cLWhq4ftpPXl3iBNLrS/c1OcCJiaHJ6hbKc/1kI1/oPi+SIpmEttUD6fzuZg==
X-Received: by 2002:a19:2d0e:0:b0:51b:567e:7ea4 with SMTP id 2adb3069b0e04-5220fc7945cmr20433710e87.26.1716323449129;
        Tue, 21 May 2024 13:30:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5238ec18fd2sm2538664e87.155.2024.05.21.13.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 13:30:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 May 2024 23:30:46 +0300
Subject: [PATCH 2/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: drop
 second output clock name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-fix-pcie-phy-compat-v1-2-8aa415b92308@linaro.org>
References: <20240521-fix-pcie-phy-compat-v1-0-8aa415b92308@linaro.org>
In-Reply-To: <20240521-fix-pcie-phy-compat-v1-0-8aa415b92308@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1599;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mMkzAyWz/qVN9O2XMqdjyNpMMewXubKPHRJ1nIx25Rg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTQR2ydgr373/+ZrReuBiiCPXPsnPvPUpPweIk
 +4iPSaWE9qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk0EdgAKCRCLPIo+Aiko
 1XXhB/4mZQjQ8rLR/uJtqT2Pi4rQQ8eH+AKYTjGYWRIhpsGtkGy1LeqMfQCnMFUpfQg7c8dWDWa
 yqDNA3P5D5tnmknhaoH6yEFDYmqoEiATcnZHvevWqpqmrUwr3pYKLU7jsp739WyZLbJxljZholR
 P8rIhnhnNzw3rAs+1i18LeUkqjbhzgJWrnZRN0O5u+HcrZh9jpKSZciUtrEr9SlKsNsE3PgNHNS
 sIVbzJk/PM2HrFWAGvYTQJViogzeQuKWdENWW6J+5aTwf1K/7eNjQr9IZEd8wPKrOv/WO5+dW2r
 G5Fiebvg29UJ3A0bYdISOnCukq1AM0os/84vW2k6ycze5vVt
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no need to specify exact name for the second (AUX) output
clock. It has never been used for the lookups based on the system clock
name. Partially revert commit 72bea132f368 ("dt-bindings: phy:
qcom,sc8280xp-qmp-pcie-phy: document PHY AUX clock on SM8[456]50 SoCs"),
returning compatibility with the existing device tree: reduce
clock-output-names to always contain a single entry.

Fixes: 72bea132f368 ("dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: document PHY AUX clock on SM8[456]50 SoCs")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml        | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 16634f73bdcf..03dbd02cf9e7 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -91,8 +91,7 @@ properties:
   "#clock-cells": true
 
   clock-output-names:
-    minItems: 1
-    maxItems: 2
+    maxItems: 1
 
   "#phy-cells":
     const: 0
@@ -222,14 +221,10 @@ allOf:
               - qcom,sm8650-qmp-gen4x2-pcie-phy
     then:
       properties:
-        clock-output-names:
-          minItems: 2
         "#clock-cells":
           const: 1
     else:
       properties:
-        clock-output-names:
-          maxItems: 1
         "#clock-cells":
           const: 0
 

-- 
2.39.2


