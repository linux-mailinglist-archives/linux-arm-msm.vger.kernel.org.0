Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E63041F6F3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 23:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355382AbhJAVc5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 17:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbhJAVc5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 17:32:57 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C76C06177F
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 14:31:12 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id v17so17444190wrv.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 14:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gbMaNhtOH4nXLp4HUS2ZPT1VowmcEtHTXpHcBFPpVz4=;
        b=GepQiSuw0T0mJ1Cm1ZrL8yaNRxwFtjYqccsjcsM+yFgmRwMWX2QtZTUgab7+hyDtfV
         r3qnReN67T/1jtXEkurkt7QPwLn3gzSIhvvpi0/DweLrDJ4q62exrQFKdxTg1znpJwVO
         2mLTd4Mld7lyUU9pRGybmMJq4TWpM70wiwMIez9+bcVXsJPAxDVo4p7fSS1jtS7d0iWs
         2oKVY/Qv9KDrvGuO0+/bhW0VhrtazQcCDhK1FgyIYEm7P6oAgpU+hV/qFuwRB6JBhB57
         zNDApFqcoYy2GAKX3fH6Av8P2Qp1hhWNfApIeJV+NjCruyyCpYApexzH+vK2MDsUwwIE
         +aVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gbMaNhtOH4nXLp4HUS2ZPT1VowmcEtHTXpHcBFPpVz4=;
        b=0KGPVu/doGDYHKjU20InWThjgJkrNSDD20czSP+T7BctIT7QhUAGpankzJioyzIzUc
         2/UglZGaw4o+UVg/TXTghC+gabTUC+6k/1jXC8YHFWVN7jUQ7PGWcZBL9Cwt/vc3Pk37
         N1Gv4MihpBmPoRBWtSvGWCgBV20k3mxFcpnj2RUVy3BgxIQpB4bReoJHI22M34coF5xO
         c7I5c38bg7a+/MirD/oA7xS6FXPYioPe9l+CdtspLz2GWT+FG2i5PbJRHRVky/eti9cf
         CDAdx5QD0J/eIqdb/WFHabixiDKJGCbqqq3xGhYX1Z/KmpHUDcZpG1nXBlS8S+x07qFg
         qZ6Q==
X-Gm-Message-State: AOAM530QqptbqzepX7TyoXoOYYdM7HMxOZHn1CzCosjpk08dhVJ8Q7JW
        TllneS1xjcD9xv5ICJ44zW+Ufw==
X-Google-Smtp-Source: ABdhPJw66kQ9/jT7l/6SvbcqiM7kpnCVCSg5UgghtKDOc3IWGsjuYaHH4/ti9PBB8a9opfK2qnJwsw==
X-Received: by 2002:adf:a154:: with SMTP id r20mr203761wrr.326.1633123870708;
        Fri, 01 Oct 2021 14:31:10 -0700 (PDT)
Received: from [192.168.1.12] (hst-221-15.medicom.bg. [84.238.221.15])
        by smtp.googlemail.com with ESMTPSA id d3sm7839997wrb.36.2021.10.01.14.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 14:31:10 -0700 (PDT)
Subject: Re: [PATCH v4 6/7] media: venus: helpers: update NUM_MBS macro
 calculation
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1628588875-23790-1-git-send-email-dikshita@codeaurora.org>
 <1628588875-23790-7-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <283e23db-5383-57d7-48ca-0efa03420335@linaro.org>
Date:   Sat, 2 Oct 2021 00:31:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1628588875-23790-7-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 8/10/21 12:47 PM, Dikshita Agarwal wrote:
> Consider alignment while calculating NUM_MBS.
> 
> Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 60a2775..2db33ba 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -18,8 +18,8 @@
>  #include "hfi_platform.h"
>  #include "hfi_parser.h"
>  
> -#define NUM_MBS_720P	(((1280 + 15) >> 4) * ((720 + 15) >> 4))
> -#define NUM_MBS_4K	(((4096 + 15) >> 4) * ((2304 + 15) >> 4))
> +#define NUM_MBS_720P	(((ALIGN(1280, 16)) >> 4) * ((ALIGN(736, 16)) >> 4))
> +#define NUM_MBS_4K	(((ALIGN(4096, 16)) >> 4) * ((ALIGN(2304, 16)) >> 4))
>  
>  struct intbuf {
>  	struct list_head list;
> @@ -1098,16 +1098,17 @@ static u32 venus_helper_get_work_mode(struct venus_inst *inst)
>  	u32 num_mbs;
>  
>  	mode = VIDC_WORK_MODE_2;
> +
>  	if (inst->session_type == VIDC_SESSION_TYPE_DEC) {
> -		num_mbs = (ALIGN(inst->height, 16) * ALIGN(inst->width, 16)) / 256;
> +		num_mbs = ((ALIGN(inst->height, 16))/16 * (ALIGN(inst->width, 16)))/16;

Could you help me understand what is the difference between both
calculations? IMO this patch should only change NUM_MBS_720P and
NUM_MBS_4K macros.

>  		if (inst->hfi_codec == HFI_VIDEO_CODEC_MPEG2 ||
> -		    inst->pic_struct != HFI_INTERLACE_FRAME_PROGRESSIVE ||
> -		    num_mbs <= NUM_MBS_720P)
> +			inst->pic_struct != HFI_INTERLACE_FRAME_PROGRESSIVE ||
> +			num_mbs <= NUM_MBS_720P)

This change just makes indentation wrong and also it is not related to
the patch subject.

>  			mode = VIDC_WORK_MODE_1;
>  	} else {
>  		num_mbs = (ALIGN(inst->out_height, 16) * ALIGN(inst->out_width, 16)) / 256;
>  		if (inst->hfi_codec == HFI_VIDEO_CODEC_VP8 &&
> -		    num_mbs <= NUM_MBS_4K)
> +			num_mbs <= NUM_MBS_4K)

ditto

>  			mode = VIDC_WORK_MODE_1;
>  	}
>  
> 

-- 
regards,
Stan
