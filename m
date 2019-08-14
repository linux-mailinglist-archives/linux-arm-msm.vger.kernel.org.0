Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D06018E12E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 01:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729560AbfHNXRf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 19:17:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:44726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726619AbfHNXRe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 19:17:34 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A71602064A;
        Wed, 14 Aug 2019 23:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565824653;
        bh=BUMuEhOekuNlkYRAPWto4vz/PFkEh8/udVJlZ/2FMfQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TNIYJcpc9E5yZe+W8EW8pzrIUrTZdlNLcsF70EIrX66vuqM3DG3dqjSBKrSBDGaxI
         V7pPWBS738oN4A1MkWBpvgFAkES64o2s6b8Rp7egXwEAeaScGzIwOdypEh6dbGj4f0
         2aZO3wLGktmvbG7M8X6+Ts+zQJP8QlZS4GeAM9v4=
Received: by mail-qt1-f175.google.com with SMTP id i4so510981qtj.8;
        Wed, 14 Aug 2019 16:17:33 -0700 (PDT)
X-Gm-Message-State: APjAAAXOhMvR1BaKiANCXD+EcE8Eowy/anxAUop+0GXmEqJO2e3xj3JR
        O+GGn9t4wp/8hVMLOHdHds79u4i4TxjpXih76w==
X-Google-Smtp-Source: APXvYqyqANOhCBTSqCHZQm3woQMeO+/sPNecgEttTGuUZUASkIbB6R5eX3jJtqE3kNGHnL1T4gxQb4JLTzhQA8pU+ck=
X-Received: by 2002:ac8:44c4:: with SMTP id b4mr1565641qto.224.1565824652855;
 Wed, 14 Aug 2019 16:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190813130946.16448-1-govinds@codeaurora.org>
 <20190813130946.16448-2-govinds@codeaurora.org> <CAL_JsqK-GK8arfRu6sqP9UjNrwc0=aUWXymMRF5fQhg+M2TNng@mail.gmail.com>
 <20190814064126.GV26807@tuxbook-pro>
In-Reply-To: <20190814064126.GV26807@tuxbook-pro>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 14 Aug 2019 17:17:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKaZJ1asHynSJg45nJf8Jtj7MmC_OsVtPjNzf8nat1jrg@mail.gmail.com>
Message-ID: <CAL_JsqKaZJ1asHynSJg45nJf8Jtj7MmC_OsVtPjNzf8nat1jrg@mail.gmail.com>
Subject: Re: [v2 1/2] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock
 controller bindings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Govind Singh <govinds@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 14, 2019 at 12:39 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 13 Aug 06:43 PDT 2019, Rob Herring wrote:
>
> > On Tue, Aug 13, 2019 at 7:10 AM Govind Singh <govinds@codeaurora.org> wrote:
> > >
> > > Add devicetree binding for the Q6SSTOP clock controller found in QCS404.
> >
> > You need to test this with 'make dt_binding_check' and fix the errors.
> >
> > >
> > > Signed-off-by: Govind Singh <govinds@codeaurora.org>
> > > ---
> > >  .../bindings/clock/qcom,q6sstopcc.yaml        | 45 +++++++++++++++++++
> > >  1 file changed, 45 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> > > new file mode 100644
> > > index 000000000000..861e9ba97ca3
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> > > @@ -0,0 +1,45 @@
> > > +# SPDX-License-Identifier: BSD-2-Clause
> >
> > GPL-2.0-only OR BSD-2-Clause
> >
>
> Is this a requirement of the devicetree project?

More like my preference.

> Wouldn't the BSD
> license alone be sufficient for the type of interoperability that we're
> striving for?

Yes. However, folks like to copy and paste and forget to pay attention
to the license. So we'll end up with GPL licensed code copied into BSD
licensed code. Dual license doesn't completely solve that, but helps
somewhat IMO.

Rob
