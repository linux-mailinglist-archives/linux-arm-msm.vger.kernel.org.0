Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACDA2D3CDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 11:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbfJKJ5F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 05:57:05 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37226 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727352AbfJKJ5E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 05:57:04 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 01A1960ADE; Fri, 11 Oct 2019 09:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570787824;
        bh=JnjS0PdaYuZxMyImVfzpB6v+YK0lSs7Qjj6zZ8mu5ug=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hc0lJNRUgrNzZizxunvQjZftL+LGDTpvzwJ3Kfn0MqDtmkVV+Z6k+Q4U8HNnerJpg
         2dPhoWYMBlZ/VcSNeHaDLBp+l5y5bfQO8MSk6caGAgTK/hjNKx8Uwo0LhHI37XYzEH
         Z6tuQRpXiamfeHEV9ilvOnwLruTmjTzGtVsU+L2k=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id AF32E60AA3;
        Fri, 11 Oct 2019 09:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570787823;
        bh=JnjS0PdaYuZxMyImVfzpB6v+YK0lSs7Qjj6zZ8mu5ug=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ijIRGjZI1IRbXk6ygbmghvcWn8XIDXzXMI0VFzRO4FispR9/KRRj5urp3SjXmgDKE
         pjxDxpfPO+GMFpKrXbgBSpw39yIKCTUT1EaIpwHeqmr1fKqeDieBhIf9N22hMEVTWY
         2FguLdRCWdQlFgD6YMtZQIyPRvxlsdPxdveWBc0Y=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Oct 2019 15:27:03 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: Relax CPU features sanity checking on heterogeneous architectures
In-Reply-To: <7ef16e2a-b35c-0807-67be-c56dadb6fa66@free.fr>
References: <b3606e76af42f7ecf65b1bfc2a5ed30a@codeaurora.org>
 <7ef16e2a-b35c-0807-67be-c56dadb6fa66@free.fr>
Message-ID: <b5f2cd1c2e34a3440e7f456bff36ea3d@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marc,

On 2019-10-11 14:49, Marc Gonzalez wrote:
> 
> Hello Sai,
> 
> Could you configure your webmail client to not wrap "long" lines?
> 
> Wrapping might break the patch, and the kernel logs would look better
> in their original form.
> 

Oh right, sorry did not see that. I use git send-email for patches, so 
no problem of wrapping in those cases.
Here I just used my webmail to compose the message and just pasted the 
diff, will take care of it in future.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
