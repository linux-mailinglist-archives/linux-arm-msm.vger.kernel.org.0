Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7503E9051
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 14:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237485AbhHKMR6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 08:17:58 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:42444 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237478AbhHKMR6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 08:17:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628684255; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=lytk+GDi5s2zB6R0XzDXR78NKrdNr9wxnP0Z0BAj3XY=;
 b=sLb83qEDwQytEjyE4ZLYlKCn82AwIAXBewexlM5OYsypX3Qww4XJZfrbd4S1bsHrcvdLYH1C
 iQSd7bk1MRv6DML6eTVDYou/Oy+nX1UwXgDbXQPJ0IfXZgeVWUBblyzyP2KD9VuNPGBkPiVy
 07/5xQUh82KcgXmR+rUnzEmwR0I=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6113bfdc91487ad52013cbb9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Aug 2021 12:17:32
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D5B06C43217; Wed, 11 Aug 2021 12:17:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 535F7C4338A;
        Wed, 11 Aug 2021 12:17:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 11 Aug 2021 17:47:31 +0530
From:   rajpat@codeaurora.org
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: Re: [PATCH V4 2/4] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
In-Reply-To: <162741363048.2368309.1689681966672627944@swboyd.mtv.corp.google.com>
References: <1627306847-25308-1-git-send-email-rajpat@codeaurora.org>
 <1627306847-25308-3-git-send-email-rajpat@codeaurora.org>
 <162741363048.2368309.1689681966672627944@swboyd.mtv.corp.google.com>
Message-ID: <552cd7bd2ae6635cf97e03be590f6e93@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-28 00:50, Stephen Boyd wrote:
> Quoting Rajesh Patil (2021-07-26 06:40:45)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index ca6e36b..455e58f 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -520,6 +520,25 @@
>> 
>>                 };
>> 
>> +               qup_opp_table: qup-opp-table {
> 
> Surely this can live underneath a qup node parallel to the i2c and spi
> devices?
> 
But this is common to both qup0 and qup1 right?

>> +                       compatible = "operating-points-v2";
>> +
>> +                       opp-75000000 {
>> +                               opp-hz = /bits/ 64 <75000000>;
>> +                               required-opps = <&rpmhpd_opp_low_svs>;
>> +                       };
>> +
>> +                       opp-100000000 {
>> +                               opp-hz = /bits/ 64 <100000000>;
>> +                               required-opps = <&rpmhpd_opp_svs>;
>> +                       };
>> +
>> +                       opp-128000000 {
>> +                               opp-hz = /bits/ 64 <128000000>;
>> +                               required-opps = <&rpmhpd_opp_nom>;
>> +                       };
>> +               };
>> +
>>                 qupv3_id_0: geniqup@9c0000 {
>>                         compatible = "qcom,geni-se-qup";
>>                         reg = <0 0x009c0000 0 0x2000>;
