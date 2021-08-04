Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 500ED3E0906
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 21:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240727AbhHDTwn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 15:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240716AbhHDTwn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 15:52:43 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0849AC0613D5
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Aug 2021 12:52:30 -0700 (PDT)
Received: from [192.168.1.101] (83.6.167.155.neoplus.adsl.tpnet.pl [83.6.167.155])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D24A33F36E;
        Wed,  4 Aug 2021 21:52:27 +0200 (CEST)
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: Fix incorrect cpu opp table
 entry
To:     Thara Gopinath <thara.gopinath@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210804132847.2503269-1-thara.gopinath@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <80efc386-6895-e67b-d26d-7ecf61e42d51@somainline.org>
Date:   Wed, 4 Aug 2021 21:52:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210804132847.2503269-1-thara.gopinath@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 04.08.2021 15:28, Thara Gopinath wrote:
> CPU0 frequency 768MHz is wrongly modeled as 576000000 hz in
> cpu0_opp_table. Use the correct value 768000000 hz.
>
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index cbf0d8d7d76d..5e6471e5e2fc 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -319,7 +319,7 @@ cpu0_opp5: opp-672000000 {
>  		};
>  
>  		cpu0_opp6: opp-768000000 {
> -			opp-hz = /bits/ 64 <576000000>;
> +			opp-hz = /bits/ 64 <768000000>;
>  			opp-peak-kBps = <1804000 19660800>;
>  		};
>  
>
