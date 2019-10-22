Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86A42DFD9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2019 08:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387635AbfJVGPY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Oct 2019 02:15:24 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46760 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387488AbfJVGPY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Oct 2019 02:15:24 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id F1EAC60716; Tue, 22 Oct 2019 06:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571724923;
        bh=oeDinmeIyEmHGbM2kXwZ1rSYY0UZ8x6QIofWRLfG2rc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MfrXq7PmYsKcqoywn6kq67/7J9L+PKz8kWIbtiWiNyhE86zhQqbSrt065l4DIJ7P4
         Bysymhlxgs4WeCWYm+trrS7/LhDSithxPOR+3FR184UMr0Z0YBzAE0Q867KBg6x2mR
         eRVmaqDCPDIzMwcwcYxN++WnaDszh5tgwG/5igqQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.136.17] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BF1176078F;
        Tue, 22 Oct 2019 06:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571724922;
        bh=oeDinmeIyEmHGbM2kXwZ1rSYY0UZ8x6QIofWRLfG2rc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=oFLfKQJ4Y3SjophrXAvU3JsTEHzKIMbOlvdJa200wXoXFWlfJV5Oc2WkCqMKWJcuS
         AY2Q0MhMX8UZk5brkJ1d/cl22KXv6+pjUTAL0XT+dA7LJoL4wkEh+yOYALrHhikMv6
         Beg9P3OOwRanSwoCcfjTODFa7V8ePTdPXyp/cyGg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BF1176078F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v2 02/13] arm64: dts: sc7180: Add minimal dts/dtsi files
 for SC7180 soc
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
References: <20191021065522.24511-1-rnayak@codeaurora.org>
 <20191021065522.24511-3-rnayak@codeaurora.org>
 <20191022000833.GI20212@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <759a74e3-f2da-3200-0819-2c3d6fdd57e6@codeaurora.org>
Date:   Tue, 22 Oct 2019 11:45:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191022000833.GI20212@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias, thanks for the review

On 10/22/2019 5:38 AM, Matthias Kaehlcke wrote:
> Hi Rajendra,
> 
> I don't have all the hardware documentation for a full review, but
> find a few comments inline.
> 
[]..

>> +#include "sc7180.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. SC7180 IDP";
>> +	compatible = "qcom,sc7180-idp";
>> +
>> +	aliases {
>> +		serial0 = &uart2;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +};
>> +
>> +&qupv3_id_0 {
>> +	status = "okay";
>> +};
>> +
>> +&uart2 {
>> +	status = "okay";
>> +};
>> +
>> +/* PINCTRL - additions to nodes defined in sc7180.dtsi */
>> +
>> +&qup_uart2_default {
>> +	pinconf-tx {
>> +		pins = "gpio44";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	pinconf-rx {
>> +		pins = "gpio45";
>> +		drive-strength = <2>;
>> +		bias-pull-up;
>> +	};
>> +};
> 
> This config seems reasonable as default for a UART in general.
> Would it make sense to configure these in the SoC .dtsi?

I think the general rule of thumb that was followed was to have
all pinmux configurations in soc file and all pinconf setting in
the board, even though it meant a bit of duplication in some cases.
See [1] for some discussions around it that happened in the past.

[1] https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1603693.html

> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> new file mode 100644
>> index 000000000000..82bf7cdce6b8
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -0,0 +1,300 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * SC7180 SoC device tree source
>> + *
>> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/clock/qcom,gcc-sc7180.h>
> 
> Note: depends on "Add Global Clock controller (GCC) driver for SC7180"
> (https://patchwork.kernel.org/project/linux-arm-msm/list/?submitter=179717)
> which isn't merged yet.

Right, I did mention it in the cover letter, perhaps I should have mentioned it
as part of this patch as well.

[]..
>> +
>> +	soc: soc {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges = <0 0 0 0 0x10 0>;
>> +		dma-ranges = <0 0 0 0  0x10 0>;
>> +		compatible = "simple-bus";
>> +
>> +		gcc: clock-controller@100000 {
>> +			compatible = "qcom,gcc-sc7180";
> 
> 
> 
>> +			reg = <0 0x00100000 0 0x1f0000>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>> +		qupv3_id_0: geniqup@ac0000 {
> 
> The QUP enumeration is a bit confusing. The Hardware Register
> Description has QUPV3_0_QUPV3_ID_0 at 0x00800000 and
> QUPV3_1_QUPV3_ID_0 at 0x00a00000. This QUP apparently is
> the latter. In the SDM845 DT the QUP @ac0000 has the label
> 'qupv3_id_1', I guess this should be the same here.

I had a re-look at the documentation again and yes, you are
right, this seems exactly same as on sdm845 except that on
sdm845 the 2 blocks were named QUPV3_0_QUPV3_ID_1 at 0x00800000
and QUPV3_1_QUPV3_ID_1 at 0x00a00000.
I will match this up with the labeling approach we followed on
sdm845. Thanks.

> 
>> +			compatible = "qcom,geni-se-qup";
>> +			reg = <0 0x00ac0000 0 0x6000>;
>> +			clock-names = "m-ahb", "s-ahb";
>> +			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
>> +				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +			status = "disabled";
>> +
>> +			uart2: serial@a88000 {
>> +				compatible = "qcom,geni-debug-uart";
>> +				reg = <0 0x00a88000 0 0x4000>;
> 
> Related to the comment above: on SDM845 this UART has the label
> 'uart10'. I understand these are different SoCs, but could you
> please clarify the enumeration of the SC7180 QUPs and their ports?

I will move this to uart10 once I have the qup instance marked with id_1.
On sdm845 the qup_id_0 had SE instances from 0 to 7 and qup_id_1 had it
from 8 to 15. I will follow the same here so this uart instance would
remain the same as on sdm845, which is uart10.

thanks,
Rajendra

> 
>> +				clock-names = "se";
>> +				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&qup_uart2_default>;
>> +				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
>> +				status = "disabled";
>> +			};
>> +		};
>> +



-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
