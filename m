Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E320F50F08E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 08:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242536AbiDZGEG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 02:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242342AbiDZGEF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 02:04:05 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E65DD15707
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 23:00:58 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id r85so19594019oie.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 23:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Wit8rbTM2VYf6vUKmIHeUUnnIfDCsz7ar6R39GV+tas=;
        b=hd8G4VjioxyMc+UVOw79VgBvFmlxIV9Rrpp7TbI0Jm9xKCVBT626QbjZZWuMzbv5Yz
         lfeJ6mX8cUcw0K1GhHY7rD3pHXa718nrq/ZMx5IUZiFfW1T8RVVqTCvfb6+ik32HZP3/
         SozL4gTAkcwxgVkNidGvX5xfNuLL4gxQVs3iQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Wit8rbTM2VYf6vUKmIHeUUnnIfDCsz7ar6R39GV+tas=;
        b=f8U8mVZl6U2w5dLdC22nqtlHaxl+4BYPJCukuKtyL1o0zsJiaTeLSQyhezSI1D0+sU
         I8zdCTY7kfMOkbng7ka8lL+0Fv9OiqZij6GEfZgbXhalqs7Byu/1GN25npnlZkifKR/3
         +qUrcFRv1p2nuIDGGwsMFZ2kaZo4QqrjHn3BKWBn+38vHmHGay936RjSFfh6n44AgkKD
         gSNxQIWE1mgv7D5jD3LTsLC53YAZ2HlmFby9tiCf/9YjNm+xOi85RRWwI9A9WwpbnEXC
         YgKixoMNq+EDXz+cncF7wBRxnhtLTRCb67rjMhS/A2zVrjD4Gm3c4YwZuzYGIWtZD3kl
         ZEPQ==
X-Gm-Message-State: AOAM532BcCBkGjOys/UVEEJrfeJSV4aJsA6Cierm9fFk7NcusE8+F0ZF
        +767IG6WLLTCU47+vhrv7M6a57dkqFCe54uUXnqRhQ==
X-Google-Smtp-Source: ABdhPJx/DXIJPn9m/RMOSlqtJpPWvHURBqE5bubgiZvYTm/Xfs6dAKYq3jMp46vuisc1fF8p+9rweRvZlD4yuUw+gt0=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr10076037oif.63.1650952858263; Mon, 25
 Apr 2022 23:00:58 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 23:00:57 -0700
MIME-Version: 1.0
In-Reply-To: <1650952595-27783-1-git-send-email-quic_khsieh@quicinc.com>
References: <1650952595-27783-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 25 Apr 2022 23:00:57 -0700
Message-ID: <CAE-0n53kv+NPJ-4Cpjy_FeJT5xOo7fLNz24fyGUcjy6ucccjbQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: remove fail safe mode related code
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-04-25 22:56:35)
> Current DP driver implementation has adding safe mode done at
> dp_hpd_plug_handle() which is expected to be executed under event
> thread context.
>
> However there is possible circular locking happen (see blow stack trace)
> after edp driver call dp_hpd_plug_handle() from dp_bridge_enable() which
> is executed under drm_thread context.
>
> After review all possibilities methods and as discussed on
> https://patchwork.freedesktop.org/patch/483155/, supporting EDID
> compliance tests in the driver is quite hacky. As seen with other
> vendor drivers, supporting these will be much easier with IGT. Hence
> removing all the related fail safe code for it so that no possibility
> of circular lock will happen.
[...]
>
> Changes in v2:
> -- re text commit title
> -- remove all fail safe mode
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Should add some Fixes tags here, probably for the first introduction of
this logic and the one that moved stuff around to try to avoid the
lockdep warning.
