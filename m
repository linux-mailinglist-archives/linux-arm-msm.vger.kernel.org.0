Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB0742CDF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbhJMWbQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbhJMWbJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:31:09 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F6FC06178A
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 15:28:53 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id 5so1478199iov.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 15:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gz64+vYHPLtSBAm/KwcXxNftl9YbUcrmy/XqpMc+/88=;
        b=R1SpNvUaR1q6a24Tf+b31iX13OqxUaw6Q2zCnUE5ZbRAGF861QeUtDOZOe00+zVMA1
         p5D6QG436JIJC0QT7UFj+O3EozTLS+NSxKZSpRmADglMOyI1w8FIXk7fR4bQCWdXlOkX
         JRU+9PTAt9idlMc8UV1LJzYNy8Iy7hQ0n+jXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gz64+vYHPLtSBAm/KwcXxNftl9YbUcrmy/XqpMc+/88=;
        b=oaCfoyjL6pD3sxEK9kl+NmRFYjwjLxcpYTp9ZMUbflr4f+RvjDtjb33NdBkUMU3G5p
         PSQ7OXxSvpKNMuI3f481Hc+8BcDX2C7U59jufI7NHiAVjcdd0fcJqCvskMYLvS44Xwbx
         6OgE6F3G/BMwKC5y2+hppeumF4SM7ATitFSlajPx82s6q5a2lGbC9Knk6Um14Zp9QOk5
         bHTG8/ySA4bYV8c4PXqK8eHOWipipbiDESGV+fonFRcK4ka1uoOYinr7ids2auKCu96A
         8XdEP9HPA/JVJUnrdq24j6gN658Kz92gFs7sDA03Ua0MhohZU2drnjSYRFOqLRE8YLyo
         YMog==
X-Gm-Message-State: AOAM530D7LEE/tLvPNxUAJ92N1X0d2E3Fw+t+cuBMje/+CaMFUb2EUJx
        em5FnpqZpFYJTFJRPIL6UxtNNQ==
X-Google-Smtp-Source: ABdhPJzBwOyn54v3qdKEkj/dzlUwt2FlKRYDiKWJSvmjA162z1EKqXBNvOMjABmFBECrCLNjKYwGLg==
X-Received: by 2002:a6b:c309:: with SMTP id t9mr1572261iof.50.1634164132869;
        Wed, 13 Oct 2021 15:28:52 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id y7sm367526ioj.38.2021.10.13.15.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 15:28:39 -0700 (PDT)
Subject: Re: [RFC PATCH 01/17] net: ipa: Correct ipa_status_opcode enumeration
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, elder@kernel.org
Cc:     Vladimir Lypak <vladimir.lypak@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
References: <20210920030811.57273-1-sireeshkodali1@gmail.com>
 <20210920030811.57273-2-sireeshkodali1@gmail.com>
From:   Alex Elder <elder@ieee.org>
Message-ID: <132dbed4-0dc9-a198-218f-90d44deb5d03@ieee.org>
Date:   Wed, 13 Oct 2021 17:28:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210920030811.57273-2-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/19/21 10:07 PM, Sireesh Kodali wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> The values in the enumaration were defined as bitmasks (base 2 exponents of
> actual opcodes). Meanwhile, it's used not as bitmask
> ipa_endpoint_status_skip and ipa_status_formet_packet functions (compared
> directly with opcode from status packet). This commit converts these values
> to actual hardware constansts.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---
>   drivers/net/ipa/ipa_endpoint.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
> index 5528d97110d5..29227de6661f 100644
> --- a/drivers/net/ipa/ipa_endpoint.c
> +++ b/drivers/net/ipa/ipa_endpoint.c
> @@ -41,10 +41,10 @@
>   
>   /** enum ipa_status_opcode - status element opcode hardware values */
>   enum ipa_status_opcode {
> -	IPA_STATUS_OPCODE_PACKET		= 0x01,
> -	IPA_STATUS_OPCODE_DROPPED_PACKET	= 0x04,
> -	IPA_STATUS_OPCODE_SUSPENDED_PACKET	= 0x08,
> -	IPA_STATUS_OPCODE_PACKET_2ND_PASS	= 0x40,
> +	IPA_STATUS_OPCODE_PACKET		= 0,
> +	IPA_STATUS_OPCODE_DROPPED_PACKET	= 2,
> +	IPA_STATUS_OPCODE_SUSPENDED_PACKET	= 3,
> +	IPA_STATUS_OPCODE_PACKET_2ND_PASS	= 6,

I haven't looked at how these symbols are used (whether you
changed it at all), but I'm pretty sure this is wrong.

The downstream tends to define "soft" symbols that must
be mapped to their hardware equivalent values.  So for
example you might find a function ipa_pkt_status_parse()
that translates between the hardware status structure
and the abstracted "soft" status structure.  In that
function you see, for example, that hardware status
opcode 0x1 is translated to IPAHAL_PKT_STATUS_OPCODE_PACKET,
which downstream is defined to have value 0.

In many places the upstream code eliminates that layer
of indirection where possible.  So enumerated constants
are assigned specific values that match what the hardware
uses.

					-Alex

>   };
>   
>   /** enum ipa_status_exception - status element exception type */
> 

