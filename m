Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80752BB935
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2019 18:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387863AbfIWQNf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Sep 2019 12:13:35 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46502 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387827AbfIWQNf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Sep 2019 12:13:35 -0400
Received: by mail-pg1-f195.google.com with SMTP id a3so8231784pgm.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2019 09:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=apbBXLECKeCr2nfHMhDarwOs2kmb3BwARUfU7rCAU0Q=;
        b=c+kf3kCpGiWQ+r6yoJHpmwCdo1HOtkUyu2BhzHUSe/3l2DBNFlh9igGK9fhm1ViKY/
         T6XlC0n1rEh3hT3vybfjQUqDpNtkp7LzC+d1ishrqLQx+/HMgNcrSQYdEaWG29DFHVA+
         kZrhIyfTGEQq7r5MwOiQWn7rFA8cjs4XQOwyd88vsPTAV50hdZGsHD+epUiE5ZmgCF09
         8v4pRmNn/+24lfWBFqOWBHDaCKmp6ufnRccuBzmVqOyb8CrbzlADlZkVLgmLs+dBZtBO
         Vu++sFKD9gxaZOMjWOARkD6lGHs/Qzrd4JWbanTQ3NQJ+DVOz0rcMLtlVxWdryyA+SFO
         u/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=apbBXLECKeCr2nfHMhDarwOs2kmb3BwARUfU7rCAU0Q=;
        b=d8rySUtlJQGAcpv1uUY0zd1n/dSDsB6S2z77WI343LnlMbO2nj78tBtxWFvAd/1msw
         tiXWl3cRntGe6kB3ixBHP4o71+9J1yw+uZJBewxGUQZp/y4HdHh8iq4VdLVEIWvFIaxN
         P+aWKWXI0HVeZLLnOQJYxrIQ9PJyJDDEfmYADOssAT5yiXoLTYwHixHaVCI0+bmrkV80
         6L3rO3i1DqF622ydzLkepQtNJhyn9bPPZA70AoZ0acWU2L8x+AB9dj7sYLxngR7Fy0nG
         hJ5GP5MtrqQ5w/N3VC01FqCffgMeEEnVePyWVq/pyo3qAWlYfpN9+0l+OKZ9YkKjhjHP
         hDDQ==
X-Gm-Message-State: APjAAAXlTRPH9Pu9Hl69sJ3Ox2cH/ix948mQey66Vf0tJSBkBcjaAdrY
        uhuwVRdye3jRFAMJGfsBtflRow==
X-Google-Smtp-Source: APXvYqwmxfpSG0n37lJ/39jg2Q9LO+VPYs9m169xlU+lsFbVsdtVasfIflPpJTeYKXay6R+AlPjv7w==
X-Received: by 2002:aa7:8f08:: with SMTP id x8mr425542pfr.48.1569255214865;
        Mon, 23 Sep 2019 09:13:34 -0700 (PDT)
Received: from [172.20.34.69] ([12.157.10.114])
        by smtp.googlemail.com with ESMTPSA id k66sm12421560pjb.11.2019.09.23.09.13.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Sep 2019 09:13:33 -0700 (PDT)
Subject: Re: [PATCH v2] media: venus: core: Fix msm8996 frequency table
To:     Loic Poulain <loic.poulain@linaro.org>,
        stanimir.varbanov@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
References: <1568213159-7828-1-git-send-email-loic.poulain@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <cb608b5c-e31e-5e4a-5f60-51f888347ede@linaro.org>
Date:   Mon, 23 Sep 2019 19:13:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568213159-7828-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On 9/11/19 5:45 PM, Loic Poulain wrote:
> In downstream driver, there are two frequency tables defined,
> one for the encoder and one for the decoder:
> 
> /* Encoders /
> <972000 490000000 0x55555555>, / 4k UHD @ 30 /
> <489600 320000000 0x55555555>, / 1080p @ 60 /
> <244800 150000000 0x55555555>, / 1080p @ 30 /
> <108000 75000000 0x55555555>, / 720p @ 30 */
> 
> /* Decoders /
> <1944000 490000000 0xffffffff>, / 4k UHD @ 60 /
> < 972000 320000000 0xffffffff>, / 4k UHD @ 30 /
> < 489600 150000000 0xffffffff>, / 1080p @ 60 /
> < 244800 75000000 0xffffffff>; / 1080p @ 30 */
> 
> It shows that encoder always needs a higher clock than decoder.
> 
> In current venus driver, the unified frequency table is aligned
> with the downstream decoder table which causes performance issues
> in encoding scenarios. Fix that by aligning frequency table on
> worst case (encoding).
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

-- 
-- 
regards,
Stan
