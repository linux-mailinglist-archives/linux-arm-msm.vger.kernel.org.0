Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4DB6D152
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2019 17:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbfGRPrj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jul 2019 11:47:39 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41114 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbfGRPri (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jul 2019 11:47:38 -0400
Received: by mail-pl1-f195.google.com with SMTP id m9so14028375pls.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2019 08:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=560PSkF5dpA+2PC3MPuVU9QamTae65D5mdIYq7VhBIY=;
        b=nWn8WF88sGLEvnb9ZAUWfxOrZrBijsDaLNjzEI37z6o1PMe1syCzFJjND489Yc6+ou
         aVo7+CR6iQQ96mDwliLCqsSjegPmbtIDdNhpeI3ea7KXgmpnSjHA4vcaGA2m/Rr84uV0
         9eSKIotIn4R+piPaKAR5DA5aP8DXUpoOME4bUODykpR7rYft9hAXH9px3AqDkyn7sR9d
         V1IbuNQS1Ht1/R5Y14LlHlIfsbhgoKeTOUBG5ig4YH3t86kCHkw2UN2suZv4xDGQGKhp
         iDyLapqZz5RLFl50jSV9imMDVllyL94z1u+Dypr+q+Xi8zGJgowlVGDUrJiOnmRnbxDM
         J7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=560PSkF5dpA+2PC3MPuVU9QamTae65D5mdIYq7VhBIY=;
        b=sKihWKIaa/glazBK4p8IstKqtGgQ01/cE/dhwH4fJXZZkDEQf2rTuXHD0Gqgc8y7GC
         of2SllfJ9i+DBEGCL61LzjulPNF+F6Y7MjK65pD7MVyfoJJc5Wq20hjO9D7y6LkKBvMf
         bcz3RNcAeszcqxuDR/zi8qcJzHT4UDb27IZgGkWXeKw6WyMUfc9aEDeThYu6/UGDobLY
         IjudWUM0bcyfkC9aFBv+DLEdhCsAc49hKWoPjhp7ngfJc08QIGXqU02dTyfu+BIfEtg2
         Ut0ggwBJTt7l9gdqtlKpfXncPsk9Qf9IGiH6QSrvkZn+KJLBTWAvB+KSFscrjqPrWrhZ
         mEnw==
X-Gm-Message-State: APjAAAUm8Abzz3+V6OoD6lz/mcAH61i1PSlOYyxLBT/oIi5r0EPJbmmA
        qOQ+Pfu3/Fc+uptNR6M0VYPxIopboSk=
X-Google-Smtp-Source: APXvYqzrkSMa3rD3Yn3FdqMZT++R/bJ0PBNWrljxysyHeNXu8HhFYIihfsp9bFamug8U81UUhmEQDA==
X-Received: by 2002:a17:902:2ac7:: with SMTP id j65mr51319606plb.242.1563464857764;
        Thu, 18 Jul 2019 08:47:37 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f197sm28101015pfa.161.2019.07.18.08.47.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 18 Jul 2019 08:47:37 -0700 (PDT)
Date:   Thu, 18 Jul 2019 08:48:54 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Re: [PATCHv8 3/5] arm64: dts: qcom: msm8996: Add Coresight support
Message-ID: <20190718154854.GB7234@tuxbook-pro>
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <2fa725fbc09306f1a95befc62715a708b4c0fad0.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <20190717170050.GB4271@xps15>
 <f28d9c8f-017c-c990-2f00-0ef5a62f3b40@codeaurora.org>
 <CANLsYkx9X36OJmczNK1255y8fKJfkyVq1zyQUDihqMewcU6Kxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkx9X36OJmczNK1255y8fKJfkyVq1zyQUDihqMewcU6Kxw@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 18 Jul 08:31 PDT 2019, Mathieu Poirier wrote:

> On Wed, 17 Jul 2019 at 23:47, Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
> >
> > Hi Mathieu,
> >
> > On 7/17/2019 10:30 PM, Mathieu Poirier wrote:
> > > On Fri, Jul 12, 2019 at 07:46:25PM +0530, Sai Prakash Ranjan wrote:
> > >> From: Vivek Gautam <vivek.gautam@codeaurora.org>
> > >>
> > >> Enable coresight support by adding device nodes for the
> > >> available source, sinks and channel blocks on msm8996.
> > >>
> > >> This also adds coresight cpu debug nodes.
> > >>
> > >> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> > >> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > >> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > >> Acked-By: Suzuki K Poulose <suzuki.poulose@arm.com>
> > >> ---
> > >>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 434 ++++++++++++++++++++++++++
> > >>   1 file changed, 434 insertions(+)
> > >>
> > >
> > > We've gone trhough 8 iteration of this set and I'm still finding checkpatch
> > > problems, and I'm not referring to lines over 80 characters.
> > >
> >
> > I only get below 2 checkpatch warnings:
> >
> > If you are talking about the below one, then it was not added manually.
> > It was taken automatically when I pulled in the v7. Should I be
> > resending this patch for this?
> 
> That depends if you want David and Andy to pickup your patches - I am
> sure they'll point out exactly the same thing.
> 

If it's only the capitalization of "By" then I'll just fix it up as I
apply the patches (thanks for pointing it out though!).

But it seems the discussion on patch 2 needs to settle(?) (And the merge
window has to close).

Regards,
Bjorn

> >
> > $ ./scripts/checkpatch.pl -g 2fa725fbc09306f1a95befc62715a708b4c0fad0
> > WARNING: 'Acked-by:' is the preferred signature form
> > #14:
> > Acked-By: Suzuki K Poulose <suzuki.poulose@arm.com>
> >
> > WARNING: line over 80 characters
> > #154: FILE: arch/arm64/boot/dts/qcom/msm8996.dtsi:763:
> > +                       compatible = "arm,coresight-dynamic-replicator",
> > "arm,primecell";
> >
> > total: 0 errors, 2 warnings, 440 lines checked
> >
> >
> > -Sai
> >
> > --
> > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> > of Code Aurora Forum, hosted by The Linux Foundation
