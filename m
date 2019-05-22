Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4632666E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2019 16:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729564AbfEVO6R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 May 2019 10:58:17 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:49084 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbfEVO6R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 May 2019 10:58:17 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 84F7660AD1; Wed, 22 May 2019 14:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558537095;
        bh=MrxtKzNkRf+nPvCFtEYRtvy6G8c6xAHGZ5idUbvj0+c=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=j6wWGKvnOPGiWMxyMESQw8hmrOsQVjTma7I0iMl9Ye/a8sAwlCf+FKYup51I245oj
         2lUGdWppdIBNf+3kgn55w/FyaY7dX6BIlQRXE6oIfWP+oVxbq+h0hQL2rQU43fjYc8
         PWhrjQz69rO4XvvRlwHdKXj6QExirTNrXz/d7toc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 05F2B60AD1;
        Wed, 22 May 2019 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558537094;
        bh=MrxtKzNkRf+nPvCFtEYRtvy6G8c6xAHGZ5idUbvj0+c=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dXa/JCDndhv6TZfNmHZOz6sSXABZ0tMVXNjYVp+8ri9xpD8EWyTKXtbO+lBG2i7xb
         1AGIDLvucGf51GiLrFbmwz3yuG3Rt8FyKimBuaN32DLfcUNHDssmwejvrclIobe78Y
         x8pzyUPxGfj440l34hfDpgPJghih+GeGgVgwTfu8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 05F2B60AD1
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH 2/3] regulator: qcom_spmi: Add support for PM8005
To:     Mark Brown <broonie@kernel.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, lgirdwood@gmail.com,
        agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, jcrouse@codeaurora.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
References: <20190521164932.14265-1-jeffrey.l.hugo@gmail.com>
 <20190521165315.14379-1-jeffrey.l.hugo@gmail.com>
 <20190521185054.GD16633@sirena.org.uk>
 <51caaee4-dfc9-5b5a-07c7-b1406c178ca3@codeaurora.org>
 <20190522110107.GB8582@sirena.org.uk>
 <4e5bdf77-3141-bff6-e5b9-a81a5c73b4e4@codeaurora.org>
 <20190522142837.GE8582@sirena.org.uk>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <81d07dd5-c0a2-f986-3d3e-198b6a5f0c30@codeaurora.org>
Date:   Wed, 22 May 2019 08:58:11 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522142837.GE8582@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/22/2019 8:28 AM, Mark Brown wrote:
> On Wed, May 22, 2019 at 08:16:38AM -0600, Jeffrey Hugo wrote:
>> On 5/22/2019 5:01 AM, Mark Brown wrote:
>>> On Tue, May 21, 2019 at 05:16:06PM -0600, Jeffrey Hugo wrote:
> 
>>>> I'm open to suggestions.  Apparently there are two register common register
>>>> schemes - the old one and the new one.  PMIC designs after some random point
>>>> in time are all the new register scheme per the documentation I see.
> 
>>>> As far as I an aware, the FT426 design is the first design to be added to
>>>> this driver to make use of the new scheme, but I expect more to be supported
>>>> in future, thus I'm reluctant to make these ft426 specific in the name.
> 
>>> If there's a completely new register map why are these even in the same
>>> driver?
> 
>> Its not completely new, its a derivative of the old scheme.  Of the 104
>> registers, approximately 5 have been modified, therefore the new scheme is
>> 95% compatible with the old one.  Duplicating a 1883 line driver to handle a
>> change in 5% of the register space seems less than ideal. Particularly
>> considering your previous comments seem to indicate that you feel its pretty
>> trivial to handle the quirks associated with the changes in this driver.
> 
> Ah, so it's not a completely new scheme but rather just a couple of
> registers that have changed.  Sharing the driver is fine then.  Ideally
> there would be some documentation from the vendor about this, a mention
> of IP revisions or some such.  If not what the DT bindings do for names
> is use the first chip things were found in.
> 

The documentation isn't great.  There isn't really an IP revision this 
started with.  Looking at all of the PMIC designs, this actually started 
with PM8005, so I guess "common2" becomes "pm8005", and the PMS405 
should reuse that.  I'll coordinate with Jorge.

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
