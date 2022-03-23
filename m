Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7E704E501F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 11:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243447AbiCWKOT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 06:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbiCWKOS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 06:14:18 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0504D76674
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 03:12:49 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id q5so1128355ljb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 03:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=A8hD1/tFFB4rgwz87Q4K65j6MtDksDJ6SuyPOc0I8WI=;
        b=voGSg26fPYddMSZ76hiQWACMZW+nmFMTLjq+ORhoRrUNqN4WkRY/Dc49Ffnpf9YLF1
         ANIf+d2EPF2h1txEALTPZwxLUNhk4hHzwGHOQYh8pcZRcNL0syjVrWy+sApdrrHjdEuI
         n/lWxunH8v2mvRKBxPiQ8mh59NYqU8VBkzSN1H/F5IGc85upCYNCNoxe743UkMZLut+H
         oPkdnA3rNkvKSI8yK6iEcBNzrLLuXdB+er83dBQCTEiVUkwW8c1dlJ6OYLfhiZRSHGMh
         Gg4xqH5/7K1aM28hZP1Tuna1Epfe2eN9c4DskLza+7vz92y0o7BDApVHPUEpvxWYd5rT
         vNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=A8hD1/tFFB4rgwz87Q4K65j6MtDksDJ6SuyPOc0I8WI=;
        b=rCN6ynyB03mRVC6cmS3KVZ50lDyRTctgvcubgpVhPV2eP2nlMRhufD/xEjOOonnSB8
         M2CDY+Uf2+K1W4G1WgxrYbHbkv8aCGD53zbvyHSPTpy8hDisaLMHQ/Y9TNEtkD168gFx
         3gdyrS3c+n/CO1dSF+Jni97BkOnqkHC4JJFUTQLzfTfvEcs8fRH7c46vx8G+WtTYkBuF
         NW96kFsG381dLHLHS6GygZyALABFKts3VhvuIOf64VGHEs+21Kn1xKu/asZRnk9cKqbJ
         aRxk9VBTF5C24KfVudOcPHHi/mCn1mEZWpifiPGsB8QbFKkb7kDNtX3L6h3bs3PIOh0n
         4d8Q==
X-Gm-Message-State: AOAM533gg5PKvbgyOW6WBh9aaDQWqTud/eXW4t7Q1ThKcE4UtkDm1IWZ
        Jhs8GAzPBF6Ye0sh7fqkDxbYJA==
X-Google-Smtp-Source: ABdhPJwpcO0qcr4Yl6r71Htzu887GjSBGMS7k4TepkH3iSwqlMC0gokbq3Qmjt5IFN01sRKjHDvhaA==
X-Received: by 2002:a05:651c:50b:b0:249:8cac:11ff with SMTP id o11-20020a05651c050b00b002498cac11ffmr7564050ljp.484.1648030367399;
        Wed, 23 Mar 2022 03:12:47 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q17-20020a05651232b100b0044a211622aesm1302537lfe.282.2022.03.23.03.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Mar 2022 03:12:47 -0700 (PDT)
Message-ID: <3b874b88-837b-bf72-0888-9464396a6ab7@linaro.org>
Date:   Wed, 23 Mar 2022 13:12:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 12/22] drm/msm: Use drm_mode_copy()
Content-Language: en-GB
To:     Ville Syrjala <ville.syrjala@linux.intel.com>,
        dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-13-ville.syrjala@linux.intel.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220218100403.7028-13-ville.syrjala@linux.intel.com>
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
> struct drm_display_mode embeds a list head, so overwriting
> the full struct with another one will corrupt the list
> (if the destination mode is on a list). Use drm_mode_copy()
> instead which explicitly preserves the list head of
> the destination mode.
> 
> Even if we know the destination mode is not on any list
> using drm_mode_copy() seems decent as it sets a good
> example. Bad examples of not using it might eventually
> get copied into code where preserving the list head
> actually matters.
> 
> Obviously one case not covered here is when the mode
> itself is embedded in a larger structure and the whole
> structure is copied. But if we are careful when copying
> into modes embedded in structures I think we can be a
> little more reassured that bogus list heads haven't been
> propagated in.
> 
> @is_mode_copy@
> @@
> drm_mode_copy(...)
> {
> ...
> }
> 
> @depends on !is_mode_copy@
> struct drm_display_mode *mode;
> expression E, S;
> @@
> (
> - *mode = E
> + drm_mode_copy(mode, &E)
> |
> - memcpy(mode, E, S)
> + drm_mode_copy(mode, E)
> )
> 
> @depends on !is_mode_copy@
> struct drm_display_mode mode;
> expression E;
> @@
> (
> - mode = E
> + drm_mode_copy(&mode, &E)
> |
> - memcpy(&mode, E, S)
> + drm_mode_copy(&mode, E)
> )
> 
> @@
> struct drm_display_mode *mode;
> @@
> - &*mode
> + mode
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
