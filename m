Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50470F98DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 19:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726978AbfKLShS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 13:37:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:55880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726952AbfKLShS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 13:37:18 -0500
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B7B721D7F;
        Tue, 12 Nov 2019 18:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573583837;
        bh=ClsBijm+tV2ywGmWiMMRKvlFiYq/cLBsl5lNg89WwmM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vruLFu7ENpBlykbdo/Y+H4Y3SP/8xiOwkSOXipue5AFlMZwYISAABQGOsHRNX+597
         +BUbMZ7NOeZabQG+6KyrNEOUdKZ7Wu2bXUIFXcHZn326+LfItqW7K6t+9Vi1JBZKfo
         1p9mW8cdtnPZCRvc3FliDt5E/x7ikMvQHP0WuySQ=
Received: by mail-qk1-f182.google.com with SMTP id e187so15389481qkf.4;
        Tue, 12 Nov 2019 10:37:17 -0800 (PST)
X-Gm-Message-State: APjAAAVSB2Uq+isYQHCsx8iS6wzu0kY0j1YD8fnye0BEWD6M6FctY/qi
        LVOVpcIN81pWn1lpTUNmZLo1nTcB5TKu8/NWzA==
X-Google-Smtp-Source: APXvYqy4jjbxFKDPV7vSCOnen2eNnt02ZnVZpXB+MPur6jIpEK2TUR0oOqnkMSo4LuntV0L3+UCZlhm9vRywGKUM/gM=
X-Received: by 2002:ae9:dd83:: with SMTP id r125mr8603172qkf.223.1573583836697;
 Tue, 12 Nov 2019 10:37:16 -0800 (PST)
MIME-Version: 1.0
References: <1573254987-10241-1-git-send-email-jhugo@codeaurora.org>
 <1573255036-10302-1-git-send-email-jhugo@codeaurora.org> <20191112004417.GA16664@bogus>
 <3e4b1342-7965-2d80-e28d-0cb728037abd@codeaurora.org>
In-Reply-To: <3e4b1342-7965-2d80-e28d-0cb728037abd@codeaurora.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 12 Nov 2019 12:37:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ3R0Y-KPKaknVT=+RTAskGhqmarb=i9ZDyX5-LzoFOjg@mail.gmail.com>
Message-ID: <CAL_JsqJ3R0Y-KPKaknVT=+RTAskGhqmarb=i9ZDyX5-LzoFOjg@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] dt-bindings: clock: Document external clocks for
 MSM8998 gcc
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 12, 2019 at 10:25 AM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> On 11/11/2019 5:44 PM, Rob Herring wrote:
> > On Fri, Nov 08, 2019 at 04:17:16PM -0700, Jeffrey Hugo wrote:
> >> The global clock controller on MSM8998 can consume a number of external
> >> clocks.  Document them.
> >>
> >> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> >> ---
> >>   .../devicetree/bindings/clock/qcom,gcc.yaml        | 47 +++++++++++++++-------
> >>   1 file changed, 33 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> >> index e73a56f..2f3512b 100644
> >> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> >> @@ -40,20 +40,38 @@ properties:
> >>          - qcom,gcc-sm8150
> >>
> >>     clocks:
> >> -    minItems: 1
> >
> > 1 or 2 clocks are no longer allowed?
>
> Correct.
>
> The primary reason is that Stephen indicated in previous discussions
> that if the hardware exists, it should be indicated in DT, regardless if
> the driver uses it.  In the 7180 and 8150 case, the hardware exists, so
> these should not be optional.

Agreed. The commit message should mention this though.

>
> The secondary reason is I found that the schema was broken anyways.  In
> the way it was written, if you implemented sleep, you could not skip
> xo_ao, however there is a dts that did exactly that.

If a dts can be updated in a compatible way, we should do that rather
than carry inconsistencies into the schema.

> The third reason was that I couldn't find a way to write valid yaml to
> preserve the original meaning.  when you have an "items" as a subnode of
> "oneOf", you no longer have control over the minItems/maxItems, so all 3
> became required anyways.

That would be a bug. You're saying something like this doesn't work?:

oneOf:
  - minItems: 1
    maxItems: 3
    items:
      - const: a
      - const: b
      - const: c

>  I find it disappointing that the "version" of
> Yaml used for DT bindings is not documented,

Not sure which part you mean? json-schema is the vocabulary which has
a spec. The meta-schema then constrains what the json-schema structure
should look like. That's still evolving a bit as I try to improve it
based on mistakes people make. Then there's the intermediate .dt.yaml
format used internally. That's supposed to stay internal and may go
away when/if we integrate the validation into dtc.

> so after several hours of
> trial and error, I just gave up since I found this to work (failed cases
> just gave me an error with no indication of what was wrong, not even a
> line number).

Schema failures or dts failures? It is possible to get line numbers
for either, but that makes validation much slower. In the latter case,
the line numbers aren't too useful either given they are for the
.dt.yaml file and not the .dts source file (dtc integration would
solve that). Adding '-n' to dt-doc-validate or dt-validate will turn
them on though.

Yes, error messages need work. I have some idea how to improve them,
but haven't had time to implement. Too many binding reviews... You can
get more detail with '-v' option. It's *way* more verbose, but not
necessarily more useful.

Rob
