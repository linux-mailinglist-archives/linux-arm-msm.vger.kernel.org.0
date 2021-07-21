Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D07393D153E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 19:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhGURBL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 13:01:11 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:58537 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbhGURBK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 13:01:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626889307; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=THtIv/A+ebq+WyEizX2cp5b7XW4WU+bpZu4ZDrccPOs=;
 b=h4UwGGi7W7RIbNQKUtylFBPdmFCtDcqcrEdl4Fj8GfTD+hRyUma5N6JOZzagsT/9bpf5M8qt
 T5E28gbSe8hIBijwQzLaFeK05tksrUXvC0GC2vg9zkZqe4xsdprDeYgjyy/5AeFE92bZkyz9
 j8QtRM7VYmSjjVHQ/0rX4gYFcGM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60f85c51e81205dd0ab8682d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 17:41:37
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C3B6BC433F1; Wed, 21 Jul 2021 17:41:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DD73FC4338A;
        Wed, 21 Jul 2021 17:41:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 21 Jul 2021 23:11:35 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     bjorn.andersson@linaro.org, mka@chromium.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, will@kernel.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org
Subject: Re: [PATCH v2 08/10] arm64: dts: qcom: sc7280: Add nodes to boot
 modem
In-Reply-To: <CAE-0n50HwmuYWnqs9TYJYEoB=-BV8Bbz+AMUUy5t9dtN1jSsjA@mail.gmail.com>
References: <1626775980-28637-1-git-send-email-sibis@codeaurora.org>
 <1626775980-28637-9-git-send-email-sibis@codeaurora.org>
 <CAE-0n50HwmuYWnqs9TYJYEoB=-BV8Bbz+AMUUy5t9dtN1jSsjA@mail.gmail.com>
Message-ID: <11b5493ecb6118ec8c5fd49ec7a85aa3@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-21 11:14, Stephen Boyd wrote:
> Quoting Sibi Sankar (2021-07-20 03:12:58)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 5ed7a511bfc9..3fb6a6ef39f8 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -1219,6 +1224,21 @@
>>                         };
>>                 };
>> 
>> +               imem@146aa000 {
> 
> is sram a more appropriate node name here? Is imem a generic node name
> in DT spec?

binding check for qcom,pil-info.yaml
didn't complain so I just followed
it. AFAICS, sram isn't mentioned in
generic node names either.

> 
>> +                       compatible = "syscon", "simple-mfd";
>> +                       reg = <0 0x146aa000 0 0x2000>;
>> +
>> +                       #address-cells = <2>;
>> +                       #size-cells = <2>;
>> +
>> +                       ranges = <0 0x0 0 0x146aa000 0 0x2000>;
>> +
>> +                       pil-reloc@94c {
>> +                               compatible = "qcom,pil-reloc-info";
>> +                               reg = <0 0x94c 0 0xc8>;
>> +                       };
>> +               };
>> +

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
