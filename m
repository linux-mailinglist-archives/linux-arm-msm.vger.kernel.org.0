Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA8DE66E879
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 22:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjAQVcR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 16:32:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjAQVas (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 16:30:48 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED5F2332F
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 11:56:22 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id 66so269950yba.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 11:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yX6+3HvGi/JBBED3BjbKlXKbkX2c1+XYkVkvZbiTdCU=;
        b=wujQrJi0Tdd+VhGfQqZVZqhwx+Ul+ejY7IxFv3l9huv8Es/bU1LVJey2dIVE+fQhKL
         dpxucrVRKEYY/CtFJFrqfjAgO2Z2pAT03z7Oj3GfuM1deOAdUyO937O+csOrem/dSHPP
         81YVjR+14tCr1pOjSYavYY5yMkxWO0dxCL6tVY3Og2dABY91X5QdUSUmpDi816rxsXMH
         M3ZDmVljGyjziRsU4cKM0dXynYOSC8YBPoZy6auWnGzf46FTqUk7Nkr7IMM0BF1RYwEe
         RCNdrxe/N1Nt/GqDuuIHFfnn2b42VPZSshgErZ905lUbwcPGWcRNEGWUcE8lmaGU+0mS
         YK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yX6+3HvGi/JBBED3BjbKlXKbkX2c1+XYkVkvZbiTdCU=;
        b=WFsljOjUYaOXeh75GU1gYyR41aApF7iMrWSXt3SjuSa8aT0+PJzBdhMSGqTJO3efbT
         OUhkKvLmiogZnKewDahsvmT/SA2ZjX8C1xDAAwYQ2mlPHJxVqjnvCKHVz4amf3gAFUxL
         FOym8k4EtJOjZjHiRinaprgTtdQacLQhm7CMyhR/DdDqpooMDZ2BrzI/gNhSR45DgGhF
         DWSYzsBZTGl+Qt47Mf9+Tdkd+jDpN5VoMoZl1/gV2A/OGg3mORfddRTXrXWHk79xZM4g
         3h0fTulbq2kZM4Ft0rVoJXejNVns8TJF86F3pMau09NAwy/UnSE6tw4rR5OK5MlSiSOb
         9Sgg==
X-Gm-Message-State: AFqh2koWnaeKjrjY5jyPeps3ZKCJc4bW5aszgWr8Pm41IqrvQyYf33yY
        vmm4CahWMLW5tqrMtWZHoHeE1QF9+pEHYe70Q/UwLw==
X-Google-Smtp-Source: AMrXdXvw2NwEdkD84Kl+3D0H20OO2m6B58bilFAkTCSITgzXtflWJDmamOP5hHStt88AvYwjFedz6X6mkWriMDj0FDs=
X-Received: by 2002:a25:ca81:0:b0:7d2:891e:ee59 with SMTP id
 a123-20020a25ca81000000b007d2891eee59mr594922ybg.152.1673985381327; Tue, 17
 Jan 2023 11:56:21 -0800 (PST)
MIME-Version: 1.0
References: <20230103145339.40501-1-andriy.shevchenko@linux.intel.com> <Y8bG5N6uf5XLoiuH@smile.fi.intel.com>
In-Reply-To: <Y8bG5N6uf5XLoiuH@smile.fi.intel.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 17 Jan 2023 21:56:10 +0200
Message-ID: <CAA8EJprAbNDTKW5L5dV9aQQrh1x7wUqNWOogWK9rvPUp5N2ihg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] thermal: qcom-spmi-adc-tm5: Use asm intead of asm-generic
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Daniel Lezcano <daniel.lezcano@linexp.org>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 17 Jan 2023 at 18:04, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jan 03, 2023 at 04:53:39PM +0200, Andy Shevchenko wrote:
> > There is no point to specify asm-generic for the unaligned.h.
> > Drop the 'generic' suffix.
>
> Any comments?

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
