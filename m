Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE221A9246
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 07:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393238AbgDOFNI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 01:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393235AbgDOFNG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 01:13:06 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B03DC061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 22:13:05 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id np9so6282057pjb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 22:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wk1gKnV9MOmeaNOmUZ1VBgW92zzoZRIHZhM6e54Z8YY=;
        b=yBawUuabGnud63/Poff12xtpKasP/5I8yL3emeRbWZtRY3AM4QET7F9YllgXspKsxk
         fcwQ25vXNZuyb7Ar+SGyUb/FXakl2aa7RrKPjI4Guy5ogg29KbeVh65NZD3UKEPnKAaa
         PFROMt9T/4ArwOn0gJ6pqvNN/STQ80Zmb+HyEJKhwPmetpVd07f9XHpUXu74PbFbGbvp
         7gnG/QiEYrqzzBD9BQEDrRH1be3R2X2qKosleoEvSMGau36oZQSBSeG6f6wCzFp4vNva
         Z0d+2dFSbQJnjlTYG2NGkZTlQDCnYNAGZcvHKc0qcTBgqeHCOeVJYzUq+u2CqQdtlY1D
         c56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wk1gKnV9MOmeaNOmUZ1VBgW92zzoZRIHZhM6e54Z8YY=;
        b=ExJOgznQeAkLl5ag73y0zf+v4FTZl9OVRNiUerg2l8n1eeq4I4i/jjvB6uRcnftQS6
         pkrpq0hEko5uCDdZ1k0Cjt23+6gTJQ/FjFViFb13BiQZK2a81XmO1yoBh8YcAyBMzP2l
         LuX8ISA8Zzjrfue54WNZoLzylAt2hinjn/l6cu2WFn6gBAWCcahmMXWYV5ejWnBFUx6u
         oMHgZU8aYvP3xtm0b3rBfzxMStKjgEGHkqnPu6UmGA9s0F1rDup+GIO3WYG7zcX4Y88X
         HMam4ZEk9Auhou2KkSQE7I43eP9bHaTunnV7bI5T3AXQtvlfWqjtmpwfIJmKIbLkMBJd
         EyTg==
X-Gm-Message-State: AGi0Pubui3DZRzyY7D9fzkKP9zAAuS1SQ/u93DMQY5wOfV7rqmYBNXRK
        gz+DhzHxbgwGl7YRA/RYO2My2TpX68s=
X-Google-Smtp-Source: APiQypLZCWZaT5X6kAbkuh9roJAA1F1pyZLhruHQXsvmBhTmT9lVWi4Um5aIJ5CKpacErdblQszF8A==
X-Received: by 2002:a17:90a:f313:: with SMTP id ca19mr4095267pjb.7.1586927584560;
        Tue, 14 Apr 2020 22:13:04 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id x70sm12270635pfc.21.2020.04.14.22.13.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Apr 2020 22:13:03 -0700 (PDT)
Date:   Wed, 15 Apr 2020 10:43:01 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC] opp: Fixup release of clock when using set/put clkname
Message-ID: <20200415051301.rvrstjodjlj42jic@vireshk-i7>
References: <1586848508-1320-1-git-send-email-rnayak@codeaurora.org>
 <20200414071823.jdhkprtkizyeua23@vireshk-i7>
 <83c523d0-e18e-0401-5456-2dbba524ee98@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83c523d0-e18e-0401-5456-2dbba524ee98@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14-04-20, 20:35, Rajendra Nayak wrote:
> However, given I call these unconditionally in common drivers and on
> some (old) platforms we really don't have an OPP table (only scale clocks)
> things get a little tricky. So looks like the ref counting in such cases
> gets messed up, and we end up with dev_pm_opp_of_remove_table() calling
> _opp_table_kref_release() and releasing the clock, and then the subsequent
> call to dev_pm_opp_put_clkname() crashes.

We aren't supposed to call dev_pm_opp_of_remove_table() if
dev_pm_opp_of_add_table() isn't called or it failed. Either we can
handle this in core, which I would like to avoid, or just keep a
variable to track it in the driver, which will be easy enough I guess.

-- 
viresh
