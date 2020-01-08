Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0138F1346CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 16:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729164AbgAHP6u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 10:58:50 -0500
Received: from mga12.intel.com ([192.55.52.136]:43702 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727746AbgAHP6t (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 10:58:49 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jan 2020 07:58:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; 
   d="scan'208";a="303590872"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga001.jf.intel.com with ESMTP; 08 Jan 2020 07:58:46 -0800
Subject: Re: [PATCH v5 0/4] usb: xhci: Add support for Renesas USB controllers
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Todd Kjos <tkjos@google.com>,
        Alistair Delva <adelva@google.com>
References: <20191106083843.1718437-1-vkoul@kernel.org>
 <CANcMJZDqX6-+naGEbBiyM+1cZS6jfMoP9bm5Uk4ZuP_mw5aNWw@mail.gmail.com>
 <20200108040707.GU2818@vkoul-mobl> <20200108062436.GA2276347@kroah.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <b0dc038b-cc25-1d37-9339-689bb5b61ff7@linux.intel.com>
Date:   Wed, 8 Jan 2020 18:00:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200108062436.GA2276347@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8.1.2020 8.24, Greg Kroah-Hartman wrote:
> On Wed, Jan 08, 2020 at 09:37:07AM +0530, Vinod Koul wrote:
>> Hi John,
>>
>> On 07-01-20, 11:51, John Stultz wrote:
>>> On Wed, Nov 6, 2019 at 12:40 AM Vinod Koul <vkoul@kernel.org> wrote:
>>>>
>>>> This series add support for Renesas USB controllers uPD720201 and uPD720202.
>>>> These require firmware to be loaded and in case devices have ROM those can
>>>> also be programmed if empty. If ROM is programmed, it runs from ROM as well.
>>>>
>>>> This includes two patches from Christian which supported these controllers
>>>> w/o ROM and later my patches for ROM support and multiple firmware versions.
>>>>
>>>
>>> Hey Vinod!
>>>     In pushing this series to one of the Android trees for the db845c,
>>> there was some concern raised that this series is adding a lot of
>>> renesas specific logic to the more generic xhci-pci driver. There was
>>> some question if instead that logic should be added to its own
>>> file/module? Do you have any thoughts on this?
>>
>> TBH I have not thought about that and in previous post neither Greg or
>> Mathias gave a feedback that this was not acceptable...
>>
>> We can think about splitting but apart from firmware load there is not
>> much extra functionality that we need to add, the controller behaviour
>> as a standard xhci-pci. So i am not sure if we gain much by splitting.
>>
>>> Also, It seems there hasn't been much feedback on this for a few
>>> months now. Is there a newer version of the patchset I should sync
>>> with? Do you have plans to resubmit soon?
>>
>> Well am still waiting for feedback :( I dont have any update on top of
>> this, I can repost but I dont think that really serves a purpose.
>>
>> I would really like to hear from Greg if this series is acceptable and
>> if not what would he like to see changed.
> 
> Greg is not the xhci maintainer :)
> 

Reviewing this always got bumped down on my todo list as other urgent issues
came up.

I think the concern about adding this amount of renesas specific code to
xhci-pci.c is valid. This series adds over 900 lines of Renesas FW loading
code to a 600 line xhci-pci.c
  
-Mathias
