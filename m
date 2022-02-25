Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5FF4C3F01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 08:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238129AbiBYH17 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 02:27:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238119AbiBYH17 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 02:27:59 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E250E192C92
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 23:27:27 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id y5so4010048pfe.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 23:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pZld643HuW0/07Bu4DSXyfjcKpraUhym1XI5gyrgNOk=;
        b=cuj/O6w4RHklkvb7BlBFffzE0inrWWOX0/PjEwewBYlkyZ+Xb7qs8hjGv/fNqGuRev
         tDWWhu0+q0fYtxyRueNE17EzLHL4FZn+Ei9+T7TxRzwxdaRfaNN13c/Wa/o30giD/OVW
         fhWbdFOJ+uawSxrMvwmKj7+3q0tyFg8kIa38NqZ6h81PVqeSCo4scYjutj8Ri/tbA2IY
         Wybrc7TGiwoZSkDvp6ovwMyz5Z/VUgfL7+xUF7lxRrtX9Mz6Q2cdmhU9mecBOTCluqq6
         vN8SpTGnCIp1/2KQs9lBue5k4ibFtzcdBi9x4/zOQGYsN/3OJHBCeSSj+0CsN1miXr9l
         bmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pZld643HuW0/07Bu4DSXyfjcKpraUhym1XI5gyrgNOk=;
        b=bQ79oSPza1w2jHYGc4mTVR2e+JG4+0fi4Vwq5cOIpm3/GZxCkFlQsG3qFy/CONJK30
         lZ3u6YglO1JjF2zfePYTkVjY+XQjID02Xy0LBcdJ4TQDxv6ZqoT9xrjzn1o5gpnN+hu+
         d4FnmD/bws60kjMUp7hJEHVazAGzV3N3b0mKo+h9Ts0oPoPp+3L+tUWJml9eW4txjGny
         Mn6zdBjHMAT6HiWgdtNtzgPZd8mbUOduVm2uGZnWwbMVms0nlxbUTomx24IZiUOmZ4KX
         GOPfby5mlk1Ako+NG5MBWFC9NheflAv55kWLPlVg1p/nqrwUIBPCXOv/fc7tNOsKWOYT
         EXjw==
X-Gm-Message-State: AOAM532JoXZLOpfl4LXsV2ahE3kuZYsVCNlLfV27Md4vzVnpyp+2i18U
        hV/iK1gw4c3eKO/sB+sjyvFQ
X-Google-Smtp-Source: ABdhPJwFdPzXdeQZMtrt4sI0MD3SfbXz3OURh87Nc9aslImgzfiD/6+gpcAjiZGQiadInU/X1o/0GA==
X-Received: by 2002:a05:6a00:88e:b0:4d2:4829:156c with SMTP id q14-20020a056a00088e00b004d24829156cmr6500246pfj.47.1645774047427;
        Thu, 24 Feb 2022 23:27:27 -0800 (PST)
Received: from thinkpad ([220.158.159.240])
        by smtp.gmail.com with ESMTPSA id p28-20020a056a000a1c00b004f3b355dcb1sm1959980pfh.58.2022.02.24.23.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 23:27:27 -0800 (PST)
Date:   Fri, 25 Feb 2022 12:57:21 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/5] clk: qcom: Add SDX65 APCS clock controller support
Message-ID: <20220225072721.GE274289@thinkpad>
References: <1645505785-2271-1-git-send-email-quic_rohiagar@quicinc.com>
 <1645505785-2271-6-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645505785-2271-6-git-send-email-quic_rohiagar@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 22, 2022 at 10:26:25AM +0530, Rohit Agarwal wrote:
> Update APCS Kconfig to reflect support for SDX65
> APCS clock controller.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/clk/qcom/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 5159a1d..1a641d4 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -55,13 +55,13 @@ config QCOM_CLK_APCC_MSM8996
>  	  drivers for dynamic power management.
>  
>  config QCOM_CLK_APCS_SDX55
> -	tristate "SDX55 APCS Clock Controller"
> +	tristate "SDX55 and SDX65 APCS Clock Controller"
>  	depends on QCOM_APCS_IPC || COMPILE_TEST
>  	help
> -	  Support for the APCS Clock Controller on SDX55 platform. The
> +	  Support for the APCS Clock Controller on SDX55, SDX65 platforms. The
>  	  APCS is managing the mux and divider which feeds the CPUs.
>  	  Say Y if you want to support CPU frequency scaling on devices
> -	  such as SDX55.
> +	  such as SDX55, SDX65.
>  
>  config QCOM_CLK_RPM
>  	tristate "RPM based Clock Controller"
> -- 
> 2.7.4
> 
