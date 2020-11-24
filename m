Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 545DC2C2F68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 18:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404088AbgKXR4R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 12:56:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404064AbgKXR4P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 12:56:15 -0500
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D406C0617A6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 09:56:13 -0800 (PST)
Received: by mail-vs1-xe43.google.com with SMTP id u7so11549793vsq.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 09:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dstdkNf1brKdffRW0gFmbGJRx2DF5qxz6SUvxED47w8=;
        b=TGh7RNH83GE0U0nAPatnZIFjE4u3CMt0Qxiu9Wqb0GPS/OPZJNtTkAnC0zifkdi1is
         fxaivn+USYnBKSThYwUlDA0giTUU/2ozReLrNWUtISAP37Q1Drz7JKH12xsPmz5edpav
         /CgogcL0A4GA2sXcKGMlF3edlC1/RBIPC+Jb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dstdkNf1brKdffRW0gFmbGJRx2DF5qxz6SUvxED47w8=;
        b=poxTCioeTrkgKUOFo7dvLMv6VTWUlEwgsfM5SSnwrKGfROB4Ios2bqUOyP7QlI3Tpe
         pc8AUNI9q8DpPm+JaVa6NltJ231dMy0XvV82GKlLcUeCRwDV8CW1mlwVwjAxi09UULDp
         d3CGIQt1WrxQMxPp/YJJrYnXfKACuzZkApmKK3Ydyk6dk+I2DM3k0VQltbg/XJDpLmN5
         7ueEU0mcBhnQr14hrX2oxE4pnVEmunyVLQO8agUTRmGjGxbnrgYVAz3nvmvZxrjWUyDn
         t7TCY0SgAx0vxgh3pspqiBYcv0LB0eJun8Sb8hR6hPdSJaD9O3fUSVjaNSrIYLl1M7bc
         ngwQ==
X-Gm-Message-State: AOAM531aZsY5tzSw5QAWa9ntWjPr0AjIky+z85qJ0Ggl4Sm+JOH6hlCJ
        46RrFTqxR1FpbCAv2EyKTF9PnpI+XrQ+lw==
X-Google-Smtp-Source: ABdhPJx44Fx1oCU7dTUhST64bnuEdvEjwmKEXvJKjHWwoX4pfEIviDWvbE3cpOxZlKx4ifc0zuhQYg==
X-Received: by 2002:a67:7107:: with SMTP id m7mr4611969vsc.33.1606240572382;
        Tue, 24 Nov 2020 09:56:12 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id n126sm1719196vkf.31.2020.11.24.09.56.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 09:56:12 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id y73so11556930vsc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 09:56:11 -0800 (PST)
X-Received: by 2002:a67:4242:: with SMTP id p63mr5023952vsa.34.1606240571069;
 Tue, 24 Nov 2020 09:56:11 -0800 (PST)
MIME-Version: 1.0
References: <1606198876-3515-1-git-send-email-sibis@codeaurora.org> <1606198876-3515-2-git-send-email-sibis@codeaurora.org>
In-Reply-To: <1606198876-3515-2-git-send-email-sibis@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 24 Nov 2020 09:55:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X-3YzmhS1g8ytcNLNfrtLnMKNmeycA4oW5kJjb=X+BMw@mail.gmail.com>
Message-ID: <CAD=FV=X-3YzmhS1g8ytcNLNfrtLnMKNmeycA4oW5kJjb=X+BMw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sc7180: Add DDR/L3 votes for the
 pro variant
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Nov 23, 2020 at 10:21 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add DDR/L3 bandwidth votes for the pro variant of SC7180 SoC, as it support
> frequencies upto 2.5 GHz.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
