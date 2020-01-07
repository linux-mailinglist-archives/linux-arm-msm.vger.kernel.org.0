Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7701E1337AF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 00:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727761AbgAGXqH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 18:46:07 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35698 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgAGXqG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 18:46:06 -0500
Received: by mail-lj1-f195.google.com with SMTP id j1so1431187lja.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 15:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HQMY8R3LoWt/DsrAqKQp49rhgXtLc3e3mn4wK30Z9bk=;
        b=gkmbpd8bIKIIQEgsb7PEU+2r4ebECX1mH3jgU38dGjJQ8bwXIJG5GKLnoLrnX3Q1Tp
         v1SDB6I1ZXgqhUT4odQ8aVr64tXRhQzQKUJB+gim+8tzuQBIEEgYa0NEh52zxV9MySl4
         8hPqbEMycxVGQOzMT2ZoovSrn2sYCBWsQ2InRnJJnXhziW8CiS8uBVxVuagMUfjKujCp
         HniHcll8yMXWX4ecEITXFam+QamI4BHfLL7Gcvl7S+kf3c4RHt8RoST1Bi3vdrXuETyI
         Kn2nFOF6G8BTDLxmpQhXEOKSQ8HHgKI3g4y9E8Ezgf28cpYXwn+lC6jP8DwKEiXAfN4W
         io5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HQMY8R3LoWt/DsrAqKQp49rhgXtLc3e3mn4wK30Z9bk=;
        b=AVhWKFdBRWEDjvfbRO3xxsxDe8sB/Uegj/QLVR7IMofCQAq+oJCQVcodjNAbJt62rF
         riGWrBSgMGl6TYfgV8bP3v1gYtwRCrasapvPKcye/w6iulRRaz2DP3STxSIoicExkh6T
         P4ehpk7OiTA2/tOjwB0yGfPMl3BkKzhhVP8mWB4SJiq4mEuALq7fvwANNIXUDwxpxhQp
         8jou18OnQghK/VIpO4cjVP8v9aHaF6oUuKuIxDMGbv+sqTBqmcoHa5ZgnPqrn8h7ONG+
         XSo0q72vxnUoVT8RqMx86QMMGtg59QDPMDt3rrWwpIbw3b7jHW2Rqj/OfXw0WRW+L0tS
         eYEw==
X-Gm-Message-State: APjAAAVMoc06JGNqLYJkgqZJRuoWXhAnhqo0/Bk331j6a+glBc7D2Ssc
        m6mYXtVeiLsVdbNrSp9MsxnN0hsYYsGIqBat6QERbQ==
X-Google-Smtp-Source: APXvYqzbmu2DObIlWLfaO9ELFQorRtShpVBsWWzBcZIoobIaBkYXNLSVmLfU7WKSlp/DDnONAcCNR9yJlu88wu2FxpQ=
X-Received: by 2002:a2e:9e03:: with SMTP id e3mr1170522ljk.186.1578440764122;
 Tue, 07 Jan 2020 15:46:04 -0800 (PST)
MIME-Version: 1.0
References: <1576475925-20601-1-git-send-email-daidavid1@codeaurora.org>
In-Reply-To: <1576475925-20601-1-git-send-email-daidavid1@codeaurora.org>
From:   Evan Green <evgreen@google.com>
Date:   Tue, 7 Jan 2020 15:45:27 -0800
Message-ID: <CAE=gft6sxsZfvPZZXKqbEMjCH_hGKXp_1MS3qTAz6hmMPfn09A@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Split SDM845 interconnect nodes and consolidate
 RPMh support
To:     David Dai <daidavid1@codeaurora.org>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, sboyd@kernel.org,
        Lina Iyer <ilina@codeaurora.org>,
        Sean Sweeney <seansw@qti.qualcomm.com>,
        Alex Elder <elder@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Dec 15, 2019 at 9:59 PM David Dai <daidavid1@codeaurora.org> wrote:
>
> While there are no current consumers of the SDM845 interconnect device in
> devicetree, take this opportunity to redefine the interconnect device nodes
> as the previous definitions of using a single child node under the apps_rsc
> device did not accurately capture the description of the hardware.
> The Network-On-Chip (NoC) interconnect devices should be represented in a
> manner akin to QCS404 platforms[1] where there is a separation of NoC devices
> and its RPM/RPMh counterparts.
>
> The bcm-voter devices are representing the RPMh devices that the interconnect
> providers need to communicate with and there can be more than one instance of
> the Bus Clock Manager (BCM) which can live under different instances of Resource
> State Coordinators (RSC). There are display use cases where consumers may need
> to target a different bcm-voter (Some display specific RSC) than the default,
> and there needs to be a way to represent this connection in devicetree.

So for my own understanding, the problem here is that things want to
vote for interconnect bandwidth within a specific RSC context? Where
normally the RSC context is simply "Apps@EL1", we might also have
"Apps@EL3" for trustzone, or in the case we're coding for,
"display-specific RSC context". I guess this context might stay on
even if Apps@EL1 votes are entirely discounted or off? So then would
there be an additional interconnect provider for "display context RSC"
next to apps_bcm_voter? Would that expose all the same nodes as
apps_bcm_voter, or a different set of nodes?

Assuming it's exposing some of the same nodes as apps_bcm_voter, the
other way to do this would be increasing #interconnect-cells, and
putting the RSC context there. Did you choose not to go that way
because nearly all the clients would end up specifying the same thing
of "Apps@EL1"?
