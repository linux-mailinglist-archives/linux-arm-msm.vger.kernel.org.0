Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE45B5626E5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 01:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbiF3XLT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 19:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232016AbiF3XLP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 19:11:15 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE0E65926A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 16:11:09 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id m24-20020a0568301e7800b00616b5c114d4so532856otr.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 16:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/9jdD7+1+i1Lm60svXWsJgxbEFp2/Oeat9F5av8m7uY=;
        b=ynbe5POgPeLGuOGH8qwfK+MAkOMQKMg/sOvFUIv2Lp8h7jwzaq3Iz9Q7XwCDuppnN2
         tpYB14FFIzI4i6s90p8TCDyoGEdNHcKmwroQZQYEyC/AlK/+f8SClpsJe6Bxm28Jytn1
         UgcHN5pqFnUtP44Pwk3l7LfPteUOYjgIjre4UZPNOKUBPhNEy4nKXNCcKvJP+oX9cUjR
         DJYRWGwlKU8BIc0GGrWF9ztt+54fHSbBcIzeOkMwZBi2iCuWQB3jjMRflT2o/C4KIjDc
         /1HwInPB+slMTrIH2zr9z9OwUwcr4uAhK7KcbuvvhgyysIkv7OGiPjgk6bKbpkR0ajEQ
         TscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/9jdD7+1+i1Lm60svXWsJgxbEFp2/Oeat9F5av8m7uY=;
        b=pZiIDW8TkUM/2IFncDtelzoL4qEZCmgqm0Eq+dXESp1TsrF6ST1Y6EkQId7ZWMoygk
         8GLX9UeQD3uMaC6cCnwn0jh4Gri33yuwAbjdIRFRLmPKqlmPZS39fHY6REflbvet62ef
         y+pVFB7lr9kK4v14MFNMbpvLqvpdl0u53GIGwaqoAUtQFL6HScp2Lg86K199Wn8UWjxr
         AeaP1f7GXg223DvkH/YGKXOMS2jYR7qOzLSnBoBKq7Q9wf8zly9lHdRLV405XxbTKmPc
         o09qQB3qD08rqBygWiQwt0w5/BlkmKQxZOSbzHUf9U0mhHYTbXEv81rn8+23fhVX4oPI
         z1SA==
X-Gm-Message-State: AJIora9vvojlsg/hNNmWGBK12QGsbF5wiOng4PFXnfpADEzJCgruEOaT
        Gh8v9MWI6+D2kGogVdXrPDHl8A==
X-Google-Smtp-Source: AGRyM1vBfSGHeJKr39L7bBI0Wp641fmclQNLEE0MJMll9iNLLlO+JE+GUgn5SMqOlb0/rNJ9hdKpRw==
X-Received: by 2002:a9d:754a:0:b0:616:bd96:a37e with SMTP id b10-20020a9d754a000000b00616bd96a37emr5265514otl.325.1656630668992;
        Thu, 30 Jun 2022 16:11:08 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n2-20020a4aa7c2000000b00420c4e021e8sm11439551oom.38.2022.06.30.16.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 16:11:08 -0700 (PDT)
Date:   Thu, 30 Jun 2022 18:11:06 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Caleb Connolly <caleb@connolly.tech>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/3] input: add event codes for user programmable switch
 events
Message-ID: <Yr4timTL6mBlik0m@builder.lan>
References: <20220516142158.1612109-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516142158.1612109-1-caleb@connolly.tech>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 16 May 09:22 CDT 2022, Caleb Connolly wrote:

> Add SW_PROG{1,2,3,4} for device switches which are handled by userspace.
> 
> This can be used for devices with "generic" switches which are intended
> to be user-programmable, for example OnePlus phones contain a tri-state
> key which can be used for switching between mute/vibrate/ring, or
> programmed by the user to perform any arbitrary actions.
> 
> These are analogous to the keys KEY_PROG{1,2,3,4} found on some
> keyboards.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>

This looks reasonable to me.

Dmitry, what do you think?

Regards,
Bjorn

> ---
> See the next patch in this series for an example usecase.
> ---
>  include/linux/mod_devicetable.h        | 2 +-
>  include/uapi/linux/input-event-codes.h | 6 +++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 5da5d990ff58..45364fbeaaf7 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -326,7 +326,7 @@ struct pcmcia_device_id {
>  #define INPUT_DEVICE_ID_LED_MAX		0x0f
>  #define INPUT_DEVICE_ID_SND_MAX		0x07
>  #define INPUT_DEVICE_ID_FF_MAX		0x7f
> -#define INPUT_DEVICE_ID_SW_MAX		0x10
> +#define INPUT_DEVICE_ID_SW_MAX		0x14
>  #define INPUT_DEVICE_ID_PROP_MAX	0x1f
> 
>  #define INPUT_DEVICE_ID_MATCH_BUS	1
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index dff8e7f17074..339153886a13 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -917,7 +917,11 @@
>  #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
>  #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
>  #define SW_MACHINE_COVER	0x10  /* set = cover closed */
> -#define SW_MAX			0x10
> +#define SW_PROG1		0x11  /* set = program 1 (user defined) */
> +#define SW_PROG2		0x12  /* set = program 2 (user defined) */
> +#define SW_PROG3		0x13  /* set = program 3 (user defined) */
> +#define SW_PROG4		0x14  /* set = program 4 (user defined) */
> +#define SW_MAX			0x14
>  #define SW_CNT			(SW_MAX+1)
> 
>  /*
> --
> 2.36.1
> 
> 
