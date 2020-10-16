Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035AF290999
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 18:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410086AbgJPQVe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 12:21:34 -0400
Received: from z5.mailgun.us ([104.130.96.5]:17888 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2410078AbgJPQVe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 12:21:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602865293; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=lMRxBStFAwL5DZTVxOwtseg396vfedbEbLgzwWs2eD8=; b=xYJ9/NER6ClHK+E+0z6dHlisOSi7wTd/dWRYlhClAYdQbfN4ZeUceFlhXycom7iNfWgRNgp8
 kdegV7mirOSCOshnfCVJy+5Q5BVF+gj0JhmGHEsEI/uCYbFCxa2aAdUeFTDBKVmvR/S6FbY8
 HgzRi5R4svQcFmK0ySOEgfWY6LY=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f89c8820764f13b00faad8d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Oct 2020 16:21:22
 GMT
Sender: ilina=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6FBBAC433FE; Fri, 16 Oct 2020 16:21:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 96572C433C9;
        Fri, 16 Oct 2020 16:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 96572C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=ilina@codeaurora.org
Date:   Fri, 16 Oct 2020 10:21:19 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v3] PM / Domains: enable domain idle state accounting
Message-ID: <20201016162119.GC16756@codeaurora.org>
References: <20201015204722.18764-1-ilina@codeaurora.org>
 <CAJZ5v0ifjHRomAxEKTW5z+VEZLGeM5MN-NcRxUUgrFQvtB0seQ@mail.gmail.com>
 <20201016160724.GB16756@codeaurora.org>
 <CAJZ5v0gBb91rFHne26zLrMPOKcHTmcDERBRLiPAuVJo+H6BAzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAJZ5v0gBb91rFHne26zLrMPOKcHTmcDERBRLiPAuVJo+H6BAzA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 16 2020 at 10:13 -0600, Rafael J. Wysocki wrote:
>On Fri, Oct 16, 2020 at 6:07 PM Lina Iyer <ilina@codeaurora.org> wrote:
>>
>> On Fri, Oct 16 2020 at 09:55 -0600, Rafael J. Wysocki wrote:
>> >On Thu, Oct 15, 2020 at 10:47 PM Lina Iyer <ilina@codeaurora.org> wrote:
>> >>
>> >> To enable better debug of PM domains, let's keep a track of the success
>> >> and rejections in entering each domain idle state.
>> >>
>> >> This statistics is exported in debugfs when reading the idle_states
>> >> node, associated with each PM domain.
>> >>
>> >> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> >> ---
>> >> Changes in v3:
>> >>         - Rebased on top of mainline
>> >
>> >I still needed to rebase it to apply it to my tree, so please double
>> >check the result in the bleeding-edge branch.
>> >
>> Okay, will rebase on that branch and post shortly.
>
>No need, it's been applied already, just please check the result in
>bleeding-edge.
>
I think I may have the wrong bleeding-edge branch. Is it not 
https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/log/?h=bleeding-edge

Apologize for the confusion. 

--Lina
