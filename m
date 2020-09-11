Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D887D265A27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 09:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725764AbgIKHLr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 03:11:47 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:35719 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgIKHLr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 03:11:47 -0400
Received: from marcel-macbook.fritz.box (p4ff9f430.dip0.t-ipconnect.de [79.249.244.48])
        by mail.holtmann.org (Postfix) with ESMTPSA id 5DF1FCED1A;
        Fri, 11 Sep 2020 09:18:41 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [RESEND v1] arm64: dts: qcom: sc7180: Remove clock for bluetooth
 on SC7180 IDP board
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1599734980-22580-1-git-send-email-gubbaven@codeaurora.org>
Date:   Fri, 11 Sep 2020 09:11:45 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org
Content-Transfer-Encoding: 8BIT
Message-Id: <C8D04890-4F62-4EEB-9113-BAFFF46E32BD@holtmann.org>
References: <1599734980-22580-1-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

> Removed voting for RPMH_RF_CLK2 which is not required as it is
> getting managed by BT SoC through SW_CTRL line.
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
> arch/arm64/boot/dts/qcom/sc7180-idp.dts | 1 -
> 1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 4e9149d..b295d01 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -348,7 +348,6 @@
> 		vddrf-supply = <&vreg_l2c_1p3>;
> 		vddch0-supply = <&vreg_l10c_3p3>;
> 		max-speed = <3200000>;
> -		clocks = <&rpmhcc RPMH_RF_CLK2>;
> 	};
> };

is anybody picking up this patch or should I take it through the bluetooth-next tree?

Regards

Marcel

