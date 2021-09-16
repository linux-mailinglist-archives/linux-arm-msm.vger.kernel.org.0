Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABBB40DDF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 17:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238910AbhIPP2G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 11:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238740AbhIPP2G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 11:28:06 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0800AC061764
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 08:26:46 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id m11so8376439ioo.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 08:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xxG3dbZgPARu0xvQnjbpkCvQJvDZ73qgLTLb513Zo/4=;
        b=b0nQLKsmhRBdwAOVP7WfPx0gukN36TpAywM9O7OxxgmVkDWF7QIHgckba/ROBSlDup
         f5wzigGcYhRa2LTTtj4Ah76HGXjG3oUOx8yp1qO9kL7GtlOdruAt+V4fCeah5R7s6HDV
         A7Ol1K21yqh8t0fVtK3zz5kOOx/LFJJEtDWao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xxG3dbZgPARu0xvQnjbpkCvQJvDZ73qgLTLb513Zo/4=;
        b=VY5nWiUEu7InDIXSHeOoRKOnVATzw7GOXt4PNKgnUIHuL1wy1FywO7aeWa45VqCqmT
         HH7v1V9mXU4I0GQ1if9l5skMouuji9Dh2CY4nE2upbJot2jfTLdQBDWThLACYflNet/I
         C+i3UrfX027x29Z5dyrfojrVcZN+UInNvhOpum5YA1XXSVYj9iIG9rwnTSxNTjHZhC86
         GvAbZx19P+azHmzluj3+Be/mfEgJ+oa9vsZ7LmttpwnqH5V389toMYhxG5HKofT9ApqB
         kUGxJEygoylNlbcONyo4hRn995KJEz7tsoytr67s+Q9GpHdivGww5Eg16oszeTujy6CV
         g6mA==
X-Gm-Message-State: AOAM532Uj25eIOGuear9rRzDF49uCO6t5Ac19NvAo/sTqKJNgdTeL95+
        3hiDkZfcIq/rtOBmOE1Rq3t6GiuBkzjSHA==
X-Google-Smtp-Source: ABdhPJwLsDN85Xj0fiK/BM3FJ/liLuY9abQLrAcV77pVSO8MYU+Ohr2UYXItYKySwsBy3SbQUYQnBg==
X-Received: by 2002:a6b:670f:: with SMTP id b15mr1609113ioc.15.1631806005249;
        Thu, 16 Sep 2021 08:26:45 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id s5sm1855131iol.33.2021.09.16.08.26.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 08:26:44 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id a22so8362344iok.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 08:26:44 -0700 (PDT)
X-Received: by 2002:a05:6638:dc8:: with SMTP id m8mr4934839jaj.93.1631806004132;
 Thu, 16 Sep 2021 08:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <1629887818-28489-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1629887818-28489-1-git-send-email-rnayak@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 16 Sep 2021 08:26:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WXC_GJFk0SAnwVas2YpWT=GFt0rHGqoFD8-a3fo6efEg@mail.gmail.com>
Message-ID: <CAD=FV=WXC_GJFk0SAnwVas2YpWT=GFt0rHGqoFD8-a3fo6efEg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Define CPU topology
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 25, 2021 at 3:37 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> sc7280 has 8 big.LITTLE CPUs setup with DynamIQ, so all cores are
> within the same CPU cluster. Add cpu-map to define the CPU topology.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)

Matches how things look with sc7180 and is correct to the best of my
knowledge. I think this is ready to land.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
