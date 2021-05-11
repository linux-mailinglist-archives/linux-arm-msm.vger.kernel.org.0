Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4C837A918
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 16:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbhEKO0C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 10:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbhEKO0B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 10:26:01 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67DE6C061574;
        Tue, 11 May 2021 07:24:55 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id n40so2564219ioz.4;
        Tue, 11 May 2021 07:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1EMn+ug4jk4cL2SkKvI78d9MzgAfHXacPRek3Et9YsI=;
        b=TuMNCdx68RMCsdfYeAnUoJcBw0Ji9IGAhacmYc96OyAcoDi6hLo0O3E7Wg0CrW8Tq+
         TtLx7Xgi4YKMrRk9KtHl0gAmpXJyEvwf6YIIK4dpTmeyoFufLIKBCpyzzK6PKqOFmKGE
         JjkSIxqjYfdXIgQ1t0HG25Iabtz8eTD3Kq/FDmHL+1rLvye9K6vGFyDfzuYFMY4npMYz
         7a+DFOUqys9avImy+v+L7CvC2QH5DkrsXxPZuLM7I17G/pqORgwMi/zZBv1hIDS5v2tH
         cu1bQ4JWRpwlyF+TPFgTg4sY5v6Z7QwUBmv+8PczSb+7Lf2aO558AxgmoC08lePPnSrk
         5QtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1EMn+ug4jk4cL2SkKvI78d9MzgAfHXacPRek3Et9YsI=;
        b=hGutQjjwRScYBzsdYryMbZo2jjHOOaiBgXQBc1/3WvIFDOSWcUhn+3Iu1F6PujcBmt
         vnwlzIqoRVWTM0ykjiDCccprcpdF8czhS1lEWgCkv6wD8y2cxYoVGZQNVDsfy8hD8ZWd
         FY4RF8lEjr1Pinj9XfI3AwBcWanYjuCuhK0cmkFHKOq+NPSmHdRZW07se1Z/meLFQmO+
         HB/eS+n5sqxUxQGCJrvh0BLRaiLBdRSqzQ0x1p4ec4aF+eG8Yf2L7l8J7hPEPv5yWDeT
         Qnru6MMSoQev8kj0oH3srPNF4jHP9ditmP58epnm8g9XquyzyI0sNaoZACCOTyRcjSbz
         mJoQ==
X-Gm-Message-State: AOAM531Z/JRaXz4VPLPgaw5BRuKDlmBukQSvyIgJ7dnA2eVPjVMmnFKo
        7fVbjQ6pRYuog3bbIxIUtFQ42Y+ZsZxen0uguXY=
X-Google-Smtp-Source: ABdhPJxuDTFCQqh/u7tpwKhKnCbOYxIzzy3KdeEps13QOeZpdnAnVfgSTnfyacPf2SkeCmFaQZmqHisgBCF6VssmBmc=
X-Received: by 2002:a6b:4f07:: with SMTP id d7mr22042896iob.160.1620743094970;
 Tue, 11 May 2021 07:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210511041930.592483-1-bjorn.andersson@linaro.org> <20210511041930.592483-2-bjorn.andersson@linaro.org>
In-Reply-To: <20210511041930.592483-2-bjorn.andersson@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 11 May 2021 08:24:43 -0600
Message-ID: <CAOCk7Nr9jAUjt9nLN=52xwsXP00=7mTV6HcdGzr5D2LTzBepLQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: qcom: Introduce new eDP PHY driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, sbillaka@codeaurora.org,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-phy@lists.infradead.org, DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 10, 2021 at 10:21 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Many recent Qualcomm platforms comes with native DP and eDP support.
> This consists of a controller int he MDSS and a QMP-like PHY.

"in the"
