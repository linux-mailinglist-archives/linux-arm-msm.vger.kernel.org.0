Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A48751E246
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 May 2022 01:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236547AbiEFX2C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 19:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444967AbiEFX2B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 19:28:01 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8149D712CF
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 16:24:16 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id s11-20020a4ab54b000000b0035f0178dfcfso1498264ooo.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 May 2022 16:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=/ElELV4+QaCmbQivuCO+s3nmw20xVvpsLHj2VQCOczQ=;
        b=Q/mL5LmBEmb9tU2w0cn5NhXVWbyWIiPZkShqLXDDa+rVYo+1WH5J6y4cbFsJ/GHnIC
         cRQnPAAT2Uuv1KT9qQMyQhEBwSwfFhY1cgAJT+RawLfPkt8k09bvKbPuhGRMAXoU9bmo
         oaM+z+Z1SZgTAZFMlrKYNiQUFUqDmFkNmJnYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=/ElELV4+QaCmbQivuCO+s3nmw20xVvpsLHj2VQCOczQ=;
        b=bKTQ7YJocoPizn90NGKPdbXXnA+QYXRo+nINXTfzLE1KyHd0O0vm0Kx8IxLYDWGtBH
         egT4lF5ENIwToUIhZBHLnFV51FdMPyervLj3Ii7yUOksp8Il5M65jOxHzwC6d0NUI1Ve
         Y2NBv+ZSRT6KJV2LEPTPBpF9CddhgteHpVnuKckIC5E6uuzrO+HoiWR/AvPcyt0qNi8R
         YAXsXWnor0fE/o3KECrRO3NJXCI4yf+YwD7BNAbpD4Rpt75xWCb+7yeMTHD/OvYeQ/K3
         4Uz/1YMls/WobqTYaSSTY2Qhz6xqgbDB+bJTn55p74VYVHRUenwDXUrNpTbiTicv7+dA
         s2sQ==
X-Gm-Message-State: AOAM532ZnUqeyTXaIWCeVXnKUS8FlFBkT7uq/f33/NqeD+v4faTBYyMy
        8TsJO5w7/+luDp1riM5gOX7EY2biHgjLo4jE495qZA==
X-Google-Smtp-Source: ABdhPJyUJ6tVOobOozeBnxyxa8RgSY9d+Hm2+Rmx0y+yjUzUjdvUB/hoshBRw+G0Dpmcp5sPU11pJETcqoz8VXu5aq0=
X-Received: by 2002:a4a:6b49:0:b0:329:99cd:4fb8 with SMTP id
 h9-20020a4a6b49000000b0032999cd4fb8mr1917932oof.25.1651879455825; Fri, 06 May
 2022 16:24:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 May 2022 19:24:15 -0400
MIME-Version: 1.0
In-Reply-To: <YnKvoh+h07at8b65@builder.lan>
References: <20220412194505.614002-1-swboyd@chromium.org> <YnKvoh+h07at8b65@builder.lan>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 6 May 2022 19:24:15 -0400
Message-ID: <CAE-0n517iAS9KSdunMX18LpqDrQ4ac-yRCZq82j-XdExaGjCXA@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: rpmh: Set wake/sleep state for BCM clks
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        patches@lists.linux.dev, Alex Elder <elder@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2022-05-04 09:53:54)
> On Tue 12 Apr 14:45 CDT 2022, Stephen Boyd wrote:
>
> > Set the wake and sleep state for BCM clks here, not just the active
> > state, as the active only state is dropped when CPUs go to deep idle.
> > This ensures the clk is always on when the driver thinks it is on.
> >
> > This was found by inspection, and could very well be incorrect if the
> > RPMh hardware copies over the active only state to the sleep and wake
> > states.
> >
>
> Taking another look at this patch and now it makes perfect sense to me.
> Sorry for not grasping the problem earlier.
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
>
> Will you take this in fixes, or do you want me to pick it for 5.19?
>

I'm waiting for Taniya to reply. For all I know this has no effect
because there's some sort of copy/paste from one state to another. Until
then it doesn't seem like we should do anything.
