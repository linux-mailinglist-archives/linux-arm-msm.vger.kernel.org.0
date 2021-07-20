Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE0AC3CF4D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 08:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236747AbhGTGO3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 02:14:29 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:56060 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239908AbhGTGOV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 02:14:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626764100; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8FhdUAwmy3EliSln/k+/LZb2PVAFhEXySDuWBjnF1ro=;
 b=u9Hd/4+zo1jS7y9jTTyLTpTUuE8DbGR6UxvMKVwNyywfzcMON9XJpzgRWrqxVV95Zlu90i7J
 A0wAAt5j3Se3uTdlCg5TNciV7JXdi1vGEEUeP/eeAK0fRtncAKGoPdPx5u5FcdlRgCR/VsYt
 qgvlXQj33/Jlf/ejzu49Oo67abs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60f67330fcf9fe7b782366aa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Jul 2021 06:54:40
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 28F98C43217; Tue, 20 Jul 2021 06:54:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8782EC433F1;
        Tue, 20 Jul 2021 06:54:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 20 Jul 2021 12:24:39 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: sc7280: Add PCIe and PHY related
 nodes
In-Reply-To: <CAE-0n506Phfr=HBYgg+KDHaDAN7+GqmJSeviv7mpY=x973yd5A@mail.gmail.com>
References: <1626443927-32028-1-git-send-email-pmaliset@codeaurora.org>
 <1626443927-32028-3-git-send-email-pmaliset@codeaurora.org>
 <CAE-0n506Phfr=HBYgg+KDHaDAN7+GqmJSeviv7mpY=x973yd5A@mail.gmail.com>
Message-ID: <40f735b0f43873f1a68c53eaab0e1590@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-17 01:01, Stephen Boyd wrote:
> Quoting Prasad Malisetty (2021-07-16 06:58:45)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index a8c274a..06baf88 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -15,6 +15,7 @@
>>  #include <dt-bindings/reset/qcom,sdm845-pdc.h>
>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>>  #include <dt-bindings/thermal/thermal.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> 
>>  / {
>>         interrupt-parent = <&intc>;
>> @@ -546,6 +547,118 @@
>>                         #power-domain-cells = <1>;
> 
> Is this the gpucc node? At address 3d90000? Please sort the nodes based
> on their address, so this would be 1c08000 which comes before gpucc and
> some others in this file.
> 
sure, I will move it accordingly.
>>                 };
>> 
>> +               pcie1: pci@1c08000 {
>> +                       compatible = "qcom,pcie-sc7280", 
>> "qcom,pcie-sm8250", "snps,dw-pcie";
>> +                       reg = <0 0x01c08000 0 0x3000>,
>> +                             <0 0x40000000 0 0xf1d>,
>> +                             <0 0x40000f20 0 0xa8>,
>> +                             <0 0x40001000 0 0x1000>,
>> +                             <0 0x40100000 0 0x100000>;
>> +
