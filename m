Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D153117311D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 07:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgB1Get (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 01:34:49 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43356 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgB1Get (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 01:34:49 -0500
Received: by mail-pf1-f196.google.com with SMTP id s1so1191994pfh.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 22:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=H06v/GT9nj7/Fe27LeiShYTU4s7PYoRFGJxdUeLF4jk=;
        b=j/Fs6l++dZ9qALBWak3L+c7UXa4IIRLPenWuacNuEQd8dh3UcBTbCvLq9o546UICn3
         lwOjLXjWkV01CTlA8JXRELlPW1aRpgcFw/7OHYdLgBFUFjx0D4ZxDFSD+Gj/720l8LXJ
         OW/OZvqBxYdZrumh3va0nAAytKMaq1z0JFgITQCiXfy44z0D0d2OS52FEmUPTK0GC41r
         m1WodAtFulspPeMqlkk650z8YG3n0iwfGyyXF9emc6VaRNlDiB+ABeHPlHO/tKR2XTsW
         geeAgNNQplWQj+VceArexHJvFizxttahyfdxckRpNRAXwnEhxdGOmszhv6tNuYtO8COY
         hbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H06v/GT9nj7/Fe27LeiShYTU4s7PYoRFGJxdUeLF4jk=;
        b=uEsfb4XPo4CqJkedpGXsuO+jBYInXhKN/zzK/on2gOp5QPvcm81aoeplklxGfqUX5F
         kGS7E5WA2KlUimxwc8b6Wi4L08iy79uKYPAJw/fe8lPEApxzz+R62S9YwiUyBOCBkKbR
         j5cDxGiYDCGMXyxmOro0hO0Qt/49PVbIeKCE0TRVCEhhEb0/GBuGPtQRZGPNElNLy97B
         kBNAm2GrgUAt3KgE55VZRFZDYYv8tVSUA2RPeqOqYwcVRJSd1x9CZWA7329y9iOd6BO7
         JYIaQVyxIxGTeS4K3BZMEY26o1E8RpzDtsmv1qhxAL/vbLVyAF67Th1M9wfFwkL+gmoK
         gijw==
X-Gm-Message-State: APjAAAV1CHiDJPLEv5QL8XvQGx0AXjP2wfq7pyBO+ouEz9575ux7mEtW
        9gFa8i92hY/CpfeBbBcJviKzew==
X-Google-Smtp-Source: APXvYqxyhqToHPPmsxUjYcwCyp1GEtdva6uxDKjmSZjjjjLhF2foY+Q+zG+CAqTI2APSlmWFURYZvA==
X-Received: by 2002:a63:2c03:: with SMTP id s3mr2934770pgs.19.1582871687805;
        Thu, 27 Feb 2020 22:34:47 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y5sm9392183pfr.169.2020.02.27.22.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 22:34:46 -0800 (PST)
Date:   Thu, 27 Feb 2020 22:34:44 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sc7180: Enable soc sleep stats
Message-ID: <20200228063444.GA857139@builder>
References: <1582274986-17490-1-git-send-email-mkshah@codeaurora.org>
 <1582274986-17490-4-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582274986-17490-4-git-send-email-mkshah@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 21 Feb 00:49 PST 2020, Maulik Shah wrote:

> SoC sleep stats provides various low power mode stats.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 8011c5f..eee6d92 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -745,6 +745,11 @@
>  			};
>  		};
>  
> +		rpmh_sleep_stats: soc-sleep-stats@c3f0000 {

I don't see any reason to reference this node, so you should be able to
omit the label(?)

> +			compatible = "qcom,rpmh-sleep-stats";
> +			reg = <0 0xc3f0000 0 0x400>;

Please pad the address to 8 digits and sort the nodes by address.

Regards,
Bjorn

> +		};
> +
>  		tcsr_mutex_regs: syscon@1f40000 {
>  			compatible = "syscon";
>  			reg = <0 0x01f40000 0 0x40000>;
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
