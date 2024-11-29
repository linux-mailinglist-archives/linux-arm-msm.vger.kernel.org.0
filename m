Return-Path: <linux-arm-msm+bounces-39593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B90889DE81D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 14:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 577CCB20ADE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 13:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F419619E806;
	Fri, 29 Nov 2024 13:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nzgesgoF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3732319F430
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732888454; cv=none; b=Xl0Pxy4ItjAuiFngajmIe87ukWquura2k7CBrxyembmgEXvZOydN7TM5fkzy5N8Zwvr/ZDItmnkPETcdFnFam+STIi4mVzCLboh94WfRriZK/W0yJCo/5HjxY6edC0f6vZqmBmmE30pWoa1ICG8jWutFBQwS3JeUzhvwGjKzxDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732888454; c=relaxed/simple;
	bh=qP7lwKEdHMld7lFkjHFyab/jSeBsx5t8xely6eOKcGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNegKoAe9E3zAp4n+elX9WBeeEzSp8V6xECbzeTVv89lAuxVIISzuXZSQIkATqoAPY7mI3D6pm16aBooQdQInMYBA/T5xDr7g6gsEcf9ebtlILnAS1HohHnq7c2TxHfIeLya/ciwGj5/Lvbsq3Cd/rCqgNiAILHyBQRQ66va95U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nzgesgoF; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5cedf5fe237so2113048a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 05:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732888451; x=1733493251; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jzfj59habuKMWPss+IaBeegA7WifSrplhAuuUyjLmTI=;
        b=nzgesgoFc0wr0GqpK1HR64GD5xTT5QjGbVr0772vJzQ14cd7vWVW0HTLhp1QeBqIYq
         I9DEJ6Z7NezqdXCHizwoCOdCTU0LdTr9YEqil3Q/0MIOF8Q7ImG6VUPcRglJ2t3OZuvG
         ZrYP3izda+dwL1qID3Qsg6s7utogeiztocTfn5R8sDqdozSk5oimkEFEwNBcvANmZ2Wo
         iPZ0jsl94KRJZ8F6gED3D2XmPGlRNpN3QH7nlW5iG45dGHab2NKsmSgZpP6Tz+NpP0Q5
         zFURxtAx96J6oh7G06+OUfouIzTKyVq74K86uKcDwZlzf9KOqfMaxsUEKNgWvU17/qXa
         j2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732888451; x=1733493251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzfj59habuKMWPss+IaBeegA7WifSrplhAuuUyjLmTI=;
        b=K/Doy9ezvp+zlSt5ZtptrJ46RzfTDgHjYnfeGRbYV06JEApH4QSte8ACArfY65r5ho
         nswP2WfwE5BQMstAZTIcOVavXZY+uIRpCkqBs9za7kIUibRSAIqcTomUDy0Q15ZgLKu2
         LudHHugQcEJVpGyKJcXj/G01PA5D1PHoceWkzhIceqKBxnxC5gaydMRspqQ4sav3J1yA
         KyTVOef8TAJGkbT+q2gICAZb5FLM7TZPEHzdVYu+DvycycRU5Y6MkfE+X+qKbs6+yc3R
         jRwUlxRlh1Qd7V0nMBMGwKInaGtsSMAxWriyu5gZYCeYkZAuO35yr85HOQvrtYtlKA/I
         iKmw==
X-Forwarded-Encrypted: i=1; AJvYcCX+uLDVWneL+R6p/lf1N75wDe3fw73tDI4TXq1Ct3u9wlofqMCaQBfWVHBojaDobFZMRkszvyGeIxIZ/E98@vger.kernel.org
X-Gm-Message-State: AOJu0YzH87FGQRLiHcSliz4Y1I521MyjmhmkPmrgCnWb/4eIAmPeBoMP
	h8x00+m3DgRWZxaRAuxgxM1+bD1H4GtUJos2Io4Z8F0fgJnctUOzd6WIrCae6kPWcmADbOVieDM
	nb9Xxv/hQwpL7CkTmg55OHY3Xl1KgVFuflW5n2w==
X-Gm-Gg: ASbGncvVZ5/BVbe3lE3kzs51vBFNfOO31rRFZkvtcQAs3VhxtLTu3FTraJTrjBHL9il
	bvJwzEtmAcUGQScmygom2vYzWwvfnV6U=
X-Google-Smtp-Source: AGHT+IGaA6t4/2a/mNA1h9b1zR06PmCO6tMyJ5TuOWa0jZCc/O10Qzu+rMnQb6Tj6pv0TWbP4VGQEBjG3I0WDrceI+I=
X-Received: by 2002:aa7:d68d:0:b0:5d0:8676:3ed9 with SMTP id
 4fb4d7f45d1cf-5d08676410cmr7819763a12.8.1732888451493; Fri, 29 Nov 2024
 05:54:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-4-09a4338d93ef@quicinc.com>
In-Reply-To: <20241129-add-displayport-support-for-qcs615-platform-v1-4-09a4338d93ef@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Nov 2024 15:54:04 +0200
Message-ID: <CAA8EJpqDJm6xh2oCkED4FF+1j8qt=u7B=7XADtR9JOkZZxsDkg@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/msm/dp: Add DisplayPort support for QCS615
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com, quic_fangez@quicinc.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>
> The Qualcomm QCS615 platform comes with a DisplayPort controller use the
> same base offset as sc7180. add support for this in DP driver.
>
> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

