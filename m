Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C9A402F5B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 22:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346269AbhIGUFI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 16:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344901AbhIGUFH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 16:05:07 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C59DBC06175F
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Sep 2021 13:04:00 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id k12-20020a056830150c00b0051abe7f680bso613144otp.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Sep 2021 13:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=TENBxfXEJrx+qep0klzFIcnjVwFP7TPiqnVMsNGOBug=;
        b=luEnDOJzvHQwGgL5oD/itSmHJe7C1R8V4a5IViGtADCVgsKgv2TIz5DcHiy+iE4r6u
         bWh+QkKk+u6tXj1AWln+ED05+Rwx/rmFH/+1Sjo3DIoYMNbGAFlSsH+57UAU2rRcpJOX
         Epw4H7JiE9KFLKbohz7Mi5DLhuFL0WmF4H0QA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=TENBxfXEJrx+qep0klzFIcnjVwFP7TPiqnVMsNGOBug=;
        b=c1V/Umw0SAdhZcqYm3ZxryXjmXKU5T73562fZULTVTQUcdbFri0cRkPXSg4fjCgeVy
         QN20fuHkV6o59xjb4vZJIegHa7vBwjuGzlsq7bpMI83ydQQ6uhTz4NRwAciKBkFoI4cM
         UZkHaWDcJJP8sK8piOpEp8Y4JlOMaqGK5V0RMNr0Meo4mlo7KJvTBpG0P9XvDvY4xYCb
         C2QStKUuIUodtn6kIECtEi0eJ+CCq1FAOnr2plY4mPR2MtzJk+y3rt28TC45t6X2Pq1w
         ceqfiVJaoUmvacP7WnI0baP1ACZ+omHWKnjk2M6S23bZU2NgQve+S4S9L0vt3S+BHYjV
         a6Qw==
X-Gm-Message-State: AOAM533VdmjfxEpOYrpYvqAtcUl7AixsQd0tlDLVLKCZa+KeMGhx8yKu
        Cg1rBF1hG88rqM54gL+dD2gThSXW9K/oFUXvDEnwY8Ocp7s=
X-Google-Smtp-Source: ABdhPJy9i/DlZKOQrkekswUoYCNt7EYgkeC4BfnnDRyCvPE/fNG4JvccpBXSKKrzKRlyeS0taETaIPWq8jLCedHjcCA=
X-Received: by 2002:a05:6830:1212:: with SMTP id r18mr102390otp.159.1631045040100;
 Tue, 07 Sep 2021 13:04:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Sep 2021 20:03:59 +0000
MIME-Version: 1.0
In-Reply-To: <1630924867-4663-2-git-send-email-skakit@codeaurora.org>
References: <1630924867-4663-1-git-send-email-skakit@codeaurora.org> <1630924867-4663-2-git-send-email-skakit@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 7 Sep 2021 20:03:59 +0000
Message-ID: <CAE-0n53RNDAykhFuDN_Qgwv6ktR8cRQOQxXWmDX9+yXeu4aECw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: leds: Add pm8350c pmic support
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        satya priya <skakit@codeaurora.org>
Cc:     mka@chromium.org, kgunda@codeaurora.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting satya priya (2021-09-06 03:41:05)
> Add pm8350c pmic pwm support.
>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
