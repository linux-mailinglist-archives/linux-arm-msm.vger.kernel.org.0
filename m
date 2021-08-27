Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A13F93F95B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 10:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244509AbhH0IGR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 04:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231819AbhH0IGQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 04:06:16 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8AF1C061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 01:05:27 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id g138so3293317wmg.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 01:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=ixnLe+zWdJqfExJqEhC4uAFON4JzfuO3wZ4PfyB4wTU=;
        b=ChcI6LD1hhvK7IWPuiUgGc32sfc2Bc31ZwVb33jYzQJFhe5M9Ou2Awfi6IwNpY01+s
         MOUG88jTMCJSmZIX0XFj9gLuNqRxnOvXHo9vuIQYnDMlGnm1UCfFCjc8aGsZl+ex7/PJ
         JVMdRZTjATPFWVphiv8UxSwFoC81QPShHW/G/2QaOiWDicJMM0epYUhtyPaPbHmUX7W6
         WJm492D+mw5qR2auojscz7813Z3gQ13Dn0EX6oYz6hq+VFLRNixxl7MRROCBa0AqpK3r
         pB497Y3lvrIDriKqoDFtFONC9fkFDg1OxQuZWUZJiSqkoKKJWmCW+RTSrGBYzaRXGpak
         kkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=ixnLe+zWdJqfExJqEhC4uAFON4JzfuO3wZ4PfyB4wTU=;
        b=uALc6SdU6Zr39FK21f3H1U+XGi2TyJ4Mdr77ySmGfQMhjfPRRZKZTMKdC6qt/ARemN
         AdSFjdJvZ0EAKmSH319E/Hg2ifaI3iNvMkfID6lp2dXiEN4TrQZ/kkLVCx067Nwcv96u
         N2omLXzy7PB4EfApQPFoC03Rn7Vh5fWf1qOPb77t65q7RVUs/S9ZYpeYSWd975aN4MOW
         oxv1A11K77duzaZ632aOxBqxJtF7wQVXb3mrv7z5sjWmApaPSmKfUjNjLJiB5XoXWTLw
         sfuGyqH57PO5T0l+iipiGzdRUAs2fVWdvU5IkcgXYZRxU0tOswmd/HP77LMJEa8ERpmX
         OlZg==
X-Gm-Message-State: AOAM533KvfehqWsqoZrJ8fPHYvebxY6zZirJIE4Ild4l0yeF9uw6DlIk
        4ZNjx91TdI89zkJjOxBMrr266g==
X-Google-Smtp-Source: ABdhPJxyo4ok+1HHsPzPr+B6L02WuYJwVVSaUa6YJRBOcMdv0HlA0T8C/yHvDPKAfGmjepjMGZwYng==
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr748834wmj.169.1630051526356;
        Fri, 27 Aug 2021 01:05:26 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a5sm4786692wmj.30.2021.08.27.01.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 01:05:25 -0700 (PDT)
References: <20210826185739.3868-1-ftoth@exalondelft.nl>
User-agent: mu4e 1.6.4; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ferry Toth <ftoth@exalondelft.nl>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Lorenzo Colitti <lorenzo@google.com>,
        Wesley Cheng <wcheng@codeaurora.org>, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        frowand.list@gmail.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>
Subject: Re: [PATCH v2 0/3] Revert "usb: gadget: u_audio: add real feedback
 implementation"
Date:   Fri, 27 Aug 2021 09:59:40 +0200
In-reply-to: <20210826185739.3868-1-ftoth@exalondelft.nl>
Message-ID: <1j4kbbxqgr.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Thu 26 Aug 2021 at 20:57, Ferry Toth <ftoth@exalondelft.nl> wrote:

> Although there is a patch resolving this issue (see 
> https://lore.kernel.org/linux-usb/1jilzsy8g7.fsf@starbuckisacylon.baylibre.com/T/#u)
> it needs a little work and will not be ready for v5.14.0 release. Until then
> revert the series.

Seems like a quite messy solution when the fix available :/
Change with the updated commit description is avaialable BTW [0]

[0]: https://lore.kernel.org/20210827075853.266912-1-jbrunet@baylibre.com

>
> v2:
> - Added SoB (Balbi)
>
>
> Ferry Toth (3):
>   Revert "usb: gadget: u_audio: add real feedback implementation"
>   Revert "usb: gadget: f_uac2: add adaptive sync support for capture"
>   Revert "usb: gadget: f_uac2/u_audio: add feedback endpoint support"
>
>  .../ABI/testing/configfs-usb-gadget-uac2      |   2 -
>  Documentation/usb/gadget-testing.rst          |   2 -
>  drivers/usb/gadget/function/f_uac2.c          | 144 +----------
>  drivers/usb/gadget/function/u_audio.c         | 225 +-----------------
>  drivers/usb/gadget/function/u_audio.h         |  12 -
>  drivers/usb/gadget/function/u_uac2.h          |   4 -
>  6 files changed, 6 insertions(+), 383 deletions(-)

