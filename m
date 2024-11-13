Return-Path: <linux-arm-msm+bounces-37780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CAF9C6EF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 13:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3658A282267
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 12:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5F02022D4;
	Wed, 13 Nov 2024 12:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IFFeFxte"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5A2201035
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 12:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731500493; cv=none; b=LDvSzMjT/7/Wvq8WUCap1gYR+uGedWkcFoHQFHJvmzVGNsjLUfH51BTMz9MF0XX3U+Mqled9VzO5wb/R8l7Wb9lk+ZDx7U8gy6AHdk+oDhumvrhCETirlouztWlFupSZ7UzBQT7WyRBKlBzBu4EUBnlaze7vA+LlZmE95F0rwbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731500493; c=relaxed/simple;
	bh=Fjca1LWzFAdCd0y6iIxSu0s0Obt4f3zGnd1zEofN2SQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJ9Elav9soAPoxTGsIuEO16yI9NJ6A1SogQu4Ypd91mljlWLe5prc8ODpC+q90tXqRnQl5Ob4la/VxEyzO2lAkTClP/470Lqh+02z0naui5WdNZ9ehcmSlv+/VT/W6plqPelO/xeQUyAfDpN8Exn0qtigMoiAYH7MlqNnymcfjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IFFeFxte; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e290222fdd0so6885351276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 04:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731500489; x=1732105289; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JsE6HZ0BDIdFm8pHUV9wjAijdgzctcE9O8piDmD3bwk=;
        b=IFFeFxte1uY32jKGhbDsyIdhtHi7tULp16Fe7422DFwk6FR4gOK6WbpC0mXh+jjcZB
         Cj1nXPLNBAngJVnV5N8mXMpgREZQqI7L3Ey9haiiM7+Ey1xMIkgLyFA7W7PdaENhOEm1
         EpODEMLFQiqW8JYty/Qti3C3a/YwlH7N9JpPjmk9KWGOOQuH0lx63OUX2oBLrKWXBEFE
         kZYn0DyviLtnhaGLziA388+iLjpbn01hpubtmm8/c41prnHwPjFWPE3xuE6PdPVMhW1H
         4zjaV7L7jyw81NQ05uqbhx95cQCiFjoR2HU9hE27EECHZesItmsctj1CL92OiV0wXwtA
         K/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731500489; x=1732105289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JsE6HZ0BDIdFm8pHUV9wjAijdgzctcE9O8piDmD3bwk=;
        b=s6blAPF0Gqh96SsGdkYwsvjuTZL8KHc1pwdkAyZmiSu/bxWlJjwBikBEaJh4Rp3FrF
         SEZxrYYSPU7LSAsIYVHE2ixo+yY409Edv6vxzQ0ZjSHwwsg6EcFPtR2UacWnom/c10zJ
         ZQBghL0579ayQd5QE5RnV0y8xe+Ohy4JnnHV06q05dUMXlMpEzDKBqbbUp+Q9HDvoeyj
         hG2FeeecZ/Py5pjx3l2AFhLmjwEYbysr2oHyyKVMdIJdI3dcqXidaPu2PwU/Sobcjw4M
         ESgdDoflI23hIJCABzzFiJGPvemDzQ1rfovMBpXbKB7X2BTsovgEDPPrgVmo9d/Ho5MY
         2srg==
X-Forwarded-Encrypted: i=1; AJvYcCUsysEPJzaljb7vEipcfL9SIP5zUU8Lb3fQF7AuMURNeJSlCL4vJRnu+gsBHZVXyL6QlHXKospJG0gS4ZCB@vger.kernel.org
X-Gm-Message-State: AOJu0YxagY1aLWLg7t1X4Xx4U28d0VtIUVgCC8U0TovIxKxdleeFLk9k
	nOTMOaOrEceoCWQghoFfa2OEghxIseltVd6RrF7Emf4YLrw7wwTZS4XDNrvuJmnVGYLkq9Rb0Dk
	QK2ZEV6AUUXfwERByhBmYssC563NkQz3ASAZjSA==
X-Google-Smtp-Source: AGHT+IHlEW9Y6a6VKxz7Rj8wBbFwf85y1XuiF8DPZGiTfkNkpU73TSXFVeGlAI184r1k/vIlZa0la+oK03iLvn2Otwg=
X-Received: by 2002:a05:6902:1101:b0:e30:d443:8490 with SMTP id
 3f1490d57ef6-e337f8c6c9bmr18265860276.40.1731500489516; Wed, 13 Nov 2024
 04:21:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-9-2873eb6fb869@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-9-2873eb6fb869@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Nov 2024 14:21:18 +0200
Message-ID: <CAA8EJpok20-7HXJJbcJi8YZYCU68g_DGThR_ckjBEz0e+gGBSA@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] arm64: defconfig: Enable SX150X for QCS615 ride board
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Nov 2024 at 13:53, Fange Zhang <quic_fangez@quicinc.com> wrote:
>
> From: Li Liu <quic_lliu6@quicinc.com>
>
> For the QCS615 ride board, enable the SX150X to activate the ANX7625
> allowing the DSI to output to the mDP through the external bridge.
> The ANX7625 relies on the SX150X chip to perform reset and HPD.
>
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c0b8482ac6ad7498487718ba01d11b1c95e7543d..599a339a19435efbee7a5ef80c093b0e8c65f7ff 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -631,6 +631,7 @@ CONFIG_PINCTRL_SM8350=y
>  CONFIG_PINCTRL_SM8450=y
>  CONFIG_PINCTRL_SM8550=y
>  CONFIG_PINCTRL_SM8650=y
> +CONFIG_PINCTRL_SX150X=y

Your commit message doesn't describe why it needs to be disabled as a
built-in. You are trying to enable it for all defconfig users.
Also the placement of the symbol is not correct. You've added it to
the section with msm pinctrl drivers, while the chip has nothing to do
with msm.

>  CONFIG_PINCTRL_X1E80100=y
>  CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
>  CONFIG_PINCTRL_LPASS_LPI=m
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

