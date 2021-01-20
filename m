Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C522FD256
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jan 2021 15:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387810AbhATOHt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 09:07:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390040AbhATNc2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 08:32:28 -0500
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728F3C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 05:31:48 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id u27so4390504uaa.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 05:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EygyrNo1L66YguGSTSkEZs1oOOE5dPsaKPmSAlahwhk=;
        b=hFuCyLYIUL4bPuSmVyGwJ5qOdl9VuxHNMdTOzr19HhTY8Qw8M95643Sr3sDDY21Zyu
         jNzFPBb0zSofa2aZatqnXTmPP2A3EJeg8yfRxYVD6DihsAyj8Maeg9uS9lLCNNXdVdTQ
         PW2VMXc5rtoUbZO4cuH3/JfK7gVdE59o8Ten4A9HedDee2EqeCupC4s/KIHpVsRaf7CT
         ur2XoCezvAZaDTLJbgoP5Gq/Jwyr3yknamxPGVOa5y5ngerkbktCxytiKcxbgbm1NsLs
         M9cupGjLJf30oFZQ90aLQbh9Zxwq49JQkZ+dqcg3cAnVp7Ce70WZI42+e5dc3JSMr/LW
         LtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EygyrNo1L66YguGSTSkEZs1oOOE5dPsaKPmSAlahwhk=;
        b=NYtmzxB31KhNBWoG822AtCpXOSoh/w88q8PNhutBh+qG4wuy1q3famL6pjmTSq4D49
         AECKW7CPDu3ysAgxFnX2RehKczzY3Jt50QnYUrQw4g8EYOPDjQRabV+wqVdNT3gqejro
         ktIykmywKzgBaRJTmsF7mEcEEpJRMM7M+IEUPqKQv67W8Dss9PrVmCkJ+8Uzxmj3+o0B
         YxaokuVuhmHFxRO7Zu4xIZJf4nhfKfjGS4opvLV2EeeYFFGNyI7sMPVabU5C7HOZPWHY
         WaSNgjhiuDGEwyySE9JPOpGnOrR7uuOMY7IO09kEIo4nfuzvQ8xdS+TnR94l4u0Hptue
         7dRA==
X-Gm-Message-State: AOAM533xnG6Ta3Bw96jmRBR+maEUzajLilalJ2IsCq/iB2Tlks5+wAmj
        dwLnvhbFaSVBygDmceuMfezcXRFzwVUoEq0BMC/zjw==
X-Google-Smtp-Source: ABdhPJzkobxZ3ZkN8/e+5qJpHJ+BQ3MwguUnina2HKp/lBcnr/mhXKUDNIf5dGu8SstEZIGrIePbNt3r4BgNcnONcXo=
X-Received: by 2002:ab0:768:: with SMTP id h95mr6005681uah.104.1611149507447;
 Wed, 20 Jan 2021 05:31:47 -0800 (PST)
MIME-Version: 1.0
References: <20201224111210.1214-1-rojay@codeaurora.org> <20201224111210.1214-4-rojay@codeaurora.org>
 <YAGqKfDfB7EEuZVn@builder.lan> <6bfec3e6-3d26-7ade-d836-032273856ce2@codeaurora.org>
 <CAPDyKFqF0NE3QRAEfiqj5QOXXH2om4CpyyeudeqoovANfvjsaQ@mail.gmail.com> <20210119110516.fgbbllyg7lxwwfdz@vireshk-i7>
In-Reply-To: <20210119110516.fgbbllyg7lxwwfdz@vireshk-i7>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 20 Jan 2021 14:31:10 +0100
Message-ID: <CAPDyKFogrWt=K3VtEZVH5bPL_fYt7rgdm5wGgq+QHtzX-n0z7g@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: i2c-qcom-geni: Add support for 'assigned-performance-states'
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, parashar@codeaurora.org,
        Linux PM <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 19 Jan 2021 at 12:05, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 19-01-21, 12:02, Ulf Hansson wrote:
> > As a matter of fact this was quite recently discussed [1], which also
> > pointed out some issues when using the "required-opps" in combination,
> > but perhaps that got resolved? Viresh?
>
> Perhaps we never did anything there ..

Okay. Looks like we should pick up that discussion again, to conclude
on how to move forward.

>
> --
> viresh

Kind regards
Uffe
