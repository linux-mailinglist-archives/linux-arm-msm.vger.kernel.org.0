Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32C394B7D4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343634AbiBPCSh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 21:18:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239130AbiBPCSg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 21:18:36 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6AFFC1C97
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:18:25 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id o128-20020a4a4486000000b003181707ed40so868209ooa.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=rKj/83OeNdCA+dbfZ2qmOiBrnBwHoQueKWn2gnvfSB0=;
        b=ieAe3Bw7+svdP7k1Mjdz401VBfKR3/7YLZCGmTm8EmDpk7J4l9MOw3KEHCRW73SRch
         a3RNuwSe6ZVBG3FlSJ+1mYWZyJoCfEXlQxCXtPxOxkztXiquD2aYfJ/zgeRUzz6JEYDQ
         EjPLPISATbExLjLKZ63Bz4qlX5KZAWyCW9pnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=rKj/83OeNdCA+dbfZ2qmOiBrnBwHoQueKWn2gnvfSB0=;
        b=VK9kR6EXEgtsPa3lIxjBS1L8v5xI7AsFMc759DMOSDyIq/yNKVbehrbz7PN4D8Ole0
         +zpzeZxzJZevEbW8Mvi24Mv0mvVZjqMgxEZ3mLKL1VRFASGFmpTsjOpqhAz7r792Pcvv
         Y5qR+Oj3KyVIgxzamRp6jhBGHsv98X2oPtjEC4fGDjq/+nG7FUylOSavxbZIu6sGQmur
         AdlSuwqwuflU8HUsNpMGfaCULpKaE6KJugf5abp97bQ2+VWeOqcK8xISSwkNDXh5CBS7
         T2/w0i5DWGnV7FYVmXWUYtqFIbafKjg2ujjcvNrqgsGKSuBDr2p1JMN7AvbXKkv/yNR0
         B7Fw==
X-Gm-Message-State: AOAM533bdAJ+3BMOnxTsmslVoC9r/Q+agMQfbhpaodnGoxHxU+aJ1uN8
        UabmYG/RWUk8EKC0/VjGYT+GLaAcg91OzcbIZFaiag==
X-Google-Smtp-Source: ABdhPJw5Yk430/3/87e3yVE4qWHJlRhItY1gx4i906WPQT9Xp//a9PTHnqUQU02bFgspQY9SZ4ux9MZ5XkOnesX7ZOQ=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr285417oao.8.1644977904573; Tue, 15 Feb
 2022 18:18:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:18:24 -0800
MIME-Version: 1.0
In-Reply-To: <20220201151056.2480055-3-dmitry.baryshkov@linaro.org>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org> <20220201151056.2480055-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 18:18:24 -0800
Message-ID: <CAE-0n50-asrL6FcpsteqfBWAVMXVShFWW+yMSMvzzJOr7d0KCw@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm/msm/dpu: remove always-true argument of dpu_core_irq_read()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
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

Quoting Dmitry Baryshkov (2022-02-01 07:10:52)
> The argument clear of the function dpu_core_irq_read() is always true.
> Remove it.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
