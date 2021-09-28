Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42AC741B52F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 19:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242172AbhI1Rg3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 13:36:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:33778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242171AbhI1Rg3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 13:36:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BF0B60F21;
        Tue, 28 Sep 2021 17:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632850489;
        bh=Yfz08pV/gYDk+AOKJrmWrje1tFITZe7lHU+DG0nHe6Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=J3CdxDwHAF/IOVbYE4xxqV7Vv8NFVxTUJP/d0ax6bFYiBdgoclg3VgLO2tz+ndDj6
         +ALOO3Q4lykpwvkmwFGWwExz6DdJAFZ0iuB8bxFtyAKAThiJkG8mOrDBnUJsmwalX3
         lwc0oIQ9bR4XG7u3OK4l5ZmFbHZyRmtQD4YS1e4O/5IXOwXJDzD9lfJETjT+fqIR2T
         RjVotFLwDdAzOAsmhjNJm/i1OzlCBs1sihufF6ZcFyQ040TPXSWikvUK0ukHDMoa/L
         1G/yoeUpb86zY55GZYMIPkWr4xJIJswTPqkUkzXPoBAd8Qy7KdRa6vO9DtPgDTTXZ5
         kjEfswrDsJRPw==
Received: by mail-ed1-f50.google.com with SMTP id v10so82125349edj.10;
        Tue, 28 Sep 2021 10:34:49 -0700 (PDT)
X-Gm-Message-State: AOAM530Gy5f1Yzs1H78rU29janvahhEtul0GGW4UGzprPIKUVg0ss8tM
        S2NRq7SFZLPfMtiolM/WrNMtcoXMv3x45djf6A==
X-Google-Smtp-Source: ABdhPJySpBpXBtvPlQzRJSJ2jWwV4frZtniA8zfrmtuNaT8B9QSxRnDPopvqhpf1lHPNNHh2uyKCZ4Xxc1GjniBCCA0=
X-Received: by 2002:a17:906:7217:: with SMTP id m23mr7883864ejk.466.1632850487958;
 Tue, 28 Sep 2021 10:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210928044546.4111223-1-bjorn.andersson@linaro.org> <YVLszZ7U7D91oIH2@gerhold.net>
In-Reply-To: <YVLszZ7U7D91oIH2@gerhold.net>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 28 Sep 2021 12:34:35 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+66j8Y5y+PQ+mezkaxN1pfHFKz524YUF4Lz_OU5E-mZQ@mail.gmail.com>
Message-ID: <CAL_Jsq+66j8Y5y+PQ+mezkaxN1pfHFKz524YUF4Lz_OU5E-mZQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: soc: smem: Make indirection optional
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 28, 2021 at 5:22 AM Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Mon, Sep 27, 2021 at 09:45:44PM -0700, Bjorn Andersson wrote:
> > In the olden days the Qualcomm shared memory (SMEM) region consisted of
> > multiple chunks of memory, so SMEM was described as a standalone node
> > with references to its various memory regions.
> >
> > But practically all modern Qualcomm platforms has a single reserved memory
> > region used for SMEM. So rather than having to use two nodes to describe
> > the one SMEM region, update the binding to allow the reserved-memory
> > region alone to describe SMEM.
> >
> > The olden format is preserved as valid, as this is widely used already.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  .../bindings/soc/qcom/qcom,smem.yaml          | 34 ++++++++++++++++---
> >  1 file changed, 30 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> > index f7e17713b3d8..4149cf2b66be 100644
> > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> > [...]
> > @@ -43,6 +55,20 @@ examples:
> >          #size-cells = <1>;
> >          ranges;
> >
> > +        smem@fa00000 {
>
> I think this is a good opportunity to make a decision which node name
> should be used here. :)

reserved-memory node names are kind of a mess, so I haven't tried for
any standard... It needs to be solved globally.

>
> You use smem@ here but mentioned before that you think using the generic
> memory@ would be better [1]. And you use memory@ in PATCH 3/3:
>
> -               smem_mem: memory@86000000 {
> +               memory@86000000 {
> +                       compatible = "qcom,smem";
>                         reg = <0x0 0x86000000 0 0x200000>;
>                         no-map;
> +                       hwlocks = <&tcsr_mutex 3>;
>                 };
>
> However, if you would use memory@ as example in this DT schema,
> Rob's bot would complain with the same error that I mentioned earlier [2]:
>
> soc/qcom/qcom,smem.example.dt.yaml: memory@fa00000: 'device_type' is a required property
>         From schema: dtschema/schemas/memory.yaml
>
> We should either fix the error when using memory@ or start using some
> different node name (Stephen Boyd suggested shared-memory@ for example).
> Otherwise we'll just keep introducing more and more dtbs_check errors
> for the Qualcomm device trees.

A different node name. A node name should only have 1 meaning and
'memory' is already defined.

The main issue here is what to name nodes with only a size and no address.

Rob
