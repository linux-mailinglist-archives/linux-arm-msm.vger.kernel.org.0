Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A73B7413843
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 19:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhIUR2t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 13:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbhIUR2r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 13:28:47 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31719C061575
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 10:27:18 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id r26so244392oij.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 10:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=4Dwfj98Yc1HEfTOzYMhxAK48M6ebYAEnvZEqsEY49Ik=;
        b=CO3RLCAgcY6ehQvKXBEDiG3P0K9ffpetCgRl1POMt2+HhdlFu/xjBJfVJpkRP+MTLQ
         p0egexm0ablmUuXMSXcTBDrse+pwp5K0M0YRM+hSRGJhHGA7xQwlDo3R6d8Y/Y3/pQtC
         tbHSvzrHY3xOnzIG1X/b3+6NQ/5QEp6LMhX4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=4Dwfj98Yc1HEfTOzYMhxAK48M6ebYAEnvZEqsEY49Ik=;
        b=1V1V74RUTdBFPVhepbkjy/yPdUWvSAxfYxrO66M1cXzsVJsaYDkb/FyWvtL4Xy/9Dv
         AiP1mjhpbwA8bfV6flokVIDtnlTzKtr46ETXJ0POgDl1nesJ6kKJnHw7dRcwsq7teHCm
         DgAZu7e/wOTQu1ZXwpGla2JZaq2XlecDDqfQTTWw6TzbNSaCrVS/SVEjvBP/M0PJvsBY
         I2kEetBm2Dv540OduBqFI5bse4uFKvaCMbaRJVEPZ6g5/FzVajKI9QlGNiyuQ8oiGBVD
         +ERPV0GHA99vKktUaYp7P0Y4WCfaoVDFh4YETBkR+ipsN5aoq9jPH+wEBTry5VSZVhEj
         TLjg==
X-Gm-Message-State: AOAM533gL6qHOQavSVhHh821nrvc54LQ1OqDuMeApazMr8NSwA6Wte40
        5iar9/rrQlNWMsIdf2shEd+JxDNTPTZd+LbZOTwWnA==
X-Google-Smtp-Source: ABdhPJyprcnvduIyewp0eo2HDH71eHPxrC3yu4FcnWSJ/10YHdtfTC+AvDmg9iuGw8fIf6v6TkfnHh2CAcrqnnq6JOQ=
X-Received: by 2002:a54:4419:: with SMTP id k25mr4696213oiw.32.1632245237527;
 Tue, 21 Sep 2021 10:27:17 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Sep 2021 10:27:17 -0700
MIME-Version: 1.0
In-Reply-To: <1632220467-27410-1-git-send-email-deesin@codeaurora.org>
References: <1632220467-27410-1-git-send-email-deesin@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 21 Sep 2021 10:27:17 -0700
Message-ID: <CAE-0n51kCczyefN0r7Wb4TRa1mUWiCdkRqfooDdfnyD_jUq8PA@mail.gmail.com>
Subject: Re: [PATCH V5 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P IRQ
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Deepak Kumar Singh (2021-09-21 03:34:27)
> Remote susbsystems notify fatal crash throught smp2p interrupt.
> When remoteproc crashes it can cause soc to come out of low power
> state and may not allow again to enter in low power state until
> crash is handled.
>
> Mark smp2p interrupt wakeup capable so that interrupt handler is
> executed and remoteproc crash can be handled in system  resume path.
> This patch marks interrupt wakeup capable but keeps wakeup disabled
> by default. User space can enable it based on its requirement for
> wakeup from suspend.
>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
