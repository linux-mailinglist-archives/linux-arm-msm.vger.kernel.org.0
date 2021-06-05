Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B3439C79A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jun 2021 12:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhFEK6C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Jun 2021 06:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbhFEK6C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Jun 2021 06:58:02 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724DFC061766
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jun 2021 03:56:14 -0700 (PDT)
Received: from [192.168.1.101] (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 49C973F0B2;
        Sat,  5 Jun 2021 12:56:12 +0200 (CEST)
Subject: Re: [PATCH V3 1/2] dt-bindings: clk: qcom: gcc-sm6125: Document
 SM6125 GCC driver
To:     Rob Herring <robh@kernel.org>,
        Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210526184325.675736-1-martin.botka@somainline.org>
 <20210602190841.GA3792989@robh.at.kernel.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <4072d11b-0d5c-df57-399c-5ead810d8947@somainline.org>
Date:   Sat, 5 Jun 2021 12:56:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602190841.GA3792989@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


> Dual license new bindings please:
>
> GPL-2.0-only OR BSD-2-Clause

Ack.


>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,gcc-sm6125.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Global Clock & Reset Controller Binding for SM6125
>> +
>> +maintainers:
>> +  - Konrad Dybcio <konrad.dybcio@somainline.org>
>> +
>> +description: |
>> +  Qualcomm global clock control module which supports the clocks, resets and
>> +  power domains on SM6125.
>> +
>> +  See also:
>> +  - dt-bindings/clock/qcom,gcc-sm6125.h
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,gcc-sm6125
> The normal ordering would be 'qcom,sm6125-gcc'

The current one is in line with all the other qcom clk drivers.


>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmcc.h>
>> +    clock-controller@1400000 {
>> +    compatible = "qcom,gcc-sm6125";
> Wrong indentation.

Ack.


Konrad

