Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A558D21A601
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 19:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgGIRlw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 13:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbgGIRlw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 13:41:52 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8AC2C08C5DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 10:41:51 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id e8so1279776pgc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 10:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8cYRIN56Hfij3RW2GD+DjFbyhFBnKCKVpV/5GtjC11c=;
        b=MbbxQMO8S/5hsh+8k/hugybr95tK+sIBoC5bCnrad8LpeZHlQCG7ysKf/Mzyh8m/5C
         YmvGbOliTnA0TTE7HO2QTZNsx/uicr0aOx5YMzte6uoTvfMkg1aDMusXw0EHYdnyI3cG
         nJeSp3WSP7VswZ6BZr/r1KeQzKyicnpA7O47M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8cYRIN56Hfij3RW2GD+DjFbyhFBnKCKVpV/5GtjC11c=;
        b=V0tbol6gOdMgOFwM8pA2BCjtAORqfzGAsNSHHJmC94VCNgNAe652uGtLn2M2sGS023
         Sx6YpVZDKjCPX4hRYfQzwD6diXCpWH1cZXp752RicgaI1CgLYoe/1dDahcN7fiUhB7ya
         OBlr/X9JuoIMOWJHnSvzwt02P0DKcnpWvkH4HD4qGUZ9y7A4DNxZQBjNPsTWQJHzeW5X
         0p5aicJnl1gTiCs2kGb03xoE6aGbRxsmoQg2ZZlUclEcmsfTGAR6hmVdzsvjfeLRS0e5
         pXzOGykY1L3R2YTJPMHXsj02f6F1Z1T/7197F+ElGto1y56Ne1e8tG9/EUocpGkaefhh
         pOMg==
X-Gm-Message-State: AOAM532dQ4nL+V375t/jhvtLa6i2/Gj998pkJy68d4sNN5xFK9B2/q/j
        drwrYue3ZdxZFMQWbT8x8HExAQ==
X-Google-Smtp-Source: ABdhPJwaRFIKuzRY/WaSqwBDVlSrCc6/yms2+/eGLAG32MYRnXLrjbcC/YNzWraWpr38Uy7POBn/yw==
X-Received: by 2002:aa7:842c:: with SMTP id q12mr16879058pfn.209.1594316511418;
        Thu, 09 Jul 2020 10:41:51 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id p10sm3565791pgn.6.2020.07.09.10.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 10:41:50 -0700 (PDT)
Date:   Thu, 9 Jul 2020 10:41:49 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v8 2/2] arm64: dts: qcom: sc7180: Add maximum speed
 property for DWC3 USB node
Message-ID: <20200709174149.GM3191083@google.com>
References: <1594310413-14577-1-git-send-email-sanm@codeaurora.org>
 <1594310413-14577-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1594310413-14577-3-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 09, 2020 at 09:30:12PM +0530, Sandeep Maheswaram wrote:
> Adding maximum speed property for DWC3 USB node which can be used
> for setting interconnect bandwidth.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 2be81a2..753e1a1 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2544,6 +2544,7 @@
>  				snps,dis_enblslpm_quirk;
>  				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
>  				phy-names = "usb2-phy", "usb3-phy";
> +				maximum-speed = "super-speed";
>  			};
>  		};

It shouldn't be strictly necessary if you use super-speed as default
max-speed in the driver, but it also does no harm.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

You might want to add it for other platforms too.
