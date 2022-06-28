Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D386755DB9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344535AbiF1J7Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 05:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245187AbiF1J7L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 05:59:11 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 677282E9E3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 02:59:10 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id r20so16908851wra.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 02:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4TnV2KxyP2DV/2uDmzCbdYwAkBIDFDITNxmSAAlof8Y=;
        b=ORXopAl49yqtPpSQXoB46D2aTOgSJnlpOKwh5Xf257b9HiSYJHzyPj5T0eWCB0dAYd
         Nk+lIlx0wZFK262bf0RpR2W7aKgZCzHoUWyc/k2hGdEzjPyLtfXIXAs6KC30P9lHuX7n
         8WMzdDMk3Ff4QGpr+FjaWHHXWK4ayKffTR0EqS5ay725cWWnR1nUrOWy1UsdmVXKxOj1
         4ZxYOv2+XZ0ECFomyDdh+uixrRkdSMlwH/fm5T9xtQCj0Bxm/5Pfa8df39SJi9mtSqUa
         UrvsOuOiUTePwYcCXl0KiMcbnG/ZsVeZT+hIFoLEGS7VdwpInYngC+U3kzH/OBTKCdDl
         YkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4TnV2KxyP2DV/2uDmzCbdYwAkBIDFDITNxmSAAlof8Y=;
        b=e/0mZ3OpsWkrVjRJd4RYDjcWQg31HzBNK9j0znhebY/8MvNOTxAZwKsXlGjogabHHc
         h7sDPB36Pxe/I7JDj8AfI2SVcRipSP2KLX5C/JxRKE8IvAe62CoqG3YBLYlTZezX2L/T
         SDpxUGyEK5t/qVPcjx2R10EgLSFZYii+7I/CrcafeIvyFqxJCcLQEGEPGudZpNuJ4qh2
         QGfApPj+rcR1wOb0bad6VKY1slAQ4W1ni6W8URzDqAuNeL3duJrq1BGiQF7xiotYBeO1
         80di4HrjsWgng1xaWu4s2kfQ+AWIcHb07gSsRXhhPg0ExaPfo8IK6pj1+pzFtLSa9ae7
         Bs8g==
X-Gm-Message-State: AJIora+efu/8d19X4qBYwssCv0bJcUQ1bc7iFY3xV/6YRdklQOQ+E6qK
        JqC/ODlcCg2S9fiiUsyUsUURQYV0cfe1rg==
X-Google-Smtp-Source: AGRyM1tH7b0VprI98Ze11HXVcKyr6F+lCSIzw+gTZdn9IA/63fU8SqeINP07L31cByN7A7UDLTymxg==
X-Received: by 2002:a5d:59a8:0:b0:21d:1bdd:44b9 with SMTP id p8-20020a5d59a8000000b0021d1bdd44b9mr3417839wrr.7.1656410348977;
        Tue, 28 Jun 2022 02:59:08 -0700 (PDT)
Received: from [192.168.0.252] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d9-20020a05600c3ac900b003a03be22f9fsm17712354wms.18.2022.06.28.02.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 02:59:08 -0700 (PDT)
Message-ID: <7580e511-169e-4b9e-061d-1ef6893dcb72@linaro.org>
Date:   Tue, 28 Jun 2022 11:59:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] soc: qcom: cmd-db: replace strscpy_pad() with
 strncpy()
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220627171816.v2.1.Ie7b480cd99e2c13319220cbc108caf2bcd41286b@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220627171816.v2.1.Ie7b480cd99e2c13319220cbc108caf2bcd41286b@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/06/2022 02:18, Douglas Anderson wrote:
> Commit ac0126a01735 ("soc: qcom: cmd-db: replace strncpy() with
> strscpy_pad()") breaks booting on my sc7280-herobrine-herobrine
> device. From printouts I see that at bootup the function is called
> with an id of "lnbclka2" which is 8 bytes big.
> 
> Previously all 8 bytes of this string were copied to the
> destination. Now only 7 bytes will be copied since strscpy_pad() saves
> a byte for '\0' termination.
> 
> We don't need the '\0' termination in the destination. Let's go back
> to strncpy(). According to the warning:
>   If a caller is using non-NUL-terminated strings, strncpy() can still
>   be used, but destinations should be marked with the __nonstring
>   attribute to avoid future compiler warnings.
> ...so we'll do that.
> 
> While we're at it, let's change the query array to use
> "sizeof(ent->id)" so it can't possibly go out of sync with our later
> copy.
> 
> Fixes: ac0126a01735 ("soc: qcom: cmd-db: replace strncpy() with strscpy_pad()")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> 
> ---
> 
> Changes in v2:
> - Size array with "sizeof(ent->id)"
> 
>  drivers/soc/qcom/cmd-db.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
> index c5137c25d819..ffd2660b2890 100644
> --- a/drivers/soc/qcom/cmd-db.c
> +++ b/drivers/soc/qcom/cmd-db.c
> @@ -141,14 +141,14 @@ static int cmd_db_get_header(const char *id, const struct entry_header **eh,
>  	const struct rsc_hdr *rsc_hdr;
>  	const struct entry_header *ent;
>  	int ret, i, j;
> -	u8 query[8];
> +	u8 query[sizeof(ent->id)] __nonstring;
>  
>  	ret = cmd_db_ready();
>  	if (ret)
>  		return ret;
>  
>  	/* Pad out query string to same length as in DB */

I would find useful a comment that length of the ID can be equal to
sizeof(query)... so no one will need to increment the counter of wasted
time on this. :)

But beside that, thanks for the fix:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> -	strscpy_pad(query, id, sizeof(query));
> +	strncpy(query, id, sizeof(query));
>  
>  	for (i = 0; i < MAX_SLV_ID; i++) {
>  		rsc_hdr = &cmd_db_header->header[i];


Best regards,
Krzysztof
