Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50FC236EE4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 10:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbfFFIk2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 04:40:28 -0400
Received: from ns.iliad.fr ([212.27.33.1]:53848 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725769AbfFFIk2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 04:40:28 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 4961720A52;
        Thu,  6 Jun 2019 10:40:25 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 6285A20B19;
        Thu,  6 Jun 2019 10:40:22 +0200 (CEST)
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add Lenovo Miix 630
To:     Lee Jones <lee.jones@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20190423160543.9922-1-jeffrey.l.hugo@gmail.com>
 <20190423160616.10017-1-jeffrey.l.hugo@gmail.com>
 <20190606055034.GA4797@dell> <20190606072601.GT22737@tuxbook-pro>
 <20190606081348.GB4797@dell>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <e58a039d-fed4-0636-e17c-86f721ff5785@free.fr>
Date:   Thu, 6 Jun 2019 10:40:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606081348.GB4797@dell>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Jun  6 10:40:25 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/06/2019 10:13, Lee Jones wrote:

> On Thu, 06 Jun 2019, Bjorn Andersson wrote:
> 
>> On Wed 05 Jun 22:50 PDT 2019, Lee Jones wrote:
>>
>>> On Tue, 23 Apr 2019, Jeffrey Hugo wrote:
>>>
>>>> This adds the initial DT for the Lenovo Miix 630 laptop.  Supported
>>>> functionality includes USB (host), microSD-card, keyboard, and trackpad.
>>>>
>>>> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>>>  .../boot/dts/qcom/msm8998-clamshell.dtsi      | 278 ++++++++++++++++++
>>>>  .../boot/dts/qcom/msm8998-lenovo-miix-630.dts |  30 ++
>>>
>>> What's happening with this patch?
>>>
>>
>> The thermal-zones are wrong, but I'm okay with an incremental patch for
>> that...
> 
> I guess it would take you about 10 seconds to whip those out when
> merging?

https://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git/commit/?h=for-next&id=ad480e0149cfc10defe76e88354b977360adb7a1

AFAIU, the fixup is to just drop the thermal-zones section altogether.

Regards.
