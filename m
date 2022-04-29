Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 090FA51565A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 23:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbiD2VFa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 17:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378579AbiD2VF3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 17:05:29 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79941D3DAD
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 14:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651266130; x=1682802130;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7KZOUPszHZtEf2cG9unXjNPKVInGhLk0ydDvXgNUdUU=;
  b=nqGPaghyv0DHtL5Meg5keKJ4SjD2Fe8PpTGwPVb8yRvPocEvwKf5B0ik
   yCYIhQroVfPOYk/makDkXw/SGZmAvJQWOSs5Wa4rVywELnnjEpsvELnaO
   teyVS3HnIMsJtN56ao94wCWw+Kj2MkFVf49jwjluVBAe2GZwT9CPwbb/F
   Y=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 29 Apr 2022 14:02:10 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2022 14:02:10 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 14:02:09 -0700
Received: from [10.38.245.205] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 29 Apr
 2022 14:02:08 -0700
Message-ID: <a40691ac-6803-93e8-23dd-dfad18a7bb42@quicinc.com>
Date:   Fri, 29 Apr 2022 14:02:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [RFC PATCH v2 0/5] drm/msm/dp: implement HPD
 notifications handling
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>
References: <20220429195731.3716446-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220429195731.3716446-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding kuogee to keep him in the loop to review/test these.

Thanks

Abhinav

On 4/29/2022 12:57 PM, Dmitry Baryshkov wrote:
> USB altmodes code would send OOB notifications to the drm_connector
> specified in the device tree. However as the MSM DP driver uses
> drm_bridge_connector, there is no way to receive these event directly.
> Implement a bridge between oob_hotplug_event and drm_bridge's hpd_notify
> and use it to deliver altmode messages to the MSM DP driver.
> 
> Note, I left the original 'bool connected' field to be used by the
> notifiers. However I think that it should be replaced in favour of using
> the dp->hpd_state properly.
> 
> Changes since RFC v1:
>   - Incorporated old patch dropping old usbpd code. Most of it remained
>     unused.
> 
> Bjorn Andersson (2):
>    drm: Add HPD state to drm_connector_oob_hotplug_event()
>    drm/msm/dp: Implement hpd_notify()
> 
> Dmitry Baryshkov (3):
>    drm/bridge_connector: stop filtering events in
>      drm_bridge_connector_hpd_cb()
>    drm/bridge_connector: implement oob_hotplug_event
>    drm/msm/dp: remove most of usbpd-related remains
> 
>   drivers/gpu/drm/drm_bridge_connector.c   | 17 ++++--
>   drivers/gpu/drm/drm_connector.c          |  6 +-
>   drivers/gpu/drm/i915/display/intel_dp.c  | 17 +++++-
>   drivers/gpu/drm/i915/i915_drv.h          |  3 +
>   drivers/gpu/drm/msm/Makefile             |  1 -
>   drivers/gpu/drm/msm/dp/dp_ctrl.h         |  1 -
>   drivers/gpu/drm/msm/dp/dp_debug.c        |  6 +-
>   drivers/gpu/drm/msm/dp/dp_debug.h        |  4 +-
>   drivers/gpu/drm/msm/dp/dp_display.c      | 65 +++++++++-----------
>   drivers/gpu/drm/msm/dp/dp_display.h      |  1 +
>   drivers/gpu/drm/msm/dp/dp_drm.c          |  3 +
>   drivers/gpu/drm/msm/dp/dp_drm.h          |  2 +
>   drivers/gpu/drm/msm/dp/dp_hpd.c          | 67 --------------------
>   drivers/gpu/drm/msm/dp/dp_hpd.h          | 78 ------------------------
>   drivers/gpu/drm/msm/dp/dp_panel.h        |  1 -
>   drivers/gpu/drm/msm/dp/dp_power.c        |  2 +-
>   drivers/gpu/drm/msm/dp/dp_power.h        |  3 +-
>   drivers/usb/typec/altmodes/displayport.c | 10 +--
>   include/drm/drm_connector.h              |  6 +-
>   19 files changed, 82 insertions(+), 211 deletions(-)
>   delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
>   delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h
> 
