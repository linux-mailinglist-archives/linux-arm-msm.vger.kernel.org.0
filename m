Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A9B3FA6C7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Aug 2021 18:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhH1QXa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 12:23:30 -0400
Received: from relay08.th.seeweb.it ([5.144.164.169]:37151 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhH1QXa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 12:23:30 -0400
Received: from [192.168.1.101] (83.6.168.105.neoplus.adsl.tpnet.pl [83.6.168.105])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id BBAF03E9C0;
        Sat, 28 Aug 2021 18:22:36 +0200 (CEST)
Subject: Re: [PATCH v2 02/18] arm64: dts: qcom: Add SM6350 device tree
To:     Maulik Shah <mkshah@codeaurora.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Hector Martin <marcan@marcan.st>,
        Vinod Koul <vkoul@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org
References: <20210828131814.29589-1-konrad.dybcio@somainline.org>
 <20210828131814.29589-2-konrad.dybcio@somainline.org>
 <55db46ad-e255-7d8f-f284-96a7d807e5d9@codeaurora.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <95c5001a-87dc-2548-97de-538da713b9b6@somainline.org>
Date:   Sat, 28 Aug 2021 18:22:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <55db46ad-e255-7d8f-f284-96a7d807e5d9@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


>> +
>> +        tcsr_mutex: hwlock@1f40000 {
>> +            compatible = "qcom,tcsr-mutex";
>> +            reg = <0x0 0x01f40000 0x0 0x40000>;
>> +            #hwlock-cells = <1>;
>> +        };
>> +
>> +        pdc: interrupt-controller@b220000 {
>> +            compatible = "qcom,sm6350-pdc", "qcom,pdc";
>> +            reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x64>;
>
> The second reg  0x17c000f0 is neither documented nor used in PDC irq chip driver. can you please remove it?
>
> Thanks,
> Maulik
>
Wouldn't it make more sense to keep it (like in other PDC-enabled SoCs' device trees) so that there's no

need to add it back when the driver gains support for spi_configure_type (I believe that's what it's used for)?


Konrad

