Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B222F4E5014
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 11:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239753AbiCWKM7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 06:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbiCWKM6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 06:12:58 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A57BA76673
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 03:11:28 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id q5so1124057ljb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 03:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jwgWA/X0RRXgl0WnFOwsjqRBGwN8mzbJny7zhdufmd0=;
        b=MCGBOFs+rKcllQq9+jpxTmw+Mrwt3rLzBEHOXYTOMpEInm/iW6w9gtrBCzXZTRHsmR
         5JTSDsm0tSD8QyYINAWMwRGfq4pPbH9P9hGyzeGtxPyBnFGmqltotUK1NfHexgCZeTUg
         kfBv6ila4lDc9DlwXzBep5qIxkUh32iFChC3fdoyhJ3+9bYK+JLyowwWtScMAa8ugjlm
         SqFhlOZnVHKaEcTwijlDLYb9C2g8Qc0zKkkrh/gBlu5Q3kAwhu+lisUggcZZuhjPVB7m
         bXol6KaGDYVR0LVOtjevajppvklgynnZ6L3mj+ibzbnRDxQ+rmLrLVG7+Fev1t0nSHTS
         g8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jwgWA/X0RRXgl0WnFOwsjqRBGwN8mzbJny7zhdufmd0=;
        b=4xnlQS8qKjnkL1DsiWz7RCMxGLV78UxXdWhV/+K1cSj9nlzyywRiD7uIO4cutzjHW5
         a0pzYg3ojajLB8i7e4FZ/i2zSV3RcoiDrX5X87VpnHho2JAJ77ve/S1+kLeph8tiVeLd
         PKtWJfu8J1Z2vnWL/ew4SmaPNZqfQaapqNJyqLTakQGpmSIStw5tqsH8jpij8K8KMmF0
         fGI/DWalQ0q81mwFQr4uLNCGleHdFTZQMrD432PyN4idcF4S7Op6q10xnCjRSwTPC3se
         5zvRKn58zIERcmzb3UF+R0DfKWvTcguIHGtQwr3hEgcTOAuiqQD+ULSCr3z28DBL3aQz
         AKYA==
X-Gm-Message-State: AOAM533Ik2NofXnP0kUhJ6YANgX6fJVKsAapXMq2f0jjtPkZlb3kX1jJ
        qs9iM8d/lK59H9KQeeLrUykAOdJhCA2llg==
X-Google-Smtp-Source: ABdhPJw3/4BmsBQX6KSLouGF3oSZXX6Gpptahf03S0Ln5K4DaU6o4La74k5NDOpjqtmM3ZLH64m+sQ==
X-Received: by 2002:a2e:914b:0:b0:249:24e7:cee8 with SMTP id q11-20020a2e914b000000b0024924e7cee8mr22015154ljg.143.1648030287023;
        Wed, 23 Mar 2022 03:11:27 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m24-20020a194358000000b0044a3851f193sm641374lfj.83.2022.03.23.03.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Mar 2022 03:11:26 -0700 (PDT)
Message-ID: <ef35b455-e629-51d4-0aab-e3e37aa14e7b@linaro.org>
Date:   Wed, 23 Mar 2022 13:11:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 11/22] drm/msm: Use drm_mode_init() for on-stack modes
Content-Language: en-GB
To:     Ville Syrjala <ville.syrjala@linux.intel.com>,
        dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-12-ville.syrjala@linux.intel.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220218100403.7028-12-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/02/2022 13:03, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Initialize on-stack modes with drm_mode_init() to guarantee
> no stack garbage in the list head, or that we aren't copying
> over another mode's list head.
> 
> Based on the following cocci script, with manual fixups:
> @decl@
> identifier M;
> expression E;
> @@
> - struct drm_display_mode M = E;
> + struct drm_display_mode M;
> 
> @@
> identifier decl.M;
> expression decl.E;
> statement S, S1;
> @@
> struct drm_display_mode M;
> ... when != S
> + drm_mode_init(&M, &E);
> +
> S1
> 
> @@
> expression decl.E;
> @@
> - &*E
> + E
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---

-- 
With best wishes
Dmitry
