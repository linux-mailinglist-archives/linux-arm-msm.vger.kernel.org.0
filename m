Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51F971DEDB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 18:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730449AbgEVQyP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 May 2020 12:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730445AbgEVQyP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 May 2020 12:54:15 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B387FC05BD43
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 09:54:13 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id n18so10478975wmj.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2020 09:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D41fWNXM4E76M8otqHIMLX5Q3+yBUTACTvwrcVZCAHI=;
        b=RCmMVi9Dz1XooKApIlmF1/8QpJLXFt3vqBRHE/xJ1+/s2cZoiFtvpRnyTQr+QZ1J+J
         sslyEgIpgGpjhaf/POsxjPOa8ei054v1mVkZfJ034n3zpg3kejPKw6y4Qf/sD+sgQrhQ
         oYw5SHFNTvGu/qnstCoHrCChbfIFsour/n1ea68GTuMX0pEZteNP1PJ3Qtn5Vp23Rgfg
         Ij7VM+y0GKXM+uGgP60c6jU7xBGlbfMVbRlrNMFMB1cWxHmwuqB7i1/FxMbJjlfIoWPQ
         UocIw6nMYeMb11YIIz2wLh/lQjZK5+Kb2EShXKAyo/RUEcpnLmdujqwj3Vq+p1b42Dxt
         1yiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D41fWNXM4E76M8otqHIMLX5Q3+yBUTACTvwrcVZCAHI=;
        b=XQZFQaFMqi6z6+1G9rXCnzFA0Q+oWFbdjcmeEeSXJm5OtOId/EW2ZUbMaPCaLyvyU6
         sWEkm275nOwEu1YoGpJe66qgCI4caPsSVd5Tf1NXo7f6J+XFn+rjFVKatiFfJeIqL4Gq
         Pc20dxM84Y1MeIy7hJd9nZx/mcNysUbF14VDWn7vLA5U7DyiYJlCVv1dOUH1qSfThCAT
         JhnCqf91XEl3fvhXZooaC2KqjTNcHqHNuDXL/O+L1NZO7HvFOdhupOKrmKDTeKc6v1EY
         R2ilcrz4uQceUm4WO9NibhTS+1xudrVC03AgOTxbsKyRQNFENDLsBdp8J0FInPlg8f1V
         vg3Q==
X-Gm-Message-State: AOAM531+KU0rro8PJR9D7SLiyjrgzGOJqqy2jZLJEMM+g79zeUrnkGFR
        PhBJDavHpXpyy3b/oib58FadDA==
X-Google-Smtp-Source: ABdhPJyLfvpzWF8i9mPj++40s7RpjPi9tUhZKsxcKcAaVR76luGftMkDcwTSHTC4eWCULe3ztCEQ/Q==
X-Received: by 2002:a1c:2b46:: with SMTP id r67mr14881888wmr.160.1590166452302;
        Fri, 22 May 2020 09:54:12 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a82f:eaec:3c49:875a? ([2a01:e34:ed2f:f020:a82f:eaec:3c49:875a])
        by smtp.googlemail.com with ESMTPSA id z10sm9985907wmi.2.2020.05.22.09.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 09:54:11 -0700 (PDT)
Subject: Re: [PATCH] drivers: thermal: tsens: Merge tsens-common.c into
 tsens.c
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org
References: <e30e2ba6fa5c007983afd4d7d4e0311c0b57917a.1588183879.git.amit.kucheria@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <4e0660a7-4603-ca85-3c16-703f7343b7e3@linaro.org>
Date:   Fri, 22 May 2020 18:54:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e30e2ba6fa5c007983afd4d7d4e0311c0b57917a.1588183879.git.amit.kucheria@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/04/2020 20:14, Amit Kucheria wrote:
> tsens-common.c has outlived its usefuless. It was created expecting lots
> of custom routines per version of the TSENS IP. We haven't needed those,
> there is now only data in the version-specific files.
> 
> Merge the code for tsens-common.c into tsens.c. As a result,
> - Remove any unnecessary forward declarations in tsens.h.
> - Add a Linaro copyright to tsens.c.
> - Fixup the Makefile to remove tsens-common.c.
> - Where it made sense, fix some 80-column alignments in the
>   tsens-common.c code being copied over.
> 
> There is no functional change with this patch.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
