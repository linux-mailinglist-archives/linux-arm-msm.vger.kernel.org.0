Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D84D63229B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 12:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232354AbhBWLvs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 06:51:48 -0500
Received: from z11.mailgun.us ([104.130.96.11]:30144 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232446AbhBWLvp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 06:51:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614081080; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=K1RCtbpB2v5x64X9WmNYjwDFWj1Xz4WCq+vw6Esfx8I=; b=R+A3oon4bMr7374inq5gX3sDzWatAIoOnPxpxZjitTuQZk4WxIq77RIEwGQVRYzXucor+2lz
 JagQRsG2wCjDAzyG0PGIcDCed4Z+MgyS87GU50C06NyiGHdA20EKMTSskDm2ONTmvvEeq3Kq
 PXtr1GIDD9GyCEs3Vebd6MWMomg=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6034ec1d2a8ee88ea5fffe3d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Feb 2021 11:50:53
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C4425C43461; Tue, 23 Feb 2021 11:50:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.65.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A1078C433C6;
        Tue, 23 Feb 2021 11:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A1078C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH 13/13] arm64: dts: qcom: sc7280: Add cpuidle states
To:     Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1613114930-1661-1-git-send-email-rnayak@codeaurora.org>
 <1613114930-1661-14-git-send-email-rnayak@codeaurora.org>
 <161406655568.1254594.10659725128997811651@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <e0c008e9-030b-545e-a683-97f1a2bc88e5@codeaurora.org>
Date:   Tue, 23 Feb 2021 17:20:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161406655568.1254594.10659725128997811651@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On 2/23/2021 1:19 PM, Stephen Boyd wrote:
> Quoting Rajendra Nayak (2021-02-11 23:28:50)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 8f2002b..3b86052 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -186,12 +207,69 @@
>>                          compatible = "arm,kryo";
>>                          reg = <0x0 0x700>;
>>                          enable-method = "psci";
>> +                       cpu-idle-states = <&BIG_CPU_SLEEP_0
>> +                                          &BIG_CPU_SLEEP_1
>> +                                          &CLUSTER_SLEEP_0>;
>>                          next-level-cache = <&L2_700>;
>>                          L2_700: l2-cache {
>>                                  compatible = "cache";
>>                                  next-level-cache = <&L3_0>;
>>                          };
>>                  };
>> +
>> +               idle-states {
>> +                       entry-method = "psci";
>> +
>> +                       LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
>> +                               compatible = "arm,idle-state";
>> +                               idle-state-name = "little-power-down";
>> +                               arm,psci-suspend-param = <0x40000003>;
>> +                               entry-latency-us = <549>;
>> +                               exit-latency-us = <901>;
>> +                               min-residency-us = <1774>;
> Are these preliminary numbers? They're the same as sc7180 from what I
> can tell, but presumably things changed between SoC versions?

yes they are preliminary numbers, we are yet to measure on sc7280 and 
will update later once measured.

Thanks,
Maulik
>
>> +                               local-timer-stop;
>> +                       };
>> +
>> +                       LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
>> +                               compatible = "arm,idle-state";
>> +                               idle-state-name = "little-rail-power-down";
>> +                               arm,psci-suspend-param = <0x40000004>;
>> +                               entry-latency-us = <702>;
>> +                               exit-latency-us = <915>;
>> +                               min-residency-us = <4001>;
>> +                               local-timer-stop;
>> +                       };
>> +
>> +                       BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
>> +                               compatible = "arm,idle-state";
>> +                               idle-state-name = "big-power-down";
>> +                               arm,psci-suspend-param = <0x40000003>;
>> +                               entry-latency-us = <523>;
>> +                               exit-latency-us = <1244>;
>> +                               min-residency-us = <2207>;

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

