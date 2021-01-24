Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D72E301D18
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 16:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbhAXPPK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 10:15:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbhAXPPI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 10:15:08 -0500
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B3EC061756
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jan 2021 07:14:13 -0800 (PST)
Received: from [192.168.1.101] (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E28E53EB8B;
        Sun, 24 Jan 2021 16:14:10 +0100 (CET)
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974-klte: Mark essential
 regulators
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <20210124135610.1779295-1-iskren.chernev@gmail.com>
 <20210124135610.1779295-4-iskren.chernev@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <c35f0541-dd72-8e1c-fd70-49740dae31c0@somainline.org>
Date:   Sun, 24 Jan 2021 16:14:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210124135610.1779295-4-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 24.01.2021 14:56, Iskren Chernev wrote:
> s1 and l12 regulators are used for the memory and cache on the Samsung
> S5 (klte). If they are turned off the phone shuts down. So mark them as
> always-on to prevent that from happening.
>
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
>  arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
> index 19c96b47a5dbd..27323403aa71d 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
> @@ -30,6 +30,7 @@ pma8084-regulators {
>  					pma8084_s1: s1 {
>  						regulator-min-microvolt = <675000>;
>  						regulator-max-microvolt = <1050000>;
> +						regulator-always-on;
>  					};
>  
>  					pma8084_s2: s2 {
> @@ -115,6 +116,7 @@ pma8084_l11: l11 {
>  					pma8084_l12: l12 {
>  						regulator-min-microvolt = <1800000>;
>  						regulator-max-microvolt = <1800000>;
> +						regulator-always-on;
>  					};
>  
>  					pma8084_l13: l13 {


Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Konrad

