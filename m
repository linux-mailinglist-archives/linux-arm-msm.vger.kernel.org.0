Return-Path: <linux-arm-msm+bounces-16261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A591D896D84
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 12:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58A6A1F22B54
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 10:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468251411D6;
	Wed,  3 Apr 2024 10:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T1yqPGZW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE03143869
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 10:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712141929; cv=none; b=k9fqlPVJlfHsNdaKH9aURujg0xi2Gh09kgK8VuiJXN122QfAR3d4/E6rY8l1P/ukUwv8hu9WuRz4uYMxa7DxJTm7HmuPhoGXoT3Ozetu/wRIFvsYt57CsoI8P/0UydwN1s7fIH19r7v9m7U7rAY2QOvMZuywOuYIL4Xip4nZXiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712141929; c=relaxed/simple;
	bh=oG53gv1bYnsR+3oYThoPLEkc/yA62gyWOpQkeX36Bao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l0ATQkQgpQfDVJLaSJPCkCBjEXBtnlxv0HZ6GKTAC1E9hEi1Vabyh1RaQcwk2bSq5q/o1TTNtI1cF41nDtOPmMhJRb7o6dF0l1C5C8wnBEWPV/ygYfkvFAWkf2i3DNoxxE5H2epSKJgK9OtGyeZhvP0q9CF9/76LT4PnKNkLQm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T1yqPGZW; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-61461580403so44102767b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 03:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712141926; x=1712746726; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ijhuxt38E/t9v5OAptUPvE420yRI30lm4kqS14TcTKI=;
        b=T1yqPGZWASH1kW2Hf697BCuVGYy0WwnyirOLBm3X9O+qUY1qPXVvPMPvJPDE+tn3BE
         RJ8ieGIRMBODoctGwTfiIC7BS2R/oTQl+WF1Vk/WN//c64tKoUPWR0sBhktIOQ3c32oE
         Shl3VBvgEryMPjpDGEsMl0YuxK+RY09jSsWSWm045S6liaItSaVV5vxGyP1s4wA5nGFE
         HlshsO4xwSVgdHPiOgmBUVHYtR2x/ML46T/X1D8tcwuQr+J9a6UhhtFiSfyoHqIaeYjd
         dVCvH2AJ61Xh0C8YoyLWk2HPubRT/dBmyXH+nfrH/VFfK2tlHcUqjbqia47VFYA0rc2R
         QO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712141926; x=1712746726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ijhuxt38E/t9v5OAptUPvE420yRI30lm4kqS14TcTKI=;
        b=V5L+5cjQQjXY4tMiR68OgRcKpcyoIhNGO6mT1BprRX1bWjXfgIjGsIhBds8a5Wt2oY
         x3V0wHUZfUWVpdVhwsa1xAT+x1eFIslDfRSNt7NVDzlcLSqAdolMQVEkjijp6cwAABta
         Ling0JQVDjzv1biaeDpH7Gx0gcT/7DGxrVsnIiVsvBxCym6lT+ZRs9ffke3z/LmV2yLf
         LDp1WWXrq2mJBqF0f9xmMK41mENOxFvuW66nB+ocsmMGdE46dIDMgpN9TnB0BxQZzFk0
         9qxZkrLvlEwcWLgYsSiSFRcijZakTwCxULS/giAEeB6t/jyMkDVUuduVXSsq85V4IoSF
         KIfw==
X-Forwarded-Encrypted: i=1; AJvYcCVVghyeS9Iv5JBY+bgJxtSrpyXMY7IEgIN0Ig09T02xSE2iGzv7JMG6lBMpyR8xvKuR1+pRP1WIFbh8HnCCTHoIHy/Pc+/dPApwNRgi6w==
X-Gm-Message-State: AOJu0Yw9LLka2eXcqpJFgkRxs3gLR4Mul+EyvN6VZoxc4gftKBcTKlw9
	EAX2o5wEnT712YTwyAbPTrhqf5NEdbwvD0atnvqrVLRtc8obJ8NrLi6ZeAVXwdPJA2FOVP/t3U4
	75vm5r7aRnkXnJ3fANFGPwwfrBfFPC+dly4iYDmrCFUaC2o7K
X-Google-Smtp-Source: AGHT+IFEu76HLwecIeLSCiVfG/XZFd2SSZMu7g2xdSAy4gC49xNdZap/m1Re9s5c7HES1skUINx8X+hL0OWOQbdBjrY=
X-Received: by 2002:a25:3a04:0:b0:dcb:aa26:50fe with SMTP id
 h4-20020a253a04000000b00dcbaa2650femr12927089yba.15.1712141926715; Wed, 03
 Apr 2024 03:58:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403094422.15140-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240403094422.15140-1-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 13:58:35 +0300
Message-ID: <CAA8EJpoeh0sP9iHWU8Q6z9F3_aSGV9qw-WAWtrCTM0nHEdzAVg@mail.gmail.com>
Subject: Re: [PATCH RESEND] arm64: defconfig: qcom: enable X1E80100 sound card
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Apr 2024 at 12:45, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Enable the sound machine driver for Qualcomm X1E80100 sound card, used
> on several boards with X1E80100 (e.g. X1E80100 CRD).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> The driver and bindings were posted here:
> https://lore.kernel.org/alsa-devel/20231204100116.211898-1-krzysztof.kozlowski@linaro.org/T/#t
>
> Resending because I did not Cc Bjorn/Konrad/MSM.
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

