Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB9D698C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2019 18:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731220AbfGOQBA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jul 2019 12:01:00 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36161 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731011AbfGOQBA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jul 2019 12:01:00 -0400
Received: by mail-lf1-f66.google.com with SMTP id q26so11392333lfc.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2019 09:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jG4VdXmMyoFpVc6NE61bUixbe9slfFe01xROPhYpMig=;
        b=e5PTHPzJ994GNrOlaHnu48Kx8anQPqPS+EE773SxOJVUZ/SYAuvGcwf8gdsTmOC+uW
         6pQdRNNPUSnorHQJeyfyIJ4SQyRQhrT6N6HVWQoa8NYljURxsNcAUd8rnlkJVPsT2V7Y
         adM/O1IBhBvTw/kJxUc+/sHbrAaqXuqtvDRI8UN74N1+AGDrUiecIXZRqsVY02GuP9Sm
         Gbe67YjBkXNaTkWph3pf7vm01CpMn4DNnOHYqwbW1A9mA5NXdpI9RWf0GAxjuoDNKh4V
         npdUlFUBKhNyUms2UrEFu+XvmGG3ySH5mCdHydaDo07riYRjgGalP3VlGFU5edXYrKbi
         Ibrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jG4VdXmMyoFpVc6NE61bUixbe9slfFe01xROPhYpMig=;
        b=Gzwbf72rzy2nPOTiqLkTNNfZA5OYViLpTzSuN4ngIQgL/6U+XhBwwuyXUTVkgB8M4K
         K8bB+4uMpYs8CUC7lm2mUfh6Euwb9z22RHLn6zug1rZCpSvczfnNR48o8LTaLx6B6dml
         Wn8XucfuJYof6T/IjJm2kNA+edymm/JziMKDcKniLHL40LqgZclk1L3Sfu5fwAyRwkCy
         zqFCgRhqIsgDNVzejhssNIRsrCIte/V1yQLrJHVNOYGTa1Qa7qaNJwhVRjvilYFi3nTk
         CSDKzoJQIy0qvzTXoVk6cvHy1aUyNw4S/Qc6FsHXMHr8ip9EHAgvOhqZ3BIcyVwQoV20
         Eo+g==
X-Gm-Message-State: APjAAAUd4DRhozLszFjNEGg8YyBZd1r/Ba+3Cdlt8qTgkaH0K8+j7u0k
        jZT/FGEWjhxlxNu2X9e85RyhuA==
X-Google-Smtp-Source: APXvYqzpO/d721H8WmEWknLzWu8P2CBGQsu+CdgDvcYjaeYxVVcvsWqTCVaZyda1gLViNxrDs++qQQ==
X-Received: by 2002:ac2:5b49:: with SMTP id i9mr11725604lfp.116.1563206458930;
        Mon, 15 Jul 2019 09:00:58 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id w1sm2408001lfe.50.2019.07.15.09.00.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 09:00:58 -0700 (PDT)
Subject: Re: [PATCH v4 4/4] media: venus: Update core selection
To:     Aniket Masule <amasule@codeaurora.org>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1562078787-516-1-git-send-email-amasule@codeaurora.org>
 <1562078787-516-5-git-send-email-amasule@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <66c52577-fae8-9b3d-ec1d-886b97897729@linaro.org>
Date:   Mon, 15 Jul 2019 19:00:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562078787-516-5-git-send-email-amasule@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 7/2/19 5:46 PM, Aniket Masule wrote:
> Present core assignment is static. Introduced load balancing
> across the cores. Load on earch core is calculated and core
> with minimum load is assigned to given instance.
> 
> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c    | 69 +++++++++++++++++++++++---
>  drivers/media/platform/qcom/venus/helpers.h    |  2 +-
>  drivers/media/platform/qcom/venus/hfi_helper.h |  1 +
>  drivers/media/platform/qcom/venus/hfi_parser.h |  5 ++
>  drivers/media/platform/qcom/venus/vdec.c       |  2 +-
>  drivers/media/platform/qcom/venus/venc.c       |  2 +-
>  6 files changed, 72 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 5726d86..321e9f7 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -26,6 +26,7 @@
>  #include "helpers.h"
>  #include "hfi_helper.h"
>  #include "hfi_venus_io.h"
> +#include "hfi_parser.h"
>  
>  struct intbuf {
>  	struct list_head list;
> @@ -331,6 +332,24 @@ static u32 load_per_instance(struct venus_inst *inst)
>  	return mbs * inst->fps;
>  }
>  
> +static u32 load_per_core(struct venus_core *core, u32 core_id)
> +{
> +	struct venus_inst *inst = NULL;
> +	u32 mbs_per_sec = 0, load = 0;
> +
> +	mutex_lock(&core->lock);
> +	list_for_each_entry(inst, &core->instances, list) {
> +		if (!(inst->clk_data.core_id == core_id))

		if (inst->clk_data.core_id != core_id)

I guess will be more readable?

> +			continue;
> +
> +		mbs_per_sec = load_per_instance(inst);
> +		load = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
> +	}
> +	mutex_unlock(&core->lock);
> +
> +	return load;
> +}
> +

<cut>

-- 
regards,
Stan
