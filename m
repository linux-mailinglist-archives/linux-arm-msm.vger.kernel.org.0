Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74E1A59AEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2019 14:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbfF1M0w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jun 2019 08:26:52 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36430 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbfF1M0w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jun 2019 08:26:52 -0400
Received: by mail-wr1-f65.google.com with SMTP id n4so6119611wrs.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2019 05:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LYAXGZ6vcW3ZtuM6EtALB6/rLlHD9t8fkU/ep7/HS0I=;
        b=RGarXb+Bdm0hut9k2mf9Cpw3zJsn2CtrA7dZpBRCCOPyJ9qzOwypW27BhjWIWLFgmE
         Fx5v1aLO1zDht6jI+6Jf0BliecziymNPxtWgVOilZ8cqWhPaaHfHHeWZwnHBxfvIWdwq
         w4P7l0faR5D6TmvyT+i8ewpskmqpV98sGgYlU/0oEIH2aviMLcXysElHexuwiCnP0iS7
         U/9igXETtWnA3V/C8n0jaussnlGYnsRqOMLpd65+qS8kaJ0Bi5VIVpKehpAogjQU25zs
         wll+qxJ10DFEDfdq+esg/Qq8yHl0tnrK0DCMjcRnKat5hSuok9l0YieHkBx4zI0osmtR
         7ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LYAXGZ6vcW3ZtuM6EtALB6/rLlHD9t8fkU/ep7/HS0I=;
        b=lQ2ExJ49pvfYxCsue0+LObfPiZ8kL8MK9FhH2xQd+L5Y5YBvP5n6bUT++0iuLwIbmF
         g/Nc5SMUbDRwu+qW7f1njKYUoylvxVfzlUyd2NIZw5Hos7ev4uE3zanZjYYw5IujT/Ur
         xUyXxCA5NCDuDPSTHMU/xwIJD/uC3NxOb3RlrRKm5HSlBCoTL1QazXJWlfaUisR1tDs8
         IawMYKbyS4rFCus195FVW182jmKuaCih5lMUOPkwJeV2i8hUBlGNmZIq5rrX4u6rsc0z
         Yh2P4JiQfvh4mU0Of3Rm6lm0hEDbXPhdBkOamHwrI/j/S6KUzcm8vAOrf88USUCxqHhG
         td8Q==
X-Gm-Message-State: APjAAAXRRk58hcobHDXG44xTMXTttVuCXE3hhs/FwMmImZjvuEFX0WqL
        ScxdsGsXcrqC0t7+ZMocmBs5xw==
X-Google-Smtp-Source: APXvYqzZ5pV6YYidhbVbRQyCUAxGdDK/nNYXeLsqHId9g+qDN5mjueOIyUbiZxacEJ0kGmEEcIhbTg==
X-Received: by 2002:a5d:548e:: with SMTP id h14mr8193996wrv.76.1561724810187;
        Fri, 28 Jun 2019 05:26:50 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id o11sm2459507wmh.37.2019.06.28.05.26.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 05:26:49 -0700 (PDT)
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: Fix completed descriptors count
To:     Sricharan R <sricharan@codeaurora.org>, agross@kernel.org,
        david.brown@linaro.org, dan.j.williams@intel.com, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     stable@vger.kernel.org
References: <1561723786-22500-1-git-send-email-sricharan@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6cc5080c-e72f-c97c-715c-9169508cf2d9@linaro.org>
Date:   Fri, 28 Jun 2019 13:26:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1561723786-22500-1-git-send-email-sricharan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 28/06/2019 13:09, Sricharan R wrote:
> One space is left unused in circular FIFO to differentiate
> 'full' and 'empty' cases. So take that in to account while
> counting for the descriptors completed.
> 
> Fixes the issue reported here,
> 	https://lkml.org/lkml/2019/6/18/669
> 
> Cc: stable@vger.kernel.org
> Reported-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>

Thanks for the patch, It works for me now!

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini

> ---
>   drivers/dma/qcom/bam_dma.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 4b43844..8e90a40 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -799,6 +799,9 @@ static u32 process_channel_irqs(struct bam_device *bdev)
>   		/* Number of bytes available to read */
>   		avail = CIRC_CNT(offset, bchan->head, MAX_DESCRIPTORS + 1);
>   
> +		if (offset < bchan->head)
> +			avail--;
> +
>   		list_for_each_entry_safe(async_desc, tmp,
>   					 &bchan->desc_list, desc_node) {
>   			/* Not enough data to read */
> 
