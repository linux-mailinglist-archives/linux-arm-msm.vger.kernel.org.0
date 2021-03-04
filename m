Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6801632DB11
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 21:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237084AbhCDUTd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 15:19:33 -0500
Received: from mga09.intel.com ([134.134.136.24]:51897 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235677AbhCDUTQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 15:19:16 -0500
IronPort-SDR: QFWDWj4J7UHn3UWbZZ2v8Jm4G9bdNMInGK2YnlA7GoSMBv1+y1s9yXuHont+q3QRoqp8YM5xhQ
 Kjmtq+Fw0dOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187608061"
X-IronPort-AV: E=Sophos;i="5.81,223,1610438400"; 
   d="scan'208";a="187608061"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 12:17:39 -0800
IronPort-SDR: mMh51xlzxR7B1k/L0dJG0k44Oel3shCrKFHrGY8UO6UceiV+ywkSrPQyl8Ect80vnNBXqrcq5A
 t6Su39TXPgcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,223,1610438400"; 
   d="scan'208";a="518785122"
Received: from tassilo.jf.intel.com (HELO tassilo.localdomain) ([10.54.74.11])
  by orsmga004.jf.intel.com with ESMTP; 04 Mar 2021 12:17:39 -0800
Received: by tassilo.localdomain (Postfix, from userid 1000)
        id B20EF302859; Thu,  4 Mar 2021 12:17:39 -0800 (PST)
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
        <871rcuvgfq.fsf@linux.intel.com>
Date:   Thu, 04 Mar 2021 12:17:39 -0800
In-Reply-To: <871rcuvgfq.fsf@linux.intel.com> (Andi Kleen's message of "Thu,
        04 Mar 2021 11:59:05 -0800")
Message-ID: <87tupqu10c.fsf@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Andi Kleen <ak@linux.intel.com> writes:
>
> Normally disk encryption is in specialized work queues. It's total
> overkill to restrict all of the kernel if you just want to restrict
> those work queues.
>
> I would suggest some more analysis where secrets are actually stored
> and handled first.

Also thinking about this more:

You really only want to limit data tracing here.

If tracing branches could reveal secrets the crypto code would be
already insecure due to timing side channels. If that's the
case it would already require fixing the crypto code.

-Andi
