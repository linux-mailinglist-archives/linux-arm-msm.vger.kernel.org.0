Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C95020BA4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2020 22:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725781AbgFZU1t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jun 2020 16:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgFZU1t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jun 2020 16:27:49 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C393C03E979
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 13:27:49 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id o2so6177668vsr.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 13:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7bYsvRQj/KxO7y6dcHjKoVfFZMfrtTcsCp4sG21kGBU=;
        b=cVnSP+/m+7yKuZx6yu96KuQZagQE2QwRL8rlUKUdf7JB8RzaML0YfYX0XCNHk3q2AL
         1sEoS7KqNSGVHu8R9gM8PQc7xETIM3LxOnV1tHenKcyY7IWU/uqES3yBkHhO6rUuWOlw
         3F5uTuzCOzTOE8hRDq9rJCCArcCMLmk11dPUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7bYsvRQj/KxO7y6dcHjKoVfFZMfrtTcsCp4sG21kGBU=;
        b=gUbBMQ6mkmKH0dnUJTUCZ1EkavPkpw99Ragt2NWl79VoBqH0KUqKT7p2tkaaRfpmXj
         8c9SD/BPXTitzgGg+H4L96P/+DHmc2l7cyb6nJyogvEAydMyq37vAG9jcRDnWh0+HNTq
         mn6brekHL8KLJ7SmNXtaz0G98tcCBdClnsSjzxHvAvC6JRLL+AA54RpzNArdvRnWqUyJ
         eOwft1ain3TZaJhfofg1iocOwirSZWRFkTJ7VgBTZlnd9f3ue7Ph+fjowMGEVSjGbPIA
         JBuLKZqQGx8x6RZlr3WPBsVAS2vn45zN+1MtNdOkV++4cewo+In5TI89Vhd5Uj2Vms7C
         IY0w==
X-Gm-Message-State: AOAM532YKZs6XlKx81azJSO8MiIaW7NZrpc3Xpg+kT03w0JqKYBYH/7C
        gUgx2Hr7Etd5WcLF2G5U5Tq4GXuZqt8=
X-Google-Smtp-Source: ABdhPJyjZyUwqs8u82ugNxJGIon9s+sstAiUjU5Hus0Wky0SJLex5073nZvNJqw74CTutvI+QJrs4Q==
X-Received: by 2002:a67:eacd:: with SMTP id s13mr3832516vso.171.1593203268201;
        Fri, 26 Jun 2020 13:27:48 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id g10sm801899vkm.35.2020.06.26.13.27.47
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2020 13:27:48 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id z47so3445380uad.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 13:27:47 -0700 (PDT)
X-Received: by 2002:ab0:2eab:: with SMTP id y11mr3463084uay.22.1593202929409;
 Fri, 26 Jun 2020 13:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200626190808.8716-1-sibis@codeaurora.org>
In-Reply-To: <20200626190808.8716-1-sibis@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 26 Jun 2020 13:21:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X_0s-YOCj72F3rzu0oFkNBx82MeHsP2Yqrj0=LAOF_tg@mail.gmail.com>
Message-ID: <CAD=FV=X_0s-YOCj72F3rzu0oFkNBx82MeHsP2Yqrj0=LAOF_tg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add cpu OPP tables
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Saravana Kannan <saravanak@google.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Evan Green <evgreen@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jun 26, 2020 at 12:09 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add OPP tables required to scale DDR/L3 per freq-domain on SC7180 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>
> v2:
>  * drop interconnect-tag property
>
> v1: https://patchwork.kernel.org/patch/11527597/
>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 160 +++++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)

This is a huge perf boost and I'd love to see it land while waiting
for the interconnect-tag stuff to get resolved.  In theory I guess we
could land the sdm845 one too...

Tested-by: Douglas Anderson <dianders@chromium.org>

I'm also not really an expert here, but the patch seems sane to me, so
I'd give it a weak:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


-Doug
