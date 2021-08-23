Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9290C3F53C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 01:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233358AbhHWXuw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 19:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233330AbhHWXut (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 19:50:49 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2038C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 16:50:05 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso9380001otv.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 16:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=WoDDjdzbvPyEs19Npp+KsDh7LDnbNT5MIojU8+tk5Fw=;
        b=lxV+LoLa6AmzEui46cKIIlmIVceP1kYM8VWwX7911dwfuaalkODC+0x8OScWBEMuc+
         R5+iNiCXJR/9dZKmqhyjGONtNUjng1Uh4paCMbcZbPTX1zbc9gwrOZeeQJ6c9R9p97ut
         8sh+04l2eksB3ZaemEeRRbtxSvyMcIGshrD+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=WoDDjdzbvPyEs19Npp+KsDh7LDnbNT5MIojU8+tk5Fw=;
        b=YIGRLGUS1UR9zF7DfkSbpXF7FCy56qCVdYOEz8QmwRQEs1vqg8fhms13AsEFUbFemM
         GZq8UHUhlp5QqgkVRL04xv87SUBmlAVPZAUsApTTipNtFTiut2s1aygi0cYat4ZYYgG4
         63A/eOvjsgTWRK5vf82vCqQn8AV8gJPvv0av24fkGZtvBHdvrD9mTYLMV+M+mzw1k0wD
         ttJRHJb/cGmhHG629aKE6F8lDreWm1jEirgLtfvbAqdntld6RsRwYozMTUn1ZY4YR1zH
         z4XWLDs/n4qpW+g5gWbYrLjAtvUpyFNtgm0TlZ2SiWNXlC1+FcILmJfzlL6uJmXZsJXu
         CmPg==
X-Gm-Message-State: AOAM532ox2CmC188uU9IhmMgAKiVzG+mxc8rzZnbhsSUtsLeogornv2J
        OA5wD/ks7bhD3FKPk1q1ZuiZ6NZFhjufTXRwvKCUDA==
X-Google-Smtp-Source: ABdhPJyplZFiLcT/PUaK7ZB+YTOaFz++lRFqFYou4I57i80IsaoaIZAZ18qqb81QRva1zUDu1wKPZC4CXzo1GJhyYpY=
X-Received: by 2002:a05:6830:2473:: with SMTP id x51mr22956792otr.34.1629762605326;
 Mon, 23 Aug 2021 16:50:05 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Aug 2021 18:50:04 -0500
MIME-Version: 1.0
In-Reply-To: <20210823134726.1.I1dd23ddf77e5b3568625d80d6827653af071ce19@changeid>
References: <20210823134726.1.I1dd23ddf77e5b3568625d80d6827653af071ce19@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 23 Aug 2021 18:50:04 -0500
Message-ID: <CAE-0n52Rp9QGUYeP==YdXEJAwbtHtZX=5b3gaR-smLMFybsf6A@mail.gmail.com>
Subject: Re: [PATCH] thermal: qcom: spmi-adc-tm5: Don't abort probing if a
 sensor is not used
To:     Amit Kucheria <amitk@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Matthias Kaehlcke (2021-08-23 13:47:30)
> adc_tm5_register_tzd() registers the thermal zone sensors for all
> channels of the thermal monitor. If the registration of one channel
> fails the function skips the processing of the remaining channels
> and returns an error, which results in _probe() being aborted.
>
> One of the reasons the registration could fail is that none of the
> thermal zones is using the channel/sensor, which hardly is a critical
> error (if it is an error at all). If this case is detected emit a
> warning and continue with processing the remaining channels.
>
> Fixes: ca66dca5eda6 ("thermal: qcom: add support for adc-tm5 PMIC thermal monitor")
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reported-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Should we also disable the 'charger-thermistor@0' node in
sc7180-trogdor.dtsi on lazor boards, instead of the thermal zone, or in
addition to the thermal zone? It isn't used so there's not much value in
exposing it.
