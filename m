Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD97CFD85
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2019 17:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbfJHPX6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Oct 2019 11:23:58 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45764 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfJHPX6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Oct 2019 11:23:58 -0400
Received: by mail-lj1-f194.google.com with SMTP id q64so17995558ljb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2019 08:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9PhGRTHKUAzIaL/vNNaww6tGN/3A8IsOHazogyKsOBc=;
        b=kEM8Ya+xMnJ7C1AdxxVrv+OQaABB93fiaJhHKmu0rO4RNufRC/oJsXPLAmkJowQcRi
         5TX0uN2WLlyB52lYARhk4xVw0eet36ZSE2I1e0fbr9epQ4FQaUl2uMRJUTkt1Bus3OId
         gPOSwIbPQjnN6rZi0aOLEVl0juMLditYR/hEGpQoMQxS1Q/5T3/hqlhWa97tJPr4oTDz
         VLKy2i2ZXHFkxSytlnz6iTv+LtF2MC7v+LLiCJGHQ9ZEW+u2CyL353toGSnrf5qK6+Aj
         u9ZufPZbNw5E6JK8gBqzJcG5lS+zrUM65xifSqPLqt/0ZVTc3G0cs474P9iFXO5PAR4g
         6y5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9PhGRTHKUAzIaL/vNNaww6tGN/3A8IsOHazogyKsOBc=;
        b=KWwXsHT6I8YFzS9PdEnjGIIizryoElZIeqLKZQIjLR//HHC4ZHeu5ny8mueEZUBTLD
         +3ePEYKHnHPFDMr8qEA09COql2d3G4NA8pi1a/bx7PpDZr1zUydNpoxqF8WOm+aazO/5
         OUjQVUY2Uw20qWNLQp41ZrX9yj+KsiXpViO+JvWSdKa6rqbwlbrjCV3Wtw/vGYiSan6p
         BdhfIYOD6zI6nLAcL+EHaXNMds0R1pd1i+BFaqZHqHs+Vi6jeAziAAxkBeu9tivGcRJ9
         A/dYkVcMW9U6pzcoOhAwXee5eD51OkoEyLM4JgdVhM1S40or4R+mjx0DT4rCS/cXWLa+
         ECJA==
X-Gm-Message-State: APjAAAW96uoCdxDnyZDI8ySssYmsH4zwV3OyjmuOwSQ/hlAiTfbzeLz1
        7IRIdIrD2aGzgh4QiW28I3xCRNGfW/E=
X-Google-Smtp-Source: APXvYqz3ggKqPyiA2FGjNYHksx8OpItrPrz80i0XifuVHL7u10A7plcbGnYL8FdI9bNCikl95sixAA==
X-Received: by 2002:a2e:3808:: with SMTP id f8mr22496807lja.7.1570548235734;
        Tue, 08 Oct 2019 08:23:55 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id b21sm3883262lff.96.2019.10.08.08.23.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 08:23:54 -0700 (PDT)
Subject: Re: [PATCH v2] media: venus: fix build on 32bit environments
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@infradead.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
References: <fe713104c8e1c218149013576e8e99f8563796bd.1570531619.git.mchehab+samsung@kernel.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <3b7f9e98-8840-e43c-6a72-180ac10f7806@linaro.org>
Date:   Tue, 8 Oct 2019 18:23:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fe713104c8e1c218149013576e8e99f8563796bd.1570531619.git.mchehab+samsung@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Mauro, thanks for the fix!

On 10/8/19 1:47 PM, Mauro Carvalho Chehab wrote:
> As reported by jenkins@linuxtv.org, the build with i386 fails
> with:
> 
> 	ld: drivers/media/platform/qcom/venus/helpers.o: in function `venus_helper_load_scale_clocks':
> 	(.text+0x1d77): undefined reference to `__udivdi3'
> 	ld: (.text+0x1dce): undefined reference to `__udivdi3'
> 	make: *** [Makefile:1094: vmlinux] Error 1
> 
> That's because it divides an u32 bit integer by a u64 one.
> 
> Fix it by explicitly callind do_div.

Please drop this line, it is not valid for v2.

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 5ea5d90f8e5f..a172f1ac0b35 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -520,10 +520,11 @@ static unsigned long calculate_inst_freq(struct venus_inst *inst,
>  					 unsigned long filled_len)
>  {
>  	unsigned long vpp_freq = 0, vsp_freq = 0;
> -	u64 fps = inst->fps;
> +	u32 fps = (u32)inst->fps;
>  	u32 mbs_per_sec;
>  
> -	mbs_per_sec = load_per_instance(inst) / inst->fps;
> +	mbs_per_sec = load_per_instance(inst) / fps;
> +
>  	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
>  	/* 21 / 20 is overhead factor */
>  	vpp_freq += vpp_freq / 20;
> 

-- 
regards,
Stan
