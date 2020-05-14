Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A999B1D3259
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 16:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbgENOMZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 10:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgENOMY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 10:12:24 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42290C061A0E
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 07:12:24 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 188so2736140lfa.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 07:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DkzKtHfHzDrv9acZGYhRUV9tmRVRbn6arGIc1dXkxBI=;
        b=XottLg9cQaTSjBHR11pedGRx+Glhzf+8Usg9K//kY6W0jNVJL1plss0LJBLgC3nXhz
         M7/NBircuUPinVKCHjYMUacfV2lTSjNWOTELV64WKqTIb+VoAHkWrKK+LyXiKxtTc91H
         EkpxcjLeryrGNDHr3ahfTehONNWh2vDTvJC3KrUAVwr5ekDS6uVYv5S8fYzsZqRMeDcg
         U9QIPtq8KUiqElnQ2rNtYXfrfX1ML51sOsdTUPKMJPSEfu+9xo31LZcyI4nCectwBKUP
         tA1N9H4f3nEE3y6yZE9MxWwkMpIknY1ov4rh2crp5UPVHztPX919W+E1wCHPIKL0EBRz
         aJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DkzKtHfHzDrv9acZGYhRUV9tmRVRbn6arGIc1dXkxBI=;
        b=hu4ZjXpOIqJTNq3/1NBovYLEl7OL0dJvHtBh5vCtffZ3mV3e8xy0YhNH4clbAGdZKF
         veB2u0P50G1c7b9weJQL64HiGUaha3WZk+xoAoakj+Cb4Rb+qkedPgGDO8Arue/0RXYl
         aWpZ29anqRzcuFnamE36Smw7djnJcPxoUcapsw64nw1sa0+AxidsNqVv5poRyWmWeKds
         Y3hSG1pNEmwpYQmDKFKnqrTQaS7lTokNHUF/9T8CUhSA+0X09ZJVnXmt+m4jG3L4mru8
         /0haJNL10CVMu/2i6SQnSBw/I4V1wti1WNE3ASvw7ChFeqPQdl/WMNTKZP+qoW8V2bH8
         WSEw==
X-Gm-Message-State: AOAM5322kh79Q+fjIMNAA0Cxr464CPijUdFMtN0ydUSJN5S4DuQMq7mD
        qGjviIfjTVX4HvntG2BtvVbuoVn58Lp1u9uCqjO273WB
X-Google-Smtp-Source: ABdhPJzbFJbGyW1QIZoQeEMNyecliP3FhYfrVVsA0/vlx9bAuXukGyGD9ZMmozQ02I6kOFg4AohML8Hs61aAnqoqEGA=
X-Received: by 2002:ac2:5e70:: with SMTP id a16mr3507458lfr.77.1589465542377;
 Thu, 14 May 2020 07:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200417061907.1226490-1-bjorn.andersson@linaro.org>
 <20200417061907.1226490-2-bjorn.andersson@linaro.org> <20200429213453.GA32114@bogus>
 <20200514060422.GL1302550@yoga>
In-Reply-To: <20200514060422.GL1302550@yoga>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 May 2020 16:12:10 +0200
Message-ID: <CACRpkdZpfgb0wwt2FUwqPab4XhtLXfDWOvZLdCc+NF-mVJkKYw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add sm8250 pinctrl bindings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 14, 2020 at 8:04 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Wed 29 Apr 14:34 PDT 2020, Rob Herring wrote:
> > On Thu, Apr 16, 2020 at 11:19:06PM -0700, Bjorn Andersson wrote:
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
> [..]
> > > +#PIN CONFIGURATION NODES
> > > +patternProperties:
> > > +  '^.*$':
> > > +    if:
> > > +      type: object
> > > +    then:
> >
> > Needs a $ref to the standard properties.
> >
> > Would be good to show a child node in the example too. (And try having
> > an error in a standard property type to verify you get an error).
> >
>
> Finally looked into this.

Can you send an incremental patch because otherwise I have
to revert the patch that I merged (maybe to trigger happy, mea culpa).

(If it's too hard I can just revert it.)

Yours,
Linus Walleij
