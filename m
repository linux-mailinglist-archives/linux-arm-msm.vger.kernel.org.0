Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC4306A4B8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Feb 2023 20:51:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjB0TvK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Feb 2023 14:51:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbjB0TvJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Feb 2023 14:51:09 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 761B0252A1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 11:51:00 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5384ff97993so208304897b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 11:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O4AQL8i6WYgk4Tqy8aH2abmGlvkaKXw9l82KiDgJYLU=;
        b=lg7t5OPUZDTBohQJEfbPvGoFG001ogATUdvB53bk5UiQW5WldEO+PEfhF+/xN/fNcM
         nsszBA9qC1GRh3MwWD9mu8DfDE5fppR308TULY8dMifynxJIjZjTxhxwddyUwvu3Cg1I
         Yqj7rT2Bsp1mBkrPh4iRpgtFj0RpLXhJh6Wv6MekpZbu9rg6Rt3CqKmvqIhNElD3BNtr
         bTtBxhnia1OtvgsDNTK388pd03hpCTpabafKEesGduip0rWlVoYR7twwJhExF7lmxwBg
         EJqWsbar50UJyoH8zUyhu1rb+tFr0gLAT/fIoYsgXw00B6+cVQODi+SZmUgcURM9MKkp
         Nt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4AQL8i6WYgk4Tqy8aH2abmGlvkaKXw9l82KiDgJYLU=;
        b=BfWb9CwAbxFyDK8WXLFFW1dLEyY7l4G6fewBdRmYpiFFs4f5ojvdeCG+JZaiuVoZOH
         zeskG3CwSQehffkwqMZ36kH3j7jPCoLYRKG8s57RjBTARhbNRlNrW8zXUQq4pPq3RjRS
         JzhZ8uBf+jllGvWIiLTBrilpZyLb0npvtz81La7C+Uq8tPS+ncPKYnbR94kenyoiEC2G
         TbEwRqRWSOQlfGzO3P2U6BebP67jrhLujWE69df4Do0pqDQKI+Jkivspr4bKSQmntXHv
         Vb9d/bb3b13DJYTj83tHwBshJLiE7WlesUN3WKXUNW6VcWXnIJfMzfPgvGT9axjiJhDt
         Kp3g==
X-Gm-Message-State: AO0yUKWGYscMRN013LpmaE6ll9UVET0GxXsFac8BPeiQ4+rcwedP4Bu8
        iNZBqF0VaQdxRH0k0gCfA+AomV968Ca3dNIbV9j8uA==
X-Google-Smtp-Source: AK7set86i0/5lPLZ/2QOBjjHU2zsxBCTss6LStl3XbSWduyOuC2/0fFBkksQVxbDcf1toTUT5YGwc8/o+Vl+fLjejaU=
X-Received: by 2002:a81:b621:0:b0:52e:b7cf:4cd1 with SMTP id
 u33-20020a81b621000000b0052eb7cf4cd1mr11013161ywh.5.1677527459329; Mon, 27
 Feb 2023 11:50:59 -0800 (PST)
MIME-Version: 1.0
References: <e944536f-a04c-5528-601e-d7f505a761e8@quicinc.com>
 <CAJuCfpGLkkS2yx0d9+2nYtEtxANSH5H3EgCmWZax4N-ieEBG7g@mail.gmail.com>
 <15cd8816-b474-0535-d854-41982d3bbe5c@quicinc.com> <CAJuCfpHihLgHCcsAqMJ_o2u7Ux9B5HFGsV2y_L2_5GXYAGYLnw@mail.gmail.com>
 <82406da2-799e-f0b4-bce0-7d47486030d4@quicinc.com> <CAJuCfpHrhO7_fMwNuu2hdQob=MPjZTW8eaJpNhEhPmDMqz2qTA@mail.gmail.com>
 <Y/ix53x8i/ViuBXf@dhcp22.suse.cz> <CAJuCfpG1c5v6qOotPV6t-o1T1p7EbOLs90eFnoEBjts+gafovA@mail.gmail.com>
 <Y/yxSqhpQh9yR7L4@dhcp22.suse.cz> <CAJuCfpHXwbtjdhH_K9r28-LUYtzC6+NaZ+RrKCtiNBk8PfXhLw@mail.gmail.com>
 <Y/0ASztGOwfM6bNK@dhcp22.suse.cz>
In-Reply-To: <Y/0ASztGOwfM6bNK@dhcp22.suse.cz>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Mon, 27 Feb 2023 11:50:48 -0800
Message-ID: <CAJuCfpHYMR6O_uJvaeq1f+ZvgW9oN6zTRG=UvTXyLJLSFOV3jw@mail.gmail.com>
Subject: Re: [PATCH] psi: reduce min window size to 50ms
To:     Michal Hocko <mhocko@suse.com>
Cc:     Sudarshan Rajagopalan <quic_sudaraja@quicinc.com>,
        David Hildenbrand <david@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Mike Rapoport <rppt@kernel.org>,
        Oscar Salvador <osalvador@suse.de>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        mark.rutland@arm.com, will@kernel.org,
        virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Sukadev Bhattiprolu <quic_sukadev@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Patrick Daly <quic_pdaly@quicinc.com>, johunt@akamai.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 27, 2023 at 11:11 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Mon 27-02-23 09:49:59, Suren Baghdasaryan wrote:
> > On Mon, Feb 27, 2023 at 5:34 AM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Fri 24-02-23 13:07:57, Suren Baghdasaryan wrote:
> > > > On Fri, Feb 24, 2023 at 4:47 AM Michal Hocko <mhocko@suse.com> wrote:
> [...]
> > > > > Btw. it seems that there is is only a limit on a single trigger per fd
> > > > > but no limits per user so it doesn't sound too hard to end up with too
> > > > > much polling even with a larger timeouts. To me it seems like we need to
> > > > > contain the polling thread to be bound by the cpu controller.
> > > >
> > > > Hmm. We have one "psimon" thread per cgroup (+1 system-level one) and
> > > > poll_min_period for each thread is chosen as the min() of polling
> > > > periods between triggers created in that group. So, a bad trigger that
> > > > causes overly aggressive polling and polling thread being throttled,
> > > > might affect other triggers in that cgroup.
> > >
> > > Yes, and why that would be a problem?
> >
> > If unprivileged processes are allowed to add new triggers then a
> > malicious process can add a bad trigger and affect other legit
> > processes. That sounds like a problem to me.
>
> Hmm, I am not sure we are on the same page. My argument was that the
> monitoring kernel thread should be bound by the same cpu controller so
> even if it was excessive it would be bound to the cgroup constrains.

Right. But if cgroup constraints are violated then the psimon thread's
activity will be impacted by throttling. In such cases won't that
affect other "good" triggers served by that thread even if they are
using higher polling periods?

>
> --
> Michal Hocko
> SUSE Labs
