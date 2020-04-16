Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961AB1ABB14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 10:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441370AbgDPIXl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 04:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441363AbgDPIV6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 04:21:58 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39AFEC061A41
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 01:21:42 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id h200so1671094vke.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 01:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T/reHgPggcZhG4lK1Xu2pV+incftSYy8GHcr4ZbUooE=;
        b=rMq9OYF0LtRi5tqsKnHYSCyeulkSoKDcfn8p0e1GyLCQO7aQDmvujhuiuxSCotUJpO
         MgcpejIgcrWsQjIAGIT8xIndxMOBXakoo5hUr4I8RJdsvQhbSd02BeZBdOGXXZeOgv0/
         qbDUT6auHYmr5ilvgisBG0DiOK+tiMTN13fZpSiigctxIEAx4IRzpe/wHNiaiG6Ayv3K
         PDlwjZllsp/D1bsQudWLnPYb+6erNIRkvwNjdCAstp5CN71wUMAYTd6oLck9geVlwtti
         uMvymZ+MPmIxyHnnmQMMYo0nmwpt/R2lKoIMmyMBI5/M/m/Tx0fGeWscZNEUNDXY5pBN
         bjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T/reHgPggcZhG4lK1Xu2pV+incftSYy8GHcr4ZbUooE=;
        b=h/Sdp+MCk0j0dl0QxFFN8jayuWiQQiecC2YEoSQGyiv7Pb7InHy92EK9z3bh+4YpUL
         mCMPcOImpPAn0uN9SSTnOnnqsbj7UGXNfWDlU/7KDnSL8GK9Atge7naK6J1Pg7d6DQQZ
         Cs7hbJmIeDGOOu0oobNDm5KbEGo7TIGepqpaR5sqj+t0F14aP1DQ7F4mQ9ztMv7uRyZe
         jNSHE33N70W8sU9MzrYLvG/hLIit/zEk6mfpnOdKJykZACDROdUVnUEja9Glxxr2LOLZ
         f8iuZ6wt3pT/9qiLoHeEHWz3gq5DxiFimbgq+B3kMCgtPFUoI6HfnERQsM5LHP9XTurF
         0NCQ==
X-Gm-Message-State: AGi0PuY66vrr5VC/SOHmSOypFNeS5odWxdk1S8SeQuVdY1Ivtm9fpvTQ
        2JL+DW8UI7oFeSPX+stVzsaLFsvt2eFlX3UOS822nw==
X-Google-Smtp-Source: APiQypJGh7LR9CvqbpYIu/kxAYhVc8j+KRUnh92CtaIwyLqGZX2FRTHmGeHZiBIo3KhwWW7YiQZDha0chu+g8V/k4fo=
X-Received: by 2002:a1f:aa48:: with SMTP id t69mr4609579vke.43.1587025301152;
 Thu, 16 Apr 2020 01:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
 <1586353607-32222-14-git-send-email-rnayak@codeaurora.org>
 <CAPDyKFrOFOLCWHu8nE4i5t=d+Ei-kcJ15_42Ft3ROSUDe5jkpw@mail.gmail.com>
 <3e5f8e78-7cd1-30fb-e005-78c1e7111794@codeaurora.org> <20200416033906.cl2v6wgbz3ch3clg@vireshk-i7>
In-Reply-To: <20200416033906.cl2v6wgbz3ch3clg@vireshk-i7>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 16 Apr 2020 10:21:05 +0200
Message-ID: <CAPDyKFptzgZqzFJYM4_mtu4BsmfNmF=OoSfAwy7vv0j6=gmGeA@mail.gmail.com>
Subject: Re: [PATCH 13/21] mmc: sdhci-msm: Use OPP API to set clk/perf state
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pradeep P V K <ppvk@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 16 Apr 2020 at 05:39, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 15-04-20, 22:13, Rajendra Nayak wrote:
> > As for the dependencies, its only PATCH 01/21 in this series and that's
> > already been queued by Viresh [2]
>
> It must be part of v5.7-rc2

Great, thanks!

KInd regards
Uffe
