Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1C994E5A23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 21:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238720AbiCWUtg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 16:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240806AbiCWUtf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 16:49:35 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 104BD2DFB
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 13:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1648068484; x=1679604484;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=E1vhygVA4qeeFtZLSu+ZjL2N5CUIKWh3kN26nSiUzHE=;
  b=dz74PTXugfMZACW3eFE1Lr2NiAl1SRywLJJfWr5apj/HttA5eiODpk62
   Qt0aronW/JFZiWe3mZBa/oLsqwanKxN6wlOEHGhTbFo+iRAHBHxX+c6gS
   28QtoF7vvbKk7v6hTUuskxw4Pga7Sd3glUcmh07P4dkdClYBdU/CGXsPg
   g=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Mar 2022 13:48:03 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 13:48:03 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 23 Mar 2022 13:48:03 -0700
Received: from [10.110.52.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 23 Mar
 2022 13:48:02 -0700
Message-ID: <33760858-1934-bad3-82bb-49654e3272b9@quicinc.com>
Date:   Wed, 23 Mar 2022 13:48:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 0/3] drm/msm/dp: simplify dp_connector_get_modes()
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        "Sankeerth Billakanti" <quic_sbillaka@quicinc.com>
CC:     David Airlie <airlied@linux.ie>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        <freedreno@lists.freedesktop.org>
References: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SCC_BODY_URI_ONLY,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/23/2022 3:35 AM, Dmitry Baryshkov wrote:
> As noted by Ville Syrjälä [1] the dp_connector_get_modes() has weird
> on-stack interim copy of the mode. When reviewing the mentioned patch I
> noticed that the rest of the code in dp_connector_get_modes() is weird,
> unused since September of 2020 and can be removed. This series removes
> dead weird code leaving dp_connector_get_modes() simple enough.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20220218100403.7028-11-ville.syrjala@linux.intel.com/
For the series,
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> *** BLURB HERE ***
> 
> Dmitry Baryshkov (3):
>    drm/msm/dp: drop dp_mode argument from dp_panel_get_modes()
>    drm/msm/dp: simplify dp_connector_get_modes()
>    drm/msm/dp: remove max_pclk_khz field from dp_panel/dp_display
> 
>   drivers/gpu/drm/msm/dp/dp_debug.c   |  2 --
>   drivers/gpu/drm/msm/dp/dp_display.c | 11 +++-------
>   drivers/gpu/drm/msm/dp/dp_display.h |  5 +----
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 33 ++---------------------------
>   drivers/gpu/drm/msm/dp/dp_panel.c   |  2 +-
>   drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +--
>   6 files changed, 8 insertions(+), 48 deletions(-)
> 
