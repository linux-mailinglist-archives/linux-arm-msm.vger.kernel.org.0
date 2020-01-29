Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C357314D398
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 00:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgA2X0d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 18:26:33 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:33912 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgA2X0d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 18:26:33 -0500
Received: by mail-vs1-f66.google.com with SMTP id g15so989380vsf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2020 15:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i7N+u7jIEmW2dEm6HMr/PJpc28EuZkXAo6+795EdEII=;
        b=BcPiQZ5SuJEvE1fQj57PZ+wzmmd808hNTnOOB4AlJVy5FOFhfMhZ+eYc5VslB0c9p7
         HWIZA9A3sPKouTjZOwZA0VIgpcHe4dXyeW66GQcjrOoysN1VklosEVlDkDgnXaTfNQWR
         tV1nUX1/Ny+DJaWid/uedWBQVBp/0+6z+ajuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i7N+u7jIEmW2dEm6HMr/PJpc28EuZkXAo6+795EdEII=;
        b=kTWmn/EZc9ujGpNkwNRmK68gWtmAQGfdLe06fvdR9Bx4GguDUFO4jVgBxXD6uOGzxt
         lIUv++VYnjj9FGNR/zukIZgNUz/TIVBU3u8o8WCL2zCWXpYylOMngRCjTeo1C6WH0QS5
         tP2R2UsmQFDXRRZPncigMPUBczZArvSPZ3TDDDNDI2yal96nWE2EaFPlBrmrCosYadwF
         TvpCVzbFsunzalJZXaSoozj5Berh+k/Z3NX4fCuvC4qJQ0EZAp5CvIE/d32sdLvEh4aU
         M6vxbsOqUuE1syqXI2frqNAtnoV07w36U5V4UHqklx6rC1gbrcFFWtTKJpRhH9g7pONr
         ydFg==
X-Gm-Message-State: APjAAAUpendvTFPMt0aHYQlKiBeSFlNXZdGawX7PO+SzlfA4wBQS2Y9N
        jgxc2WKXITqaUuZzKdxFHBCulGbtutE=
X-Google-Smtp-Source: APXvYqwiLvMcLem7VCYisT5mxH67wGd65lzziDVfi6xVjt5Vr7+dOedcuUG1T88fqSjQYS8zoAXG2g==
X-Received: by 2002:a67:fd56:: with SMTP id g22mr1418453vsr.67.1580340391514;
        Wed, 29 Jan 2020 15:26:31 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id g22sm932625vsr.24.2020.01.29.15.26.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2020 15:26:30 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id f7so432337uaa.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2020 15:26:29 -0800 (PST)
X-Received: by 2002:ab0:30c2:: with SMTP id c2mr955764uam.8.1580340388829;
 Wed, 29 Jan 2020 15:26:28 -0800 (PST)
MIME-Version: 1.0
References: <20200129132313.1.I4452dc951d7556ede422835268742b25a18b356b@changeid>
 <CAL_JsqJk1NZSDAXgqc-CS9a1UCmNYPhC-LwjPUZaX2oK=EtHzQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJk1NZSDAXgqc-CS9a1UCmNYPhC-LwjPUZaX2oK=EtHzQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 29 Jan 2020 15:26:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XLq4-EdsuKnDjuc3-6P3i6o-tV5MJbdFbvAscF_ouOpg@mail.gmail.com>
Message-ID: <CAD=FV=XLq4-EdsuKnDjuc3-6P3i6o-tV5MJbdFbvAscF_ouOpg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clk: qcom: Fix self-validation, split, and
 clean cruft
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Abhishek Sahu <absahu@codeaurora.org>, sivaprak@codeaurora.org,
        anusharao@codeaurora.org, Sricharan <sricharan@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jan 29, 2020 at 2:01 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Wed, Jan 29, 2020 at 3:23 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > The 'qcom,gcc.yaml' file failed self-validation (dt_binding_check)
> > because it required a property to be either (3 entries big),
> > (3 entries big), or (7 entries big), but not more than one of those
> > things.  That didn't make a ton of sense.
> >
> > This patch splits all of the exceptional device trees (AKA those that
> > would have needed if/then/else rules) from qcom,gcc.yaml.  It also
> > cleans up some cruft found while doing that.
> >
> > After this lands, this worked for me atop clk-next:
> >   for f in \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc.yaml; do \
> >       ARCH=arm64 make dt_binding_check DT_SCHEMA_FILES=$f; \
> >       ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=$f; \
> >   done
>
> Note that using DT_SCHEMA_FILES may hide some errors in examples as
> all other schemas (including the core ones) are not used for
> validation. So just 'make dt_binding_check' needs to pass (ignoring
> any other unrelated errors as it breaks frequently). Supposedly a
> patch is coming explaining this in the documentation.

That seems like it's going to be a huge pain going forward, but OK.  I
kept running "dtbs_check" with the DT_SCHEMA_FILES since I guess this
was OK?  Then I ran this atop next-20200129:

# Delete broken yaml:
rm Documentation/devicetree/bindings/pci/intel-gw-pcie.yaml
ARCH=arm64 make dt_binding_check | grep 'clock/qcom'

...and that seemed OK to me.  I've updated the commit message to
include what I did.  Hopefully it's right.

> > +  nvmem-cell-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +    description:
> > +      Names for each nvmem-cells specified.
>
> Isn't that every instance? So drop.

Dropped the description here.

> Otherwise, assuming it all works:
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks.  v2 now with your feedback and Jeffrey's at:
http://lore.kernel.org/r/20200129152458.v2.1.I4452dc951d7556ede422835268742b25a18b356b@changeid
