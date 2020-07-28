Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6D52302F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 08:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728027AbgG1Gc0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 02:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728057AbgG1GcY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 02:32:24 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA99C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 23:32:23 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a9so10950819pjd.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 23:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=R1XV7yzuiaQ7OtaNP9ZBw60TBoQeSPX4RFj4H0V2PEE=;
        b=wXWPNw434KkwEOsqYkpoS8zrjZS8Asyrx7oJ58T34KdJ38mBxeSc/JedI7kLjrCV9w
         a1SeHnXVUSIHRQfSX8Oh9rtBTLprjbV0MJUddTmM1vUmZM+GJBKTIVoFmdNvrSgBG0kL
         UH4Gy/0Ef0oP62w48kOvxuyLrvzF+sh9TB0nG9ZijbpcW4OLFD3XzhKzh+TA+/JP/ZAY
         yuhxhcRYD62jV8Wlkj+/8onMTNs4Dz1EWtm46SGM1vNDfhWql1olb7AYPoobfNZMqBG5
         pmy7/JNnln9kC2vhzZpSJrM1bTgYjA7DYQug6koEHpTV8OCuVRY6CQuRgN1fQQ+FdOKR
         QSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R1XV7yzuiaQ7OtaNP9ZBw60TBoQeSPX4RFj4H0V2PEE=;
        b=l8rLmb/XbudApCxoz5juVhvnOvLfct1zN8Wd92SGhbVKrtcog9t4spqZX8WeCY9l49
         VBqW7ixsioblDJwtW9xXxoamlKnJ5J/GE1zNXB5fv0yrkKDcC299znkymP7eN67G6pAx
         9Cn67VfMbHkMHSWCOyKiixfYNyyqQ9Sa9g5bOOk50z3wPdurYTqMHoamZ1th8lGFEycM
         e/7HrJG2c+eowFAFRfyFRErb9WVjeEgcR7wR/fYBuuMD5eANTH4j0Qov8DvlXo3SlnKz
         pvzy6QBaQ3w71gDPjGxqGCSttALvPw/jFbq8O2JRJoGmUfX7BVNmsbpHAF0gJSi3R1DO
         tEQw==
X-Gm-Message-State: AOAM533p7e+tSBMQ8kMM2NWQLUlI/7gX4g5p6LgnpU6bboGR9JKc8TmC
        PKHU06xDdf69C02OEMHoaYTkPQ==
X-Google-Smtp-Source: ABdhPJxteaqumaf0pqol1Li/6eDvJDAmSa/xIX4yFwUUeZrYYWwHSASFU/w3SiEOCbWX3klVCCEOWg==
X-Received: by 2002:a17:90b:3010:: with SMTP id hg16mr2897765pjb.69.1595917942810;
        Mon, 27 Jul 2020 23:32:22 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a3sm17274887pgd.73.2020.07.27.23.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 23:32:21 -0700 (PDT)
Date:   Mon, 27 Jul 2020 23:28:50 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        mike.leach@linaro.org, Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sc7180: Add iommus property to ETR
Message-ID: <20200728062850.GC202429@builder.lan>
References: <cover.1591708204.git.saiprakash.ranjan@codeaurora.org>
 <2312c9a10e7251d69e31e4f51c0f1d70e6f2f2f5.1591708204.git.saiprakash.ranjan@codeaurora.org>
 <20200621072213.GG128451@builder.lan>
 <f40621b2b01f836a8a97686707599dd0@codeaurora.org>
 <e270acd3f7db076c043f1b982b1efea0@codeaurora.org>
 <20200727205834.GA202429@builder.lan>
 <207e6b6a297d5ce1bdcac204e297389b@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <207e6b6a297d5ce1bdcac204e297389b@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 27 Jul 21:40 PDT 2020, Sai Prakash Ranjan wrote:

> On 2020-07-28 02:28, Bjorn Andersson wrote:
> > On Tue 23 Jun 23:56 PDT 2020, Sai Prakash Ranjan wrote:
> > 
> > > Hi Bjorn,
> > > 
> > > On 2020-06-21 13:39, Sai Prakash Ranjan wrote:
> > > > Hi Bjorn,
> > > >
> > > > On 2020-06-21 12:52, Bjorn Andersson wrote:
> > > > > On Tue 09 Jun 06:30 PDT 2020, Sai Prakash Ranjan wrote:
> > > > >
> > > > > > Define iommus property for Coresight ETR component in
> > > > > > SC7180 SoC with the SID and mask to enable SMMU
> > > > > > translation for this master.
> > > > > >
> > > > >
> > > > > We don't have &apps_smmu in linux-next, as we've yet to figure out how
> > > > > to disable the boot splash or support the stream mapping handover.
> > > > >
> > > > > So I'm not able to apply this.
> > > > >
> > > >
> > > > This is for SC7180 which has apps_smmu not SM8150.
> > > >
> > > 
> > > Please let me know if this needs further explanation.
> > > 
> > 
> > I must have commented on the wrong patch, sorry about that. The SM8150
> > patch in this series does not compile due to the lack of &apps_smmu.
> > 
> > I've picked the other 3 patches.
> > 
> 
> Thanks Bjorn, I can resend SM8150 coresight change when SMMU support lands
> for it
> since coresight ETR won't work without it on android bootloaders.
> 
> As for the other 3 patches, Patch 1 and Patch 2 will apply cleanly to the
> right coresight
> nodes but due to the missing unique context in Patch 3, it could be applied
> to some other node.
> We had to upload this change 3 times in chromium tree to get it applied to
> the right replicator node :)
> and this property in Patch 3 is important to fix a hard lockup. I'm not sure
> why this patch is missing
> the proper context :/
> 
> I couldn't find the changes yet in qcom/for-next or other branches to see if
> it is
> applied to right replicator node. In case you haven't applied it yet, Patch
> 3 change
> should be applied to "replicator@6b06000" node.
> 

Thanks for pointing that out, I've fixed up the incorrectly applied
change. (Still not published the branch)


For the future I believe you can pass -U <n> to git format-patch to get
<n> number of lines of context. Making that bigger than the default 3
should help for the coresight patches.

Thanks,
Bjorn
