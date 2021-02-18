Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6229C31E7EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 10:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbhBRJWN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 04:22:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbhBRJDW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 04:03:22 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE451C06178A
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 01:01:24 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id e9so897843plh.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 01:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UuE8Kk0Ft8xXaK+dKRJAML723g16xNEkqk4oyYxtLIA=;
        b=mQuAECgdy4uodSx8f7K2ZlsplUjdFmhjtPIbLozp4qf4ucKR8ngWFaBZVPQdS8aBEP
         suArLHZFAVuqYS1ppAWlerQXKHyAivH4FTtT6f+cSnMHUMoYrSafzwEoekjIAy+7jI8Q
         Qb2wAW9JDosRlEeEHf7fSMZqlgkqRDGKBlU2SNEWC/t3l0W6LBwQMXNukqnJoebfijGH
         OAwP5NT/m1Ih2Djc0RjBOPf93SoyN2MEMvDG8PjniWXlY2sCNW7+G0Tjo3LLjN5WbVLa
         4JqI5EvThL0FR/tzvoMIuLCpWABXTdE1SkXMXU9a3qyqxm/xyVoawiAPiqJMveEw+9gM
         8mAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UuE8Kk0Ft8xXaK+dKRJAML723g16xNEkqk4oyYxtLIA=;
        b=UqqkCbA+MV0o4KWdhpI+HfZ0wHUkB6JT5FGznik2vf5ej50UbUPVPEgNp7BSARRTTd
         KSarUoL/bP1EhhzUF5paJbpKN/60kh3PViitC2UhHABdJUsO59dsk2r6EBmQfirBtKz6
         GqlwXT+LDNotXVom7iCQrPFK7lIZJgnABFqBTlfGNi+JAXQi1tepNcyfei13uoVwiqmn
         nJs9dRkPC4FKjDN/0IAAoRpYDqnJkKN6eLrykw1Jo7PbPSGv2pQ70UqhEufls68VCuP3
         60DV56bHiRuuzxl1XQ6Qkx1Rykyq7F0+sFXRNkKVw5sZ8thmKjvF/kjDkhjeimkxny3T
         K5xQ==
X-Gm-Message-State: AOAM531oBpDRhe6fPSDa9+NxBNpObq9UCIviauqFV/SYGtRdILA4V2vZ
        hDF1nbJmCTHlON27giUFozJdhzprpl2qwQ==
X-Google-Smtp-Source: ABdhPJwHO3FeZFDJ7+2o++0fDXBVADcUGcOh8GKfRFkOO0zU9aLphc+cBvvCC6BltWWVlxsCAU5Jow==
X-Received: by 2002:a17:90a:eb08:: with SMTP id j8mr3045392pjz.82.1613638883490;
        Thu, 18 Feb 2021 01:01:23 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id u129sm5227112pfu.219.2021.02.18.01.01.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Feb 2021 01:01:22 -0800 (PST)
Date:   Thu, 18 Feb 2021 14:31:20 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Ionela Voinescu <ionela.voinescu@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Steev Klimaszewski <steev@kali.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: qcom-hw: drop devm_xxx() calls from
 init/exit hooks
Message-ID: <20210218090120.lncn5fomygn5zddo@vireshk-i7>
References: <20210119023925.22724-1-shawn.guo@linaro.org>
 <20210218031938.GA7127@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210218031938.GA7127@dragon>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-02-21, 11:19, Shawn Guo wrote:
> What happened on this patch?  I thought we would have it in 5.11
> release, but ...

Just 2 days back I was about find the relevant thread and reply you
guys on the status of the patch that should fix the issue reported
earlier and it wasn't sent until now :(

Not sure how, but I missed this patch and yes it was in my inbox. This
doesn't normally happen as I tag such patches differently.

Any way, I will queue it now. Sorry about the delay.

-- 
viresh
