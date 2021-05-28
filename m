Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E5B3948A4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 May 2021 00:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhE1WZ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 18:25:26 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:46421 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229575AbhE1WZ0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 18:25:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622240631; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=18Esb175aaSr5AM8zLM9xU1/NrzIFnqkbq2Zo/3L8H0=;
 b=nR2QILVNUIQeqRKuuuNCNQTPEo0OcuEhZ3wWGytWQ7YMeBnNOgVg3XMKTOn/0bYt401r4+NU
 Jmzw2aVbqTLI/TZtpH7O+tUQoxZmck2DlU3lQG/OPYtKvY6jxCx5P9auPwtC4TQKllk0IBNP
 WA7uA8JdgJWO58QfuW/1ONNQgJ8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60b16d5551f29e6bae8e85f7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 28 May 2021 22:23:17
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 94E2BC4323A; Fri, 28 May 2021 22:23:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D5DCAC433F1;
        Fri, 28 May 2021 22:23:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 28 May 2021 15:23:13 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [RFC PATCH 11/13] drm/msm/disp/dpu1: Add support for DSC in
 topology
In-Reply-To: <06ffdec5-8b12-c077-0c51-6ea9100b96a4@linaro.org>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-16-vkoul@kernel.org>
 <06ffdec5-8b12-c077-0c51-6ea9100b96a4@linaro.org>
Message-ID: <57a4c00413dcaba38cebf3aa145b4d64@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-28 03:39, Dmitry Baryshkov wrote:
> On 21/05/2021 15:49, Vinod Koul wrote:
>> For DSC to work we typically need a 2,2,1 configuration. This should
>> suffice for resolutions upto 4k. For more resolutions like 8k this 
>> won't
>> work.
>> 
>> Furthermore, we can use 1 DSC encoder in lesser resulutions, but that 
>> is
>> not power efficient according to Abhinav, so it is recommended to 
>> always
>> use 2 encoders.
> 
> Not power efficient because the second DSC would also be powered on or
> because single DSC enc would consume more power than two DSCs?

I havent got through the series yet but just thought of answering this,

So before coming to the power aspects of this, hard-coding was done for 
the foll reasons:

-> We do not have a topology DTSI property in upstream and will probably 
not have as well till
other features are added which support all the topologies
-> The DSC panel which is being upstreamed as part of this series is 
working with this 2,2,1 topology
downstream ( dual lm, dual DSC encoders, single DSI ). Other topologies 
have not been tried on it yet
-> There needs to be a better approach to handle all topologies once we 
have added support for them.
It can be either a DTSI property if others agree OR some helper API 
which will determine the best topology
based on various factors. Till then, since this will be the only DSC 
panel we are adding support for
I thought we can start with a fixed topology for now.

Coming to the power aspect, I only recommended 2-2-1 here because using 
two mixers is better power wise
as it will split the width/2. We can also do 2-1-1 by enabling 3D mux 
but this panel has not been validated
with a single DSC. So to keep things simple with what has been 
validated, I thought we can go ahead with
2-2-1 for now.

So rather than giving too much importance to the power aspect of it, the 
other reasons should also
be highlighted here as the main reason and the commit text should give 
these details as well.

>> 
>> So for now we blindly create 2,2,1 topology when DSC is enabled
>> 
>> Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
>> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 18cb1274a8bb..bffb40085c67 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -609,8 +609,22 @@ static struct msm_display_topology 
>> dpu_encoder_get_topology(
>>   	topology.num_enc = 0;
>>   	topology.num_intf = intf_count;
>>   +	drm_enc = &dpu_enc->base;
>> +	priv = drm_enc->dev->dev_private;
>> +	if (priv && priv->dsc) {
>> +		/* In case of Display Stream Compression DSC, we would use
>> +		 * 2 encoders, 2 line mixers and 1 interface
>> +		 * this is power optimal and can drive upto (including) 4k
>> +		 * screens
>> +		 */
>> +		topology.num_enc = 2;
>> +		topology.num_intf = 1;
>> +		topology.num_lm = 2;
>> +	}
>> +
>>   	return topology;
>>   }
>> +
>>   static int dpu_encoder_virt_atomic_check(
>>   		struct drm_encoder *drm_enc,
>>   		struct drm_crtc_state *crtc_state,
>> 
