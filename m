Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B75E93F96B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 11:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232856AbhH0JRL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 05:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232282AbhH0JRK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 05:17:10 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A0FC061757;
        Fri, 27 Aug 2021 02:16:22 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id fz10so4147112pjb.0;
        Fri, 27 Aug 2021 02:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d3XRTlq16t0wJ8HaEjtxOV1ZKnV6ECbNojq2Fi7Sq0w=;
        b=jSGxin7FakfqGuTj23IY9L2oNrl/AOVnfwZsB7vywp1smzg2kJFQVnbrc1EszHV0IX
         gbiBgpk8B6F5eGuoU7skjAoqJRhhcD/4CSliMbLEafVbhpOZacDq1grQH8jffNKFsR9W
         aFGOkoZk7nMniiag4Hr/RkILfElroDBMW80W1E1m63j8dOpsHn5SDNEMZKsTHDts95ra
         HZskFv9+RF8RgyinudRjLyhbtByK8qYp3PCFrw8nzwHrzqv7druae5yYcC6x1BdNXLV8
         2I7G7peQO5luoPa8tysTMqlVmL+tRg8m5zBTHqe0z1mgoS8t1fRLs8EJVRKwY3art00T
         nRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d3XRTlq16t0wJ8HaEjtxOV1ZKnV6ECbNojq2Fi7Sq0w=;
        b=l0BoUdl0gkGUWaxwpjid6w+WmzSpuo5MvXXEDQk6Jzen7+jgL+2e+mclIQlKlK7dma
         vFuU38WAGW+C8XDppFU2tgqEWjAGFFZTLgFF2d6lEjngdKWjh7WOiBEZ7HWbRc+LLRmt
         gBdTsRljs+YudWPzZDutbBgkliPn8UBaJ/kPUowmGkKyawnEcsCged9Pgu1DVx5Rt/dn
         8yBG+1dxPINd3GhJ/MSeS34bAcIlqAsM9yisu5d6TOLACiRkinKoZ6ZOKU4FqM81Zif7
         PR+B32b3wKoZ0ovEACKShBrybYYoA20Y55jqaSqjRI7PK0Fc87IM8aXaKIAhkkqywwQM
         whSQ==
X-Gm-Message-State: AOAM530cpQwoj0x/g6r2BXFUALklU8pXYE75L1hv4wuZ/WHUETQTNM3Z
        Kv1GWBEGopkurZm5Qk5giOQj1iefa6t05ldX3ho=
X-Google-Smtp-Source: ABdhPJyzeMozxSYqalhjT7ul9ZDWu9jJQD7ANoKobe0jVGOY+MJkoh9ZDaPGeAZoVoZmIL4s/eMt3vlsrp2fTMl/noo=
X-Received: by 2002:a17:90a:6502:: with SMTP id i2mr22150491pjj.129.1630055781885;
 Fri, 27 Aug 2021 02:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210826185739.3868-1-ftoth@exalondelft.nl> <1j4kbbxqgr.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j4kbbxqgr.fsf@starbuckisacylon.baylibre.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 27 Aug 2021 12:15:42 +0300
Message-ID: <CAHp75Vdu8v1QSi0CQw7qp-yPhMtwJ_hQO=GT5pWoD0nxmKoF_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Revert "usb: gadget: u_audio: add real feedback implementation"
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ferry Toth <ftoth@exalondelft.nl>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        USB <linux-usb@vger.kernel.org>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Lorenzo Colitti <lorenzo@google.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 27, 2021 at 11:05 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Thu 26 Aug 2021 at 20:57, Ferry Toth <ftoth@exalondelft.nl> wrote:
>
> > Although there is a patch resolving this issue (see
> > https://lore.kernel.org/linux-usb/1jilzsy8g7.fsf@starbuckisacylon.baylibre.com/T/#u)
> > it needs a little work and will not be ready for v5.14.0 release. Until then
> > revert the series.
>
> Seems like a quite messy solution when the fix available :/

Is it? AFAIR Thing pointed out to some problems with the proposed
solution. Have those been addressed?

> Change with the updated commit description is avaialable BTW [0]

> [0]: https://lore.kernel.org/20210827075853.266912-1-jbrunet@baylibre.com

Dunno, but this gives me 404.

-- 
With Best Regards,
Andy Shevchenko
