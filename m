Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFBB233684D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 01:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbhCKADr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 19:03:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbhCKADd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 19:03:33 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC80DC061761
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 16:03:32 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id u62so5389048oib.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 16:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MqQxCHeDZzA0xjKB6t0uijMIqsuaZ0QygKTZF6eoP3M=;
        b=NXamsKAQUqB79kgFV5ijJNzR+eiRCX8NhZsktIT/wau3F0JuKgr90bLIgl3oZeZc70
         HmTs3WOPVNlbIYyHHt2uxSWe/iWrSkfVcyH757KsxZXbRO+si9DWRTmwueiPQKan5Bzx
         iGw9KZt3sKrHgA8HEeL+iousAW6DmXv1AnegwLTlOGBtqeBlFwcFutdjE6eJ0bbYgxvD
         8uMfy3yFiSuhMzs7V/Thm3zYByfirgztVGHQeJmIbDUUURXqoL10YyT/AD0fHNTRw4uQ
         1Ox4mYmfiY1yEob1pC+94NRwFIv49Op4BZV8lnujHAP/BHoU+mK5ffGbd3pAojAp/mc9
         6I6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MqQxCHeDZzA0xjKB6t0uijMIqsuaZ0QygKTZF6eoP3M=;
        b=XXlA5yfzphR9QYCrnOrOeMWP6eAGi42ITXwUqaACz/HBWO3pBNtFOGPNWxwJQjr8+I
         l3FQsk2cfAcTbCgTt3DAbWv/Wh1llUMMMxx24RKwpQ32ZCt3waAMWRxC8z9pFUykEwL+
         U2pK7fO8QB4gyvjD4MzyJjoOa99oqwJJIubcJm90rMTIndNCUF+bERxSYHoG/t4pBc8j
         TqF2F/TO6S/+/76UjzDDrocitQBueiQ6nCCRrz9ncFVJEClC9jssv2ukwMdIa28amrpH
         GzbeTFm+6+EvRTqog/AAK/2cuYOTewU1IRB6iypZ4SOi2dKOHD50CnAQM9TkF5yos9ae
         7JbQ==
X-Gm-Message-State: AOAM5324q9A35Q7R1nXxzfpUp41ETZkIU7sLV1SR5gVqwU2RrAT+qHU7
        ZqiB80DYNSx7SEZ4NjQGekNB2A==
X-Google-Smtp-Source: ABdhPJyapkzWhfDKQ2HIArCWRyoK3W8H5vkuTbKNebfIJUsVO1F5uteJQ4Qt3NlrDZ0mZ92M24b8rA==
X-Received: by 2002:aca:f50f:: with SMTP id t15mr4275634oih.53.1615421011975;
        Wed, 10 Mar 2021 16:03:31 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n1sm209854oog.31.2021.03.10.16.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 16:03:31 -0800 (PST)
Date:   Wed, 10 Mar 2021 18:03:29 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: pmic-mpp: Add missing dt-bindings mpp
 function defs
Message-ID: <YEleUVnFmrBYrAe2@builder.lan>
References: <20210225213605.117201-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225213605.117201-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 25 Feb 15:36 CST 2021, Konrad Dybcio wrote:

> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> The pinctrl-spmi-mpp driver supports setting more mpp functions
> than the ones defined in the dt-bindings header, specifically,
> digital, analog and sink.
> 
> To follow the current way of specifying the function config
> in Device-Tree, add the missing three definitions in the
> appropriate dt-bindings header as:
> GPIO_MPP_FUNC_{DIGITAL,ANALOG,SINK}.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  include/dt-bindings/pinctrl/qcom,pmic-mpp.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/dt-bindings/pinctrl/qcom,pmic-mpp.h b/include/dt-bindings/pinctrl/qcom,pmic-mpp.h
> index 32e66ee7e830..3cdca7ee1b3f 100644
> --- a/include/dt-bindings/pinctrl/qcom,pmic-mpp.h
> +++ b/include/dt-bindings/pinctrl/qcom,pmic-mpp.h
> @@ -98,6 +98,9 @@
>  /* To be used with "function" */
>  #define PMIC_MPP_FUNC_NORMAL		"normal"
>  #define PMIC_MPP_FUNC_PAIRED		"paired"
> +#define PMIC_MPP_FUNC_DIGITAL		"digital"
> +#define PMIC_MPP_FUNC_ANALOG		"analog"
> +#define PMIC_MPP_FUNC_SINK		"sink"
>  #define PMIC_MPP_FUNC_DTEST1		"dtest1"
>  #define PMIC_MPP_FUNC_DTEST2		"dtest2"
>  #define PMIC_MPP_FUNC_DTEST3		"dtest3"
> -- 
> 2.30.1
> 
