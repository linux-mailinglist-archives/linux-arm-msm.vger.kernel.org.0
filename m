Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1EE551ACA7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 20:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376622AbiEDS0N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 14:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377164AbiEDSZe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 14:25:34 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EC2053B59
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 10:52:00 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id b24so2542801edu.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 10:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=stNpZhjIc0rYI9UDa/dYUY+xIJVUaddvmdhdaTGP+Hg=;
        b=AAXDrANDKO1uGISazEbDjdomKwAoiXe4Gf0d06N7eRs7Mz6+HySMa2m59aygu7wY1K
         OshCn5wqPPIx2L71WNiK6uIY+jNs+wk69cCXgGJk9NdybD7+AevrQ/U4PB1f9WASix5r
         4XbXskNBem/yi8dBdrlsUDvvTw9X1Dx6dC9Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=stNpZhjIc0rYI9UDa/dYUY+xIJVUaddvmdhdaTGP+Hg=;
        b=JqEXfI7FFKbrsATNM8vrywZo7d0XXjM0pXrC8BpJuXKFPEg9+E0+VpeNYWxrOY2NaG
         vRI9+SBVVRe1NCctDrAutg+koZ2cpHYvb8sk7mIrN7qUsQP9DWVl/Mtjy4E9i9pSUrmT
         8m3UGzfgqQapch8CaPX5gUO8E1Rbb5058g82azP6iKHOzjIB39vEpttTFnkic8s6uzqR
         MeEbB0JEVHLZY7JAcTDkmg/kraBjuSsO/OCJ9mlrVCJUTrdj3ERLXu9AoCFEovGKQ0wH
         yCLNY56pYKscGLUzWqqyWGtyGLsXHAe6+vMyMAC6ySrRe5S3rS/2ipaXpR832ZgWeAA9
         Ee4w==
X-Gm-Message-State: AOAM530gl5xotJ4GLtn5O/Xim48WRIVdePWzu12JjDdQ3YA0Xr+nvgD5
        3JdnRJCuD3JL0FesalegPX/cWF6DaDBNTTbgYDk=
X-Google-Smtp-Source: ABdhPJxsd5GU0g/PJlJBh6Z/khzOGabTyvnclnM7E3iWIU8OEYAcbLXA72oSVPZEDlKyZaOVnV5zgg==
X-Received: by 2002:a05:6402:5c9:b0:420:aac6:257b with SMTP id n9-20020a05640205c900b00420aac6257bmr24393739edx.128.1651686718965;
        Wed, 04 May 2022 10:51:58 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id j12-20020aa7de8c000000b0042617ba63b2sm9411542edv.60.2022.05.04.10.51.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 10:51:58 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id i5so3008304wrc.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 10:51:58 -0700 (PDT)
X-Received: by 2002:a5d:42c8:0:b0:20a:d91f:87b5 with SMTP id
 t8-20020a5d42c8000000b0020ad91f87b5mr17565732wrr.301.1651686717659; Wed, 04
 May 2022 10:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220502173338.1.I26eca1856f99e6160d30de6d50ecab60e6226354@changeid>
 <165168485227.3730817.11549721304895378126.b4-ty@linaro.org>
In-Reply-To: <165168485227.3730817.11549721304895378126.b4-ty@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 4 May 2022 10:51:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WkJu8s5EmwJke49TPZ8CU8kD-CMcQi-9a3oUMqz9yBrQ@mail.gmail.com>
Message-ID: <CAD=FV=WkJu8s5EmwJke49TPZ8CU8kD-CMcQi-9a3oUMqz9yBrQ@mail.gmail.com>
Subject: Re: (subset) [PATCH] soc: qcom: socinfo: Add another ID for sc7180
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        matvore@chromium.org, Andy Gross <agross@kernel.org>,
        "Reviewed-by : Stephen Boyd" <swboyd@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, May 4, 2022 at 10:21 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon, 2 May 2022 17:33:45 -0700, Douglas Anderson wrote:
> > It appears the some sc7180 devices, like the one in my
> > sc7180-trogdor-homestar, report an ID of 407 instead of 425. Add
> > another ID into the list.
> >
> >
>
> Applied, thanks!
>
> [1/1] soc: qcom: socinfo: Add another ID for sc7180
>       commit: c35886d605604e0b03cdd835ae3249dc1fe0cc2a

Hmm. Did you see the responses from Sai [1] about this? He seemed to
indicate that there might be some issue here because he thought 407
was supposed to be a different SoC. Are we sure we want to land this
patch while we're sorting it out?

[1] https://lore.kernel.org/r/13819b2d-26f0-14f4-9cb9-affb6b18f13d@quicinc.com/
