Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDD43CF4EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 08:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242768AbhGTGQ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 02:16:58 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:28544 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237125AbhGTGQk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 02:16:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626764238; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Sa4gpSnhKmhO8QwHx3/NA/1fd9psLJLAqHa3t9J/Dys=;
 b=PfJ1bXA21EUyOHo4SAm7BPJb1NCjplmJfdU8HLQ/7ab8LL1bROK9aKFC4eLsxFo6M6m5OKRT
 wlZR4N/wNmaTLRacCB+GKD/Oj0oanYP9C/JJr9hTj/TUttsoceiEJwdg8xGaR7cx2zjc3Yrl
 mSfFQwocgIZYh0yJdyiew4qTGNs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60f673c71d1afe585e693430 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Jul 2021 06:57:11
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C2A60C43217; Tue, 20 Jul 2021 06:57:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 42BDEC433F1;
        Tue, 20 Jul 2021 06:57:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 20 Jul 2021 12:27:11 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: sc7280: Add PCIe nodes for IDP
 board
In-Reply-To: <CAE-0n50OEX7gMw_q3wL6HH38G1a-hi10D0_dmjJLyKq9ChA5iA@mail.gmail.com>
References: <1626443927-32028-1-git-send-email-pmaliset@codeaurora.org>
 <1626443927-32028-4-git-send-email-pmaliset@codeaurora.org>
 <CAE-0n50OEX7gMw_q3wL6HH38G1a-hi10D0_dmjJLyKq9ChA5iA@mail.gmail.com>
Message-ID: <78599ad26dc593273fbe59ac6cb529fc@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-17 01:02, Stephen Boyd wrote:
> Quoting Prasad Malisetty (2021-07-16 06:58:46)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> index 3900cfc..8f12b8c 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> @@ -268,6 +268,44 @@
>>                 };
> 
> Is this pmk8350_vadc? 'pc' comes before 'pm' so please sort this 
> section
> alphabetically on node name.
> 
>>  };
Agree, we will incorporate the change in next version.
>> 
>> +&pcie1 {
>> +       status = "okay";
>> +
>> +       vdda-supply = <&vreg_l10c_0p8>;
>> +};
>> +
>> +&pcie1_phy {
>> +       status = "okay";
>> +
>> +       vdda-phy-supply = <&vreg_l10c_0p8>;
>> +       vdda-pll-supply = <&vreg_l6b_1p2>;
>> +};
