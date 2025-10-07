Return-Path: <linux-arm-msm+bounces-76135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F01BBFF4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 03:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8650B3C51C6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 01:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562542036E9;
	Tue,  7 Oct 2025 01:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z/HYKk7f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B3D1A314D
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 01:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759800376; cv=none; b=hHgtn76O8h4MbTEn/vuVP4FLvN7fvpmxxRN3ZNtZ43oIjkTK8xe+PccYbIpzBTbz4H5oAbQcbU1w7Hj+nZvE7wKAqAm6alytDC87tjuDMwBefDy0ciuXp696O/M3Fq2haYtbtWcvjHiEWXBNoUi4lH8HAEyKLzVTxpayKCtebxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759800376; c=relaxed/simple;
	bh=vL4Yi7zJJBjUr0fygHKbwh/sRmJU8/5N2tEVygj5zRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JFbUkkCS2sIfbYfX4PbniHDd5CSRCZitnDjHai5PfX4erjcITjtytdSGhzGqIAkHqhslfFJQ2C3jfqBKFEhl2AA0cKyJ3DUmcX90WjEAULKnADMJ71D9XBI9YuuPM/zDYBLH0/Tui3AvXR6DCABN5KJq9DL3mBvYfoADUvULAis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z/HYKk7f; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e2c3b6d4cso45605535e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 18:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759800372; x=1760405172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Gkze1PZ3B1F2WvEE1HfylRm4/KyG9IWdPsitRWLnyo=;
        b=Z/HYKk7fplekLTjZJ0mDOTaB4TXrsfE6jqx5ms0AQICAnCG+HWGSo77JWmMZuI72Hi
         /E0zo9Qj4TPg3oj+fZq4aydcAva7agLdzeNZ8J0S5uc8dhVv2dVNH03lOEpIIytoSu9Y
         ZAjLDBn+FxzEuw5J7qvn3TL7CzX8WuV0H0kUVTvtl5uw0DI/8sC17ANM46/HJqQUuVa7
         zvt0fxQ7l1Z96VFtM3hTgHb49gZAktlXlvZNbe8HCVfsqMuXGWQLG04Ec1Xap/V3jt8e
         7uSIv3MaXoJOPpIrWYb9MeaOZyiQxc7+ZFGmj36hEMVkMkm2GYU8Rb9wLoSNMin+/Qb6
         PZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759800372; x=1760405172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Gkze1PZ3B1F2WvEE1HfylRm4/KyG9IWdPsitRWLnyo=;
        b=Zb7c2FKvzTcTM8EQxB1cLxhJhaDFWSXRJAapCBQFtTfquciOqdmcmI3alJIXvUmZN1
         993HosWi8eVi8P00HaCigDny3D8EpOWlVA9iIsHKYcrLuUtC+XwFhtfxf5JJw88fjsmL
         BWWlftycZ56BYWe9FS50B3ZfFGjHoEXIBkSIwoICPAWmS8pOsD2Rrk3pw2rwidrtE8zO
         z47wnd1I9WG2ZCih3Z2NxpCjZWoswp4t784vqVhq4abOhdkVxLATqYFaF+S0BkpzGcix
         PE1lJiFT741sE/yTLsWpH7vsYrZMLImI44aSG4JOgJnJif90K23VM5wlvPnWMFMW77+c
         SKwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYWeMP+/8Iom0Kh9ZGYY08SJOMM7FgmGF1XwCM9lDzDMO4vpeslRjlKZyeX/ZTe5aZM47zjnrs/fgGhoNz@vger.kernel.org
X-Gm-Message-State: AOJu0YxgTGjwodsFkN6/rUsGIZQaYlrPlpjwtZ7qMWo2T4BWUQDMgVgx
	E6/ZBMc5DXU6/Q38C1EEE4BgPx469ekd7EV+MQxVavhSmRo0v/ds2fwidrG/FuVwH+I=
X-Gm-Gg: ASbGnctRWROAiG3I0v32SuEnjie/4/mr5FYiQypiDgM0ZfPa+oWdKqmY8lX+yG8u0Ls
	6DY8iXsU2m5XBrFixQ+sxLredDmFVGEtGvMu3a3lRDB7Olau5s0Dtcf17vb4JruMq7kU+0WpWaP
	1FlZlSvRo2VqN3GvKR2832LPom2og349gybk6S79mMbxAQf19SgBYgr+vcLiAgQgCGPHQn9zdCC
	NK8tYQ3RupAusRpSRg+pIcrQgaIqEBJcrB44R6tEJUIhlSKO2+ftN26LWVng5EHUs7g4i4I8lCH
	vzRu3/LqIMZFYbiEljcaI6fG30gsr/fTaJcw4IjTJ9zEWBHZEdBytY2cjZ1uCtKW14NZrl5w6ww
	T3rKwjZp3tgDvGQZV1h9d1+St41mttr7SP1EXZVDnr4KG3LehlsOaya3uZCFdH+kDcdtBwVB//O
	uWVQ==
X-Google-Smtp-Source: AGHT+IHaZllh/8DB+xeKauD0rwLpbID128BEf2oUn62u64beA/QXNf5q8CSKvTkssxIfyn9Bav1kTg==
X-Received: by 2002:a05:600c:1f0e:b0:46e:3978:ba71 with SMTP id 5b1f17b1804b1-46e7113f659mr89603085e9.21.1759800372470;
        Mon, 06 Oct 2025 18:26:12 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa2d52a71sm7410915e9.1.2025.10.06.18.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 18:26:12 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 07 Oct 2025 02:26:07 +0100
Subject: [PATCH 1/2] dt-bindings: sound: qcom,sm8250: add QRB2210 and RB1
 soundcards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-qrb2210-qcm2290-sndcard-v1-1-8222141bca79@linaro.org>
References: <20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org>
In-Reply-To: <20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org>
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

Add soundcard compatible for QRB2210 (QCM2290) platforms.
While at this, also add QRB2210 RB1 entry which is set to be
compatible with QRB2210 soundcard.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 8ac91625dce5ccba5c5f31748c36296b12fac1a6..c29e59d0e8043fe2617b969be216525b493458c4 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -21,6 +21,10 @@ properties:
               - lenovo,yoga-c630-sndcard
               - qcom,db845c-sndcard
           - const: qcom,sdm845-sndcard
+      - items:
+          - enum:
+              - qcom,qrb2210-rb1-sndcard
+          - const: qcom,qrb2210-sndcard
       - items:
           - enum:
               - qcom,sm8550-sndcard
@@ -37,6 +41,7 @@ properties:
           - qcom,qcs8275-sndcard
           - qcom,qcs9075-sndcard
           - qcom,qcs9100-sndcard
+          - qcom,qrb2210-sndcard
           - qcom,qrb4210-rb2-sndcard
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard

-- 
2.47.3


