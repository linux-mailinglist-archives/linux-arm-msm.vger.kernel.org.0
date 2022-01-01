Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A33482849
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jan 2022 20:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232531AbiAATNX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Jan 2022 14:13:23 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.221]:19228 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbiAATNX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Jan 2022 14:13:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1641064398;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=NtW5+GTCifJtH87PvH7u0t1ZLKncjFVegVbGrKmFMO4=;
    b=dH5R+HMAQHrNB/BZFBPgTdd9JkVLKFANvnkov6NxtDjwoGQCKR4+Bn034SuKvyDkjH
    nN+zLKcjNe7yhYHsvRqSwvrnjW79p5Eb9AwdWg3nQLWkv/LUEuixhwpEJkKIPQOt73AW
    HnkBsNv3GM8IQbFxNsx31slxjw0X4PNS8hy+RgXjDfJARpAMlNwhWH9jd6eC53iTuUwh
    xjTsw2zXatIO/qUEcm1bg4sU2242l7j3lkEmu0POZhLYlu+H4dBK2Icf8lk3H9pViSC4
    UaiB667IPgOvB0uUd7mBCOrPs85C4ZKhIbGUwTRALJmsUPoHnWBDqLjMUz3tybsVFxkd
    Q7oA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLUrKY7lg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.35.3 AUTH)
    with ESMTPSA id x08baey01JDIbAj
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sat, 1 Jan 2022 20:13:18 +0100 (CET)
Date:   Sat, 1 Jan 2022 20:13:12 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Petr Vorel <petr.vorel@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Julian Ribbeck <julian.ribbeck@gmx.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8916-j5: Fix typo
Message-ID: <YdCnyBpSrvdimVIl@gerhold.net>
References: <20211231213635.116324-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211231213635.116324-1-petr.vorel@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 31, 2021 at 10:36:35PM +0100, Petr Vorel wrote:
> Fixes: bd943653b10d ("arm64: dts: qcom: Add device tree for Samsung J5 2015 (samsung-j5)")
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Oops, thanks for spotting this!

FWIW:
Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
> index 687bea438a57..6c408d61de75 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
> @@ -41,7 +41,7 @@ volume-up {
>  		};
>  
>  		home-key {
> -			lable = "Home Key";
> +			label = "Home Key";
>  			gpios = <&msmgpio 109 GPIO_ACTIVE_LOW>;
>  			linux,code = <KEY_HOMEPAGE>;
>  		};
> -- 
> 2.34.1
> 
