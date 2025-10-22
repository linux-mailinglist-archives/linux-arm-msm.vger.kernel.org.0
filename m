Return-Path: <linux-arm-msm+bounces-78243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 804AFBF9E4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 05:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57EA519C51A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 03:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F2D2D739B;
	Wed, 22 Oct 2025 03:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dFRM3Pg0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5838B22154B
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 03:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761105537; cv=none; b=d8GzHBS7bmJ5Fq3LkqCc0FWxutH8An3aDT/6oGWiNmrO9GqoIhWtqDSOSFf6QADBHpQzY6gBKFuSA1CbmJa5aPqmg3pidX1rfoeoiBqQHRMwZgAVU+D3O0weyfeGXcgI15hkK8GegpPwNIzwHgzUS8F8tbkWY0Miuc5M94U8xhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761105537; c=relaxed/simple;
	bh=eD3Ij+lZtQ4DnXw+Tr7kovgD0K44T1dMGiw6LsDx7yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QnKStzLjNUUw5YjqVH1Kt2JD6kQTVWwbWrbWrvcWcSBe6hs/uoALphI5EqQ/gzuG89nUgwMfm8ENEd2KTHVIWAxhlXRObCY3474b5r93TEKwDQsdd2W3O832E8M+vNQkqrNc+NMnt0NU558PkZ2agSjoisgmmi8SHcasCvn6fjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dFRM3Pg0; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-426f1574a14so4294540f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 20:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761105534; x=1761710334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o57tAm9bEj69a+6wod50M/v+YTegpl9/ax57TD+w3u0=;
        b=dFRM3Pg0f2OFxMUtUgawSWaBCgTFe1/4ZI/QAe3QXChhMl4VFst0EfQt/udHx0JzUJ
         H25/8moVI2BLRyT8JKcK08/89aAjAM2zEy77JGWOU7RIOqFi9hyUBEqEqPuVePc/3aHd
         FD1uNNvSgmIjJEe01WBsIFK6bTiflR9lCPj2gW1OagZK/IXd/x89ACAP7gH8ewiQi5iv
         7ndKUoUDpuZSfeSWS0NeqI7AtCbZkDM6YNpSFsKMfT2Z6di0fHc/T91jo635XL7q81/6
         BmqW/25xVk2lUZWRN1UsxGtPtZlQYuPUrvIaRHj0bSWQiSmd8fpF6WAnJFldFupmqeVo
         rkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761105534; x=1761710334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o57tAm9bEj69a+6wod50M/v+YTegpl9/ax57TD+w3u0=;
        b=E1iMZgDXMMMMqzUrBnAZS4ZWtmjFmR6fSOVx8UpLdmvXp8V+hdvf6F8LcdhzXIRQEo
         UzfgzKwcPZx34jgFEb8C5o3JP3KJelWbgMvoxYgulE/SKl7RJFjMKSeFKI/NT+bhceRv
         ckzbrJ1FnVhkuvsJOgUO0yAt8Hyn2A69V97KBEwTV/Xw7PW5vQ+5AGOyPdKewLFoNvE1
         PNnuhf9izvLhQRTy5P9PvVFAg+AVaGqlxZm/EiFZUc0PpZZbCT8hYC/9HPy+dGraFQ8g
         fejucQyc4dPtSoMuI9U8c2oDn5mLpbM0Ho22DrdMDMhPjfIONBx6P58v15RmU57lD236
         VEaw==
X-Forwarded-Encrypted: i=1; AJvYcCXNOLIHrryAUnXPcEUCAyAAj4Jz+mtFGw77Du/3mbLaVqShaHMcDFWc3uUZ2xeUwBYJfQ1vdPdr9ggMKcOf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4wViSlYyoHQM5pAee0XJ3zvhUvxSVq/AIf5IWWFcc84BZDNjz
	hiM8HHcg/mEIU2kN9zKuF1CAr/Ea05yO0zBks2/guboPNSLttHOkh/w3S69fGw+SULI=
X-Gm-Gg: ASbGncvkPUH82nrWlaXk2WMid129l4RRBe1YlZ7yqDc2xSpVjyWjkGxP52zkk0KtuiB
	akJ8Ee5flJIa9cjFL0e0wZa5T5KFU0MAlrjfYP9Dr9nSSXf3DxCBvY6cN+KGcEYXCcWsXRc030w
	Tt9AEmxgJ697YVaUf+ovOxXJSRHmu7OReT1SotznUNOzJw9HOt1SudHV9RmtWjlBRV2LV/TcOuR
	LOVPt1U9vnTySfDnNUwzax8PR4DgEU88UvYBLgLYM7W+wuAEwMdmY/WQO9AqA9vAyenpEOyzfKG
	qbF9MAQDJroC6wzDQ4lKvKQV/ZSxamJMCcPhzrXE48mEZulJ70SQRfl9agrl1qpy1fR0A1qbX7/
	t55bKAvYWyPWmvvkiGClwLX2n3Y4Qiq3nWzfOsfuWS1hWutwh3GvpxAd0jVyUrWy1EPmxwQ5K3Z
	0/68wqArMhdYiGmQQn
X-Google-Smtp-Source: AGHT+IGn8Otegez7YT97/Q+RL+NH5eMmlBzrdp9SHgbeYCrM+gFyib3bAAvmS/oihsg0BsFmBaDKFw==
X-Received: by 2002:a05:6000:22c6:b0:3f0:2ab8:710f with SMTP id ffacd0b85a97d-42704d83514mr10579228f8f.8.1761105533675;
        Tue, 21 Oct 2025 20:58:53 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:11f4:2b3f:7c5a:5c10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a6c5sm23637639f8f.28.2025.10.21.20.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 20:58:52 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 22 Oct 2025 04:58:49 +0100
Subject: [PATCH v2 1/2] ASoC: dt-bindings: qcom,sm8250: add QRB2210
 soundcard
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-qrb2210-qcm2290-sndcard-v2-1-32e9e269a825@linaro.org>
References: <20251022-qrb2210-qcm2290-sndcard-v2-0-32e9e269a825@linaro.org>
In-Reply-To: <20251022-qrb2210-qcm2290-sndcard-v2-0-32e9e269a825@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Add soundcard compatible for QRB2210 (QCM2290) SoCs, where the older
non-audioreach audio architecture is implemented.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 868acc077046596120ea7f427e802282ed03c853..15f38622b98b904c4107f4800cd1a4159191fda9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,qcs8275-sndcard
           - qcom,qcs9075-sndcard
           - qcom,qcs9100-sndcard
+          - qcom,qrb2210-sndcard
           - qcom,qrb4210-rb2-sndcard
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard

-- 
2.47.3


