Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65E6214F3DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 22:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgAaVga (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 16:36:30 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43279 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgAaVga (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 16:36:30 -0500
Received: by mail-lj1-f194.google.com with SMTP id a13so8571518ljm.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 13:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tPp4CE2TXss+Iqg1JyzdT3AoBMysWvmpqcl+5tL7wfM=;
        b=UFqfczXofGowOc/1d9Jw/A37caNSorQt1frX6+nTQmuT76g0i6gIKLAHxwJewlH+l9
         IGrJg1etsGOvaN8ZKYm66P/904XHwcbCr0qT4p1L/wP/MhQZx4Lx2YwF9GmPXZX7vkX8
         LmWpQZH6FkjbDoMHGjw3AvhYWsDQiu2AkMkEWKg/09My08fRFAtuBoC0Y4Yiqb0hq58D
         ARSU1Ey73Bnth/YIGBqVb0PhaihCAKyiUA0BT5uw2qLytabhK57lp2ol8ez5wkamI8C8
         cqwsdkcxkeITkI3xnTKYHrufuq9hjxaoFvqA5+t+X4hkVyM4ZC6Pym69Nsc4ibhT2LTf
         8Rmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tPp4CE2TXss+Iqg1JyzdT3AoBMysWvmpqcl+5tL7wfM=;
        b=HOxXzWmCFXmT0quAlAwPaOzhtvpkrZ+W/Z0qGef5MEvJDCdZ0jArxvIPPTX9K5mmaQ
         IHB+pa9C1A6qhPAvNPs4OT4SCW2n/SqvH5rmlASV8gb/B7Xd1VaZYt77Iub9X83K1MhV
         1yL+gfTr95lT1vJcieh695q83wBbBEQSvEJcDBazRwDdB0LoknTzSp2xjL33RWDzI13T
         yNhOInb/aOMOGCkDINsfrlZxQnhw/k+Q9Z13ZOhKewpIXeeDBMuWywiPQ7aFp1GezMco
         qDOQ65wl0/hjzgfiQ8C8rG33YNkIWiRZwq4dfPnlXZDB0GAms/ZWmanMI++RpXP5WZs6
         LstQ==
X-Gm-Message-State: APjAAAV6iPL7FXzyj2fVCbWll9UQ0T8T17x+6WETNCQtt3/tzxgxcpdf
        4EGxx9dccj8tr6KsMrqgUkhoybBpt5P/4ohZsCl6TA==
X-Google-Smtp-Source: APXvYqyt/2uWbr7uISs4LADoAJ7mFl38eOmZqrUOoScK9Xl/jliht9jHg5OxSyMaVzZ4S/+E8Ii5bMdspbN94RNqBe4=
X-Received: by 2002:a2e:85ce:: with SMTP id h14mr7134662ljj.41.1580506587808;
 Fri, 31 Jan 2020 13:36:27 -0800 (PST)
MIME-Version: 1.0
References: <1578630784-962-1-git-send-email-daidavid1@codeaurora.org> <1578630784-962-4-git-send-email-daidavid1@codeaurora.org>
In-Reply-To: <1578630784-962-4-git-send-email-daidavid1@codeaurora.org>
From:   Evan Green <evgreen@google.com>
Date:   Fri, 31 Jan 2020 13:35:51 -0800
Message-ID: <CAE=gft7GDtQCYy8UqpVRK18eXQLTD8q19=Sfq-iitekQCS1FMA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: interconnect: Update Qualcomm SDM845
 DT bindings
To:     David Dai <daidavid1@codeaurora.org>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, sboyd@kernel.org,
        Lina Iyer <ilina@codeaurora.org>,
        Sean Sweeney <seansw@qti.qualcomm.com>,
        Alex Elder <elder@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 9, 2020 at 8:33 PM David Dai <daidavid1@codeaurora.org> wrote:
>
> Redefine the Network-on-Chip devices to more accurately describe
> the interconnect topology on Qualcomm's SDM845 platform. Each
> interconnect device can communicate with different instances of the
> RPMh hardware which are described as RSCs(Resource State Coordinators).
>
> Signed-off-by: David Dai <daidavid1@codeaurora.org>
> ---
>  .../bindings/interconnect/qcom,sdm845.yaml         | 49 ++++++++++++++++++----
>  1 file changed, 40 insertions(+), 9 deletions(-)
>

This patch doesn't seem to apply cleanly on top of patch 1 because of
whitespace context differences.

I'll use this as an opportunity to plug the "patman" tool, which lives
(weirdly) in the u-boot repository, but is an excellent way to manage
and spin upstream submissions.

-Evan
