Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32AF66A50AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 02:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjB1BZ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Feb 2023 20:25:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjB1BZ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Feb 2023 20:25:58 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B9C2940C
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 17:25:56 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bi9so11145948lfb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 17:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rmwusMnOHm/DxgvY9GP3587apLJbcqr+k5/KP8dCbmU=;
        b=l9gFL6R0ZeUaGp5vqNFIVgf0nervZ/blHcqSWAAJ3akyiJo0o+FEfRw9jK8TzZC5ti
         BxZugkf8qRGnbcPqWcL7MBGfXd16GvCA7gkaoaYMTFLt0P4CXhVqLXmWQ7m6jKiW4Lfb
         ez9bUDGDV+3Yl2kWwxONAYk6I+CYIOjIaevR4yJLWG2q1yRKU+MxEHwJCX57LgkmAJUD
         2N6sW2/xNWrn58aej9DrxJTV8rrzRQBk77qJlwCkChLtocebu58dD94nEye9+C0D3gLp
         zwkf2x6BcIoYY6sTQF4VhYslAVaFwYBChMA70e4dOyc3Lkzf6ZKV7xQL8EKAairWJV4Q
         5p7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rmwusMnOHm/DxgvY9GP3587apLJbcqr+k5/KP8dCbmU=;
        b=LDSZ1YtgZrIwc03GgXy26TqEu0u7N7XwqihXbaJOgLlstUIUX6PPKWaRQ6DMIuTtER
         7609rg0o1a7S/1LP7p+6RdLM4lm+yeAauGE/bD3p4VsMXavHqoOAF5NYLUK7ncqhOmxA
         NmpZiL6tVrRj3nhdKUOTjpVnBBDYR4ffBApSALe0MAdUIcWtocd6BNBaJ6WG5awwtiQv
         kMFZPltn11Zaf37z5bjX9hLyZ4ZKe8Ia6ie+gdtNLjSRGrT2Som8Aqd4K5F/hiccJJPT
         hL7EqMrtPzu+driRIf/s+7T8TuwlIo5V8fE5J0JNEv/TlhYfhJP9tpFvakPuW2bKhnS8
         +Asg==
X-Gm-Message-State: AO0yUKUD/s7+6FPrjU6xQUuUZT8IkNNW9GfZqXkZ/bnoBuIj9yBQWKVD
        T0LJMqFxYZHJjPbI0wJhkF5+uw==
X-Google-Smtp-Source: AK7set+wUkjWfP0FQPZbEn8+4BJFJa33ECnOmccXlhexvKHG0RYGL+IOpBW8vLBtlEPwiYYjPRpKtQ==
X-Received: by 2002:ac2:5dfb:0:b0:4dc:6ad4:5fe4 with SMTP id z27-20020ac25dfb000000b004dc6ad45fe4mr153887lfq.32.1677547555205;
        Mon, 27 Feb 2023 17:25:55 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id z7-20020ac25de7000000b004db44dfd888sm1120737lfq.30.2023.02.27.17.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 17:25:54 -0800 (PST)
Message-ID: <263e4bf2-6ade-600b-0fb6-e0a738ce830f@linaro.org>
Date:   Tue, 28 Feb 2023 03:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFT PATCH v2 3/3] drm/msm/dsi: More properly handle errors in
 regards to dsi_mgr_bridge_power_on()
Content-Language: en-GB
To:     Douglas Anderson <dianders@chromium.org>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Sean Paul <sean@poorly.run>, Jonas Karlman <jonas@kwiboo.se>,
        Vinod Koul <vkoul@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-kernel@vger.kernel.org
References: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <20230131141756.RFT.v2.3.I3c87b53c4ab61a7d5e05f601a4eb44c7e3809a01@changeid>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230131141756.RFT.v2.3.I3c87b53c4ab61a7d5e05f601a4eb44c7e3809a01@changeid>
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

On 01/02/2023 00:18, Douglas Anderson wrote:
> In commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> time") the error handling with regards to dsi_mgr_bridge_power_on()
> got a bit worse. Specifically if we failed to power the bridge on then
> nothing would really notice. The modeset function couldn't return an
> error and thus we'd blindly go forward and try to do the pre-enable.
> 
> In commit ec7981e6c614 ("drm/msm/dsi: don't powerup at modeset time
> for parade-ps8640") we added a special case to move the powerup back
> to pre-enable time for ps8640. When we did that, we didn't try to
> recover the old/better error handling just for ps8640.
> 
> In the patch ("drm/msm/dsi: Stop unconditionally powering up DSI hosts
> at modeset") we've now moved the powering up back to exclusively being
> during pre-enable. That means we can add the better error handling
> back in, so let's do it. To do so we'll add a new function
> dsi_mgr_bridge_power_off() that's matches how errors were handled
> prior to commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to
> modeset time").
> 
> NOTE: Now that we have dsi_mgr_bridge_power_off(), it feels as if we
> should be calling it in dsi_mgr_bridge_post_disable(). That would make
> some sense, but doing so would change the current behavior and thus
> should be a separate patch. Specifically:
> * dsi_mgr_bridge_post_disable() always calls dsi_mgr_phy_disable()
>    even in the slave-DSI case of bonded DSI. We'd need to add special
>    handling for this if it's truly needed.
> * dsi_mgr_bridge_post_disable() calls msm_dsi_phy_pll_save_state()
>    midway through the poweroff.
> * dsi_mgr_bridge_post_disable() has a different order of some of the
>    poweroffs / IRQ disables.
> For now we'll leave dsi_mgr_bridge_post_disable() alone.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

