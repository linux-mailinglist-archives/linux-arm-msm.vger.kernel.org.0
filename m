Return-Path: <linux-arm-msm+bounces-21032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD078D4205
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 01:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A02111F22BA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 23:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A16200103;
	Wed, 29 May 2024 23:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w0vHcW8j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CF21CB31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 23:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717025974; cv=none; b=CSNebsBgBMzl6bDuONpBwefHNtAhmzj3LuLBYHrA7QrltpmRROVCZRQClWxDhynQj1yIeeZ1SVfNTCUS8of+DNRvEdpt062DkECU2fio4BXF9Ox8357NhsPfcj50yoLvQEY4m6kWT+N62FxbGPKimDrnP7vS0VJ2TtIa4lqVqjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717025974; c=relaxed/simple;
	bh=s0pZVz/MI0VgDl0EUybJ0FTf0DKfSLrTSrzAld/N+mA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b9nVEl7lgW3baDUJI2nx4qhANXqiYAEwlySzgtqw0j1E50vePjtR1FzHMwUOPJkQnmtwVrFcszLKRr734YbF0PlCygdcZLJUTSc33CtCbYUYGl3eTdhN7LG1wL8Q6SI36R/mUMSADL0sgKgkVfV3OD4fmW58T2VAaFXfidR1Qg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w0vHcW8j; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57a1fe6392eso3712a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 16:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717025972; x=1717630772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ba6QNdc3OKHiKLVsBpfuhmd2T3t28nTqhS529Obod14=;
        b=w0vHcW8j9FgL6oGX+iAopoDdHrBn4t/Sop3hbdkqm7G5OZCF+h75tAq60ah4xbQus0
         Px60oLgptn7rCOjdVgtFLboxiBqb4WZGpnKet9S4vUQ4ZiXmqt6B05HxPYn+q/0E9aHI
         P52Z75Gthdk4xmj3KGActaGJhPvFeBkGLpWxPQmiXarjJms/JpYfK5/7RaBkwZ19UcHQ
         O4y3TTANb7F8P95x5KO48pkHA8guzptKkWz1plveqfpP9PHbS1xH0Pl2Ls5HnKynXKU0
         taze55Wm/vkqm+9eLOLr4K/Q93NlPAJ3AvxNkdkjREgiljbPiO39TkyrMlWBWY07nPCd
         R26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717025972; x=1717630772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ba6QNdc3OKHiKLVsBpfuhmd2T3t28nTqhS529Obod14=;
        b=dbm3fRSWhgbHye9oRabSGtGgGROoID1FK3PETR22d+Tz7UNgfzz2wTRCLi4DZSM5Mw
         F9CCBhZEGv78Rk7CFxr+ZQ1kZjhZy9+eJCNfSjoBSgTwIfa+h3K8adq706YhsKvJ8dvH
         k8IFLkJVsYlbxX71zWsxVsY6fG4miqtSPSaWvr2/PBqk8ZgeogasOKwA/BBuZa8yLkoj
         RDm7a3qJ05Db5CizGPU05QZtWJQNU86B6PCcDdM9bUC+VETUfvjVzKgweKepw5e7Xur0
         lYUefCT/VBPnGPAkGv3zFBNYFXKyVF2hNc/MqlaU03jol+8l14pG/2URTQQUXd/1UhfW
         gQ4A==
X-Forwarded-Encrypted: i=1; AJvYcCW68SA6+r+vYaDOy1jp7k2xzqaIZZn7KlGAFseKstTJW+o2xpjIvUOa9oQcV+ylsuueWZR3D3T1hyLh9SmNLKzGL+WnVQO16bLGeaqHYQ==
X-Gm-Message-State: AOJu0YxAgg8wK7jOX6vHoPaoutbj8BdG3kw435XCxUwkg1pyNcoZZUIh
	DkYUX1LD+FElXXjZehw8YgMPuPTkYAmnKcLxL2MuLZu2EXE+Xwe2W8URokitfOI=
X-Google-Smtp-Source: AGHT+IF908oD8asAtnvvDBaB49pU2X2gVl6QEEFDLj0ciJojX0DSxBhW09ELa98upXriHs22HBLE0w==
X-Received: by 2002:a50:9316:0:b0:579:c2fe:886 with SMTP id 4fb4d7f45d1cf-57a177b15b9mr264105a12.14.1717025971708;
        Wed, 29 May 2024 16:39:31 -0700 (PDT)
Received: from [192.168.0.113] ([2a02:8109:aa0d:be00::8bb3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579cec28c0dsm5129759a12.66.2024.05.29.16.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 16:39:31 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Thu, 30 May 2024 01:39:16 +0200
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add QCM6490 SHIFTphone 8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-otter-bringup-v3-1-79e7a28c1b08@linaro.org>
References: <20240530-otter-bringup-v3-0-79e7a28c1b08@linaro.org>
In-Reply-To: <20240530-otter-bringup-v3-0-79e7a28c1b08@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Martinz <amartinz@shiftphones.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Caleb Connolly <caleb@postmarketos.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=899;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=vuwvUX5YFXpssceXQQo0PcZUpaD2LShOgI/MlmUUkwQ=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmV7yx2EqXq8zNv7KFd0t65T4xyI7tgXEwVJX+4
 PhjZEaTf7KJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZle8sQAKCRAFgzErGV9k
 to00EACBUD6oC6SANHdSxaNLshZfl1suAeyyeZr/SM0WAtZUJuC1sJttyHx3bNcgjaDev/rP2Tq
 ukMHxaJjhiGmw1NQEFO6nMrvghmx6ynDLD5KGH2gpkfOIJDeRPR/Fn7Cw3+z8DiAfMgKibPtVz9
 lh6IX12QoSzVZtSnqoKEMDaP/bn6SXZ58Lnfv1LOyBV4BlwdrGZwCdYasf4qCfPyfJ2sRinR+ny
 nqJeRpCZYl/K5iKBOFmS2zKAZJCUxvmWehnzxALYGtqwzHjXxJ01JFLPc5gMFrW7K25GpEfQaa3
 hENNj4B8ODy8Plbvud+PWcNi2L/Uq5RESv0cytVHNrCjAPfvlH5oz2YFGmXdnFu3LjWRZcQoPUL
 kwsxTLZ0OF+qs/Hf78XgxiTpyV1kHDdXbe4BURJ5+4GX/G4VKgz3MnVTpa8yuo4v0/9qu7gLAZ5
 kvIuRfCE4KSOPPISv8h21dIYBVea6YFfCBCJZiUZHi9GSeqFOs7YhTHXhQLa8C/h3ZT5x25v9zK
 AGn3dud22sROJrCVVh9pgxTyvxwIwL9r6pFDwBnRITy9LzUd7WohMfZZqxEXt6cS08VOCpBcjol
 eyUHwq/VKIPGE70pUBpwhGV6iOepyvuQh/TDzTW8NpzwjL0Z12cTGBQwIQyjFoglVWKREh5Vty5
 RbQGIZyofNnL6+g==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47

From: Caleb Connolly <caleb@postmarketos.org>

The SHIFTphone 8 (codename otter) is a smartphone based on the QCM6490
SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ae885414b181..5f84b38ca5d5 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -365,8 +365,9 @@ properties:
           - enum:
               - fairphone,fp5
               - qcom,qcm6490-idp
               - qcom,qcs6490-rb3gen2
+              - shift,otter
           - const: qcom,qcm6490
 
       - description: Qualcomm Technologies, Inc. Distributed Unit 1000 platform
         items:

-- 
2.45.0


