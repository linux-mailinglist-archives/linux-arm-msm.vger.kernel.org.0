Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4443A430BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 22:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388145AbfFLUDj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 16:03:39 -0400
Received: from smtp4-g21.free.fr ([212.27.42.4]:46658 "EHLO smtp4-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387935AbfFLUDj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 16:03:39 -0400
Received: from [192.168.1.91] (unknown [77.207.133.132])
        (Authenticated sender: marc.w.gonzalez)
        by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2732119F5B5;
        Wed, 12 Jun 2019 22:03:22 +0200 (CEST)
Subject: Re: [PATCH v1] clk: qcom: msm8916: Don't build support by default
To:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>
References: <49b95f19-4da6-4491-6ed7-5238ecfc35a8@free.fr>
 <20190612191347.GE22737@tuxbook-pro>
 <20190612194915.8F5DD20866@mail.kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <dc11a192-f8c6-f90f-8214-303291b03258@free.fr>
Date:   Wed, 12 Jun 2019 22:03:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612194915.8F5DD20866@mail.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/06/2019 21:49, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2019-06-12 12:13:47)
>
>> On Wed 12 Jun 08:52 PDT 2019, Marc Gonzalez wrote:
>>
>>> Build QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 by default only when
>>> we're building MSM_GCC_8916.
>>>
>>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
>>
>> Not sure why these are default at all.
>>
>> But both drivers are used on platforms other than 8916 as well, so if
>> anything a fix would be to rename the APCS_MSM8916 to something more
>> generic (such as QCOM_CLK_APCS_GLOBAL) - but then the content should be
>> updated and the APCS mailbox driver as well...
> 
> I don't see any use in being this specific. I'd prefer we just leave
> this at the ARCH_FOO config level and not try anything more fancy.

As Bjorn pointed out, why do these default "on" at all?

https://elixir.bootlin.com/linux/latest/source/drivers/clk/qcom/Kconfig

There are dozens of config knobs in drivers/clk/qcom/Kconfig
and only these two force the default.

Let's remove the default altogether.

Regards.
