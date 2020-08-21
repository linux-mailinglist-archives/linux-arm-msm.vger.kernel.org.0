Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768CD24DDD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 19:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbgHURXS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 13:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727979AbgHURWR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 13:22:17 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81A48C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2020 10:22:17 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id h2so1186174plr.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2020 10:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h6F45IixAOPfMRMH67FKA7ZAbNwFjoG24ThPGkxleF8=;
        b=VbJ5XxhtpOO2KZl1vkxhnQ/fhsYqiD8fN9AMkshiFAB5ccj1Z6m+ShREEoPDuQDsAy
         iEDh1KaYzK2+Z9OjbtW2hPTQFG9lSDx8y0abCnvwguC+KyIlxDZMfzT8JvKxMP/Nnp3J
         fqYF41W4FyD9Dq0aZxBgPifgg4QuOfqU7+WPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h6F45IixAOPfMRMH67FKA7ZAbNwFjoG24ThPGkxleF8=;
        b=kMnZ6arjXhRtlbjpHHqRJXCkLS1M63jq26hgjTwSAkgDBzW40Dp9X1jAcZ3bgq3ee9
         2FIsEKtwyB/essEQSDiq6g+kECoaYrHWNccA58y96zlR4GODU5ZJLbe6lmgFMYcIUNWl
         2QDWjCiMS68d7thAXSlQmhkNtZsCwQzOqDfYKVqbn3MmNMRQyNUw6XrEw+u3Sc6br553
         bYqY4VUndv9jmqcJMHvyTN4yAywE9FdAAt8Cpkh6v7X5bnmSFFwQSc76iuqvU3vl2FVG
         fYsDq7FzWCEyrohSCyUXXbI3Agu1vgOoB9fv5R8cRc1Aoo9cgUES0nA37/56wOloyPin
         PiaQ==
X-Gm-Message-State: AOAM533gHU1Is7uZ2ksvwya6JjTVFcHnQPmQIJa7NkI7vKrGXeQpMUPR
        is2eMTl5c1W02upBCCWC7Xhcig==
X-Google-Smtp-Source: ABdhPJzJgMrExwlYjiSmCTmjjxtDp092F3nkrO/f++8r5KPWih6kKRCsUa27MT+totrInty0e+3A7w==
X-Received: by 2002:a17:902:bd09:: with SMTP id p9mr3244072pls.322.1598030536752;
        Fri, 21 Aug 2020 10:22:16 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id a15sm3128517pfo.185.2020.08.21.10.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 10:22:16 -0700 (PDT)
Date:   Fri, 21 Aug 2020 10:22:15 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        gregkh@linuxfoundation.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V3 2/3] arm64: dts: qcom: sc7180: Add sleep pin ctrl for
 BT uart
Message-ID: <20200821172215.GB486007@google.com>
References: <1597931467-24268-1-git-send-email-skakit@codeaurora.org>
 <1597931467-24268-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1597931467-24268-3-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 20, 2020 at 07:21:06PM +0530, satya priya wrote:
> Add sleep pin ctrl for BT uart, and also change the bias
> configuration to match Bluetooth module.
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
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 54 +++++++++++++++++++++++++++------
>  1 file changed, 45 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index d8b5507..806f626 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -473,20 +473,20 @@
>  
>  &qup_uart3_default {
>  	pinconf-cts {
> -		/*
> -		 * Configure a pull-down on 38 (CTS) to match the pull of
> -		 * the Bluetooth module.
> -		 */
> +		/* Configure no pull on 38 (CTS) to match Bluetooth module */
>  		pins = "gpio38";
> -		bias-pull-down;
> -		output-high;
> +		bias-disable;

I think it should be ok in functional terms, but I don't like the rationale
and also doubt the change is really needed.

If the pull is removed to match the Bluetooth module, then that sounds as
if the signal was floating on the the BT side, which I think is not the case.
Yes, according to the datasheet there is no pull when the BT controller is
active, but then it drives the signal actively to either high or low. There
seems to be no merit in 'matching' the Bluetooth side in this case, if the
signal was really floating on the BT side we would definitely not want this.

In a reply to v2 you said:

> Recently on cherokee we worked with BT team and came to an agreement to
> keep no-pull from our side in order to not conflict with their pull in
> any state.

What are these conflicting pull states?

The WCN3998 datasheet has a pull-down on RTS (WCN3998 side) in reset and
boot mode, and no pull in active mode. In reset and boot mode the host
config with a pull down would match, and no pull in active mode doesn't
conflict with the pull-down on the host UART. My understanding is that
the pinconf pulls are weak pulls, so as soon as the BT chip drives its
RTS the pull on the host side shouldn't matter.

Is this change actually related with wakeup support? I have the impression
that multiple things are conflated in this patch. If some of the changes
are just fixing/improving other things they should be in a separate patch,
which could be part of this series, otherwise it's really hard to
distinguish between the pieces that are actually relevant for wakeup and
the rest.

Independently of whether the changes are done in a single or multiple
patches, the commit log should include details on why the changes are
necessary, especially when there are not explantatory comments in the
DT/code itself (e.g. the removal of 'output-high', which seems correct
to me, but no reason is given why it is done).

>  	};
>  
>  	pinconf-rts {
> -		/* We'll drive 39 (RTS), so no pull */
> +		/*
> +		 * Configure pull-down on 39 (RTS). This is needed to avoid a
> +		 * floating pin which could mislead Bluetooth controller
> +		 * with UART RFR state (READY/NOT_READY).
> +		 */
>  		pins = "gpio39";
>  		drive-strength = <2>;
> -		bias-disable;
> +		bias-pull-down;
>  	};

[copy of my comment on v2]

I'm a bit at a loss here, about two things:

RTS is an output pin controlled by the UART. IIUC if the UART port is active
and hardware flow control is enabled the RTS signal is either driven to high
or low, but not floating.

Now lets assume I'm wrong with the above and RTS can be floating. We only want
the BT SoC to send data when the host UART is ready to receive them, right?
RTS is an active low signal, hence by configuring it as a pull-down the BT
SoC can send data regardless of whether the host UART actually asserts RTS,
so the host UART may not be ready to receive it. I would argue that if there
is really such a thing as a floating RTS signal then it should have a pull-up,
to prevent the BT SoC from sending data at any time.

I'm not an expert in UART communication and pinconf, so it could be that I
got something wrong, but as of now it seems to me that no pull is the correct
config for RTS.

>  
>  	pinconf-tx {
> @@ -494,7 +494,43 @@
>  		pins = "gpio40";
>  		drive-strength = <2>;
>  		bias-disable;
> -		output-high;
> +	};
> +
> +	pinconf-rx {
> +		/*
> +		 * Configure a pull-up on 41 (RX). This is needed to avoid
> +		 * garbage data when the TX pin of the Bluetooth module is
> +		 * in tri-state (module powered off or not driving the
> +		 * signal yet).
> +		 */
> +		pins = "gpio41";
> +		bias-pull-up;
> +	};
> +};
> +
> +&qup_uart3_sleep {
> +	pinconf-cts {
> +		/* Configure no-pull on 38 (CTS) to match Bluetooth module */
> +		pins = "gpio38";
> +		bias-disable;
> +	};
> +
> +	pinconf-rts {
> +		/*
> +		 * Configure pull-down on 39 (RTS). This is needed to avoid a
> +		 * floating pin which could mislead Bluetooth controller
> +		 * with UART RFR state (READY/NOT_READY).
> +		 */
> +		pins = "gpio39";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};

I don't know all the details, but I have the impression that this is the
relevant pull change for wakeup. From the title of the series I derive
that the UART RX pin is used for signalling wakeup. A pull-down on RTS
indicates the BT controller that it can always send data to wake up the
host.

I think RTS in default mode should remain with no-pull (the UART is driving
the signal), and then change it to pull-down in sleep mode.


> +
> +	pinconf-tx {
> +		/* Configure pull-up on 40 (TX) when it isn't actively driven */

nit: just say '... on TX ...', the GPIO number isn't really interesting and can
easily be determined by looking at 'pins' if needed . Applicable to all comments
involving pins.

> +		pins = "gpio40";
> +		drive-strength = <2>;
> +		bias-pull-up;

This makes sense to me.
