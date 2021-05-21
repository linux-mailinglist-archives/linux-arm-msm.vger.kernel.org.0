Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34F6F38CF45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 22:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhEUUro (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 16:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbhEUUrn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 16:47:43 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A96BC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:46:20 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id v22so20882606oic.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=AZ3l/zxIL/NOMMAmXJkqt/4UgOSejxRM3iDClSSiQdU=;
        b=Ff8mkYy1VgMh+ceMv4OclUbb7dT8Vk6402dzIimQOhbqu+8TA44MKkV8ZAsriosUqz
         p06OopYcjGNJbv88PHqKd4WLTO0mgUVYJAdpRS6+rW9lVjMTLwwIRwq0f26LahOd3P/E
         oCTM1QXiK5KN5pZ2uMeUqH2/EttXU4R+sdix0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=AZ3l/zxIL/NOMMAmXJkqt/4UgOSejxRM3iDClSSiQdU=;
        b=bqzfsE/lvi6ntKJK1nahmDSHFID99oYlUNPquJaOi0FWr3dyTFOs7OhrGgnJRkAMoS
         k21JQglBl66qOmvlIK4+vSnU896G3iRGzMgt62GS2I3tMS0qC7JAURZlepVaqz9nfJqN
         sCJ3KCU17qq8OrGZppnGXuVU/rqp8Vw7bOYxANXNNGaj/JCxDLYzKYifHVV97fJSTYwc
         aE7EKyIupLETefJX7ULLRkZQl00CabpQs3SqP8TSy5bWvcXtKYsGR8YccdpWk11t0C/j
         a3mVaFqvUHxUAL3L7ohZBxJPFCeC1Ncq+upFxPaNhZvTcdCyYqioS2QSpk0HIRP24ZEA
         PCKA==
X-Gm-Message-State: AOAM533p1MawkllF0CrK+9ET+RvpB283JrC0l9g8HYqfEkcEZGumSCG6
        kNhRHd8cgX7UFnglm2uxim+Y+oDckhN2jV5Cd/JfZw==
X-Google-Smtp-Source: ABdhPJxf3iGsyJturbsxX9/7bpQ75ZAt2AXo0hzzCETHpkivWeeFM+PMM5T2PS9XqN2XpKKvia6FASJVYpmoO21Gesg=
X-Received: by 2002:aca:654d:: with SMTP id j13mr3612205oiw.125.1621629979564;
 Fri, 21 May 2021 13:46:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 13:46:19 -0700
MIME-Version: 1.0
In-Reply-To: <1621592844-6414-4-git-send-email-mkrishn@codeaurora.org>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org> <1621592844-6414-4-git-send-email-mkrishn@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 21 May 2021 13:46:19 -0700
Message-ID: <CAE-0n50-VuzX5X1DqFJJ8ZjAjJNsnRA9S-dA+wGxox+nbZetXQ@mail.gmail.com>
Subject: Re: [PATCH v17 4/4] dt-bindings: msm/dp: Add bindings of MSM
 DisplayPort controller
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        dianders@chromium.org, khsieh@codeaurora.org, robh+dt@kernel.org,
        sean@poorly.run, robh@kernel.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-05-21 03:27:24)
> Add bindings for Snapdragon DisplayPort controller driver.
>
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>
> Changes in V2:
> -Provide details about sel-gpio
>
> Changes in V4:
> -Provide details about max dp lanes
> -Change the commit text
>
> Changes in V5:
> -moved dp.txt to yaml file
>
> Changes in v6:
> - Squash all AUX LUT properties into one pattern Property
> - Make aux-cfg[0-9]-settings properties optional
> - Remove PLL/PHY bindings from DP controller dts
> - Add DP clocks description
> - Remove _clk suffix from clock names
> - Rename pixel clock to stream_pixel
> - Remove redundant bindings (GPIO, PHY, HDCP clock, etc..)
> - Fix indentation
> - Add Display Port as interface of DPU in DPU bindings
>   and add port mapping accordingly.
>
> Chages in v7:
> - Add dp-controller.yaml file common between multiple SOC
> - Rename dp-sc7180.yaml to dp-controller-sc7180.yaml
> - change compatible string and add SOC name to it.
> - Remove Root clock generator for pixel clock
> - Add assigned-clocks and assigned-clock-parents bindings
> - Remove redundant properties, descriptions and blank lines
> - Add DP port in DPU bindings
> - Update depends-on tag in commit message and rebase change accordingly
>
> Changes in v8:
> - Add MDSS AHB clock in bindings
>
> Changes in v9:
> - Remove redundant reg-name property
> - Change assigned-clocks and assigned-clocks-parents counts to 2
> - Use IRQ flags in example dts
>
> Changes in v10:
> - Change title of this patch as it does not contain PLL bindings anymore
> - Remove redundant properties
> - Remove use of IRQ flag
> - Fix ports property
>
> Changes in v11:
> - add ports required of both #address-cells and  #size-cells
> - add required operating-points-v2
> - add required #sound-dai-cells
> - add required power-domains
> - update maintainer list
>
> Changes in v12:
> - remove soc node from examples (Stephen Boyd)
> - split dpu-sc7180.yaml changes to separate patch (Stephen Boyd)
>
> Changes in v13:
> - add assigned-clocks
> - add assigned-clock-parents
>
> Changes in v14:
> - add reference for ports (Rob Herring)
>
> Changes in v15:
> - drop common properties from ports (Rob Herring)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
