Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7AA45BD57
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 15:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729059AbfGANzG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 09:55:06 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34661 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728974AbfGANzG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 09:55:06 -0400
Received: by mail-lj1-f196.google.com with SMTP id p17so13323853ljg.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2019 06:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GDqlS+iTEVHotTd99IcnQ2mj3jUGLi7G64t1i3CAPUM=;
        b=ANePV6iGdESy7GaaZwaMRe543+rV4IinPY75cCZGjtlCHn2KEBA+sQiXngBae9Fx2k
         z4xN6FEReyFt8TCKbnnOvMuNbGAZ0b51/zy4uAcibk+NxuFA9hcSU5pcAk5xOZUMWV+2
         o8UwPbL8ydAm+etpVjqRVFqxopJpiwSzCg5ZQx1e5NLlwNjjCg71Fy298T5wES+atB7V
         KXvMaw4cKEILd+e5dfjlzRIeq8Pv+kijFr8QPGng0ZtDRMtfsEin32kJA3/mFi00CRJW
         fW61HBWjgSY8YXoTc0bsMmevvMBuvzUzEa081bGDGQ7tKu9qYvAaigfRbaTw8alGR/2V
         +/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GDqlS+iTEVHotTd99IcnQ2mj3jUGLi7G64t1i3CAPUM=;
        b=ktrjwJA9hvA952yHc7g1DwWoDy6WxgjzsifkyYj++4ATUddX0EfGhDfTkw0mnShrE7
         EKE3ErrSntJ/GRl+2U2jRE3mY51lBanSjwSms540TfMDsqMfrnx59j/+Oe6DfcSYW209
         ux7jNm6/fWaWHSX6xReZjIPsqWhcbmYXEM2ul/WWJE1XcMhIF9lgdyGIt6PU6X451acZ
         tbGMAzfOvT4Gxe6v4/gc80ElrXTq7qK5IJEaInl2Ux9ri9VYBtGSyQMUzZMDvJ5rK4E4
         9CQeMTKqKGT6Tl9D+pM3K5hOgfTO1tEtq+Z0cOswVrQeFJbTEebTtN5Hzexm8C6AWaei
         z/Bg==
X-Gm-Message-State: APjAAAW0r1L7uQ4IKz1v/EwI1sW+Y1U8Q89ObP93qkxE1UxcQKryJZ7s
        maNhupZd4iPEGMn6E48EsQyvsQ==
X-Google-Smtp-Source: APXvYqwlEhzuDfkZtWLw6k6i4EtwipJ+2QR5CjUOBwdS66jnC+HePX9Zt7SgUdP+w9Errj27tFVyZQ==
X-Received: by 2002:a2e:9cd4:: with SMTP id g20mr12509939ljj.205.1561989304568;
        Mon, 01 Jul 2019 06:55:04 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id l25sm3221678lja.76.2019.07.01.06.55.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:55:03 -0700 (PDT)
Subject: Re: [PATCH v3 3/4] media: venus: Add interface for load per core
To:     Aniket Masule <amasule@codeaurora.org>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1561480044-11834-1-git-send-email-amasule@codeaurora.org>
 <1561480044-11834-4-git-send-email-amasule@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <87d41362-d86f-8da4-30ca-06390c9ceeff@linaro.org>
Date:   Mon, 1 Jul 2019 16:55:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561480044-11834-4-git-send-email-amasule@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Aniket,

On 6/25/19 7:27 PM, Aniket Masule wrote:
> Add and interface to calculate load per core. Also,
> add an interface to get maximum cores available with
> video. This interface is preparation for updating core
> selection.
> 
> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c    | 19 +++++++++++++++++++
>  drivers/media/platform/qcom/venus/hfi_helper.h |  1 +
>  drivers/media/platform/qcom/venus/hfi_parser.h |  5 +++++
>  3 files changed, 25 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index e1a0247..b79e83a 100644
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

Please squash this patch with the next one where load_per_core() is used
to avoid compiler warnings.

-- 
regards,
Stan
