Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FCFA3AA406
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 21:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232329AbhFPTN0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 15:13:26 -0400
Received: from mga03.intel.com ([134.134.136.65]:39857 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232530AbhFPTNY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 15:13:24 -0400
IronPort-SDR: xA/GS1uI8oTlRt0ZkDutN8YFPoCK+WzLIBTHet2pesEgUmrmRH2+jgutMi032ZH2ja7vNe6ACo
 B2NV2EWfM1Pw==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="206278121"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; 
   d="scan'208";a="206278121"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2021 12:11:16 -0700
IronPort-SDR: n6zRFDrwjIzQ47702ClxTmPuOe3ZO+JXUoWxQtosamnGyR9/uvZ608qFuQhnMUaTWvtcZYsAfp
 Ft5a6WSHOxlg==
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; 
   d="scan'208";a="640104279"
Received: from mindylam-mobl1.amr.corp.intel.com (HELO [10.213.182.47]) ([10.213.182.47])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2021 12:11:14 -0700
Subject: Re: [PATCH] ASoC: max98357a: set channels_max to 4
To:     Cheng-yi Chiang <cychiang@chromium.org>
Cc:     Taniya Das <tdas@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ALSA development <alsa-devel@alsa-project.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Patrick Lai <plai@codeaurora.org>,
        Takashi Iwai <tiwai@suse.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Tzung-Bi Shih <tzungbi@google.com>,
        Andy Gross <agross@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Mark Brown <broonie@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>
References: <20210526154704.114957-1-judyhsiao@chromium.org>
 <CA+Px+wXGjZCOhhAVh9eRw6L-g8g7Qi7Rf_3YHpHSCB2o=XQ+4g@mail.gmail.com>
 <CAFv8NwKkfGnpw_5PBwJSjVXsuw3L8=1RyEJ4PWdRX5-J75bk6A@mail.gmail.com>
 <3501e398-dfba-43b1-4638-325a158e860d@linux.intel.com>
 <CAFv8Nw+FNfmgwadeFMWjRiGbKFuO4JJ=9ggRHxG+Pq_OuHdmeA@mail.gmail.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7748e621-ba54-db90-6b56-23e006eb1dbe@linux.intel.com>
Date:   Wed, 16 Jun 2021 11:23:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFv8Nw+FNfmgwadeFMWjRiGbKFuO4JJ=9ggRHxG+Pq_OuHdmeA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


>> I don't think it's correct to declare 4-channel support at the
>> individual codec DAI level when in practice each device will be provided
>> with a TDM mask that selects two slots.
> 
> On this platform there is no TDM support, so there were two I2S data lines.
> 
>>
>> This is confusing device capabilities and TDM link configuration.
> 
> I see that in most of the use cases of multiple amps, we should use
> codecs and num_codecs of the link.
> But in this case we only want one codec to control the only GPIO
> shared by 4 max98357a amps
> I think we should be able to use 1 max98357 codec and 3 dummy codec to
> fulfill this use case.
> Not sure if the number of dummy codec would really matter.
> With num_codec > 1 we should be able to bypass the channel checking
> and just use the channel from CPU DAI.

Interesting, I haven't seen such 'multi-lane' solutions so far for I2S.

