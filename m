Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B523A85E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 18:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbhFOQCj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 12:02:39 -0400
Received: from mga14.intel.com ([192.55.52.115]:40062 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231971AbhFOQC3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 12:02:29 -0400
IronPort-SDR: 9qtBS4XVWneRtHMPoVPg4kP1W5XRznlzKHznjKAw0Ud6P+oBKt1Bh5CwKWlaICCroD/v6Mf81s
 WgKxX6q3vOrA==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="205836964"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; 
   d="scan'208";a="205836964"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2021 09:00:13 -0700
IronPort-SDR: VuzC0kwC5Gd7fL4dcEBxLlwVKjbOSfVaWfYUJJcNryXABhVaEK7CES8NVtdky/X2ZqPP4QFqfA
 bw9EeubIQywg==
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; 
   d="scan'208";a="487823401"
Received: from bgeagarc-mobl1.amr.corp.intel.com (HELO [10.209.128.67]) ([10.209.128.67])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2021 09:00:11 -0700
Subject: Re: [PATCH] ASoC: max98357a: set channels_max to 4
To:     Cheng-yi Chiang <cychiang@chromium.org>,
        Tzung-Bi Shih <tzungbi@google.com>
Cc:     Taniya Das <tdas@codeaurora.org>,
        ALSA development <alsa-devel@alsa-project.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Takashi Iwai <tiwai@suse.com>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Dylan Reid <dgreid@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        Douglas Anderson <dianders@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
References: <20210526154704.114957-1-judyhsiao@chromium.org>
 <CA+Px+wXGjZCOhhAVh9eRw6L-g8g7Qi7Rf_3YHpHSCB2o=XQ+4g@mail.gmail.com>
 <CAFv8NwKkfGnpw_5PBwJSjVXsuw3L8=1RyEJ4PWdRX5-J75bk6A@mail.gmail.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3501e398-dfba-43b1-4638-325a158e860d@linux.intel.com>
Date:   Tue, 15 Jun 2021 11:00:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFv8NwKkfGnpw_5PBwJSjVXsuw3L8=1RyEJ4PWdRX5-J75bk6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/15/21 10:47 AM, Cheng-yi Chiang wrote:
> Hi Tzung-Bi,
> 
> On a platform, the four max98357a amps will be controlled by only one
> codec device, as GPIO for SD_MODE is shared by all amps and is the
> only thing to be controlled.
> In this sense, I think we can treat max98357a DAI as if it supports
> four channels.
> I understand that this solution is not scalable, because one can
> control as many amps as they want.
> Theoretically, the number of supported channels by this codec device
> is unlimited.
> I found that rt1015.c has similar usage.
> Do you have a better suggestion to support this kind of use case ?
> Thanks!

please don't top-post...

I don't think it's correct to declare 4-channel support at the 
individual codec DAI level when in practice each device will be provided 
with a TDM mask that selects two slots.

This is confusing device capabilities and TDM link configuration.

> On Tue, Jun 1, 2021 at 2:20 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>>
>> On Wed, May 26, 2021 at 11:47 PM Judy Hsiao <judyhsiao@chromium.org> wrote:
>>> Sets channels_max to 4 to support QUAD channel.
>>
>> Could you point out probably the up-to-date MAX98357A datasheet for
>> 4-channel support?
>>
>> On a related note, from the public datasheet I could find[1], "Table
>> 5" only shows 2 channel's configuration.
>>
>> [1]: https://pdf1.alldatasheet.com/datasheet-pdf/view/623796/MAXIM/MAX98357A.html
