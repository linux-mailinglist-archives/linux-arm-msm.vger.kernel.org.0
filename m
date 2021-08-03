Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9997C3DE871
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 10:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234407AbhHCIaP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Aug 2021 04:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234505AbhHCIaP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Aug 2021 04:30:15 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C4B2C061798
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Aug 2021 01:30:03 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id 21so27331796oin.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Aug 2021 01:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=qc7HAdPRONVWENwTqJYf7+UMMSlQb2ByVT4mMiCFve4=;
        b=atniL4rhfuMh6gdc26n1GvfP7sZL/FB3VeVzJwfpY3ZGDBRtqPlRh8TAUzQHQzJSm/
         /TAFPpVODr/K2HLBx9M2k1bqu5dqDmNoWVhI5FM2RNcOOvWy3OaTrLLkDVxzuF1pJQfT
         hJESjfs/EKjU9yKmWxkJ54YnAp7MnMTfqxSmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=qc7HAdPRONVWENwTqJYf7+UMMSlQb2ByVT4mMiCFve4=;
        b=qg39gkhQgubqSZDUNqNjCEsXySytbrmZl+JmOspEHI2VOqgTuZ1jdfTh/tOC2+4sTu
         HodR0JuFdYNcsnpjRnMtfPBmuggt0UDnznJj/XgdEUv5m+Q4nJCm4KxCRm8WgNfrHvzE
         N3woiEyfeWFYyq+dCwGV7N+L6/CTSgGBH87QUVXjtv6j4r6rw1Xcni/GRvEytko+2Vdr
         YlDphezPeaZ8U+4+t05AydT9VAOx02MDOfphjAaqWykdgdUZIDGYMLUZHdz3LZ01ys4A
         0PL9g6ai7ZShj26jvVbc9wpKLlhoIM1ESRtUM6h0ur1siEh3vxsz7HE2E3WGPzRmFjYp
         dcOQ==
X-Gm-Message-State: AOAM532yBRPR7xn5xTrk2pLyddgWvvKkSeTtJu38NxU5x+lb38I5FS/W
        SvEHf89YoKaTe0kCNtkDIIytSj2R8RcptniHA8kdRkI2m+Y=
X-Google-Smtp-Source: ABdhPJyMfyu8cQDBZHg3QkNLeM3oPRsMes4cknk00JW9csASaOxHnvSIllU0nbXxTj7snFYSblRyiaUzf1SeDpf6mDk=
X-Received: by 2002:a05:6808:619:: with SMTP id y25mr2337150oih.166.1627979402806;
 Tue, 03 Aug 2021 01:30:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Aug 2021 01:30:02 -0700
MIME-Version: 1.0
In-Reply-To: <1627897145-28020-2-git-send-email-rnayak@codeaurora.org>
References: <1627897145-28020-1-git-send-email-rnayak@codeaurora.org> <1627897145-28020-2-git-send-email-rnayak@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 3 Aug 2021 01:30:02 -0700
Message-ID: <CAE-0n51fti6NQbU9=P-ooPxwc9zNUcV==jaWGnRB7CvCBT_j8A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document qcom,sc7280-idp2 board
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, skakit@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2021-08-02 02:39:04)
> Document the qcom,sc7280-idp2 board based off sc7280 SoC
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
