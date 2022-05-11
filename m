Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D912A5234BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 15:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbiEKNx6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 09:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241433AbiEKNx4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 09:53:56 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC18D2DD56
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 06:53:54 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id x17so4169431ybj.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 06:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EKBDsHZRYlf8FJ7KDE3y9NTurDd/YZ9iYNARovE8bGk=;
        b=qUPnKVqt3hQXN9yc2X6cSefiSUewR3oJ0bBSN7J35htxxkYxBBZ4qKZ9MWHm4JieOO
         akOeH7FyP+X2pxTipLoDydecNpskwP+cJvRsFV89R6Yz+VPaT1HmeBmQ/22yh2BbDXAu
         EdilNg5CBTD3IKrQlfl97rWmnN4XKp/+R/X2k2hllzOmzr0EGl3u4k4H4z0tw2HfWejj
         fFWg5j89aWwuVXF2N1eAya74m3uuSOeTSIKUDURGSCeY/GsHZhLJfWJuHH1xwjYXGlH8
         IHZ8mtGVQ2RrQMt5QGKvV+ZHvPkFdsC4IWyL1RBmiRPypHt7OtL4iMXlHdjwrKdFk+4A
         K/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EKBDsHZRYlf8FJ7KDE3y9NTurDd/YZ9iYNARovE8bGk=;
        b=0AxGVnd5c7SKSnoNshOWE8spiHkGvfIzbilrLdLHEsjDHssUWg6a7PKM82RwEUrcE4
         XUz+Ygkm/5xHRg29QSGARHeJtC5m9JZxPPiFwgfZ1V1ogUFnW0oZRscX6KvH3MpTLR/e
         4Fx6Kl/aR0G1wJ6lmwiJWdl+CrxpvogwOb0iYDIW5UBKrbYZYwyowPu7/nbUKbOdcg8a
         uypnrpgZhND1/Dasi/2NS7qH464wfH19IOzrUunaE1tYdyK1uHRwjKPbK0fTlZ5y1EaO
         L05PbrgMlKl0uSTypvtULTdatEOa5JChrV9NNVoEmBwQ4MewuLh3/U0RlwXqnA397Hd+
         M0BQ==
X-Gm-Message-State: AOAM530vT4DYz6PRflHIShFn0pS90unui33efK1BX/kFnSzZzGvpFT9d
        R2SjVYJfCI1tIhYZt3yth+wdgB4QumMaORxuVcLPkw==
X-Google-Smtp-Source: ABdhPJy4C8oSK2D5rm3zTpwR4XoY6AS+wh6T5Uf7ex4DN+vN2dIZy/VxRWvdleAWC0WsC5BlgDFjQQxUSIt85svwTYg=
X-Received: by 2002:a25:c206:0:b0:64a:7dfe:e714 with SMTP id
 s6-20020a25c206000000b0064a7dfee714mr22299152ybf.92.1652277233933; Wed, 11
 May 2022 06:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220506152107.1527552-1-dmitry.baryshkov@linaro.org>
 <YnqXxNxFhf/odyka@robh.at.kernel.org> <CAA8EJpriMcP4uQ3fjyiCKY+uc82ctXe2VrjO1psPDcp-P++Nhw@mail.gmail.com>
 <Ynu1p1hzqHJNpSp3@lpieralisi>
In-Reply-To: <Ynu1p1hzqHJNpSp3@lpieralisi>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 11 May 2022 16:53:43 +0300
Message-ID: <CAA8EJpoQ0TkY9zVzhB00f9iYKquPauF2JeapSECaPp3=eXWjsw@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] dt-bindings: YAMLify pci/qcom,pcie schema
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 11 May 2022 at 16:10, Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
>
> On Wed, May 11, 2022 at 01:13:28PM +0300, Dmitry Baryshkov wrote:
> > On Tue, 10 May 2022 at 19:50, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Fri, May 06, 2022 at 06:20:59PM +0300, Dmitry Baryshkov wrote:
> > > > Convert pci/qcom,pcie schema to YAML description. The first patch
> > > > introduces several warnings which are fixed by the other patches in the
> > > > series.
> > > >
> > > > Note regarding the snps,dw-pcie compatibility. The Qualcomm PCIe
> > > > controller uses Synopsys PCIe IP core. However it is not just fused to
> > > > the address space. Accessing PCIe registers requires several clocks and
> > > > regulators to be powered up. Thus it can be assumed that the qcom,pcie
> > > > bindings are not fully compatible with the snps,dw-pcie schema.
> > > >
> > > > Changes since v5:
> > > >  - s/stance/stanza (pointed out by Bjorn Helgaas)
> > > >
> > > > Changes since v4:
> > > >  - Change subjects to follow convention (suggested by Bjorn Helgaas)
> > > >
> > > > Changes since v3:
> > > >  - Rebase on linux-next to include sm8150 patches
> > > >
> > > > Changes since v2 (still kudos to Krzyshtof):
> > > >  - Readded reg-names conversion patch
> > > >  - Mention wake-gpio update in the commit message
> > > >  - Remove extra quotes in the schema
> > > >
> > > > Changes since v1 (all kudos to Krzyshtof):
> > > >  - Dropped the reg-names patch. It will be handled separately
> > > >  - Squashed the snps,dw-pcie removal (from schema) into the first patch
> > > >  - Replaced deprecated perst-gpio and wake-gpio with perst-gpios and
> > > >    wake-gpios in the examples and in DT files
> > > >  - Moved common clocks/clock-names, resets/reset-names and power-domains
> > > >    properties to the top level of the schema, leaving only platform
> > > >    specifics in the conditional branches
> > > >  - Dropped iommu-map/iommu-map-mask for now
> > > >  - Added (missed) interrupt-cells, clocks, clock-names, resets,
> > > >    reset-names properties to the required list (resets/reset-names are
> > > >    removed in the next patch, as they are not used on msm8996)
> > > >  - Fixed IRQ flags in the examples
> > > >  - Merged apq8064/ipq8064 into the single condition statement
> > > >  - Added extra empty lines
> > > >
> > > > Dmitry Baryshkov (8):
> > > >   dt-bindings: PCI: qcom: Convert to YAML
> > > >   dt-bindings: PCI: qcom: Do not require resets on msm8996 platforms
> > > >   dt-bindings: PCI: qcom: Specify reg-names explicitly
> > > >   dt-bindings: PCI: qcom: Add schema for sc7280 chipset
> > > >   arm64: dts: qcom: stop using snps,dw-pcie falback
> > > >   arm: dts: qcom: stop using snps,dw-pcie falback
> > > >   arm: dts: qcom-*: replace deprecated perst-gpio with perst-gpios
> > > >   arm64: dts: qcom: replace deprecated perst-gpio with perst-gpios
> > > >
> > > >  .../devicetree/bindings/pci/qcom,pcie.txt     | 398 ----------
> > > >  .../devicetree/bindings/pci/qcom,pcie.yaml    | 714 ++++++++++++++++++
> > >
> > > What tree do these apply to because they don't apply to rc1. I'm
> > > assuming the PCI tree and Lorenzo should take them.
> >
> > The series depends on the patch in Lorenzo's tree (sm8150 bindings),
> > so I'd assume it would be natural to merge these patches through his
> > tree too.
>
> I can take the DT bindings but the dts updates I'd prefer if they
> went via platform trees. Is that OK ?

Yes, that's fine with me. I think Bjorn has sent 5.19 pull request
already, I'll track them getting merged into 5.19 or 5.20.

>
> Thanks,
> Lorenzo



-- 
With best wishes
Dmitry
