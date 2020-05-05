Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D10F1C4D7D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 06:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbgEEE4o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 00:56:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725830AbgEEE4n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 00:56:43 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A69C061A41
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2020 21:56:43 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id h11so328339plr.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2020 21:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0bcNjjam7owzFyIwJPvOejbVBTQ69maDzUfbwggZ2dA=;
        b=aLHlS6xiNMHuJwgtS5c5FBNg7bB7qF2DSLw7iTqBVNXqJfmgox5k3SxD7cxrmKdk6v
         l+kjTGGSZZKpT+CpQLlZN1qjlVBOya7XkibQvKsue/5dKzBH9vCbAJT8qr9Ma53x/3yI
         QXIwV7ZAU1/UFqF4a6EW2NLopHZvqG1Rpm8orjkIk7tClG4Q8UbHmh8MOlLqqN0yzsYZ
         Au7XZXV+dC9LVCS2NqNAnPzZ6jxJ22bARxfuvAPIT+7hPeuPDiMyHHV8G3Vs+JhdS+DR
         cufyrx/Hws7YY7h93HkE1ORrPU2aw1a3ulvVLWrVW3NIhMU4oQfjzxIrNxURG6M226Uu
         ucbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0bcNjjam7owzFyIwJPvOejbVBTQ69maDzUfbwggZ2dA=;
        b=sGe6DJ33klzdfipXvdvdshWx3qhJ5p4URXOrh5eA2++AwrdqrrTjngR9vMymdE3XYj
         08pN1j9Yzv9C02hCOQJIBKDr+/F0uL6GX7zxXVFQhPoxSl3j6iMbGZm0BTpffAKXBn7+
         EBuLI3tMwuwA/P3mOWqfUTspubhrVPtKttbSXEsMCnwQdAAKqTC7kVB71buBuQkL2byD
         l7Y81S6cvrVcwIfThSnuLeNOZZ2rMJ4969gUY5Uj/Gg5OpM4sZCLaYObb+HGmwVRwR8R
         ZTEAdqZKhkZvlpAFKyNr/FPTI+QcSxCKWAlur/pJgws1WbW2iBcW7EyWjK7kNzN54QF7
         Dzig==
X-Gm-Message-State: AGi0PuYKiWiZ1NcffeiGWEfGe2JYZ7cHoNYVC67YCEUTV1KGZFi1FHUy
        Q3w5bveNFn9ckj9MQmDEDx3ZMQ==
X-Google-Smtp-Source: APiQypKz5PGkrZWTJbP3+f/TlvnG7+he8Ca87yIh/qmdt7h/HMYRPft82Ev9HjoCwI1XU0L+nqL4ug==
X-Received: by 2002:a17:90a:f197:: with SMTP id bv23mr677669pjb.3.1588654601713;
        Mon, 04 May 2020 21:56:41 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id h14sm721964pfq.46.2020.05.04.21.56.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2020 21:56:41 -0700 (PDT)
Date:   Tue, 5 May 2020 10:26:39 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     sboyd@kernel.org, georgi.djakov@linaro.org,
        bjorn.andersson@linaro.org, saravanak@google.com, mka@chromium.org,
        nm@ti.com, agross@kernel.org, david.brown@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, rjw@rjwysocki.net,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        dianders@chromium.org, vincent.guittot@linaro.org,
        amit.kucheria@linaro.org, ulf.hansson@linaro.org,
        lukasz.luba@arm.com, sudeep.holla@arm.com
Subject: Re: [PATCH v4 10/12] OPP: Add support for setting interconnect-tags
Message-ID: <20200505045639.i4nnplwaxlkful4o@vireshk-i7>
References: <20200504202243.5476-1-sibis@codeaurora.org>
 <20200504202243.5476-11-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504202243.5476-11-sibis@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-05-20, 01:52, Sibi Sankar wrote:
> Add support for setting tags on icc paths associated with
> the opp_table.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/opp/of.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)

Maybe this should be part of Georgi's series ?

-- 
viresh
