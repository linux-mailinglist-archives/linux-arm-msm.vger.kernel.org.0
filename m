Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDA8A3492B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 14:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbhCYNHF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 09:07:05 -0400
Received: from m12-15.163.com ([220.181.12.15]:34958 "EHLO m12-15.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229764AbhCYNHC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 09:07:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=JRD1+
        IbMgofiTsnnszT7a1aFxuD+Rf4DtFRzrZnMNik=; b=fg4iER1k4piyUUO9dUwn4
        Ncsl16Gy4EuD5Wzb8XucNFBN7aBIi6qlPmAbQgND8EMxnqj2/7U4abJ+Dwl61/7f
        wIbVSAxavP5csnSPsGW8CarO+iIqT6gVGqeB3cZuspu9cEF0tz8oG0A09JDIRl2Q
        Oyj2Ud+b/01tBod3NPznqM=
Received: from localhost (unknown [218.94.48.178])
        by smtp11 (Coremail) with SMTP id D8CowAAHxlqcilxgDDJIGQ--.59166S2;
        Thu, 25 Mar 2021 21:05:39 +0800 (CST)
Date:   Thu, 25 Mar 2021 21:05:43 +0800
From:   Jian Dong <dj0227@163.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        matthias.bgg@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        huyue2@yulong.com, Jian Dong <dongjian@yulong.com>
Subject: Re: [PATCH] regulator: Use IRQF_ONESHOT
Message-ID: <20210325210543.000001d4@163.com>
In-Reply-To: <87v99fju29.fsf@kernel.org>
References: <1616501538-120724-1-git-send-email-dj0227@163.com>
        <9428d264-aafa-793f-8c6c-86c55213f5f9@canonical.com>
        <87v99fju29.fsf@kernel.org>
Organization: yulong
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: D8CowAAHxlqcilxgDDJIGQ--.59166S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFW8XF1xZr4fCrWDGF1xXwb_yoW5KrWkpF
        4UZFnrCFW0yFW8Z3y7C34Iy3WYq3W0k3s7ArW8Aw4fXF1YvFn7tF1DArW5CF18Xr93Jw4a
        yrWq9ayxGFWrZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bU_M-UUUUU=
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: dgmqjjqx6rljoofrz/xtbB0gNg3VUMa+drhAAAsW
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 25 Mar 2021 14:29:02 +0200
Felipe Balbi <balbi@kernel.org> wrote:

> Hi,
> 
> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> writes:
> > On 23/03/2021 13:12, Jian Dong wrote:  
> >> From: Jian Dong <dongjian@yulong.com>
> >> 
> >> Fixes coccicheck error:
> >> 
> >> drivers/regulator/mt6360-regulator.c:388:8-33: ERROR:
> >> drivers/regulator/pca9450-regulator.c:781:7-32: ERROR:
> >> drivers/regulator/slg51000-regulator.c:480:8-33: ERROR:
> >> drivers/regulator/qcom-labibb-regulator.c:364:8-33: ERROR:
> >> Threaded IRQ with no primary handler requested without IRQF_ONESHOT
> >> 
> >> Signed-off-by: Jian Dong <dongjian@yulong.com>
> >> ---
> >>  drivers/regulator/mt6360-regulator.c      | 4 ++--
> >>  drivers/regulator/pca9450-regulator.c     | 2 +-
> >>  drivers/regulator/qcom-labibb-regulator.c | 3 ++-
> >>  drivers/regulator/slg51000-regulator.c    | 4 ++--
> >>  4 files changed, 7 insertions(+), 6 deletions(-)
> >> 
> >> diff --git a/drivers/regulator/mt6360-regulator.c
> >> b/drivers/regulator/mt6360-regulator.c index 15308ee..947350d
> >> 100644 --- a/drivers/regulator/mt6360-regulator.c
> >> +++ b/drivers/regulator/mt6360-regulator.c
> >> @@ -385,8 +385,8 @@ static int
> >> mt6360_regulator_irq_register(struct platform_device *pdev, return
> >> irq; }
> >>  
> >> -		ret = devm_request_threaded_irq(&pdev->dev, irq,
> >> NULL, irq_desc->handler, 0,
> >> -						irq_desc->name,
> >> rdev);
> >> +		ret = devm_request_threaded_irq(&pdev->dev, irq,
> >> NULL, irq_desc->handler,
> >> +					IRQF_ONESHOT,
> >> irq_desc->name, rdev);  
> >
> > This does not look like trivial rename/replace fix. This should be
> > tested but it looks that you just did what coccinelle asked for,
> > without testing.  
> 
> Right, but it must be done. If things work today, they work out of
> sheer luck. Also, which evidence is there that $subject wasn't tested?
> 
it just use coccinelle to check again, the warning didn't rise after
modify

> >> diff --git a/drivers/regulator/pca9450-regulator.c
> >> b/drivers/regulator/pca9450-regulator.c index 2f7ee21..d4bc1c3
> >> 100644 --- a/drivers/regulator/pca9450-regulator.c
> >> +++ b/drivers/regulator/pca9450-regulator.c
> >> @@ -780,7 +780,7 @@ static int pca9450_i2c_probe(struct i2c_client
> >> *i2c, 
> >>  	ret = devm_request_threaded_irq(pca9450->dev,
> >> pca9450->irq, NULL, pca9450_irq_handler,
> >> -					(IRQF_TRIGGER_FALLING |
> >> IRQF_ONESHOT),
> >> +					IRQF_TRIGGER_FALLING |
> >> IRQF_ONESHOT,  
> >
> > How this is related to the missing IRQF_ONESHOT?  
> 
> agreed.
> 
> >> diff --git a/drivers/regulator/slg51000-regulator.c
> >> b/drivers/regulator/slg51000-regulator.c index 75a941f..3f310ab
> >> 100644 --- a/drivers/regulator/slg51000-regulator.c
> >> +++ b/drivers/regulator/slg51000-regulator.c
> >> @@ -479,8 +479,8 @@ static int slg51000_i2c_probe(struct
> >> i2c_client *client) if (chip->chip_irq) {
> >>  		ret = devm_request_threaded_irq(dev,
> >> chip->chip_irq, NULL, slg51000_irq_handler,
> >> -
> >> (IRQF_TRIGGER_HIGH |
> >> -						IRQF_ONESHOT),
> >> +						IRQF_TRIGGER_HIGH
> >> |
> >> +						IRQF_ONESHOT,
> >>  						"slg51000-irq",
> >> chip);  
> >
> > How this is related to the missing IRQF_ONESHOT?  
> 
> agreed.
> 
I thnik it maybe the result of the coccinelle rule. it need to check 
value explicit. another wanring like this:  define irq_flag
= IRQF_ONESHOT, then reference irq_flag in fuction, it also will trigger
coccinelle warning. it seems not the code error but coccicheck bug.

