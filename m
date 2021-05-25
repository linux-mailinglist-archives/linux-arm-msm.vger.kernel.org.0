Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A3A390AF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 23:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233428AbhEYVBe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 17:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233384AbhEYVBd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 17:01:33 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EFCEC06175F
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 14:00:03 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id m124so23712272pgm.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 14:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RhIVjTy3Dyhx3JHVCTIixKrZHSTOw8kQrI9NZG3+1Pk=;
        b=bJ86Ltpy4tAOsoJICa8sudA376ruC05QmEWzB8psWmtJxLgcUmFn7gCL3ZbWZcsWZH
         LGyq3G6ENZBXrRXpaMer8zpskwTKUGBu+1EOKV3weAqSGzoS573kHWYXAKb2tgZ8qziO
         KOYHfuyo0IYTaGw2mMd6K2DLL/YUK0Ewk8Hw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RhIVjTy3Dyhx3JHVCTIixKrZHSTOw8kQrI9NZG3+1Pk=;
        b=b5GmF3AAyy3rrkHxw24K1iPMkAF5iZdKat7RcuC6paQ1TlcM13JKqZ0lfInZLUg+Ol
         uJZ3ySWr5r23jzuysg2vTO3VWYvvALkc6Or0Y3ekUZvLWNFju7lyohlztFFfI7SGWW98
         hvGhb+l/WD5nDKZKfTi7xfL3AtKmizqA+90NY+ewUsAs9m8ef1F/EsmrjB4Mlbfs33cX
         v8/cfaQMLsODNpWFrbemnnqv4OVi5UhgobLxsd2Y6tpTWLf/9RnKah/ANPImiWbX0OV8
         Mgse+tcDBgTlhpbVwuvXH3DFYz1r0KE6IVObAON+gse3PymTw1G7ommpf1CWuNx8gba9
         5pwg==
X-Gm-Message-State: AOAM531qWR2ZXUWPqdJPhsrLAKbj9wEQw9LO1wktOcwbfLS0MWWL8Mfc
        xQrD5esVY9NC0w3yS+Ry2A1C+g==
X-Google-Smtp-Source: ABdhPJyga0dLK1HQMOf47POnb8+Ka8TvhLkHKrwNRDUozsfCtbZTYuvjeVX34jvKrLOGfBdmZv3sWA==
X-Received: by 2002:a63:de4e:: with SMTP id y14mr20919019pgi.30.1621976403086;
        Tue, 25 May 2021 14:00:03 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:ab0:bbc9:a71:2916])
        by smtp.gmail.com with UTF8SMTPSA id v6sm15651741pgk.33.2021.05.25.14.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 14:00:02 -0700 (PDT)
Date:   Tue, 25 May 2021 14:00:01 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V5 08/11] arm64: dts: qcom: pmk8350: Correct the GPIO node
Message-ID: <YK1lUUyXIUauYPEj@google.com>
References: <1621937466-1502-1-git-send-email-skakit@codeaurora.org>
 <1621937466-1502-9-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1621937466-1502-9-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 25, 2021 at 03:41:03PM +0530, satya priya wrote:
> Add gpio ranges and correct the compatible to add
> "qcom,spmi-gpio" as this pmic is on spmi bus.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V5:
>  - This is split from patch [7/11] and added newly in V5.

this should say 'patch [6/8]' I think.

https://patchwork.kernel.org/project/linux-arm-msm/patch/1621318822-29332-7-git-send-email-skakit@codeaurora.org/

>  arch/arm64/boot/dts/qcom/pmk8350.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> index ecd5ccd..04fc263 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> @@ -62,9 +62,10 @@
>  		};
>  
>  		pmk8350_gpios: gpio@b000 {
> -			compatible = "qcom,pmk8350-gpio";
> +			compatible = "qcom,pmk8350-gpio", "qcom,spmi-gpio";
>  			reg = <0xb000>;
>  			gpio-controller;
> +			gpio-ranges = <&pmk8350_gpios 0 0 4>;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
