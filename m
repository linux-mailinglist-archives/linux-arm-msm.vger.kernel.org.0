Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4FE034514D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 22:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbhCVVA2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 17:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbhCVVAJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 17:00:09 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F852C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 14:00:08 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id n140so14585198oig.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 14:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=uC9rZITLP2i6uLDhaBSSfsxlh8sIxuAP4msry8ZQ+80=;
        b=hkVkJZiTEelGB4vzulRrDPj5j5PSmza//S6ivKnH6d7Skkj+ifVnw2VIpee4BjBqHR
         JOBQqxuCc6GJpZAcqq7adnBqPnE6yQu3if7C5DMWZkqvF5IZpl5pSIf5jeaA/HtOVu76
         SrSoy388eNPftbj6rvlJOWz+Gw89oHMTMKF0aPfxEVLLZUx7OQNxoWdeGynXo3MUm0c+
         ghZy8eZYpGqAwvDwmUBZNlrEEUsYDKoy4OOi0M2/Jy+VtmiDPSoscDs1+jHdVpy0BksV
         h0h57MTjXcANblwu5/96gXLlNAf8DKL9m8CnnxvtlYOi1K9lDqRQ+rv2oMsuh5bW8/pl
         X/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uC9rZITLP2i6uLDhaBSSfsxlh8sIxuAP4msry8ZQ+80=;
        b=QRbrCB4UWYGF86dGllP4C+/zc67Vh4eKA+EmpjgtiAhNL4/t7hTBhVqnaknMOULifh
         eHbnEmaj1RK4u1+vUWe5A1k4uoN7vAKv+D1DaA7hLfoTw9IdA29UNtDQ/6FeeEvjA0/N
         ijlf26umZtZnsP8NQVr8H8YTkOpev/9E+fjhCjVx5X3Xlxvfo8FW5wAQ9Ykut1e9/UhD
         EDLMcUi7IRReEd39eC2khwFXqNYjd/5Je5z5pvDm53Cu9GhFAWMH6/mzOzJoyeN5a1Np
         d8CPX2TB4sk/6GXXKYv5F4lruLR1cbyz+yxB8xduswW4Xk+KBWVcOxlk/GqMLKmtz135
         Y8yg==
X-Gm-Message-State: AOAM532UdIhWJ8Yr6ajo+9QBHnjmisMHUl2Ggx1daAOTNsU2cNW/Zmiz
        d6vK0hc53HVMcsS7KIs6+S8DvmyqOkx/cSob
X-Google-Smtp-Source: ABdhPJz5xMUjLISoFOkPzunY+6yjcU4kgr6rMegzNsDqvuDonJGBbY+W9UrQ1srxLdnlk/pj2wdb5w==
X-Received: by 2002:aca:578b:: with SMTP id l133mr719865oib.96.1616446807655;
        Mon, 22 Mar 2021 14:00:07 -0700 (PDT)
Received: from ?IPv6:2806:10b7:2:e880:2c32:cfff:fe8e:de1f? ([2806:10b7:2:e880:2c32:cfff:fe8e:de1f])
        by smtp.gmail.com with ESMTPSA id n13sm3707846otk.61.2021.03.22.14.00.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 14:00:06 -0700 (PDT)
Subject: Re: [PATCH 1/5] dt-bindings: soc: qcom: wcnss: Add firmware-name
 property
To:     linux-arm-msm@vger.kernel.org
References: <20210312003318.3273536-1-bjorn.andersson@linaro.org>
 <20210312003318.3273536-2-bjorn.andersson@linaro.org>
From:   Anibal Limon <anibal.limon@linaro.org>
Message-ID: <de854cbf-5a98-d93b-3203-395af9cca822@linaro.org>
Date:   Mon, 22 Mar 2021 15:00:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312003318.3273536-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/11/21 6:33 PM, Bjorn Andersson wrote:
> The WCNSS needs firmware which differs between platforms, and possibly
> boards. Add a new property "firmware-name" to allow the DT to specify
> the platform/board specific path to this firmware file.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by:  Aníbal Limón <anibal.limon@linaro.org>
> ---
>   Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt
> index 042a2e4159bd..1382b64e1381 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt
> @@ -24,6 +24,13 @@ block and a BT, WiFi and FM radio block, all using SMD as command channels.
>   		    "qcom,riva",
>   		    "qcom,pronto"
>   
> +- firmware-name:
> +	Usage: optional
> +	Value type: <string>
> +	Definition: specifies the relative firmware image path for the WLAN NV
> +		    blob. Defaults to "wlan/prima/WCNSS_qcom_wlan_nv.bin" if
> +		    not specified.
> +
>   = SUBNODES
>   The subnodes of the wcnss node are optional and describe the individual blocks in
>   the WCNSS.
> 
