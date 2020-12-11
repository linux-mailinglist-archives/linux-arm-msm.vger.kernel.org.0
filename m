Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3919C2D80DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 22:17:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395392AbgLKVOY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Dec 2020 16:14:24 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42075 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395061AbgLKVNt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Dec 2020 16:13:49 -0500
Received: by mail-ot1-f65.google.com with SMTP id 11so9529589oty.9;
        Fri, 11 Dec 2020 13:13:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qT7CCI1tZEGzvS2A0x9Rs75/poGHPdnJSJtxrhXJMz4=;
        b=ipqkB5YtdkHg/J9QeIrmitRz6ldTuOc08YVbCTJ5bIa0/WQArmoNnJmo1aYusrwP9l
         WsPNz6Lk+xZB4qhgdzxOL4yyJy3mQwpmCky1rjcHZXMffcYOAY1Mwg0SRomTY8KZzXaj
         BMIqQ69F1zybEeMAjec/QwQkrm5Cf3xvtE44OshKy+Ys1oBPTzt1DG+9q1ziIN5iPGLf
         /f9Ldd7zSCrGPs8P+Q5qYUZ7SwxkeAtSuLkg7oMNYn3EDewexMdO+0suVO+8qWBEqYj1
         99TIkZhP9NuIvL3OtRa3sXbEO/eAVttRXGJj9OwuLCIPPD5lXYvTBQjNLeXRYUOpjNTQ
         Bg4A==
X-Gm-Message-State: AOAM530x6eCk4CZbo2f4vAaWSXuW3U7i3zfHDWSCpB8JS/5ylWM0JEIj
        tecBjwm5rQMGQ6fZIeUAfAyxCIqhOA==
X-Google-Smtp-Source: ABdhPJzadab1s51cOEGqHNNoMqzstzxiaT6kBUcKFKOA9xfhw3HsL7xzFL4OlizXiHn+skrGzvBcLQ==
X-Received: by 2002:a9d:4c8d:: with SMTP id m13mr9135456otf.229.1607721187996;
        Fri, 11 Dec 2020 13:13:07 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c18sm2090517oib.31.2020.12.11.13.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 13:13:06 -0800 (PST)
Received: (nullmailer pid 957502 invoked by uid 1000);
        Fri, 11 Dec 2020 21:13:05 -0000
Date:   Fri, 11 Dec 2020 15:13:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: mtd: partitions: Add binding for
 Qcom SMEM parser
Message-ID: <20201211211305.GA955193@robh.at.kernel.org>
References: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
 <20201119071308.9292-2-manivannan.sadhasivam@linaro.org>
 <20201207215236.GB892840@robh.at.kernel.org>
 <20201211033140.GA4222@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211033140.GA4222@work>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 11, 2020 at 09:01:40AM +0530, Manivannan Sadhasivam wrote:
> On Mon, Dec 07, 2020 at 03:52:36PM -0600, Rob Herring wrote:
> > On Thu, Nov 19, 2020 at 12:43:05PM +0530, Manivannan Sadhasivam wrote:
> > > Add YAML binding for Qualcomm Shared Memory (SMEM) Flash partition
> > > parser.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  .../mtd/partitions/qcom,smem-part.yaml        | 33 +++++++++++++++++++
> > >  1 file changed, 33 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> > > new file mode 100644
> > > index 000000000000..cf3f8c1e035d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> > > @@ -0,0 +1,33 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mtd/partitions/qcom,smem-part.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm SMEM NAND flash partition parser binding
> > > +
> > > +maintainers:
> > > +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > +
> > > +description: |
> > > +  The Qualcomm SoCs supporting the NAND controller interface features a Shared
> > > +  Memory (SMEM) based partition table scheme. The maximum partitions supported
> > > +  varies between partition table revisions. V3 supports maximum 16 partitions
> > > +  and V4 supports 48 partitions.
> > 
> > V3 vs. V4 (and any other version for that matter) is discoverable?
> > 
> 
> Yes, it is discoverable based on the partition header and we do that in
> the parser.

Okay,

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> Thanks,
> Mani
> 
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,smem-part
> > > +
> > > +required:
> > > +  - compatible
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    flash {
> > > +        partitions {
> > > +            compatible = "qcom,smem-part";
> > > +        };
> > > +    };
> > > -- 
> > > 2.17.1
> > > 
