Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4C3A32DABF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 21:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233080AbhCDUBX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 15:01:23 -0500
Received: from mga18.intel.com ([134.134.136.126]:5002 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236436AbhCDUAw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 15:00:52 -0500
IronPort-SDR: FFtnBEmkJbgWTP6Qlm6SOH00t0xe4p/wgGnXgEJVqp9EQyHReVmULEtRwsGV3hWL21ZgPepURb
 k+k81HNUGklg==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="175125353"
X-IronPort-AV: E=Sophos;i="5.81,223,1610438400"; 
   d="scan'208";a="175125353"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 11:59:06 -0800
IronPort-SDR: D3DTZrbThlWBnXNSvA3kUTKRJ4GZ7ZoI1FThV+majRRy54gGnc32w/Zs/23DnxNdKFnV593bgw
 xq+5vG7zjhIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,223,1610438400"; 
   d="scan'208";a="428792917"
Received: from tassilo.jf.intel.com (HELO tassilo.localdomain) ([10.54.74.11])
  by fmsmga004.fm.intel.com with ESMTP; 04 Mar 2021 11:59:05 -0800
Received: by tassilo.localdomain (Postfix, from userid 1000)
        id 25CAD302859; Thu,  4 Mar 2021 11:59:05 -0800 (PST)
From:   Andi Kleen <ak@linux.intel.com>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Leo Yan <leo.yan@linaro.org>, Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>,
        Denis Nikitin <denik@chromium.org>,
        Mattias Nissler <mnissler@chromium.org>,
        Al Grant <al.grant@arm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCHv2 0/4] perf/core: Add support to exclude kernel mode PMU tracing
References: <cover.1614624041.git.saiprakash.ranjan@codeaurora.org>
Date:   Thu, 04 Mar 2021 11:59:05 -0800
In-Reply-To: <cover.1614624041.git.saiprakash.ranjan@codeaurora.org> (Sai
        Prakash Ranjan's message of "Tue, 2 Mar 2021 00:34:14 +0530")
Message-ID: <871rcuvgfq.fsf@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org> writes:
>
> "Consider a system where disk contents are encrypted and the encryption
> key is set up by the user when mounting the file system. From that point
> on the encryption key resides in the kernel. It seems reasonable to
> expect that the disk encryption key be protected from exfiltration even
> if the system later suffers a root compromise (or even against insiders
> that have root access), at least as long as the attacker doesn't
> manage to compromise the kernel."

Normally disk encryption is in specialized work queues. It's total
overkill to restrict all of the kernel if you just want to restrict
those work queues.

I would suggest some more analysis where secrets are actually stored
and handled first.

-Andi
