Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 875944CC936
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 23:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234509AbiCCWjD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 17:39:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233309AbiCCWjC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 17:39:02 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D59C810C50D
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 14:38:15 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id w3so8468382edu.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 14:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ST9Fc76g6pvjQi4fhR+noZ4Seq3datbHBQS0X9jUxZ8=;
        b=FrOz5ub3zWjEQK22ZLwg3u+vEvcmxk5pcWahe3+zoJFfvsvs0UQBjv/AElEkUlyAw9
         EePN55pYYRl4RbnXJxniWi54yJRwLRFnUpNNgmipiWdmEHy76MIi5bA6dIIROOGw5+9j
         DlrsvRRt7Ab5hlgGMIvKwZMS89rVmz14yqa6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ST9Fc76g6pvjQi4fhR+noZ4Seq3datbHBQS0X9jUxZ8=;
        b=51LaFOfSGZOhjxEss1YeuyTuCa5Jo5smAQ+su0ptPu6UGG69TNMmxoCvcVlssW78So
         5UT8GI1buaOUbN0MCyPkllglK5az90xwXa61l4zi2F8HmhqwOc6eLqbyJ5EfEUfgd8aK
         whosmn3eurDx2afZtE6WGvYbXRTzWCHIbzDwFXdQKm1bxlZQGrZLB4HxCDEfc5rU8xdN
         AnhdGc7IH30Vsui6iX+d/W8aQ14TOKnG5a9LDqL6AELp2XWVMfTcSZz2pGu96cEZT0a0
         mwSs7VHO5wpP9fkds2dOy7YAWtINOkbIzwYSrMq4YtRV/Mk/xsBHLhQosNk+BWR/GV7i
         IKmQ==
X-Gm-Message-State: AOAM532Y+JQwTF9ZAWkGyzCvPsyxckxPiUbzlQ3Tx02RLC0jQ7vbA9eX
        XiFUoxLY1m67aEmsl7JuRKLMUuW5v7rBpQ==
X-Google-Smtp-Source: ABdhPJyagDy6rd2r16hj48/+8wN9bRorO8je+RZM87pq0I/zQGXEBzK0qlCNl/5P+AKP3mXaBwsBYQ==
X-Received: by 2002:aa7:c54b:0:b0:415:c714:7a1f with SMTP id s11-20020aa7c54b000000b00415c7147a1fmr8012019edr.385.1646347093926;
        Thu, 03 Mar 2022 14:38:13 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id qk8-20020a1709077f8800b006d6e920af3esm1129352ejc.87.2022.03.03.14.38.13
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 14:38:13 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id 7-20020a05600c228700b00385fd860f49so3254300wmf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 14:38:13 -0800 (PST)
X-Received: by 2002:a7b:c381:0:b0:37b:e01f:c1c0 with SMTP id
 s1-20020a7bc381000000b0037be01fc1c0mr5453850wmj.98.1646347092922; Thu, 03 Mar
 2022 14:38:12 -0800 (PST)
MIME-Version: 1.0
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com> <1646300401-9063-2-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1646300401-9063-2-git-send-email-quic_vpolimer@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Mar 2022 14:38:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VHBn0H6Oz0F3vHrXZzSSo8y+QbLc-xn+CVVSQkommsHw@mail.gmail.com>
Message-ID: <CAD=FV=VHBn0H6Oz0F3vHrXZzSSo8y+QbLc-xn+CVVSQkommsHw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] arm64/dts/qcom/sc7280: remove assigned-clock-rate
 property for mdp clk
To:     Vinod Polimera <quic_vpolimer@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>, quic_kalyant@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Mar 3, 2022 at 1:40 AM Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.

I see the "Drop the assigned clock rate property" part, but where is
the "and vote on the mdp clock" part? Did it already land or
something? I definitely see that commit 5752c921d267 ("drm/msm/dpu:
simplify clocks handling") changed a bunch of this but it looks like
dpu_core_perf_init() still sets "max_core_clk_rate" to whatever the
clock was at bootup. I assume you need to modify that function to call
into the OPP layer to find the max frequency?


> Changes in v2:
> - Remove assigned-clock-rate property and set mdp clk during resume sequence.
> - Add fixes tag.
>
> Changes in v3:
> - Remove extra line after fixes tag.(Stephen Boyd)
>
> Fixes: 62fbdce91("arm64: dts: qcom: sc7280: add display dt nodes")

Having a "Fixes" is good, but presumably you need a code change along
with this, right? Otherwise if someone picks this back to stable then
they'll end up breaking, right? We need to tag / note that _somehow_.
