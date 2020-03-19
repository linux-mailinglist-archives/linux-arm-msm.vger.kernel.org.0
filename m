Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56E7818B136
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 11:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbgCSKYQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 06:24:16 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34229 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbgCSKYQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 06:24:16 -0400
Received: by mail-pg1-f195.google.com with SMTP id t3so1044594pgn.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2020 03:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ejqis7jZWtiS2ZJTMrRUUKldwFIqOJuqqMCf3220n+4=;
        b=hMfSKg1AkvvlQME8YGZu9tky0WqVsplrt7JrWxrTqFiKboOzIKmDiLwh38WSiez0Fx
         vXZMCa3A7gMmUsjJPEhaooP1Ibtae1V2h41wqN/eazLKPEHSNnKKYuQf/0b0+zE5J8Wi
         0I1L0Tle35xHNWanMkUymga3f0fTvI7mHSCwYYn58YQJAYcyHXN3zU8YKYvpx+e0vH6D
         kWPR9rMXZVqj3BbI5CqtsWgQ9GYbokoBYeInrFcSgvNOeHJmSS/l1Sledp1LRbZm+RYk
         mQqtoEoCncsJ7+Xu3Lk5JAWFh3UVJojPdtcpy+wOXJm/sOhMva0WyyI1C8WDvdOBA5JR
         rxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ejqis7jZWtiS2ZJTMrRUUKldwFIqOJuqqMCf3220n+4=;
        b=IxAIJUtnI6H0v+O771DGQCwoNBEBCi2wsH0hZgqDqExDiYBj3cfUiCeYk9wBhFpI3b
         NBSV1EcmlTWxYXOrptp2zNch0rGPNHSW8KDmHcHgyLnNJT5gEa3hxXJJF58TnwdgW2uK
         3U/5Uu75Xd1gOYe4Uo/Is4/si9X+ZiD/ulrDvb037qdF8CIgEEfZ4cpGqo0jCj/Nmh4W
         ZQPQuwG8pw/c3gWhSDB+kOQXMJYyAZQchb40vG3J/L7IZcxm6ZrnH1CWbgvYQKjDl23F
         LDlwd3uChfayWjtVvvSHZYYl9G8zQVPM7Zt3l9FOTbmc8h8NoDpdzHqI39/NAhjrPUM5
         wgpg==
X-Gm-Message-State: ANhLgQ03QyMxrRVYNceBbdEuhIjwMkjnSPXC99/Xrij8DyAEM6dBKL/2
        3t9d0MOxdxylGRPpt4SkE9mhng==
X-Google-Smtp-Source: ADFU+vsfsrSDZTmHpVU3LAAmj3UlUBy/81zcWkCE3fx118L6TIcuQvcw29TgeFrn42KkMnYAVFhMaQ==
X-Received: by 2002:aa7:8708:: with SMTP id b8mr3375903pfo.209.1584613454639;
        Thu, 19 Mar 2020 03:24:14 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id i126sm1850038pfc.105.2020.03.19.03.24.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Mar 2020 03:24:13 -0700 (PDT)
Date:   Thu, 19 Mar 2020 15:54:11 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, sboyd@kernel.org,
        georgi.djakov@linaro.org, saravanak@google.com, nm@ti.com,
        bjorn.andersson@linaro.org, agross@kernel.org,
        david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        rjw@rjwysocki.net, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dianders@chromium.org, mka@chromium.org,
        vincent.guittot@linaro.org, amit.kucheria@linaro.org,
        ulf.hansson@linaro.org, linux-kernel-owner@vger.kernel.org
Subject: Re: [RFC v3 00/10] DDR/L3 Scaling support on SDM845 and SC7180 SoCs
Message-ID: <20200319102411.oivesngrk7gy7vtw@vireshk-i7>
References: <20200127200350.24465-1-sibis@codeaurora.org>
 <19cf027ba87ade1b895ea90ac0fedbe2@codeaurora.org>
 <20200318034243.o2metmggzuah6cqw@vireshk-i7>
 <f6a7930a-4eaa-6982-88c6-b50773bee9d8@codeaurora.org>
 <ea4265f3f4b5a439d70d3c80bcc77b7f@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea4265f3f4b5a439d70d3c80bcc77b7f@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19-03-20, 15:41, Sibi Sankar wrote:
> Viresh,
> Saravana's example does show a device
> with multiple opp tables but doesn't
> need multiple opp table support to
> land though (since it works fine with
> the current implementation). I am more
> interested  in understanding your/
> Stephen's/Saravana's stance on adding
> multiple opp-table support. Personally
> I feel its inevitable, since multiple
> qc drivers using interconnect opp-tables,
> routinely need vote on multiple paths in
> a non-trivial manner.

The OPP core doesn't support multiple OPP tables for a device and I
don't understand how it will. And so I have been waiting for a reply.

> > 
> > Could you please post a link to the discussion that you are referring to
> > here?
> > I looked at a few links posted in the cover letter as dependencies and
> > it seems
> > like the discussions are pending for *months* and not weeks but I
> > might have looked
> > at the wrong ones.
> 
> https://lore.kernel.org/lkml/20200114103448.odnvqawnqb3twst5@vireshk-i7/
> 
> Rajendra,
> Viresh is referring to ^^ one

Right, thanks.

-- 
viresh
