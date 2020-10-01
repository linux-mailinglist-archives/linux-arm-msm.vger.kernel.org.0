Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A77428036A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 18:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732610AbgJAQCA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 12:02:00 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:11509 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732213AbgJAQCA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 12:02:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601568119; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=bAr6+MSDWsA98IL+P6Dsk/RauYZOJvfAOqOYJHKEpKI=; b=K9v7KQBCLZxkLBXoT8N3yj5/Ve0H4vLiy6Mb1uqOFDWXlZAH08nfqbbkvMIHYSzeV4WkIKQQ
 MuPMXrWjncgoFnSLASpFt3Qug60RqZIPNEFVn7TO0TX0Gk+WWsH9HMm9p0gkbj+51Si4D9pu
 TtjGfyzJYQ/DWXnCOt4Ra5GGJ7c=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f75fd4d7671600ec861fffe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Oct 2020 16:01:17
 GMT
Sender: ilina=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A9152C433CB; Thu,  1 Oct 2020 16:01:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BCADDC433C8;
        Thu,  1 Oct 2020 16:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BCADDC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=ilina@codeaurora.org
Date:   Thu, 1 Oct 2020 10:01:16 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v3] soc: qcom: cmd-db: allow loading as a module
Message-ID: <20201001160115.GA28931@codeaurora.org>
References: <20201001154144.5226-1-ilina@codeaurora.org>
 <20201001155721.GA3046334@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201001155721.GA3046334@kroah.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 01 2020 at 09:57 -0600, Greg KH wrote:
>On Thu, Oct 01, 2020 at 09:41:44AM -0600, Lina Iyer wrote:
>> This patch enables Command DB driver to be loaded as a module. Command
>> DB is inherent to RPMH interaction and as such would never be unloaded.
>> Add supress_bind_attrs to make it a permanently loaded module.
>>
>> Reviewed-by: John Stultz <john.stultz@linaro.org>
>> Tested-by: John Stultz <john.stultz@linaro.org>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> ---
>> Changes in v3:
>> 	- Update copyright, suggested by Greg K-H
>
>I did not say to update the copyright, I said if you were going to
>update it, to do so properly :)
>
No, but you were right. I should not have included 2019.
Thanks for pointing that out.

--Lina

>Anyway, tiny issue.
>
>Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
