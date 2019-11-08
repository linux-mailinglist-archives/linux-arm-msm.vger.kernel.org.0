Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58CA2F59C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 22:25:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731643AbfKHVWB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 16:22:01 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:38327 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732202AbfKHVWB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 16:22:01 -0500
Received: by mail-il1-f195.google.com with SMTP id u17so1493582ilq.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2019 13:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hHbuppcDTbd6STg/n36IHSkDQvgwaovyTFQQvw2epkA=;
        b=OByoOTNcmFJNLtvHQftXOvJ3EwPlUZKslCtZ5oa/wAMLAtwIxqf/4frJZyKSq+/sQ4
         J9PsCN6ojbD99kHspY9uPywEaqNgmN1H3Kf5nbghcQekUG29P3ibVItxCqTZIN5k8LUV
         2MYKE8HQtDmNsxMOegMVxCNOlqm8GgCUV1N2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hHbuppcDTbd6STg/n36IHSkDQvgwaovyTFQQvw2epkA=;
        b=OVTcO+V5rOESjpxeZKSFolo9Cc2ma1H6503X0khZX2ORQYhK4gZFIVGyLSr/XIXgfe
         TiqocfQyROBkwx2JT14d9AkNvYHAOLnWPMSxi7KyeK7kjXIXjvmDzp16VrSgvy4WULJV
         kEX6PT2t6WORDN02tv4FAOu1lftka6px34HTDHwJGAcnViuEHmX3D0YwTc+1vVzIMM0d
         Xm47cVbM7AUgnZkJ6DIY2SDF3i8dq/P1VO5y1hP8S1y6jpB6SSUnAHG7bmtbPQqwT2f0
         mTofBDYjYOOkZ/5A62n9XBHlVDkvnFA7CkQ8fYLnxle2YfQox/5EQlwQJ/YlLLkuhmsJ
         1lIQ==
X-Gm-Message-State: APjAAAXb9cSPX3/6/eApTL3kKJzRzuMDP8mrFSV56leuOTAZ4d0I2t5r
        ligdJbMUkJ2ROmW1BTOiJYW6Jd9Ds40=
X-Google-Smtp-Source: APXvYqwm32Jpwo+TcCCXI42+kV4Vj0j2V+dD/+9lMjBb8OrmC0CVMg/1rHGsojRgj1bMPrldtEVP7Q==
X-Received: by 2002:a92:3b04:: with SMTP id i4mr15094775ila.211.1573248120268;
        Fri, 08 Nov 2019 13:22:00 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id z20sm508880iof.78.2019.11.08.13.21.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2019 13:21:59 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id q83so7910483iod.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2019 13:21:59 -0800 (PST)
X-Received: by 2002:a5d:9059:: with SMTP id v25mr8937747ioq.58.1573248118962;
 Fri, 08 Nov 2019 13:21:58 -0800 (PST)
MIME-Version: 1.0
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org> <1568411962-1022-5-git-send-email-ilina@codeaurora.org>
In-Reply-To: <1568411962-1022-5-git-send-email-ilina@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 8 Nov 2019 13:21:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WOVHQyk0y3t0eki6cBfBedduQw3T-JZW2dERuCk9tRtA@mail.gmail.com>
Message-ID: <CAD=FV=WOVHQyk0y3t0eki6cBfBedduQw3T-JZW2dERuCk9tRtA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 04/14] drivers: irqchip: add PDC irqdomain for
 wakeup capable GPIOs
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>, maz@kernel.org,
        LinusW <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        mkshah@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Sep 13, 2019 at 3:00 PM Lina Iyer <ilina@codeaurora.org> wrote:
>
> diff --git a/include/linux/soc/qcom/irq.h b/include/linux/soc/qcom/irq.h
> new file mode 100644
> index 0000000..85ac4b6
> --- /dev/null
> +++ b/include/linux/soc/qcom/irq.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __QCOM_IRQ_H
> +#define __QCOM_IRQ_H
> +

I happened to be looking at a pile of patches and one of them added:

+#include <linux/irqdomain.h>

...right here.  If/when you spin your patch, maybe you should too?  At
the moment the patch I was looking at is at:

https://android.googlesource.com/kernel/common/+log/refs/heads/android-mainline-tracking

Specifically:

https://android.googlesource.com/kernel/common/+/448e2302f82a70f52475b6fc32bbe30301052e6b


-Doug
