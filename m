Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 961A2132F2B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 20:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbgAGTPi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 14:15:38 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33483 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728540AbgAGTPi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 14:15:38 -0500
Received: by mail-lj1-f196.google.com with SMTP id y6so770624lji.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 11:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f1zqqKzCp+fQXlk6LschxocOmKVvhkA/tqAPfE1DRwg=;
        b=EDhJgHdD+dDxLcD1C/3itQ2bO29EgOrdBk/t20nJfDdtrlsPNTIDxDbM+Ez0gX8F+0
         k4fZo6HGwZo+GOY7ukLPoURF/FqujJ5g1MhjZOKRRohMhjOqBs0fgWToJLdXqWCwmVTj
         RI1rFaO2sYMwFiks9NCAHqPrqQO/BQ/LhGA7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f1zqqKzCp+fQXlk6LschxocOmKVvhkA/tqAPfE1DRwg=;
        b=G+iFbE7rtbK8/YAgyKnrf2YLMw7H2M9H3YZq8gGhfwe396aSvM4LeYKNwR/QYgLkDK
         WqMI+AwItfTNwS4a/xBDzu51lnogbnc72f/lHfmm+eaZnVeHjrpycdTq+G3PggnhSFxY
         tlSgBylIuHsSSAdMRxb1H+vGNnI+yHdQvQHuQoftXLSHUHqTKyPsw8KLDUiZ4EuW6dSh
         L9iViYWPAEsZ9eACTJ3ylRn3KSUUApnJM72Ocb9PVtQRVQqyrPxgnvJuKRLdZTdjkJ9z
         S7ElX4+ZtKdd0lisXUly7pgOBD4kNFiWWFJML2umd3UPF8j/OqHojSoVxgrte8rvxPHg
         AapQ==
X-Gm-Message-State: APjAAAUtBwJlfEpSM9q5ZLudspIQrPVZIhNqeCYDEay9iZGkY/EqJEK6
        6w223nF4eOedQX9lEpgaGffIieAqNW8=
X-Google-Smtp-Source: APXvYqwjXtGm4cBW2FGk25mECdUi5JstSSFiXuWkEtBgf/OD5A0mJ7SNULEqAZmh2/STaDzFd94ovA==
X-Received: by 2002:a2e:9e55:: with SMTP id g21mr546053ljk.245.1578424536346;
        Tue, 07 Jan 2020 11:15:36 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id l12sm220411lji.52.2020.01.07.11.15.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 11:15:36 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id u1so718692ljk.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 11:15:35 -0800 (PST)
X-Received: by 2002:a05:651c:232:: with SMTP id z18mr497045ljn.85.1578424535265;
 Tue, 07 Jan 2020 11:15:35 -0800 (PST)
MIME-Version: 1.0
References: <20191118154435.20357-1-sibis@codeaurora.org> <0101016e7f30ad15-18908ef0-a2b9-4a2a-bf32-6cb3aa447b01-000000@us-west-2.amazonses.com>
 <CAE=gft5jGagsFS2yBeJCLt9R26RQjx9bfMxhQu8Jj4uc4ca40w@mail.gmail.com>
 <0101016e83897442-ecc4c00f-c0d1-4c2c-92ed-ce78e65c0935-000000@us-west-2.amazonses.com>
 <0101016eac068d05-761f0d60-b1ef-400f-bf84-3164c2a26d2e-000000@us-west-2.amazonses.com>
 <CAE=gft5cS54qn0JjxO58xL6sFyQk4t=8ofLFWPUSVQ9sdU4XpQ@mail.gmail.com> <b11c2116-f247-17c5-69ca-071183365a01@codeaurora.org>
In-Reply-To: <b11c2116-f247-17c5-69ca-071183365a01@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 7 Jan 2020 11:14:58 -0800
X-Gmail-Original-Message-ID: <CAE=gft6Dr_=zQ1h93qdxzi-GsZv3caddyOGaGQpSi+8BmBSO+Q@mail.gmail.com>
Message-ID: <CAE=gft6Dr_=zQ1h93qdxzi-GsZv3caddyOGaGQpSi+8BmBSO+Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] interconnect: qcom: Add OSM L3 interconnect
 provider support
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        David Dai <daidavid1@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-kernel-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 16, 2019 at 10:30 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Hey Evan,
>
> On 12/7/19 12:46 AM, Evan Green wrote:
> > On Wed, Nov 27, 2019 at 12:42 AM Sibi Sankar <sibis@codeaurora.org> wrote:
> >>
> >> Hey Evan/Georgi,
> >>
> >> https://git.linaro.org/people/georgi.djakov/linux.git/commit/?h=icc-dev&id=9197da7d06e88666d1588e3c21a743e60381264d
> >>
> >> With the "Redefine interconnect provider
> >> DT nodes for SDM845" series, wouldn't it
> >> make more sense to define the OSM_L3 icc
> >> nodes in the sdm845.c icc driver and have
> >> the common helpers in osm_l3 driver? Though
> >> we don't plan on linking the OSM L3 nodes
> >> to the other nodes on SDM845/SC7180, we
> >> might have GPU needing to be linked to the
> >> OSM L3 nodes on future SoCs. Let me know
> >> how you want this done.
> >>
> >> Anyway I'll re-spin the series once the
> >> SDM845 icc re-work gets re-posted.
> >
> > I don't have a clear picture of the proposal. You'd put the couple of
> > extra defines in sdm845.c for the new nodes. But then you'd need to do
> > something in icc_set() of sdm845. Is that when you'd call out to the
> > osm_l3 driver?
>
> with sdm845 icc rework "https://patchwork.kernel.org/cover/11293399/"
> osm l3 icc provider needs to know the total number of rsc icc nodes,
> i.e I can define the total number of rsc nodes and continue using the
> same design as v3 since on sdm845/sc7180 gpu is not cache coherent.
>
> or have the osm l3 table population logic and osm icc_set as helpers
> and have it called from the sdm845/sc7180 icc driver so that we would
> be able to link osm_l3 with rsc nodes on future qcom SoCs.

I see, so if we use the same design as v3, then the number of nodes is
established at compile-time, and ends up being specific to sdm845. I'm
fine with either approach, maybe leaning towards the hardcoded
#defines you have now, and waiting to do the refactoring until you
actually have two SoCs that can use this.
-Evan
