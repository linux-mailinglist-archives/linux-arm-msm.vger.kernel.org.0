Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 426B2469BA9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Dec 2021 16:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356266AbhLFPSJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 10:18:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347700AbhLFPMY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 10:12:24 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C628DC08EAEF
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Dec 2021 07:05:30 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id t23so22005886oiw.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Dec 2021 07:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NzBTIPMU59EZgqGZc7kI+1hmj8xwF/+2qvo6SeSV63w=;
        b=ybsp0UrHMN1tAqw3d8QzvyBjjt7wPJWheRGiAXFO8n9bBcvsnt1GdAg1wEsATnrFIV
         bKmQZ62MwJAy3dJrLjxeTjBKziF8anyvWTouri7yMmRiFL6pBx+ANMLPJV1gho+LpyyZ
         Ve/0IZnxQRUf1FCw6+B/WDgVK3malxxNhR/6vB/WlQJ6y/RGcPkl5iCJtFZgYHfu4cZI
         t6GQKcD401XmUei+FcsGiELt803cSeUQYpHUzW7JTl8OiRSO/NZ2kSovd9Y3tREqpdjK
         IOE0pUVx8ty8NF53RxpRBDEzwNj1FQb/I9jhWsMHl4o0nVEu3RT44mBUN958tl03uhxH
         W4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NzBTIPMU59EZgqGZc7kI+1hmj8xwF/+2qvo6SeSV63w=;
        b=sHAgF8KLMjrGe0tS2j0CMXJk73QOyO19+v3fk/NZOg67C0z8kjEqyGszp9V514kTc+
         jY5sBeMUY4hOPVhhrImW4tW2QxLHaVMtiiopCQD+wzQ5i30pB2CHuEnaDoEl6wR/zFVV
         oDf4k9oZIT3zEwB1YynII7Ei6gD603FGoDjCJFY1sjcyZUJ0cfFuUPRSBMZ92us0c6gW
         ndmktPtuq7TMMsElHEC0JMraMg5Cb/yIE4Y3ZS/1D/9DOLkt0bPVwa7oB4P4nDmPWuPW
         hJds7xjCV7hQpPW6qlDwuypQqAvhctf/HsXlRwZlQbPW1wdBtiM1QHdiHvo0+0ijhDU2
         wz4Q==
X-Gm-Message-State: AOAM532JPIXau8djk/qxnAk87XxoCFjNjAhDyZnCe5fYncqJ7LpktWVU
        yi6l+VXliFlf9VD0xB920n2hvw==
X-Google-Smtp-Source: ABdhPJxdED1QhAb6n/Cc1u7AxaJDhHC0LS6eu1C5jAtVtZ1y1gZE2O9U5YOipf3H5+Hys+0AzdhB6w==
X-Received: by 2002:a54:4418:: with SMTP id k24mr24350398oiw.23.1638803130087;
        Mon, 06 Dec 2021 07:05:30 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm2263055otr.23.2021.12.06.07.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 07:05:29 -0800 (PST)
Date:   Mon, 6 Dec 2021 07:06:56 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     agross@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: apq8016-sbc: Remove clock-lanes
 property from &camss node
Message-ID: <Ya4nEMnZ3zQiXbaR@ripper>
References: <20211118124819.1902427-1-robert.foss@linaro.org>
 <20211118124819.1902427-4-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118124819.1902427-4-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 18 Nov 04:48 PST 2021, Robert Foss wrote:

> The clock-lanes property is no longer used as it is not programmable by
> the CSIPHY hardware block of Qcom ISPs and should be removed.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Although I'd be happy to take the two dts patches through the Qualcomm
tree, once the driver changes has landed.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> index a5320d6d30e7..b7a578aafcbb 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> @@ -253,7 +253,6 @@ ports {
>  		port@0 {
>  			reg = <0>;
>  			csiphy0_ep: endpoint {
> -				clock-lanes = <1>;
>  				data-lanes = <0 2>;
>  				remote-endpoint = <&ov5640_ep>;
>  				status = "okay";
> @@ -289,7 +288,6 @@ camera_rear@3b {
>  
>  		port {
>  			ov5640_ep: endpoint {
> -				clock-lanes = <1>;
>  				data-lanes = <0 2>;
>  				remote-endpoint = <&csiphy0_ep>;
>  			};
> -- 
> 2.32.0
> 
