Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 465895B5D68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 17:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbiILPkx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 11:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbiILPku (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 11:40:50 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 284E11D310
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 08:40:49 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id h194so5474697iof.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 08:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=HD1pje7uAyqTJmf9TqehH0s69rt+EfZmyHnD9wt/d2I=;
        b=V3yduLh1YwK21pBSY0ZK7M9Ok1YbCQd0s36kmKX3QP42siYUrvZiXeeaIlVRDm1/fX
         qn1RyzWsPvybXTKh/v69NfQ5yEg/WqNW0cVhqr0ZVGTmwvY5oQ/uw57wyE9z0LyrcifH
         deEmjN35FFfB8EwJhvFKHiFx7+sNc5uu6wodA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=HD1pje7uAyqTJmf9TqehH0s69rt+EfZmyHnD9wt/d2I=;
        b=ymRSsiltJnD9AqTf5qGHz0AdCSzaCp4Z+8GEDJ0FwG7HXzTYFdjB2u/BLo9Oq51mG0
         jAgJPWcu1wZLf/KqdYv+P4XeSci0ID1IK92pLSbCMbgbIICtuwFwrQw39vIAg+btRP31
         zlf59SH/B9Z0LxSQr6zreUJbWxehl2Nglw741UjBufjZf1U7rh5+vyQ//GyQQ5DOXzct
         /lGHGmsynh89KMny8ZcHFC3w/UZ4WS7MIImpO6KGnkkIqhCZ3XdyZemidaTR6vzbsygj
         4NKEuSjlowmHDdqJd9QOAZY8NpGXsyy0TYWALPk5kXDbNlvtuPffGUxxceqxiWW7h9XG
         Qc6g==
X-Gm-Message-State: ACgBeo3VYMPDXrb22/jEg8EEyr0jAJYXUTemP2Ja7Fjp6wzLYukfZyrU
        2Gzb5DcuvlcoDttOqb+oUNGLDA==
X-Google-Smtp-Source: AA6agR4vhLXY91IS1mViT6gMHq6Yknmtdhm/CbokX55kVMuNU7LTaCYNWImlZ+ZY+iLhXhPEwuE5oA==
X-Received: by 2002:a05:6638:12c1:b0:342:a36a:b2b1 with SMTP id v1-20020a05663812c100b00342a36ab2b1mr14616430jas.275.1662997248486;
        Mon, 12 Sep 2022 08:40:48 -0700 (PDT)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id g10-20020a056602150a00b0069e1bcbddaesm4504602iow.16.2022.09.12.08.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 08:40:47 -0700 (PDT)
Date:   Mon, 12 Sep 2022 15:40:45 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <quic_rjendra@quicinc.com>
Cc:     andersson@kernel.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, johan+linaro@kernel.org,
        quic_kriskura@quicinc.com, dianders@chromium.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH 1/3] clk: qcom: gdsc: Fix the handling of PWRSTS_RET
 support
Message-ID: <Yx9S/TGi2q+nozZo@google.com>
References: <20220901101756.28164-1-quic_rjendra@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220901101756.28164-1-quic_rjendra@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 01, 2022 at 03:47:54PM +0530, Rajendra Nayak wrote:
> GDSCs cannot be transitioned into a Retention state in SW.
> When either the RETAIN_MEM bit, or both the RETAIN_MEM and
> RETAIN_PERIPH bits are set, and the GDSC is left ON, the HW
> takes care of retaining the memory/logic for the domain when
> the parent domain transitions to low power state.
> The existing logic handling the PWRSTS_RET seems to set the
> RETAIN_MEM/RETAIN_PERIPH bits but then explicitly turns the
> GDSC OFF as part of _gdsc_disable(). Fix that by leaving the
> GDSC in ON state.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
> There are a few existing users of PWRSTS_RET and I am not
> sure if they would be impacted with this change
> 
> 1. mdss_gdsc in mmcc-msm8974.c, I am expecting that the
> gdsc is actually transitioning to OFF and might be left
> ON as part of this change, atleast till we hit system wide
> low power state.
> If we really leak more power because of this
> change, the right thing to do would be to update .pwrsts for
> mdss_gdsc to PWRSTS_OFF_ON instead of PWRSTS_RET_ON
> I dont have a msm8974 hardware, so if anyone who has can report
> any issues I can take a look further on how to fix it.
> 
> 2. gpu_gx_gdsc in gpucc-msm8998.c and
>    gpu_gx_gdsc in gpucc-sdm660.c
> Both of these seem to add support for 3 power state
> OFF, RET and ON, however I dont see any logic in gdsc
> driver to handle 3 different power states.
> So I am expecting that these are infact just transitioning
> between ON and OFF and RET state is never really used.
> The ideal fix for them would be to just update their resp.
> .pwrsts to PWRSTS_OFF_ON only.

So far nobody has reported back on this. What are the next steps?

If we want to confirm the actual behavior on those platforms
before landing this maybe you or Bjorn could try to locate
someone within QC with access to such systems.

>  drivers/clk/qcom/gdsc.c | 10 ++++++++++
>  drivers/clk/qcom/gdsc.h |  5 +++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index d3244006c661..ccf63771e852 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -368,6 +368,16 @@ static int _gdsc_disable(struct gdsc *sc)
>  	if (sc->pwrsts & PWRSTS_OFF)
>  		gdsc_clear_mem_on(sc);
>  
> +	/*
> +	 * If the GDSC supports only a Retention state, apart from ON,
> +	 * leave it in ON state.
> +	 * There is no SW control to transition the GDSC into
> +	 * Retention state. This happens in HW when the parent
> +	 * domain goes down to a Low power state
> +	 */
> +	if (sc->pwrsts == PWRSTS_RET_ON)
> +		return 0;
> +
>  	ret = gdsc_toggle_logic(sc, GDSC_OFF);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index 5de48c9439b2..981a12c8502d 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -49,6 +49,11 @@ struct gdsc {
>  	const u8			pwrsts;
>  /* Powerdomain allowable state bitfields */
>  #define PWRSTS_OFF		BIT(0)
> +/*
> + * There is no SW control to transition a GDSC into
> + * PWRSTS_RET. This happens in HW when the parent
> + * domain goes down to a low power state
> + */
>  #define PWRSTS_RET		BIT(1)
>  #define PWRSTS_ON		BIT(2)
>  #define PWRSTS_OFF_ON		(PWRSTS_OFF | PWRSTS_ON)
> -- 
> 2.17.1
> 
