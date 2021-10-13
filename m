Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1FD642CE1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231668AbhJMWdF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbhJMWck (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:32:40 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72ADC061746
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 15:30:34 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id i189so1530962ioa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 15:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hHiPs/gfwiQ9sIPDSoZQFdd7zvmeZywPocUYefGGRO4=;
        b=EYSukUru/jts3OTTxhPNC/oADo3i15QFV8ecLYL4LzeEEDEnEFjcJQGESBSdymg8Du
         SWKmQKR1jdByPgPmAgciWPziRZneqeQGbYsEliNtIwypnw0aT5lY4k7Yu1hwzUrZGSJZ
         4sSSWDSNtRioWFp4HtQBhAUbTSTMgL3ZyqprA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hHiPs/gfwiQ9sIPDSoZQFdd7zvmeZywPocUYefGGRO4=;
        b=dArapLmEEhqqDppsisTe732MCJ7Uw6kQ2Gwu6DIxYoY+7p9EirmnmgXQrsKmY+ChcL
         QMmefEgNxYiXxuDlUau/ro32mDHfWgKQk+goJCK/t2teB8MqOndOKkv7UxytBWnmCKqu
         ScT4m5CstC2e2xFRbjh30AgPOuE3p7I1KFIR4z+viq8tF2CsFytp3ylRf4i34ZaOYN5V
         dTCmPzq9lRqBrIUhDoHqcIQ16KAYLYp3GOXaZVl9GL5LZZwMLeuYqe6cL6OIFZP6iAgW
         5lTxl9Gax2jP0dBO3vkQQXCa6ZqVtzv32uJoXDmUrhZIOV8jz1plfxLDL0RVxvVeAfUb
         ziSA==
X-Gm-Message-State: AOAM531gSXLP74cI9sWRq1SMcTHPcHYyVrqbiK8ZI5xHhzCo7DgfAl8J
        m4KHYPOV3JO8P2RKM5yeOUb36uxUutqBmw==
X-Google-Smtp-Source: ABdhPJyP3eGZ368Jec+j6FW+wVWTmCaXH/FAwxbXUsNkBNjH+oZ7rLECv+N4gi0h1d2+leeD9K07fQ==
X-Received: by 2002:a6b:8d4a:: with SMTP id p71mr1570545iod.16.1634164234137;
        Wed, 13 Oct 2021 15:30:34 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id s18sm350553ilo.14.2021.10.13.15.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 15:30:33 -0700 (PDT)
Subject: Re: [RFC PATCH 13/17] net: ipa: Add support for IPA v2.x in the
 driver's QMI interface
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, elder@kernel.org
Cc:     Vladimir Lypak <vladimir.lypak@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
References: <20210920030811.57273-1-sireeshkodali1@gmail.com>
 <20210920030811.57273-14-sireeshkodali1@gmail.com>
From:   Alex Elder <elder@ieee.org>
Message-ID: <d50312f8-823d-01b1-47a5-7190be93408d@ieee.org>
Date:   Wed, 13 Oct 2021 17:30:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210920030811.57273-14-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/19/21 10:08 PM, Sireesh Kodali wrote:
> On IPA v2.x, the modem doesn't send a DRIVER_INIT_COMPLETED, so we have
> to rely on the uc's IPA_UC_RESPONSE_INIT_COMPLETED to know when its
> ready. We add a function here that marks uc_ready = true. This function
> is called by ipa_uc.c when IPA_UC_RESPONSE_INIT_COMPLETED is handled.

This should use the new ipa_mem_find() interface for getting the
memory information for the ZIP region.

I don't know where the IPA_UC_RESPONSE_INIT_COMPLETED gets sent
but I presume it ends up calling ipa_qmi_signal_uc_loaded().

I think actually the DRIVER_INIT_COMPLETE message from the modem
is saying "I finished initializing the microcontroller."  And
I've wondered why there is a duplicate mechanism.  Maybe there
was a race or something.

					-Alex

> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>   drivers/net/ipa/ipa_qmi.c | 27 ++++++++++++++++++++++++++-
>   drivers/net/ipa/ipa_qmi.h | 10 ++++++++++
>   2 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ipa/ipa_qmi.c b/drivers/net/ipa/ipa_qmi.c
> index 7e2fe701cc4d..876e2a004f70 100644
> --- a/drivers/net/ipa/ipa_qmi.c
> +++ b/drivers/net/ipa/ipa_qmi.c
> @@ -68,6 +68,11 @@
>    * - The INDICATION_REGISTER request and INIT_COMPLETE indication are
>    *   optional for non-initial modem boots, and have no bearing on the
>    *   determination of when things are "ready"
> + *
> + * Note that on IPA v2.x, the modem doesn't send a DRIVER_INIT_COMPLETE
> + * request. Thus, we rely on the uc's IPA_UC_RESPONSE_INIT_COMPLETED to know
> + * when the uc is ready. The rest of the process is the same on IPA v2.x and
> + * later IPA versions
>    */
>   
>   #define IPA_HOST_SERVICE_SVC_ID		0x31
> @@ -345,7 +350,12 @@ init_modem_driver_req(struct ipa_qmi *ipa_qmi)
>   			req.hdr_proc_ctx_tbl_info.start + mem->size - 1;
>   	}
>   
> -	/* Nothing to report for the compression table (zip_tbl_info) */
> +	mem = &ipa->mem[IPA_MEM_ZIP];
> +	if (mem->size) {
> +		req.zip_tbl_info_valid = 1;
> +		req.zip_tbl_info.start = ipa->mem_offset + mem->offset;
> +		req.zip_tbl_info.end = ipa->mem_offset + mem->size - 1;
> +	}
>   
>   	mem = ipa_mem_find(ipa, IPA_MEM_V4_ROUTE_HASHED);
>   	if (mem->size) {
> @@ -525,6 +535,21 @@ int ipa_qmi_setup(struct ipa *ipa)
>   	return ret;
>   }
>   
> +/* With IPA v2 modem is not required to send DRIVER_INIT_COMPLETE request to AP.
> + * We start operation as soon as IPA_UC_RESPONSE_INIT_COMPLETED irq is triggered.
> + */
> +void ipa_qmi_signal_uc_loaded(struct ipa *ipa)
> +{
> +	struct ipa_qmi *ipa_qmi = &ipa->qmi;
> +
> +	/* This is needed only on IPA 2.x */
> +	if (ipa->version > IPA_VERSION_2_6L)
> +		return;
> +
> +	ipa_qmi->uc_ready = true;
> +	ipa_qmi_ready(ipa_qmi);
> +}
> +
>   /* Tear down IPA QMI handles */
>   void ipa_qmi_teardown(struct ipa *ipa)
>   {
> diff --git a/drivers/net/ipa/ipa_qmi.h b/drivers/net/ipa/ipa_qmi.h
> index 856ef629ccc8..4962d88b0d22 100644
> --- a/drivers/net/ipa/ipa_qmi.h
> +++ b/drivers/net/ipa/ipa_qmi.h
> @@ -55,6 +55,16 @@ struct ipa_qmi {
>    */
>   int ipa_qmi_setup(struct ipa *ipa);
>   
> +/**
> + * ipa_qmi_signal_uc_loaded() - Signal that the UC has been loaded
> + * @ipa:		IPA pointer
> + *
> + * This is called when the uc indicates that it is ready. This exists, because
> + * on IPA v2.x, the modem does not send a DRIVER_INIT_COMPLETED. Thus we have
> + * to rely on the uc's INIT_COMPLETED response to know if it was initialized
> + */
> +void ipa_qmi_signal_uc_loaded(struct ipa *ipa);
> +
>   /**
>    * ipa_qmi_teardown() - Tear down IPA QMI handles
>    * @ipa:		IPA pointer
> 

