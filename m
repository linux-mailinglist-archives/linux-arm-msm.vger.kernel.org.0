Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBD2159637
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 18:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729470AbgBKRda (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 12:33:30 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39179 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729031AbgBKRd1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 12:33:27 -0500
Received: by mail-pf1-f196.google.com with SMTP id 84so5814697pfy.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2020 09:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lH4EbrzVbu3CvaS8sns78JlEG0bpnC0mv7bE+liJ2nA=;
        b=RH32kiQsCKo1Gs+FkFdDvj1Kq3PKeLTjbRXjVS542Tg6Gb8IzEOXCl8KrAydPkosHL
         SYGwlAdLYd5do6FGm6AtvSvYjLsBhTB3Zd2J02IAI1lWNxUZQ/5+ah4appWH9FO9tCfN
         4dmS1PhdaopzWfZZudmSODT/lwSAYlGW8ZyJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lH4EbrzVbu3CvaS8sns78JlEG0bpnC0mv7bE+liJ2nA=;
        b=ZgdpobSW/PmKUjcctKAhNntghDmJz8jXTteESJr/a2cGqH5++fhZlh9S0CV45tgWIz
         bsqllTu9Y6csypmuG+ugjSs2fEoRDR8hxecK15BmyGhZgMkdbhZViIIIovlbO+bfqewu
         qeSGBcPvGDQFZ7LkArO8PYphpjRu3cbBdBC+w4GU44yXbzrOuHfQ6BKhq5vkMl4jLTj9
         WfyeP+8FZE99AG01kLNptMDoleoV84L2EzQ2UxX0Q21Ts9SSaFPgv/zUhWaikksWrgw4
         mjwdkugKvhtpyB4s9sCL0q2SUO3nRozcCtawQNHlOSjZ2555MYJBsu58s8MsjmSRkeeo
         DyYA==
X-Gm-Message-State: APjAAAULtVDKfgJKAnbhix8lFtSVMPOx4uoai6jvS1IMviQ1ZwY/0zna
        giOPmMGjv28tPQZ5NWV068sQWQ==
X-Google-Smtp-Source: APXvYqxk99B0t8EHkrjFPb34havVNfFdZ7CHuqxMGO1VQir/2llQ9LuL+WBmfTO4aiFx3jXiqWC3cg==
X-Received: by 2002:a63:6c82:: with SMTP id h124mr7923471pgc.328.1581442405558;
        Tue, 11 Feb 2020 09:33:25 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id c26sm5104896pfj.8.2020.02.11.09.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2020 09:33:25 -0800 (PST)
Date:   Tue, 11 Feb 2020 09:33:23 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, hemantg@codeaurora.org,
        robh+dt@kernel.org, mark.rutland@arm.com, gubbaven@codeaurora.org
Subject: Re: [PATCH v1] arm64: dts: qcom: sc7180: Add node for bluetooth soc
 wcn3990
Message-ID: <20200211173323.GE18972@google.com>
References: <20200211121612.29075-1-bgodavar@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200211121612.29075-1-bgodavar@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 11, 2020 at 05:46:12PM +0530, Balakrishna Godavarthi wrote:

> subject: arm64: dts: qcom: sc7180: Add node for bluetooth soc wcn3990

Preferably say in the subjct that the node is added for the IDP board.

> Add node for bluetooth soc wcn3990.
> 
> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 388f50ad4fde..19f82ddc1f09 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -19,6 +19,7 @@
>  	aliases {
>  		hsuart0 = &uart3;
>  		serial0 = &uart8;
> +		bluetooth0 = &bluetooth;
>  	};
>  
>  	chosen {
> @@ -256,6 +257,16 @@
>  
>  &uart3 {
>  	status = "okay";

nit: add a blank line

> +	bluetooth: wcn3990-bt {
> +		compatible = "qcom,wcn3990-bt";
> +		vddio-supply = <&vreg_l10a_1p8>;
> +		vddxo-supply = <&vreg_l1c_1p8>;
> +		vddrf-supply = <&vreg_l2c_1p3>;
> +		vddch0-supply = <&vreg_l10c_3p3>;
> +		max-speed = <3200000>;
> +		clocks = <&rpmhcc RPMH_RF_CLK2>;
> +		status = "okay";

status is not needed here AFAIK.
