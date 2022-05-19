Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B678352DE73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 22:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244389AbiESUdK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 16:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244581AbiESUdI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 16:33:08 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86957A44E
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 13:33:06 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id y66so1777440oia.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 13:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C4G90XvF1AnzZSzIPU4XdotIJK+4C8mTaUfSHQ0bvc0=;
        b=zgz+Ca7AVevw/2dCflWBCbWT/iob9LjDx5sk9EcbWRz4kJNjuB9XW5EtxncNXLSABr
         C39DQrOfPpZ6JhDOALmm189y+/38JIY0esjrwhoDDuUJk0t/EpVLkWv6BXIXj6/GoM7H
         N6vhNUiwLn+NfuqWAKV+pssAx/VCMmkSTJvKK1S7VY2kjvWwYf4ZLCbEBQ10HzasSyjj
         f9FjDQdiWpiN4LZdLPjyEy4Epj4E/N8+2QbZdf57okiCKnHMwZDM1wuTW0I4Wmkv4RNM
         EnpDq8JcRJsFpE8leAvoCWE/DaEnu0TOlDUUbKQpJQzAQOY3vzYqUaOe++kLZi3MAhSs
         Brnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C4G90XvF1AnzZSzIPU4XdotIJK+4C8mTaUfSHQ0bvc0=;
        b=U4QegmUHScO5M1Z+3O4qFaYY7XEcaZxBDncaU4EG73wba0P9DqwRbP+rqH2ydf8Drs
         jmy2ZBJt8zvT6xhhczE1sTs4tnYqQrVaxfxb9G9tAUcOitSEh/0RygpWvX6X+GZ3YY7B
         B7cywG06dOSC/r7jcpH3gWPibUrdM5ahQBCvPDB/zU3A2PDd0O59uPgs3Ic4L5RaveuX
         JcvVasDJ17ffkVfyasL/LxhXXG90MQ0KG7BY447Rc/iMVkeiwWawnDT/GIDAPHpIFHuv
         +sI3sxOcVvzkthd3ueMxp+k8WFDEf1W75CB7OhmdG2wM+azSL4wve+fx5EjZGkXgL9gL
         lawg==
X-Gm-Message-State: AOAM531mkCtgzipj4lAkdXLo0d+Ga9ZUyob+hOy694TNtuxl8rgyg+V4
        HBCbZehsq4vH64fdDWd+rH7TnQ==
X-Google-Smtp-Source: ABdhPJyKEmocBdoNc0jjOWKQy1s3lNBUt/Ix7asHjn21UTv1kYd3ud/imXmL3pXihlLY/2SDomMbKg==
X-Received: by 2002:a05:6808:1314:b0:326:e438:d8cd with SMTP id y20-20020a056808131400b00326e438d8cdmr3966295oiv.228.1652992386100;
        Thu, 19 May 2022 13:33:06 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m12-20020a4a390c000000b0035eb4e5a6cbsm144514ooa.33.2022.05.19.13.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 13:33:05 -0700 (PDT)
Date:   Thu, 19 May 2022 13:35:25 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <quic_sibis@quicinc.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, mka@chromium.org
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: sc7280: Add proxy interconnect
 requirements for modem
Message-ID: <YoaqDcB6wkd4zOWR@ripper>
References: <1652978825-5304-1-git-send-email-quic_sibis@quicinc.com>
 <1652978825-5304-2-git-send-email-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652978825-5304-2-git-send-email-quic_sibis@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 19 May 09:47 PDT 2022, Sibi Sankar wrote:

> Add interconnects that are required to be proxy voted upon during modem
> bootup on SC7280 SoCs.

This looks reasonable, but how come the vote is only for DDR frequency?
What about the buses between modem and ddr?

Regards,
Bjorn

> 
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> index 9f4a9c263c35..91aad86cc708 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> @@ -88,6 +88,7 @@
>  	status = "okay";
>  	compatible = "qcom,sc7280-mss-pil";
>  	iommus = <&apps_smmu 0x124 0x0>, <&apps_smmu 0x488 0x7>;
> +	interconnects = <&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>;
>  	memory-region = <&mba_mem>, <&mpss_mem>;
>  };
>  
> -- 
> 2.7.4
> 
