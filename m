Return-Path: <linux-arm-msm+bounces-12945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6BA86C43A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 09:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9231A1F24717
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 08:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7846D54BCC;
	Thu, 29 Feb 2024 08:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fufhJogY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B619B55E54
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 08:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709196787; cv=none; b=U0b2qTdumWpB5xWYrEIox1VKMzCsUf7TEAAKzEgNlWCSQFvt+42jAcWTZfd4m+F8SS18sqnHfQYXLdYpFIuzeaWliPwRDbh403VApmjLEYhedP3KsUO1k+h5td3xGdP84unkrEYKLhBv91OO7QAEsBaIITiTSo/I4EFGBtjNhX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709196787; c=relaxed/simple;
	bh=+9+F5pAsX3uBEzToWT7o1GAoiVQvvNnEk23bpAHtiNc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hVySnV5BDXxhkhjuDlrLiNIKur5mvy7Lh4ehbkl7WPwsBMXil3uvV0Zsgcs5M6GlkXWFtxJYA5rpMvx2E9tJk7QW3BA94ygIEecJvYXHUdZtujUpII4KUK+eZ5aOONF5hlWmFIawAqVZGp2yxOXOzNryAQESbiHFlOHS0JMOGOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fufhJogY; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d220e39907so7968291fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 00:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709196784; x=1709801584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YCkAMwndPY5JXUyFNPlUTDBu8Mn74IDbgKtuE9Roys=;
        b=fufhJogYdGjPPsEvxVeZ0Lve43/aHlK89Ep3ygvb/Lwog5UAF7UQ+AH2VINIWziQPg
         MClo/R/vusGb6ACejK8FCvkJs9ImIujY45nAfzl7yKjkWv8QBcaPvqPO5ao/5pt0ON1E
         7Gt9iAOe5Q5hvQh/yFuDSauGcUnjE5Me11QCHgNFms7mYM35MWN7HqaZakchcOqmvsAq
         WCsyHyfSlPobOiEGbxscu1avzb64LXgc2/C56hdFN2vi/divaxuNeBsciE+sn3Xfj+wN
         8NpIiy+LQ0lFNAyMPFBCBQX/L7k6MIf/icb6Mwp6SPfJkvS6jnTLjAUCEvYLDUqYflL+
         0ZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709196784; x=1709801584;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6YCkAMwndPY5JXUyFNPlUTDBu8Mn74IDbgKtuE9Roys=;
        b=UFxm7pZ/oUo3RKTYlRrM+sMZlTnji8ovXZ+ze2rTkKijacBfLaoilrvbdravsSsDrx
         A+ZH4N4vkAoTCsootoseZldiHJ7w+g2BKOSgHhFwpb3XBb9CU4BvTD3IlDmZqzNCabuJ
         1zaEAO7cQdmNomMN2Oms4qDq9E8LdI/Nj2eHCTrEij527eyRhzmQQdchz1CnXfm8NnVO
         Q4O7LypUep2daFEjkYhwPOcJ+1Cz09yWc1ELDkdKWDXImeQr+K4cWQ4AhiB4AvZwi25s
         g+wJXGej0QsvhLuf5QnjHXaHsHRJCgPd3AnTBdQSj7y5TNU3pT9YgDHKRdjJR8GSkWvj
         bmlA==
X-Forwarded-Encrypted: i=1; AJvYcCUwopFXxXwCk1I1RZKQZwOxrdJt66Bb1iIb1qnRnnbSGsm9N5TmTqJ+z7b03kzTJ/A0a8H0TflZQhqxi8yjdfl0U802cnQaZdK75ZauXQ==
X-Gm-Message-State: AOJu0YzfKF9zpyZLHiOcWWeGZyTI26AVQJVi9FEDLhquqEI8uaPPZRN1
	TRYPGFjgECtmcW+dJ/7flyxYjLGi5w/plFGzGeaExk0LFCnlm0xjwajdY6n3UVo=
X-Google-Smtp-Source: AGHT+IHi3einEO6k8IOuS7H+FVSXmqnBzg3Xm6fjChZanRXFLI+Eg9cbk9F9XQqbm4zd3PzaOUZEUw==
X-Received: by 2002:a2e:854e:0:b0:2d2:cdb8:2dcf with SMTP id u14-20020a2e854e000000b002d2cdb82dcfmr1057749ljj.36.1709196783988;
        Thu, 29 Feb 2024 00:53:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id n12-20020a05600c500c00b00412abfb0ed0sm4715433wmr.0.2024.02.29.00.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 00:53:03 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Richard Acayan <mailingradian@gmail.com>
In-Reply-To: <20240209001639.387374-6-mailingradian@gmail.com>
References: <20240209001639.387374-6-mailingradian@gmail.com>
Subject: Re: (subset) [PATCH 0/3] drm/panel: Pixel 3a Panel
Message-Id: <170919678300.2018319.4183838499915522690.b4-ty@linaro.org>
Date: Thu, 29 Feb 2024 09:53:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4

Hi,

On Thu, 08 Feb 2024 19:16:41 -0500, Richard Acayan wrote:
> This adds support for the AMS559NK06 panel with the S6E3FA7 display
> controller and enables the display subsystem on the Pixel 3a.
> 
> Richard Acayan (3):
>   dt-bindings: display: panel-simple-dsi: add s6e3fa7 ams559nk06 compat
>   drm/panel: add samsung s6e3fa7 panel driver
>   arm64: dts: qcom: sdm670-google-sargo: add panel
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/3] dt-bindings: display: panel-simple-dsi: add s6e3fa7 ams559nk06 compat
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2689b33b88641a3b9a8cc411a0c8094cbed7e871
[2/3] drm/panel: add samsung s6e3fa7 panel driver
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bf0390e2c95bf630b22dddc7cde5f83762b658e5

-- 
Neil


