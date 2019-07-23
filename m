Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC9D70EE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 03:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732140AbfGWB4l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 21:56:41 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34412 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732133AbfGWB4k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 21:56:40 -0400
Received: by mail-pl1-f194.google.com with SMTP id i2so19951595plt.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2019 18:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CzAyOVJiJ+crp0dyJDyW4Uoxcw0DAIBLgfBcpgWpRTE=;
        b=LoYY1RAS2JNfm6BNv0oVp61iAaOaXZRwIMWDs+xz1wuORHIMPs5XMsgo95ZYK10qMV
         Sk8m8TY1R2ZEqd17Nm1wVugMbXJkHIEEIPNvVfi+Mqxr/GdOGGVc2BqchZ5ie/vCOBX/
         UZ1tOlpvGrLeUX+dNfUg6B9F2yTh3l78AwMin1IYI/NG1jC60eEFYPs3Mi95oggZZcbX
         th9DY8cA3D4A8jbnTAdUPddIEaHBFJV5G+gW7dyTOw+rYf7ex45hyEbRBFGZaZKx6YCW
         VNDP2zsaJJkyLJBw9HRjoLnkoIrkthWLHEx27PGfLqZI8JsgoxOZZMfKTyjVEt2ItovN
         BmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CzAyOVJiJ+crp0dyJDyW4Uoxcw0DAIBLgfBcpgWpRTE=;
        b=TTp/WM7BowaY3E9EQlx8ccvbc70QBbYneSUVm4F0BZSaKpL4lHhOFB7L07rXNjW4r1
         T6LeSGFFu3kKyOdFWuuFRHXvw6tCRcU8gnoUqdBJM/pTy974gsTsWVFzmPxya/biIVlb
         32Li6S7WFjHFua0HDDoRIIVDxELGmC2HvdoViDoMMg0wffkAwH1apLxbQkWLmfbVtVRp
         s7fBrFE7ERAW8nZjpvF1+JsEpNL6Gh83W0mhCKRZsyXSPFJgyTATuqeIQmcCyAOamKC+
         c2qXCb+4NZpgmGkChw1FuvOrgjgkRYOYcm76Pn41IMagYOgFB+EahjbdfqjntjkH0lNu
         FaYw==
X-Gm-Message-State: APjAAAUQMVSVEuIIL+tCDYFW3onHBM9le6uLXYIvDqWrbIILpFlsNlZ6
        TWWFERBEv/kDadxVJfR0t2wiKw==
X-Google-Smtp-Source: APXvYqwr3DtyxnI94tRYYNP8pfrGZYXogprcPFn8oIrkLVKv0frSc1VdTB+BJi+vXTMqvBSZJHv/5w==
X-Received: by 2002:a17:902:24e:: with SMTP id 72mr36026735plc.65.1563846999629;
        Mon, 22 Jul 2019 18:56:39 -0700 (PDT)
Received: from localhost ([122.172.28.117])
        by smtp.gmail.com with ESMTPSA id o24sm77193811pfp.135.2019.07.22.18.56.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 18:56:38 -0700 (PDT)
Date:   Tue, 23 Jul 2019 07:26:35 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/13] arm64: dts: qcom: qcs404: Add CPR and populate OPP
 table
Message-ID: <20190723015635.rl5a2isjnjn23fzh@vireshk-i7>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
 <20190705095726.21433-12-niklas.cassel@linaro.org>
 <20190710090303.tb5ue3wq6r7ofyev@vireshk-i7>
 <20190715132405.GA5040@centauri>
 <20190716103436.az5rdk6f3yoa3apz@vireshk-i7>
 <20190716105318.GA26592@centauri>
 <20190717044923.ccmebeewbinlslkm@vireshk-i7>
 <20190719154558.GA32518@centauri>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190719154558.GA32518@centauri>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19-07-19, 17:45, Niklas Cassel wrote:
> Hello Viresh,
> 
> Could you please have a look at the last two patches here:
> https://git.linaro.org/people/niklas.cassel/kernel.git/log/?h=cpr-opp-hz

There is no sane way of providing review comments with a link to the
git tree :)

I still had a look and I see that you don't search for max frequency
but just any OPP that has required-opps set to the level u want. Also,
can't there be multiple phandles in required-opps in your case ?

> If you like my proposal then I could send out the first patch (the one to
> OPP core) as a real patch (with an improved commit message), and
> incorporate the second patch into my CPR patch series when I send out a V2.

Send them both in your series only, otherwise the first one is useless
anyway.

-- 
viresh
