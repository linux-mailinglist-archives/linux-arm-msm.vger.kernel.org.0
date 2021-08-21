Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7387E3F3B13
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Aug 2021 16:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbhHUOzs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Aug 2021 10:55:48 -0400
Received: from relay05.th.seeweb.it ([5.144.164.166]:46491 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbhHUOzs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Aug 2021 10:55:48 -0400
Received: from [192.168.1.101] (83.6.167.97.neoplus.adsl.tpnet.pl [83.6.167.97])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 305E23E9BE;
        Sat, 21 Aug 2021 16:55:04 +0200 (CEST)
Subject: Re: [PATCH 02/17] arm64: dts: qcom: Add SM6350 device tree
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210820204926.235192-1-konrad.dybcio@somainline.org>
 <20210820204926.235192-3-konrad.dybcio@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <0ae82e72-468b-58d7-aa27-18fade600a75@somainline.org>
Date:   Sat, 21 Aug 2021 16:55:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210820204926.235192-3-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 20.08.2021 22:49, Konrad Dybcio wrote:
> Add a base DT for SM6350 SoC
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 486 +++++++++++++++++++++++++++
>  1 file changed, 486 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm6350.dtsi
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> new file mode 100644
> index 000000000000..0526bc141a6d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -0,0 +1,486 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>

Small mistake, `#include <dt-bindings/gpio/gpio.h>` got sucked up into the rebase void..


Konrad

