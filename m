Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E402E267C9B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Sep 2020 23:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgILV5M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Sep 2020 17:57:12 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:28147 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725893AbgILV5L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Sep 2020 17:57:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599947830; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TZ33EHR4272clrUcslEj15kwdb8DH6WPAy+4HHTw1qU=;
 b=J/fLp0FLv3W6aSf0TsIh55gk9cAnEXU7rxAhC1H/tZ3Kc7i6pr5WQ2sQtth+Arzjw31Nu81j
 PpV8yjLooPhGaEYDCl8F8d+WlCGhVglF6ZXI39KpQonupTIzElAxppaSx7lVscjFMd8mkfjI
 BwCrwLEtPM1kXmGsZZLHkX4H8QQ=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f5d443554e87432bea779b7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 12 Sep 2020 21:57:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C7408C433FF; Sat, 12 Sep 2020 21:57:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 83666C433C6;
        Sat, 12 Sep 2020 21:57:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 12 Sep 2020 14:57:07 -0700
From:   abhinavk@codeaurora.org
To:     Rob Clark <robdclark@gmail.com>
Cc:     Tanmay Shah <tanmay@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, aravindh@codeaurora.org,
        khsieh@codeaurora.org
Subject: Re: [PATCH v12 0/5] Add support for DisplayPort driver on SnapDragon
In-Reply-To: <CAF6AEGttutrtxntAeRDtb3Hf_0i4z+9+rWMuShTrPVwTUHKTdg@mail.gmail.com>
References: <20200827211658.27479-1-tanmay@codeaurora.org>
 <CAF6AEGttutrtxntAeRDtb3Hf_0i4z+9+rWMuShTrPVwTUHKTdg@mail.gmail.com>
Message-ID: <1943d0d636cd20c1088b30d6b1fb4866@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Rob for pushing the changes. I confirm that the versions which 
you have pushed are the latest ones.

I have rebased audio changes on top of the latest DP changes
and posted them here https://patchwork.freedesktop.org/series/81612/.
The other DP change which is missing is the video pattern CTS change 
https://patchwork.freedesktop.org/series/81614/ which
also I have now rebased on top of the latest DP patch series and posted.

Thanks

Abhinav
On 2020-09-12 11:25, Rob Clark wrote:
> Fyi, I've pushed this series and the dp-compliance bits to 
> msm-next-dp[1]
> 
> I didn't include the dp audio series yet, which seems to need some
> minor rebasing.  (And a small request, when resending, cc
> freedreno@lists.freedesktop.org, so it shows up in the patchwork
> instance[2] I use)
> 
> You might want to double check that I got the correct versions of the
> series, etc.  And that nothing else (other than audio) is missing.
> 
> BR,
> -R
> 
> [1] https://gitlab.freedesktop.org/drm/msm/-/commits/msm-next-dp
> [2] https://patchwork.freedesktop.org/project/freedreno
> 
> On Thu, Aug 27, 2020 at 2:17 PM Tanmay Shah <tanmay@codeaurora.org> 
> wrote:
>> 
>> These patches add Display-Port driver on SnapDragon/msm hardware.
>> This series also contains device-tree bindings for msm DP driver.
>> It also contains Makefile and Kconfig changes to compile msm DP 
>> driver.
>> 
>> The block diagram of DP driver is shown below:
>> 
>> 
>>                  +-------------+
>>                  |DRM FRAMEWORK|
>>                  +------+------+
>>                         |
>>                    +----v----+
>>                    | DP DRM  |
>>                    +----+----+
>>                         |
>>                    +----v----+
>>      +------------+|   DP    +----------++------+
>>      +        +---+| DISPLAY |+---+      |      |
>>      |        +    +-+-----+-+    |      |      |
>>      |        |      |     |      |      |      |
>>      |        |      |     |      |      |      |
>>      |        |      |     |      |      |      |
>>      v        v      v     v      v      v      v
>>  +------+ +------+ +---+ +----+ +----+ +---+ +-----+
>>  |  DP  | |  DP  | |DP | | DP | | DP | |DP | | DP  |
>>  |PARSER| | HPD  | |AUX| |LINK| |CTRL| |PHY| |POWER|
>>  +--+---+ +---+--+ +---+ +----+ +--+-+ +-+-+ +-----+
>>     |                              |     |
>>  +--v---+                         +v-----v+
>>  |DEVICE|                         |  DP   |
>>  | TREE |                         |CATALOG|
>>  +------+                         +---+---+
>>                                       |
>>                                   +---v----+
>>                                   |CTRL/PHY|
>>                                   |   HW   |
>>                                   +--------+
>> 
>> Changes in v12:
>> 
>> -- Add support of pm ops in display port driver
>> -- Clear bpp depth bits before writing to MISC register
>> -- Fix edid read
>> 
>> Previous change log:
>> https://lkml.kernel.org/lkml/20200818051137.21478-1-tanmay@codeaurora.org/
>> 
>> Chandan Uddaraju (4):
>>   dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
>>   drm: add constant N value in helper file
>>   drm/msm/dp: add displayPort driver support
>>   drm/msm/dp: add support for DP PLL driver
>> 
>> Jeykumar Sankaran (1):
>>   drm/msm/dpu: add display port support in DPU
>> 
>> Tanmay Shah (1):
>>   drm/msm/dp: Add Display Port HPD feature
>> 
>>  drivers/gpu/drm/i915/display/intel_display.c  |    2 +-
>>  drivers/gpu/drm/msm/Kconfig                   |    9 +
>>  drivers/gpu/drm/msm/Makefile                  |   14 +
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   27 +-
>>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |    8 +
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   83 +-
>>  drivers/gpu/drm/msm/dp/dp_aux.c               |  535 ++++++
>>  drivers/gpu/drm/msm/dp/dp_aux.h               |   30 +
>>  drivers/gpu/drm/msm/dp/dp_catalog.c           | 1045 ++++++++++
>>  drivers/gpu/drm/msm/dp/dp_catalog.h           |  105 +
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c              | 1693 
>> +++++++++++++++++
>>  drivers/gpu/drm/msm/dp/dp_ctrl.h              |   35 +
>>  drivers/gpu/drm/msm/dp/dp_display.c           | 1046 ++++++++++
>>  drivers/gpu/drm/msm/dp/dp_display.h           |   31 +
>>  drivers/gpu/drm/msm/dp/dp_drm.c               |  168 ++
>>  drivers/gpu/drm/msm/dp/dp_drm.h               |   18 +
>>  drivers/gpu/drm/msm/dp/dp_hpd.c               |   69 +
>>  drivers/gpu/drm/msm/dp/dp_hpd.h               |   79 +
>>  drivers/gpu/drm/msm/dp/dp_link.c              | 1214 ++++++++++++
>>  drivers/gpu/drm/msm/dp/dp_link.h              |  132 ++
>>  drivers/gpu/drm/msm/dp/dp_panel.c             |  486 +++++
>>  drivers/gpu/drm/msm/dp/dp_panel.h             |   95 +
>>  drivers/gpu/drm/msm/dp/dp_parser.c            |  267 +++
>>  drivers/gpu/drm/msm/dp/dp_parser.h            |  138 ++
>>  drivers/gpu/drm/msm/dp/dp_pll.c               |   99 +
>>  drivers/gpu/drm/msm/dp/dp_pll.h               |   61 +
>>  drivers/gpu/drm/msm/dp/dp_pll_10nm.c          |  930 +++++++++
>>  drivers/gpu/drm/msm/dp/dp_pll_private.h       |   89 +
>>  drivers/gpu/drm/msm/dp/dp_power.c             |  373 ++++
>>  drivers/gpu/drm/msm/dp/dp_power.h             |  103 +
>>  drivers/gpu/drm/msm/dp/dp_reg.h               |  518 +++++
>>  drivers/gpu/drm/msm/msm_drv.c                 |    2 +
>>  drivers/gpu/drm/msm/msm_drv.h                 |   59 +-
>>  include/drm/drm_dp_helper.h                   |    1 +
>>  34 files changed, 9545 insertions(+), 19 deletions(-)
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_display.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_display.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_link.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_link.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_pll.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_pll.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_pll_10nm.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_pll_private.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_power.c
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_power.h
>>  create mode 100644 drivers/gpu/drm/msm/dp/dp_reg.h
>> 
>> 
>> base-commit: d012a7190fc1fd72ed48911e77ca97ba4521bccd
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
