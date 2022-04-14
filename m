Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 966FB501C13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 21:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345713AbiDNTnA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 15:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345889AbiDNTm4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 15:42:56 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A9BC4A3F6
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 12:40:31 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id g17-20020a9d6191000000b005e8d8583c36so4085532otk.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 12:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=IZs+lSCZqoVK/AKlAjq1EPKE7N59AQDgaVEofEcz/4k=;
        b=ETgEm9IDuhcJCpRZjCKvwitdHctDrYi29lxjTbWawEHjmBCyLjRt4MYCErwWxyIiIU
         9oGWk2XpMi1dM7n5ZXoIhJ0xbZW+2UzdP/epWdGbxtw72AUKBsEqN300BmeuFGb6JktJ
         WiZk4JZpzp/44sQgTfDviIGsknHKZQ6/7y4R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=IZs+lSCZqoVK/AKlAjq1EPKE7N59AQDgaVEofEcz/4k=;
        b=fXiQc44qTMbHRXvucIE1PAvdOuXILRqx0m12PhwrYJUrEDn/QyGNz+be57Vitl7Pw7
         q0DyjeZr3G7t3A8B++K8tfqKGeaJ3yEMu2wQoH5dhD6gHvkKgIGTeDR+eGUUsLNC4Ep2
         +1ed64bNfM5TWvX0uiC2GY2jCywlFfXkLNHywUnZKA+dvTmhBqKNUOIsx58n41f+Ujh6
         LnRLkNAGgQNIfUbwf1tvlje3eSD/pNJlCUCyG4EBnLcxwAh30xTEy41a3vADywD8K/aJ
         9RrQ7J8s2oEvugvXgBPkGx8g1VcXCrA2Oxv8MgJqkDYy/17igZUaC8c8SUJbwh9IV7JF
         sH1w==
X-Gm-Message-State: AOAM532DYhhtquI/Gdr2xgQXOYbTlEVQDSrUBL7Gja4FNUqhicki8xlE
        X9Y22+xGblIDxum4+amvCGM5qxws164QVu0tsKWXtA==
X-Google-Smtp-Source: ABdhPJzlgZCJ3S0otpiIbEsDjjXXeYSCOZF8aExMi2XEL/qGTFsnoTp0g7uybuwoqYnKkMyfeBWPcXWlvFAuimKyVBc=
X-Received: by 2002:a9d:20a1:0:b0:5e8:d2b6:f63f with SMTP id
 x30-20020a9d20a1000000b005e8d2b6f63fmr1455625ota.159.1649965230478; Thu, 14
 Apr 2022 12:40:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Apr 2022 12:40:29 -0700
MIME-Version: 1.0
In-Reply-To: <81c3a9fb-4c92-6969-c715-ca085322f9c6@linaro.org>
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <1649938766-6768-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Wmiv2WGhFCLYmXbWESNOh5FfobjNme85aU6YtN1SLVDA@mail.gmail.com> <81c3a9fb-4c92-6969-c715-ca085322f9c6@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 14 Apr 2022 12:40:29 -0700
Message-ID: <CAE-0n50obe_aqzwQY-X1yH4emjjOErOJ_wj9sQe=HoWEZ3vjTw@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] drm/msm/dp: Add eDP support via aux_bus
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        Aravind Venkateswaran <quic_aravindh@quicinc.com>,
        Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-04-14 12:16:14)
>
> I think it's too verbose and a bit incorrect.
> This is a bit saner:
> /*
>   * These ops do not make sense for eDP, since they are provided
>   * by the panel-bridge corresponding to the attached eDP panel.
>   */
>
> My question was whether we really need to disable them for eDP since for
> eDP the detect and and get_modes will be overridden anyway.

And to go further, I'd expect that a bridge should expose the
functionality that it supports, regardless of what is connected down the
chain. Otherwise we won't be able to mix and match bridges because the
code is brittle, making assumptions about what is connected.
