Return-Path: <linux-arm-msm+bounces-30830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 476B496CD5A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 05:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03C86287073
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 03:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABFC1547E2;
	Thu,  5 Sep 2024 03:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="acFfTFhx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C38C14F11E
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 03:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725507226; cv=none; b=tZmUtshMxFulC3JG73NJ5uQKqsozUew6DdaSoEMst1jF80dKMEJINLUD2d9EdFwFyGn3FWhuWGG7ix5hLOwOepmzdlDj9SbFsAH4fUG1qXav+gtLDqBvu7iIuU73FmLllBuUfqTht31j11M2xfEypR+88eq7klurl8qUGFn7FBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725507226; c=relaxed/simple;
	bh=0/AvUFM2cDr1zCzRpmVc63hjqZN3fobq0XwU1MX+OaY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=flSvEbaLsLQAOIjdgDq8VdzJisPsivd6AA73BE8yBQPZTcDg+fUMlMAxR0gPWAB4quAA3oRgirFI//TeGw6OprXtwvcsShlYfKsL005JhtTWW9t2QMMMR9sFK/jvd5rmjyVnUzik4S6a95Vy8STJtJCITGuikDngx+pB6R0S14k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=acFfTFhx; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53345dcd377so240278e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 20:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725507223; x=1726112023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YlSI06JgiII+LEbljNcOEN5o3TgCGGBBtY0a6eABOo=;
        b=acFfTFhx5MBOOCMev2i7usozMhCB9SNphBLtWt2We2zgPCGsIq5KG85tlytvsmMYU/
         2aZHmjrLMvXB+UfIyDfNm8rYdceeJiQ5+7rz40GAeLQrqJPIHPyFTnuVUcEB2lkuGXRy
         mcV3gA4raSJvOy+t/BK4dhc6nNaMqaD+JsSCxuw5lTJCdARJgdFdMFxyHlxEhMBW/0va
         b9uAtdqCibBEi9+SnXAHsjxeMju5vbrRytJDEp18RbTHjr2oPfLxeLUWWqLbhnLl92lQ
         11VYNwK6DLDtXXMjY4XxWOkRlot/7I5tLrQZB8/VntMf+hQBpLv9ZbjmBROw/5tqN3jl
         J+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725507223; x=1726112023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6YlSI06JgiII+LEbljNcOEN5o3TgCGGBBtY0a6eABOo=;
        b=jS5ZIGK/JX2VXwrP96ZuV6xKMiab91pj0lnt5KMMlyNJhlZFD/f5Il5uwBurZ0F2ao
         4kKF+MAMpcaII0IElYQ1Mu7gh0INNjfiLyiY1jlyjxXKxYgElGCz+8dSteTQsIk4yFvh
         eW/pC77XJBEs+MUQc5jjm1GuBqybwFW/frneYIRkNZ7enFp4ZsXfU7GrkdtA5jaHKaP0
         A78V4MAT9RL0ZDucGrlzJCUlPTPovsJBsqLVHUbJgVrNg/BUkMklsETBYwQy7Qr63G3F
         Jp8lU3gnFx0mkB0P3KmSTb7QqLkK+HJEtRLCD5n+4yQr6ntObJp29Lwdbwf0btzpyQjP
         /+VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBNNT6C+qvzDhfzVoETm/9ApF1lIg8emAcWgXgNsqzko3xZdaXgvW/I7lSl1WNgE0WymEhMTG8wGVa6suT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx243AqASWE12sOU5B7HHWv1LF2IVz5Rr1Xf3tR03leMrVUyBdk
	bemOxXe17umtbCxm2LXOGFxFmuvgWb7Ei7EwztINV7Jop8U0lyY30EOU7K5TOxc=
X-Google-Smtp-Source: AGHT+IFdiNBj+ksLwxPJ0vhztLmpIcSqtIaTKRJijHo1cle9Ai37NIz5WdpQOI5G1ytBs0bwWxqFtQ==
X-Received: by 2002:a05:6512:e88:b0:536:53e3:fe9d with SMTP id 2adb3069b0e04-53653e4015emr59047e87.18.1725507223428;
        Wed, 04 Sep 2024 20:33:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53565f6d409sm389165e87.35.2024.09.04.20.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 20:33:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Abel Vesa <abel.vesa@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org,
	quic_jesszhan@quicinc.com,
	swboyd@chromium.org,
	dianders@chromium.org,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: enable widebus on all relevant chipsets
Date: Thu,  5 Sep 2024 06:33:37 +0300
Message-Id: <172550712141.3299484.16591667475186144206.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240730195012.2595980-1-quic_abhinavk@quicinc.com>
References: <20240730195012.2595980-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 30 Jul 2024 12:50:11 -0700, Abhinav Kumar wrote:
> Hardware document indicates that widebus is recommended on DP on all
> MDSS chipsets starting version 5.x.x and above.
> 
> Follow the guideline and mark widebus support on all relevant
> chipsets for DP.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: enable widebus on all relevant chipsets
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c7c412202623

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

