Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18CE4442F28
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 14:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhKBNlZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 09:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhKBNlY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 09:41:24 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0310C061767
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Nov 2021 06:38:49 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id i12so15713529ila.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Nov 2021 06:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NPmlFnsZtjOhlgu33qBtxP1UZOWSahyMoeO4vIQ/8Z0=;
        b=OVSrn46sf3M7ODJBsJzugoe0wCPuQeHMutpWsElQHERc7suWX1ETX3idIWCLex1Tlt
         UTq1fIJzkXsD1zhbzmcRcYq1D9k7lXVYOfUWaunuw6gA1J77xqRRhY/hC12Kg4OTsGp4
         wyZTjNHJDa2TubIWyoB5lBvoPN4gh+8fHdr2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NPmlFnsZtjOhlgu33qBtxP1UZOWSahyMoeO4vIQ/8Z0=;
        b=C1jDLYrM+oj8Xqz7UUyVTXv8vwa4IMcbTipPwEDVyTM0FEvf7Dk1ePQ1ytvxHtNPpf
         LjmhHito3mzE/WMBI+v3U3DCCn0+TyqsGBFsEa+OEOC6MCcfF2EHLaXmUhlLz9rdoL0X
         OaiPHuAeL0HZ/vXzsi+6YUTqIKiiHmE+TQxxx1zV3ogYKzYqeBhT1SLETUQ2KDHmiauo
         kCncFzQWFEEa/La4zEkn5Nlipqeti+Y1FUI1OnjmhzMuhQdbRu4BFoMCztFS0M3lXKZD
         IX4hcvCCmQ9FJhdd5l8wG7pQKFrklrQR1FtI4xW/Ejx7mFHCx45J8C+iLczPWYwKXR/P
         3WWw==
X-Gm-Message-State: AOAM531n65AvRXivbeHIzDdF/DrEPgAupD1DMC5Su4EdyyNhdL58u6/W
        YYJZhdH07t25NpQdX6LgqkZgqlLZChdZwQ==
X-Google-Smtp-Source: ABdhPJxJ+KwBIvtVCVoAtWFXAUJHuKkCi0CMk71/mU7mB6pQ6h9WZ7HwzvcRA93u3V07Z99VM9M7og==
X-Received: by 2002:a05:6e02:174e:: with SMTP id y14mr16943494ill.89.1635860329147;
        Tue, 02 Nov 2021 06:38:49 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id w2sm9348998iou.0.2021.11.02.06.38.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 06:38:48 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id y17so21896669ilb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Nov 2021 06:38:48 -0700 (PDT)
X-Received: by 2002:a05:6e02:18ce:: with SMTP id s14mr13331028ilu.142.1635860328172;
 Tue, 02 Nov 2021 06:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211102034115.1946036-1-bjorn.andersson@linaro.org>
In-Reply-To: <20211102034115.1946036-1-bjorn.andersson@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 2 Nov 2021 06:38:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VWN36A=O1V+2jfWM5jLShvZfVOCGnt_MSSGct=kFtoOw@mail.gmail.com>
Message-ID: <CAD=FV=VWN36A=O1V+2jfWM5jLShvZfVOCGnt_MSSGct=kFtoOw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sdm845: Enable dual edge errata
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Nov 1, 2021 at 8:41 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> It has been observed that dual edge triggered wakeirq GPIOs on SDM845
> doesn't trigger interrupts on the falling edge.
>
> Enabling wakeirq_dual_edge_errata for SDM845 indicates that the PDC in
> SDM845 suffers from the same problem described, and worked around, by
> Doug in 'c3c0c2e18d94 ("pinctrl: qcom: Handle broken/missing PDC dual
> edge IRQs on sc7180")', so enable the workaround for SDM845 as well.
>
> The specific problem seen without this is that gpio-keys does not detect
> the falling edge of the LID gpio on the Lenovo Yoga C630 and as such
> consistently reports the LID as closed.
>
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-sdm845.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
