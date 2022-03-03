Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6936F4CC807
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 22:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231521AbiCCV3u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 16:29:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiCCV3t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 16:29:49 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ED78145E2D
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 13:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1646342944; x=1677878944;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ckxo5KMFl5D59oj/82MB4tIlU7merfl+4EsTXJtn2dk=;
  b=PAMd/qcQA45B1ldzLbFUwN3oDaltgxzYsLKy2LqWfTts9v07wImMHuGk
   yTnohnqH9hlTU1f8SnP6mejrPHsGfh0O4cUpQF/qPtsW7CkTp1/jAXIIj
   e+DoF2bUHqYkmZs6tqm/OgeHPEYtAb1BiLiyS/eD149nbGQM2gwDK1+kB
   A=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 03 Mar 2022 13:29:03 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 13:29:03 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 3 Mar 2022 13:29:02 -0800
Received: from [10.110.60.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Thu, 3 Mar 2022
 13:29:02 -0800
Message-ID: <5a66e759-260a-a742-cb71-a523f7711682@quicinc.com>
Date:   Thu, 3 Mar 2022 13:29:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 0/4] drm/msm/dpu: clearly document INTF_DP vs INTF_EDP
 difference
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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



On 2/21/2022 10:22 PM, Dmitry Baryshkov wrote:
> Recent dicussion on the mailing list [1], [2] outlined a need to document
> which intf type is used for DP and which one is used for eDP interfaces.
> 
> This series implements my proposal [3]:
> 
> - Keep INTF_EDP reserved for 8x74/8x84
> - Use INTF_DP for all contemporary DP and eDP ports
> - Documet this in dpu_hw_mdss.h
> - Remove INTF_EDP usage in dpu1 driver.
> 
> Main reasons behind this proposal:
> - It's not always possible to separate eDP and DP. For example INTF_5 on
>    sc7280 is connected to combo eDP/DP PHY.
> - Using INTF_EDP would require us to split too many pieces, ending up
>    with a singnificant amount of code duplication...
> - ... for nothing. From the DPU point of view there is no difference
>    between DP and eDP interfaces as found on current SoC generations.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/0dac8ffa-89a6-d972-bdc1-3f7755c5169d@linaro.org/
> [2]: https://lore.kernel.org/linux-arm-msm/be397e2e-05ab-5c18-8e2d-16c443f0a6d1@quicinc.com/
> [3]: https://lore.kernel.org/linux-arm-msm/e2fab93e-82a6-4837-4ee5-ee1b16caa84d@linaro.org/
> 

I have notified the team about the change and we have discussed the 
potential implications of this with both upstream and downstream drivers 
in mind. Overall, even though some members wanted to retain INTF_eDP for 
clarity, some members were fine removing its usage.

Going with the majority and I have checked all the changes in this series,

Hence:


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

For the entire series.



> Dmitry Baryshkov (4):
>    drm/msm/dpu: document INTF_EDP/INTF_DP difference
>    drm/msm/dpu: drop INTF_TYPE_MAX symbol
>    drm/msm/dpu: drop obsolete INTF_EDP comment
>    drm/msm/dpu: drop INTF_EDP from interface type conditions
> 
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 +-------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  9 ++++++++-
>   3 files changed, 10 insertions(+), 15 deletions(-)
> 
