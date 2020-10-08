Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F351728709D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Oct 2020 10:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbgJHIYR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Oct 2020 04:24:17 -0400
Received: from mga18.intel.com ([134.134.136.126]:54461 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728549AbgJHIYR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Oct 2020 04:24:17 -0400
IronPort-SDR: tkGKDUA4V76c5duqIPxpNAXBmvp9VHngDwmGnYftbrXKIDpUx9BJPPz/vFJdcW70Ug6G0tLOzB
 w98/XwrZm64Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="153133237"
X-IronPort-AV: E=Sophos;i="5.77,350,1596524400"; 
   d="scan'208";a="153133237"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2020 01:24:15 -0700
IronPort-SDR: G8xnXCtgmC4/g92wR5jrFHt00I7i4yvQ0gk9IdWr6pN7aCGoCsMdT9y8QfQn1lTPmYjg8MYjLA
 m+dm9gB/9iAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,350,1596524400"; 
   d="scan'208";a="297875033"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by fmsmga007.fm.intel.com with SMTP; 08 Oct 2020 01:24:12 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 08 Oct 2020 11:24:11 +0300
Date:   Thu, 8 Oct 2020 11:24:11 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Tim Murray <timmurray@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Tejun Heo <tj@kernel.org>, Qais Yousef <qais.yousef@arm.com>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
Message-ID: <20201008082411.GE6112@intel.com>
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <CAKMK7uHHPWE3h7ssG-dpb3czwbP5VtZYztMA=CpvQ4HV4LQTXA@mail.gmail.com>
 <CAF6AEGszF60dWn37m63wujjtuObqkz2ZqEN3LHaPhCkKa1cdmA@mail.gmail.com>
 <CAKMK7uEd853irzdBMCcaNEMAeOZKVFcFpgNtcYrgQkmHxdT3-w@mail.gmail.com>
 <20201002105256.GA6112@intel.com>
 <20201002110544.GB6112@intel.com>
 <CAF6AEGv+UnZJoBj_ELRVr4sQeMs52vAgyw2g+wtabLPBrYDKvw@mail.gmail.com>
 <20201005121524.GI6112@intel.com>
 <CAF6AEGtgTb-1YQpL4CV2A=CQxkSxjn-FxDybrzSitTDSmCY_GA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGtgTb-1YQpL4CV2A=CQxkSxjn-FxDybrzSitTDSmCY_GA@mail.gmail.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 07, 2020 at 09:44:09AM -0700, Rob Clark wrote:
> On Mon, Oct 5, 2020 at 5:15 AM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Fri, Oct 02, 2020 at 10:55:52AM -0700, Rob Clark wrote:
> > > On Fri, Oct 2, 2020 at 4:05 AM Ville Syrjälä
> > > <ville.syrjala@linux.intel.com> wrote:
> > > >
> > > > On Fri, Oct 02, 2020 at 01:52:56PM +0300, Ville Syrjälä wrote:
> > > > > On Thu, Oct 01, 2020 at 05:25:55PM +0200, Daniel Vetter wrote:
> > > > > > On Thu, Oct 1, 2020 at 5:15 PM Rob Clark <robdclark@gmail.com> wrote:
> > > > > > >
> > > > > > > I'm leaning towards converting the other drivers over to use the
> > > > > > > per-crtc kwork, and then dropping the 'commit_work` from atomic state.
> > > > > > > I can add a patch to that, but figured I could postpone that churn
> > > > > > > until there is some by-in on this whole idea.
> > > > > >
> > > > > > i915 has its own commit code, it's not even using the current commit
> > > > > > helpers (nor the commit_work). Not sure how much other fun there is.
> > > > >
> > > > > I don't think we want per-crtc threads for this in i915. Seems
> > > > > to me easier to guarantee atomicity across multiple crtcs if
> > > > > we just commit them from the same thread.
> > > >
> > > > Oh, and we may have to commit things in a very specific order
> > > > to guarantee the hw doesn't fall over, so yeah definitely per-crtc
> > > > thread is a no go.
> > >
> > > If I'm understanding the i915 code, this is only the case for modeset
> > > commits?  I suppose we could achieve the same result by just deciding
> > > to pick the kthread of the first CRTC for modeset commits.  I'm not
> > > really so much concerned about parallelism for modeset.
> >
> > I'm not entirely happy about the random differences between modesets
> > and other commits. Ideally we wouldn't need any.
> >
> > Anyways, even if we ignore modesets we still have the issue with
> > atomicity guarantees across multiple crtcs. So I think we still
> > don't want per-crtc threads, rather it should be thread for each
> > commit.
> 
> I don't really see any other way to solve the priority inversion other
> than per-CRTC kthreads.

What's the problem with just something like a dedicated commit
thread pool?

> I've been thinking about it a bit more, and
> my conclusion is:
> 
> (1) There isn't really any use for the N+1'th commit to start running
> before the kthread_work for the N'th commit completes, so I don't mind
> losing the unbound aspect of the workqueue approach
> (2) For cases where there does need to be serialization between
> commits on different CRTCs, since there is a per-CRTC kthread, you
> could achieve this with locking
> 
> Since i915 isn't using the atomic helpers here, I suppose it is an
> option for i915 to just continue doing what it is doing.
> 
> And I could ofc just stop using the atomic commit helper and do the
> kthreads thing in msm. But my first preference would be that the
> commit helper does generally the right thing.
> 
> BR,
> -R

-- 
Ville Syrjälä
Intel
