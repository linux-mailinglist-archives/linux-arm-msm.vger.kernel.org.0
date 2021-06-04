Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA36839B7DD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 13:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhFDL3S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 07:29:18 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:16639 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbhFDL3S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 07:29:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622806052; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=YXjO1NBk4R6zfzdP/85v2mSrHJpM3+AAhXJfrh/G14w=;
 b=ER6BkK3JMydGb75rm/wME/A/r8twKZDhJaZges0P7WV1/wnrBTOQwzdHQuFellJD8H6Ewi0+
 MwJGI0slYLodelAT6nIAPHQfBwSkUMwsIR+tAWHXq3WKZqyk/xc9kE4CqyGl4a/CDxFmFWvA
 Xqw0a1cgoIHX7SKyqXGTUcPAL28=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60ba0e05e27c0cc77f096bce (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Jun 2021 11:27:01
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EEB6CC4338A; Fri,  4 Jun 2021 11:27:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F510C4360C;
        Fri,  4 Jun 2021 11:26:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 04 Jun 2021 16:56:57 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        mgautam@codeaurora.org, dianders@chromium.org, mka@chromium.org
Subject: Re: [PATCH 1/3] dt-bindings: pci: qcom: Document PCIe bindings for
 SC720
In-Reply-To: <CAE-0n53KTeF9NOrb+x7P1AG53FENRBGtCEcSxronBpJoww3jew@mail.gmail.com>
References: <1620382648-17395-1-git-send-email-pmaliset@codeaurora.org>
 <1620382648-17395-2-git-send-email-pmaliset@codeaurora.org>
 <CAE-0n53KTeF9NOrb+x7P1AG53FENRBGtCEcSxronBpJoww3jew@mail.gmail.com>
Message-ID: <cb2a6cd35df42314c5e5230bcac752be@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-08 01:29, Stephen Boyd wrote:
> Quoting Prasad Malisetty (2021-05-07 03:17:26)
>> Document the PCIe DT bindings for SC7280 SoC.The PCIe IP is similar
>> to the one used on SM8250. Add the compatible for SC7280.
>> 
>> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/pci/qcom,pcie.txt | 17 
>> +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt 
>> b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
>> index 0da458a..e5245ed 100644
>> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
>> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
>> @@ -12,6 +12,7 @@
>>                         - "qcom,pcie-ipq4019" for ipq4019
>>                         - "qcom,pcie-ipq8074" for ipq8074
>>                         - "qcom,pcie-qcs404" for qcs404
>> +                       - "qcom,pcie-sc7280" for sc7280
>>                         - "qcom,pcie-sdm845" for sdm845
>>                         - "qcom,pcie-sm8250" for sm8250
>> 
>> @@ -133,6 +134,22 @@
>>                         - "slave_bus"   AXI Slave clock
>> 
>>  - clock-names:
>> +       Usage: required for sc7280
>> +       Value type: <stringlist>
>> +       Definition: Should contain the following entries
>> +                       - "aux"         Auxiliary clock
>> +                       - "cfg"         Configuration clock
>> +                       - "bus_master"  Master AXI clock
>> +                       - "bus_slave"   Slave AXI clock
>> +                       - "slave_q2a"   Slave Q2A clock
>> +                       - "tbu"         PCIe TBU clock
>> +                       - "ddrss_sf_tbu" PCIe SF TBU clock
>> +                       - "pipe"        PIPE clock
>> +                       - "pipe_src"    PIPE MUX
> 
> Is pipe_src necessary? Is it the parent of the pipe clk? If so, please
> remove it and do whatever is necessary on the pipe clk instead of the
> parent of the clk.

Here pipe_src is MUX. Newer targets require changing pipe-clk mux to 
switch between pipe_clk and XO for GDSC enable.
After PHY init, need to configure MUX.
> 
>> +                       - "pipe_ext"    PIPE output clock
> 
> Is pipe output different from pipe?
> 
Yes, pipe_ext clock will generate after PHY init.
>> +                       - "ref"         REFERENCE clock
>> +
>> 
