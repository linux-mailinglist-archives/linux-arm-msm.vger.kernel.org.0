Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9508062E4F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 20:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234885AbiKQTIH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 14:08:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234510AbiKQTIG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 14:08:06 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72EB07EC9D
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 11:08:05 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id m4so2530884vsc.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 11:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YoCx/ytCPYkVE5RQNMVjvYQ1cgt8vpy5qf7ry5sPvLI=;
        b=KATVXcrr/wn1jSvQlMql9mKjlJN6uihFmffY0kTf394vNCMxfYR7w+bLEl0oYXlQQw
         tuzmYzT3C8obqgbnhr1QjJbMLGAJnkTF1EIFsQw40NpY6tT8BviqgJKUjkBEjOX5nYhd
         1NfynzqZv+AK5b+Dzokf9xPt5BJPv0Wzjllpi+UpSUDMRvtUYc5XRCzLm6T2U+yJwFEo
         eaozUZPZ4OXdQRwNaAY+sxzSDBMeWxI2DZiCAaxjikBnkCPlj1J0I7z8Uykta8gg61z1
         U1YLnsIhRCCVYtEi3MNxEnK/k/OzLL8m/qi+N1jbxmWT81dn0iWopzlHm47tDIl0Ay7K
         Q8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoCx/ytCPYkVE5RQNMVjvYQ1cgt8vpy5qf7ry5sPvLI=;
        b=cyVdGPc4vzzK9wUtBe0v+KwdLoQDQ1uWHUMF7GnGrm2YDnpmAVfzsqIGSo1Jy2/XEf
         l2vMiy9Ft+TrVxnl0+HdTlhfO/N3op4TqAol3yxaB+XATmU2TxTEKFsxlVrmq5c27Ewu
         D2BlyRrzHZtQPoBdpi5vn+bHALL8y6tLFqHgWdBtpd3XJfMwx/Nd6N6thcLY7NSm5KEr
         ZBYvgz4GnHJfWRb294/leF1anRUwG2/umqvEXQwFdylljqtnrX8oHQxxrHP3fWqkUcHs
         JAwjOu7dJqS1hrU8JgQR6AiI2nGRGch1Z5b5yfaSmnTxnG1cgjDgBGlCz22GRpgsTbk/
         ukMg==
X-Gm-Message-State: ANoB5pnWm06KhavAN7CLZlySOVwfhh1Sz0/mu15NuFWsp3G6DrxNIT/Q
        ETdXae2c+qKgcrXniGr2LK/po7Jm4rNB58eNjC+4
X-Google-Smtp-Source: AA0mqf6J5yqcpcttd4ELOOCF0HdnopkUmsVYVsd+mByWNTDZcbPIJZSsjK7dGnFAIs/xVxVTmkHI+rb+FayYV/MYNBk=
X-Received: by 2002:a67:c504:0:b0:3af:b21a:c2f5 with SMTP id
 e4-20020a67c504000000b003afb21ac2f5mr2607573vsk.81.1668712084529; Thu, 17 Nov
 2022 11:08:04 -0800 (PST)
MIME-Version: 1.0
References: <20221116115348.517599-1-javierm@redhat.com> <20221116120159.519908-1-javierm@redhat.com>
In-Reply-To: <20221116120159.519908-1-javierm@redhat.com>
From:   John Stultz <jstultz@google.com>
Date:   Thu, 17 Nov 2022 11:07:52 -0800
Message-ID: <CANDhNCr7ZwbCDK1ftigLK_S2qASj1yfenUG1WPaiYbjr5M9x3w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] driver core: Add fw_devlink.timeout param to stop
 waiting for devlinks
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Saravana Kannan <saravanak@google.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-arm-msm@vger.kernel.org,
        Peter Robinson <pbrobinson@redhat.com>,
        Steev Klimaszewski <steev@kali.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Enric Balletbo i Serra <eballetbo@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 16, 2022 at 4:02 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Currently, the probe deferral timeout does two things:
>
> 1) Call to fw_devlink_drivers_done() to relax the device dependencies and
>    allow drivers to be probed if these dependencies are optional.
>
> 2) Disable the probe deferral mechanism so that drivers will fail to probe
>    if the required dependencies are not present, instead of adding them to
>    the deferred probe pending list.
>
> But there is no need to couple these two, for example the probe deferral
> can be used even when the device links are disable (i.e: fw_devlink=off).
>
> So let's add a separate fw_devlink.timeout command line parameter to allow
> relaxing the device links and prevent drivers to wait for these to probe.

I'm probably being dim, but it's not immediately clear from this
description *why* this is useful. Maybe add some words on the tangible
benefit of splitting this up?

I'd also push a little bit back on why we need to split this into a
separate boot option. Since it's not obvious as to when a user would
want to use fw_devlink.timeout vs probe_deferral_timeout.
The extra complexity of remembering which timeout is for what might
become a burden to users and developers.

>
> +       fw_devlink.timeout=
> +                       [KNL] Debugging option to set a timeout in seconds for
> +                       drivers to give up waiting on dependencies and to probe
> +                       these are optional. A timeout of 0 will timeout at the
> +                       end of initcalls. If the time out hasn't expired, it'll
> +                       be restarted by each successful driver registration.
> +

This sounds pretty close to like the deferred_probe_timeout option.
I'd suggest some words to make the distinction more clear.

thanks
-john
