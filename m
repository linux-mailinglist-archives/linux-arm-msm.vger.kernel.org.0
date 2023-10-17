Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57F5D7CC316
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 14:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234929AbjJQMZH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Oct 2023 08:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232577AbjJQMZA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Oct 2023 08:25:00 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1162B1B8
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 05:24:59 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-407da05f05aso4119375e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 05:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697545497; x=1698150297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ozeZwgkp+vRFcuajR4h9TKlzl5D3KSTpbDUYKL1UCt8=;
        b=tdy/y2VShZEBLwVBWn4+mLZ59ZtvonngZje7+RE3gZaVnWDbMUODGS5XfnJ1XlWKpb
         VcqGAKp5mxgGehMaCVqxf+PfsO7BnUQwTEGkUVsNzm7GlvOgghKtozG7uB2VTEnfBDrB
         GjAzyMSetyEJJ/j0/rwvXAtkYOXcIxxVFrhmU3AGV8P47MjC858ntcbk96jzZ3h0I38J
         Wd5aNoDS4il9jAORfLrvMSnld46fkjc/vPNC45PVuq2RaBoslOobs1HstURumBIiD4ZF
         8K/H3W9yLbzrLuM31ofCzgzZz52AgUmTtQIutZe1sIAhz9q+Hl0ZleQRCiCE3Wuk44GK
         Lpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697545497; x=1698150297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozeZwgkp+vRFcuajR4h9TKlzl5D3KSTpbDUYKL1UCt8=;
        b=ogR+OjcPPy04uKsbU7I5ihiANO5KHFfEuzkKLhqXEofWxsYcqgxZBw+63oYwbDTtTc
         EZvUWdUfrxcaKYjuJMYlS+c5xWkzWkcfV988bp6KunE5O6WYef1jCtecWqdQ+2eMJk5X
         yW+thudiDfug+ZSD6eSIZdLmfPIXCMUSORbIUt0fHfu5s4UNVIcAHWlEefWKAQMvI8Vn
         3jw5NI7iVJskH6kUU0itwOghUA2627g/6yqAk2xverznzCDHtrcczZlHPJjgyGlWiCK4
         lFL4MDNpij2JKuripuArGd9gDOwVKf2GNZRbNLpL6QlMAHdpOkt9GQyw0crOy5u6oHf4
         7zww==
X-Gm-Message-State: AOJu0YzwiEJv9yvqVRPtELBZ6z4/03WKsWXuB595tYtw3HdHRWHnNIi/
        Tg/1gDmdLPM4cM/PAUTetLnbqg==
X-Google-Smtp-Source: AGHT+IGg8znu0XL6hiUsVG49mOqvM7r3dSunSyWodgCmDxfSgN22OeXYgLx8CiI3+rLp2k9Kcu3OFg==
X-Received: by 2002:a05:600c:1990:b0:401:c338:ab94 with SMTP id t16-20020a05600c199000b00401c338ab94mr1531267wmq.29.1697545497386;
        Tue, 17 Oct 2023 05:24:57 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id q8-20020a05600c46c800b004063c9f68f2sm1524491wmo.26.2023.10.17.05.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 05:24:56 -0700 (PDT)
Message-ID: <044c2493-1294-4760-8e33-51f631265d59@linaro.org>
Date:   Tue, 17 Oct 2023 14:24:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: add QMP dependency
To:     Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Arnd Bergmann <arnd@arndb.de>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20231016200415.791090-1-arnd@kernel.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231016200415.791090-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/16/23 22:04, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When QMP is in a loadable module, the A6xx GPU driver fails to link
> as built-in:
> 
> x86_64-linux-ld: drivers/gpu/drm/msm/adreno/a6xx_gmu.o: in function `a6xx_gmu_resume':
> a6xx_gmu.c:(.text+0xd62): undefined reference to `qmp_send'
> 
> Add the usual dependency that still allows compiling without QMP but
> otherwise avoids the broken combination of options.
> 
> Fixes: 88a0997f2f949 ("drm/msm/a6xx: Send ACD state to QMP at GMU resume")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
Right, thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
