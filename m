Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78B26396FE3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 11:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233351AbhFAJHV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 05:07:21 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:12736 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233671AbhFAJHH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 05:07:07 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1622538324; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Dm6jieNM34nq2NFzwsY8+gH7Px5iq2iF9fjYK/iu9UWp1gE3lRl6XSXkm5LnhlYRdq
    EQjNHjIefqIZlNPxb6A0KZCQtxIQKt+7whaV/fcQYiczAD0/orjmZHXBz/Wg01xTGWm2
    /JQ4240nH7wTLH03UyyiRX14PRywTh8Qvcgq0qGpqrcRiwe88fcuwFl4HrI/gXRiKqgC
    bI0rgCAee0GLAEyg6MQBx49AzI+2uJK77aqVVu715NyzlIfUpigFqieHx4VJ9Ch4ML+K
    wNVMmSRmDrqcHwTdLWBdIi02kprIPqfizP2B95cEyOfOBMeUHfLY7I0AC81C8n85yvRY
    y5Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622538324;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=oYoUHhMgoV+c2cRCVemxTwtrhdXd/jbjcuXHuxrMvc0=;
    b=HpyvRDssuYbffpKN033XPVEmE+KIFGfcueYUyD7a2gdjROrNUUer+dN+JmSjatiQdr
    3V4t1FfTH6Hx6fSMRtLBGA85oqzbhv+ySB0Myli4QNJK2X2VQKxiNQIhRMTCawqbkY/w
    dIMHSrQ9/5vlEPJ0DhJnE7gU5P+Kh8VDSSuyrEQ5EVCPAAsSdpTOpsPyNnIg1pqb9aSF
    ekYutWDHrY0uUCq/h+dfAY00j2/X5c3ev10hRAPXkox45eHaHyefsZyYr4bKn8Wa0OLD
    sM83JiCcHQTLF/NO5/hCRFRY5fZy2QP2B+W617ybISBnJ6SFCXIcPd8k6RoWVldTlij6
    vPQg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622538324;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=oYoUHhMgoV+c2cRCVemxTwtrhdXd/jbjcuXHuxrMvc0=;
    b=l/aOrUc18cL4o2Em4ISO+VSnjK16WY05hxC+zzGOR6jxBElRwkbcAGhy1msUhZ31bn
    s7lneKXDb3AM02fpuQ4ioPwBH06ykcZCkM0bvK4gGG/LTaCjEyapsNhvK9EQ06Pkqnjt
    U6ruonJ8C0CixkBduVXdMvpzoYQpVzDKkj6JEAa2sUnYLxsrWx0zXLxp7yAGcktCm+RR
    gEpvCQRpba8rbDtxbMYyhxGgXPXnoU+QvS9kShpFxU1D887nqUBjIPHZZBTTLP+jQkdJ
    f55rxS4zLGM/svisxjwYMKEF6MvL+uHT8mlD2gLd/Iz6jfQWB1VP8NE3/cRofXQDcLXR
    KPOw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7Ic/MaIo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.26.3 DYNA|AUTH)
    with ESMTPSA id U0b2c9x5195ORGT
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 1 Jun 2021 11:05:24 +0200 (CEST)
Date:   Tue, 1 Jun 2021 11:05:17 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Anibal Limon <anibal.limon@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: apq8016-sbc: Update modem and WiFi
 firmware path
Message-ID: <YLX4TfuxEnjQ3fhi@gerhold.net>
References: <20210531224453.783218-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210531224453.783218-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 31, 2021 at 03:44:53PM -0700, Bjorn Andersson wrote:
> The firmware for the modem and WiFi subsystems platform specific and is
> signed with a OEM specific key (or a test key). In order to support more
> than a single device it is therefor not possible to rely on the default
> path and stash these files directly in the firmware directory.
> 
> This has already been addressed for other platforms, but the APQ8016 SBC
> (aka db410c) was never finished upstream.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

As far as I can tell,
"[PATCH 2/5] wcn36xx: Allow firmware name to be overridden by DT"
was never applied so with this patch DB410c fails to request the
"qcom/msm8916/WCNSS_qcom_wlan_nv.bin" firmware. Perhaps you need to
resend that one or poke whoever is responsible to apply that.

Once the wcn36xx patch was applied somewhere:
Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
Tested-by: Stephan Gerhold <stephan@gerhold.net>

Thanks,
Stephan

> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 12 ++++++++++++
>  arch/arm64/boot/dts/qcom/msm8916.dtsi     |  2 +-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> index 6aef0c2e4f0a..448e3561ef63 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -305,6 +305,12 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mpss {
> +	status = "okay";
> +
> +	firmware-name = "qcom/msm8916/mba.mbn", "qcom/msm8916/modem.mbn";
> +};
> +
>  &pm8916_resin {
>  	status = "okay";
>  	linux,code = <KEY_VOLUMEDOWN>;
> @@ -312,6 +318,8 @@ &pm8916_resin {
>  
>  &pronto {
>  	status = "okay";
> +
> +	firmware-name = "qcom/msm8916/wcnss.mbn";
>  };
>  
>  &sdhc_1 {
> @@ -394,6 +402,10 @@ &wcd_codec {
>  	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
>  };
>  
> +&wcnss_ctrl {
> +	firmware-name = "qcom/msm8916/WCNSS_qcom_wlan_nv.bin";
> +};
> +
>  /* Enable CoreSight */
>  &cti0 { status = "okay"; };
>  &cti1 { status = "okay"; };
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 4f06c0a9c425..6abe0f8edb55 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1738,7 +1738,7 @@ smd-edge {
>  
>  				label = "pronto";
>  
> -				wcnss {
> +				wcnss_ctrl: wcnss {
>  					compatible = "qcom,wcnss";
>  					qcom,smd-channels = "WCNSS_CTRL";
>  
> -- 
> 2.29.2
> 
