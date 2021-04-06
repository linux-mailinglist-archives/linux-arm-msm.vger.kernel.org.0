Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48727355699
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 16:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344985AbhDFO1Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 10:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244717AbhDFO1P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 10:27:15 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA11FC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Apr 2021 07:27:07 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id d12so23053416lfv.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Apr 2021 07:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WbKWpU/Aywh09w96vghqgqy78xxC0kWfRQIxZdz0ws4=;
        b=cAw+xyDw9zeTLQS2P6PdLE//kOx020eX0LsksHCm6W7yhZ5ieMl3dSaGjad2Cu5t7o
         ZUGO6njdZm0LtAQFXvuQSzIMnaJA18RVtH1uwlmNJf1Ny2aan/DxgxigOMC5KKJAWusD
         7KK6Z4IWAIs8ONQ0iLLW5domWuJMh3FvXGndjctiHYxnGqIvk4/HpSiykmxyu4VtnYc/
         khf+vvG9espEywOVVa+DdeGrUIUYQoHYHUzcEloYeqGg7JFGfN8dgtRFrhwQrfLFPGqW
         7M0uFcbpO5ucRW630/4AZA6Zb+ULqRNV9ITaMyKxxeaBShVDF15ET0UeeK9jOIRgk5sN
         kZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WbKWpU/Aywh09w96vghqgqy78xxC0kWfRQIxZdz0ws4=;
        b=BLvdkzQQzUmCahtfRL7QvG/Gg7dk/Qc1crOjQQ17aWY8FedXGgFd2hLXSGxPbvza62
         fngTmYNPX32vzP1TAohq2ZM5aiUBlqmAIlXrnzvx150+o5Ru/bAaph9UQ5LB3mgx6wYB
         jCS7mfNKshzARlPyaq5tVAj2W8FnrdYnJOSsYD2aWqAAISk/9HuwNXlby+emL+HT78UQ
         n+D82Vn2exMRD5cWd6bk8HW2unPbfMfE1g5EomavYzaEpQM4X1NYc45lTsiFuURCT59u
         it5ryxai3mH/kLolsKfxdGTcE0FPJ+i0A0bQ/dPcdy6FAsKA+jjYQryeQQZFw3ahi1GC
         L+IA==
X-Gm-Message-State: AOAM53399qD+GEZZaMHxOlZ63DLEskM0pL+LRc610vywCEulDHqxO6BX
        fzoHdVUFi6GaLLYhnwIMxs3oWq4z+3robA==
X-Google-Smtp-Source: ABdhPJxWV3ctMtPRv0fMtW08ucYinq/Im3nuNMxYzKIhyN0/KE4wpVXJOo2AEJ5T8mRStIrB3ZIy5A==
X-Received: by 2002:a05:6512:21a:: with SMTP id a26mr21825410lfo.507.1617719226012;
        Tue, 06 Apr 2021 07:27:06 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u4sm378295lfr.180.2021.04.06.07.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Apr 2021 07:27:05 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: sdm845-db845c: make firmware filenames follow
 linux-firmware
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
References: <20210318201405.2244723-1-dmitry.baryshkov@linaro.org>
Message-ID: <97f37835-a543-c0b1-4497-b093ce182155@linaro.org>
Date:   Tue, 6 Apr 2021 17:27:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210318201405.2244723-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 18/03/2021 23:14, Dmitry Baryshkov wrote:
> Cange aDSP and cDSP firmware filenames to follow filenames merged into
> linux-firmware tree. Switch from split .mdt files to merged .mbn files.

Any chance of getting this into 5.13?

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index c4ac6f5dc008..b36a002c654a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -244,7 +244,7 @@ vph_pwr: vph-pwr-regulator {
>   &adsp_pas {
>   	status = "okay";
>   
> -	firmware-name = "qcom/sdm845/adsp.mdt";
> +	firmware-name = "qcom/sdm845/adsp.mbn";
>   };
>   
>   &apps_rsc {
> @@ -390,7 +390,7 @@ vreg_bob: bob {
>   
>   &cdsp_pas {
>   	status = "okay";
> -	firmware-name = "qcom/sdm845/cdsp.mdt";
> +	firmware-name = "qcom/sdm845/cdsp.mbn";
>   };
>   
>   &dsi0 {
> 


-- 
With best wishes
Dmitry
