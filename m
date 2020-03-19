Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE5E18BDDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 18:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727269AbgCSRVf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 13:21:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:55360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727146AbgCSRVf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 13:21:35 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F51520836;
        Thu, 19 Mar 2020 17:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584638494;
        bh=Wa5WhY7NV/amydUQxKZOOUXAC72lGMcK0NhEdS62D74=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ft7/kE4yvSeKvAW7bbRrolP0UaF4xWVzoUrxHpX0nmu8GiUwsWuPjC9AXv1rRvqzH
         sVRiUQ2587taXsEXy1sB2Zk5TBLyJLMygLxbHZVX7XO/h+r/38lcGeiLC0wZaFDnYu
         Y4lX75HTJ+SSMrlihdhmMBdXg2cJ2f851/tEqHBo=
Received: by mail-qk1-f174.google.com with SMTP id c145so3855298qke.12;
        Thu, 19 Mar 2020 10:21:34 -0700 (PDT)
X-Gm-Message-State: ANhLgQ13TX7m3D5QlSqmEd7vWKhcYbGOigfeWKTOCs/0JJzHGkIJY/Gp
        gOrbfhLp3rgKSUMWL67AMN7RGw+g8gqZeHXyEw==
X-Google-Smtp-Source: ADFU+vulofMsciR5pLApGaBb0QXCqdfQARLGVOuL0yu914G08i7K943mRV5VQl5ypvWeXQ6VTH6kM8/ISVQqrL9dm34=
X-Received: by 2002:a37:8502:: with SMTP id h2mr4136038qkd.223.1584638493344;
 Thu, 19 Mar 2020 10:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <1584211798-10332-1-git-send-email-tdas@codeaurora.org>
 <1584211798-10332-2-git-send-email-tdas@codeaurora.org> <20200318220443.GA16192@bogus>
 <2ceccbac-b289-03d0-665b-6e9ca57b4333@codeaurora.org>
In-Reply-To: <2ceccbac-b289-03d0-665b-6e9ca57b4333@codeaurora.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 19 Mar 2020 11:21:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKOTRzvtTjHPmOR60tpxUoPsoaB5ZbLdPG0VrN-NnFxWg@mail.gmail.com>
Message-ID: <CAL_JsqKOTRzvtTjHPmOR60tpxUoPsoaB5ZbLdPG0VrN-NnFxWg@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 18, 2020 at 11:37 PM Taniya Das <tdas@codeaurora.org> wrote:
>
>
>
> On 3/19/2020 3:34 AM, Rob Herring wrote:
> > On Sun, 15 Mar 2020 00:19:56 +0530, Taniya Das wrote:
> >> The Modem Subsystem clock provider have a bunch of generic properties
> >> that are needed in a device tree. Add a YAML schemas for those.
> >>
> >> Add clock ids for GCC MSS and MSS clocks which are required to bring
> >> the modem out of reset.
> >>
> >> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> >> ---
> >>   .../devicetree/bindings/clock/qcom,sc7180-mss.yaml | 62 ++++++++++++++++++++++
> >>   include/dt-bindings/clock/qcom,gcc-sc7180.h        |  7 ++-
> >>   include/dt-bindings/clock/qcom,mss-sc7180.h        | 12 +++++
> >>   3 files changed, 80 insertions(+), 1 deletion(-)
> >>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml
> >>   create mode 100644 include/dt-bindings/clock/qcom,mss-sc7180.h
> >>
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml: $id: relative path/filename doesn't match actual path or filename
> >       expected: http://devicetree.org/schemas/clock/qcom,sc7180-mss.yaml#
> >
> > See https://patchwork.ozlabs.org/patch/1254940
> > Please check and re-submit.
> >
> Hi Rob,
>
> Thanks, I have fixed it in the next patch series.
>
> Is there a way to catch these before submitting? As I do not see these
> errors on my machine.

If you ran 'make dt_binding_check' already, then update dt-schema with pip.

Rob
