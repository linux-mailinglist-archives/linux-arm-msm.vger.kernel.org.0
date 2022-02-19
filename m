Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 430A24BC511
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Feb 2022 03:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241179AbiBSCsZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 21:48:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235347AbiBSCsY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 21:48:24 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE6C58AE58
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 18:48:06 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id i10-20020a4aab0a000000b002fccf890d5fso5851996oon.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 18:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=PyXIOt9TwEbp/v0FYGxm9MNyuNqxiXlSYVf9ZjuxFw4=;
        b=oJKjQAjyFAabhbVoxOVOi5vHV8FDmur21OrnA50nLxUxaeTQIO9Gn8MH8iLA9zwARx
         JbEaFp4AZyGac6ERMXofW+N0iycI0+HArqhTgDUUz4kqV7QZNIjMqBoTkDxMMVcdbBR/
         LWzpUpLu8ef6ZliKBQmXgFIRnBNKEmd5s1lGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=PyXIOt9TwEbp/v0FYGxm9MNyuNqxiXlSYVf9ZjuxFw4=;
        b=ZpuolOjKTjkguree0zhyWyiD4z7BjKVbaSj+fp3naRdZ73iCjMf5qVTJ8TmMmZyJdO
         GIIpuaTDpBlf2GSpA0GI0BM7s/TmrgFPtqJ1w0xg0xPJdmkITbCFiyBbZVBlzk1CvBaK
         tT4AYqjOMqrS21JS6m4+VZEV6CumwmGnFdpoXynZeG9XLsFNQu10s6vTHy7FCtoGZpl4
         3Kwuuvg3Eq8IycGvUCkvfgSsBNiqtgQpqpVvVGFIorZqO58M1gZ6tKZUrwaZXxmu3wpt
         UijmZwBfLGvteTnZL8MpcGkdkSdxdvkCL49BDROrBO7/SeinkFzMzpMuJR8OruwR9fvV
         FLmA==
X-Gm-Message-State: AOAM531FYR4tLvTtJLxA0+5cRCtOZWht3cW+ylj76uBzL9689LMwdSfb
        QlItmvqF0YjsjkouR1jRWlHs8/u25AauY4vn7eNGbg==
X-Google-Smtp-Source: ABdhPJxF6ayg5xV46awWSK47OeLXup8I8aPWcqCYqQcSqviz24QX5EhDws9kLB+NysyTmubzMScwb+kWup7twjLWS9Q=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr3843106oao.8.1645238886320; Fri, 18 Feb
 2022 18:48:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:48:05 -0800
MIME-Version: 1.0
In-Reply-To: <1645133788-5057-2-git-send-email-quic_khsieh@quicinc.com>
References: <1645133788-5057-1-git-send-email-quic_khsieh@quicinc.com> <1645133788-5057-2-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 18 Feb 2022 18:48:05 -0800
Message-ID: <CAE-0n529EvPSqGt+XgZipOcSNpyHc6FunuQk_W841hYxWdH2og@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] drm/msm/dpu: adjust display_v_end for eDP and DP
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-02-17 13:36:25)
> The =E2=80=9CDP timing=E2=80=9D requires the active region to be defined =
in the
> bottom-right corner of the frame dimensions which is different
> with DSI. Therefore both display_h_end and display_v_end need
> to be adjusted accordingly. However current implementation has
> only display_h_end adjusted.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Is this not a problem for me because this is set already to something
correct in the hardware?

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
