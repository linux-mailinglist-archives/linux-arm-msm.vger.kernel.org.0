Return-Path: <linux-arm-msm+bounces-32999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 936D098EB37
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 10:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26DA0285D87
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 08:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB52713777F;
	Thu,  3 Oct 2024 08:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ch+LU498"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BEA79B8E
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Oct 2024 08:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727943274; cv=none; b=FgAEzB/0igMusfN2eoyv/wbjnwonvHk0/cqMn/NUXcnc2YAg5ZnVSw3xoOLUr7O4S3nTdEMU7Fi0ZAreW7DYMJ0PWovUPmZMz89I708j5ptqlDvy+iy4wsu6lGa/8vin2i7xIIG94XW1MFy8t7/e7ndhRd4eaknOYchEzvaB1g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727943274; c=relaxed/simple;
	bh=DhsL+XpaZovnfsrfiPwX/hOfQu/Ru2Ru+lnm2TcM++0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CGPSxTRBA25fAocAPUnMB2j8r71K2VYV2GPi5NwoRQxT5UEh0RJHwGxVulMoA3VBJZdZWNNjlCqVOxbKNta2kP3STUbQ1xU5Tvj89FrBe9NhzlvwMsGD5UK8K+ZeNsGjjbVJabWKrlY+9/1xhMT0l5KdnZ/Aoop3hp3m2+p6iiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ch+LU498; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42f7e1fcb8dso1006975e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2024 01:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727943270; x=1728548070; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vSEcLxbQ1rrHMFIK/V70J+zruVP09R5iUL/h7LGL//Y=;
        b=ch+LU498NPxO8x8yU93eOxvHsUajavo9W7rqz9Yf2+jE7rCluwTPCIu2pr/D8W6wbj
         Yrgz6v3GIAR/nDiMaPzGRE2/Qk/2LX1InVXtNEtgYVzTtGCaRbjHCLei/up/Dsy6BoE5
         0epVlp1Uf1gZyckkLLoBB3ajYrtuhGLIfOs5zetVx/Kk4KKR83vOYX2jgMBdcbvuYeGl
         8MVgIhi2LwwpyQSbDi3ghM9j5P4dJV35U5tumGwJsxA5z5DTly8faMsCTfqXk1a2baRA
         yywO2yo5YArM+tLwZlbSZgr6SZUHYnZzRtmasmgC4g8pR7RSE8l26/g0pBGGuMFD9Tga
         2y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727943270; x=1728548070;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSEcLxbQ1rrHMFIK/V70J+zruVP09R5iUL/h7LGL//Y=;
        b=i3PMVc2I/Ag1A9n1gVW5RjFgTZp1H8AbzxBdj+ixOVWdHIphDemKxbk7LzMI6M0eKg
         bN8WPfZq2sXk19/g/hyMz7O2WakI63AL6y8UlHXWn89bTnllBpq3uZne+9DPj0MZE2Op
         evQASeopfcQuSN6HOt5eieJBJDvwi4sJHtEnrpHolD5w2FVSdAiZI3WDZ8NScn/Es8Gq
         BxiP0dItklycKeRYI8QcrQ/PPL4Dd4NABeTDIV0faAnrYDvby5ijf8DRZUj4EhpLbBwx
         CfQRtChFS1RziwdwWYRJuw2lSes1+Mnuowk0PJDTUPEEfRbXZxm9mCyvFUvqbazRMlpx
         Uzvw==
X-Gm-Message-State: AOJu0Yyqm6/m1ig3AxzeyTpyEW/eGv73k0S+PEPQYfcxWxhTzRaRq/5p
	t7rPd/zUoe3+2U/WMyiT2KglnQijo+CPfuYM4DCVqbq7i7j7WoKgu0nnSrkKzI4=
X-Google-Smtp-Source: AGHT+IH7t9y7v6imgHnd/sgCeFjFKtQdV6hpExhaAY/b/kJTtO2vgSpQdJmCamy8wnoMaUKMuCuBSQ==
X-Received: by 2002:a05:6000:1567:b0:378:c6f5:9e61 with SMTP id ffacd0b85a97d-37cfb8b62ecmr1938691f8f.2.1727943270207;
        Thu, 03 Oct 2024 01:14:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d082d230dsm702027f8f.94.2024.10.03.01.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 01:14:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] dt-bindings: display/msm: dpu: merge bindings
Date: Thu, 03 Oct 2024 10:14:17 +0200
Message-Id: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFlS/mYC/x3MwQqDMAyA4VeRnA20qezgq8gOusQaWDtpRDaK7
 77i8YOfv4JJUTEYuwpFTjX95Abfd/Da5hwFlZuBHA3euYB84KKZNUdktf09/zBZwiSltbxScEI
 P9gNBW+xFVv3e++l5XX8MLoyvbgAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=DhsL+XpaZovnfsrfiPwX/hOfQu/Ru2Ru+lnm2TcM++0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm/lJbfSn7GKpNe1OQyR16C3C0pTXS1ma7JYfjU
 mP0Xvg7RliJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZv5SWwAKCRDBN2bmhouD
 1w8BD/4m+wJzud/U+Uq714fJwyJ48d/HyKIewSyrvLWZY818t0S4ivQR1u5iUIyq+ZM29xJezqC
 drnIO2JBH5zO2KP+kSE2eAlYpDkSpSnH7dgscrmefiy/A8P3SjuH64/3Ss/ixvpmkTnp7GfU5tB
 sXIcALKxfnpVeKP4L6Zo/5Fpi7CY3+gnxqQvRO9OnXJRyRhzHgZzkJe/gnpHYetI8MI2lAV2PIj
 ulv5dWOUcjmt0nUS8X09S/TZCfcEhVr0rQGJh9kOPfT+5jKUiHFP1cIrY4GqxJdE+klliyW1tYj
 w+VAEyG8ms6eOuxowKaN+jD3fuQM32+QiG16Gmtixoutvp74MTtXM7g8GPqevcNEK/r11Ue9GLV
 R24F+L+KI/rjDo3l8T7/u4zbtjIYimjWViR86f5BCOqmZHB+kwYS3qD0jEgOphNE/ow2eEMiLgX
 y0uzs8WLTzJCykbEEIh0PY7x1GEkZzc/ncrbbnTX4r2GjK+lM0C//tda4Dx87eWPZ48z6kvnS7O
 mDn4aRHyJoF1fiXlZkwxLYCrity1kUO5L39BOHb2QH86hXW2tmWD6Lr4Cz1HoI7V2fqU+xfDYf/
 hsLYNmaF7UAroxqqrxyae6shRRL0lZavzSwQJgAN7P5ImyS1iP6NnTbL2RbIf6aziS7IPXSHs02
 sq9dwezs7wUda2g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

In 2022 the bindings were split each device per file, but this makes
not much sense.  Devices are the same in many cases, same clocks, same IO
register space.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      dt-bindings: display/msm: merge SC8280XP DPU into SC7280
      dt-bindings: display/msm: merge SM8250 DPU into SM8150
      dt-bindings: display/msm: merge SM8350 DPU into SC7280
      dt-bindings: display/msm: merge SM8450 DPU into SC7280
      dt-bindings: display/msm: merge SM8550 DPU into SC7280

 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |  10 +-
 .../bindings/display/msm/qcom,sc8280xp-dpu.yaml    | 122 ------------------
 .../bindings/display/msm/qcom,sm8150-dpu.yaml      |   4 +-
 .../bindings/display/msm/qcom,sm8250-dpu.yaml      |  99 ---------------
 .../bindings/display/msm/qcom,sm8350-dpu.yaml      | 120 ------------------
 .../bindings/display/msm/qcom,sm8450-dpu.yaml      | 139 ---------------------
 .../bindings/display/msm/qcom,sm8550-dpu.yaml      | 133 --------------------
 7 files changed, 12 insertions(+), 615 deletions(-)
---
base-commit: 77df9e4bb2224d8ffbddec04c333a9d7965dad6c
change-id: 20241003-dt-binding-display-msm-merge-df230e26d142

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


