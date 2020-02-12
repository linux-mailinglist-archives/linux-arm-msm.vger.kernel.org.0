Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14E6715B24D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 21:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728098AbgBLU5C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 15:57:02 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36940 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729099AbgBLU5B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 15:57:01 -0500
Received: by mail-pg1-f196.google.com with SMTP id z12so1846689pgl.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2020 12:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yHo3G194HPvl0+OTxbPr1GwQTRPrDmSRoLumh9Fh6mM=;
        b=HyrdAeTcvgHRYbZo09Kb86QXTMATZSY7Vuv7SI6TBS/vPJAQAsIBnvFZa3CqLwlJZQ
         Z85vtRCWtFi+hpjM6UQZ00PWApDMKryOIxEazlJ7UGYNTkdnMOrOLwlH3HRiQgxtsN2O
         2auqk7fJBFTIMRrJ6ozqhAF2nCmdMJJXXrfBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yHo3G194HPvl0+OTxbPr1GwQTRPrDmSRoLumh9Fh6mM=;
        b=bPXQdLSr705ObXrTdQw2bC2a8GjFvROTW0ILB3mvmVTcRgdWWTSHy0kgw/6GPjAw2W
         SlZGZf1H9jsanEPzN2wdgXU+jpTMh2RwY6LtM6Milw35a8AT7Pc1jNuw+nnqGP1HJ7qC
         9UYvCSN6eakpSW7LMHM2Pbc5SxuGB/Gwdnm/XKrSbEfbxzKtG1VfETKFJAxs+nfMJXVh
         WE41ClSw0YN+y6QYe6l0wqBwJxD5xr0iHaOr/1Xym7pHibewYyJmrc0BjHsa68NDcA/U
         /iX2NpPDvDLymoFN0QtasWucjUMmAQG7FXwO8vNOrMFda+Mu/05Dh6bV0tfe8aj2I68l
         r+Mg==
X-Gm-Message-State: APjAAAUh1yd9ztXAdQTzP7le3xsyRf/cVwXF2jOHoixTnHne0n1wZWd2
        OpMyMezKBZjU8g37EHBXuSEDsQ==
X-Google-Smtp-Source: APXvYqxtQ0mau5xXh39HhHqp1pbCX/c1RwJEe6CZloh7WRAzdL9bkzXuPrMaZXDdzb2V3HCJEXDKhA==
X-Received: by 2002:aa7:9218:: with SMTP id 24mr10153014pfo.145.1581541020946;
        Wed, 12 Feb 2020 12:57:00 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id o11sm159647pjs.6.2020.02.12.12.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2020 12:57:00 -0800 (PST)
Date:   Wed, 12 Feb 2020 12:56:59 -0800
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
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sc7180: Correct qmp phy reset
 entries
Message-ID: <20200212205659.GE50449@google.com>
References: <1581506488-26881-1-git-send-email-sanm@codeaurora.org>
 <1581506488-26881-5-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1581506488-26881-5-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 12, 2020 at 04:51:28PM +0530, Sandeep Maheswaram wrote:
> The phy reset entries were incorrect.so swapped them.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 8011c5f..63bd7f1 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1081,8 +1081,8 @@
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

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
