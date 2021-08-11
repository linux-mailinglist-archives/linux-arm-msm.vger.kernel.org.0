Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE1C33E8FFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 14:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237320AbhHKMBk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 08:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232562AbhHKMBj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 08:01:39 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E57DEC061798
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 05:01:14 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id p38so5295270lfa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 05:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l3GJTHSzcRfHRR7rYGofO7K/3tvMaQU+g+vXNUrYfNc=;
        b=s8jSb/4Uxm7mLtCWQ2a4ZTfZNKh0PtCo+djrABMmW9bWNgE7UtV3CM2Nn+QNxReuga
         UaW/eQhPCJP6y6RUK1U2BdjaY3497uDkyKPiZXuyDtEY9oitBvzPhnvauHAbdfWA0Mwv
         PBW0sy6nkTx5NyMZu4n1vnT1YjISbuHLBQSfrSyiqFTmQCPqTwpEUuwldJvOObR8QPtg
         gj0Nngb6I2Si6VNexA/DIbO8AD1h6bpUl8qlVCay2qX3If2E1Jph3ZeWi+vLsF7aGVQy
         qm/KBlXngnTnojVwCGJc3n1phgHBkCKkXgBf9vjJGC9c+yUxu6R7h9RAaFSBmRbW5Okm
         iZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l3GJTHSzcRfHRR7rYGofO7K/3tvMaQU+g+vXNUrYfNc=;
        b=gkprBTB+M0pzI51GvbblYV+BDpoZ5GZ8aLjQ7zgkKRXwc3akRJziN4+PV3oFn6+euv
         zbKLcuk0C0kzEaz4Px/JX10rEFWJI+ZB8GuKWzh6Vy3cXR1j4uSvyjNGwbAYzxBi2DuX
         wyST4DwnB3g3vW+Gd0WRvedwFlrgpv45BouxG9aTKTq+vLQXz0DFlO6oBcvtRnQiSDuB
         +huNHlVNxZKsFw+HK1ANILIM2KN9X4zIppC6OVTCxj/rqW4FP7+2M0e1+Gv0McfikaWr
         gxqMUxwAyD3ndnRFpBYSSgNwjCN7H2yOhf+l8EZC/0d/qmfw+c5GcUCfeaayqe3CVdwi
         D12w==
X-Gm-Message-State: AOAM532UCN50Fjs5Q3Ax7VnX9GrS8snWF/qNN5GJmlbgkrnLXyglBg8t
        aT9LNxejn5BRmn9YkCGWCpQxBWP2L4ZVzbAvgps1gA==
X-Google-Smtp-Source: ABdhPJxASVpzZF63UvkPFlBxtwrWbbdQ5itq42p8VSocVX8aKD/TLTr8NlFYMefpF+MYtCEpIEz1YBiNJfYM7nhiEsU=
X-Received: by 2002:a05:6512:32a3:: with SMTP id q3mr13681368lfe.157.1628683272677;
 Wed, 11 Aug 2021 05:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <1627910464-19363-1-git-send-email-skakit@codeaurora.org> <182fc9a13b78d114bd209f9658274f0c@codeaurora.org>
In-Reply-To: <182fc9a13b78d114bd209f9658274f0c@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 14:01:01 +0200
Message-ID: <CACRpkdYQ-r2Xw0BHt0Mu78FWemXWU0jjKixTSPpspH9wkEmtCA@mail.gmail.com>
Subject: Re: [RESEND PATCH V7 0/3] Convert qcom pmic gpio bindings to YAML
To:     satya priya <skakit@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 11, 2021 at 8:17 AM <skakit@codeaurora.org> wrote:

> Can you pls merge these patches? I have rebased them on linux-next.

Yeah I tried, hope it worked. Sorry for the delay.

Yours,
Linus Walleij
