Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD0172427AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 11:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgHLJed (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 05:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726629AbgHLJec (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 05:34:32 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E55AC06174A;
        Wed, 12 Aug 2020 02:34:32 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id h19so1438421ljg.13;
        Wed, 12 Aug 2020 02:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a17geVUtG3V76Xw8G0K0I/am9ItmXpyn0kGJcOXpFak=;
        b=eHrJ5R9GwjUo0d3w+oNXRPavVKC4tJ3u1O5YUUa/6VXXzbVIiPXUW74Blzx6aTZd38
         OWf09pmSzTpsrAnRghC4mw9CWZr5RyuTWaZmxSR1AGvtci+C5Sj576ASbQyKMbXU+6gt
         zRdBEt2CEubaIIazCt589T1crpqbRYIQ7f5ZtwIEZecYFzSM189yZsdotPvYIPEC1h01
         +a6F0ceWeww/Aw8IDjbGT6PxbHHpfWfxlcSVmKhFpZwMyDOif6Z9OzoV/9KobPWqpTn7
         Kr5H1L0HGSM8HTQSjo9OX6HyCHCo1DX6YaniLlEiCArKcFEevHCX5bl6NWM9aO7SuzlH
         eWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=a17geVUtG3V76Xw8G0K0I/am9ItmXpyn0kGJcOXpFak=;
        b=FfDIlJnODW7pptGgd8BxJpMSWx11VLd2aGuArFzscWSezugfyC+hpxbdvmhzv9FNiy
         MK2w7wbvaGZMh/EtLSXmpxnMfCBVBEPssM+gs5tNRofqFpBDfR2ifulTZT4/Okqm6kOG
         v0hRvlBWjFBCrJubKcuCOl41qdCAO6+Eysot2+ZoG0XatwngIuHU7gOtDWI8VDoEiMk8
         p4k7IorOQBqOAMNaqHTsP9woKslNAvlAstW0WEx4vYZoecZMG1+dpACQXXiZbio5Fl2H
         MMNd9GzroheRXq5eMlvn0z8nxO3QNdZXu9XiDgzQ6ifsagBqALiuk+nTyte1azslUa41
         9rKw==
X-Gm-Message-State: AOAM531RU9SXQRoqimsd4aUu66bbzV6N974n2ZOk8qgYDMAdmbHNtdxt
        YHR8oMbuGRiBLvBKA6eL5ZILzOeuoC8=
X-Google-Smtp-Source: ABdhPJzqhrrBwT6zYABIIIlNnOzfUWCC2VTJfAIDcF2OecjRVfaONWeC34KrvzBhF/Up9tjnbR2tIw==
X-Received: by 2002:a2e:96c3:: with SMTP id d3mr5069508ljj.270.1597224870461;
        Wed, 12 Aug 2020 02:34:30 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:41b:98d0:14d2:8cca:fcf5:be6? ([2a00:1fa0:41b:98d0:14d2:8cca:fcf5:be6])
        by smtp.gmail.com with ESMTPSA id x17sm329782ljm.0.2020.08.12.02.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2020 02:34:28 -0700 (PDT)
Subject: Re: [PATCH v8 4/4] arm64: boot: dts: qcom: pm8150b: Add DTS node for
 PMIC VBUS booster
To:     Wesley Cheng <wcheng@codeaurora.org>, sboyd@kernel.org,
        heikki.krogerus@linux.intel.com, agross@kernel.org,
        robh+dt@kernel.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20200812071925.315-1-wcheng@codeaurora.org>
 <20200812071925.315-5-wcheng@codeaurora.org>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <1ed0a34c-6219-fe3d-7d9c-13a74ce2d4d0@gmail.com>
Date:   Wed, 12 Aug 2020 12:34:20 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200812071925.315-5-wcheng@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello!

On 12.08.2020 10:19, Wesley Cheng wrote:

> Add the required DTS node for the USB VBUS output regulator, which is
> available on PM8150B.  This will provide the VBUS source to connected
> peripherals.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>   arch/arm64/boot/dts/qcom/pm8150b.dtsi   | 6 ++++++
>   arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 4 ++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> index 053c659734a7..9e560c1ca30d 100644
> --- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> @@ -53,6 +53,12 @@ power-on@800 {
>   			status = "disabled";
>   		};
>   
> +		pm8150b_vbus: dcdc@1100 {

    s/dcdc/regulator/? What is "dcdc", anyway?
    The device nodes must have the generic names, according to the DT spec.

> +			compatible = "qcom,pm8150b-vbus-reg";
> +			status = "disabled";
> +			reg = <0x1100>;
> +		};
> +
>   		pm8150b_typec: typec@1500 {
>   			compatible = "qcom,pm8150b-usb-typec";
>   			status = "disabled";
[...]

MBR, Sergei
