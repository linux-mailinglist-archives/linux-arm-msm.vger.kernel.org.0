Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B313018200D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 18:51:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730573AbgCKRv5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 13:51:57 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:35311 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730472AbgCKRv5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 13:51:57 -0400
Received: by mail-pj1-f67.google.com with SMTP id mq3so1390163pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 10:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a5g25PDEXPRR99KehOK1iE2Gu80HzFKYuNkkikGwIFI=;
        b=eNRE/qbm63stiKXIvgwIlV+IxOrzorOkM4iow7B6RZUpJva1559bRWMvw2agkD7Mis
         2YTH3veSMsgbKxZyscQrguxH0BD1nYGckFuQ/fdaY2NKujUR7G6NuenUZTTOfFuGSGgH
         Qxht0ueO4ugRgmAZGeX2WtSxnNFHitwKoKXgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a5g25PDEXPRR99KehOK1iE2Gu80HzFKYuNkkikGwIFI=;
        b=cEL/XygkhnJLFmAy3zKta6pal+6jezWDALxDJfgQ2ZBIjmGbjS/aX6imE5WCJhPyy7
         6SsBQH5spyi14npX8cgT/6Uv33jlHjL/p6LZbN9Mdqnl3KhPi7TaHaeWSm671X8knSmS
         7ipZwlpUYHP4H5EvezrEeWcZwShUIcuORMcdXR+Ttnouc2oLrapYfHs3LUPO/xnG2xya
         5AeNrR3ksZvr+NrAl9cU4ReIynX/nx7IRScBeWj2IqfDIXAWevhQQ0T3gr2ZP6dcI0e3
         na8vHp9BrLfSP6AB1swn41p39gAc8uvQprNiskljmD9v4pxhE4mRqcdxgHnVki7cvAg7
         yZRg==
X-Gm-Message-State: ANhLgQ0ltb/E9KSXlOjltHLzqQqDQZ8s6SvKPxTumI8Vnv2tZQ3rROsU
        Qr7DtWCMIJF4hFHxRxQ1tmQoew==
X-Google-Smtp-Source: ADFU+vsBi+bUj1VxZCycAe0rgyooLlJtfjkUSx8xr00Nuup+ET1asdfp4FcWsNKm5fSW9KpT0NQn8w==
X-Received: by 2002:a17:902:bc4c:: with SMTP id t12mr3853587plz.54.1583949115991;
        Wed, 11 Mar 2020 10:51:55 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id d3sm5730078pfq.126.2020.03.11.10.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 10:51:54 -0700 (PDT)
Date:   Wed, 11 Mar 2020 10:51:53 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: sc7180: Correct qmp phy reset
 entries
Message-ID: <20200311175153.GB144492@google.com>
References: <1583928252-21246-1-git-send-email-sanm@codeaurora.org>
 <1583928252-21246-5-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1583928252-21246-5-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sandeep,

This patch landed in Bjorn's tree (arm64-for-5.7 branch). In case you have
to re-spin the series there is no need to include it.

On Wed, Mar 11, 2020 at 05:34:12PM +0530, Sandeep Maheswaram wrote:
> The phy reset entries were incorrect.so swapped them.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 9d112aa..253274d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1306,8 +1306,8 @@
>  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
>  			clock-names = "aux", "cfg_ahb", "ref", "com_aux";
>  
> -			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
> -				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
> +			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> +				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
>  			reset-names = "phy", "common";
>  
>  			usb_1_ssphy: phy@88e9200 {
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
