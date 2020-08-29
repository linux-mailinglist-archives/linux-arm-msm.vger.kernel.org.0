Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515E825639F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Aug 2020 02:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbgH2AM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 20:12:57 -0400
Received: from mga18.intel.com ([134.134.136.126]:24037 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726584AbgH2AM4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 20:12:56 -0400
IronPort-SDR: SlUZ12gOD/aVhSZ9C7qk9jQyBgNINfY/t+G1287Q5kZkl6/uIqYjnG+u+HmCtHBrJfbDAh32H1
 RsPfmveC3cqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="144440466"
X-IronPort-AV: E=Sophos;i="5.76,365,1592895600"; 
   d="scan'208";a="144440466"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2020 17:11:54 -0700
IronPort-SDR: h4/orcg6Gn8nZ9ohrRYk+lZSm+43zkLVdgDI4N9Y2stHaHJZBEYbeRpB1m00xdjqKyRt5YQyWb
 VxfQI2pIm4Eg==
X-IronPort-AV: E=Sophos;i="5.76,365,1592895600"; 
   d="scan'208";a="340050304"
Received: from fvera1-mobl.amr.corp.intel.com (HELO [10.212.55.68]) ([10.212.55.68])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2020 17:11:52 -0700
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v6 2/2] ASoC: qcom: sc7180: Add machine driver for sound
 card registration
To:     Doug Anderson <dianders@chromium.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>
Cc:     Taniya Das <tdas@codeaurora.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Takashi Iwai <tiwai@suse.com>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        Tzung-Bi Shih <tzungbi@google.com>,
        Andy Gross <agross@kernel.org>,
        Dylan Reid <dgreid@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, tzungbi@chromium.org,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
References: <20200826110454.1811352-1-cychiang@chromium.org>
 <20200826110454.1811352-3-cychiang@chromium.org>
 <CAD=FV=XaCt6V+VXfk8T+2mS4d5sKQzMC12AcH9a=MNkgguvmjQ@mail.gmail.com>
Message-ID: <7b3bb666-c53e-e385-e153-1383f2831c2e@linux.intel.com>
Date:   Fri, 28 Aug 2020 19:11:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XaCt6V+VXfk8T+2mS4d5sKQzMC12AcH9a=MNkgguvmjQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


>> +config SND_SOC_SC7180
>> +       tristate "SoC Machine driver for SC7180 boards"
>> +       depends on SND_SOC_QCOM

this depends is probably not necessary, the code is already in an if case.

>> +       select SND_SOC_QCOM_COMMON
>> +       select SND_SOC_LPASS_SC7180
>> +       select SND_SOC_MAX98357A
>> +       select SND_SOC_RT5682
> 
> I haven't done any significant testing / review of your patch (I'm
> mostly sound-clueless), but I believe that the above needs to be
> "select SND_SOC_RT5682_I2C" atop the current top of the sound tree.
> When I fix that I can confirm that I see the rt5682 probe on
> sc7180-trogdor with Rob Clark's dts patch.

Ack, no one should select SND_SOC_RT5682 directly in machine drivers. 
now that the code is split between I2C and SoundWire parts.

There should probably be a depends on I2C as well?
