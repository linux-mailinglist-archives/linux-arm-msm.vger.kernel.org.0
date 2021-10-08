Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04B3B42740F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Oct 2021 01:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243774AbhJHXRF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 19:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243744AbhJHXRE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 19:17:04 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06BECC061570
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Oct 2021 16:15:09 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id b6so11600514ilv.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Oct 2021 16:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WAS0k1J77tuatYFLMV7U8Tkdl9mMVlFA7snHTtL6p8U=;
        b=MmwM1SqDAXxA/vQ1ZEzsWGMXuTE84d1Qz6t/Bf0MMnAa1i1nUXUW68awSO0P4jMhgP
         sHj+txdiaGApUIZUIzlG9Y3PktVMVw9hEy+hIGEpFezukfjzykt9hKLa9BCIf/xBmyev
         3uH1LcviAcNqDCRQlp/0WqIdRzdfqb4mVLhRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WAS0k1J77tuatYFLMV7U8Tkdl9mMVlFA7snHTtL6p8U=;
        b=KSd5cPY3Ys8SRCtwB8Bz8tPmHu+vnjq9NfZtO7FMuyNwsU9yaT+L8NeBzjCP+d5z9p
         nJ48jwXTgisr8y34iwYl3hl22keOjpAEHlFs5xcBvvY3Oos4psn4vHFF/qQawlgkJvcM
         5CHsyXe96MvS1r2o3EvM92w6JYUtLffP9MaqWZdBn6uz8FnBfP298xegmZcFssm8u64f
         92hWGZW7BCDxXNIp+/9ltq8H68puNLXA7j8TP1erBOSNbbdFJRdrOMoP9Tl+dwSCC+vf
         tCzNbye2IiCrk0CKWtQxuXjpMY445D4bgf8ghFcuLQX194dMAEboEW8IXO9ilaimE21A
         QGkw==
X-Gm-Message-State: AOAM530QzC74cMrFVg1uHgqcFTYa0BQFckZ6NpBcCXIYPoJRoyu8ag+A
        +xZlhsPyCQa+86hC1Dpja4Ocuq8YNFobUQ==
X-Google-Smtp-Source: ABdhPJyWUkOXmFp8+uCL3xFT4+r+knKHGfh825P+YiLp76YSmoVgRNoPlGWs6LdfN7vE54mfssPx7w==
X-Received: by 2002:a05:6e02:1aa4:: with SMTP id l4mr9543532ilv.231.1633734907658;
        Fri, 08 Oct 2021 16:15:07 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id f13sm306482ioz.48.2021.10.08.16.15.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 16:15:07 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id h10so4525450ilq.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Oct 2021 16:15:07 -0700 (PDT)
X-Received: by 2002:a05:6e02:1785:: with SMTP id y5mr9543722ilu.142.1633734906696;
 Fri, 08 Oct 2021 16:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211008113839.v3.1.Ibada67e75d2982157e64164f1d11715d46cdc42c@changeid>
 <20211008113839.v3.2.I187502fa747bc01a1c624ccf20d985fdffe9c320@changeid>
In-Reply-To: <20211008113839.v3.2.I187502fa747bc01a1c624ccf20d985fdffe9c320@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 8 Oct 2021 16:14:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XsTb00Ax=AgrpAYurruiwZOVKZrYkphFfLLueSAio=rg@mail.gmail.com>
Message-ID: <CAD=FV=XsTb00Ax=AgrpAYurruiwZOVKZrYkphFfLLueSAio=rg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: sc7180: Support Parade ps8640 edp bridge
To:     Philip Chen <philipchen@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Oct 8, 2021 at 11:39 AM Philip Chen <philipchen@chromium.org> wrote:
>
> Add a dts fragment file to support the sc7180 boards with the second
> source edp bridge, Parade ps8640.
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---
>
> Changes in v3:
> - Set gpio32 active high
> - Rename edp-bridge to bridge to align with ti-sn65 dts
> - Remove the unused label 'aux_bus'
>
> Changes in v2:
> - Add the definition of edp_brij_i2c and some other properties to
>   ps8640 dts, making it match ti-sn65dsi86 dts better
>
>  .../qcom/sc7180-trogdor-parade-ps8640.dtsi    | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I think these two are good to go as long as Bjorn doesn't mind having
this dtsi file in the tree with no users yet. It looks nearly certain
that some trogdor devices will ship with it.

-Doug
