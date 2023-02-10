Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47AAC692AF2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 00:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjBJXDO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 18:03:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjBJXDN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 18:03:13 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C0B4DBE8
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 15:03:12 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id o66so2247797ybc.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 15:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qZekMNkTFFpTMCpqgivsUFbIubuqug2kR1ofGLk4G1g=;
        b=Y/D45cI+CurTJE1dfs9zdSP830MfQ+qW4OXDd9NqQLSSL8NcXbp1WdDqTvWJikXwWR
         ZMlluzDaaZCkub0UGsu7DwM5wEYf9bL2dkG10Taqdlq+U8ss5oBzUUHKcCvJKNJAIQE5
         9L8+3E27tpuZCgw0vIYJGUyTqb+WOpeMRJcEgRWlsb/40N333Qe5a/c5U04hS7NdpIkY
         wJc4BJsoOKJQnl4FCzGg8KaV7yWI123uvBWbAsIzs699tW3j8kHnaz1Z+jBXV+kXZGbY
         vjN3LPEa1tdlO+qTIt/GmLapuQgloNDjHc3942zHGs5h6vjbmg+kJIl1xeL94YAdElDM
         eZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZekMNkTFFpTMCpqgivsUFbIubuqug2kR1ofGLk4G1g=;
        b=5RepH6hTNhage8X/o04wt3w/og8wtikKEz6iJ44zs/VmDjrNT9/8JNKcwPOs3cKY1L
         MN7kYGlu6IC5HQo7RD4Q4qiK+hjtSEeS+MoOpJ/kuifLhW4Orawh3vCYLmBRHu9899/s
         J1xxZbLw2gOcVZOU1RvJAacDOv32Pf0XXJkWijQmJ8Y0QJoo5WiQm9/j8J420qHbXdyy
         OrJpXvfGaD2a8Ml26katKFFajUEePJ83iJG2f8YnfCIrRE9zn1Wxzfd91RTwEeT5GmJb
         xA4m54sYNf7qVhx8LDw1UfhWJMvVjofcCc+Vr8DEIZeUBofKvMIegkhWIFEpPy9KAsqz
         zo0A==
X-Gm-Message-State: AO0yUKWgEvu+uO68+/e++Y/htjtRE/siIBJJ43VCvXzQhVpxFThYKTx6
        7Amb25IeVzy6ctXJRmkdJ7aHiy8XFq+Y7EBYunBRSw==
X-Google-Smtp-Source: AK7set9IQUHzQV9y9dl6uH80Cy02KpZyGSHXJ/bJtXVB1EL2imKDfAEyqBuFVJnQHIKXhllunXtD9NrVxql2iIP1PQw=
X-Received: by 2002:a5b:707:0:b0:8bc:56a2:49d8 with SMTP id
 g7-20020a5b0707000000b008bc56a249d8mr1070849ybq.428.1676070191832; Fri, 10
 Feb 2023 15:03:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1676067791.git.quic_sudaraja@quicinc.com>
In-Reply-To: <cover.1676067791.git.quic_sudaraja@quicinc.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Fri, 10 Feb 2023 15:03:00 -0800
Message-ID: <CAJuCfpHWQ8NV=iR3BN+pt1c8FynCnRqyyriHb1gLxFgiNVrwjA@mail.gmail.com>
Subject: Re: [PATCH] psi: reduce min window size to 50ms
To:     Sudarshan Rajagopalan <quic_sudaraja@quicinc.com>
Cc:     David Hildenbrand <david@redhat.com>,
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
        Patrick Daly <quic_pdaly@quicinc.com>
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

On Fri, Feb 10, 2023 at 2:31 PM Sudarshan Rajagopalan
<quic_sudaraja@quicinc.com> wrote:
>
> The PSI mechanism is useful tool to monitor pressure stall
> information in the system. Currently, the minimum window size
> is set to 500ms. May we know what is the rationale for this?

The limit was set to avoid regressions in performance and power
consumption if the window is set too small and the system ends up
polling too frequently. That said, the limit was chosen based on
results of specific experiments which might not represent all
usecases. If you want to change this limit, you would need to describe
why the new limit is inherently better than the current one (why not
higher, why not lower).
Thanks,
Suren.

>
> For lightweight systems such as Linux Embedded Systems, PSI
> can be used to monitor and track memory pressure building up
> in the system and respond quickly to such memory demands.
> Example, the Linux Embedded Systems could be a secondary VM
> system which requests for memory from Primary host. With 500ms
> window size, the sampling period is 50ms (one-tenth of windwo
> size). So the minimum amount of time the process needs to stall,
> so that a PSI event can be generated and actions can be done
> is 50ms. This reaction time can be much reduced by reducing the
> sampling time (by reducing window size), so that responses to
> such memory pressures in system can be serviced much quicker.
>
> Please let us know your thoughts on reducing window size to 50ms.
>
> Sudarshan Rajagopalan (1):
>   psi: reduce min window size to 50ms
>
>  kernel/sched/psi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --
> 2.7.4
>
