Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0356D50C60C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 03:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbiDWBlo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 21:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbiDWBln (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 21:41:43 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B11F76213E
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 18:38:47 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-e67799d278so6604320fac.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 18:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=98Q4KjRvjXM0WQPHZUCc5YLZNElnBXI0Q4eC5MfmUig=;
        b=k9a6JGU17lPps5sbFfsmrztGSV/zL0+DC4LCy8hfnFFRNlK3hMnkZdQlhPTQtnmjRY
         3wjBJTvJ5Vsx0dJpwdSNsAuJUz7h22PH0sQ+beTiWIJvsz+z/1ycgNfkuiMzJGyBtvbg
         cJVAUi1g0etBvKVT4kVNTt1YZMGIDFwFBrcyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=98Q4KjRvjXM0WQPHZUCc5YLZNElnBXI0Q4eC5MfmUig=;
        b=r4/TdH92Xxne0Iqyou/2P2//omY2YTGxWsydh6mT6TGaeYPOYH8cXux+x/eFqCJ/FH
         WSDnsvPz8PCsAPJzsVy5MSUsOuBukEI0YDDP8NSwI5tbN/X7wAXu7+7T5enXmJ/vZlbU
         sFBv4ifPUwzs+5IHki33VSY8qghMCanVxy728bOz8P1ZmL1DhVypGhbGqxG61OtvZAq4
         a9a7yHxobES5hzFFu7lwNUcOnxzzhIzQy29orQ1IbKflPehb3i+Wfu3ZtFGsB96EJV9J
         jtf07c4xwwbZx6L8b3fHrmIG+/AeLdEord2pEyN8DSjJo24F2qyUuEn+skgF3ZggEUuQ
         GyEg==
X-Gm-Message-State: AOAM531WCjHw1MLGsnr5Nz/36dBicwQFCyPeSk7pGHYxiJdik/KEAce4
        NxZ/YeKKUSNlFpuQux6AL8n6W02q3wV/h6yBfgMfUQ==
X-Google-Smtp-Source: ABdhPJwlNqj63PkZquQxnFkGieqNdLLQiY/83YWsqgq1LyL+nK1ybanQly0mL7jbdoUfgkPKLIFUeSjxb0+Oi7jnSBA=
X-Received: by 2002:a05:6870:15ca:b0:e9:551:6d1c with SMTP id
 k10-20020a05687015ca00b000e905516d1cmr1868942oad.193.1650677927041; Fri, 22
 Apr 2022 18:38:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Apr 2022 18:38:46 -0700
MIME-Version: 1.0
In-Reply-To: <1650618666-15342-4-git-send-email-quic_sbillaka@quicinc.com>
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com> <1650618666-15342-4-git-send-email-quic_sbillaka@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 22 Apr 2022 18:38:46 -0700
Message-ID: <CAE-0n520s1XdUO5k2xxX16AsJc8pCjV8yXeR-0f5BC7A5+f-Vw@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] drm/msm/dp: wait for hpd high before aux transaction
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     robdclark@gmail.com, seanpaul@chromium.org,
        quic_kalyant@quicinc.com, quic_abhinavk@quicinc.com,
        dianders@chromium.org, quic_khsieh@quicinc.com,
        bjorn.andersson@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
        quic_vproddut@quicinc.com, quic_aravindh@quicinc.com,
        steev@kali.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sankeerth Billakanti (2022-04-22 02:11:05)
> The source device should ensure the sink is ready before proceeding to
> read the sink capability or perform any aux transactions. The sink
> will indicate its readiness by asserting the HPD line. The controller
> driver needs to wait for the hpd line to be asserted by the sink before
> it performs any aux transactions.
>
> The eDP sink is assumed to be always connected. It needs power from the
> source and its HPD line will be asserted only after the panel is powered
> on. The panel power will be enabled from the panel-edp driver and only
> after that, the hpd line will be asserted.
>
> Whereas for DP, the sink can be hotplugged and unplugged anytime. The hpd
> line gets asserted to indicate the sink is connected and ready. Hence
> there is no need to wait for the hpd line to be asserted for a DP sink.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
