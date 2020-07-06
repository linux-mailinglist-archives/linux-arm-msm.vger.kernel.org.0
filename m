Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA280215AB0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2020 17:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729347AbgGFP07 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jul 2020 11:26:59 -0400
Received: from mga07.intel.com ([134.134.136.100]:39112 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729297AbgGFP07 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jul 2020 11:26:59 -0400
IronPort-SDR: NI636LsW9wqT4bnbA+cm06WsrU/lh64oVsOh90a4yOPKJU3o5w/vycIhEp5qjHxSp9IPU6cahi
 pwLj+zOY1BwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="212414623"
X-IronPort-AV: E=Sophos;i="5.75,320,1589266800"; 
   d="scan'208";a="212414623"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2020 08:26:58 -0700
IronPort-SDR: /MBlYwj7/KgsJ9GrR/HehGosJoIuy94JitZkdzzLkYSofAon+UUD7x6feL/RPc2NlLvf6isrKu
 +DBHskJ4Ozag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,320,1589266800"; 
   d="scan'208";a="313993583"
Received: from djiang5-mobl1.amr.corp.intel.com (HELO [10.212.168.148]) ([10.212.168.148])
  by orsmga008.jf.intel.com with ESMTP; 06 Jul 2020 08:26:57 -0700
Subject: Re: [qemu] boot failed: Unable to handle kernel NULL pointer
 dereference at virtual address 0000000000000000
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-serial@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>, jirislaby@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ldewangan@nvidia.com, Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, Qian Cai <cai@lca.pw>,
        lkft-triage@lists.linaro.org
References: <CA+G9fYvqW-RQxt3kSoNkh5Y2REoe0QQB_dTz_KPzhJzcwiM5OA@mail.gmail.com>
 <CAK8P3a1Lda8HhsDvDREf-cOgb4RkCgEKK5Q-Zj+UhK8tsAaBLw@mail.gmail.com>
 <51d6e5bb-3de1-36dc-15a4-c341b23ca8cd@intel.com>
 <CAK8P3a2LmUVj-yhwxXeCpqdxqJpp0m-q9q9SKQpfh3tFgMXPQA@mail.gmail.com>
From:   Dave Jiang <dave.jiang@intel.com>
Message-ID: <ea69a0f8-af48-45a3-7969-c38e0f785599@intel.com>
Date:   Mon, 6 Jul 2020 08:26:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2LmUVj-yhwxXeCpqdxqJpp0m-q9q9SKQpfh3tFgMXPQA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/6/2020 8:24 AM, Arnd Bergmann wrote:
> On Mon, Jul 6, 2020 at 5:01 PM Dave Jiang <dave.jiang@intel.com> wrote:
>> On 7/6/2020 5:53 AM, Arnd Bergmann wrote:
>>> On Mon, Jul 6, 2020 at 1:03 PM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>
>> Arnd,
>> I'm looking at the pl001_dma_probe(), I think we could make it more robust if it
>> uses IS_ERR_OR_NULL(chan) instead of IS_ERR(). Should I send a patch for it? I
>> suppose looking at the comment header for dma_request_chan() it does say return
>> chan ptr or error ptr. Sorry I missed that.
> 
> No. IS_ERR_OR_NULL() is almost always a mistake. A function should either
> return NULL on error, or it should return an error code, but should not be
> able to return either.

Fair enough.

> 
> Have you checked all the other 'return NULL' statements in your patch to
> ensure that they never return error pointers?

Yeah I looked over the rest of them. The ones that are returning NULL as far as 
I can tell are expected to return NULL.

> 
>         Arnd
> 
