Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B600F5C25
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2019 01:01:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbfKIABX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 19:01:23 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:43228 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726394AbfKIABX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 19:01:23 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E838061410; Sat,  9 Nov 2019 00:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573257682;
        bh=QFs2x+x4fIEuZOx7pz7201e961RZN+MksTxeVaGJTnE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Dh0vJccm1drtq/03VdtiQnlFwi0bDS6EjrrvryDfK9nwvvPowMGFqTfu++lxCWBEF
         zUubn8/aQ5hUaMhvHvr+eGDds6k1DGIr+4rzot32Os48DJEjLHIWJ7HBnYHpODuPKq
         SjINxGiyZI2gNoMnnOKgnB8LYsD1w2Vjicu1+Zn0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 6BC1A60F74;
        Sat,  9 Nov 2019 00:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573257681;
        bh=QFs2x+x4fIEuZOx7pz7201e961RZN+MksTxeVaGJTnE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WA26uZqmY2unk2FaSXIgqizhShISWXuLUSiujNPt1wPyPvzozvxP58besRG9/S3IV
         FubVHkrGeRScD1O/aMeGZ5KA7DrFxZ2XdJCLyS+e+31NEnw3EW7hyNXPYkP5yOZgF1
         uZgku3kH4pML1wAt5ugbm+sG0aEOLh6kfv4rWV7o=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 08 Nov 2019 19:01:21 -0500
From:   cohens@codeaurora.org
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, adelva@google.com,
        pdhaval@codeaurora.org, seanpaul@chromium.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 0/3] allow DRM drivers to limit creation of blobs
In-Reply-To: <20191108083448.GU23790@phenom.ffwll.local>
References: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
 <20191108083448.GU23790@phenom.ffwll.local>
Message-ID: <7072bcc51eb44d49ab4266e0ec216df6@codeaurora.org>
X-Sender: cohens@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-08 03:34, Daniel Vetter wrote:
> On Thu, Nov 07, 2019 at 02:39:11PM -0500, Steve Cohen wrote:
>> Fuzzers used in Android compliance testing repeatedly call the
>> create blob IOCTL which eventually exhausts the system memory.
>> This series adds a hook which allows drivers to impose their own
>> limitations on the size and/or number of blobs created.
> 
> Pretty sure this isn't just a problem for msm/dpu alone, why this very
> limited approach?
> 
I'm not familiar enough with the blob requirements for other
vendor's drivers to impose any restrictions on them. The idea
was to provide the hook for vendors to implement their own
checks. Support for msm/mdp* drivers will be added in v2 if this
approach is acceptable.

> Also, why are your fuzzers not also allocating enormous amounts of gem
> buffers, which will also exhaust memory eventually?

Excellent question... This will likely come in a follow-up series.

> -Daniel
> 
>> 
>> Steve Cohen (3):
>>   drm: add driver hook for create blob limitations
>>   drm/msm: add support for createblob_check driver hook
>>   drm/msm/dpu: check blob limitations during create blob ioctl
>> 
>>  drivers/gpu/drm/drm_property.c          |  7 +++++++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 ++++++++++++++
>>  drivers/gpu/drm/msm/msm_drv.c           | 25 
>> +++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/msm_kms.h           |  1 +
>>  include/drm/drm_drv.h                   |  9 +++++++++
>>  5 files changed, 56 insertions(+)
>> 
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
