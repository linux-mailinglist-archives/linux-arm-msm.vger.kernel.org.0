Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 252E4E3F66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2019 00:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731709AbfJXWdR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Oct 2019 18:33:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:37404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731152AbfJXWdR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Oct 2019 18:33:17 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7F45221D71;
        Thu, 24 Oct 2019 22:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571956396;
        bh=zv/+Cg7FqzWfk4zoUYYas2gkXufxYiBgGui3pLf7Im0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bhedDmGWQVxjj/0LqpYmP4rIMIPZ4nUxgoeLK1IdNfMq7BlRbprrfMVQ//KlzTzQ1
         JYU5Zx2YujkbWZVeF5x4X0jAZe9sDHIBPMVs7AitGNDIuEvsAOgXQEfdjyrVE1hs1p
         jz6LMrYnBCKaFNffzUhzsHM7ihKu0plvzWu9zkoc=
Received: by mail-qt1-f179.google.com with SMTP id m15so380045qtq.2;
        Thu, 24 Oct 2019 15:33:16 -0700 (PDT)
X-Gm-Message-State: APjAAAVsUSwMX4zXM24FnGJ3+DiLOr5d8aZWGJ6CYY7ihQ1uhhgM8MvY
        HMKw9ZLyCTdDVs8h2CJl7ZAEdpbfPMvS/oF9Hw==
X-Google-Smtp-Source: APXvYqzpZiq+VxT8v6OnoJFomiqo/yUa7OZtDUCbwhGR9BMysDk7zHRDlulknPdgAbB0q10WoWnbr5qfzCNc76cK/Yk=
X-Received: by 2002:ac8:741a:: with SMTP id p26mr40504qtq.143.1571956395662;
 Thu, 24 Oct 2019 15:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571484439.git.saiprakash.ranjan@codeaurora.org>
 <20191021033220.GG4500@tuxbook-pro> <CAL_JsqLzRRQe8UZCxgXArVNhNry7PgMCthAR2aZNcm6CCEpvDA@mail.gmail.com>
 <2fbab8bc38be37fba976d34b2f89e720@codeaurora.org>
In-Reply-To: <2fbab8bc38be37fba976d34b2f89e720@codeaurora.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 24 Oct 2019 17:33:04 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+5p7gQzDfGipNFr1ry-Pc3pDJpcXnAqdX9eo0HLETATQ@mail.gmail.com>
Message-ID: <CAL_Jsq+5p7gQzDfGipNFr1ry-Pc3pDJpcXnAqdX9eo0HLETATQ@mail.gmail.com>
Subject: Re: [PATCHv2 0/3] Add LLCC support for SC7180 SoC
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 24, 2019 at 6:00 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Rob,
>
> On 2019-10-24 01:19, Rob Herring wrote:
> > On Sun, Oct 20, 2019 at 10:32 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> >>
> >> On Sat 19 Oct 04:37 PDT 2019, Sai Prakash Ranjan wrote:
> >>
> >> > LLCC behaviour is controlled by the configuration data set
> >> > in the llcc-qcom driver, add the same for SC7180 SoC.
> >> > Also convert the existing bindings to json-schema and add
> >> > the compatible for SC7180 SoC.
> >> >
> >>
> >> Thanks for the patches and thanks for the review Stephen. Series
> >> applied
> >
> > And they break dt_binding_check. Please fix.
> >
>
> I did check this and think that the error log from dt_binding_check is
> not valid because it says cache-level is a required property [1], but
> there is no such property in LLCC bindings.

Then you should point out the issue and not just submit stuff ignoring
it. It has to be resolved one way or another.

If you refer to the DT spec[1], cache-level is required. The schema is
just enforcing that now. It's keying off the node name of
'cache-controller'.

Rob

[1] https://github.com/devicetree-org/devicetree-specification/blob/master/source/devicenodes.rst#multi-level-and-shared-cache-nodes-cpuscpul-cache
