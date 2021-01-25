Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 220F03049DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 21:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732401AbhAZFXH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730517AbhAYP5u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 10:57:50 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A6BCC061786
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 07:57:05 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id h14so13170767otr.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 07:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n/XniG2zR+75T+NLnUBE6JUAAYyxthuIPOv2H2kqUrc=;
        b=WxXv94Wb+TNXWdWLopi0nIwYCwhuPwLBQfgU32g60eHuu0sFUButivz4VjvVrlxBfD
         MjG4XwV4rn6G6e0unFtAhqn5nP09dLJKg0awvVXfaBmsRQQDF2P+BJKHa3FqOezfzfim
         yM8z/PTJx449V0vZLnzWr0MEYGm1OtAuDtc+DB4Sxis+hbWDziEDcFJnXQPcMzZsiqrx
         Q9D2p3YaQtuwmXD2rkZ3JtwkmpYQwKTyMac71/s45zw1SRE5wVjoKDBj8tpXVgJ7WB9/
         wUDDDXWJpDdQGFty4wtB72XT0j2iFFcErf4j80GEEixVhnV2LujfGgK5y9FbRO0inIPo
         7blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n/XniG2zR+75T+NLnUBE6JUAAYyxthuIPOv2H2kqUrc=;
        b=W3jDnR4qZh3+fCAZLlxncLCkZCRSpXzJiHuHc27mZQxDxlncMu0T3rHXJ+j2eZXwnD
         C6lPxU5zRg+VHVGmkjkmlkftwEQv9RYdgITv26RUB5KAzli9PJAiY/HTHTsygf+a1Fuc
         NSsa3NEpV2W8RA95hbAxvhgSIBzm2zCavNoESuY/FQm5hAVkxPaVFP8JEEMdcwf7TDbN
         HJbfWk26Nv+D7k91VO5etS2bbigozR2WuCAsrjKCrHpHRa+fjkYylG4itA07mP3gbqu6
         de5OzjY/3kBIkhGxE4UxXbgULg7B8kGBkbuybH5Q/6irukplC4UR6iAsfsf1ooZKR5tP
         E03A==
X-Gm-Message-State: AOAM530mqog5s7jxTd7kpF+woZIeyGb0FlhlXhOHrBF7bZCxwk51Qzf8
        Nf8EXLzjOt4uTCrsMwL69Clu5Q==
X-Google-Smtp-Source: ABdhPJyKxrZ7hFIdO7OkCpO4uKGPA2lAMTqZ5O/2LnkhfSB2e/2PN5sfh2EcWBPNIHnqzmfZ4HbTQw==
X-Received: by 2002:a9d:4606:: with SMTP id y6mr829043ote.347.1611590224657;
        Mon, 25 Jan 2021 07:57:04 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c18sm2088204oov.20.2021.01.25.07.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 07:57:03 -0800 (PST)
Date:   Mon, 25 Jan 2021 09:57:01 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Luca Weiss <luca@z3ntu.xyz>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: Re: [PATCH 3/4] ARM: dts: qcom: msm8974-klte: add support for display
Message-ID: <YA7qTcIvwxO51Etz@builder.lan>
References: <20210124135610.1779295-1-iskren.chernev@gmail.com>
 <20210124135610.1779295-3-iskren.chernev@gmail.com>
 <282b07a1-2e39-2dbe-dd7b-eed2ae9e25fb@somainline.org>
 <6632821.dtBD41K2ms@g550jk>
 <f02b945f-5546-6e15-17b5-74be8af8a501@somainline.org>
 <YA7maSZdp1EphINK@builder.lan>
 <c8ac5b2b-8d1c-d652-de0d-07f38c77cd50@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8ac5b2b-8d1c-d652-de0d-07f38c77cd50@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 25 Jan 09:47 CST 2021, Konrad Dybcio wrote:

> 
> > I know how bad it is, so I understand your desire to not have to rebase
> > that, but I will merge things as they become ready on the list.
> >
> > So please post your change (perhaps it's posted and I'm failing to find
> > it in my inbox?) and I'd be happy to merge it so we get it cleaned up!
> >
> > Thanks,
> > Bjorn
> 
> 
> Here it is: [1]
> 
> 
> Be aware that it truly is humongous and should be split (I couldn't
> resist adding missing pins/dma while cleaning things up) and it.. was
> not really intended to be sent as-is. It's also supposed to work on
> the previous release of Linux, so some Samsung DTs in particular
> changed since and will need some manual rebasing. But I'll happily
> leave it as a reference if somebody has the time to pick it up. The
> konrad/8974 branch in this repo contains more (beware, GPU ones are
> untested!) 8974 fixes and I have some more on my drive that are.. not
> really ready for their prime time just yet either..
> 

I like the end result, so please spend some time trying to get this
upstream (which would save you from having to rebase that going forward
:))

As you say I don't think it's appropriate to post or merge it as is, but
you should be able to send patches related to the 7 steps described in
the commit message - and don't be afraid of splitting it in more than
those patches. And we don't need to merge them all at once either...

Regards,
Bjorn
