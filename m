Return-Path: <linux-arm-msm+bounces-4805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99668813914
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 18:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E5C51F216C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 17:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E27675D5;
	Thu, 14 Dec 2023 17:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QMX77YNk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F2F0A6
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 09:48:46 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2cc43f9e744so12022821fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 09:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702576123; x=1703180923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjzqvPNodJ+AYwzDBCkKXGHQ6gaMigpuT4ZV+tVtwn0=;
        b=QMX77YNkSHZTpggSQrIC5N4wr+OHe1IQP5U81JUUZFQJ1OpjhW7nASj9ckutE2M99X
         bSnHg95vFOJLS95EY+AuIcJi5GBrASccia9+X1lRDSTvpoPPnSej5yGQsrXFTZVVZ2V5
         CKXzHiCHaSKlNrDEGT2S7vhue8x5iIwVWALVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702576123; x=1703180923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjzqvPNodJ+AYwzDBCkKXGHQ6gaMigpuT4ZV+tVtwn0=;
        b=SMQ4wT9+P1MzPk3xpBQXTD1jwhNrP5xIFAu8i0ELXyI+CfmD9R3fm286jlOaU6vNUO
         sMrTpAdsdTobuWDl4SEpkri7v4MY41cXJv9bINurL+ED8Yq9y28OR8aelXr+0oknKez0
         LdWY6AD6LuaRi1g2vDpz61WshhTYQfw5HwZzJHZJKGcwHaXoWrjU2xqpOpZqiRP+AE1K
         jzC7sAfyG8yoteOoyy++OhNKr3sulgCuRTiepSGFfc4kOa5zgc0+U5ohirPjjDAxkLNk
         7PiCNUOxZ3/tIjGA4dTFhNA5hHa3NIK79w0XQ68IsXfOrg9dYNGUo1VhbbNNvaxaWw1p
         8+0Q==
X-Gm-Message-State: AOJu0YwkVUaHvUUQeBDUJ9hDEOjbTX03vRzwe6i/Sosou9EVQdYWSf71
	1r7cosZxn9RY7Na5HfTsA/zqo0FvDZg/rHAFFnVCvakN
X-Google-Smtp-Source: AGHT+IEKrvE+ICJJPfWEGCiA83SsmMSMIOxARbne1LtvUReAhKpPFJcPG7he513fQUvncZr4umw+hg==
X-Received: by 2002:a2e:5c49:0:b0:2cb:2847:877e with SMTP id q70-20020a2e5c49000000b002cb2847877emr4486212ljb.0.1702576122964;
        Thu, 14 Dec 2023 09:48:42 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id l12-20020a50cbcc000000b0054b53aacd86sm6857248edi.65.2023.12.14.09.48.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 09:48:42 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40c32bea30dso1735e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 09:48:42 -0800 (PST)
X-Received: by 2002:a05:600c:600a:b0:40a:483f:f828 with SMTP id
 az10-20020a05600c600a00b0040a483ff828mr554730wmb.4.1702576121615; Thu, 14 Dec
 2023 09:48:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214-topic-undo_ddr_stats-v1-1-1fe32c258e56@linaro.org>
In-Reply-To: <20231214-topic-undo_ddr_stats-v1-1-1fe32c258e56@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Dec 2023 09:48:24 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W5V7XO-h7DXxQgqEYcN0R2oHTJ_3G06bY8tKGtjKySRg@mail.gmail.com>
Message-ID: <CAD=FV=W5V7XO-h7DXxQgqEYcN0R2oHTJ_3G06bY8tKGtjKySRg@mail.gmail.com>
Subject: Re: [PATCH] Revert "soc: qcom: stats: Add DDR sleep stats"
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 14, 2023 at 4:25=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> After recent reports ([1], [2]) of older platforms (particularly 8150 and
> 7180) breaking after DDR sleep stats introduction, revert the following:
>
> Commit 73380e2573c3 ("soc: qcom: stats: fix 64-bit division")
> Commit e84e61bdb97c ("soc: qcom: stats: Add DDR sleep stats")
>
> The feature itself is rather useful for debugging DRAM power management,
> however it looks like the shared RPMh stats data structures differ on
> previous SoCs.
>
> Revert its addition for now to un-break booting on these earlier SoCs,
> while I try to come up with a better way to enable it conditionally.
>
> [1] https://lore.kernel.org/linux-arm-msm/20231209215601.3543895-2-dmitry=
.baryshkov@linaro.org/
> [2] https://lore.kernel.org/linux-arm-msm/CAD=3DFV=3DXX4wLg1NNVL15RK4D4tL=
vuSzZyUv=3Dk_tS4bSb3=3D7QJzQ@mail.gmail.com/
>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reported-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/soc/qcom/qcom_stats.c | 187 +-----------------------------------=
------
>  1 file changed, 1 insertion(+), 186 deletions(-)

Tested-by: Douglas Anderson <dianders@chromium.org>

