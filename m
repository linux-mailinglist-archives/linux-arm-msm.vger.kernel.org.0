Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB2CA41C1B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 11:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbhI2JjI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 05:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243626AbhI2JjH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 05:39:07 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9703C06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 02:37:26 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id v17so3120960wrv.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 02:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=jBWmL0JpNKFM5c6ohDYxw+GPyaJ3iBmiTERbb1R2J3c=;
        b=WXT/VgkD54cm9UG4fsR/5sUppMoF1zzzTx+eCZd6jOcbv3fzRDPKNX4Hp6Id7YcSux
         zTxJlsZd5MKO00D5GnSt9Yg5SSJgAalLKluuupLHubvZCljMUkgozn01B0/Sf+gkaG9T
         gN6+uVjuyuF4LtPpTVTvoO+zyGEYFlDO6vEKqUsNRxrFIl48Kng5HLv9fsh3qQbR3Ofx
         4j1ttsq6EhJCa4x2cY5rEvyiXoKuhpyPZHQ6mQfx57tnfqG3iCFtMAB9gUckM8sjEqjZ
         WerJ5pckhVaRUoyMpQpVUs6ykun2rz95AZxCVEDO+QWy8/f/O0R/9QKLokZ2GchDvKa6
         bmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=jBWmL0JpNKFM5c6ohDYxw+GPyaJ3iBmiTERbb1R2J3c=;
        b=lBv92NbQhhqYwwqGx0oqbXRvwkvEVuoIksa5l2j/HOiZSYdprUZXCdd9q3YesucjEY
         8yPVXfb5By/GW32Kdkrz9pls+/ErvmN3h68Kt4Hh9D5d7qkXvPZyQr7tn6kb443A4+5e
         YB1R/ITDBzm8VIIqVN+TP5YXiicP9YczuDfDPBM8ziCwRogfDrYS1091M6ELW1bmWjPr
         RKxoRCbAQ6Y5X448wZzwUZwXsmWAVybI5XV0HRCIVE1viXGcZRfndhhmftWCgjfxv1AY
         6EpKJwNpCdkQBuhlZ8DYvvVWJb0dGftqgY+jInSSa2OQxechXG6OfYncDqgPCrwUYyEb
         OwTw==
X-Gm-Message-State: AOAM531ubb4yyTTPsdcAYL6h6j6qo0KldDhhDv/7gBQzEieLqI562/pf
        rOTcK1stX7USZqDCIU+fixQ26w==
X-Google-Smtp-Source: ABdhPJz56+LA6+MezNoVisRkHJmkTryPkUGdVZdzpyhKppEZy55+TeN8gj2SzwfpubBE7klF7H93Jw==
X-Received: by 2002:adf:ce89:: with SMTP id r9mr5544185wrn.238.1632908245475;
        Wed, 29 Sep 2021 02:37:25 -0700 (PDT)
Received: from [192.168.100.6] (156.red-79-144-201.dynamicip.rima-tde.net. [79.144.201.156])
        by smtp.gmail.com with ESMTPSA id z17sm1700142wrr.49.2021.09.29.02.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 02:37:24 -0700 (PDT)
Message-ID: <f358044a-78d0-ad63-a777-87b4b9d94745@aleksander.es>
Date:   Wed, 29 Sep 2021 11:37:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To:     Thomas Perrot <thomas.perrot@bootlin.com>,
        linux-arm-msm@vger.kernel.org
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        loic.poulain@linaro.org, stable@vger.kernel.org
References: <20210805140231.268273-1-thomas.perrot@bootlin.com>
From:   Aleksander Morgado <aleksander@aleksander.es>
Subject: Re: [PATCH] bus: mhi: pci_generic: increase timeout value for
 operations to 24000ms
In-Reply-To: <20210805140231.268273-1-thomas.perrot@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey all,

On 5/8/21 16:02, Thomas Perrot wrote:
> Otherwise, the waiting time was too short to use a Sierra Wireless EM919X
> connected to an i.MX6 through the PCIe bus.
> 
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>   drivers/bus/mhi/pci_generic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 4dd1077354af..e08ed6e5031b 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -248,7 +248,7 @@ static struct mhi_event_config modem_qcom_v1_mhi_events[] = {
>   
>   static const struct mhi_controller_config modem_qcom_v1_mhiv_config = {
>   	.max_channels = 128,
> -	.timeout_ms = 8000,
> +	.timeout_ms = 24000,


This modem_qcom_v1_mhiv_config config applies to all generic SDX24, SDX55 and SDX65 modules.
Other vendor-branded SDX55 based modules in this same file (Foxconn SDX55, MV31), have 20000ms as timeout.
Other vendor-branded SDX24 based modules in this same file (Quectel EM12xx), have also 20000ms as timeout.
Maybe it makes sense to have a common timeout for all?

Thomas, is the 24000ms value taken from experimentation, or is it a safe enough value? Maybe 20000ms as in other modules would have been enough?

And if 20000ms wasn't enough but 24000ms is, how about adding that same value for all modules? These modules definitely need time to boot, not sure if having slightly different timeout values for each would make much sense, unless there are very very different values required.

What do you think?

>   	.num_channels = ARRAY_SIZE(modem_qcom_v1_mhi_channels),
>   	.ch_cfg = modem_qcom_v1_mhi_channels,
>   	.num_events = ARRAY_SIZE(modem_qcom_v1_mhi_events),
> 


-- 
Aleksander
https://aleksander.es
