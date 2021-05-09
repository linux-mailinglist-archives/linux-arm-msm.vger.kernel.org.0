Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A00A3774E9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 May 2021 04:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbhEICPz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 May 2021 22:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbhEICPy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 May 2021 22:15:54 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1AD8C061573
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 May 2021 19:14:51 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id b3so7462201plg.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 May 2021 19:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Yo0KQvoiXvT8aOrdD5NF+kaz4eBGOnmZ/KNVCKPE7tc=;
        b=mjxYMvW/+v9g3q+EnJujlRtxIAAnpJeF4PjKGr3m6DlcGUcwMQGyp5ei450aJx9Vn2
         /TaosHSBCaZRQXeDmHfRT+veBFw3kjY5BIVtmoxF05rBCrW7GMw8JRc+WgSrpywhT8E9
         U3dtSExDi9fvhapwA7AZd8DMYUiD3t6SMqfGXEGTJicqRRen/xfUV7ApgUtWmRKG3MS4
         oxwJ9yLiS/9jdduY/OeUTJamGhhBAt+wsQBu31r+pdnWrX0ynx8OEA7byPUEF0ydenZE
         SFBM1wtiVXu02COjEkzoGR0pT139+/FSWCFY2YcH2ashUuRY8KWVjX0oPe9yTeFpCOQK
         VoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yo0KQvoiXvT8aOrdD5NF+kaz4eBGOnmZ/KNVCKPE7tc=;
        b=fuM3AFAcoq5coJpvTlxS8VxVsEYGRaNRrgIsn9rwuxaUDddDvxds3WHC2youlBDNcs
         y3bINbgZuMP+27ifu4BQmLWmbdaqek1IhFeBgVBJaqeMmSCAEXGJqN4DdtJZH7WZayYL
         Eb+WXPEpIkj6Vbo2C2JOchLa9PwsUOPsUiOdsFtpcfPtZrXHgDsjV74QEvAPXTKQ6SyE
         9OwzyUJUYW9HP0jxEGTFyT2tNRkYvxt4A9dD7rjZU54cjz+d0FWGx1nkPDj0PXiL+T/w
         6ZwDCGAC3AhY/mjkWG8jYuQjUATvMGxjQ1uWKYHunWvU3XOk7o7qMj4hH0PSftqnRnkb
         DfPA==
X-Gm-Message-State: AOAM5312WVTvJw5/oywl//mOFEJLBFkS5G1L7qs7cPM3zh0Yomm9vQnm
        IcBSfHx3iGuePasloU7JeNOCN3Z+6Bp0Xg==
X-Google-Smtp-Source: ABdhPJy0ul308TSBzRKYuK9i3aBcixl6K5aFZ9TuP2H2bcxthK/ZEvIVgwwP7k0pJunw1xf0ampsZQ==
X-Received: by 2002:a17:90b:3615:: with SMTP id ml21mr31833701pjb.28.1620526491111;
        Sat, 08 May 2021 19:14:51 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id y13sm7952004pgs.93.2021.05.08.19.14.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 May 2021 19:14:50 -0700 (PDT)
Date:   Sun, 9 May 2021 10:14:44 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ACPI/IORT: Consolidate use of SMMU device platdata
Message-ID: <20210509021443.GC8679@dragon>
References: <20210402035602.9484-1-shawn.guo@linaro.org>
 <20210402035602.9484-2-shawn.guo@linaro.org>
 <bf51c5b3-082c-98dd-ff8d-559ef5b56bad@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf51c5b3-082c-98dd-ff8d-559ef5b56bad@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 27, 2021 at 06:37:24PM +0100, Robin Murphy wrote:
> On 2021-04-02 04:56, Shawn Guo wrote:
> > Currently the platdata is being used in different way by SMMU and PMCG
> > device.  The former uses it for acpi_iort_node pointer passing, while
> > the later uses it for model identifier.  As it's been seen that the
> > model identifier is useful for SMMU devices as well, let's consolidate
> > the platdata use to get it accommodate both acpi_iort_node pointer and
> > model identifier, so that all IORT devices (SMMU, SMMUv3 and PMCG) pass
> > platdata in a consistent manner.
> > 
> > With this change, model identifier is not specific to PMCG, so
> > IORT_SMMU_V3_PMCG_GENERIC gets renamed to IORT_SMMU_GENERIC.  While at
> > it, the spaces used in model defines are converted to tabs.
> 
> SMMUs and PMCGs are deliberately kept distinct because they are not
> necessarily equivalent - a PMCG may belong to something other than an SMMU,
> (like a root complex or a device with its own TLB), and even a single SMMU
> may implement heterogeneous PMCGs (e.g. Arm's MMU-600 has PMCGs in its
> control unit and TLB units which count different sets of events). So NAK to
> that aspect, sorry.
> 
> FWIW this was originally here because we envisaged needing to identify
> individual PMCG implementations through a variety of poking at different
> fields and tables, so hiding that behind an abstraction in ACPI code seemed
> neatest. However, things haven't really panned out that way - now we seem to
> have moved more towards describing events in userspace in conjunction with
> other system-specific identifiers. If we've no need to identify PMCGs in the
> kernel for the sake of exporting imp-def events, then most of the argument
> for this PMCG identifier abstraction is gone, and it's looking increasingly
> like the HIP08 case deserves to be punted back to the PMCG driver itself as
> a one-off erratum workaround.
> 
> I think at this point we should accept that if a driver needs to match
> *some* platform-specific data for its own internal purposes, the fact that
> that data might be the IORT header still doesn't make it "IORT
> functionality", and referencing ACPI_SIG_IORT from drivers is a lesser evil
> than cluttering up the IORT code with increasing amounts of random stuff
> that's outside the scope of the IORT specification itself.

Thanks much for the comments, Robin!  Indeed, it makes more sense to
sort the issue out in qcom driver than IORT code.  v3 is on the way.

Shawn
