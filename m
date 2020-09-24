Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE90427765D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Sep 2020 18:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgIXQPE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Sep 2020 12:15:04 -0400
Received: from foss.arm.com ([217.140.110.172]:50194 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726596AbgIXQPE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Sep 2020 12:15:04 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B04161396;
        Thu, 24 Sep 2020 09:15:03 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com [10.1.195.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93BBA3F718;
        Thu, 24 Sep 2020 09:15:02 -0700 (PDT)
Date:   Thu, 24 Sep 2020 17:15:00 +0100
From:   Qais Yousef <qais.yousef@arm.com>
To:     Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Tim Murray <timmurray@google.com>, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 0/3] drm: commit_work scheduling
Message-ID: <20200924161356.5kezxwiqwtbi3o2p@e107158-lin.cambridge.arm.com>
References: <20200919193727.2093945-1-robdclark@gmail.com>
 <20200921092154.GJ438822@phenom.ffwll.local>
 <CAF6AEGuDRk9D_aqyb6R8N5VHx2rvbZDf4uTqF3gQTrmzno+qtw@mail.gmail.com>
 <CAKMK7uEqDD-oDAQKyA9DQbxkCgEjC5yyjvKR7d8T0Gj0SqEZ4A@mail.gmail.com>
 <CAF6AEGtYAn+W8HxP7SXtxPr5FsEB1hYGU91WrHCtwX89UmUR5w@mail.gmail.com>
 <20200923152545.GQ438822@phenom.ffwll.local>
 <CAF6AEGs9xDOoG3n4E_+6iDaiJXp_hqvSV1VKE=vpvG-twYPoew@mail.gmail.com>
 <20200924084950.GY438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200924084950.GY438822@phenom.ffwll.local>
User-Agent: NeoMutt/20171215
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/24/20 10:49, Daniel Vetter wrote:

[...]

> > > I also thought kernel threads can be distinguished from others, so
> > > userspace shouldn't be able to sneak in and get elevated by accident.
> > 
> > I guess maybe you could look at the parent?  I still would like to
> > think that we could come up with something a bit less shaking than
> > matching thread names by regexp..
> 
> ps marks up kernel threads with [], so there is a way. But I haven't
> looked at what it is exactly that tells kernel threads apart from others.
> 
> But aside from that sounds like "match right kernel thread with regex and
> set its scheduler class" is how this is currently done, if I'm
> understanding what Tejun and Peter said correctly.
> 
> Not pretty, but also *shrug* ...

Isn't there a real danger that a sneaky application names its threads to match
this regex and get a free promotion to RT without having the capability to do
so?

Cheers

--
Qais Yousef
