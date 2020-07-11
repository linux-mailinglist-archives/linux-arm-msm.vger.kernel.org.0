Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7F221C657
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 23:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbgGKVLh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Jul 2020 17:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726779AbgGKVLh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Jul 2020 17:11:37 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C02C08C5DD
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2020 14:11:37 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id z24so10355390ljn.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2020 14:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hG5d4MXKH7j0YNeql3XedgUwA1S+hEFx8UFAusowRpQ=;
        b=dXthr0xg2XCQr65fG0RuhCL5iGIPi6+nsbmgiARFHbGL/Uf99W7FHXpins4+smK3oF
         SFZmDcxc2/w/y3N1xYxVegkxHeSq1ZYEtGk75cap3MamCnrhYMawKCxHTNulHFKjfxfk
         +tfF1aUGFmC1OG+EAsNulGF3Xo/n7r/jsWUp3DCdLP8LHfZfruyiZZ54/T6yRf+wdB3A
         1FvI0tUfXAxjNb3MTyOhfhe09ygOEDK2uxGqcAhIHcj7EP771rr08bSPhvyv8E5yH0aC
         O2J+AcruPCugrhoevCMBpiiwQlrao1hH++RpqOb/Pv4ffC4DNQKk4EFR0tD5R2oxMMvg
         3qAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hG5d4MXKH7j0YNeql3XedgUwA1S+hEFx8UFAusowRpQ=;
        b=L/H3myCisUceEUpMJAkuBGZE5+HEeNRgAcxyzolNjqtUyrtpdP4rbaDXYSjA3+8w+1
         XLnCB5sXGBNqcThGrBSQIfxV6mLxCjm0u25lLCWCjY5i6kD+YXI/Bb1ZU234QrZME5cl
         TOc2edS9IZ2Xe2Pne5mSg/yjzv2CFA6DbXtupX/Vo1TAEyHLzWiNFD+yhPZIWqaVE7Ij
         9YQ7/nV5cSEqv15Fx7iO4Qn/nwVGB+9+7jzgHUOZwaXj9rf8pzwVHolcPlZ5UYc2nWs2
         S4Ypuzjg7x5sp5UXl2z+os0HwdPFMVBIDM19x4WKix+o/yZnCCs8KLaD3XDjr2XO3PVQ
         mQPA==
X-Gm-Message-State: AOAM532FdD+bfRUKI6leQPD7NDk9HtGlGbLd8TcOs10fE9Ck2D1l33TC
        V+EQHuzNdp0/GmdGIQS6I9VRWphNVB044Pkit/Xv18o6
X-Google-Smtp-Source: ABdhPJykUdIN42EDfkU5cG71+oDSmBrVADO8NS9vM4JO9vrSCCvxVJAsXra7VIel2SQ5Kgi8SMViUfehC/nyjHr2+30=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr27378268lji.338.1594501895501;
 Sat, 11 Jul 2020 14:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <1594107588-17055-1-git-send-email-kathirav@codeaurora.org>
In-Reply-To: <1594107588-17055-1-git-send-email-kathirav@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 11 Jul 2020 23:11:24 +0200
Message-ID: <CACRpkdbZWrpqtQKZeX96-MtvwR4ak9E9hF43fURpZ50MVtWwig@mail.gmail.com>
Subject: Re: [PATCH V2] pinctrl: qcom: ipq8074: route gpio interrupts to APPS
To:     Kathiravan T <kathirav@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        srichara@codeaurora.org,
        Rajkumar Ayyasamy <arajkuma@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 7, 2020 at 9:40 AM Kathiravan T <kathirav@codeaurora.org> wrote:

> set target proc as APPS to route the gpio interrupts to APPS
>
> Co-developed-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Signed-off-by: Kathiravan T <kathirav@codeaurora.org>

Patch applied.

Yours,
Linus Walleij
