Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A57941ADFF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 16:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726868AbgDQObd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 10:31:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:53196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726065AbgDQObc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 10:31:32 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E0ABF2223C;
        Fri, 17 Apr 2020 14:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587133892;
        bh=pT6+doLxhDBboeLR9o8Dpw1tvc89tREvWl1biQA46lM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gkh6DENAZFbDzJIf3gFlleyZJHAgpIxRXuIbcQaYJRwCKVr5jxuSl5wprhsHK8NQv
         d70cg4H/hlDv7pzVdq0X9RSmWonyibSgmMLQVrRgpQCNjkdh7j9FH4xNyqYZgK+ya1
         BlDA5SWyRdDvV/b1wK2lwC9TpR2q0Mgy4dAk/xCs=
Received: by mail-qt1-f177.google.com with SMTP id x8so870257qtp.13;
        Fri, 17 Apr 2020 07:31:31 -0700 (PDT)
X-Gm-Message-State: AGi0PuZrs86WVckx3vkSdLOF8oUK8m+P+M8JjcMNG1xcO1yqCXswpky/
        b6jyV/LRHGHCwqXMMjwts1BjjR/UzYNwFpbxfw==
X-Google-Smtp-Source: APiQypIyrumUQTKQyuwVJdKoY42ZUrD4HU0jijHUYuJE36Rvv09bfA43tUGFPkwi5wV/2LSEiXno09uVRo0AKF6NNfE=
X-Received: by 2002:ac8:6695:: with SMTP id d21mr3248533qtp.110.1587133890922;
 Fri, 17 Apr 2020 07:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586359676.git.mchehab+huawei@kernel.org>
 <24b30222392569e7aa5d61d46642a4c38a964512.1586359676.git.mchehab+huawei@kernel.org>
 <87h7xicvht.fsf@kernel.org>
In-Reply-To: <87h7xicvht.fsf@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 17 Apr 2020 09:31:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLrKYTJTiPrzJAR7M-uCVa-S8sLMWUL4Xcy9x=XsY8mcg@mail.gmail.com>
Message-ID: <CAL_JsqLrKYTJTiPrzJAR7M-uCVa-S8sLMWUL4Xcy9x=XsY8mcg@mail.gmail.com>
Subject: Re: [PATCH 28/35] docs: dt: qcom,dwc3.txt: fix cross-reference for a
 converted file
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 17, 2020 at 4:27 AM Felipe Balbi <balbi@kernel.org> wrote:
>
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
>
> > The qcom-qusb2-phy.txt file was converted and renamed to yaml.
> > Update cross-reference accordingly.
> >
> > Fixes: 8ce65d8d38df ("dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy bindings to yaml")
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/usb/qcom,dwc3.txt | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> > index cb695aa3fba4..fbdd01756752 100644
> > --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> > +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
> > @@ -52,8 +52,8 @@ A child node must exist to represent the core DWC3 IP block. The name of
> >  the node is not important. The content of the node is defined in dwc3.txt.
> >
> >  Phy documentation is provided in the following places:
> > -Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt   - USB3 QMP PHY
> > -Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt - USB2 QUSB2 PHY
> > +Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt    - USB3 QMP PHY
> > +Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml - USB2 QUSB2 PHY
> >
> >  Example device nodes:
>
> Should I take this or will it go via e.g. trivial?

I already queued up v2 of this.

>
> In any case:
>
> Acked-by: Felipe Balbi <balbi@kernel.org>
>
> --
> balbi
