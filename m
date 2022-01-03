Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABAA5482E45
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jan 2022 06:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbiACFrc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jan 2022 00:47:32 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:30427 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231751AbiACFra (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jan 2022 00:47:30 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1641188848; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=cVC+oibIc8iPmXhnG1hrq/a9esqKZx7TVHYepgpH7ck=;
 b=EAu1o29iNLEFlViVz4/q5bjVfndUpoKJN60pXPiie841LLK3QDjvedniApkBvB0X+zwPSFxy
 4xPB7jErfg6pR/N4ZDnS/mXoMSkVjbc+JuQoKEay8/DYE0eWHqJXd4af3/FOAFj5n2UW4DD9
 bi0hgL1DVdVAbXxOpSABLkBgE8s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61d28df0bf630523994db265 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 03 Jan 2022 05:47:28
 GMT
Sender: kathirav=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E36C0C43616; Mon,  3 Jan 2022 05:47:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 99A62C4360C;
        Mon,  3 Jan 2022 05:47:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 03 Jan 2022 11:17:27 +0530
From:   Kathiravan T <kathirav@codeaurora.org>
To:     Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>,
        Sricharan R <sricharan@codeaurora.org>,
        arajkuma@codeaurora.org, speriaka@codeaurora.org,
        sivaprak@codeaurora.org, jason <jason@wallystech.com>,
        linus.walleij@linaro.org
Subject: Re: External data abort on ipq6018 gpio # 20 ~ offset 0x14000 any
 ideas ?
In-Reply-To: <731e9571-5414-1c00-b6e4-a5316d287506@nexus-software.ie>
References: <cbe181af-402d-c8eb-3104-4ee48f8d525a@nexus-software.ie>
 <Yc9zt9vOWXTPZ8PH@ripper>
 <731e9571-5414-1c00-b6e4-a5316d287506@nexus-software.ie>
Message-ID: <2de144430c1acf7e0743adde7055926c@codeaurora.org>
X-Sender: kathirav@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-01-01 21:17, Bryan O'Donoghue wrote:
> On 31/12/2021 21:18, Bjorn Andersson wrote:
>> Unfortunately I don't know how to determine the list of protected 
>> GPIOs,
>> other than trial and error.
>> 
>> But once you have the list, you can use "gpio-reserved-ranges" (a 
>> series
>> of offset, count pairs) in the TLMM DT node to mark off these gpios as
>> reserved.
> 
> Ah nice, worked first time.
> 
> gpio-reserved-ranges = <20 4>;


You want to protect only one GPIO right? I understand that it should be 
just <20 1>. Isn't the case?

You are using a CP01-C4 variant(#define CPU_IPQ6005 453, machid 
0x8030003). In this variant alone, GPIO20 is protected by TZ for some of 
its operation since there is no PMIC. In other variants of IPQ6018, you 
shouldn't be seeing this issue.

> 
> Well I guess its good to know there's no more esoteric explanation
> than "trustzone made it explode" - it only seems to be the one GPIO
> too, quite what use there is for TZ in this GPIO
> 
> PINGROUP(20, pwm20, atest_char2, _, _, _, _, _, _, _)
> 
> is anybody's guess.
> 
> Good enough for my purposes.
> 
> Thanks !
> 
> ---
> bod

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of Code Aurora Forum, hosted by The Linux Foundation
