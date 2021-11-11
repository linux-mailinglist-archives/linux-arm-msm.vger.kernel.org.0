Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 415D044DD2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 22:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbhKKVlQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 16:41:16 -0500
Received: from relay02.th.seeweb.it ([5.144.164.163]:40147 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233544AbhKKVlQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 16:41:16 -0500
Received: from [192.168.1.101] (83.6.165.118.neoplus.adsl.tpnet.pl [83.6.165.118])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6AABD1FECE;
        Thu, 11 Nov 2021 22:38:24 +0100 (CET)
Message-ID: <9adb5f50-6156-84d1-5909-f11f06791b04@somainline.org>
Date:   Thu, 11 Nov 2021 22:38:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Enable
 Simple Framebuffer
Content-Language: en-US
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexey Min <alexey.min@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Martin Botka <martin.botka@somainline.org>
References: <20211111031635.3839947-1-danct12@riseup.net>
 <20211111031635.3839947-8-danct12@riseup.net>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20211111031635.3839947-8-danct12@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11.11.2021 04:16, Dang Huynh wrote:
> This lets the user sees the framebuffer console.
> 
> Reviewed-by: Caleb Connolly <caleb@connolly.tech>
> Reviewed-by: Martin Botka <martin.botka@somainline.org>
> Reviewed-by: Konrad Dybcio <konradybcio@gmail.com>
Drop.

> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>  .../boot/dts/qcom/sdm660-xiaomi-lavender.dts   | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> index 8de3e111f427..712392545c2e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> @@ -23,7 +23,20 @@ aliases {
>  	};
>  
>  	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
>  		stdout-path = "serial0:115200n8";
> +
> +		framebuffer0: framebuffer@9d400000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0x9d400000 0 (1080 * 2340 * 4)>;
> +			width = <1080>;
> +			height = <2340>;
> +			stride = <(1080 * 4)>;
> +			format = "a8r8g8b8";
> +		};
>  	};
>  
>  	vph_pwr: vph-pwr-regulator {
> @@ -61,6 +74,11 @@ ramoops@a0000000 {
>  			ftrace-size = <0x0>;
>  			pmsg-size = <0x20000>;
>  		};
> +
> +		framebuffer_mem: memory@9d400000 {
> +			reg = <0x0 0x9d400000 0x0 0x23ff000>;
> +			no-map;
> +		};
>  	};
>  };
>  

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
