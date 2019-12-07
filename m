Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02E8C115EAB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2019 21:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfLGUoQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Dec 2019 15:44:16 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:47020 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbfLGUoP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Dec 2019 15:44:15 -0500
Received: by mail-pf1-f194.google.com with SMTP id y14so5136857pfm.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Dec 2019 12:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Kiy7EipI6d1kwJo5G6iwqQzKL6o56G8+RcrWJErWNsY=;
        b=mJp499OsMqgy7HHlPvYuoF+pVw/LgLLfj6GKkxZQPjMqC+tgQSXrWUPF2JPcrv2kXr
         YeDEd6WLAu9Rf/mq9fjEwyHxKcF+ApMTLdeU7BmOJaFBtLmYFISesrGSvU6QziXSBfKU
         W3ZSKEx/B/RNkdTqOM9+fey87F1tGfaLs3XUHEhA1F9WMMysIJKizV6bHEt+wTunf05w
         Stk8WifjjeyOH2/R2itzqN/tivNLAItL1dt0HxzkX9nUWTOzx4t4j4Gv6QfZEuwBkeX8
         TnTu8aVeG5dT5MxKQsqNIAisujktlBlHtY40hF2a71w1HJvIbaU4+i4Q3xRUwpWKk7Fr
         3t0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Kiy7EipI6d1kwJo5G6iwqQzKL6o56G8+RcrWJErWNsY=;
        b=cZsTac+U3fYfsNtqwFutyD62cLb2jGRmWDQlFJw4ns4PrWtY+sX08xOsWe93oPumAN
         uoyjEhl0H5aSP0IPwHidn74O4WL58eeawS3GBoJovhgQS+KYRXhwgZw2OMd9uIDlcBQk
         tG8NjoudlX15tg7Wn+Wzp3cMpEXjd/uP6xhNuVugCItAOLgzdupmCRMajG/u7FP/8URW
         7zGIMfkWt1+zbusqbEgb0VuEr6kVQoxqzRZSwaVP+tDJYx17sKzEwjGuqQpBOFWHaqOI
         GJiTshnFasEObSZprq7mvJg0a47v2yu4FBUbIf7/UJDpQVBVcilKChIuRccH4bAqkg/F
         Xrog==
X-Gm-Message-State: APjAAAUVDsGx51duca83CAtcfq25Qbr4iYTw7EfAPMjV9b2uZQQwr1hM
        t8KBl9hbuKOu/otkamKqZCYb5boOUdc=
X-Google-Smtp-Source: APXvYqzdu57c2ZeP27fgm8n3iJ+LvyTZE/SJB2r6Wz8yT0HCNWmiNMAHjE8bYwBMZUfgayDRhPFWZw==
X-Received: by 2002:a63:5511:: with SMTP id j17mr10974227pgb.70.1575751455037;
        Sat, 07 Dec 2019 12:44:15 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i26sm20356501pfr.151.2019.12.07.12.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 12:44:14 -0800 (PST)
Date:   Sat, 7 Dec 2019 12:44:11 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Paolo Pisati <p.pisati@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/6] arm64: dts: qcom: msm8996: Disable USB2 PHY suspend
 by core
Message-ID: <20191207204411.GC314059@yoga>
References: <20191205161505.15295-1-p.pisati@gmail.com>
 <20191205161505.15295-3-p.pisati@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191205161505.15295-3-p.pisati@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 05 Dec 08:15 PST 2019, Paolo Pisati wrote:

> From: Manu Gautam <mgautam@codeaurora.org>
> 
> QUSB2 PHY on msm8996 doesn't work well when autosuspend by
> dwc3 core using USB2PHYCFG register is enabled. One of the
> issue seen is that PHY driver reports PLL lock failure and
> fails phy_init() if dwc3 core has USB2 PHY suspend enabled.
> Fix this by using quirks to disable USB2 PHY LPM/suspend and
> dwc3 core already takes care of explicitly suspending PHY
> during suspend if quirks are specified.
> 
> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>

I haven't yet had the chance to test this, but please add your
Signed-off-by below Manu's and resubmit this patch.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 87f4d9c..fbb8ce7 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1598,6 +1598,8 @@
>  				interrupts = <0 138 IRQ_TYPE_LEVEL_HIGH>;
>  				phys = <&hsusb_phy2>;
>  				phy-names = "usb2-phy";
> +				snps,dis_u2_susphy_quirk;
> +				snps,dis_enblslpm_quirk;
>  			};
>  		};
>  
> @@ -1628,6 +1630,8 @@
>  				interrupts = <0 131 IRQ_TYPE_LEVEL_HIGH>;
>  				phys = <&hsusb_phy1>, <&ssusb_phy_0>;
>  				phy-names = "usb2-phy", "usb3-phy";
> +				snps,dis_u2_susphy_quirk;
> +				snps,dis_enblslpm_quirk;
>  			};
>  		};
>  
> -- 
> 2.7.4
> 
