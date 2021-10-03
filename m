Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B62420156
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Oct 2021 13:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbhJCLd5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Oct 2021 07:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhJCLd4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Oct 2021 07:33:56 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BCDEC0613EC
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Oct 2021 04:32:09 -0700 (PDT)
Received: from [192.168.1.101] (83.6.167.124.neoplus.adsl.tpnet.pl [83.6.167.124])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 9C0B71F5FD;
        Sun,  3 Oct 2021 13:32:07 +0200 (CEST)
Message-ID: <cef85f62-7d26-593a-0d71-c5513254e2c5@somainline.org>
Date:   Sun, 3 Oct 2021 13:32:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 10/11] arm64: dts: qcom: Add SM7225 device tree
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211003083141.613509-1-luca@z3ntu.xyz>
 <20211003083141.613509-11-luca@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20211003083141.613509-11-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 03.10.2021 10:31, Luca Weiss wrote:
> The Snapdragon 750G (sm7225) is software-wise very similar to Snapdragon
> 690 (sm6350) with minor differences in clock speeds and as added here,
> it uses the Kryo 570 instead of Kryo 560.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm64/boot/dts/qcom/sm7225.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7225.dtsi
>
> diff --git a/arch/arm64/boot/dts/qcom/sm7225.dtsi b/arch/arm64/boot/dts/qcom/sm7225.dtsi
> new file mode 100644
> index 000000000000..7b2a002ca7ff
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7225.dtsi
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Luca Weiss <luca@z3ntu.xyz>
> + */
> +
> +#include "sm6350.dtsi"
> +
> +/* SM7225 uses Kryo 570 instead of Kryo 560 */
> +&CPU0 { compatible = "qcom,kryo570"; };
> +&CPU1 { compatible = "qcom,kryo570"; };
> +&CPU2 { compatible = "qcom,kryo570"; };
> +&CPU3 { compatible = "qcom,kryo570"; };
> +&CPU4 { compatible = "qcom,kryo570"; };
> +&CPU5 { compatible = "qcom,kryo570"; };
> +&CPU6 { compatible = "qcom,kryo570"; };
> +&CPU7 { compatible = "qcom,kryo570"; };
>
As we discussed in private, we discovered after some poking on the Xperia 10 III and FP4, Qualcomm decided to use the "lagoon" codename for at least 3 SoCs, two of which are 6350 and 7225, with the third (and possibly more, eh...) yet to be discovered. For now we can tell the max GPU clock is over 50% higher on the 7225, but we'll get to know more differences as we progress forward.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Konrad

