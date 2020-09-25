Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3167327948C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 01:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgIYXNZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Sep 2020 19:13:25 -0400
Received: from z5.mailgun.us ([104.130.96.5]:13307 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726636AbgIYXNZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Sep 2020 19:13:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601075604; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=9ESAXVuPNbIaJCckFcr9EMppXR0GTV61rO2wi/Mq0bA=;
 b=lonfu6brWq6geS6+NlADwwvQuGoVakM9gQ0rqN2mFy+G25xHOAAUF4DbEu/CiJwblEri04gV
 b/3v912ID21FT90pGWhqcB6l30KdI0gQMSrsxmQ91X6TMgjHdXCuxlJttqFEbyvTAfOHcW3X
 4rjRol5BPpp1chNEtHOsLXRi1/M=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f6e7994ebb17452baccb4f8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 25 Sep 2020 23:13:24
 GMT
Sender: cgoldswo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9E04CC43382; Fri, 25 Sep 2020 23:13:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cgoldswo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 28610C433C8;
        Fri, 25 Sep 2020 23:13:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 25 Sep 2020 16:13:23 -0700
From:   Chris Goldsworthy <cgoldswo@codeaurora.org>
To:     David Hildenbrand <david@redhat.com>
Cc:     akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        pratikp@codeaurora.org, pdaly@codeaurora.org,
        sudaraja@codeaurora.org, iamjoonsoo.kim@lge.com,
        Vinayak Menon <vinmenon@codeaurora.org>
Subject: Re: [PATCH v3] mm: cma: indefinitely retry allocations in cma_alloc
In-Reply-To: <566091ab-11f2-f071-6072-3c1b0f80cc4e@redhat.com>
References: <cover.1600922611.git.cgoldswo@codeaurora.org>
 <6904d64c97ca71b14ed0548a0287162bb6fb4b7b.1600922611.git.cgoldswo@codeaurora.org>
 <566091ab-11f2-f071-6072-3c1b0f80cc4e@redhat.com>
Message-ID: <f8255f9c95f22035f57ed3167595e8e3@codeaurora.org>
X-Sender: cgoldswo@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-25 05:18, David Hildenbrand wrote:
> On 24.09.20 07:16, Chris Goldsworthy wrote:
>> -				     GFP_KERNEL | (no_warn ? __GFP_NOWARN : 0));
>> +				     GFP_KERNEL | (gfp_mask & __GFP_NOWARN));
> 
> Right, we definetly don't want to pass the flag further down.
> 
> Alternative would be cma_alloc_nofail(). That helps avoid people 
> passing
>  stuff like GFP_USER and wondering why it doesn't have an effect.

But since we're doing a logical AND with __GFP_NOWARN, we're not passing 
any other values down - this makes it equivalent to the previous 
version, in that only __GFP_NOWARN can be passed to 
alloc_contig_range().

-- 
The Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
