Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0BE933B1F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 13:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbhCOMAa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 08:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbhCOL75 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 07:59:57 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33FE8C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 04:59:56 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id k8so5541882wrc.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 04:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SS1gct42nXEurrNmbvLMUHBfwY4gO5XhOVCF9euUF9s=;
        b=MUVhFOjYfQavUzABQXpLiEHlqUT3kzcdNXJk9R2s1IIzW53qoU76OIdvRjkVSRHwZG
         MtK28UTKXFQwGa0NHFvP98HaDgWRB/6+wenmYvSqtPKLU6ffJy2CLQwDffwSCztSNUOD
         wSVuTsNlrnhf73WyfMX0izOwHqfWsRmq8tC0o+Sb+XMIFqW9hjS+emFAP99ZWJFnUxRx
         GJTRzAVLk76O5LSSkeq23c6tjz8TSgW8xB8cCwVh8iCTg7i1xBDp5mw0lPeWCU2kMo9p
         mtKp/uZ0XetXYPSjXBIPJ/MXpZB5jZf/zfhV72tjHSxW0KDVboKgB/m3j0lpKL2nG296
         EnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SS1gct42nXEurrNmbvLMUHBfwY4gO5XhOVCF9euUF9s=;
        b=YQG3yHwYHALq9AMlcT+nOAvPvVs8hLdeGq+wK9DsXMBz56tf3GChPpHg01uINQdp90
         5yaRFVeKC7HavhPEEQTJvm5IzyJ0GbR1JKbP7DySmnzOBcQPDR8p/xqvWvSDnlNzW5Ps
         BBtbWuaPw6HdXAdyzgKQqGek+AbWtZokkVbiwEfGISXWnIGvJ8WT1DAeb6KK04hEhrP4
         U47jYCGEjVVhYFARvOLI+wdK78UNw05/OeW/YNhrI7Z96W+Ts6k0Dl84CuAbLEuDqaxA
         4Z4MScOot9wlNpxmsWdm+up0S/7Yz7c8W6sZJjP/aVwCbzdjClqUzZo0Pj/5K6P4NUP6
         6EQA==
X-Gm-Message-State: AOAM531CwLBlEq26bd6drjfz+stiufKc7Ug5syNS31/LhdKJzbQL1m/d
        viDWMyxAcqE3FjXtM2+CzU5MSw==
X-Google-Smtp-Source: ABdhPJwLLHk3+2nVXdv1rSFL/CLcrBN5exMsKtZ/CKY/bRSQAaObXhf1VDwv6SBICLHZ+nQrVC8BYg==
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr26298747wrw.289.1615809595542;
        Mon, 15 Mar 2021 04:59:55 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f22sm12048777wmc.33.2021.03.15.04.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 04:59:55 -0700 (PDT)
Subject: Re: [PATCH 5/5] arm64: dts: qcom: msm8916: Enable modem and WiFi
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, wcn36xx@lists.infradead.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org
References: <20210312003318.3273536-1-bjorn.andersson@linaro.org>
 <20210312003318.3273536-6-bjorn.andersson@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <f03b639f-f95a-a31a-6615-23cd6154182d@linaro.org>
Date:   Mon, 15 Mar 2021 12:01:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210312003318.3273536-6-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/03/2021 00:33, Bjorn Andersson wrote:
> Enable the modem and WiFi subsystems and specify msm8916 specific
> firmware path for these and the WCNSS control service.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 12 ++++++++++++
>   arch/arm64/boot/dts/qcom/msm8916.dtsi     |  2 +-
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> index 6aef0c2e4f0a..448e3561ef63 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -305,6 +305,12 @@ &mdss {
>   	status = "okay";
>   };
>   
> +&mpss {
> +	status = "okay";
> +
> +	firmware-name = "qcom/msm8916/mba.mbn", "qcom/msm8916/modem.mbn";
> +};
> +
>   &pm8916_resin {
>   	status = "okay";
>   	linux,code = <KEY_VOLUMEDOWN>;
> @@ -312,6 +318,8 @@ &pm8916_resin {
>   
>   &pronto {
>   	status = "okay";
> +
> +	firmware-name = "qcom/msm8916/wcnss.mbn";
>   };

On Debian I have to do this


index 2a6a23cb14ca..597cdc8f51cc 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -33,7 +33,7 @@
  #include "qcom_wcnss.h"

  #define WCNSS_CRASH_REASON_SMEM                422
-#define WCNSS_FIRMWARE_NAME            "wcnss.mdt"
+#define WCNSS_FIRMWARE_NAME            "qcom/msm8916/wcnss.mdt"

so I guess wcnss_probe() -> rproc_alloc() wants this fix too.

---
bod
