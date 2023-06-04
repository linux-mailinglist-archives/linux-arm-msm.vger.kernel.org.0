Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D045A72140A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 03:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjFDB6K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jun 2023 21:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjFDB6J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jun 2023 21:58:09 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3426ACF
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jun 2023 18:58:07 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f619c2ba18so1089090e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jun 2023 18:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685843885; x=1688435885;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yyuq1OAkX1njnwRBO2trMGeyKaw4cQAV1Knyp+U6sec=;
        b=n9E+rRx0AO5FR0rquegNF4I26nDcU5SOvG3whnQ3ArY0bI4PoWP4DRf70ubPAK0bUV
         PrKuzgKBii9XWP0o1uDVQUdljf1CZq2wOOLOZC/XJwDiDu4oB0N3JEOEB19ZGAdsLzJQ
         C/PTbSgKycbx6WyODQdX7b3DwEzWy8rMeDeSKEygJ1rNV8FjiOrVQFwqqSlK2QZgKS8I
         zNNwpJvlKSJs44J3vbiihA+Wup4e38wSUlm31CAdUBdHvJ83laX8iDYOvb2I914vyrRG
         CXXsqR4wqgh5jC9XhNcaQQ/5nbnM/64Q6dlP6kl+ubbZ76B0nBVvFRChFUZZEgYx7EZH
         XwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685843885; x=1688435885;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yyuq1OAkX1njnwRBO2trMGeyKaw4cQAV1Knyp+U6sec=;
        b=IgIA6UIfjJZ368w6YpI+uwcF4ThmljWX7q2ZdYR/8vdp9+grgip8HyfmmOdV67OIRE
         SYExBTELZD+xZWQgeYR79nXbRI7hX/1f5K/u1wv5RudmX8w50zh22cUuGR41c0qiApGT
         lW7zQNFv6/93bqp1ixuND9utl2gwNMDSnF7hPrgh2ID6MOPEBy3Q+/uaFXoYJzihMTW5
         yVrtTlPRrqBV1ATnRg/wLlt1tQc47mWnPC65p+oSyaCMhFKcQFLGRJ6pnEO4AdNo0gFP
         FiTN2gfJ6ML2ZRkjNzvxVNS0bGmfsu1zMTfPnbz0ebJw+w2x5tOitpWxIiK0e6n1oKum
         tSsw==
X-Gm-Message-State: AC+VfDx5Ic8mta0VlQfrq+v0gO6Xxb2XdfcSQu2pRLlfamGpk/l9UdXZ
        PVJQWudFuz8nIpMR5SDDUVf3Dg==
X-Google-Smtp-Source: ACHHUZ75Cw+rmmH9r3AmD2CjoBK8KWeZVioVZDvuSIkimmNEVZfs8IpYHmDoXKzsvs9dItdifAGhXw==
X-Received: by 2002:a2e:a41b:0:b0:2b1:a8b9:4543 with SMTP id p27-20020a2ea41b000000b002b1a8b94543mr2026139ljn.53.1685843885452;
        Sat, 03 Jun 2023 18:58:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id i21-20020ac25235000000b004ec7c0f2178sm645352lfl.63.2023.06.03.18.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jun 2023 18:58:04 -0700 (PDT)
Message-ID: <de718a32-cc3d-849e-522a-dca9a17e1a4b@linaro.org>
Date:   Sun, 4 Jun 2023 04:58:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm: Use struct fb_info.screen_buffer
Content-Language: en-GB
To:     Thomas Zimmermann <tzimmermann@suse.de>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230522191701.13406-1-tzimmermann@suse.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230522191701.13406-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/05/2023 22:17, Thomas Zimmermann wrote:
> The fbdev framebuffer is in system memory. Store the address in
> the field 'screen_buffer'. Fixes the following sparse warning.
> 
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26: warning: incorrect type in assignment (different address spaces)
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26:    expected char [noderef] __iomem *screen_base
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26:    got void *
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

