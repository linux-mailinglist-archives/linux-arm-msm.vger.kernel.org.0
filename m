Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B086E236A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2019 21:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729004AbfJWTuF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Oct 2019 15:50:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:38360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727595AbfJWTuF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Oct 2019 15:50:05 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E68422086D;
        Wed, 23 Oct 2019 19:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571860205;
        bh=szXNlP/mje0yz+wVJX8JbggDS0ltASZ41uILRnXmMpc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=szkpb+T2taZM3fVN10StcEC/nAFEtJgA1+xo/iGDzKUITPYdq+LWKdNOF0cfHGUI5
         wIFWyd5WvrazD45rsrWShtgZIvIToyaxpBb5DvRTaHvnQOVjvSD/4oGhGCcn/wQaML
         ExPReOBtqOUbWWPofTfSqUi2i0oWsMynN08WXYoA=
Received: by mail-qt1-f174.google.com with SMTP id g50so19862391qtb.4;
        Wed, 23 Oct 2019 12:50:04 -0700 (PDT)
X-Gm-Message-State: APjAAAVKjlZhFiVpVQHMnXMiCFLQDdSzfwL9DOkwlTfS0xKjdIj15FtT
        3nOb/zV9Nn/pxH2I2YeD+3TldIgo03liPVmsdA==
X-Google-Smtp-Source: APXvYqz0vP1GOhhjZuLhazGsa+EI3oKQAYj/m4GJJfQ88tutHc8kT90FJVPCQFtSBKwwhqLESGtZU2e+texU3JV6L1s=
X-Received: by 2002:ac8:70c4:: with SMTP id g4mr279602qtp.136.1571860204174;
 Wed, 23 Oct 2019 12:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571484439.git.saiprakash.ranjan@codeaurora.org> <20191021033220.GG4500@tuxbook-pro>
In-Reply-To: <20191021033220.GG4500@tuxbook-pro>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 23 Oct 2019 14:49:53 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLzRRQe8UZCxgXArVNhNry7PgMCthAR2aZNcm6CCEpvDA@mail.gmail.com>
Message-ID: <CAL_JsqLzRRQe8UZCxgXArVNhNry7PgMCthAR2aZNcm6CCEpvDA@mail.gmail.com>
Subject: Re: [PATCHv2 0/3] Add LLCC support for SC7180 SoC
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Oct 20, 2019 at 10:32 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Sat 19 Oct 04:37 PDT 2019, Sai Prakash Ranjan wrote:
>
> > LLCC behaviour is controlled by the configuration data set
> > in the llcc-qcom driver, add the same for SC7180 SoC.
> > Also convert the existing bindings to json-schema and add
> > the compatible for SC7180 SoC.
> >
>
> Thanks for the patches and thanks for the review Stephen. Series applied

And they break dt_binding_check. Please fix.

Rob
