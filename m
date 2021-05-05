Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BECE5374B5B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 00:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234203AbhEEWng (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 18:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234011AbhEEWne (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 18:43:34 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A30BC06138E
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 15:42:35 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id c3so3123801ils.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 15:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=C/10Hp1ScYxLDmiBb9FWUlKEQyg9P0WOaaBN2yNN2t8=;
        b=VzHdoS/ATEhlFv3YjICthw1UGFyzYqmYN13wUysf6vrzVTedwOP7XHNR/fqT7EavxO
         h8KsD/vpl7zGcRmasf8er9m6QAVHBN8cxRBL7R9sp0z8gh+F6XGB8y0bxbCdxYGcTW4+
         QOnz0iEKADbRG9hWKLaMpg1iv/IVgLGygD0cY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C/10Hp1ScYxLDmiBb9FWUlKEQyg9P0WOaaBN2yNN2t8=;
        b=fhPzUsczY/De2TGtYDTZ2soflGEwNWXJMwqDjDoV3wtWmr2M+YsrblLJRTHNtNHIbb
         /dHb9Pr/gIifolzbPb3MbSLW4v7+6ET8YtCc4zskTkZOcXQ4nRphdzJX0xUyfpJ2QapA
         CGLwBd/NTcLCPGPSRGwhC3uVoN8nNI81+6i7fFIvRLpxu0YOaciEPbl+0uFiHTSva3Zk
         U/g/v9JKD2ZO2FbVgMxBcDHazxMgsQmyalyvnB3lW0KxPDGjQgtIpHJHlVL619V3MDla
         aa7hQUZ+k9oZnte8nhMEmLhtWGzZrxa9IF0vMFxOfZe9I2CAGlM1Nlvy3RoYbk3xwTTi
         nOSg==
X-Gm-Message-State: AOAM531j4hppxfTmVSSodMkN6jtvzUT7F2yWIfwh0Gy3fzmr1BmlDIR5
        bfSTbfBAP1rMQ0JuaTGZVl4nug==
X-Google-Smtp-Source: ABdhPJzmXJ8wPRU08XZtFlgIH9oTFa2B47Yv1KsGgDW0JaSMgPmIc2OJdY+1ATbjPnCTtmLzYrT0lg==
X-Received: by 2002:a05:6e02:610:: with SMTP id t16mr1147706ils.196.1620254555025;
        Wed, 05 May 2021 15:42:35 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id w6sm346708ilq.64.2021.05.05.15.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 15:42:34 -0700 (PDT)
Subject: Re: [PATCH v1 1/7] net: ipa: Add support for IPA v3.1 with GSI v1.0
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, elder@kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, davem@davemloft.net,
        kuba@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, phone-devel@vger.kernel.org
References: <20210211175015.200772-1-angelogioacchino.delregno@somainline.org>
 <20210211175015.200772-2-angelogioacchino.delregno@somainline.org>
From:   Alex Elder <elder@ieee.org>
Message-ID: <b33a7daf-e4d5-c63a-c231-b6438562229b@ieee.org>
Date:   Wed, 5 May 2021 17:42:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210211175015.200772-2-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/11/21 11:50 AM, AngeloGioacchino Del Regno wrote:
> In preparation for adding support for the MSM8998 SoC's IPA,
> add the necessary bits for IPA version 3.1 featuring GSI 1.0,
> found on at least MSM8998.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Almost everything in this patch is the same as what is
now in the upstream code.  There were minor differences,
such as using version < IPA_VERSION_4_0 rather than
version <= IPA_VERSION_3_5_1, and some comment changes.

In this patch there is one thing you had that I did not,
and I show it below.

> ---
>   drivers/net/ipa/gsi.c          |  8 ++++----
>   drivers/net/ipa/ipa_endpoint.c | 17 +++++++++--------
>   drivers/net/ipa/ipa_main.c     |  8 ++++++--
>   drivers/net/ipa/ipa_reg.h      |  3 +++
>   drivers/net/ipa/ipa_version.h  |  1 +
>   5 files changed, 23 insertions(+), 14 deletions(-)
. . .

> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index 84bb8ae92725..be191993fbec 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c

. . .

> @@ -404,6 +405,9 @@ static void ipa_hardware_config(struct ipa *ipa)
>   		/* Enable open global clocks (not needed for IPA v4.5) */
>   		val = GLOBAL_FMASK;
>   		val |= GLOBAL_2X_CLK_FMASK;
> +		if (version == IPA_VERSION_3_1)
> +			val |= MISC_FMASK;
> +

This block of code is conditional on:
	if (version >= IPA_VERSION_4_0 && version < IPA_VERSION_4_5)

Therefore adding the MISC_FMASK here won't ever happen.  (It's
possible the code you were working with had some different
logic.)

I do, however, see in the msm-4.4 code that IPA v3.1 enables
the CLKON_CFG CGC_OPEN_MISC bit (only), stating that it's a
workaround.  So I will update the logic and add this.

					-Alex

>   		iowrite32(val, ipa->reg_virt + IPA_REG_CLKON_CFG_OFFSET);
>   
>   		/* Disable PA mask to allow HOLB drop */

. . .
