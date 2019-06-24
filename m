Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E78250A35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 13:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727638AbfFXLz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 07:55:59 -0400
Received: from ns.iliad.fr ([212.27.33.1]:54742 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727579AbfFXLz7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 07:55:59 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 02C7520598;
        Mon, 24 Jun 2019 13:55:58 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id BF36F202C7;
        Mon, 24 Jun 2019 13:55:57 +0200 (CEST)
Subject: Re: [PATCH v1] phy: qcom-qmp: Raise qcom_qmp_phy_enable() polling
 delay
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <92d97c68-d226-6290-37d6-f46f42ea604b@free.fr>
 <a3a50cf5-083a-5aa8-e77c-6feb2f2fd866@codeaurora.org>
 <134f4648-682e-5fed-60e7-bc25985dd7e9@free.fr>
 <e9d7667d-7ed4-d97e-b010-d61b214e6451@ti.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <967571b1-358f-09c3-dee6-0e664ab3c3d3@free.fr>
Date:   Mon, 24 Jun 2019 13:55:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e9d7667d-7ed4-d97e-b010-d61b214e6451@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Mon Jun 24 13:55:58 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/06/2019 08:25, Kishon Vijay Abraham I wrote:

> On 14/06/19 6:08 PM, Marc Gonzalez wrote:
> 
>> The issue is usleep_range() being misused ^_^
>>
>> Although usleep_range() takes unsigned longs as parameters, it is
>> not appropriate over the entire 0-2^64 range.
>>
>> a) It should not be used with tiny values, because the cost of programming
>> the timer interrupt, and processing the resulting IRQ would dominate.
>>
>> b) It should not be used with large values (above 2000000/HZ) because
>> msleep() is more efficient, and is acceptable for these ranges.
> 
> Documentation/timers/timers-howto.txt has all the information on the various
> kernel delay/sleep mechanisms. For < ~10us, it recommends to use udelay
> (readx_poll_timeout_atomic). Depending on the actual timeout to be used, the
> delay mechanism in timers-howto.txt should be used.

Hello Kishon,

I believe the proposed patch does the right thing:

a) polling for the ready bit is not done in atomic context,
therefore we don't need to busy-loop

b) since we're ultimately calling usleep_range(), we should
pass an appropriate parameter, such as max_us = 10
(instead of max_us = 1, which is outside usleep_range spec)

Maybe it would help if someone reviewed this patch.

Regards.
