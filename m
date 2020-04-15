Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F421AB1F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 21:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441844AbgDOTrV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 15:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2406351AbgDOTrU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 15:47:20 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B67DC061A0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 12:47:18 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id r25so4701452oij.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 12:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cGqUHZ1cQgWuEpdLKBgrpNu2VBI6lZ/UbtgaGM3PR2w=;
        b=MAXtbqkFTbvJwV6W2Y8SVrGw4CxBTfaLZE+UiERljU3rMmKfHw/N7xAHpo2/33kP0F
         kGBTbsndHfwuH3XX3JaNtJUtRqGM6j/GxxoScSjvNjFUi+fIWtNvA5x9bqGeAWO5K6yE
         yuDNJD8zVx8u6egrlxWp4yRHVJXQtaUQocTKihaZrzzUrJltOgi1h8XcHR9O4aP7m+KM
         13U9pcY6tby2S9XQiFQiIZnA+dcv8mVTfK+Zgb3deitCxWtOIFHU6zbmHKyagTBC1rkF
         6Cb1I7vch+07zzM+4hoz9ozx+lRI4qmbmseWG37P7SZQvOeSlxEyiOpJ0exOtsWsnyQR
         BoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cGqUHZ1cQgWuEpdLKBgrpNu2VBI6lZ/UbtgaGM3PR2w=;
        b=XpWavs3vRdYyvi9QBDM3dicXeXE6tCfyDwZonMO55NtWrt3eoIDANLJP7hIctjO3IH
         L41vds9HA35oDUgH3SBB7S+LVyklE1LkM+7B1/0Wmka/DH1V0H4kXMDT8ZDFBcQGFS9s
         dv6nq1gwN7ttO+IrnGwi9Qq14KWknW5lk+b5uZXATqopEmm0DBQzjNbvqrVYiKYKwX5v
         AfGEWe7hSOXIZEK+ZikqNoUfrkdqzarQggMjMKe4CtvW3Wc2Sp2u9x3OlS1fVRsSOsZd
         c+kGEfS6EJ38s1JYGjHEONsLPQ+F5nxMDHbwU1hIJgwV+3dQdZMApd49V3lAF4b5IFzQ
         +h4Q==
X-Gm-Message-State: AGi0PuYcFD8+890WujjAlNqC42wdMK3jVhNZJ5hRH60HrunHgz1w+FWF
        wqLIDlnCsIlYsO33YeHTK+dtiC5zWJFk7h0OYPnk0Q==
X-Google-Smtp-Source: APiQypKXI7b37OLv0UAGqZPbAP/72wlky4u0dZ2W2ausYN6VtWCeXqIUNN0w+EotFLyi5+S15sfQq5DdQ8mU707OOYo=
X-Received: by 2002:aca:c311:: with SMTP id t17mr608546oif.169.1586980037619;
 Wed, 15 Apr 2020 12:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200326224459.105170-1-john.stultz@linaro.org>
 <20200326224459.105170-3-john.stultz@linaro.org> <20200415182536.GX199755@google.com>
In-Reply-To: <20200415182536.GX199755@google.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 15 Apr 2020 12:47:06 -0700
Message-ID: <CALAqxLUvQRS0iFz5fXReXvY08oij1BtP6vpnL1qUY-Bs6OncnQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] soc: qcom: rpmh: Allow RPMH driver to be loaded as
 a module
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 15, 2020 at 11:25 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Hi John,
>
> with commit efde2659b0fe ("drivers: qcom: rpmh-rsc: Use rcuidle
> tracepoints for rpmh") the rpmh-rsc driver fails to build as a
> module:
>
> drivers/soc/qcom/rpmh-rsc.c:281:3: error: implicit declaration of function 'trace_rpmh_send_msg_rcuidle' [-Werror,-Wimplicit-function-decr]
>                 trace_rpmh_send_msg_rcuidle(drv, tcs_id, j, msgid, cmd);
>
>
> The problem is that the _rcuidle() functions are not generated for modules:
>
> #ifndef MODULE
> #define __DECLARE_TRACE_RCU(name, proto, args, cond, data_proto, data_args) \
>         static inline void trace_##name##_rcuidle(proto)                \
>         {                                                               \
>                 if (static_key_false(&__tracepoint_##name.key))         \
>                         __DO_TRACE(&__tracepoint_##name,                \
>                                 TP_PROTO(data_proto),                   \
>                                 TP_ARGS(data_args),                     \
>                                 TP_CONDITION(cond), 1);                 \
>         }
> #else
> #define __DECLARE_TRACE_RCU(name, proto, args, cond, data_proto, data_args)
> #endif
>
> Not sure what the best solution would be in this case. Having the macro
> define a dummy function for modules would fix the build error, however it
> would be confusing that the event is traced when the driver is built-in,
> but not when it is built as a module.
>
> I imagine the goal behind making this driver a module is to have a single
> kernel image for multiple SoC platforms, without too much platform
> specific code in the kernel image itself.
>
> I guess the question is whether there any options for keeping the driver
> modular and having consistent tracing behavior, short of removing the
> tracepoint.

Yea.  Stephen found that issue in -next last night once Bjorn added
the patches to his tree yesterday.

I've reached out to see if the restrictions on the trace_*_rcuidle
calls on modules is still necessary in this thread:
  https://lore.kernel.org/lkml/CALAqxLV4rM74wuzuZ+BkUi+keccxkAxv30N4vrFO7CVQ5vnT1A@mail.gmail.com/

For now, I suggested Bjorn revert the patch in his tree, and I'll try
to figure out an alternative solution to the trace call.

thanks
-john
