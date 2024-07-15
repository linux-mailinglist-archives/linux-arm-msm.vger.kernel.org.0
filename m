Return-Path: <linux-arm-msm+bounces-26183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B00C9315FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 15:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4E5C1F22471
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 13:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7D918E74D;
	Mon, 15 Jul 2024 13:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bmpFt9Bs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD3918D4CE
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721051004; cv=none; b=OIpo4JzQ7uyWsaQ8XQxHgZIjSN8OjwnHi7XnVcP1R7hRRKXKaB3N7AaDYLR+N5XKBwM6PJgvopYgqZRS68qHFCxentLY8sGvwHDAeFejCY7GRmKOxu1WJD8flwdIghraH3y8sCmw2iP866k7XEkguN8SAdx0oPqtu9YRvfOpIh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721051004; c=relaxed/simple;
	bh=M8zigsqNJE+phkpqp1gyoQZJLxt+QNapc75xhNmetU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W/Eoa5FuagMKlupJ+ZKL5d5/6anlarXi0NIwXLmvKSDHDmPnoWIRQgzEuito7fNxL9+kIsKiZoXvMh5E/rDAaNW63HI4/0neuRP3XjnP1KzloaGIR5U6M/XE/SYMjfTci2jJ5TGBop62Vb/V+WxbGbQ+lI9l1dd1pUc5gP/LZFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bmpFt9Bs; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6b5f128b199so25430966d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 06:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721051000; x=1721655800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeGvR/8lk6Nll/J3UVT9i6hjcln5jvzV7Bpthcn/O4s=;
        b=bmpFt9BstdyV4kcpMMeKdFxVkI/eFpmI0e1bKI8XxPmOtzoUa/Y/+PFgt07aEyqviV
         mlsTbDYj4uuye+0m5PuaGSjHuKuSrZRTEpC48/xhdxYOHePZLPQE/VmhmC9m5ialI5/q
         uflaPJGV0R2Kz4Lst07abcv0C8Nmfazrd5QKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721051000; x=1721655800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeGvR/8lk6Nll/J3UVT9i6hjcln5jvzV7Bpthcn/O4s=;
        b=v/C3fsRuO2zwjSbXceMuPhrK55HTks5NrmaefMxFuXmdm5UpLcxdTXUjogrD4S1Nqh
         K7yG2Ou8XUb011EkPeYErHt+CFh2I6iXnQxTH29bOlF/7Qj57IaBQLdgv58hvpg5eWJ+
         dePbgYdA7P4IAxvmPxapJ3qV+UQdmPZZM00lq7O0nTgQrY+/YUWk079KuynJU3pETlp8
         wV5lk/2KJnTgQQ0vhN+wsYdP1tzHCGp0h17mLulIbb79/RFqyqOGPajOBFfVhqcdgg6P
         RAhetfiwncAA/Vmo45OeWVdZfB8g91JPMUgly9iBRneiaElDbCufGhGFMUR1OJogw0Un
         sVJw==
X-Forwarded-Encrypted: i=1; AJvYcCW70+3HY2nPip70VuFAbc1E8ymyyTd9u8tS/loZBgwbNKAcyXWYo6p9C8AX4UYyI5TRVIRAdH8ObRRas98QjLXV0fHPmaupFTapXyg90g==
X-Gm-Message-State: AOJu0YyavQVB/cmA7UYoUv3PJGwlyOZeWjpyes5kEXdSofd4NdD6M2jV
	nRZS3gWVNQCnR+74phgI3JJ8sgJRdR/CAfNZ5J4vDIYZmatm9axKHu6EPyW/gVlZ4LyRIApk9RQ
	=
X-Google-Smtp-Source: AGHT+IHh6SVDIg1o0ocZKDc0ObVEyH4VUsCBgW3POu3TEjOh1ReyLaWNXG77iFTh7fQe4htFwSP0YA==
X-Received: by 2002:a05:6214:1d2c:b0:6b5:3c06:a58b with SMTP id 6a1803df08f44-6b61c1d4650mr239227766d6.59.1721050999874;
        Mon, 15 Jul 2024 06:43:19 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b761a5393fsm21414576d6.120.2024.07.15.06.43.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 06:43:16 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-447df43324fso489491cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 06:43:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZ0PMOnrxvRKP3gl3KuEpeYoQNodg9bGWC5mLY/EDR/B0M/jRcwymd1CVRcneOAaJ0TJlfARngo8CBbqrGIrob4QmHJpq3AgWT8rdavg==
X-Received: by 2002:a05:622a:2446:b0:446:64ad:ee91 with SMTP id
 d75a77b69052e-44f5a31ec80mr5833341cf.20.1721050996122; Mon, 15 Jul 2024
 06:43:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org> <20240715-x1e80100-crd-backlight-v2-4-31b7f2f658a3@linaro.org>
In-Reply-To: <20240715-x1e80100-crd-backlight-v2-4-31b7f2f658a3@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 15 Jul 2024 06:43:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WLFohKUUFqsPrpRGCer_TPugoM8_Du6=7YcDywFfUkVg@mail.gmail.com>
Message-ID: <CAD=FV=WLFohKUUFqsPrpRGCer_TPugoM8_Du6=7YcDywFfUkVg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: defconfig: Add CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 15, 2024 at 5:16=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> This is needed for the display panel to work on the Qualcomm
> sc7180-trogdor-homestar and x1e80100-crd.
>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

I'd assume that this will go through the Qualcomm tree.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

