Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCAF4157D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 07:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239137AbhIWFWT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 01:22:19 -0400
Received: from ixit.cz ([94.230.151.217]:53778 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229504AbhIWFWT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 01:22:19 -0400
Received: from [10.111.222.169] (ixit.cz [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id B555823B26;
        Thu, 23 Sep 2021 07:20:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1632374446;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cFfRp9hRc2lQUu9wZPFFHqwIGiNz/3vf6zUsUc5shkg=;
        b=CanIE2BlFjfAJzudFVKoZFhT0A3sC3uvnAWt2+SFQtYXDGTBG65+VwECxCFi7cJfQh/Ebr
        HeAL0VtANKJpwE1c/EYiOYy10zxbwdQ7zH4HzPVq0IeHnlbRdpx8xCSb70k4a11N2sxBvg
        0IZsOU4kE5CoEB7bn23xOBjF6wiXJzU=
Date:   Thu, 23 Sep 2021 07:19:23 +0200
From:   David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] mfd: qcom-pm8xxx: switch away from using chained IRQ
 handlers
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>, phone-devel@vger.kernel.org
Message-Id: <B4GVZQ.IG4PDOTEQGB82@ixit.cz>
In-Reply-To: <CACRpkdb15D0m7L-vO7RFcAaVuS7hdD8J=6=15TFgRgvvsw1e9g@mail.gmail.com>
References: <20210921162433.1858296-1-dmitry.baryshkov@linaro.org>
        <CACRpkdb15D0m7L-vO7RFcAaVuS7hdD8J=6=15TFgRgvvsw1e9g@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

with this patch, it does boot without any problems or warnings 
regarding to IRQ.

Tested-by: David Heidelberg <david@ixit.cz>
Best regards
David Heidelberg

On Thu, Sep 23 2021 at 02:04:10 +0200, Linus Walleij 
<linus.walleij@linaro.org> wrote:
> On Tue, Sep 21, 2021 at 6:24 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> 
>>  PM8xxx PMIC family uses GPIO as parent IRQ. Using it together with 
>> the
>>  irq_set_chained_handler_and_data() results in warnings from the 
>> GPIOLIB
>>  as in this path the IRQ resources are not allocated (and thus the
>>  corresponding GPIO is not marked as used for the IRQ. Use 
>> request_irq so
>>  that the IRQ resources are proprely setup.
>> 
>>  Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I sent this patch:
> https://lore.kernel.org/lkml/20210819154400.51932-1-linus.walleij@linaro.org/
> 
> David Heidelberg reported that it didn't work for him.
> 
> David can you test Dmitry's patch instead and see if that works
> for you, I suppose I could have some bug in my patch :/
> It would be nice with a Tested-by from David.
> 
> FWIW the code looks good:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Yours,
> Linus Walleij


