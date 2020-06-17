Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF88F1FCD16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 14:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbgFQMJl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 08:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgFQMJj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 08:09:39 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49887C06174E
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 05:09:39 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id n70so1400525ota.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 05:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EL5BzCkoUmainZKjx09aIYd6iOrNTRRO+Rauv/GEwCw=;
        b=hq3YTyLLtph2lK3ZOsv/FRvY6IybFEG5XMNJoQo9/tbRJh/5zXJv9sn4J1GOaldslH
         UToI2dp985JV/UUOSTwd7vcMgiKyjd3pnmrhiUKBMCvVGczpn+p7inyYus9TfUumWFWv
         WUnYsdUCIx3UL525CkkauewcjgNHg6uTOmOrwWqBbu6t4k1pIHzRrQnWjLQ065NG2hnJ
         j5rt5yD7OSVeOlcLDzQ0xQQl3QB6tsm72lCIsGaY+WjyiLnu/8DJvitjBWSH7+0zx4MB
         bB/mvE9jxBO8ZG1P2LvrER82G49JIt2XoleQe2trAXmA8po/Z7n0Jn6y+e7kKowfc/h7
         qIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EL5BzCkoUmainZKjx09aIYd6iOrNTRRO+Rauv/GEwCw=;
        b=hb9PW2ED1UMSc6Dm0sh1Ti9kVYNsWyt/tLYtqBu6Ndn7MaSrejZTo/0rqtFTlTthpV
         v/uzEZ1tZyBAywpWrGs1HbEJ37MfViKFOr+5L5ftQNkO2FMF1SHCdHeEBLV74Fv3BcsH
         GTQxxJC+hJa6AadTh+QdB6cA22Vedrz1HJitTEHjEBHp1Hv/d49n7DO03pWR+mevp+48
         v/lbdDeUbMt1C7Jn4CYzhpwFWDspmJUJ6JClWja/Ht3z4QyVO2pbqhzS6MPAFCIIV/pC
         EEziX01fSoavmB0nu1Izeh9NhNUu67uyntJBOzZRGQlgVPLDAdKkt4/mV7djXdIYeKfa
         bbig==
X-Gm-Message-State: AOAM530M89+YlZsi4bq4wwKHjthiFCbHjObgKja4g/a5lIym+RcZjjGo
        WI2kGuboxt1I86xEIAWEPtjtfdvs8lkQIrhnFnqSjg==
X-Google-Smtp-Source: ABdhPJyzu9qonwnPgqE//5itrvCdVGd52+dCAY0ouYokic1FEWqYsrvz3AvZUZqJitY64qAGv5yTDWWR9z35abY/ByY=
X-Received: by 2002:a9d:6a85:: with SMTP id l5mr5447118otq.371.1592395778151;
 Wed, 17 Jun 2020 05:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200602100924.26256-1-sumit.semwal@linaro.org>
 <20200602100924.26256-5-sumit.semwal@linaro.org> <20200602113241.GE5684@sirena.org.uk>
 <CAO_48GGgNUGosN2PiL=U5JkR3Bh5wNK3N4xYYML1UwmdfDPRww@mail.gmail.com>
 <20200602122554.GG5684@sirena.org.uk> <CAO_48GFwEHBGmz0QvN+pXFSyHC9+7=0aoJLHF4uupGSx2TcSvA@mail.gmail.com>
 <20200617114721.GD4613@sirena.org.uk> <CAO_48GF9pKZCCof170TvB0ubOkecDzcGhtUUuY_Td78L1J338A@mail.gmail.com>
 <20200617120601.GE4613@sirena.org.uk>
In-Reply-To: <20200617120601.GE4613@sirena.org.uk>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Wed, 17 Jun 2020 17:39:26 +0530
Message-ID: <CAO_48GGhX-AxjvvvPKRMc+LQ_Uws1s_b4Q+aHokVv2RxcpObQw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] regulator: qcom: Add labibb driver
To:     Mark Brown <broonie@kernel.org>
Cc:     agross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        lgirdwood@gmail.com, robh+dt@kernel.org,
        Nisha Kumari <nishakumari@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 17 Jun 2020 at 17:36, Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Jun 17, 2020 at 05:27:12PM +0530, Sumit Semwal wrote:
> > On Wed, 17 Jun 2020 at 17:17, Mark Brown <broonie@kernel.org> wrote:
> > > On Wed, Jun 17, 2020 at 05:12:35PM +0530, Sumit Semwal wrote:
>
> > > > I understand from a pure regulators' correctness point of view,
> > > > ENABLE_CTL should be the one checked there, so I can change the patch
> > > > as you suggested, but there seems to be some performance penalty
> > > > there.
>
> > > I thought the goal was to have the performance penalty to ensure that
> > > the regulator had actually started?
>
> > IMHO, with the poll_enabled_time mechanism added, we would not need to
> > wait for the full enabled_time time for the regulator to get enabled,
> > but we could poll (and potentially know earlier) if the regulator is
> > enabled.
> > The performance penalty I was talking, is about how should we check if
> > the regulator is really enabled or not - via reading the STATUS1
> > register, which seems to tell the status a bit faster, or via reading
> > the ENABLE_CTL register which we also use to enable/disable the
> > regulator, but which seems to be slower in updating the status.
>
> That seems...  interesting.  Are you sure the regulator has fully ramped
> when STATUS1 starts flagging?
On a consumer device, I am not sure I have any way of checking that,
but if there's some way you'd like me to validate it, I'll be happy
to.
>
> > > > > > The WARN_ON? This was suggested by Bjorn to catch the case where the
> > > > > > DT binding for a PMIC instantiates only one of the regulators.
>
> > > > > No, this whole loop - why this whole match and get child stuff?
>
> > > > This loop mechanism is what I saw in the other qcom regulators
> > > > upstream, so thought it was an acceptable way.
> > > > For the two children nodes, do you recommend another mechanism to get
> > > > and validate both nodes?
>
> > > I don't understand what you mean by "two children nodes" here?
>
> > The two 'lab' and 'ibb' regulator nodes that are part of the labibb node.
>
> Use of_match and regulators_node like other regulator drivers.

Ok, let me see what I can do with those; we still need to flag if some
platform only instantiates one of the two lab/ibb regulators - I was
given the impression they're 'both or none' case.

Best,
Sumit.
