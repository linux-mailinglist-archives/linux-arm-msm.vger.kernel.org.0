Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99D5521BBDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 19:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgGJRI1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 13:08:27 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:37443 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727078AbgGJRI1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 13:08:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594400905; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FwNg3e/t161QXeNlfj8RjjHMHRPeaUVntsu2CE4ozZ0=;
 b=IRLYP5qzdW9scdKqRzdq+ICackT6zcpSa0up9UQHIDjquJ/qc1OKebCYWmplOQlnoWFnY7Ov
 zxvOfNi2A1GWmDTJ54ozT5ROoIWewPSIX4qiT82/bjGkvZHWeE2hCiltRXwVwuSpMZWbiS2G
 CoeogyrwaKVzfsgV41cT0eFw8rc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n20.prod.us-east-1.postgun.com with SMTP id
 5f08a06e427cd55766585113 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Jul 2020 17:07:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BCC8BC433C6; Fri, 10 Jul 2020 17:07:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 68BE5C433C6;
        Fri, 10 Jul 2020 17:07:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 10 Jul 2020 10:07:56 -0700
From:   tanmay@codeaurora.org
To:     Rob Herring <robh@kernel.org>
Cc:     swboyd@chromium.org, sam@ravnborg.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        seanpaul@chromium.org, robdclark@gmail.com, daniel@ffwll.ch,
        airlied@linux.ie, aravindh@codeaurora.org, abhinavk@codeaurora.org,
        chandanu@codeaurora.org, varar@codeaurora.org
Subject: Re: [PATCH v8 0/6] Add support for DisplayPort driver on SnapDragon
In-Reply-To: <20200709202110.GA814782@bogus>
References: <20200630184507.15589-1-tanmay@codeaurora.org>
 <20200709202110.GA814782@bogus>
Message-ID: <2e867e903db9be91a988a37b7508abd0@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for reviews Rob.

On 2020-07-09 13:21, Rob Herring wrote:
> On Tue, Jun 30, 2020 at 11:45:01AM -0700, Tanmay Shah wrote:
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
>> Changes in v7:
>> 
>> - Modify cover letter description and fix title.
>> - Introduce dp-controller.yaml for common bindings across SOC
>> - Rename dp-sc7180.yaml to dp-controller-sc7180.yaml for SC7180 
>> bindings
>> - Rename compatible string to qcom,sc7180-dp
>> - Add assigned-clocks and assigned-clock-parents properties in 
>> bindings
>> - Remove redundant code from driver
>> - Extend series to include HPD detection logic
>> 
>> Changes in v8:
>> 
>> - Add MDSS AHB clock in bindings
>> - Replace mode->vrefresh use with drm_mode_vrefresh API
>> - Remove redundant aux config code from parser and aux module
>> - Assign default max lanes if data-lanes property is not available
>> - Fix use-after-free during DP driver remove
>> - Unregister hardware clocks during driver cleanup
>> 
>> This series depends-on:
>> 	https://patchwork.freedesktop.org/patch/366159/
> 
> If a single patch is a dependency, please coordinate your work and send
> as 1 series.
> 
> To put it another way, I'm just going to ignore this series until the
> dependency is sorted out.
Sure I will wait till previous patch is resolved.
> 
>> 	https://patchwork.freedesktop.org/patch/369859/
> 
> Probably the same goes for this too, but I care less as it's not the
> binding...
Above patch is not compile time dependency, but without it we see issues 
during runtime.
So will be removed from dependency list.
Thanks.
> 
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
>>  .../display/msm/dp-controller-sc7180.yaml     |  144 ++
>>  .../bindings/display/msm/dp-controller.yaml   |   61 +
>>  .../bindings/display/msm/dpu-sc7180.yaml      |   11 +
>>  drivers/gpu/drm/i915/display/intel_display.c  |    2 +-
>>  drivers/gpu/drm/msm/Kconfig                   |   16 +
>>  drivers/gpu/drm/msm/Makefile                  |   14 +
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   29 +-
>>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |    8 +
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   83 +-
>>  drivers/gpu/drm/msm/dp/dp_aux.c               |  510 +++++
>>  drivers/gpu/drm/msm/dp/dp_aux.h               |   29 +
>>  drivers/gpu/drm/msm/dp/dp_catalog.c           | 1060 ++++++++++
>>  drivers/gpu/drm/msm/dp/dp_catalog.h           |  104 +
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c              | 1707 
>> +++++++++++++++++
>>  drivers/gpu/drm/msm/dp/dp_ctrl.h              |   35 +
>>  drivers/gpu/drm/msm/dp/dp_display.c           | 1017 ++++++++++
>>  drivers/gpu/drm/msm/dp/dp_display.h           |   31 +
>>  drivers/gpu/drm/msm/dp/dp_drm.c               |  168 ++
>>  drivers/gpu/drm/msm/dp/dp_drm.h               |   18 +
>>  drivers/gpu/drm/msm/dp/dp_hpd.c               |   69 +
>>  drivers/gpu/drm/msm/dp/dp_hpd.h               |   79 +
>>  drivers/gpu/drm/msm/dp/dp_link.c              | 1216 ++++++++++++
>>  drivers/gpu/drm/msm/dp/dp_link.h              |  132 ++
>>  drivers/gpu/drm/msm/dp/dp_panel.c             |  490 +++++
>>  drivers/gpu/drm/msm/dp/dp_panel.h             |   95 +
>>  drivers/gpu/drm/msm/dp/dp_parser.c            |  267 +++
>>  drivers/gpu/drm/msm/dp/dp_parser.h            |  138 ++
>>  drivers/gpu/drm/msm/dp/dp_pll.c               |   99 +
>>  drivers/gpu/drm/msm/dp/dp_pll.h               |   61 +
>>  drivers/gpu/drm/msm/dp/dp_pll_10nm.c          |  917 +++++++++
>>  drivers/gpu/drm/msm/dp/dp_pll_private.h       |  111 ++
>>  drivers/gpu/drm/msm/dp/dp_power.c             |  392 ++++
>>  drivers/gpu/drm/msm/dp/dp_power.h             |  103 +
>>  drivers/gpu/drm/msm/dp/dp_reg.h               |  517 +++++
>>  drivers/gpu/drm/msm/msm_drv.c                 |    2 +
>>  drivers/gpu/drm/msm/msm_drv.h                 |   59 +-
>>  include/drm/drm_dp_helper.h                   |    1 +
>>  37 files changed, 9776 insertions(+), 19 deletions(-)
>>  create mode 100644
> Documentation/devicetree/bindings/display/msm/dp-controller-sc7180.yaml
>>  create mode 100644
> Documentation/devicetree/bindings/display/msm/dp-controller.yaml
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
>> base-commit: 0a19b068acc47d05212f03e494381926dc0381e2
>> prerequisite-patch-id: 8058026a54241aa728a91dd1685419afb249959e
>> prerequisite-patch-id: ed730eb83f84501579332a0f0ab98f7ef649e868
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> Forum,
>> a Linux Foundation Collaborative Project
>> 
