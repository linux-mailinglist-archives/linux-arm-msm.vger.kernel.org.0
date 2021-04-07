Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1EBD3575A9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 22:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355964AbhDGUOo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 16:14:44 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:27684 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355985AbhDGUON (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 16:14:13 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617826438; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=jR5co6wWtMp607WNxinvpmvHEacZ4QE/vjFtJ87CmDmb9mzxAclr8ZUi7PhCu3086e
    7PFxcTI4j+fiBo5VI3sq6Y3JU5IE/GQd4IpERe7FKJdwSU2eQTeiAKIqsqnaNfDWwP5h
    3x1XOqtZwUt6eZn/J2Z7TKukJJaldyuJuDRt0ceHulOU1GX2G3Ot6FZjmAwjTC9hhSh8
    lGZDn450Ef50uYFQCXW/uQoWGow1N2IoxxpuhJQCYsmKAL888MmC6gOBivGgWSDuz5Xp
    qSszD/3vFWZ4HfpOf70pWksNW7tCqwlLX9MJmPNzyDXYIXPLIgieJ5IWRCKgNAmATMps
    gW6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1617826438;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=bfFj8MlFnJ3DSyjDS7UnoU9JgxgRFPMy/CO9fnHoUaI=;
    b=TpBnAYA7eHhJ1diSTWJZ7itK2IjdAC7rd4WB1vWT84ei5ik/cep0/e7E6XGGYao0ZZ
    wRUyFSdqTqYvPTDmu4FkPmj22EmtfFVokFR+tNc+1B/U4W7KH6Io0emAlJ5caE5JgP6/
    m5DHE2mxbchtEO8QNsM6GQr7OETEe3hoG/4mmrIKJQj0G8tLppW1K7HKkJTh70ezqzcy
    3r/NF0ma631H63wVnWYI6elZdbYl0oj5exCNj+llUpElCjBgKoUQs6EiFgC8WfQitSKx
    SSUw/XudXFRnJkBecff3UZKpdH8S8u3KrNzkayk+F4UC4f5L24WMS94ot/KewT5av7OP
    sJ4g==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1617826438;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=bfFj8MlFnJ3DSyjDS7UnoU9JgxgRFPMy/CO9fnHoUaI=;
    b=hr3GfXx0xVXCmOs16+Yw8QRiT+xUG8ppFkqXSLrtbtA1smBvTIFyhRKQ+j/6lSo1tU
    44BZwmoGP3oPv0qr5iM89EYQfO/gAlZ0aLX7lsILcdd+AYGl7VLG+NkOE5I9QutPClIS
    eord6PvlKvLyJrCivK+RIu864Cas7z1qjyudSOZCNeYZx6W1Yc3p5xqYLP9i9NyRbV2j
    m2vNkNKg2z8bUOC/HKIOQ4+qt5PK6MJZnDMhJYKTnrm12PiUxdO0ydBODgsMxLMxnTTG
    tCk730Btwa1/pSna00Dmijtjh5Jr2WN3QhNC2QZQ9moLbPTmrwO2ZSz5uDO3hqTGY71g
    kjNA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j6Ic/Nb4o="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.24.0 DYNA|AUTH)
    with ESMTPSA id 409abax37KDv3CV
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 7 Apr 2021 22:13:57 +0200 (CEST)
Date:   Wed, 7 Apr 2021 22:13:52 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Joel Selvaraj <jo@jsfamily.in>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [RESEND PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add
 audio support
Message-ID: <YG4SgBpOqg5i7A0e@gerhold.net>
References: <BN6PR2001MB17963B035BEFCBC740FEB6A9D9759@BN6PR2001MB1796.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR2001MB17963B035BEFCBC740FEB6A9D9759@BN6PR2001MB1796.namprd20.prod.outlook.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 08, 2021 at 01:37:53AM +0530, Joel Selvaraj wrote:
> This patch adds audio support for Xiaomi Poco F1 phone. Phone's primary
> Mic and 3.5mm Headphone jack are handled through the SDM845 sound card
> and WCD9340 codec.
> 
> Tested-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
> ---
>  .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> index 86cbae63eaf7..5b5786595cdb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> [...]
> @@ -257,6 +281,73 @@ &sdhc_2 {
>  	cd-gpios = <&tlmm 126 GPIO_ACTIVE_HIGH>;
>  };
>  
> +&sound {
> +	compatible = "qcom,db845c-sndcard";
> +	pinctrl-0 = <&quat_mi2s_active
> +			&quat_mi2s_sd0_active>;
> +	pinctrl-names = "default";
> +	model = "Xiaomi Poco F1";
> +	audio-routing =
> +		"RX_BIAS", "MCLK",
> +		"AMIC1", "MIC BIAS1",
> +		"AMIC2", "MIC BIAS2",
> +		"AMIC3", "MIC BIAS3",
> +		"MM_DL1",  "MultiMedia1 Playback",
> +		"MM_DL2",  "MultiMedia2 Playback",
> +		"MultiMedia3 Capture", "MM_UL3";
> +

FYI, the MM_DL/MM_UL audio routes should not be necessary anymore since
commit 6fd8d2d275f7 ("ASoC: qcom: qdsp6: Move frontend AIFs to q6asm-dai")
(part of Linux 5.12). Can you try if everything still works without them?

Thanks,
Stephan
