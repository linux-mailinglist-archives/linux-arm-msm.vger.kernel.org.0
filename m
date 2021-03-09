Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7483328DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 15:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbhCIOod (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Mar 2021 09:44:33 -0500
Received: from mga09.intel.com ([134.134.136.24]:12847 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230035AbhCIOoZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Mar 2021 09:44:25 -0500
IronPort-SDR: c69J5CX+DkzLw9MjZE8t69ncLYSvbcrTyyRqVMnP1irVwZd/mlyl+4rN8o4QUa2ZuaIz8WVirh
 vjymGfYHQcYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9918"; a="188350784"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="188350784"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 06:44:24 -0800
IronPort-SDR: N00FXBDQ9afDM/JN8pm9XqrqOtHE5msPirwbQdR4+r16djEwDNZRd9UycDpjKTYd7W8DFp7uFz
 49Hw5FFfY0tw==
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="447519100"
Received: from tassilo.jf.intel.com ([10.54.74.11])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 06:44:24 -0800
Date:   Tue, 9 Mar 2021 06:44:23 -0800
From:   Andi Kleen <ak@linux.intel.com>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     acme@kernel.org, al.grant@arm.com,
        alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
        denik@chromium.org, dianders@chromium.org, jolsa@redhat.com,
        leo.yan@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, mathieu.poirier@linaro.org,
        mike.leach@linaro.org, mingo@redhat.com, mnissler@chromium.org,
        namhyung@kernel.org, peterz@infradead.org, suzuki.poulose@arm.com,
        swboyd@chromium.org
Subject: Re: [PATCHv2 0/4] perf/core: Add support to exclude kernel mode PMU
 tracing
Message-ID: <20210309144423.GD203350@tassilo.jf.intel.com>
References: <87tupqu10c.fsf@linux.intel.com>
 <20210309063828.26392-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309063828.26392-1-saiprakash.ranjan@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> The disk encryption is just one example and there might be others which
> we might not be aware of yet and we are not suspecting there is something
> wrong with the crypto code that needs to be fixed.

Then you don't have any leaks relating to branch tracing.

> restrict an external(in the sense that its not related to crypto or any
> other security related component) entity such as hardware assisted tracing
> like ARM coresight and so on. I don't see why or how the crypto code needs
> to be fixed for something that is not related to it although it is affected.

It's just a general property that if some code that is handling secrets
is data dependent it already leaks.


> The analogy would be like of the victims and a perpetrator. Lets take coresight
> as an example for perpetrator and crypto as the victim here. Now we can try

There's no victim with branch tracing, unless it is already leaky.

> If we just know one victim (lets say crypto code here), what happens to the
> others which we haven't identified yet? Do we just wait for someone to write
> an exploit based on this and then scramble to fix it?

For a useful security mitigation you need a threat model first I would say.

So you need to have at least some idea how an attack with branch
tracing would work.


> Initial change was to restrict this only to HW assisted instruction tracing [1]

I don't think it's needed for instruction tracing.

-Andi
