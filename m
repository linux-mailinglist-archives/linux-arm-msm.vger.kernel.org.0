Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03F9264CFB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 19:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238257AbiLNSxC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 13:53:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237128AbiLNSxA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 13:53:00 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9C629341
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 10:52:57 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id s25so7616023lji.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 10:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZseIU9pUHVwznNtxNlFxx+0mTPXyTHR3NZJ8jxTNHvY=;
        b=r/gW/N2Pnn4oZW8y86l9QHLF343OH2bshWe8KXeJ0yZ3tWuEcwyRugUz0q4xtyDE1o
         cGWrdvNidcO9AiiaboC+4oTdrw+29Bm8FDdoRZXbnfjdJe/Cto/H5RvQTS58jWylWX1K
         SZyM5/ZHedIIs3MDjXFzCk0B7wntCny+eUl+Ui6cx07xFFqOwCK5W5X3zQtJx14x6c5i
         YeU0DexZQtJfMT/w2tCslRmgsZAtV681kCGIU/1Jo03bVYZna9POL3J0x1noKdjgocZR
         n4ncmQzYUp/aBrcoiU+A5tP3hxbdzICfzSi+O/oP9XMIs4Q5OU5ERsgBzeRc3xmu/JCn
         wVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZseIU9pUHVwznNtxNlFxx+0mTPXyTHR3NZJ8jxTNHvY=;
        b=k8G7xzytM2kSza4L4qk7zS7cN4vING8G4Bbiw+5EYKwQmC2eDgY3zWAilRcNI4zkCs
         tR8Du6Hlip8cfz52jjDsFpyamt3P6o8KNsXA7wSQKwS6y+5Sima5MGRQTlRWSw/x9+c/
         WVSLA/oqntMobdcqi7ajwp+265PjuDIwg4G51RWTZV5UnJ7HO6dPc7hLCxWe/UKUPBuf
         FX9BKk7kgMb+r4K9lJDInWMryRzWGS7HeIgtsKAH9JTfZUDRfybiYw7CC+IigN+/Bkw0
         XeZ9NRboo9RDXpnlTwZoz1ytqlu+ggN07lVPJL1mv62mXm+hIropy9CPTDViLSFuofeF
         8QUg==
X-Gm-Message-State: ANoB5plhczxpHMRUYo1KEjCNkOekpate7NUoCkxVxvfMb6wCmleJB6N6
        NtoYPqNdXTzPudWx1PeRabi8BQ==
X-Google-Smtp-Source: AA0mqf7ZgNkE56lYnu/RzMo2/dyqB/FcOcbFfYQFPy+YE495hfWhIWasUAYLlY1RxV/76aJczrI/Tw==
X-Received: by 2002:a05:651c:178d:b0:26f:e87b:d3bd with SMTP id bn13-20020a05651c178d00b0026fe87bd3bdmr8121650ljb.39.1671043975587;
        Wed, 14 Dec 2022 10:52:55 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q20-20020a2e9694000000b002770eafaafbsm695766lji.99.2022.12.14.10.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 10:52:55 -0800 (PST)
Message-ID: <ca33cb5d-363d-dddd-4ad9-62f8a2d87bb1@linaro.org>
Date:   Wed, 14 Dec 2022 20:52:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 4/6] drm/msm/dsi: Use DSC slice(s) packet size to
 compute word count
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jani Nikula <jani.nikula@intel.com>,
        sunliming <sunliming@kylinos.cn>,
        Sam Ravnborg <sam@ravnborg.org>,
        Haowen Bai <baihaowen@meizu.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
 <20221213232207.113607-5-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221213232207.113607-5-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/12/2022 01:22, Marijn Suijten wrote:
> According to downstream the value to use for WORD_COUNT is
> bytes_per_pkt, which denotes the number of bytes in a packet based on
> how many slices have been configured by the panel driver times the
> width of a slice times the number of bytes per pixel.
> 
> The DSC panels seen thus far use one byte per pixel, only one slice
> per packet, and a slice width of half the panel width leading to the
> desired bytes_per_pkt+1 value to be equal to hdisplay/2+1.  This however
> isn't the case anymore for panels that configure two slices per packet,
> where the value should now be hdisplay+1.
> 
> Note that the aforementioned panel (on a Sony Xperia XZ3, sdm845) with
> slice_count=1 has also been tested to successfully accept slice_count=2,
> which would have shown corrupted output previously.
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

