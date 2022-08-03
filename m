Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 752C8588F57
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Aug 2022 17:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236444AbiHCPa2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Aug 2022 11:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233008AbiHCPa1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Aug 2022 11:30:27 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8DA5FAE
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Aug 2022 08:30:26 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id y13so18123850ejp.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Aug 2022 08:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=QSNLoRq7qbNX21X/zV/2AlYjV7hEb4BXWVGqbeUJ24g=;
        b=nzI1RPneh/LJJCu1k6xuiZTtzaae82xzjDcJUWtbJsNeS7XJdegrZyHq7NHnqw/K3v
         z5eW0E4AYjhiQE3UwN3v0NPjuunZorY6mJSCV9HwvyMq3kEg6Oek6rOvDV1r5SPQL06U
         pPeZgIcmUj31NF0m2C/T7AnXuxaoNbub9usmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=QSNLoRq7qbNX21X/zV/2AlYjV7hEb4BXWVGqbeUJ24g=;
        b=5o0aRJfxxTBeLaaHlw/XZ2ZWXcxwbewuivxiNyz47ZeEBLFBdMg94jGUYZKgMFtZ6x
         KpyD9jwPEXhbJCLPiVGe6omA7ER35q4FF+LiIv5HpOkBZNIsLvNUrBwjRJXftaB9BCOU
         XgxbFIZArZDoGJTnCv6rg5Ul3SFf4XE2OQeQlUTpXzAkPXBZI4eaL0GzVah4yzlhdKdC
         R7uFVOmLW1yKSUwlZhTseSX2xFFY0uidx8RgQcBzzU1EM58fq5fWGernFdjOy4+mo23C
         zRJKsHWssFNTc9TZha87AxQJxDmHty9DrcIMdPFTs8xeh4P+kSPPh818PBO3ZrG8+/uF
         mg9g==
X-Gm-Message-State: ACgBeo3rx4d5QaP+r4fdCu7d0IRkp5pKqIGwm1fAGtr7gYfeJcQuYV7A
        dELu1w7p2UiACJRmCN2gIAJMh1aTEew22K6dReU=
X-Google-Smtp-Source: AA6agR55BXqPpflyW+h4wYC8L7CjC0/BIVGZ//M9JrUHFA0FAixkndlk0rXK1fgZ0wZcOM8boGYyYw==
X-Received: by 2002:a17:907:12d7:b0:730:6d62:4ef7 with SMTP id vp23-20020a17090712d700b007306d624ef7mr12762396ejb.133.1659540625194;
        Wed, 03 Aug 2022 08:30:25 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id d7-20020a170906304700b0072b92daef1csm7496333ejd.146.2022.08.03.08.30.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Aug 2022 08:30:24 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id bk11so12140497wrb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Aug 2022 08:30:23 -0700 (PDT)
X-Received: by 2002:a5d:5889:0:b0:21d:bccd:38e3 with SMTP id
 n9-20020a5d5889000000b0021dbccd38e3mr16118496wrf.659.1659540622383; Wed, 03
 Aug 2022 08:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220803123332.8138-1-johan+linaro@kernel.org>
In-Reply-To: <20220803123332.8138-1-johan+linaro@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 3 Aug 2022 08:30:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VoFgMj9iOx1HR72AcnTi9OOSCOFm39kKOGXHkeb2SYBg@mail.gmail.com>
Message-ID: <CAD=FV=VoFgMj9iOx1HR72AcnTi9OOSCOFm39kKOGXHkeb2SYBg@mail.gmail.com>
Subject: Re: [PATCH 0/2] phy: qcom: drop regulator loads
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-phy@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 3, 2022 at 5:34 AM Johan Hovold <johan+linaro@kernel.org> wrote:
>
> Unless a driver implements an idle mode, there's generally no point in
> specifying an active-mode regulator load.
>
> Drop the regulator loads that were recently added to the Qualcomm QMP
> combo and edp PHY drivers.
>
> For a background discussion on this matter, see the following thread:
>
>         https://lore.kernel.org/r/YuPps+cvVAMugWmy@sirena.org.uk
>
> Johan
>
>
> Johan Hovold (2):
>   phy: qcom-qmp-combo: drop regulator loads
>   phy: qcom-edp: drop regulator loads
>
>  drivers/phy/qualcomm/phy-qcom-edp.c       | 12 -------
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 40 +++++------------------
>  2 files changed, 9 insertions(+), 43 deletions(-)

It's really hard to evaluate this based on the information I have
available to me. :( I'm all for getting rid of all this complexity if
it was added for no reason and I could definitely believe that on most
boards there is no reason for it at all as talked about in other
threads.

I guess I worry that there is some use case where LPM mode is actually
usable to power these devices when they're active. It seems like
_maybe_ it could be but only if nothing else is pulling power from the
same LDO? Some LDOs on the board I have seem to be able to do LPM up
to 30 mA and some of the rails are being specified as ~22mA.

The problem with regulator loads is that using them is kinda an "all
or nothing". Either all the consumers need to specify something or
none of them can. :( This means that once the first user comes in and
is able to run the device in LPM (maybe only if they're the only
consumer?) that everything will break. I honestly have no idea if this
will ever happen, though... Mark said the phrase "actively managing
loads it's probably not doing anything useful" and I think "probably"
is an important word there. If that word was "never" then it would
definitely be OK to remove load management like this, but with
"probably" it becomes a lot harder.

If we needed a hack, I'd somewhat prefer a hack that just bumps the
"mA" value here up to something higher. That would force it to HPM...
...although maybe it still won't work? Then the regulator will still
go down to LPM for other consumers if the PHY ever turns off. In that
case I guess there's no getting around other consumers requesting the
load or finding some way to say that on your board this regulator can
only ever be in HPM mode.


-Doug
