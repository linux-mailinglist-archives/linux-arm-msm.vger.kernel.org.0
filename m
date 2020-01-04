Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37FE31304E8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2020 23:18:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgADWR4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Jan 2020 17:17:56 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:36895 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgADWR4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Jan 2020 17:17:56 -0500
Received: by mail-pj1-f67.google.com with SMTP id m13so6143493pjb.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jan 2020 14:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DEBz57acu79PpJzbHmINvmB6pHsGF9jsUkflqEc9cZc=;
        b=jef/4kLN7gmjIG5y7cMPXd9sgV1gz82Ie34ZuGAXUNxnF3/5MRaUBghYM3dTb9UMhA
         JkOp7O7x69t4tGI+Yvnzim3bFESetPXZ0w6Dtal+D66+qf2JBcqWFgQTm4Id7QD18ax2
         qRbYPG54T8ffnhxvWsuApO5wLNVhDFvbz0GeC84ZXcNmiZ6W45VcBQCnAKS7Ew7lTFIn
         snFQVmsNAChDqMfCO213Sj3XJpgPIE8Xh5SOa+73HniJVBBi7EUcZtmqzKSa1bgM53G0
         YK76d0WxNa7DoGj693NwY9q9//aPc9vqsigQR882H6fw/kvyM1BxGfG9o3iswYZ3zBmx
         Blvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DEBz57acu79PpJzbHmINvmB6pHsGF9jsUkflqEc9cZc=;
        b=OcoH0M3KP6zvWY0VFp6eW9NQvon+VZkD7UQ35GVs1m/G5I1YnMpbrU7+W8rpUVLr7o
         MrqHYCKHH5d1MOCp8TvH9/TDiAZI9331PvYHHVddCF0zGGrmd/INEAEvVbu9LO9MZj8f
         aD28d3Aj5s2vJbwVhyJde2HLQ6J3HRz5vZhvD31qEfhwk+3Ciwr94PZbqxuqyMm3uX7g
         att5cnty7kLBHEd+pJGdj6JNqEluArt2aROdiX+5AW2TtJCSd3DKDbn3LaORPfK4+WVG
         YVA+adSAvEQNZWNgSznqPGDvjwD7S9IDceCJsxeN+jZZUA0dHkW/mXM4BL7mJpXKuOsW
         gB9g==
X-Gm-Message-State: APjAAAUCgjb3kOveV8kPLg29ujTgxaNMfoex1gnuX0B+7lzdR+zKVTy+
        8GibpgLCrADRQdtAGaBHDUh9QA==
X-Google-Smtp-Source: APXvYqwTtxz5kIj0HbeC6t0/7lu8SzyAJBdBdyKP+GKTprLOZqA8q9/o4LeUShPs/bhyvPbJbocEKQ==
X-Received: by 2002:a17:90a:d50:: with SMTP id 16mr34957577pju.117.1578176275568;
        Sat, 04 Jan 2020 14:17:55 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id n1sm72740640pfd.47.2020.01.04.14.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 14:17:54 -0800 (PST)
Date:   Sat, 4 Jan 2020 14:17:52 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: remoteproc: Add Qualcomm PIL info
 binding
Message-ID: <20200104221752.GW549437@yoga>
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-2-bjorn.andersson@linaro.org>
 <20200104213804.GA30385@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200104213804.GA30385@bogus>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 04 Jan 13:38 PST 2020, Rob Herring wrote:

> On Thu, Dec 26, 2019 at 09:32:08PM -0800, Bjorn Andersson wrote:
> > Add a devicetree binding for the Qualcomm periperal image loader
> > relocation info region found in the IMEM.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Changes since v1:
> > - New patch
> > 
> >  .../bindings/remoteproc/qcom,pil-info.yaml    | 35 +++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> > new file mode 100644
> > index 000000000000..715945c683ed
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> > @@ -0,0 +1,35 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/remoteproc/qcom,pil-info.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Qualcomm peripheral image loader relocation info binding
> > +
> > +description:
> > +  This document defines the binding for describing the Qualcomm peripheral
> > +  image loader relocation memory region, in IMEM, which is used for post mortem
> > +  debugging of remoteprocs.
> > +
> > +maintainers:
> > +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,pil-reloc-info
> > +
> > +  offset:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Offset in the register map for the memory region
> 
> Why not use 'reg' instead?
> 

Because we have one prior example of subdevice of "imem", which is
compatible "syscon-reboot-mode" and that binding uses "offset".

That said, if you insist, reg (and ranges) would allow us to express the
size of the region...

Regards,
Bjorn

> > +
> > +examples:
> > +  - |
> > +    imem@146bf000 {
> > +      compatible = "syscon", "simple-mfd";
> > +      reg = <0 0x146bf000 0 0x1000>;
> > +
> > +      pil-reloc {
> > +        compatible ="qcom,pil-reloc-info";
> > +        offset = <0x94c>;
> > +      };
> > +    };
> > -- 
> > 2.24.0
> > 
