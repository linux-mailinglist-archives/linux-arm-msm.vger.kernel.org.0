Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAABF439028
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 09:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbhJYHSP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 03:18:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:33496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230015AbhJYHSJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 03:18:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8F6660F9C;
        Mon, 25 Oct 2021 07:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635146147;
        bh=q7ILEld7it3AMXE9sJdmUiwj0tODHcpVIynxhnU7x/A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MTp2NmebcA7C6vlehVz3ayqL0jfzrRdh9MkSBWt2fRNKOIUmjQbOAw57C4QwpQPz5
         V7MOtI/dXB5H1tMBO3xaRUGbHvOl7tSEqNitCZScby+BRhgHAGxEQ1BejI4kcPiy+9
         CqHe6+/zi6AjU/gNdwmLL57Zym3Ab8wDLSy5DaTg8P/OdWYk/dzlJm6hVofBsWvioG
         mgLNKPDr8M5BlTsQ+wj1vKcZ6flzhqtvZcUBtxbrGqBPN5ohwDZ+nzhaa9pUeU6irb
         cmXpP/bnMmGmtUXrgx39tp+Sh4xfcMVaik9Z7de//O0upJx667xm0GGKlA3Q4cICVa
         lfTtNDmzfGH9g==
Date:   Mon, 25 Oct 2021 12:45:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com
Subject: Re: [PATCH v2] phy: qcom-snps: Correct the FSEL_MASK
Message-ID: <YXZZn7dXEezgHfrW@matsya>
References: <1635135575-5668-1-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635135575-5668-1-git-send-email-quic_c_sanm@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25-10-21, 09:49, Sandeep Maheswaram wrote:
> The FSEL_MASK which selects the refclock is defined incorrectly.
> It should be [4:6] not [5:7]. Due to this incorrect definition, the BIT(7)
> in USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0 is reset which keeps PHY analog
> blocks ON during suspend.
> Fix this issue by correctly defining the FSEL_MASK.
> 
> Fixes: 51e8114f80d0 (phy: qcom-snps: Add SNPS USB PHY driver for
> QCOM based SOCs)

1. pls never split the fixes line!
2. Format is Fixes: 51e8114f80d0 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")

Pls dont use your own format

I have fixed it up while applying...

> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> ---
> v2:
> Corrected the register name COMMON1 > COMMMON0 in commit description.
> Added Fixes tag.
> Dropped copyright line.
> 
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> index ae4bac0..7e61202 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> @@ -33,7 +33,7 @@
>  
>  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
>  #define RETENABLEN				BIT(3)
> -#define FSEL_MASK				GENMASK(7, 5)
> +#define FSEL_MASK				GENMASK(6, 4)
>  #define FSEL_DEFAULT				(0x3 << 4)
>  
>  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1	(0x58)
> -- 
> 2.7.4

-- 
~Vinod
