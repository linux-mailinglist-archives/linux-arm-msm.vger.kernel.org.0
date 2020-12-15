Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37CB42DB1E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 17:51:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729694AbgLOQtl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Dec 2020 11:49:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728159AbgLOQtf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Dec 2020 11:49:35 -0500
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38F7C0617A7
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 08:48:54 -0800 (PST)
Received: by mail-vs1-xe42.google.com with SMTP id e15so9825151vsa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 08:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JpW7F2subR+onTiC3pv9jysqDXaZokb9fXlk0wC3Kt4=;
        b=KeaM2gSSATPK/nSQ/NIlog5AhbFB86RIZ2XDIeCzVqXL3ISYPrIQnZ18VZZvNsLWVi
         il3MyeyQqZ6bzYsYRujhbbFAkOT0KS01039QZIqVMQSdWRw/lL86EjRXHRmLvhe0fXC1
         ITU27NRarj8bf4oQ3P2Jy5PssVv52K4I2SYiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JpW7F2subR+onTiC3pv9jysqDXaZokb9fXlk0wC3Kt4=;
        b=Ed1n4ao7m8wtGYPP5QLF+QIVMoP8r0b5BC+gkKnFm3BZnwskCrWFxQtZCNmThkdktJ
         UtxFvW34aylkQtBgd3BSvzOenbBGXITfPgXBVRQfLIym5+ot8NPJl+r1WQ++EhMShTDq
         ScfhEPF91MjHZBdrwnfhX7xrT6RPGCSADTE5zd1CCTLykbyFz/R7bmwmToAICH8KOQ80
         14Nu1fTTmjO888hG4q3W4BvFTvJMpwbo1PafwAW7d9+KyS3QIuxKijFj3GafvM+QEAcj
         WSYqngKqgVPUMQzSn4N6orkrmqmDc2SUIAQ9Ox/Ddxcihms8C1zkYzVQvVMSeS8YY2mZ
         /gxg==
X-Gm-Message-State: AOAM530nvBbOMw8Bz9N3zDL+hlb4MnHdGaJoz+qG9LJkB9YT+wevjs/C
        04x3Dwcm6Tq8EBghc+9NFq2q9eFp7+Rz+A==
X-Google-Smtp-Source: ABdhPJysg9C54nz+ViD59xexUZSCj4dwaRgACzbkXmaJM9L2dv71fyGLug5PPpY8hDAr0tXoKf+uTw==
X-Received: by 2002:a67:ec4b:: with SMTP id z11mr28448401vso.26.1608050933713;
        Tue, 15 Dec 2020 08:48:53 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id f1sm2858146vkb.46.2020.12.15.08.48.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 08:48:52 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id b23so11309089vsp.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 08:48:52 -0800 (PST)
X-Received: by 2002:a67:bd01:: with SMTP id y1mr22286877vsq.49.1608050932297;
 Tue, 15 Dec 2020 08:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20201215020004.731239-1-swboyd@chromium.org>
In-Reply-To: <20201215020004.731239-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 15 Dec 2020 08:48:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UcpztEGVLoR5ivmP8wHX_V+nWReuL7Bb_rjbiz_F4S7Q@mail.gmail.com>
Message-ID: <CAD=FV=UcpztEGVLoR5ivmP8wHX_V+nWReuL7Bb_rjbiz_F4S7Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Drop pinconf on dp_hot_plug_det
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Tanmay Shah <tanmay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Dec 14, 2020 at 6:00 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> We shouldn't put any pinconf here in case someone decides to invert this
> HPD signal or remove an external pull-down. It's better to leave that to
> the board pinconf nodes, so drop it here.
>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Cc: Tanmay Shah <tanmay@codeaurora.org>
> Fixes: 681a607ad21a ("arm64: dts: qcom: sc7180: Add DisplayPort HPD pin dt node")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 ------
>  1 file changed, 6 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
