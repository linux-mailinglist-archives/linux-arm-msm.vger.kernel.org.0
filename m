Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84F5564D703
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 08:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbiLOHLD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Dec 2022 02:11:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiLOHKi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Dec 2022 02:10:38 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B413122296
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 23:06:19 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so1102193wms.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 23:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lfjjP8THPoyFgCibBkqO0thZLZlFewfYPO1zpSWCYew=;
        b=dYwKhXvbyv4dYhoR646FuKyuPpG0WotUkiZBF1Vhaun+U97tDRtcBuIwAoW2n7wio6
         fqX1jeW+rLHR1RLF2kepIPZOnjlIyn/EzPHyfv/ti8q1XN1AU9+MkwrQ2AEUfBImfZI4
         jZ0wC9f69CpeTxhxFhPnV+pjQY9v9n+KXgyKgMn4CLYEoSLLxycwtz1uQIIdJSCEQ4hV
         BrKWHDujEjJHlQhfauRmzAKy77pR5WWQao7eADa3sDBAvqhKOq6NJDahPnR+BuyM/y0V
         B6y9WVm8X6XuI0LYmhLul4DjVFAmSIhyRQnLYKZnc8zOKgMUmirMzQrSgfSzpiZbkgFU
         eYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lfjjP8THPoyFgCibBkqO0thZLZlFewfYPO1zpSWCYew=;
        b=v74anBdMmY/m1zv62fd2vm3k0AbNddoe14hw6uWMys3FNQa/T6HFgmDmff6M/gQCPb
         +hD+3Woyninru8gfmEgwy1UbpuFpFvrf1sGW8f+Top2cS759eJfd4RbKFHPj5mvq+nhR
         BBsruDQA8VFvF95xdOsUgu582o0nFVkfdx9KDE6mh8SET879OgB46kxM/JRk7QXKd35g
         g6GDg3yGtdHBb0ogl1a3PPcfHoMvsFK/OT77Dc59wTN+Mp7pWkEVYYEp2/l9j0eUUidd
         l+SSaAh1TMKxgfNSK+wA3bNHHEURSa4m+vZaAR55QBjjXjA/hwbjbIkxdRRlKLeeRipt
         UQvA==
X-Gm-Message-State: ANoB5pnjEmHuNywKyqCoFmQSWf71KU0sZJH/NFVAIEYuZ5VSyLCQ+8wM
        7QyTjN0VQ5Vle7QC4LbUpIW13A==
X-Google-Smtp-Source: AA0mqf5L9xWcoidg/+YgWM0D0dqEkMCFolFMFJ5l9KLYHxcRvtmaqf1hE/FwKrgjIFlni3sR+9UxNg==
X-Received: by 2002:a7b:c017:0:b0:3cf:8e5d:7184 with SMTP id c23-20020a7bc017000000b003cf8e5d7184mr20737074wmb.28.1671087978562;
        Wed, 14 Dec 2022 23:06:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b003b4868eb71bsm5987273wmq.25.2022.12.14.23.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 23:06:18 -0800 (PST)
Message-ID: <fe761bbe-96f9-75ae-b4be-e94b718abac3@linaro.org>
Date:   Thu, 15 Dec 2022 08:06:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/2] remoteproc: elf_loader: Update resource table name
 check
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-remoteproc@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, judyhsiao@chromium.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        mathieu.poirier@linaro.org, corbet@lwn.net,
        Stephen Boyd <swboyd@chromium.org>
References: <1670924929-26507-1-git-send-email-quic_srivasam@quicinc.com>
 <1670924929-26507-2-git-send-email-quic_srivasam@quicinc.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <1670924929-26507-2-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/12/22 10:48, Srinivasa Rao Mandadapu wrote:
> Update the way of checking resource table name with prefix
> substring search instead of complete string search.
> In general Qualcomm DSP binary is prepared by combining different elfs,

Maybe 'ELFs'? (twice).

> hence section header name (e.g. .resource_table), appended with elf name
> to differentiate with same section of different elfs.

Please include here the section info parsed by readelf as an example,
as suggested by Stephen in your v1:
https://lore.kernel.org/linux-remoteproc/CAE-0n52cNite8-4HDoQcsZ+UvZFkJU8c5oUjxPB5ag5WP6E9=g@mail.gmail.com/

> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
> Changes since v1:
>      -- Update the commit message.
> 	-- Use strstarts instead of strstr.
> 
>   drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index 5a412d7..77330d6 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -272,7 +272,7 @@ find_table(struct device *dev, const struct firmware *fw)
>   		u64 offset = elf_shdr_get_sh_offset(class, shdr);
>   		u32 name = elf_shdr_get_sh_name(class, shdr);
>   
> -		if (strcmp(name_table + name, ".resource_table"))
> +		if (!strstarts(name_table + name, ".resource_table"))
>   			continue;
>   
>   		table = (struct resource_table *)(elf_data + offset);

