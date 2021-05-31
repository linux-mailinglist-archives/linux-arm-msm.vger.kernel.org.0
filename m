Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2DA3967F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 20:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232106AbhEaSeL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 14:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhEaSeG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 14:34:06 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1476BC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 11:32:26 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id t10-20020a05683022eab0290304ed8bc759so11817788otc.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 11:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BLVV9QZIDXqsvRH7Xti8i3IEgU5Yp6iFY14v7IM7JtI=;
        b=MZPdaaqoKg5pgZ4tp20ZwnC/hrb4QzW8pbCBBwy9OcoE+kkw5Ec4IkjFjCxFA2Fba5
         PnnhAKfZz2ginjK+mnQY1QvG29aCxN6JniWAC35aNnas1yzBQumAL26pOWr9qx7cXx1c
         tDDl5JJ+SJDcfwBRrZZv08ouUk0Y9cWa1zt4Zl/KgsY5shL7m4Ojil9u2k5Aq226JGNc
         B/7zP3Vmyl94ltaPNgN6bOPYY0fpctqUELcZtj+WSCKbUoQ+pBtPVeGsIAmpOHbanXMG
         cVd8yXCzA9Bcxgf4H+w1KiU8WyX+r+2hQQMpo2wEKjzVB7gNmRHVprn3Kh97PJtgx2IE
         BkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BLVV9QZIDXqsvRH7Xti8i3IEgU5Yp6iFY14v7IM7JtI=;
        b=igH4AlqENS4UwVxYP+c7nFWwusrkj8W2Au5GfHP71dfhQjmwNCaIG1GzYItw+vbq4j
         uBKYh/fNT2b0PhZzhHYY4ULMwC6TlgMdfJop2VfOeZHKXEL9Veld1HIKaalf+7balvDW
         35Zd0hyDMCluEJaxe+LVXr9JCrGdF8DvvF86r2w9YtJ5C4plDHOEPDcOw0KUsRpM2ScN
         g/EtbhDkFmr2oieDmExtCUVta3gR7CsfYdJ6w7nswtqbNwQs7GZMrMwZYlxiFEbhjf1Q
         WTSf8RO68gUWlVJinPWxW3g7QQZ4TePcc5ZjttA5gVL9+hH+e5V2jTtJX8hUrNLcZdlV
         9+eA==
X-Gm-Message-State: AOAM532kvxOl0sTL8bH7fTn6fIidmlLvWY08r+iyzynV++3orFFcBPaX
        giQQxZV/NgT/UeRgGIcGQSWjlA==
X-Google-Smtp-Source: ABdhPJy3RxUiZyO4Jq6TccXwQv3j1QISvvAoai3BTT05OZNvSnYVKmbFz13tjj6gBZLJ0uE7KqpD9w==
X-Received: by 2002:a05:6830:4009:: with SMTP id h9mr18320460ots.313.1622485945260;
        Mon, 31 May 2021 11:32:25 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id d1sm3274856otu.9.2021.05.31.11.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 11:32:24 -0700 (PDT)
Date:   Mon, 31 May 2021 13:32:23 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sujit Kautkar <sujitka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sc7180: trogdor: SD-card GPIO
 pin set bias-pull up
Message-ID: <YLUrtzDWn8HnSZ9L@builder.lan>
References: <20210521215841.2017349-1-sujitka@chromium.org>
 <20210521145824.v2.2.I52f30ddfe62041b7e6c3c362f0ad8f695ac28224@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521145824.v2.2.I52f30ddfe62041b7e6c3c362f0ad8f695ac28224@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 21 May 16:58 CDT 2021, Sujit Kautkar wrote:

> Trogdor board does not have external pull-up for cd-gpio. Set this pin

This says "Trogdor" specifically, but the diffstats says "all 7180
devices".

> to internal pull-up for sleep config to avoid frequent regulator toggle
> events.
> 
> This change is aligned with Qualcomm's DT change posted at:
> https://patchwork.kernel.org/patch/11675347/
> 

I'm sorry, but afacit this says that your v2 is Qualcomm's v2 but with
the change I asked for. If this is the case, then your patch is either
v3 or you could just mention this below the '---', as I don't see any
benefit of carrying this in the git history.

Regards,
Bjorn

> Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> Changes in v2:
> - added pull-up for IDP
> 
> (no changes since v1)
> 
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts      | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 07133e0af581a..0c255edb7f3c3 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -696,7 +696,7 @@ pinconf-data {
>  
>  		pinconf-sd-cd {
>  			pins = "gpio69";
> -			bias-disable;
> +			bias-pull-up;
>  			drive-strength = <2>;
>  		};
>  	};
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index d128a0ed6ad3a..330deb4967ca2 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -1638,7 +1638,7 @@ pinconf-data {
>  
>  		pinconf-sd-cd {
>  			pins = "gpio69";
> -			bias-disable;
> +			bias-pull-up;
>  			drive-strength = <2>;
>  		};
>  	};
> -- 
> 2.31.1.818.g46aad6cb9e-goog
> 
