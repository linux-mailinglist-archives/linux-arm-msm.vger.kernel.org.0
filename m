Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 766D0342DDD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Mar 2021 16:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbhCTPld (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Mar 2021 11:41:33 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:17149 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhCTPlY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Mar 2021 11:41:24 -0400
X-Greylist: delayed 351 seconds by postgrey-1.27 at vger.kernel.org; Sat, 20 Mar 2021 11:41:24 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1616254522; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=pdVm1BECG7z5RHhH2fMcISmllJm3H+t3ER07vhwsqiFloELgvJuXLlAe2TjVqi57Um
    sHdbaJlzZFRIapxs8zLnD8KqsUZ9dPJA1IdTbQxoSUD5hnROxF8Ixndrx5L/kPwfmeUl
    xWTiJY99J/VJ9ztNDZ/HVciDkowkjyjafyIstQRe472JoiOyliomRRZb75ERpXb6+B+O
    Qc2tX6Kfy5spC65WVu7EDrnn4t/BiVnZnihTXiezCVhUY0Q2hclXDlB1yoD/uFVkvuYQ
    +ZbTNW2KvIWeOFU39n4lxGno796D8fAncx/OSGWmNpa/gQjiZ34Q1f7mcatX8x7GGu7B
    PiCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1616254522;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=QHWOkffdTi9mH4MY3pJLDkHpM7/c2JtbJdtUlv/keVI=;
    b=Rr8TPbxH6S6HFr4DRWZCXLPtRxIyrQ79l15cP6Eq4fzrXX5/5R1qBr85TFogDXX+sK
    il2LDZ1nZIjfW5vaa/LSRhaSn7FhFfpJyGmPA6sk7YBP4E9WtizAzQ2chnBXTfhN6lfk
    /OPqchcWOWVZ1eh6mf1jjoQmLmzimTjP35+d+JZUd6OSieG66dWMF/RDzEN24sJubVr/
    0BZO+m0+aMnFKBfCDmctN4fWVzObseyh1eVZITUQ1Y2H7E+nMj5uSoUpMMx/f7OoN06o
    unaN99Rd8Q4bcsA/geaMvAOL2dV4b5D3DTMjHGyK0Hqhg7lpf0qPXqj9PiMKdaqprq+M
    P/Dw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1616254522;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=QHWOkffdTi9mH4MY3pJLDkHpM7/c2JtbJdtUlv/keVI=;
    b=Czk3uAxGR4I8PZhAeqC+jbUhzlojxc3w/wqIGmkFA63YHFnmLS2gXFOzrkP/ILrZRq
    r923gdhcfr8j98FHlXq/U4QFZSkPwz5MfCYRoS6OcUAONWiy1P5T+KhfWrqaZdMHuVVQ
    qYvH1ZuNtTRPZACaSmH8hpj2bKzVZ8V+3V7ZwXX9BTGXoy/njRKqOSH5JnnCc5X1g+KY
    wJ0OaM2BIIpXcA6d45yqzO/StCaf4t5TwaLaBmkBiz10R1MIdizGQhizqFcH+4Kj+Xnq
    2YyyYi2WmuuCMFkBg+egr6hO/vZ9VmKXRsp6aGc66sviJChRK/saxZfK0+JX9i1E7Xa0
    ZIWw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7Icip"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.21.0 DYNA|AUTH)
    with ESMTPSA id Q03f86x2KFZLKwH
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sat, 20 Mar 2021 16:35:21 +0100 (CET)
Date:   Sat, 20 Mar 2021 16:35:20 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH] arm64: dts: msm8916: Enable CoreSight STM component
Message-ID: <YFYWOOdHT/qJk4Mr@gerhold.net>
References: <20210320025942.487916-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210320025942.487916-1-leo.yan@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Leo,

On Sat, Mar 20, 2021 at 10:59:42AM +0800, Leo Yan wrote:
> From: Georgi Djakov <georgi.djakov@linaro.org>
> 
> Add DT binding for CoreSight System Trace Macrocell (STM) on msm8916,
> which can benefit the CoreSight development on DB410c.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi |  1 +
>  arch/arm64/boot/dts/qcom/msm8916.dtsi     | 27 +++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> index 3a9538e1ec97..dd87e5d739ab 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -406,6 +406,7 @@ &wcd_codec {
>  &etm1 { status = "okay"; };
>  &etm2 { status = "okay"; };
>  &etm3 { status = "okay"; };
> +&stm { status = "okay"; };
>  &etr { status = "okay"; };
>  &funnel0 { status = "okay"; };
>  &funnel1 { status = "okay"; };

This is alphabetically ordered so &stm should be on the line before &tpiu.

> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 402e891a84ab..892f1772e53c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> [...]
> @@ -882,6 +889,26 @@ etm3_out: endpoint {
>  			};
>  		};
>  
> +		stm: stm@802000 {

And these nodes are sorted by their unit address (0x802000),
so stm@802000 should be the first coresight node, before cti@810000.

> +			compatible = "arm,coresight-stm", "arm,primecell";
> +			reg = <0x802000 0x1000>,
> +			      <0x9280000 0x180000>;

And please pad these addresses with zeroes so the order is more easily
visible, i.e.

+			reg = <0x00802000 0x1000>,
+			      <0x09280000 0x180000>;

Thanks!
Stephan
