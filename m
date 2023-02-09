Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB5C691019
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 19:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbjBISMX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 13:12:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjBISMW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 13:12:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3064F6A31A
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 10:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675966278;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LZy+J+rcrOSfXTsdoDz1dXzhYCRm1QK50PABySNIrxc=;
        b=RSEjxD6QUTfnwL/fVwbKj1ipmjmnW5lco7nEAcOP5IoTOGj61LmnW/PT6QHr7Q3Du60JOD
        tbrhzWSV/ZD+X0F76x/dsRciijLP84wP2m8QtnCiBahpAytKVKmpn6X5eheNp+C+3L3Q8W
        HfVe/QcjqTlfjGxWakJg7I3oRRqE22E=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-9PbVCqfyM9aMRq-8AYLdyw-1; Thu, 09 Feb 2023 13:11:17 -0500
X-MC-Unique: 9PbVCqfyM9aMRq-8AYLdyw-1
Received: by mail-qv1-f70.google.com with SMTP id ly4-20020a0562145c0400b0054d2629a759so1683281qvb.16
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 10:11:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZy+J+rcrOSfXTsdoDz1dXzhYCRm1QK50PABySNIrxc=;
        b=bQaF5wqauNyLyHu/qmevOa7Gl3iSKglTwzMEkMcPtgH0BU5hZlxOu2i4l2NqXlVJin
         2Yc+ErE2sTz2+SdNPsbBR9nGzZ84Y4cUx0w8FtAyjxQLaV5OD4lvEuBdp6/RtuLBlGxx
         LZIf6dR1G9mNyoyae/2AtfK87OOyLHEUEkQFkGdfYYoKrYz7u0nGU4M3Clup9YNMj/s/
         pDRUZPo1N7CDz1Vz38NaiqzbE71tSTG9psLddllifCiwEWmAFb9106zBgM7Tn7JUB/pB
         2Dm9hKVhXKgNvxE1SnDHg07Htpq2iJ8vrqUQegL9Ul5daK3LozL1vySdD3nc5Qrkarwq
         4vZw==
X-Gm-Message-State: AO0yUKXeZQ864gQvytKlWzOvteuB/ITIYc/ybWqayNhGYxu59WLWgIe9
        uFU/jSVsuXfdQyfzxA7kZ+UX2HjAHFWvnrVSVkEOeKB+HtUV4HaAf6vsgGmJk1TLw6ZkMlZHACp
        cyL5rIgwlf3nYeIFf66UmF3SVgQ==
X-Received: by 2002:a05:622a:349:b0:3b8:58d0:b4e4 with SMTP id r9-20020a05622a034900b003b858d0b4e4mr21727863qtw.33.1675966276649;
        Thu, 09 Feb 2023 10:11:16 -0800 (PST)
X-Google-Smtp-Source: AK7set+OtThhRwwq7+xgc2rtsbWPWeQFKBLmPTMOot/fBAxyKrqK+AJlVuJgSX3ij9R9UMJ/37TyrQ==
X-Received: by 2002:a05:622a:349:b0:3b8:58d0:b4e4 with SMTP id r9-20020a05622a034900b003b858d0b4e4mr21727825qtw.33.1675966276384;
        Thu, 09 Feb 2023 10:11:16 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id ca16-20020a05622a1f1000b003a7e38055c9sm1698977qtb.63.2023.02.09.10.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:11:15 -0800 (PST)
Date:   Thu, 9 Feb 2023 13:11:15 -0500
From:   Eric Chanudet <echanude@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Shawn Guo <shawnguo@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [RESEND PATCH] arm64: defconfig: enable drivers required by the
 Qualcomm SA8775P platform
Message-ID: <20230209181115.t5lhtdewe2k2zh7i@echanude>
References: <20230209103531.469809-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209103531.469809-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 09, 2023 at 11:35:31AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Enable the pinctrl, GCC clock and interconnect drivers in order to allow
> booting SA8775P boards. The drivers need to be built-in for QUPv3 and
> subsequently UART console to work.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Resending with tags collected and this time Cc'ing linux-arm-msm
> 
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Eric Chanudet <echanude@redhat.com>

> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 695c4e44d241..8e0ce9915f01 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -566,6 +566,7 @@ CONFIG_PINCTRL_QCM2290=y
>  CONFIG_PINCTRL_QCS404=y
>  CONFIG_PINCTRL_QDF2XXX=y
>  CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
> +CONFIG_PINCTRL_SA8775P=y
>  CONFIG_PINCTRL_SC7180=y
>  CONFIG_PINCTRL_SC7280=y
>  CONFIG_PINCTRL_SC8180X=y
> @@ -1378,6 +1379,7 @@ CONFIG_INTERCONNECT_QCOM_MSM8916=m
>  CONFIG_INTERCONNECT_QCOM_MSM8996=m
>  CONFIG_INTERCONNECT_QCOM_OSM_L3=m
>  CONFIG_INTERCONNECT_QCOM_QCS404=m
> +CONFIG_INTERCONNECT_QCOM_SA8775P=y
>  CONFIG_INTERCONNECT_QCOM_SC7180=y
>  CONFIG_INTERCONNECT_QCOM_SC7280=y
>  CONFIG_INTERCONNECT_QCOM_SC8180X=y
> -- 
> 2.37.2
> 

-- 
Eric Chanudet

