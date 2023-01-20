Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5021C674EAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 08:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjATHuT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 02:50:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjATHuS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 02:50:18 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21072D7F
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 23:49:58 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id mg12so11849712ejc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 23:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BdhCjSy3SqnjWjDLB4IHqxMmPrap4fRlZrofYhguHhQ=;
        b=kr0qXC5yFUKl0L2KrHHQGmSu2kxGGeqtAIMq38iN7JnKS1Y/kmoTfYqWxV0GQvuej2
         krhEokJynI8KXyI8u8QUBHbYZobaDqApZZQHq8CuczZtsSYH92bVOEhvNKkYdR4MVrdz
         WjN9YY39rexcT18tPKx1BORtglR8DF7uAnFO3eh+uWB6oPA6/TE2/FS/OUf4lCf17F+k
         ifou1LFvh3lfdivSXjgtawzs+GgkdMY3zBUzhxmKuyb5138aeGmFkg2Vb1V+QCeQ+gOT
         zwuYNTEVK6A3FTRJdbg4SqqkqH8450+RopzwjSe4xwaT6Flwmiud+d8X3HHCPmN1mmVJ
         XjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BdhCjSy3SqnjWjDLB4IHqxMmPrap4fRlZrofYhguHhQ=;
        b=E7Fgd/7xBgm4GDIPxrDeWSj3H6K9LWkKfdXnMw80xraNDwXOdhluNvyyY+CuDB5vjG
         IHlLMbc/2e4kG1R06EV7o0hxUlTefa7QKCf+TSMEOzhP/H/vtYSMO8EC4Yn0krbIaSwz
         YVimvtUaplvbSnOF5nhCVvo6awkktyAD71TUPIaRX5DokYKyo1dPOemgGkX5fFq6PbaV
         qrpL+xiS2AXFTnD9BlgC+4Etm5WeBBreolpmNU+u7dGhWHeEcLeak5UZOGkCcwXrTWdJ
         ZVwTpHPxbXzbuIjCxy8ZCsY1mQGMHDqrvWGf5w8W3OJV9w3U43tRaJUR6wCgf8vLVjZl
         lyyA==
X-Gm-Message-State: AFqh2kqfkDbZQkCCvDs0kXXRfJMoHuTUxyEa6hjRAAM6wgkIcRXm0CFD
        CD2mSTxGs4qV4PMz3OkKu7kwUA==
X-Google-Smtp-Source: AMrXdXu+nKsOpir3oVd9sIYTS7eJGx8vz6+wj1IeM5SC24ERfXKmFDBCCEcIUoQmMocvOYiZZ7lKnw==
X-Received: by 2002:a17:906:a393:b0:7c1:1fcf:266c with SMTP id k19-20020a170906a39300b007c11fcf266cmr14312899ejz.14.1674200986580;
        Thu, 19 Jan 2023 23:49:46 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bi12-20020a170906a24c00b00868ef175e6asm10221725ejb.74.2023.01.19.23.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 23:49:45 -0800 (PST)
Message-ID: <6873374c-d221-534e-7a28-78836c6da4ad@linaro.org>
Date:   Fri, 20 Jan 2023 09:49:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3] drm/msm/dpu: Reapply CTM if modeset is needed
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, quic_kalyant@quicinc.com
References: <20230118233848.611-1-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230118233848.611-1-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/01/2023 01:38, Jessica Zhang wrote:
> Add a !drm_atomic_crtc_needs_modeset() check to
> _dpu_crtc_setup_cp_blocks() so that CTM is reapplied if the LM/DSPP
> blocks were reallocated during modeset or after a suspend/resume.
> 
> Changes in V2:
> - Fixed commit message
> 
> Changes in V3:
> - Added mention of suspend/resume case back to commit message
> 
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/23
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

