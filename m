Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7736947D0BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 12:17:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244542AbhLVLRa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Dec 2021 06:17:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244533AbhLVLR3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Dec 2021 06:17:29 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86052C061746
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 03:17:28 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id b186-20020a1c1bc3000000b00345734afe78so1297989wmb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 03:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wVK031yMnXY3SmMKEknhUmLtfDhQrZN1O0BSgsFgdUk=;
        b=rK1UzhFPqw84pe94lIW2HWw+rmVKq6EaIbpFAnw6ZCqPxBiWCu/PtB1bxwkuq2dWZ4
         fHPU794foZOkkrVd9yjiLRfuUyXa3YGMY+cR1g6nGy96kBD6J7Fb52EGrD2jZkhhpPx8
         f2KAvrIFTclWCw9THT8pehbI7TM1KdumjtbVu8CIWvj9QrDjWygV++ukZutqFVxjrIkc
         4Qwf7fYRTUrXEz52D3gzhUpkSGUlsAG56JVqpnbC7aXAPLkGsoqsjIEowb+MgcSGlWm6
         PM1HHvGNRY7G45ffMhKHSSGT/kJtESH7+PtS0znc9jObNqyTgcQUIn0ISPPh9fZSZ0O1
         EpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wVK031yMnXY3SmMKEknhUmLtfDhQrZN1O0BSgsFgdUk=;
        b=cJxqIy8E/Zq0sjUy04cVwG4OJTwR37Kp9LQYn2F/6PQCgQHwDeHQjZ0d8kaicdeJQH
         nzWMS7fDx9WSKSEZXJY9Vx15pta0V63AIk+TvViMZVR426GjxaiZ03WQCCwvFgZ3JPWA
         gQ4XMjqeaoLyLhIzcdukrPbezF21T6M3tu/+M48wgR1trm/N/XJ5lXUx8QxFoLlG7ZxM
         68ghXp0DRvUj6ziV3IIrZkdHqafQqbaXvhUJ+DIKNLESVzLodgEguAnGl/jRc/vhourl
         3GfcMNEnDeE8+j8FzPjCDlRLJ1UshViFWX517ILKQt/giafrGkMpTlav98Jwv83s1c2V
         tYFw==
X-Gm-Message-State: AOAM533YlNcbD33iM1Hwegxo/8IlMZcn015qbjbZ/UYMiL96kuSnsfkl
        dx/SjYFaK4+uf8qxE7HUdNflyA==
X-Google-Smtp-Source: ABdhPJzjekleXXqF7vsLzXFMY/qG6/Yx+/aY4TkyoCVvBNYne4YUJFzJkT1Fvc7V/leGnHklMSABjQ==
X-Received: by 2002:a7b:c017:: with SMTP id c23mr588998wmb.137.1640171847097;
        Wed, 22 Dec 2021 03:17:27 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id c9sm1420121wml.12.2021.12.22.03.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 03:17:26 -0800 (PST)
Date:   Wed, 22 Dec 2021 11:17:24 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 5/9] backlight: qcom-wled: Override default length
 with qcom,enabled-strings
Message-ID: <YcMJROV8Kn6foQUU@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-6-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211115203459.1634079-6-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 15 Nov 2021, Marijn Suijten wrote:

> The length of qcom,enabled-strings as property array is enough to
> determine the number of strings to be enabled, without needing to set
> qcom,num-strings to override the default number of strings when less
> than the default (which is also the maximum) is provided in DT.
> 
> This also introduces an extra warning when qcom,num-strings is set,
> denoting that it is not necessary to set both anymore.  It is usually
> more concise to set just qcom,num-length when a zero-based, contiguous
> range of strings is needed (the majority of the cases), or to only set
> qcom,enabled-strings when a specific set of indices is desired.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
