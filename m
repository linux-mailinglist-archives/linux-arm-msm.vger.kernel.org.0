Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8568F346798
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 19:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231380AbhCWS1i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 14:27:38 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:43414 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231964AbhCWS1P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 14:27:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616524035; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=q7YgbzGHVsIDNKAN+GCf2wvdICqjC3POsNXbJwmjTPA=; b=rxDlMRGU8NIhuof/8XLPi18+G4mZAD7bvhUI56L+RdSBxoXHSSoq0zXbZ+LRInQSv4ZpWP7h
 EMpFmXM7G4nDNXucwI5LpQ89+ABUj41c+ORjhlAd1kvXFMHqElg8OxWq8Eslo1ZaA3lpgcr5
 EViP+rkzCLOmRWCkFTrsZ+PQcGc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 605a32fce2200c0a0d5cd971 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Mar 2021 18:27:08
 GMT
Sender: eberman=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B8C49C4346B; Tue, 23 Mar 2021 18:27:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.70] (cpe-76-167-231-33.san.res.rr.com [76.167.231.33])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4DA72C43462;
        Tue, 23 Mar 2021 18:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4DA72C43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=eberman@codeaurora.org
Subject: Re: [PATCH 6/6] firmware: qcom_scm: Only compile legacy calls on ARM
To:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
References: <20210223214539.1336155-1-swboyd@chromium.org>
 <20210223214539.1336155-7-swboyd@chromium.org>
 <b9174acc-9826-eb82-b399-ed95f7e83085@codeaurora.org>
 <161483844056.1478170.8701629037531614722@swboyd.mtv.corp.google.com>
 <5ac262bf-a70a-4ca3-01a8-d1432732d26f@codeaurora.org>
 <161501150705.1478170.3739297122787060750@swboyd.mtv.corp.google.com>
 <YEUQlY4X1e2PO8tl@builder.lan>
 <161647057967.3012082.16471020030801311825@swboyd.mtv.corp.google.com>
From:   Elliot Berman <eberman@codeaurora.org>
Message-ID: <c0dbcf6c-9f6f-2103-68bd-3d06420f309a@codeaurora.org>
Date:   Tue, 23 Mar 2021 11:27:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <161647057967.3012082.16471020030801311825@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/22/2021 8:36 PM, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2021-03-07 09:42:45)
>> On Sat 06 Mar 00:18 CST 2021, Stephen Boyd wrote:
>>
>>> Quoting Elliot Berman (2021-03-05 10:18:09)
>>>> On 3/3/2021 10:14 PM, Stephen Boyd wrote:
>>>>> Quoting Elliot Berman (2021-03-03 19:35:08)
>>>>
>>>>   > +    desc.args[0] = flags;
>>>>   > +    desc.args[1] = virt_to_phys(entry);
>>>>   > +
>>>>   > +    return scm_legacy_call_atomic(NULL, &desc, NULL);
>>>>   > +}
>>>>   > +EXPORT_SYMBOL(qcom_scm_set_cold_boot_addr);
>>>>
>>>> This should still be qcom_scm_call.
>>>
>>> You mean s/scm_legacy_call_atomic/qcom_scm_call/ right?
>>>
>>> I don't really want to resend the rest of the patches if this last one
>>> is the only one that needs an update. This was a semi-RFC anyway so
>>> maybe it's fine if the first 5 patches get merged and then I can resend
>>> this one? Otherwise I will resend this again next week or so with less
>>> diff for this patch.
>>
>> I'm fine with merging the first 5, but was hoping that Elliot could
>> provide either a "Reviewed-by" or at least an "Acked-by" on these.
>>
> 
> I'll take the silence as I should resend the whole series?
> 

I thought Bjorn was accepting the first 5 already, my apologies.

Patches 1-5:
Acked-by: Elliot Berman <eberman@codeaurora.org>
