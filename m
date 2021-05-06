Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB01374F97
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 08:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232869AbhEFGsy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 02:48:54 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55473 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229929AbhEFGsy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 02:48:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620283676; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=09kcynuKC/GAxHLAWkYQzzxDXsnrgm3MhwhAfA6COPY=;
 b=uHmIlrS7az88bxId2D9SwG9DyUavwtfPCWwuAYucSBh92Nc7s1k8H2IkodpRNdaBg9/c+Ixx
 hJPv2Vt/MPFRwOKPCSfymkioBKys90KQHeHXj7DUUhlaNqjSc4pesiLJ0Rx/ic0T44oUQ7fJ
 Ho/J05Q29D75suJhGIAHhMyQiWo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6093911b8166b7eff7d69db7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 06:47:55
 GMT
Sender: sbillaka=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C0255C4360C; Thu,  6 May 2021 06:47:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sbillaka)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B038C433D3;
        Thu,  6 May 2021 06:47:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 06 May 2021 12:17:51 +0530
From:   sbillaka@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        khsieh@codeaurora.org, Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [PATCH v1 0/3] Add support for next gen eDP driver on SnapDragon
In-Reply-To: <CAA8EJpqZXHNvBySL0Vm-CmsrAh8Z85SoQHn97TqWLYeFW-Q=UA@mail.gmail.com>
References: <1620202579-19066-1-git-send-email-sbillaka@codeaurora.org>
 <CAA8EJpqZXHNvBySL0Vm-CmsrAh8Z85SoQHn97TqWLYeFW-Q=UA@mail.gmail.com>
Message-ID: <3398f9a1f985ccd6bb6a44646f7bea24@codeaurora.org>
X-Sender: sbillaka@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-05 15:31, Dmitry Baryshkov wrote:
> Hi,
> 
> On Wed, 5 May 2021 at 11:17, Sankeerth Billakanti
> <sbillaka@codeaurora.org> wrote:
>> 
>> These patches add support for the next generation eDP driver on 
>> SnapDragon
>> with dpu support. The existing eDP driver cannot support the new eDP
>> hardware. So, to maintain backward compatibility, the older eDP driver 
>> is
>> moved to v200 folder and the new generation eDP driver is added in
>> the v510 folder.
> 
> What exactly does this version correspond to?
> I assume that v510 corresponds to sdmshrike/sc8180x. Is it right?
[Sankeerth] This is for sc7280.

> Is it really so specific, or just v2/v5 would be enough? Not to
> mention that this is the MDP/ version, while other blocks tend to use
> block-specific versions/ids.
[Sankeerth] I can rename it as edp-v1 and edp-v2. Edp v1 is very old 
chip and there is considerable HW delta between v1 and v2. So, we want 
to separate the driver. We followed similar model for DPU driver where, 
MDP4, MDP5 and DPU have separate folders. EDP v1 belongs to MDP4 
generation.

> 
> Also, how much does it differ from the current DP core supported via
> drivers/gpu/drm/msm/dp ?
[Sankeerth] eDP is a native controller like DP but does not have audio, 
content protection and interoperability requirement. Upstream already 
supports eDP as a new interface driver found here: 
drivers/gpu/drm/msm/edp.
I wanted to add the new controller driver as part of that folder.

> 
> First two patches did not make it to the linux-msm, so I can not
> comment on each of the lines.
[Sankeerth] I am also not sure why they did not make it to patchwork. I 
will repost them.

> However just my few cents (other reviewers might disagree though):
> 
> - I see little benefit in renaming the folders just for the sake of
> renaming. You can put your code in drivers/gpu/drm/msm/edp-v510, if
> you really insist on that. Note that for all other (even incompatible)
> hardware types we still use single level of folders.
> 
> - Also I see that significant parts of code (e.g. AUX, bridge,
> connector, maybe more) are just c&p of old edp code pieces. Please
> share the code instead of duplicating it.
[Sankeerth] It is a baseline driver. As we add more features, it will 
considerably deviate a lot. The effort seems to be very high to maintain 
the common portion of code as I expect a lot of deviation.
> 
> - Please consider updating register definitions in xml form and then
> providing both changed xml files (to mesa project (?)) and generated
> headers into the kernel.
[Sankeerth] I followed what was done in the DP driver at 
/drivers/gpu/drm/msm/dp. I need to explore the xml approach to generate 
the register definitions.
> 
> - Please consider using clk_bulk_* functions instead of using
> dss_module_power. I'm going to send a patchset reworking current users
> to use the generic clk_bulk_* function family.
[Sankeerth] I will explore and rebase after your patch is available.
> 
> - In generic, this eDP clock handling seems to match closely DP clocks
> handling (with all the name comparison, etc). Consider moving this to
> a generic piece of code
> 
> - PHY seems to be a version of QMP PHY. Please use it, like it was
> done for the DP itself. There is support for combined USB+DP PHYs
> (both v3 and v4), so it should be possible to extend that for eDP.
[Sankeerth] The DP phy is a combophy which supports both usb and dp phy 
concurrently, unlike eDP phy which is specific to only the eDP 
controller in sc7280. So, I implemented the edp phy sequences in the 
same folder.
> 
> 
>> These are baseline changes with which we can enable display. The new 
>> eDP
>> controller can also support additional features such as backlight 
>> control,
>> PSR etc. which will be enabled in subsequent patch series.
>> 
>> Summary of changes:
>> DPU driver interface to the new eDP v510 display driver.
>> New generation eDP controller and phy driver implementation.
>> A common interface to choose enable the required eDP driver.
>> 
>> Sankeerth Billakanti (3):
>>   drm/msm/edp: support multiple generations of edp hardware
>>   drm/msm/edp: add support for next gen edp
>>   drm/msm/disp/dpu1: add support for edp encoder
>> 
>>  drivers/gpu/drm/msm/Makefile                      |   19 +-
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       |    7 +-
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |   33 +
>>  drivers/gpu/drm/msm/edp/edp.c                     |  198 ---
>>  drivers/gpu/drm/msm/edp/edp.h                     |   78 -
>>  drivers/gpu/drm/msm/edp/edp.xml.h                 |  380 -----
>>  drivers/gpu/drm/msm/edp/edp_aux.c                 |  264 ----
>>  drivers/gpu/drm/msm/edp/edp_bridge.c              |  111 --
>>  drivers/gpu/drm/msm/edp/edp_common.c              |   38 +
>>  drivers/gpu/drm/msm/edp/edp_common.h              |   47 +
>>  drivers/gpu/drm/msm/edp/edp_connector.c           |  132 --
>>  drivers/gpu/drm/msm/edp/edp_ctrl.c                | 1375 
>> ------------------
>>  drivers/gpu/drm/msm/edp/edp_phy.c                 |   98 --
>>  drivers/gpu/drm/msm/edp/v200/edp.xml.h            |  380 +++++
>>  drivers/gpu/drm/msm/edp/v200/edp_v200.c           |  210 +++
>>  drivers/gpu/drm/msm/edp/v200/edp_v200.h           |   70 +
>>  drivers/gpu/drm/msm/edp/v200/edp_v200_aux.c       |  264 ++++
>>  drivers/gpu/drm/msm/edp/v200/edp_v200_bridge.c    |  111 ++
>>  drivers/gpu/drm/msm/edp/v200/edp_v200_connector.c |  132 ++
>>  drivers/gpu/drm/msm/edp/v200/edp_v200_ctrl.c      | 1375 
>> ++++++++++++++++++
>>  drivers/gpu/drm/msm/edp/v200/edp_v200_phy.c       |   98 ++
>>  drivers/gpu/drm/msm/edp/v510/edp_v510.c           |  220 +++
>>  drivers/gpu/drm/msm/edp/v510/edp_v510.h           |  151 ++
>>  drivers/gpu/drm/msm/edp/v510/edp_v510_aux.c       |  268 ++++
>>  drivers/gpu/drm/msm/edp/v510/edp_v510_bridge.c    |  111 ++
>>  drivers/gpu/drm/msm/edp/v510/edp_v510_connector.c |  117 ++
>>  drivers/gpu/drm/msm/edp/v510/edp_v510_ctrl.c      | 1583 
>> +++++++++++++++++++++
>>  drivers/gpu/drm/msm/edp/v510/edp_v510_phy.c       |  641 +++++++++
>>  drivers/gpu/drm/msm/edp/v510/edp_v510_reg.h       |  339 +++++
>>  29 files changed, 6207 insertions(+), 2643 deletions(-)
>>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.c
>>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
>>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.xml.h
>>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_aux.c
>>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_bridge.c
>>  create mode 100644 drivers/gpu/drm/msm/edp/edp_common.c
>>  create mode 100644 drivers/gpu/drm/msm/edp/edp_common.h
>>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_connector.c
>>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
>>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_phy.c
>>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp.xml.h
>>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200.c
>>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200.h
>>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_aux.c
>>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_bridge.c
>>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_connector.c
>>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_ctrl.c
>>  create mode 100644 drivers/gpu/drm/msm/edp/v200/edp_v200_phy.c
>>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510.c
>>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510.h
>>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_aux.c
>>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_bridge.c
>>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_connector.c
>>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_ctrl.c
>>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_phy.c
>>  create mode 100644 drivers/gpu/drm/msm/edp/v510/edp_v510_reg.h
>> 
>> --
>> The Qualcomm Innovatin Center, Inc. is a member of the Code Aurora 
>> Forum, a Linux Foundation Collaborative Project
>> 
> 
> 
> --
> With best wishes
> Dmitry
