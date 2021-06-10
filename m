Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF35C3A2753
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 10:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbhFJIn5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 04:43:57 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:20364 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbhFJIn5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 04:43:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623314521; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ZSWj5UofeqiRKNbckhCqBKn/Q4JIqBdqTYFAQzCnGgM=;
 b=O1Op8nZgGOXppuwePDcO69h6/A7Wh45Nof8H0Ou+c4fBGOCoYmyv3n2p3XsYPTzDXwRsYlbn
 gOeQmzyOSnvBrQSfpF2Ex6m+bxcmgmP8hG/fsJicJ4wc64NFAlIRpfG84SrOLBQ5+YAw6UL8
 4AQXbJtZeDyQBguqF/ZamIOGvj4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60c1d042ed59bf69cc413030 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 10 Jun 2021 08:41:38
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6E284C43460; Thu, 10 Jun 2021 08:41:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9FCBC433D3;
        Thu, 10 Jun 2021 08:41:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 10 Jun 2021 14:11:37 +0530
From:   skakit@codeaurora.org
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH V4] dt-bindings: pinctrl: qcom-pmic-gpio: Convert qcom
 pmic gpio bindings to YAML
In-Reply-To: <CACRpkdb=+XOeSco22hXdYr=PTfPS6OFnWArBL3urU5qPf735uQ@mail.gmail.com>
References: <1621578615-4613-1-git-send-email-skakit@codeaurora.org>
 <CACRpkdb=+XOeSco22hXdYr=PTfPS6OFnWArBL3urU5qPf735uQ@mail.gmail.com>
Message-ID: <f0baa873223eed629d945523dd471fdb@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Linus,

On 2021-06-10 13:15, Linus Walleij wrote:
> Hi Satya,
> 
> On Fri, May 21, 2021 at 8:30 AM satya priya <skakit@codeaurora.org> 
> wrote:
> 
>> Convert Qualcomm PMIC GPIO bindings from .txt to .yaml format.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
> 
> For some reason this patch will not apply, I already applied the
> two other patches, can you investigate and/or resend just this
> YAML conversion patch, including Rob's review tag?
> 

Sure, will rebase and resend it.

Thanks,
Satya Priya

> Yours,
> Linus Walleij
