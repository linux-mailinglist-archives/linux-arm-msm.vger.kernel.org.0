Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F27943BA1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 21:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238475AbhJZTEZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 15:04:25 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:36328 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238472AbhJZTEY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 15:04:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635274920; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=vjlF/u+Qo1jfb6RLOi04YwLQEuDdY/3zfoWoV1ZisBk=;
 b=mgYxWCF8KOCmCIRGRbx9UJMRC7MtEm5JQ7tXflek3t/kH4kdRNXZRBz65yZ8oMhqZFRXRW2T
 qKLAofWb7T9dRlfM/wIcEyED566pfU6sz7EEW65iDh1a9FKTgFC32hVSM9s3ALDN1HSZVFpC
 PD8AdBbN35zpW6pddwCGoqVawuU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 617850a3fd91319f0f557a15 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Oct 2021 19:01:55
 GMT
Sender: sbillaka=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2456BC4360D; Tue, 26 Oct 2021 19:01:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sbillaka)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2A846C4360D;
        Tue, 26 Oct 2021 19:01:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 27 Oct 2021 00:31:54 +0530
From:   sbillaka@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org,
        kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
        dianders@chromium.org, khsieh@codeaurora.org,
        mkrishn@codeaurora.org
Subject: Re: [PATCH v2 1/2] drm/msm/dp: Add support for SC7280 eDP
In-Reply-To: <CAE-0n52SjFOWNNFAciOOpKRSnPLqq3zs+qib9jukPkxf0frQTQ@mail.gmail.com>
References: <1634732051-31282-1-git-send-email-quic_sbillaka@quicinc.com>
 <1634732051-31282-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n52SjFOWNNFAciOOpKRSnPLqq3zs+qib9jukPkxf0frQTQ@mail.gmail.com>
Message-ID: <fc847e128d7d95991bc275bd79763440@codeaurora.org>
X-Sender: sbillaka@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On 2021-10-21 23:32, Stephen Boyd wrote:
> Quoting Sankeerth Billakanti (2021-10-20 05:14:10)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 62e75dc..9fea49c 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1238,9 +1240,21 @@ static int dp_ctrl_link_train(struct 
>> dp_ctrl_private *ctrl,
>>         link_info.capabilities = DP_LINK_CAP_ENHANCED_FRAMING;
>> 
>>         dp_aux_link_configure(ctrl->aux, &link_info);
>> +
>> +       if (dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5) {
> 
> Please add a static inline macro in include/drm/drm_dp_helper.h that
> makes this more readable. Something similar to drm_dp_is_branch() but
> with a human readable replacement for "is_branch". Maybe drm_dp_ssc()?
> 
Okay, I will add a macro, drm_dp_max_downspread (to be consistent with 
the spec and other macros in the file) in drm_dp_helper.h file.

>> +               ssc = DP_SPREAD_AMP_0_5;
>> +               drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, &ssc, 
>> 1);
>> +       }
>> +
>>         drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
>>                                 &encoding, 1);
>> 
>> +       if (dpcd[DP_EDP_CONFIGURATION_CAP] & 
>> DP_ALTERNATE_SCRAMBLER_RESET_CAP) {
> 
> And this one already has a helper,
> drm_dp_alternate_scrambler_reset_cap().
> 
Okay, I will use that.

>> +               assr = DP_ALTERNATE_SCRAMBLER_RESET_ENABLE;
>> +               drm_dp_dpcd_write(ctrl->aux, DP_EDP_CONFIGURATION_SET,
>> +                               &assr, 1);
>> +       }
>> +
>>         ret = dp_ctrl_link_train_1(ctrl, training_step);
>>         if (ret) {
>>                 DRM_ERROR("link training #1 failed. ret=%d\n", ret);
>> @@ -1312,9 +1326,11 @@ static int 
>> dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
>>         struct dp_io *dp_io = &ctrl->parser->io;
>>         struct phy *phy = dp_io->phy;
>>         struct phy_configure_opts_dp *opts_dp = &dp_io->phy_opts.dp;
>> +       const u8 *dpcd = ctrl->panel->dpcd;
>> 
>>         opts_dp->lanes = ctrl->link->link_params.num_lanes;
>>         opts_dp->link_rate = ctrl->link->link_params.rate / 100;
>> +       opts_dp->ssc = dpcd[DP_MAX_DOWNSPREAD] & 
>> DP_MAX_DOWNSPREAD_0_5;
>>         dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
>>                                         ctrl->link->link_params.rate * 
>> 1000);
>> 
>> @@ -1406,7 +1422,7 @@ void dp_ctrl_host_deinit(struct dp_ctrl 
>> *dp_ctrl)
>> 
>>  static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
>>  {
>> -       u8 *dpcd = ctrl->panel->dpcd;
>> +       const u8 *dpcd = ctrl->panel->dpcd;
>> 
>>         /*
>>          * For better interop experience, used a fixed NVID=0x8000
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index c867745..c16311b 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -144,8 +144,16 @@ static const struct msm_dp_config sc8180x_dp_cfg 
>> = {
>>         .num_descs = 3,
>>  };
>> 
>> +static const struct msm_dp_config sc7280_dp_cfg = {
>> +       .descs = (struct msm_dp_desc[]) {
> 
> const
> 
Will add it.

>> +               { .io_start = 0x0aea0000, .connector_type = 
>> DRM_MODE_CONNECTOR_eDP },
>> +       },
>> +       .num_descs = 1,
>> +};
>> +
>>  static const struct of_device_id dp_dt_match[] = {
>>         { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
>> +       { .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
>>         { .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
>>         { .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_cfg },
>>         {}
>> @@ -1440,7 +1448,7 @@ void msm_dp_irq_postinstall(struct msm_dp 
>> *dp_display)
>> 
>>         dp_hpd_event_setup(dp);
>> 
>> -       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
>> +       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1);
> 
> This has no explanation. What is it?
Will add explanation for it as a comment.
