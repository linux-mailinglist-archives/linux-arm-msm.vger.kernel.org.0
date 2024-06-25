Return-Path: <linux-arm-msm+bounces-24134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EB3916EA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 18:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A24F41F22C10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 16:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4913175567;
	Tue, 25 Jun 2024 16:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Df3iGoIj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2AA176234
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 16:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719334674; cv=none; b=PcseY/m2oLOmhy0ahT6i2HMEbxJq772UbLPRrJ+JASPs4hMm0ydKcYcp4hyasUGCwHzHR4Qbq3JssufK0KsONC123DNSVOqdW/uDChOxdTVFt9Ps+zFrkZP34z11ujU7ZLC8e18dop+H1hAWdhgzo/2MXT23F9vLeJ3/W+1UcxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719334674; c=relaxed/simple;
	bh=XTKwc6WsHqDFL2V3ZkDy5nradEps2Vi9RgsZOcLaSJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sMZBmUdOp4GjuLt8CqCY4d8g0rzDbA7mc9tVsC5UtPTSOY9umCNvO4Y8HjUNIit/Y+hOpirtJ49uogk9Es1ZKweTXNKJsFomAAEvcjPzMEtXngTUdBvmuMoJvxRIwEPZXt2/NelDswam2m1bWPMVG1QyoCpNDPI+8Mct3661hLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Df3iGoIj; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cd717ec07so4896181e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 09:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719334671; x=1719939471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyVXj4bWgaYvRknSa5lJyMkjZU/JIisl8Ay4LG2mAhw=;
        b=Df3iGoIjnw4+MHExiIWctqE5Ex08iFa10kzLlOUQqo6a7aefN7kOYeoEYBdP8g7gOC
         lKLL/e5e4cCJyF0EmDa9/Qsg5sAcnX8hytDFTMWxEMFb56y9xZePSKcTEQ8kqyJ4o04x
         M8MaUSeFCA+0vPz33WvJdSUwlnvUiUB6p87/qyM5+FRtTgdtIrA2Dw5jJh5DUaEaYM9F
         hI6isbTf/7ijzf8zhLZLh9wJaUWSn+pOempm2My5UchcQj8GDUHZ9Fv4Rf/neHzRFsCc
         b0GmdUf4T9rFjAtpFmy1ehQS9kxmPT+xempId0M6umwx4nyrlOQAqOliuIrwCVg4COZJ
         9Czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719334671; x=1719939471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JyVXj4bWgaYvRknSa5lJyMkjZU/JIisl8Ay4LG2mAhw=;
        b=aH8HMdKsNCMxsnZ1uwwK3hlanUxfWy7s54F0dyHtOLDfw+nnF4ewBzGPP1PQo2cxD5
         KKU4TP8/PymJZEVf/5aKegDOoX+svYQalEOVug6ZwIq6QaxzUmQpYglzeCpnfaQ+69QL
         ay85bQSL3FPuR85pzhMknbjsqI5pRFAZ+rpncwE7zqaKsswoD8w2d8vaC2wvp7O7Z4PO
         uP1Y8XQvIHo7H4XJ3A3L4PFYzxKwSFjpYFFkrLDThxJ3a5pCKE25/OPhWzCDl2vGzXSq
         7D0d9unx9YLDZXyTy/Aw3ndeisSxvY1kbhB5xR1OKiBunquXwiiZBChDBQTeAJgC033k
         uLUA==
X-Gm-Message-State: AOJu0YxwXA5oaeAthzlFYneZwQC36CNFxHZBCUpvorIbAwUq8D2g8bSt
	aCVciD0HpsJuB4OMLIlWzgr55pGbaWWETiNKMw/hdNJYIh/D27nTUoSOoJc/8sI=
X-Google-Smtp-Source: AGHT+IGTV29hsOIqeDCHH2orasV8fV1XlLYvRt5g7BFjuE7tm9jJmD/m1TAz3dbQze32DSkd4dHSKg==
X-Received: by 2002:a05:6512:158f:b0:52c:d9a3:58af with SMTP id 2adb3069b0e04-52ce185cf66mr5892393e87.49.1719334671344;
        Tue, 25 Jun 2024 09:57:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cf1918e14sm215392e87.235.2024.06.25.09.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:57:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 0/4] dt-bindings: display/msm/gpu: few cleanups
Date: Tue, 25 Jun 2024 19:57:50 +0300
Message-Id: <171933466183.1441256.5006913345206572060.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
References: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 23 Jun 2024 22:02:59 +0200, Krzysztof Kozlowski wrote:
> Changes since v1:
> 1. Add tags
> 2. New patches #3 and #4
> 3. Drop previous patch "dt-bindings: display/msm/gpu: constrain
>    reg/reg-names per variant", because I need to investigate more.
> 
> v1: dt-bindings: display/msm/gpu: constrain reg/reg-names per variant
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: display/msm/gpu: constrain clocks in top-level
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d6c7c411be78
[2/4] dt-bindings: display/msm/gpu: define reg-names in top-level
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c808ece19640
[3/4] dt-bindings: display/msm/gpu: simplify compatible regex
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6d69f8d37c85
[4/4] dt-bindings: display/msm/gpu: fix the schema being not applied
      https://gitlab.freedesktop.org/lumag/msm/-/commit/399af57ccca2

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

