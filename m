Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22D831ED5DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 20:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbgFCSJw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 14:09:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbgFCSJw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 14:09:52 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F657C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2020 11:09:51 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id u17so2888446qtq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2020 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l+YRFO1Jqur/v+izNNUOK0uXUs+D9YNZAMbqThNlzeA=;
        b=NldWpumuhDbPRpYzENr0K/9s/qHVPFcaULayo2UH6gBZY5klR9F0u7BdisexLTUr60
         rtrNS5LDZo4+h7qSUL1dULzAzJamfgEuu2abhGV5SZqiPQakbedt3sJhIG0HoBRFH+3l
         L6xLtKbwTDA/9Z2SNH4d45SZRYWQQ/TqqhzJKX3igwQhHbBP6m49b0vT06weMuB5+FFK
         gdoqGDR7MJFK1cAvidDnBb2AsdsPvl94j1gf6E8JeNupkkDWVLG0vZSaX6eBYJgpO5r2
         hWY1b9i8O9CuTQTGKEIwjuLXiYiP2eXUxVKLajVQUqaHObMbFuZq8LmA64skR4XaRbSE
         IoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l+YRFO1Jqur/v+izNNUOK0uXUs+D9YNZAMbqThNlzeA=;
        b=h8o5m5vTwL4Wgx+i8uFns7PIplBvh0Mnb/PmUduZVEE1/kj8DiSysfmn1yypY7S2ZQ
         dklTYSxGY8iFV/8s+gYg43ly7XPK+ld0LafoM//YxjTOhdt1Zd0PnbbmoJz7FzihZRSD
         aWv7a8WzC7n8zortO3IsPgVU6StzQWdQVzahO9LeygNSoBNOnoyf1rWRp4GRsQTXAm2w
         YxIDBSm3VE1PB6GIV+K4218uOzbzDs61dhCW+I1KbDIsnC6eek/P3wIvODv6tK3lXeff
         3KabpzTEC3g1o8AToK80HPdomnMyhgMTZCfqJadiZmgv1YYiwn7rIu+eDx9wvPIbpV3J
         6FdA==
X-Gm-Message-State: AOAM532XuWcRIAXsj5B9qttW5/RDElYw0DwdcWDUoNcrWjG4X0836RTp
        I5aX15n+1pXJBmbWVmjlfsIAkw==
X-Google-Smtp-Source: ABdhPJykygamjsojzqNXzfdSommDfxYT09rvBLBZ/o9nNI1XtfpsPstLVOAM+OK1Jj+lwJGLleSXFA==
X-Received: by 2002:ac8:3fdb:: with SMTP id v27mr623567qtk.220.1591207790414;
        Wed, 03 Jun 2020 11:09:50 -0700 (PDT)
Received: from yoga ([2607:fb90:84f0:6dc6:b843:e3ff:fe62:cb58])
        by smtp.gmail.com with ESMTPSA id v144sm2243803qka.69.2020.06.03.11.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 11:09:49 -0700 (PDT)
Date:   Wed, 3 Jun 2020 11:09:43 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 08/10] clk: qcom: Add graphics clock controller driver
 for SM8250
Message-ID: <20200603180943.GX11847@yoga>
References: <20200524210615.17035-1-jonathan@marek.ca>
 <20200524210615.17035-9-jonathan@marek.ca>
 <c4d43cf01b6d014fdc2258abb94eb2c5@codeaurora.org>
 <20200529011127.GJ279327@builder.lan>
 <dbcb5c24f8888d6b0cfc63a80e310319@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbcb5c24f8888d6b0cfc63a80e310319@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 28 May 23:56 PDT 2020, Sai Prakash Ranjan wrote:

> Hi Bjorn,
> 
> On 2020-05-29 06:41, Bjorn Andersson wrote:
> > On Mon 25 May 02:47 PDT 2020, Sai Prakash Ranjan wrote:
> > 
> > > Hi Jonathan,
> > > 
> > > On 2020-05-25 02:36, Jonathan Marek wrote:
> > > > Add support for the graphics clock controller found on SM8250
> > > > based devices. This would allow graphics drivers to probe and
> > > > control their clocks.
> > > >
> > > > This is copied from the downstream kernel, adapted for upstream.
> > > > For example, GDSCs have been added.
> > > >
> > > > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > > 
> > > Since this is taken from downstream, maintain the original author's
> > > signed-off and add yourself as the co-developer if you have done
> > > any modifications. Same applies to all other patches.
> > > 
> > 
> > I disagree with this.
> > 
> > As expressed in the commit message, this patch is based on the
> > downstream driver, not the individual patch.  As such, the _patch_ is
> > prepared by Jonathan and by his Signed-off-by certifies the origin of
> > the contribution per section 11.a or 11.b of submitting-patches.rst.
> > 
> 
> I lost at the downstream driver vs the individual patch here. So the
> downstream driver is also an individual patch right or did I get
> something completely wrong.
> 

The downstream driver is the result of a series of patches, by various
people, whom all use their Signed-off-by to denote that what they add is
conforming to the given license and that they have permission to
contribute to the project.

> So if someone prepares a patch and includes a commit description
> saying it is taken from downstream, does it mean he is the author
> of that patch?

No, but I think the wording here is wrong. The patch is not taken from
downstream, it's based on downstream code.

> Shouldn't the author be included in  "From: Author"
> and his signed-off appear first before the submitter's(also a contributor)
> signed-off?

It should, in the case that what is contributed is the forwarding of a
patch found somewhere.

But as I said before, Jonathan does through his S-o-b state that his
patch is based on previous work that is covered under appropriate open
source license and that he has the right under that license to
contribute said work.

As such, his patch is meeting the requirements.


The other part is how to give credit to authors of the original work,
Jonathan does that by stating that it's based on work in the downstream
kernel - which is quite typical to how it's done.

> Or is it because these clock data is auto generated and it
> doesnt really matter?
> 

No. The author and s-o-b relates to license compliance, as such the
person who committed the auto generated work will sign off that the
content is license compliant and he/she is allowed to contribute it to
the project.

Regards,
Bjorn

> > 
> > Regarding co-developed-by; this should not be used when "forwarding" an
> > existing patch. Per section 11.c the contributor should add their
> > Signed-off-by to certify the origin of the patch. Any modifications
> > should be documented in immediately proceeding the s-o-b, as described
> > later in section 11.
> > 
> 
> Yes makes sense to not have co-developed-by for forwarding patch.
> 
> Thanks,
> Sai
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
