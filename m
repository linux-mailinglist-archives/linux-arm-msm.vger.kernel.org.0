Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79BC3113482
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2019 19:25:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729720AbfLDSB5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 13:01:57 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41991 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729275AbfLDSB4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 13:01:56 -0500
Received: by mail-ed1-f67.google.com with SMTP id e10so143607edv.9;
        Wed, 04 Dec 2019 10:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mvp9L8yGr+7Q73cf5DiMFkH0tKxVcTrdu8kuP8KT/wA=;
        b=AnLIlKDxiENCXMUrbqTM8dDUPRPRHtCYpWJQ8og66XUs0vdaxN8hGdg8m117J2krEJ
         SJ2rAhNZms6onCSAEhb1qbbpGHdAC1mNwB1yBzp4a46YCvh4DYplVBpVi9hnAnUdTk3V
         7u+AMPmaRBp2zv5wG50ryD9qcrQW5TYYYwRmOFGRps5AMuyfZUiqtmkQZCMW1y1LJeOa
         DRVwsjJb7aZBa4lcDk/NWOrtV9UDX2xwfA8hVKNB2z+B1q8U/7/BNl9KF3mOCI0qisZE
         E+Pm16Xc42UW7lkGqqQY1hd/GGQfyoVxJXRWw9ipzYEk34PlwrqXzIRMfYLNeN/9jAsg
         NaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mvp9L8yGr+7Q73cf5DiMFkH0tKxVcTrdu8kuP8KT/wA=;
        b=EEYwIaKxo8kTZrJJuv1zBAzl97GY1n6+NM7G8zOqAg6JMNN+ZzGkgAypPSHNQaBzRd
         0BqKpgayJBvbveJcakn6zAdPkDrw10Ct/MGguGy0TF6gMhLava5/u7ECBnDzPXUOTNXK
         abnPnK5hkIISiDM0uPpASsGiKQsED5I3ggNCAOjD6PaH/ycjr568bU+s1iR+AFF/GaxF
         aumXaQg7L5qFUWbGuxxtppEpE9nasNVCf1POGtqnfRE5goPa5gHdWjdPFpK3jQuLx80K
         5dg7gQXpzp+YVCs7RlVPWyMIgKSdsvjMfuuYvgdvr0nVPwsZFa/BkZI05SgVDZHFQr+a
         /Atg==
X-Gm-Message-State: APjAAAWduixBQLK/55H3wzIFnnyN0FLvHMGhsrPcukO3KvOniCyD7NN8
        PPpD+xD9moCccQox8dXLveshkeScr4ULOhfHzhSdNw==
X-Google-Smtp-Source: APXvYqyH+H1j/zREsxP/LJQ/Q6PhP0dprWgGzUYK4IWlJ02sNpCzzk2ec/2tRbkR3GG2lr++MiA4m7gV4rTsfvod+5U=
X-Received: by 2002:aa7:d64f:: with SMTP id v15mr5520399edr.71.1575482513957;
 Wed, 04 Dec 2019 10:01:53 -0800 (PST)
MIME-Version: 1.0
References: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org>
 <0101016e95751c0b-33c9379b-6b8c-43b1-8785-e5e1b6f084f1-000000@us-west-2.amazonses.com>
 <3a283a7c-df75-a30a-1bcb-74e631f06a71@arm.com>
In-Reply-To: <3a283a7c-df75-a30a-1bcb-74e631f06a71@arm.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 4 Dec 2019 10:01:42 -0800
Message-ID: <CAF6AEGuxgUQNuSQVECiUzpj4DM0R7UYme0Q9ggF1a=JCxAJsBA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: arm-smmu: Add Adreno GPU variant
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Will Deacon <will@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 4, 2019 at 7:56 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 22/11/2019 11:31 pm, Jordan Crouse wrote:
> > Add a compatible string to identify SMMUs that are attached
> > to Adreno GPU devices that wish to support split pagetables.
>
> A software policy decision is not, in itself, a good justification for a
> DT property. Is the GPU SMMU fundamentally different in hardware* from
> the other SMMU(s) in any given SoC?

The GPU CP has some sort of mechanism to switch pagetables.. although
I guess under the firmware it is all the same.  Jordan should know
better..

BR,
-R

> (* where "hardware" may encompass hypervisor shenanigans)
>
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> >
> >   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > index 6515dbe..db9f826 100644
> > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > @@ -31,6 +31,12 @@ properties:
> >                 - qcom,sdm845-smmu-v2
> >             - const: qcom,smmu-v2
> >
> > +      - description: Qcom Adreno GPU SMMU iplementing split pagetables
> > +        items:
> > +          - enum:
> > +              - qcom,adreno-smmu-v2
> > +          - const: qcom,smmu-v2
>
> Given that we already have per-SoC compatibles for Qcom SMMUs in
> general, this seems suspiciously vague.
>
> Robin.
>
> > +
> >         - description: Qcom SoCs implementing "arm,mmu-500"
> >           items:
> >             - enum:
> >
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
