Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37A036723BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 17:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjARQn3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 11:43:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbjARQnE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 11:43:04 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1EE36B3A
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 08:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1674060156; x=1705596156;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pT5clpHnRUqa+FGEMJ7uRQGCc9qWqKzX5/FHo083rzE=;
  b=jLc5AnjrtbcYfUH9S0BSKlLJHg4zjIY08xJ0sNXBRtws/cZ7luP7MA6o
   RXm2W+Y4/Es8TIIE6P8zbxClZj7feraNCZWudlDRTGBF6N2ANSBikhKH5
   y6eF5Y17cKbXkB9t80e2FTDuoyO3SWWP/5K1QshOjILyZH2IosRSYJLIk
   4=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Jan 2023 08:42:17 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 08:42:17 -0800
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 18 Jan
 2023 08:42:16 -0800
Message-ID: <2aa628b7-b54d-b5e8-14f9-c48119c08ae7@quicinc.com>
Date:   Wed, 18 Jan 2023 08:42:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] drm/msm/dpu: Reapply CTM if modeset is needed
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_abhinavk@quicinc.com>, <quic_kalyant@quicinc.com>
References: <20230118021441.161-1-quic_jesszhan@quicinc.com>
 <CAA8EJpqP+JNXMoPqWrTOA9HT0wS22Uz807S1HndCnP7R4LZiHw@mail.gmail.com>
Content-Language: en-US
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAA8EJpqP+JNXMoPqWrTOA9HT0wS22Uz807S1HndCnP7R4LZiHw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/17/2023 6:16 PM, Dmitry Baryshkov wrote:
> On Wed, 18 Jan 2023 at 04:14, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>> Add a !drm_atomic_crtc_needs_modeset() check to
>> _dpu_crtc_setup_cp_blocks() so that CTM is reapplied after a
>> suspend/resume.
> 
> .. or if the LM/DSPP blocks were reallocated by resource allocation
> during the modeset.

Hi Dmitry,

Acked -- will change the commit message in a v2.

Thanks,

Jessica Zhang

> 
>>
>> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/23
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 13ce321283ff..aa120a230222 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -748,7 +748,7 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
>>          int i;
>>
>>
>> -       if (!state->color_mgmt_changed)
>> +       if (!state->color_mgmt_changed && !drm_atomic_crtc_needs_modeset(state))
>>                  return;
>>
>>          for (i = 0; i < cstate->num_mixers; i++) {
>> --
>> 2.39.0
>>
> 
> 
> -- 
> With best wishes
> Dmitry
