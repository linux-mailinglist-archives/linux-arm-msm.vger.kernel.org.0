Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75311647A3B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 00:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbiLHXmb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 18:42:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbiLHXmL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 18:42:11 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE2C89588
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Dec 2022 15:39:46 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id o189so1236988iof.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Dec 2022 15:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DJeoCLQFLEcXPKMOTThWiocjzfFiXa/lSgHVK2Nng0s=;
        b=QVdu5FC4oPAX8RxYvYIUWE1y4Q/ilXurCHFLGc3Tc4dGFGvxcUoOf9xt+86BYVutW4
         oYe3qgOWxfVKg7Ww5lqd5r1tJ6RPh21l6AUE333JsjjanctNwrHEj/Nr0Djp99ZSsd0t
         0cPZow6eza44fW1eyjYIOuOlev6TUd4XxBZAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJeoCLQFLEcXPKMOTThWiocjzfFiXa/lSgHVK2Nng0s=;
        b=iws0ejXeDYAxgajTbqPeYSzyh1OtOi7N5r/EYUfZsBTD/tBgET5Z8xiaovebXU1Lpb
         zhQHiREUJoIxX+g8frD9dXxt955NlHzbhUV4VviEhWv4QjnKZ3gIYQLl0gt8fSs0L8ZL
         ILz+F//QHGlVz7Np9pzotIB8SZWLirN5RWaoU/SfbQjkKcviGABJDmGjG91AO/gGHgDY
         EPhETcjIFE+TFOZa2dCGZK7bcmBU0v8dYWzPpXn10i7APTo97t0dd97NJVglwJvNc154
         E6pdSKErA0NnnvKeEozGuKtf6+rTiuHwXRtIAW3uJRvTp3WYmNuUAUglukz9Tyz1BuOi
         68aQ==
X-Gm-Message-State: ANoB5pm2lM4ky9P1kPFA4DWHlmKoZua6Ch53nrVPixMJv13R4VxB0yX3
        xvjR5Fbft0pd+QFDnOnujvdYMw==
X-Google-Smtp-Source: AA0mqf61PL4z/iiDUVDUG4rHyolbpLtgVRGJ1pxGqY65GsUZCF5KiyCH6Vg3DF3vr2wfeHsAAeEqfw==
X-Received: by 2002:a5d:9acd:0:b0:6df:e175:74c1 with SMTP id x13-20020a5d9acd000000b006dfe17574c1mr2752887ion.21.1670542786303;
        Thu, 08 Dec 2022 15:39:46 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id ca6-20020a0566381c0600b0038a6d03db70sm1957617jab.34.2022.12.08.15.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 15:39:45 -0800 (PST)
Date:   Thu, 8 Dec 2022 23:39:45 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-input@vger.kernel.org,
        Yunlong Jia <ecs.beijing2022@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] Input: elants_i2c: Delay longer with reset asserted
Message-ID: <Y5J1wY/TzbU6BheD@google.com>
References: <20221208192006.1070898-1-dianders@chromium.org>
 <20221208111910.5.I6edfb3f459662c041563a54e5b7df727c27caaba@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221208111910.5.I6edfb3f459662c041563a54e5b7df727c27caaba@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 08, 2022 at 11:20:06AM -0800, Douglas Anderson wrote:
> The elan touchscreen datasheet says that the reset GPIO only needs to
> be asserted for 500us in order to reset the regulator. The problem is
> that some boards need a level shifter between the signals on the GPIO
> controller and the signals on the touchscreen. All of these extra
> components on the line can slow the transition of the signals. On one
> board, we measured the reset line and saw that it took almost 1.8ms to
> go low. Even after we bumped up the "drive strength" of the signal
> from the default 2mA to 8mA we still saw it take 421us for the signal
> to go low.
> 
> In order to account for this we let's lengthen the amount of time that

nit: s/we let's/we/ || s/we let's/let's/

no need to re-spin just for this

> we keep the reset asserted. Let's bump it up from 500us to 5000us.
> That's still a relatively short amount of time and is much safer.
> 
> It should be noted that this fixes real problems. Case in point:
> 1. The touchscreen power rail may be shared with another device (like
>    an eDP panel). That means that at probe time power might already be
>    on.
> 2. In probe we grab the reset GPIO and assert it (make it low).
> 3. We turn on power (a noop since it was already on).
> 4. We wait 500us.
> 5. We deassert the reset GPIO.
> 
> With the above case and only a 500us delay we saw only a partial reset
> asserted, which is bad. Giving it 5ms is overkill but feels safer in
> case someone else has a different level shifter setup.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
