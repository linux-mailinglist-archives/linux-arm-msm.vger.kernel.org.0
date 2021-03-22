Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FAC63446A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 15:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbhCVOGZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 10:06:25 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:57520 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbhCVOFx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 10:05:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616421953; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=omfOH0veOuNBAugBknznPXy6sn7Kqdx9UMDjniryeoA=;
 b=C5JZk6Y14PinhCH5tGSzH7wDPe/xwYjw/ZjmR/dzRRH8if4fWDnRfCD/hp5mh+KNw8fFlvH2
 ZkX1c8bo+vaYr6kXBl+nW1lHGoAU+G9b6gZPTwgYLNksT7FYwa0aTUBwz33XsPH9oCSzPZcB
 iRNRiUfgarpa/mW5O3ulFhz60b0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6058a4311de5dd7b993dc805 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Mar 2021 14:05:37
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 58BFBC43465; Mon, 22 Mar 2021 14:05:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 648D2C43463;
        Mon, 22 Mar 2021 14:05:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 22 Mar 2021 19:35:35 +0530
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add PMIC peripherals for SC7280
In-Reply-To: <YEvTa0+VC2XSO048@google.com>
References: <1615459229-27573-1-git-send-email-skakit@codeaurora.org>
 <YEvTa0+VC2XSO048@google.com>
Message-ID: <fb4cebc5c050b954ddab1eafd8365bf1@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-13 02:17, Matthias Kaehlcke wrote:
> On Thu, Mar 11, 2021 at 04:10:29PM +0530, satya priya wrote:
>> Add PM7325/PM8350C/PMK8350/PMR735A peripherals such as PON,
>> GPIOs, RTC and other PMIC infra modules for SC7280.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>> This patch depends on base DT and board files for SC7280 to merge 
>> first
>> https://lore.kernel.org/patchwork/project/lkml/list/?series=487403
>> 
>>  arch/arm64/boot/dts/qcom/pm7325.dtsi  |  60 ++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/pm8350c.dtsi |  60 ++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/pmk8350.dtsi | 104 
>> ++++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/pmr735a.dtsi |  60 ++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi  |   8 +++
>>  5 files changed, 292 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/pm7325.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/pm8350c.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/pmk8350.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/pmr735a.dtsi
> 
> The subject 'arm64: dts: qcom: sc7280: Add PMIC peripherals for SC7280'
> is a bit misleading, at least for the git history it would be clearer 
> to
> to split this into per-PMIC patches and one SC7280 patch.

Okay, will split them.
