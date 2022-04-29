Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE3AC51565C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 23:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357812AbiD2VEp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 17:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357643AbiD2VEo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 17:04:44 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8654AD3D81
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 14:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651266085; x=1682802085;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YAy5hDNSXKSdiUe7Q8Gg9AVeElzFMCbEu2X1y5vlsLw=;
  b=TEnCnNrb1PlyNUn2JwYMluguJEf27jT9GtQzSFIQidHd2zcWZlOCM96/
   g1UAwZRA9ASeYMmkpi7upldOxMQfhdHN3rdl+aUxW7gHeBAioDylhAPPP
   hxjhANwAUqCZD0GN/jbBtpotf1E6CclvqpkLpVdFqbo73v5WQLFNB1JKw
   8=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 29 Apr 2022 14:01:23 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2022 14:01:23 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 14:01:22 -0700
Received: from [10.38.245.205] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 29 Apr
 2022 14:01:21 -0700
Message-ID: <1ff04bd4-7d0d-9a08-6ea6-277c0eec0f43@quicinc.com>
Date:   Fri, 29 Apr 2022 14:01:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [RFC PATCH 0/4] drm/msm/dp: implement HPD
 notifications handling
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>
References: <20220429192928.3697407-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220429192928.3697407-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding kuogee here to keep him in the loop.

We will also review/test these.

Thanks

Abhinav

On 4/29/2022 12:29 PM, Dmitry Baryshkov wrote:
> USB altmodes code would send OOB notifications to the drm_connector
> specified in the device tree. However as the MSM DP driver uses
> drm_bridge_connector, there is no way to receive these event directly.
> Implement a bridge between oob_hotplug_event and drm_bridge's hpd_notify
> and use it to deliver altmode messages to the MSM DP driver
> 
> Bjorn Andersson (2):
>    drm: Add HPD state to drm_connector_oob_hotplug_event()
>    drm/msm/dp: Implement hpd_notify()
> 
> Dmitry Baryshkov (2):
>    drm/bridge_connector: stop filtering events in
>      drm_bridge_connector_hpd_cb()
>    drm/bridge_connector: implement oob_hotplug_event
> 
>   drivers/gpu/drm/drm_bridge_connector.c   | 17 ++++++++++++-----
>   drivers/gpu/drm/drm_connector.c          |  6 ++++--
>   drivers/gpu/drm/i915/display/intel_dp.c  | 17 ++++++++++++++---
>   drivers/gpu/drm/i915/i915_drv.h          |  3 +++
>   drivers/gpu/drm/msm/dp/dp_display.c      | 11 +++++++++++
>   drivers/gpu/drm/msm/dp/dp_display.h      |  1 +
>   drivers/gpu/drm/msm/dp/dp_drm.c          |  3 +++
>   drivers/gpu/drm/msm/dp/dp_drm.h          |  2 ++
>   drivers/gpu/drm/msm/dp/dp_hpd.c          | 21 +++++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_hpd.h          |  5 +++++
>   drivers/usb/typec/altmodes/displayport.c | 10 +++-------
>   include/drm/drm_connector.h              |  6 ++++--
>   12 files changed, 83 insertions(+), 19 deletions(-)
> 
