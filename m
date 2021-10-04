Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E194206B3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 09:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhJDHjf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 03:39:35 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:64183 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230004AbhJDHjf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 03:39:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633333066; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qkd4MVWGUsJu+oxqYRU+yhpR+llgKwiBa2xcweEug+I=;
 b=EsJhn8A2U0Qtoq3YSxfoEqLzZ+ySp44biXQ10LyTlUNqUCRIpXpagFvJ/ZPutd1qv3NFjJ7Y
 klw6xYVeKynWVY8EE3jF3+6P/4Xc+89+2XGDKtU3F1xi3KZVp/LrOAyuqZCKJ19EUCtw+GMS
 2K8uS6luuuP9+IWP8xSzKssH3ys=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 615aaf34a3e8d3c640281634 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Oct 2021 07:37:24
 GMT
Sender: dikshita=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EB1E5C43460; Mon,  4 Oct 2021 07:37:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 503E8C4338F;
        Mon,  4 Oct 2021 07:37:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 04 Oct 2021 13:07:22 +0530
From:   dikshita@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH v4 6/7] media: venus: helpers: update NUM_MBS macro
 calculation
In-Reply-To: <283e23db-5383-57d7-48ca-0efa03420335@linaro.org>
References: <1628588875-23790-1-git-send-email-dikshita@codeaurora.org>
 <1628588875-23790-7-git-send-email-dikshita@codeaurora.org>
 <283e23db-5383-57d7-48ca-0efa03420335@linaro.org>
Message-ID: <5acab57bd6c1088dd1beff1df0ba71d1@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stan,

On 2021-10-02 03:01, Stanimir Varbanov wrote:
> Hi,
> 
> On 8/10/21 12:47 PM, Dikshita Agarwal wrote:
>> Consider alignment while calculating NUM_MBS.
>> 
>> Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/helpers.c | 13 +++++++------
>>  1 file changed, 7 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c 
>> b/drivers/media/platform/qcom/venus/helpers.c
>> index 60a2775..2db33ba 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.c
>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>> @@ -18,8 +18,8 @@
>>  #include "hfi_platform.h"
>>  #include "hfi_parser.h"
>> 
>> -#define NUM_MBS_720P	(((1280 + 15) >> 4) * ((720 + 15) >> 4))
>> -#define NUM_MBS_4K	(((4096 + 15) >> 4) * ((2304 + 15) >> 4))
>> +#define NUM_MBS_720P	(((ALIGN(1280, 16)) >> 4) * ((ALIGN(736, 16)) >> 
>> 4))
>> +#define NUM_MBS_4K	(((ALIGN(4096, 16)) >> 4) * ((ALIGN(2304, 16)) >> 
>> 4))
>> 
>>  struct intbuf {
>>  	struct list_head list;
>> @@ -1098,16 +1098,17 @@ static u32 venus_helper_get_work_mode(struct 
>> venus_inst *inst)
>>  	u32 num_mbs;
>> 
>>  	mode = VIDC_WORK_MODE_2;
>> +
>>  	if (inst->session_type == VIDC_SESSION_TYPE_DEC) {
>> -		num_mbs = (ALIGN(inst->height, 16) * ALIGN(inst->width, 16)) / 256;
>> +		num_mbs = ((ALIGN(inst->height, 16))/16 * (ALIGN(inst->width, 
>> 16)))/16;
> 
> Could you help me understand what is the difference between both
> calculations? IMO this patch should only change NUM_MBS_720P and
> NUM_MBS_4K macros.
> 
We are updating the calculation here to match with the calculation used 
in Macro.
AFAIK, we were seeing a size mismatch for a resolution with the old 
calculation.

>>  		if (inst->hfi_codec == HFI_VIDEO_CODEC_MPEG2 ||
>> -		    inst->pic_struct != HFI_INTERLACE_FRAME_PROGRESSIVE ||
>> -		    num_mbs <= NUM_MBS_720P)
>> +			inst->pic_struct != HFI_INTERLACE_FRAME_PROGRESSIVE ||
>> +			num_mbs <= NUM_MBS_720P)
> 
> This change just makes indentation wrong and also it is not related to
> the patch subject.
I think it can be dropped.
> 
>>  			mode = VIDC_WORK_MODE_1;
>>  	} else {
>>  		num_mbs = (ALIGN(inst->out_height, 16) * ALIGN(inst->out_width, 
>> 16)) / 256;
>>  		if (inst->hfi_codec == HFI_VIDEO_CODEC_VP8 &&
>> -		    num_mbs <= NUM_MBS_4K)
>> +			num_mbs <= NUM_MBS_4K)
> 
> ditto
Same here.
> 
>>  			mode = VIDC_WORK_MODE_1;
>>  	}
>> 
>> 
