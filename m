Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0ECF344AF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 17:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbhCVQSR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 12:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbhCVQRw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 12:17:52 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A8FC061765
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 09:17:50 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id bf3so20085120edb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 09:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AiPl5pUPZTQr5pITP8xS+7R+vsKTJAIeUGsmJUXOUM8=;
        b=drkd7YYD8A9I08BCKjeekcKOrjrZm/kJ3mGaGwuhEGQvvp8ztRhAC7BMcavdMGzyKd
         fbH2q/+t+eWv5Mc+gs0x46at7q+r7LCSCm5KZWJUc9RYVAv2U7JEPSAmpa8mYDW75sCL
         WAvNuR5r6e5Oysv0GL20/JLVN73bKnGNAkDatePsgsEJo8zEwxKVTHd9FhpmSsmj1zlI
         T2975XrirvwrXUqPP3eXvlrjA4ZECQrRzxvpFlnGDc1YhESBqWXqR7ugISabmIMCniW4
         iatgHqbfl50lN9ZX50p9tWv+fWjydG+T9NsMDr9wTlonji8pXYBq8h1y0dxq9nzuZMfo
         iPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AiPl5pUPZTQr5pITP8xS+7R+vsKTJAIeUGsmJUXOUM8=;
        b=GE7E0AlUhGlzAi01WK3r4cRK0MyETZIIHGcKuoKyya7FwPOIolz7mPPYBNtdReTXG4
         a1vvT+R2sVzAPKaGB+DgxBHZpd+1GoRVEZerPXT6lquibKsiAavPYrPzeHMoFWzFnVbm
         grna8+WtwlsR88iUcATXkvUktNBuS98HphsNviGT4t5j+Nt80s5qaOHf18H6BktenB1x
         QaEO5lY2/CtV1169CArqIA+SwyHvLuOPOG1yh0zVlyXPb0MPG7d9Msg4IRUQb2NBDbea
         boZVOUFmxw37C/H1FcOiuE4oZH56SAfdytHUrlzr70OieykS51vnLfbxyMfouHYZlZHx
         M/AQ==
X-Gm-Message-State: AOAM5311ot9cb6lxWsV7N8r38QdiT7sbMVoi3u/hBrFJETEbpM7Rrqzz
        qPb0081YzCRf7W7UIM44wdJlgA==
X-Google-Smtp-Source: ABdhPJzlqIlXd2lr5b+aZ/CbSlNKvZnTLq2jAivh/8csn0KWGeT+i23ECN89apHlZcQXI4vuQQeRoQ==
X-Received: by 2002:a50:ef0a:: with SMTP id m10mr305593eds.261.1616429869194;
        Mon, 22 Mar 2021 09:17:49 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id h2sm9995456ejk.32.2021.03.22.09.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 09:17:48 -0700 (PDT)
Date:   Mon, 22 Mar 2021 16:17:46 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: backlight: qcom-wled: Add PMI8994
 compatible
Message-ID: <20210322161746.xvdrjcp3g7jijq3b@maple.lan>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210228124106.135812-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Feb 28, 2021 at 01:41:04PM +0100, Konrad Dybcio wrote:
> Document the newly added PMI8994 compatible.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

(For Lee) Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
>  Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> index 47938e372987..d839e75d9788 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> @@ -19,6 +19,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,pm8941-wled
> +      - qcom,pmi8994-wled
>        - qcom,pmi8998-wled
>        - qcom,pm660l-wled
>        - qcom,pm8150l-wled
> -- 
> 2.30.1
