Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A4D3A6604
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 13:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236183AbhFNLwL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 07:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235743AbhFNLvR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 07:51:17 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CFB7C061767;
        Mon, 14 Jun 2021 04:49:14 -0700 (PDT)
Received: from [192.168.1.101] (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2E2233EE2F;
        Mon, 14 Jun 2021 13:49:09 +0200 (CEST)
Subject: Re: [PATCH V1] arm64: dts: qcom: sc7180: Added xo clock for eMMC and
 Sd card
To:     sbhanu@codeaurora.org
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, vbadigan@codeaurora.org,
        rampraka@codeaurora.org, sayalil@codeaurora.org,
        sartgarg@codeaurora.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, sibis@codeaurora.org,
        okukatla@codeaurora.org, djakov@kernel.org, cang@codeaurora.org,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
References: <1623309107-27833-1-git-send-email-sbhanu@codeaurora.org>
 <dd685abc-c332-cd0c-af6a-d2f1116cef05@somainline.org>
 <b37cd4429600383619e4a1375802aeb6@codeaurora.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <0218984d-3cf9-1fc4-9f11-81a4e7df956d@somainline.org>
Date:   Mon, 14 Jun 2021 13:49:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b37cd4429600383619e4a1375802aeb6@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 14.06.2021 13:44, sbhanu@codeaurora.org wrote:
> On 2021-06-10 13:24, Konrad Dybcio wrote:
>> Hi,
>>
>>
>>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>> @@ -701,8 +701,9 @@
>>>              interrupt-names = "hc_irq", "pwr_irq";
>>>
>>>              clocks = <&gcc GCC_SDCC1_APPS_CLK>,
>>> -                    <&gcc GCC_SDCC1_AHB_CLK>;
>>> -            clock-names = "core", "iface";
>>> +                    <&gcc GCC_SDCC1_AHB_CLK>,
>>> +                    <&rpmhcc RPMH_CXO_CLK>;
>>
>> Don't these clocks fit in 100 chars?
> These two clocks can fit in 100 chars but we have 3 clocks they don't fit in 100 chars.

You're right.


With the space before xo,

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Konrad

