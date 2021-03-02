Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686AD32A12F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Mar 2021 14:45:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1835220AbhCBEuT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 23:50:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349056AbhCBCLW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 21:11:22 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF5E6C061226
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 18:05:13 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id a7so20038073iok.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 18:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aHPldpe0SiR7sw8hK4soQ68kZblrZ1w3Ylxgm2V+BwM=;
        b=a6zRHktzbocHLE4UViU75DEfqkz5Q/iVvw3onXzt7SEfsaeXciR2lZ+a6vYp0nEe63
         L4GLeBVICjWRT81J2ktA731yPNVxKZrqqkOis2JQtBijydOK3LiAwfZXJqbyTsrLSPVf
         jZayJOS5pvPH6fFfQYTUSXH50DWKjzUL5EE1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aHPldpe0SiR7sw8hK4soQ68kZblrZ1w3Ylxgm2V+BwM=;
        b=N3RaKORaurKhBoRsz1lNgsynBPyK7Dr1RsuCI/DeqBuRWKNOXpPwfG/SWu+MDC0yg2
         68R/Vs1psu0P4q9EVfqylq/1d+ZQT7yvnnrwSaH6YAgAhdsVJFbv3YrWcwDFMf1FwLBs
         ddPpOSJcPBfh+6BYRZtcW9Loq0pOmXnUtDH8mDyknf++MR82y09zvAfWVspT7D2AO1E/
         zTLDsVYdAcFEp9mzl6zmxkynNNekYG5DLnlbDM1fmUTo3cKBQ611ctOlFttlBqBQxAa0
         vi9eAvPmK3SY8ObPVmgjHY4DQH8jMzG8s4Y6COba37VrWscAEZz8+S7Cm4cTGTrwUVRI
         KynA==
X-Gm-Message-State: AOAM532d7mSRuCVf3CwYRQ5fYQVs53Y5uplWtn9TtdQI6io5M+/AlzDa
        dYAFv3v4czQmWHQeRwpv4mI1vw==
X-Google-Smtp-Source: ABdhPJz5jUsHdnTFltQAarSJGMmnUhGxk7+zQ4ux/wKqpg5BGM/AjQx8Z418NkxEkBdNRuVxjyoFOA==
X-Received: by 2002:a5d:8149:: with SMTP id f9mr16624787ioo.191.1614650713273;
        Mon, 01 Mar 2021 18:05:13 -0800 (PST)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id y3sm1213633iot.15.2021.03.01.18.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Mar 2021 18:05:12 -0800 (PST)
Subject: Re: [PATCH v1 3/7] net: ipa: gsi: Avoid some writes during irq setup
 for older IPA
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, elder@kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, davem@davemloft.net,
        kuba@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, phone-devel@vger.kernel.org
References: <20210211175015.200772-1-angelogioacchino.delregno@somainline.org>
 <20210211175015.200772-4-angelogioacchino.delregno@somainline.org>
From:   Alex Elder <elder@ieee.org>
Message-ID: <6f2ab23f-e4ab-2de8-1991-6a0435cfba65@ieee.org>
Date:   Mon, 1 Mar 2021 20:05:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210211175015.200772-4-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/11/21 11:50 AM, AngeloGioacchino Del Regno wrote:
> On some IPA versions (v3.1 and older), writing to registers
> GSI_INTER_EE_SRC_CH_IRQ_OFFSET and GSI_INTER_EE_SRC_EV_CH_IRQ_OFFSET
> will generate a fault and the SoC will lockup.
> 
> Avoid clearing CH and EV_CH interrupts on GSI probe to fix this bad
> behavior: we are anyway not going to get spurious interrupts.

I think the reason for this might be that these registers
are located at a different offset for IPA v3.1.

I'd rather get it right and actively disable these
interrupts rather than assume they won't fire.

Also...  you included an extra blank line; avoid that.

					-Alex

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/net/ipa/gsi.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ipa/gsi.c b/drivers/net/ipa/gsi.c
> index 6315336b3ca8..b5460cbb085c 100644
> --- a/drivers/net/ipa/gsi.c
> +++ b/drivers/net/ipa/gsi.c
> @@ -207,11 +207,14 @@ static void gsi_irq_setup(struct gsi *gsi)
>  	iowrite32(0, gsi->virt + GSI_CNTXT_SRC_IEOB_IRQ_MSK_OFFSET);
>  
>  	/* Reverse the offset adjustment for inter-EE register offsets */
> -	adjust = gsi->version < IPA_VERSION_4_5 ? 0 : GSI_EE_REG_ADJUST;
> -	iowrite32(0, gsi->virt + adjust + GSI_INTER_EE_SRC_CH_IRQ_OFFSET);
> -	iowrite32(0, gsi->virt + adjust + GSI_INTER_EE_SRC_EV_CH_IRQ_OFFSET);
> +	if (gsi->version > IPA_VERSION_3_1) {
> +		adjust = gsi->version < IPA_VERSION_4_5 ? 0 : GSI_EE_REG_ADJUST;
> +		iowrite32(0, gsi->virt + adjust + GSI_INTER_EE_SRC_CH_IRQ_OFFSET);
> +		iowrite32(0, gsi->virt + adjust + GSI_INTER_EE_SRC_EV_CH_IRQ_OFFSET);
> +	}
>  
>  	iowrite32(0, gsi->virt + GSI_CNTXT_GSI_IRQ_EN_OFFSET);
> +
>  }
>  
>  /* Turn off all GSI interrupts when we're all done */
> 

