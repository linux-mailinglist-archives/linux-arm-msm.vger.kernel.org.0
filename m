Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC1DF3F203C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Aug 2021 20:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233673AbhHSSz6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Aug 2021 14:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbhHSSz5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Aug 2021 14:55:57 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA23C061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Aug 2021 11:55:21 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id y14-20020a0568302a0e00b0051acbdb2869so3160987otu.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Aug 2021 11:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=mufyADO3wzTmydMEKiodSbUdOKfwxrgUWAkkX2NXaUY=;
        b=B5HzGRXYpErfLHRWHuRP+Zy33rYrnFdRVwP7Ah1gQGFk/i9zrg1aoABJzQa5YXItvx
         EqacP/RnFUoXW8QpswB3ajQvpr5tFQs9SFttQFyyGepb04kC6MSW7vr04ALR7Tp6YsL6
         2SKy8QijVzn+OMTjRbonokc8ztS6vlHAJCRJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=mufyADO3wzTmydMEKiodSbUdOKfwxrgUWAkkX2NXaUY=;
        b=Fg0SEo9K5NFZlr/lXnLQrHyCImiV1zI51zDDiOh1KnqUPvtR9BF/Vy/w1JrO+6eBzN
         B5AgpnTh0EKDgbgg3ARTLzfAkeqVfyTSLbxTzLskKlPRzA2n0v+V9a09K8oRGMGeY5YG
         gEbFOFXajdRjcng3ngzsK3y2pCMmKL3ILXpz3krKyENEcykk6tVSmV4TGOufu6raZBrK
         LuhvlD3lOXBuuJTV9Skod0CRKsx0jpXhTCpVbYsMFqxQm2aavQyNFeii68fKJF3j6wV0
         dU6009CDFSxNdLFK9qasygOcWfN2WYHVbIBEDlrOpGIRt++oirEGBb6angYKF03tAozv
         I/5w==
X-Gm-Message-State: AOAM531usiaoLr6YYReTRZSJCXQwktjBFtnB8BtKvcqvJjPBEZsYvpMh
        h0SXz/2t+usUHZVLPa6KJdCneywmE3rwcLHDgt98Sg==
X-Google-Smtp-Source: ABdhPJyDkjYCzIY8JFWkTKloRjmY7nhy+s5wTC7enDEQ0Fet6vpBNfNpj9Ok/m3aRJ2NEVoUarlpUJanlewegEVS/E8=
X-Received: by 2002:a9d:5542:: with SMTP id h2mr13355291oti.25.1629399320024;
 Thu, 19 Aug 2021 11:55:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Aug 2021 11:55:19 -0700
MIME-Version: 1.0
In-Reply-To: <1629342136-3667-3-git-send-email-sibis@codeaurora.org>
References: <1629342136-3667-1-git-send-email-sibis@codeaurora.org> <1629342136-3667-3-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 19 Aug 2021 11:55:19 -0700
Message-ID: <CAE-0n531EgLx-gGJswmmNAFmy-P9z=Hh1N=fkLw_uemoeQnYVg@mail.gmail.com>
Subject: Re: [PATCH v5 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP property
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-08-18 20:02:05)
> The load state power-domain, used by the co-processors to notify the
> Always on Subsystem (AOSS) that a particular co-processor is up/down,
> suffers from the side-effect of changing states during suspend/resume.
> However the co-processors enter low-power modes independent to that of
> the application processor and their states are expected to remain
> unaltered across system suspend/resume cycles. To achieve this behavior
> let's drop the load state power-domain and replace them with the qmp
> property for all SoCs supporting low power mode signalling.
>

How do we drop the load state property without breaking existing DTBs?
Maybe we need to leave it there and then somehow make it optional? Or do
we not care about this problem as the driver will start ignoring it?
