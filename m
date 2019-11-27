Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 353D510B1D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2019 16:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbfK0PDw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Nov 2019 10:03:52 -0500
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:55824
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726926AbfK0PDw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Nov 2019 10:03:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574867030;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=m+RmwwtRh6wpqWLsith1UEXLKiZv7wRz4zahIfjoOII=;
        b=CrvxbD0H/nwvenF6Z3Y8rX+bbyDRpj3iM7BTaREdNGKAaW1dqt0dAbnKKQJoN6Jm
        gpnfhewYAKHYxjmTOGZCzwvZ1HEfzqK6LZ6rZSheNQPod/+qPicO+jsaw1aozuyrmX5
        SRIjdprjNkBuY6YkBCdKYx5Ruewd+Z9k/a32OqYU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574867030;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=m+RmwwtRh6wpqWLsith1UEXLKiZv7wRz4zahIfjoOII=;
        b=P93RFqzP/0wRYY7wEaj9UQMN2nIv74LWLwgMjUk7RwxaIGbXGQsr8ntQ5hIwcQnF
        ZLsqaNLBU7zimQwUsy4zGt2DQclFDQo1yhReKovXwRfyebhxqkqOGJEaNEdtlF4OTCj
        xZ3nNMimpbgbu+x/hZiq2ozOLI0OceXPVJF8n15w=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 27 Nov 2019 15:03:50 +0000
From:   gokulsri@codeaurora.org
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, nprakash@codeaurora.org, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org
Subject: Re: [PATCH V2 12/12] arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074
 SoC
In-Reply-To: <20190917161557.164C320665@mail.kernel.org>
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
 <1568375771-22933-13-git-send-email-gokulsri@codeaurora.org>
 <20190917161557.164C320665@mail.kernel.org>
Message-ID: <0101016ead63d338-79f23ad8-8186-4f6e-bda4-b078441d55f2-000000@us-west-2.amazonses.com>
X-Sender: gokulsri@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2019.11.27-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-09-17 21:45, Stephen Boyd wrote:
> Quoting Gokul Sriram Palanisamy (2019-09-13 04:56:11)
>> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi 
>> b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> index 6a61a63..0ea026e 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> @@ -431,6 +485,78 @@
>>                                       "axi_m_sticky";
>>                         status = "disabled";
>>                 };
>> +
>> +               apcs: syscon@b111000 {
>> +                       compatible = "syscon";
>> +                       reg = <0x0b111000 0x1000>;
>> +               };
>> +
>> +               tcsr_q6: syscon@1945000 {
>> +                       compatible = "syscon";
>> +                       reg = <0x01945000 0xe000>;
>> +               };
>> +
>> +               tcsr_mutex_regs: syscon@193d000 {
>> +                       compatible = "syscon";
>> +                       reg = <0x01905000 0x8000>;
>> +               };
>> +
>> +               apcs_glb: mailbox@b111000 {
> 
> This is the same as the syscon above. What's going on?
> 
>> +                       compatible = "qcom,ipq8074-apcs-apps-global";
>> +                       reg = <0x0b111000 0x1000>;
>> +
>> +                       #mbox-cells = <1>;
>> +               };
  Sorry for the delayed response. Will have this addressed and post a v3.

  Regards,
  Gokul
