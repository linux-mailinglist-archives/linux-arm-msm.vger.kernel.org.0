Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB166C93C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2019 08:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbfGRGYS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jul 2019 02:24:18 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44240 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbfGRGYS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jul 2019 02:24:18 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DC788615E6; Thu, 18 Jul 2019 06:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563431056;
        bh=/QI8ucl9LYpJopinminlJ9+z32qpUYhGxQmZgFux1Bc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=M7r4CJrN70QQLKwwswaPy8ChFTskWmqVNKn8odnzcaaJh4b5T+zVPVFf8tFcvf42M
         zrLkdvEtKjoo71tTFP1TvgP7IxhDtNcegka6e8EIcmMq++J0TSIgsoejcGkV4phIuu
         8A23B0KJNdGRrj4HZY06ChAhm/xWZvNESHke/fkA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id BAB43609CD;
        Thu, 18 Jul 2019 06:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563431055;
        bh=/QI8ucl9LYpJopinminlJ9+z32qpUYhGxQmZgFux1Bc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dansnQKB4/NEh6yA2vt+5WYGis1xntQJbFIFhA9OoJ8bt4AVFLiuD95c4aQBAFen3
         OyydVtJ4kCcOiX86hbcp6PNA0NnK8kZLAJVOAAKc34Baruax9ML2+nmqOP3AZ9xfZN
         iX3MLgjSZUwqNe5oxiodHJ8eYaQI2bVrCA2sf2aQ=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 18 Jul 2019 11:54:15 +0530
From:   gokulsri@codeaurora.org
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org,
        sricharan@codeaurora.org
Subject: Re: [PATCH 12/12] arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
In-Reply-To: <20190717201326.DCEB520880@mail.kernel.org>
References: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org>
 <1562859668-14209-13-git-send-email-gokulsri@codeaurora.org>
 <20190717201326.DCEB520880@mail.kernel.org>
Message-ID: <d818af556d18808301e12beeb8427e6e@codeaurora.org>
X-Sender: gokulsri@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-07-18 01:43, Stephen Boyd wrote:
> Quoting Gokul Sriram Palanisamy (2019-07-11 08:41:08)
>> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi 
>> b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> index 6a61a63..c24e3f6 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> @@ -10,6 +10,22 @@
>>         model = "Qualcomm Technologies, Inc. IPQ8074";
>>         compatible = "qcom,ipq8074";
>> 
>> +       reserved-memory {
>> +               #address-cells = <2>;
>> +               #size-cells = <2>;
>> +               ranges;
>> +
>> +               smem_region:smem@4ab00000 {
> 
> Put a space between the colon and the node name. Also, just call it
> memory@4ab00000.

  ok, will fix.
> 
> 		smem_region: memory@4ab00000 {
> 
>> +                       no-map;
>> +                       reg = <0x0 0x4ab00000 0x0 0x00100000>;
>> +               };
>> +
>> +               q6_region: q6@4b000000 {
> 
> memory@

  ok, will fix.
> 
>> +                       no-map;
>> +                       reg = <0x0 0x4b000000 0x0 0x05f00000>;
>> +               };
>> +       };
>> +
>>         firmware {
>>                 scm {
>>                         compatible = "qcom,scm-ipq8074", "qcom,scm";
>> @@ -431,6 +447,115 @@
>>                                       "axi_m_sticky";
>>                         status = "disabled";
>>                 };
>> +               apcs: syscon@b111000 {
> 
> Add a newline between nodes please.

  ok, will fix.
> 
>> +                       compatible = "syscon";
>> +                       reg = <0x0B111000 0x1000>;
>> +               };
>> +
>> +               wcss: smp2p-wcss {
> 
> This node should be outside the soc node because it doesn't have a reg
> property

  ok, will fix.
> 
>> +                       compatible = "qcom,smp2p";
>> +                       qcom,smem = <435>, <428>;
>> +
>> +                       interrupt-parent = <&intc>;
>> +                       interrupts = <0 322 1>;
>> +
>> +                       qcom,ipc = <&apcs 8 9>;
>> +
>> +                       qcom,local-pid = <0>;
>> +                       qcom,remote-pid = <1>;
>> +
>> +                       wcss_smp2p_out: master-kernel {
>> +                               qcom,entry-name = "master-kernel";
>> +                               qcom,smp2p-feature-ssr-ack;
>> +                               #qcom,smem-state-cells = <1>;
>> +                       };
>> +
>> +                       wcss_smp2p_in: slave-kernel {
>> +                               qcom,entry-name = "slave-kernel";
>> +
>> +                               interrupt-controller;
>> +                               #interrupt-cells = <2>;
>> +                       };
>> +               };
>> +
>> +               tcsr_q6_block: syscon@1945000 {
> 
> Do you really need _block in these aliases?

  ok, will fix it to "tcsr_q6"
> 
>> +                       compatible = "syscon";
>> +                       reg = <0x1945000 0xE000>;
>> +               };
>> +
>> +               tcsr_mutex_block: syscon@193d000 {
>> +                       compatible = "syscon";
>> +                       reg = <0x1905000 0x8000>;
>> +               };
>> +
>> +               tcsr_mutex: hwlock@193d000 {
>> +                       compatible = "qcom,tcsr-mutex";
>> +                       syscon = <&tcsr_mutex_block 0 0x80>;
>> +                       #hwlock-cells = <1>;
>> +               };
>> +
>> +               smem: qcom,smem@4AB00000 {
> 
> lowercase please. And just 'smem' I guess.

  ok, will fix.
> 
>> +                       compatible = "qcom,smem";
>> +                       memory-region = <&smem_region>;
>> +                       hwlocks = <&tcsr_mutex 0>;
>> +               };
>> +
>> +               apcs_glb: mailbox@b111000 {
>> +                       compatible = "qcom,ipq8074-apcs-apps-global";
>> +                       reg = <0xb111000 0x1000>;
> 
> These addresses should be padded out to 8 digits for the address part
> (not the size).

  ok, will fix.
> 
>> +
>> +                       #mbox-cells = <1>;
>> +               };
>> +
>> +               q6v5_wcss: q6v5_wcss@CD00000 {
> 
> lowercase.

  ok, will fix.
> 
>> +                       compatible = "qcom,ipq8074-wcss-pil";
>> +                       reg = <0xCD00000 0x4040>,
>> +                             <0x4AB000 0x20>;

Regards,
  Gokul
