Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2C355553F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 22:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358195AbiFVUJy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 16:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356284AbiFVUJw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 16:09:52 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08CA30F42;
        Wed, 22 Jun 2022 13:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1655928591; x=1687464591;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Vp3q259CKA/W5cREO9siYE1vRfNSG7zTy6hCUJaOi3w=;
  b=eSXRJ92GXr9dzEfb4Oq3KqOnPiy/7pTm7KbCjF0RFlJsBWKRSTHEbtJg
   kKAL2+gCxxsywXRXCdnPhGaZ1INKRKwO/YR1geDWlvA8zdp3l8QqD6Yqw
   sXRfotJr6YI31x23HFGQn7Z/QRIvZWmHHx1zdm4jw6yN4qQ4f5fqFFDad
   8=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Jun 2022 13:09:51 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 13:09:51 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 13:09:50 -0700
Received: from [10.110.58.84] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 22 Jun
 2022 13:09:49 -0700
Message-ID: <918b9d1a-25ee-e99f-6821-5ed035f4a2fd@quicinc.com>
Date:   Wed, 22 Jun 2022 13:09:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] drm/msm/dp: reset drm_dev to NULL at
 dp_display_unbind()
Content-Language: en-US
To:     Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
        <airlied@linux.ie>, <bjorn.andersson@linaro.org>,
        <daniel@ffwll.ch>, <dianders@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <vkoul@kernel.org>
CC:     <quic_abhinavk@quicinc.com>, <quic_aravindh@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1655927731-22396-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n51jSuSyuw7RQqco6nEhhJHND5_9e4kNggJDnQAq8CoPug@mail.gmail.com>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n51jSuSyuw7RQqco6nEhhJHND5_9e4kNggJDnQAq8CoPug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/22/2022 1:06 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-06-22 12:55:31)
>> During msm initialize phase, dp_display_unbind() will be called to undo
>> initializations had been done by dp_display_bind() previously if there is
>> error happen at msm_drm_bind. Under this kind of circumstance, drm_device
>> may not be populated completed which causes system crash at drm_dev_dbg().
>> This patch reset drm_dev to NULL so that following drm_dev_dbg() will not
>> refer to any internal fields of drm_device to prevent system from crashing.
>> Below are panic stack trace,
>>
>> [   53.584904] Unable to handle kernel paging request at virtual address 0000000070018001
>> .
>> [   53.702212] Hardware name: Qualcomm Technologies, Inc. sc7280 CRD platform (rev5+) (DT)
>> [   53.710445] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   53.717596] pc : string_nocheck+0x1c/0x64
>> [   53.721738] lr : string+0x54/0x60
>> [   53.725162] sp : ffffffc013d6b650
>> [   53.728590] pmr_save: 000000e0
>> [   53.731743] x29: ffffffc013d6b650 x28: 0000000000000002 x27: 0000000000ffffff
>> [   53.739083] x26: ffffffc013d6b710 x25: ffffffd07a066ae0 x24: ffffffd07a419f97
>> [   53.746420] x23: ffffffd07a419f99 x22: ffffff81fef360d4 x21: ffffff81fef364d4
>> [   53.753760] x20: ffffffc013d6b6f8 x19: ffffffd07a06683c x18: 0000000000000000
>> [   53.761093] x17: 4020386678302f30 x16: 00000000000000b0 x15: ffffffd0797523c8
>> [   53.768429] x14: 0000000000000004 x13: ffff0000ffffff00 x12: ffffffd07a066b2c
>> [   53.775780] x11: 0000000000000000 x10: 000000000000013c x9 : 0000000000000000
>> [   53.783117] x8 : ffffff81fef364d4 x7 : 0000000000000000 x6 : 0000000000000000
>> [   53.790445] x5 : 0000000000000000 x4 : ffff0a00ffffff04 x3 : ffff0a00ffffff04
>> [   53.797783] x2 : 0000000070018001 x1 : ffffffffffffffff x0 : ffffff81fef360d4
>> [   53.805136] Call trace:
>> [   53.807667]  string_nocheck+0x1c/0x64
>> [   53.811439]  string+0x54/0x60
>> [   53.814498]  vsnprintf+0x374/0x53c
>> [   53.818009]  pointer+0x3dc/0x40c
>> [   53.821340]  vsnprintf+0x398/0x53c
>> [   53.824854]  vscnprintf+0x3c/0x88
>> [   53.828274]  __trace_array_vprintk+0xcc/0x2d4
>> [   53.832768]  trace_array_printk+0x8c/0xb4
>> [   53.836900]  drm_trace_printf+0x74/0x9c
>> [   53.840875]  drm_dev_dbg+0xfc/0x1b8
>> [   53.844480]  dp_pm_suspend+0x70/0xf8
>> [   53.848164]  dpm_run_callback+0x60/0x1a0
>> [   53.852222]  __device_suspend+0x304/0x3f4
>> [   53.856363]  dpm_suspend+0xf8/0x3a8
>> [   53.859959]  dpm_suspend_start+0x8c/0xc0
>>
>> Fixes: a65c95ff88f2 ("drm/msm/dp: stop event kernel thread when DP unbind")
> Commit doesn't exist. I guess it's
>
> Fixes: 570d3e5d28db ("drm/msm/dp: stop event kernel thread when DP unbind")

it is my bad, i keep using our internal commit id.

Will be careful next time.

