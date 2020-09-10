Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C629B2648E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 17:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731347AbgIJPhH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 11:37:07 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:60831 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731355AbgIJPgW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 11:36:22 -0400
X-Originating-IP: 99.144.118.237
Received: from m1nmax.no-ip.org (unknown [99.144.118.237])
        (Authenticated sender: matthias@kaehlcke.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 0EE321BF20A;
        Thu, 10 Sep 2020 15:35:38 +0000 (UTC)
Received: by m1nmax.no-ip.org (Postfix, from userid 1000)
        id B0CFD80655; Thu, 10 Sep 2020 08:35:36 -0700 (PDT)
Date:   Thu, 10 Sep 2020 08:35:36 -0700
From:   Matthias Kaehlcke <matthias@kaehlcke.net>
To:     satya priya <skakit@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        gregkh@linuxfoundation.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        dianders@chromium.org
Subject: Re: [PATCH V5 2/4] arm64: dts: qcom: sc7180: Add necessary pinctrl
 and interrupt config for BT UART
Message-ID: <20200910153536.lcifa6ljy7hwgptn@debian>
Mail-Followup-To: Matthias Kaehlcke <matthias@kaehlcke.net>,
        satya priya <skakit@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>, gregkh@linuxfoundation.org,
        Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        dianders@chromium.org
References: <1599742438-16811-1-git-send-email-skakit@codeaurora.org>
 <1599742438-16811-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1599742438-16811-3-git-send-email-skakit@codeaurora.org>
User-Agent: NeoMutt/20180716
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

El Thu, Sep 10, 2020 at 06:23:56PM +0530 satya priya ha dit:

> Add a suitable sleep configuration for uart3 to support Bluetooth wakeup.
> 
> If QUP function is selected in sleep state, UART RTS/RFR is pulled high
> during suspend and BT SoC not able to send wakeup bytes. So, configure
> GPIO mode in sleep state to keep it low during suspend.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Reviewed-by: Akash Asthana <akashast@codeaurora.org>

Was this change really reviewed (privately) by Akash or are you still
carrying forward this tag from v2? The configuration and the comments
have change substantially since v2, IMO you should drop the tag unless
Akash really reviewed the current version or something close to it.

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
> Changes in V5:
>  - As per Matthias's comments, moved pinmux change for sleep state,
>    pinctrl and interrupt config to the board specific file.
> 
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 48 +++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 04888df..e529a41 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -344,6 +344,10 @@
>  };
>  
>  &uart3 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-1 = <&qup_uart3_sleep>;
> +	interrupts-extended = <&intc GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
> +				<&tlmm 41 IRQ_TYPE_EDGE_FALLING>;

As Doug already said, you need to delete the 'interrupts' property now
that we have 'interrupts-extended'.
