Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE03E4D2228
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Mar 2022 21:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350124AbiCHUGj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Mar 2022 15:06:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350117AbiCHUGi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Mar 2022 15:06:38 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D65A4A3F4
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 12:05:41 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id 6-20020a4a0906000000b0031d7eb98d31so280077ooa.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Mar 2022 12:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=QX67c8/LWZdvLCoz7zI9uFhqDQjOSWv595jQDqaaHvw=;
        b=AoYICMH8irjSWwtZb+Z4eLYjCkWJeNSak3Ym+tkyXo7JKkBgfi/ApgCW8h+4uiTLk4
         9/ZBh92aXPInfCxmDlAWVb4MzPrC9fWhQAXR1EaTZrKwakYnK4HXEBRhrYs3Ep5zfB2E
         sF7dLTDPwJru+Mre8SMqknSkzXsiym3TOgeUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=QX67c8/LWZdvLCoz7zI9uFhqDQjOSWv595jQDqaaHvw=;
        b=mp77dErnHemnarGjdJCAfWvDQNR6vgzFq2yZ0imoRGJLcDmzMQPwws8crSQ/MIaMOC
         qI6VPILkhcnj3A99Q7+r+EGhqEWBg3zZQ/Ui4oxA5GuQbFGkmvLmk1JIgZhZx24Vvuvo
         /4hdzlWDEnPyTR4YGuBPV0NCMCuTVzS1YbpIAn85viGmySso9D9PEHm2R6VnS8o61huA
         eFQuZK5z1gmt0+kyMBpflVWagvL3y1vM2zpjZv9o3p0nnW6zi8zYQEm8AjUCA0XHt+u8
         HMWzxUl9mvg1izxJ+orOWA+WzOplEWSYEC/pwTFamMuxPek14qY0/35T/2IngFrD0RsK
         gReg==
X-Gm-Message-State: AOAM530C4EQs3X6oEaZRI0xjUAz+dWHn7Pj69U8E3xaMjAfmX4RjK0lD
        zFm2T4s7Gzcy3obWnXCCaecWcCJa/ZEiXWsX20G60Q==
X-Google-Smtp-Source: ABdhPJxFRuIHirmuMcP8JQW2CiIQQrW1zixcggRe6oOvjNpt2ZWhCvmWo6ALkosrHI8M9jLM4bLDX5HuCCoQWjlEW1Q=
X-Received: by 2002:a05:6870:d250:b0:da:b3f:3211 with SMTP id
 h16-20020a056870d25000b000da0b3f3211mr3425601oac.193.1646769940572; Tue, 08
 Mar 2022 12:05:40 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:05:39 -0800
MIME-Version: 1.0
In-Reply-To: <1646758500-3776-2-git-send-email-quic_vpolimer@quicinc.com>
References: <1646758500-3776-1-git-send-email-quic_vpolimer@quicinc.com> <1646758500-3776-2-git-send-email-quic_vpolimer@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 8 Mar 2022 12:05:39 -0800
Message-ID: <CAE-0n51bfqWs8yOiyQ-A_bEQ7CZSqavz8epcFEWYyZxxoRYFHg@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] arm64/dts/qcom/sc7280: remove assigned-clock-rate
 property for mdp clk
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, quic_kalyant@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Polimera (2022-03-08 08:54:56)
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.

How? I see ftbl_disp_cc_mdss_mdp_clk_src[] has multiple frequencies and
clk_rcg2_shared_ops so it doesn't look like anything in the clk driver
is preventing the frequency from changing beyond the assigned value.

>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> Changes in v2:
> - Remove assigned-clock-rate property and set mdp clk during resume sequence.
> - Add fixes tag.
>
> Changes in v3:
> - Remove extra line after fixes tag.(Stephen Boyd)

This changelog should be removed.

>
> Fixes: 62fbdce91("arm64: dts: qcom: sc7280: add display dt nodes")

I thought folks were saying that this is bad to keep? I don't really
mind either way, but I guess it's better to drop the fixes tag because
this is largely a performance improvement?

> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
