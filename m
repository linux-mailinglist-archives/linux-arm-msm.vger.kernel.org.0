Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E768561A32D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 22:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbiKDVUF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 17:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbiKDVUC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 17:20:02 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1414430F62
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 14:19:49 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id d20so8086483ljc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 14:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Bco6GFNVU1HGevRBeodLZeLGvp/i5iMrjxMWqPFArI=;
        b=GL5H6SwIQ7SnPyD4oON4xBfjTDtVrCa9/Xki8VGFJD83uINEgUiij95xbgnMm86cqN
         RDxCQFTbMYUGgzg6e1v/y4/nXYkFAQEJ1HKsM9mWwUwjdpv/PWNKkwHP/hYD6RVpTIQL
         KNZiXlL5YoppusYjW8TIwl2fsbKq5X7G45NWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Bco6GFNVU1HGevRBeodLZeLGvp/i5iMrjxMWqPFArI=;
        b=zQVAPSvMiQyO0+epkzBahiYQeLUMlWUobY7KffjJe6lHrqeQchnd3yRlUGN5VGQTHx
         Hc9m3rLuDi+DpGdcGWpUSORvwRwy3KMFSfeEzpTWI6as/KdM4H4Pz+G/olbtX7bd35aC
         i4jkphHVZF6kcyXWRFOOzKnn2YUzll33M5EnfukEhJipup8WV62Gwu6nBt+eAKUHt4ez
         Souke3aRlTzlrc7gPdeywHzBv6HS5hEaW1IyBibiRDOQwH6aiwvcyt8JuSJw5m9Dk/Xk
         vOlAy5yZGGMRkMlg0VbFdqzYvno78prfgnEd+tf4ApHqQlQO9mEO1dozGCE9XJeQpPHh
         6Afg==
X-Gm-Message-State: ACrzQf2gta0A/cr/IgJCdbg8sz5Si0QA0Gt4PseBtONzyeW6OGvdF6BP
        18bNzsy3+lCStpeGrGi2DTN3xxUhC9lOMi+aKq6UmQ==
X-Google-Smtp-Source: AMsMyM6z0i1Sv3zsd0Jq/pbof/zICrtZpxky+Y+f3KH0VlUri2O47At8vk0jaz4ZKam20cq9Bb5MAyac1cc20XSL2Nk=
X-Received: by 2002:a2e:8810:0:b0:277:4819:a6c3 with SMTP id
 x16-20020a2e8810000000b002774819a6c3mr12733700ljh.4.1667596788296; Fri, 04
 Nov 2022 14:19:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 4 Nov 2022 14:19:47 -0700
MIME-Version: 1.0
In-Reply-To: <20221104064055.2.I49b25b9bda9430fc7ea21e5a708ca5a0aced2798@changeid>
References: <20221104064055.1.I00a0e4564a25489e85328ec41636497775627564@changeid>
 <20221104064055.2.I49b25b9bda9430fc7ea21e5a708ca5a0aced2798@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 4 Nov 2022 14:19:47 -0700
Message-ID: <CAE-0n53FLz+4XROL7t5Vk1pEgvAX4tJYO4UK8rdCQUW0Pq78jg@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: qcom: lpass-sc7180: Fix pm_runtime usage
To:     Bjorn Andersson <andersson@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2022-11-04 06:56:29)
> The sc7180 lpass clock controller's pm_runtime usage wasn't broken
> quite as spectacularly as the sc7280's pm_runtime usage, but it was
> still broken. Putting some printouts in at boot showed me this (with
> serial console enabled, which makes the prints slow and thus changes
> timing):
>   [    3.109951] DOUG: my_pm_clk_resume, usage=1
>   [    3.114767] DOUG: my_pm_clk_resume, usage=1
>   [    3.664443] DOUG: my_pm_clk_suspend, usage=0
>   [    3.897566] DOUG: my_pm_clk_suspend, usage=0
>   [    3.910137] DOUG: my_pm_clk_resume, usage=1
>   [    3.923217] DOUG: my_pm_clk_resume, usage=0
>   [    4.440116] DOUG: my_pm_clk_suspend, usage=-1
>   [    4.444982] DOUG: my_pm_clk_suspend, usage=0
>   [   14.170501] DOUG: my_pm_clk_resume, usage=1
>   [   14.176245] DOUG: my_pm_clk_resume, usage=0
>
> ...or this w/out serial console:
>   [    0.556139] DOUG: my_pm_clk_resume, usage=1
>   [    0.556279] DOUG: my_pm_clk_resume, usage=1
>   [    1.058422] DOUG: my_pm_clk_suspend, usage=-1
>   [    1.058464] DOUG: my_pm_clk_suspend, usage=0
>   [    1.186250] DOUG: my_pm_clk_resume, usage=1
>   [    1.186292] DOUG: my_pm_clk_resume, usage=0
>   [    1.731536] DOUG: my_pm_clk_suspend, usage=-1
>   [    1.731557] DOUG: my_pm_clk_suspend, usage=0
>   [   10.288910] DOUG: my_pm_clk_resume, usage=1
>   [   10.289496] DOUG: my_pm_clk_resume, usage=0
>
> It seems to be doing roughly the right sequence of calls, but just
> like with sc7280 this is more by luck than anything. Having a usage of
> -1 is just not OK.
>
> Let's fix this like we did with sc7280.

Any Fixes tag?

>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
