Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2041A25C6A6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 18:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgICQXH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 12:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgICQXE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 12:23:04 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC559C061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 09:23:02 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id h12so2538607pgm.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 09:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=upBX4Clryy/k/84ALL5IHsbLB/nGc3rUDtUWpyLYwZc=;
        b=mAUB47sCbHtOGQ0iXqfPxTH7toDvKaKbaUhrtYrWD129n7XSFGeKYjncs2sw4IA5xi
         NdKJSX5p7sd8FkvLZAQaBLfEmHPQSVjRyrfOyVR8d7j64vDzGwJicub+xHRC/TmZK0nx
         Ckh+lgpuhUTlL7+rwyg0vSazuqYSalrFWlscU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=upBX4Clryy/k/84ALL5IHsbLB/nGc3rUDtUWpyLYwZc=;
        b=GtjwdLxGLybi7p1Ix74jX8ePsEBpIehPXpIupCvUiCt8n4XNgcn0cK7K/EqInkOH09
         3ooGsL8bI7ZZbM7eEBu8foEhSqyXQADFsx1cXLG17NWNmVooo4RYel18xi2uGHJaELSb
         5mdeRU1JjXFBILDrwqxFRv7zHSrc2RTgw+/qDNIJi4NIb0bx9wrWOfNU+5Ze7P9kIWqU
         73maHS2W7iojZVvSnGsmyCuEhtkv9YLschXjUoavS6+LInOTeBMUWS7gahp7ohnhROZ2
         q9+BR588kJGwbd4yezdvDD9/W8rlVQb9JsxXzPZeu664LbWtZ3WStGL7N9540mGkByhM
         GquQ==
X-Gm-Message-State: AOAM532Z3R/CM5UeYbDkP33AFgO/1LT1+6aCzG7glHzLLj7cxfaDrIgE
        IlUoMKrrJEVCRpfl2jCM1rF5aA==
X-Google-Smtp-Source: ABdhPJw/qnD3cNYORJyEaru0uyoqWXr77TTRxaiqJKTo1T6oDn6HRjFI5mE1rQf8lW2uzBxB0jUBuQ==
X-Received: by 2002:a17:902:868b:: with SMTP id g11mr4655370plo.213.1599150182197;
        Thu, 03 Sep 2020 09:23:02 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id a20sm2984045pfa.59.2020.09.03.09.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 09:23:01 -0700 (PDT)
Date:   Thu, 3 Sep 2020 09:23:00 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        gregkh@linuxfoundation.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V4 3/4] arm64: dts: qcom: sc7180: Add sleep state for BT
 UART
Message-ID: <20200903162300.GJ3419728@google.com>
References: <1599145498-20707-1-git-send-email-skakit@codeaurora.org>
 <1599145498-20707-4-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1599145498-20707-4-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 03, 2020 at 08:34:57PM +0530, satya priya wrote:
> Add sleep state for BT uart to support the wakeup feature.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Reviewed-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V2:
>  - This patch adds sleep state for BT UART. Newly added in V2.
> 
> Changes in V3:
>  - Remove "output-high" for TX from both sleep and default states
>    as it is not required. Configure pull-up for TX in sleep state.
> 
> Changes in V4:
>  - As per Matthias's comment, removed drive-strength for sleep state
>    and fixed nit-pick.
> 
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 37 +++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index cecac3e..77e3523 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -507,6 +507,43 @@
>  	};
>  };
>  
> +&qup_uart3_sleep {
> +	pinconf-cts {
> +		/*
> +		 * Configure no-pull on CTS. As this is driven by BT, do not
> +		 * specify any pull in order to not conflict with BT pulls.
> +		 */
> +		pins = "gpio38";
> +		bias-disable;
> +	};
> +
> +	pinconf-rts {
> +		/*
> +		 * Configure pull-down on RTS to make sure that the BT SoC can
> +		 * wake up the system by sending wakeup bytes during suspend.
> +		 */
> +		pins = "gpio39";
> +		bias-pull-down;
> +	};
> +
> +	pinconf-tx {
> +		/* Configure pull-up on TX when it isn't actively driven */
> +		pins = "gpio40";
> +		bias-pull-up;
> +	};
> +
> +	pinconf-rx {
> +		/*
> +		 * Configure a pull-up on RX. This is needed to avoid
> +		 * garbage data when the TX pin of the Bluetooth module is
> +		 * in tri-state (module powered off or not driving the
> +		 * signal yet).
> +		 */
> +		pins = "gpio41";
> +		bias-pull-up;
> +	};
> +};
> +
>  &qup_uart8_default {
>  	pinconf-tx {
>  		pins = "gpio44";

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
