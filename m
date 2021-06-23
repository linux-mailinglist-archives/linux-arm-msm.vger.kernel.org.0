Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 268A63B13CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jun 2021 08:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhFWGSF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Jun 2021 02:18:05 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:48904 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229801AbhFWGSD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Jun 2021 02:18:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624428946; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=YgXZ6VNhDITS6yDaGx56LtlJqbhq7xTELt1tz8y6TYM=;
 b=L8uDHvsVTSBBO5yxeEk2FcNdxCQlLcuHSd3uMhIj2Y2xiLXMtfTpCm6NG8skjaO1NO2QHJfh
 Usq7EyZZjqQAqW7vlhjNSAlrgmRvuwho/ixnxQDz+64ctRYnAYKx6tlF9VG1xRiKtNEM84px
 BUj0+0w2DphVh8qSX3EGtEN27Xo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60d2d17f638039e997219932 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Jun 2021 06:15:27
 GMT
Sender: rajeevny=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AD7C9C433F1; Wed, 23 Jun 2021 06:15:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajeevny)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 93D9CC433D3;
        Wed, 23 Jun 2021 06:15:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 23 Jun 2021 11:45:24 +0530
From:   rajeevny@codeaurora.org
To:     Doug Anderson <dianders@chromium.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Lyude Paul <lyude@redhat.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org
Subject: Re: [v7 1/5] drm/panel: add basic DP AUX backlight support
In-Reply-To: <CAD=FV=WJiA+RxaQA9xt7Tik_2pCEJo0+6b39Di8cfnSWGuKkJQ@mail.gmail.com>
References: <1624099230-20899-1-git-send-email-rajeevny@codeaurora.org>
 <1624099230-20899-2-git-send-email-rajeevny@codeaurora.org>
 <20210620093141.GA703072@ravnborg.org>
 <ebf5581759daee9596c2f092ca836ecb@codeaurora.org>
 <20210621183828.GA918146@ravnborg.org>
 <CAD=FV=WJiA+RxaQA9xt7Tik_2pCEJo0+6b39Di8cfnSWGuKkJQ@mail.gmail.com>
Message-ID: <c15947bb1566f176a2f534c52a7c3183@codeaurora.org>
X-Sender: rajeevny@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 23-06-2021 00:03, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jun 21, 2021 at 11:38 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>> 
>> > > I cannot see why you need the extra check on ->enabled?
>> > > Would it be sufficient to check backlight_is_blank() only?
>> >
>> > This extra check on bl->enabled flag is added to avoid enabling/disabling
>> > backlight again if it is already enabled/disabled.
>> > Using this flag way can know the transition between backlight blank and
>> > un-blank, and decide when to enable/disable the backlight.
>> 
>> My point is that this should really not be needed, as it would cover 
>> up
>> for some other bug whaere we try to do something twice that is not
>> needed. But I am less certain here so if you think it is needed, keep
>> it as is.
> 
> I haven't tested this myself, but I believe that it is needed. I don't
> think the backlight update_status() function is like an enable/disable
> function. I believe it can be called more than one time even while the
> backlight is disabled. For instance, you can see that
> backlight_update_status() just blindly calls through to update the
> status. That function can be called for a number of reasons. Perhaps
> Rajeev can put some printouts to confirm but I think that if the
> backlight is "blanked" for whatever reason and you write to sysfs and
> change the backlight level you'll still get called again even though
> the backlight is still "disabled".
> 
Yes, sysfs write will always try to update the backlight even though the 
backlight is "blanked".

The "bl->enabled" check is also required to prevent unnecessary calls to 
drm_edp_backlight_enable() during every backlight level change.

To confirm this, I have added few prints in 
dp_aux_backlight_update_status() function and collected the logs.
(Copying the code here to make the review easy)


static int dp_aux_backlight_update_status(struct backlight_device *bd)
{
         struct dp_aux_backlight *bl = bl_get_data(bd);
         u16 brightness = backlight_get_brightness(bd);
         int ret = 0;

+        pr_err("%s: brightness %d, _is_blank %d, bl->enabled %d\n", 
__func__,
+                brightness, backlight_is_blank(bd), bl->enabled);

         if (!backlight_is_blank(bd)) {
                 if (!bl->enabled) {
+                        pr_err("%s: enabling backlight\n", __func__);
                         drm_edp_backlight_enable(bl->aux, &bl->info, 
brightness);
                         bl->enabled = true;
                         return 0;
                 }
                 ret = drm_edp_backlight_set_level(bl->aux, &bl->info, 
brightness);
         } else {
                 if (bl->enabled) {
+                       pr_err("%s: disabling backlight\n", __func__);
                         drm_edp_backlight_disable(bl->aux, &bl->info);
                         bl->enabled = false;
                 }
         }

         return ret;
}


LOGS
====

During boot
-----------
[    4.752188] dp_aux_backlight_update_status: brightness 102, _is_blank 
0, bl->enabled 0
[    4.760447] dp_aux_backlight_update_status: enabling backlight
[    5.503866] dp_aux_backlight_update_status: brightness 102, _is_blank 
0, bl->enabled 1
[    6.897355] dp_aux_backlight_update_status: brightness 103, _is_blank 
0, bl->enabled 1
[    6.938617] dp_aux_backlight_update_status: brightness 104, _is_blank 
0, bl->enabled 1
[    6.980634] dp_aux_backlight_update_status: brightness 105, _is_blank 
0, bl->enabled 1


Turning Panel OFF
-----------------
localhost ~ # set_power_policy --ac_screen_dim_delay=5 
--ac_screen_off_delay=10
localhost ~ #

[  106.555140] dp_aux_backlight_update_status: brightness 145, _is_blank 
0, bl->enabled 1
...
...
[  111.679407] dp_aux_backlight_update_status: brightness 7, _is_blank 
0, bl->enabled 1
[  111.700302] dp_aux_backlight_update_status: brightness 4, _is_blank 
0, bl->enabled 1
[  111.720805] dp_aux_backlight_update_status: brightness 2, _is_blank 
0, bl->enabled 1
[  111.747486] dp_aux_backlight_update_status: brightness 0, _is_blank 
1, bl->enabled 1
[  111.755580] dp_aux_backlight_update_status: disabling backlight
[  111.792344] dp_aux_backlight_update_status: brightness 0, _is_blank 
1, bl->enabled 0


Changing brightness from sysfs while panel is off
--------------------------------------------------
(it will do nothing)

localhost ~ # echo 100 > 
/sys/class/backlight/dp_aux_backlight/brightness
[  352.754963] dp_aux_backlight_update_status: brightness 0, _is_blank 
1, bl->enabled 0

localhost ~ # echo 200 > 
/sys/class/backlight/dp_aux_backlight/brightness
[  364.708048] dp_aux_backlight_update_status: brightness 0, _is_blank 
1, bl->enabled 0

localhost ~ # echo 0 > /sys/class/backlight/dp_aux_backlight/brightness
[  378.850978] dp_aux_backlight_update_status: brightness 0, _is_blank 
1, bl->enabled 0


Turning Panel ON
----------------
[  553.381745] dp_aux_backlight_update_status: brightness 0, _is_blank 
0, bl->enabled 0
[  553.418133] dp_aux_backlight_update_status: enabling backlight
[  553.426397] dp_aux_backlight_update_status: brightness 159, _is_blank 
0, bl->enabled 1

====



Thanks,
Rajeev

