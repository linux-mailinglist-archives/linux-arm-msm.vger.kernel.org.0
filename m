Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B87674B9490
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 00:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238522AbiBPXha (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 18:37:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232038AbiBPXh3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 18:37:29 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A14B7A
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 15:37:16 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id o128-20020a4a4486000000b003181707ed40so4463447ooa.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 15:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Oe5Kgz/mXiBfGR7RpzB+SRCxWVkPZLeMHIEspnpgrqo=;
        b=Ku5w335Kto9e9IZrmFimPGs+b/iIGrUX73Vo6Z44mjCV8U6rWgGs8tj8L6T6QDmt5n
         MprJn7WT/14efmyzWpO5DXo4o5hV8D+l/dhhfsUHVDUXDdZaqxOzjE7eGlGM9qpB2EPW
         gMe2WRax+kFwYAj9K1eEVMnJcJ20mhrqTHsIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Oe5Kgz/mXiBfGR7RpzB+SRCxWVkPZLeMHIEspnpgrqo=;
        b=cTR9E29iYrq+lw3DC20YU5sS3bRnh7ggAy6+ZF8BofcSF5P8NdYMO5iwu8UIsiGO2Z
         4nGllCtbz2mDipkKLpuLw11E79PDrmMKIZ8Jecmshgo7h+Z4RxxyLxTn+jrRSe4g4OEi
         Us7NKUDxuZ9MV816F6hoU4h+x8vWdun9DdNqKvxyMDy5BEpBkqjloXP7kAxZ83uBKNDt
         vCkIUbieG0ce8p8nKL1iULZQGBHQ6c1FpEQM/XWL5avF/9Qt75lLV8YHMsh+40gYg9YE
         fQWWiBIf6+/X+cjLsMMyz8TbIsJRCsRqRLbg7Sg1iQXD41uCnyVVT8UA1p4TGJmQenBF
         HU6w==
X-Gm-Message-State: AOAM532AWpFI04V+Ved/fRi0SdqJgN0h3LDaWEk2AnqFWMqVJJrC+f95
        hzZWW8gCd2q7BRUUODqqnoNim+IQonUNt1068uXgWw==
X-Google-Smtp-Source: ABdhPJylun9DD0LZkQln6PAhGLyEfeA9WcQSNQlo+FLp376qtCoDluJNpTqVTuJhn94pxdcsN6ndH0jUX9bW7NquZh0=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr108306oao.8.1645054635886; Wed, 16 Feb
 2022 15:37:15 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Feb 2022 15:37:15 -0800
MIME-Version: 1.0
In-Reply-To: <1643828199-8564-2-git-send-email-quic_khsieh@quicinc.com>
References: <1643828199-8564-1-git-send-email-quic_khsieh@quicinc.com> <1643828199-8564-2-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 16 Feb 2022 15:37:15 -0800
Message-ID: <CAE-0n52LS5Np72MQeoX6L2=1LWzn=NDrmJJGZj629miMxrp9TA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/msm/dp: add connector type to enhance debug messages
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-02-02 10:56:37)
> DP driver is a generic driver which supports both eDP and DP.
> For debugging purpose it is required to have capabilities to
> differentiate message are generated from eDP or DP. This patch
> add connector type into debug messages for this purpose.
>
> Changes in v3:
> -- replace original patch into 3 patches
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
