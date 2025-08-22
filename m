Return-Path: <linux-arm-msm+bounces-70330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1725B313A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA704BA042A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7752C0282;
	Fri, 22 Aug 2025 09:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ot2cmto/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86692EF657
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855573; cv=none; b=CY58TUkjpBVjssYIiE7Poda5lu7uAU9ByuBPV4iXCPFJk+8Yxh/aaG28mn0kaad3dSf3iGOIoMeBYYtHBBahMjluPBKhG/SgEt4Ii5VwrIFm1ROmNx1KxLf6YnPlg6MFID20YGPTCs79SxVythNw0RjBF+ektZbHOuzCaIdLQDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855573; c=relaxed/simple;
	bh=WfJTFOkiFfJ8imdBbfyVJQJksDVscMbwStcuwHTKDos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KB4LFx1925Cxk+/Fb5QHq4nfLl4hk/3jCwScr0DxVhIE70kvtrSPHU9YulKGgZLlmCuCiRRx69OPPsgAacRZnQeAiatrx04ZuklFpFVmUlkeFvOPvAROZylFcSuz7PZt3ML4VVxUgTbs8rS3zmOZfrSGE8vZ4mUoubZK1gFi/rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ot2cmto/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a1b0990b2so14327825e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755855566; x=1756460366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HblogMXc0c0fbHZC8tuteY/HEVF9rO/2JJ7XgNKcksY=;
        b=Ot2cmto/DzNJ2O8WbJvf5WV8CuqC49K5ZP3dfEgKFaN5DAioWioLpUnxEzoBp8Z0hs
         P9nkK7WfB0HjTftZ2UNyJJLXbrKhAc8rIaQ7kRtTkC90NaZJshyGVBiIK8UqjtCF3utM
         ofTO8U1ueDlidejYl2oXNWUPtUmNDMGY1jhw4IdbIHA2VJ8upZnJzaj5A7virbsYZS4u
         pkuDOvhuJLFz8L+opgT/kyvz1FLsmlRrwYiEpWzonqnBpep8XvVn0nV0kkuM8BRweWWX
         7eqYx8CiY0x0Mlp6CZwug5Qsm8YNrg6IU0mMRgO/WppbZwH/waUjA+XGr7ENFFChMaom
         F+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755855566; x=1756460366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HblogMXc0c0fbHZC8tuteY/HEVF9rO/2JJ7XgNKcksY=;
        b=NUOPI2b5vdBEaEBXkvwBqYL7P91Hfmd1+ZSutP2xdhm39mjcNjIK9+CoXQxoJ8A0pI
         orrKtgcg8lj0wGOJP90BbuYzaBgYviwS5NO+ByMK/CrO3Gm1nZodaEsogU2m7fymlcxk
         M6dTvC+kJAOug3fAWW6NVMqjKPUZgi4fAxuJ3gwwhc3oQO0lKiO2kXnSImJwJINWAR8x
         cKjksqKGpAjqAaOKZpH5yaU50PVnxXAGuls/uJcDIDeG9loN9BjHC5ACpTsd0UsOqSee
         eyewKZrpWKyDXI36CxEgNkycJNvlE+u5ngNzYORQyMAaWRXRunXhfWfbKd1tbHA2JNfX
         JR7Q==
X-Gm-Message-State: AOJu0YyKcr5hPjao++q1Lxeg43NwM25OyYi+JAh0oyb+0i94RSDUNPtg
	boP8/PlZJbxX0zwzOo70iL3vo54PjrApMHzj0xOXHHMqz/+3bHymXl3slTHRDRzTEc0=
X-Gm-Gg: ASbGnctFP46UO4sthPxVDu2IWMYWuC0eD/Ctphvou/1hYzMF4pXF0rAcrseuOcR/GgO
	OJNfTzO0GoMzb/Mv89K9CndFt/8KaYVftvl4ivQ8XVZuEoEmURfzBr8PtgcQERf/MDjvxA/Qn4M
	Z413hSEeXpt8ouKQgx+pjMLv70EicOXu3ELnXgJZM8rTXH+fxnr5bb25y4E3aGtWgxqo9DKFcLq
	yMn1RNjhFyMlNN5DKJc71S5I8tRu84CTYwlieoY9q5lVpdmLkS7k+cvzhivJMrV1Pca+zsxlAUo
	f5xkTtpahT3biWgVSoQrE7y1ZhLh/lOR+uYikaQ7Uqpd4Sr9LGW0wZZPU33dJB6jMecf5PjgTMd
	k7g3RIGRoKz9Zi226gAIAF5Kr20RMGFa9E7LpqhU2ja0XkYurYwkPjg==
X-Google-Smtp-Source: AGHT+IEFZf0iPzP6rxsAyIV261ItRqbrT/i4PxGfzqmPGqWuvtcq1FqGCxJEmHWOyGtJpgIDPl6/rw==
X-Received: by 2002:a5d:5f4a:0:b0:3b8:d4ad:6af0 with SMTP id ffacd0b85a97d-3c5dcdfe499mr1667246f8f.40.1755855566265;
        Fri, 22 Aug 2025 02:39:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c684524163sm609890f8f.61.2025.08.22.02.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:39:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 Aug 2025 11:39:19 +0200
Subject: [PATCH v2 07/16] arm64: dts: qcom: sm8650-qrd: Set up 4-lane DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-topic-x1e80100-4lanes-v2-7-4b21372b1901@linaro.org>
References: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
In-Reply-To: <20250822-topic-x1e80100-4lanes-v2-0-4b21372b1901@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=732;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=WfJTFOkiFfJ8imdBbfyVJQJksDVscMbwStcuwHTKDos=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoqDrEOajx6C4sFY9R2ZFNqgl31CWXPBPuPDwQEkue
 y+pMUOCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKg6xAAKCRB33NvayMhJ0ZCbD/
 9YKTh7dZXEmP3OHThGTzoeOhPj802ukfqgW71WoQvUm3YvGNBbl7fvFXhdg5GxqCJ9hNNart7UQcXy
 uagF9/nklJ/xAaC8l0e2fulzlM0FIFELVpmC5EgBiH+4S60CYtQ/DVyd45XJykN7CT+ySnpAYmc7hT
 z+hltEixPvEAgcm313dIc/y3EQbE7JnmPpXTBqW4A0wZvWClaFmjfvj6/y3vBoNh+TCCP3RbTG0zPa
 KBt2vcyVWyrlTE7bPnlmZPgXHcxQXM3demJ+/cFoNd5NoTUxmFPsSq/aDvtG3tyBuS7dlnXMMAiHHm
 xNvMrVYRrzwMQBDog9h5TnY94ToaW95md66Qo0B3S10fG9jDcQmIVus9EvPgYuxcS5m6UK/vr0IoEv
 CAJRPbIOWNVTP4XLBZY4ob2na7GySZansx00R0OJ/+7b+PzDbsLrXSkg1lvYaOSFdqbfszIrXO1OTG
 UK/gd/hBPa/7flawOxzK6hf5FlkpE4cEGtPr+M4LRS30Ph4rWol+/pZVDGjns497ofrNl3Idjdejf/
 NuTy5bNKlsTO9bp1swGuR4LwS1CYn6eLLyIo18/mVYM5WArnkIc8YE9gLuUfsWHRFaPX2P/eojpIuQ
 ZcSZ32ufjx01W/sq1uOiMCuIPVl8ahIzYw+V3m1PrbSmXG6j3jFs0QjuEFeg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 4 lanes for the DisplayPort link from the PHYs to the
controllers now the mode-switch events can reach the QMP Combo PHYs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 081b7e40f5742120a611cbfa57a59dfb1dc19b9f..88e202e1d49053230f58d719d3c7d57df2c9922e 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -893,7 +893,7 @@ &mdss_dp0 {
 };
 
 &mdss_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 };
 
 &pcie0 {

-- 
2.34.1


