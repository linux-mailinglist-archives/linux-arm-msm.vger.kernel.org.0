Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B786F3FA763
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Aug 2021 21:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbhH1Tox (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 15:44:53 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:10053 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230316AbhH1Tow (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 15:44:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630179841; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EzEkY2UNfFhXjc4UKN2F2zDkGNQ5JRlcjSo43WdLnzM=; b=WZXpmiaGb02TCUmcwxgIKyyQw/U1MYyxDu6dhxkH8uxtyn4FEgTgWtHqH9mPk91hlO8lcXxc
 /wgMa0E3H4vilvirBC0jdRLL7sU2NRd8macVmdrnHgNFFOTQGIZRLudNPPeRUfxgnpfzlztk
 aJEP2O63efeiEHpk3bM/3OqK0Mk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 612a92014cd9015037ed25ca (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 28 Aug 2021 19:44:01
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1619FC4338F; Sat, 28 Aug 2021 19:44:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.87.126])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A2D9C4338F;
        Sat, 28 Aug 2021 19:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 0A2D9C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2 02/18] arm64: dts: qcom: Add SM6350 device tree
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
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
 <95c5001a-87dc-2548-97de-538da713b9b6@somainline.org>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <e483238e-29ac-b1ef-ed80-d5ffdbca83bf@codeaurora.org>
Date:   Sun, 29 Aug 2021 01:13:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <95c5001a-87dc-2548-97de-538da713b9b6@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 8/28/2021 9:52 PM, Konrad Dybcio wrote:
>>> +
>>> +        tcsr_mutex: hwlock@1f40000 {
>>> +            compatible = "qcom,tcsr-mutex";
>>> +            reg = <0x0 0x01f40000 0x0 0x40000>;
>>> +            #hwlock-cells = <1>;
>>> +        };
>>> +
>>> +        pdc: interrupt-controller@b220000 {
>>> +            compatible = "qcom,sm6350-pdc", "qcom,pdc";
>>> +            reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x64>;
>> The second reg  0x17c000f0 is neither documented nor used in PDC irq chip driver. can you please remove it?
>>
>> Thanks,
>> Maulik
>>
> Wouldn't it make more sense to keep it (like in other PDC-enabled SoCs' device trees) so that there's no
>
> need to add it back when the driver gains support for spi_configure_type (I believe that's what it's used for)?
The second reg in some of the PDC enabled SoCs' went in since it may 
have slipped throgh code reviews when using downstream
patch as is on upstream.
Also the bindings document for PDC is still in txt, so yaml check could 
not catch the extra register which is not documented.

An attempt to add support for spi_configure_type [1] & [2] had 
suggestion either to access second reg via mailbox or
add another level of irqchip hierarchy between PDC to GIC to configure 
SPI type. Unless both [1] and [2] patch can go in as
PDC irqchip driver won't gain support to use it. (using mailbox approch 
will have mailbox driver to access this register and PDC node may 
mention which mailbox to use).

[1] 
https://patchwork.kernel.org/project/linux-arm-msm/patch/1568411962-1022-7-git-send-email-ilina@codeaurora.org/

[2] 
https://patchwork.kernel.org/project/linux-arm-msm/patch/1568411962-1022-8-git-send-email-ilina@codeaurora.org/

Thanks,
Maulik

>
>
> Konrad
>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

