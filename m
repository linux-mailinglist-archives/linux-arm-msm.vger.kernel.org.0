Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1110382840
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 11:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235914AbhEQJ00 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 05:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235934AbhEQJZi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 05:25:38 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8CF7C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 02:24:14 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id b7so2560689wmh.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 02:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RoIebCss24vMlDVC6yQ1C6afToK7d/dI1S2GbQ2aSEA=;
        b=zB7jCsOxnFL/LDXgSuYO6D2FTj4cBSLSuAU27wIBOhnahIP2hOkz7trtV6WVxPJeca
         EP4d9ktdjIouHp9QZrwEfbtEUBfoUCLVSERtAzPohlfQOVey1nsvp1RHh1BhPkS2yFce
         Htatp3cWHBLsreKDSbbsMX6ZPdQo+xkXJaFun59UbDBmzLWph1WskJ+wyn4t+fLl3cT3
         vKPFFvwf5VQD5v3vJ1iCNcI/3JSlzvYdnDWdqgaY7LrjMBLrALRwW7EHoe5CLH5eNaej
         EFh8iDbEam6THt30dmyEy7YCt4kTs97TzsIBzQhAMcXAeZLU2E07yB2QUVArO7SnNaTF
         R46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RoIebCss24vMlDVC6yQ1C6afToK7d/dI1S2GbQ2aSEA=;
        b=NQ+oMZes9XoM2tQILwGADwo8+/Rx3XNlhC0rM17Mx0Y7cA3grwHYm3126h9jQHHdVf
         3GIOK3YCqCguVMQ9K98AVWC8QShq+ML7vDOUYPg3TIYMLMMetPf+W8g/J/QL8a1CV4Dm
         0V1LYCR4YXEub4v1LtfyAIx2fkdr+Y9LgMD3q67kp7gBcuvXnrNZGgnu54NNvlukjyLr
         UEKCI3wS0CToUxdlOO3q55ld2dIhm/06r0uYndvzERGehFAvy5q+LZhfFpyx7sNSqHEA
         elS4rYA9PDJklxHS6+9NkTj3ICOmPF1GUEYw79ECmnmnGwpggE42IlAJkEOZviDvJmU7
         gPaw==
X-Gm-Message-State: AOAM530+iqP6NAqjuLnbj5+2pmPktfGV5VKNdFeCxHUD0dAyO6zRJv10
        crctJ/vBuUQ0ldEqjD7JM0cM2g==
X-Google-Smtp-Source: ABdhPJzje+M84O/1ehD0jh8/ySTOUiW1cfrHAJHU8AG2hcTKBQwooqzolhHORH3JodDIn+R46zTCXw==
X-Received: by 2002:a05:600c:2909:: with SMTP id i9mr62634571wmd.116.1621243453678;
        Mon, 17 May 2021 02:24:13 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id j14sm16456506wmj.19.2021.05.17.02.24.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 May 2021 02:24:13 -0700 (PDT)
Subject: Re: [PATCH v2] nvmem: qfprom: minor nit fixes
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rbokka@codeaurora.org
References: <1619416452-6852-1-git-send-email-rnayak@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <3b78bf7d-6e41-2df5-caee-20bce46ba0bf@linaro.org>
Date:   Mon, 17 May 2021 10:24:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1619416452-6852-1-git-send-email-rnayak@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 26/04/2021 06:54, Rajendra Nayak wrote:
> Fix a missed newline, change an 'if' to 'else if' and update
> a comment which is stale after the merge of '5a1bea2a: nvmem:
> qfprom: Add support for fuseblowing on sc7280'
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Applied thanks,

--srini

> ---
> v2: Added the change to move the 'if' to 'else if'
> Sending a follow-up patch for these nits since they came in after
> the previous patch was already pulled in
> https://lore.kernel.org/patchwork/patch/1401964/
> 
>   drivers/nvmem/qfprom.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
> index d6d3f24..1ba666b 100644
> --- a/drivers/nvmem/qfprom.c
> +++ b/drivers/nvmem/qfprom.c
> @@ -122,6 +122,7 @@ static const struct qfprom_soc_compatible_data sc7280_qfprom = {
>   	.keepout = sc7280_qfprom_keepout,
>   	.nkeepout = ARRAY_SIZE(sc7280_qfprom_keepout)
>   };
> +
>   /**
>    * qfprom_disable_fuse_blowing() - Undo enabling of fuse blowing.
>    * @priv: Our driver data.
> @@ -195,7 +196,7 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
>   	}
>   
>   	/*
> -	 * Hardware requires 1.8V min for fuse blowing; this may be
> +	 * Hardware requires a min voltage for fuse blowing; this may be
>   	 * a rail shared do don't specify a max--regulator constraints
>   	 * will handle.
>   	 */
> @@ -399,7 +400,7 @@ static int qfprom_probe(struct platform_device *pdev)
>   
>   		if (major_version == 7 && minor_version == 8)
>   			priv->soc_data = &qfprom_7_8_data;
> -		if (major_version == 7 && minor_version == 15)
> +		else if (major_version == 7 && minor_version == 15)
>   			priv->soc_data = &qfprom_7_15_data;
>   
>   		priv->vcc = devm_regulator_get(&pdev->dev, "vcc");
> 
