Return-Path: <linux-arm-msm+bounces-33459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39600993B44
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 01:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 727DA1C23586
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 23:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC40018C908;
	Mon,  7 Oct 2024 23:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ywIc46sL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254C818C351
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 23:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728344228; cv=none; b=ZajFVn6WMS4sChQGjDLfvyfMk5NxZcbUMVn5HtonwMfjM6hJ2j57siwnWB4IWv9JpbaaaFFrpaR4BW/anCyvJc6ZsDvFrwOv1EcDUTBZ2lg2e5P+5hL9yaZQ3/i5B9XvmZGlZQCyWlF/tlSMMaiVcZGVaCjDSHmzyu76z2/Zb9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728344228; c=relaxed/simple;
	bh=o1k0wd1xsMtQeGmlnJ4QiwL63SP7QPaIFJFOs+lOBAA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FW2W5+U2jigAdU4UEHTt6OwdyH0eEfAWzBaOUw5lnbcbY3nf6IoJi5R3KuMoKecEFHJmZ33j9wwTgMCePs1g4babHtxs+fqhtEz3Yyn5DpKHCZl71IXdsdsyGx98AFsgy/Q1dNmiEpBNqHv/OcEtNqMLn8WY3Ydc7Lmg8QPnras=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ywIc46sL; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fac187eef2so59536771fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 16:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728344225; x=1728949025; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1fSRcSeGkRbRggdwy/ysIZu2Q9Wo+gAgEeX3VDGQ66A=;
        b=ywIc46sLoCcTVSaGer6KLoZkc5ezJGGYQshV3zkYGAzBKHYuy3ro2yfPDma8MrM3NO
         P5WbwgZcaqpBiQX1WKxVQ7ej6okoebKqp8L/DU2lNlWFPFODvLxYGHFcY3GEGucIQu1W
         ly6job15zPGL/v32onQcAXVO5JkO6YdD34IXbXM8gHHKJBWJ4I/uf4MHmDQKMKnFATcg
         esELc/9yUbbUahPxo727npkahfhUsLCnEqUwZx+EyE4pJy8DHhcz7gWGpieZIg84kv6P
         0uOVv44zaxRNNypq92daaNM3AoXhaUZ25/yju4DRELqnhnES8p1b9plb5QEQwhsypC5w
         RGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728344225; x=1728949025;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fSRcSeGkRbRggdwy/ysIZu2Q9Wo+gAgEeX3VDGQ66A=;
        b=GuF1/trIlXcwxgZnDw/g88NhmFhb324O+ae4T3CcKfViOhpt+GeHhVlKrX1jKYO8oG
         m0x6fcV2lasReky6foABMzfWFVL8VvNLlAxsFwhMay9Xuyk5CSrSqQJVWusQr1o2ZMPA
         H92fsSdUP9SmD9OSwBVnANaBzulAcQ7bMR3TviOFdjOmPe/YGN26j07q3d2Gny6hQW56
         jghsnY7/USGFejaLthS5TjAJccSVrR7I9YjpkJ5y40Cc3NPhRGeZ7Wljd5zGv6AwjvU9
         icunogUahOAPMJ8VaGHIrfi+VGSUhjixHj2aLW9F8NjRHIZt1mUvYHgHlNTVFOQpUKD8
         hrYg==
X-Forwarded-Encrypted: i=1; AJvYcCUUQMD8lpAOePOlRtSpVCECt/IF0mSFWKZXu1A8gUuEP2oBAZuT/qklJHX5TgJL1ow+aKCdx0/BoyHdf8Bl@vger.kernel.org
X-Gm-Message-State: AOJu0Yyka0CmyBiyzvVblmZ8sRzO69SqBmn6xsofJBiyxS+PqP1xgUd1
	QdAUp43anmFaztEjgUtD/V7Nqerz/LMUPjqhMufGCjUpl8lilmxp1MTRJ4ZZEJ4=
X-Google-Smtp-Source: AGHT+IEKBnRIH5K44aS2nOdoaBpOvH88lb5K3oEWjkImbVEnflhPxXCkueBLYqrqC6/zh6K6cy9G1g==
X-Received: by 2002:a05:6512:114c:b0:533:4477:28a2 with SMTP id 2adb3069b0e04-539ab8780damr7036857e87.16.1728344225277;
        Mon, 07 Oct 2024 16:37:05 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec1300sm1002256e87.17.2024.10.07.16.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 16:37:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: sm8[56]50: correct MDSS
 interconnects
Date: Tue, 08 Oct 2024 02:36:58 +0300
Message-Id: <20241008-fix-sm8x50-mdp-icc-v1-0-77ffd361b8de@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJpwBGcC/x2MywqAIBAAfyX23MKqFdKvRAfRrfbQA4UQxH9PO
 g7MTIHEUTjB3BWI/EqS+2qg+g784a6dUUJj0KQHRTThJhnTafNIeIYHxXtUxrotEJM1Dlr4RG7
 WP13WWj87e/9iZAAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org, 
 stable@kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=961;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=o1k0wd1xsMtQeGmlnJ4QiwL63SP7QPaIFJFOs+lOBAA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnBHCe/xZ7GoUUEaJ/JKl6meVKRt15m1nEqLN9a
 bj4GdKb5+OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZwRwngAKCRCLPIo+Aiko
 1YkIB/9WbnPRqwRo0MjW4kelSSSk1Wuay9knh6ZTdgMzkthGbE11d8dPHDo2WXt4H3W7LWG8G5k
 H4urwAcS5IDqOEM7sYe3YFAe1bQrVbvKaHCsDmhPFBp5eAKCoGYHS4iKZEY2ROVQ5X8Hafa7hDz
 IWA13An17oOcwZOek7Ejo4v4keG11f6hXB9ZQGeNj8q/2Dt/S36MrXLZ8H/Vdl+7+q/nlkpOKjv
 ba61V3tL0DKIi2Cfn8M76FE4/Rsfg7nOTSOggdPhqJTxaN3jNzq1WQFa8IEcGuf9Sh/I6la4f24
 I43j2ZGs4Q73fFlX4pi2audZOoyq7IOlQs17mKZ4dlJDsp78
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Both SM8550 and SM8650 misuse mdp1-mem interconnect path for the
LLCC->EBI path, while it should only be used for the MDP->EBI paths.

This kind of misuse can result in bandwidth underflows, possibly
degradating picture quality as the required memory bandwidth is divided
between all mdpN-mem paths (and LLCC-EBI should not be a part of such
division).

Drop mdp1-mem paths and use MDP-EBI path directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      arm64: dts: qcom: sm8550: correct MDSS interconnects
      arm64: dts: qcom: sm8650: correct MDSS interconnects

 arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 ++---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 5 +----
 2 files changed, 3 insertions(+), 7 deletions(-)
---
base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
change-id: 20241006-fix-sm8x50-mdp-icc-138afd0e083a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


