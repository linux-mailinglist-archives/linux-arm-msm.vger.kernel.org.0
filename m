Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29D4B43F53C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 05:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbhJ2DLv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 23:11:51 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:33687 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbhJ2DLu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 23:11:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635476962; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HU9WzdznsyNXwZ00GJMZALNrQCaBt7USfMvElBn+TRI=;
 b=rFR4EEfTCLHHIsydoC3sEF/PdTvEk2AN0AEXCadTeRDjBEGTF5/Fc6D5gqveuj64tpGmXrXr
 104oDMkXu7wTHLm2H8tKN279kptZ8PNoYwqmaebLhXAqUJ5nV9iENU0JI2kjSYq+PSriYYCe
 MuLCT3ULXUPVhuJaRzg4vdprbyQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 617b65e1c8c1b282a543a9ef (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 Oct 2021 03:09:21
 GMT
Sender: tjiang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3DDEAC4360D; Fri, 29 Oct 2021 03:09:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tjiang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A8848C4338F;
        Fri, 29 Oct 2021 03:09:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 29 Oct 2021 11:09:20 +0800
From:   tjiang@codeaurora.org
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        c-hbandi@codeaurora.org, Hemantg <hemantg@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>, zijuhu@codeaurora.org
Subject: Re: [PATCH v3] Bluetooth: btusb: Add support for variant WCN6855 by
 using different nvm
In-Reply-To: <68A15E46-C716-4324-8B5D-C71C9D2753C5@holtmann.org>
References: <1d19afff955cdc8d47582297a26246d9@codeaurora.org>
 <YXgrwKUZwUWuWfG4@google.com>
 <fe118b60df5881b0e9938f57aae6f87e@codeaurora.org>
 <YXl3S7TT30PFfyB8@google.com>
 <68A15E46-C716-4324-8B5D-C71C9D2753C5@holtmann.org>
Message-ID: <807e0545d14144d2fa8ed8b54041529f@codeaurora.org>
X-Sender: tjiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Marcel for the reply, I will do as what you said , thank you.

regards.
tim


On 2021-10-28 22:00, Marcel Holtmann wrote:
> Hi Matthias,
> 
>>>  the previous patch is submitted by zijun , as he is not working on 
>>> this
>>> project, I take over his job, so can we assume abandon the previous 
>>> patch,
>>> using my new patch ? thank you.
>>> regards.
>> 
>> Your patch is clearly based on zijun's one, it even has the same 
>> subject. A
>> change of authorship shouldn't result in resetting the version number, 
>> it's
>> still the same patch/series. You can always add a 'Co-developed-by:' 
>> tag to
>> indicate that someone else contributed to a patch, or use a 'From:' 
>> tag if
>> you only made minor changes on top of someone else's work.
> 
> I really don’t care much since that is for them and their company
> policy to figure out.
> 
>> Not sure how to proceed best with the version number, especially since 
>> there
>> are already 3 versions of the 'new' patch. Either option can create 
>> confusion,
>> I guess you can continue with the new scheme, it seems the patch is 
>> almost
>> ready to land anyway.
> 
> It is a total mess already for a dead simple patch like this. And they
> keep messing it up differently every time.
> 
> I provided a btusb_generate_qca_nvm_name() in one of my replies, where
> the variant variable was declared without NULL assignment and the
> ram_version was converted from little endian in place. That was 28th
> of September and 4 patches later the patch is still not ready to be
> merged. The maintainer hands you the recipe and you still screw up the
> cake multiple times; I am just done with this.
> 
> The next version would be a v16 btw. So seriously, how can we have 15
> revisions so far and still not have this in a mergable state?
> 
> Regards
> 
> Marcel
