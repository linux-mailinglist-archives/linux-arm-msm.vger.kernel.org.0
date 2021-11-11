Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D18944DB58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 18:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234425AbhKKR6h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 12:58:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232366AbhKKR6f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 12:58:35 -0500
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83631C061766;
        Thu, 11 Nov 2021 09:55:46 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A3FA31FD2D;
        Thu, 11 Nov 2021 18:55:42 +0100 (CET)
Subject: Re: [PATCH] arm64: dts: qcom: Add support for SONY Xperia XZ2 / XZ2C
 / XZ3 (Tama platform)
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org, marijn.suijten@somainline.org,
        jamipkettunen@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211106191437.84943-1-konrad.dybcio@somainline.org>
 <fe19d7e6-8d31-a157-65d0-da53095485ea@somainline.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <25b855a7-aeb9-cbdb-b832-d6fab0914569@somainline.org>
Date:   Thu, 11 Nov 2021 18:55:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fe19d7e6-8d31-a157-65d0-da53095485ea@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 11/11/21 03:16, Konrad Dybcio ha scritto:
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
>> new file mode 100644
>> index 000000000000..6b088675f4b9
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
>> @@ -0,0 +1,442 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
>> + */
>> +
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +#include "sdm845.dtsi"
>> +#include "pm8005.dtsi"
>> +#include "pm8998.dtsi"
>> +#include "pmi8998.dtsi"
>> +
>> +/ {
>> +	qcom,msm-id = <321 0x20001>; /* SDM845 v2.1 */
>> +	qcom,board-id = <8 0>;
>> +
>> +	gpio-keys {
> 
> Whooops! It seems that I totally forgot to add a compatible to gpio-keys.. Could that be fixed when applying if the patch is otherwise good? Should it not be the case, I'll surely fix that in the next revision..


Just send a v2 of it, please. Makes it easier on the maintainers.

Apart from that,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

