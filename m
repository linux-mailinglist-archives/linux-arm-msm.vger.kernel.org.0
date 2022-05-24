Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97793532EC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 May 2022 18:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234263AbiEXQR6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 May 2022 12:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238189AbiEXQR5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 May 2022 12:17:57 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0301F6351B
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 09:17:54 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id l82so10694920qke.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 09:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BhPMIMKm3oqRgguHsuNtSYGSlsO/9zDolBwP/Ko+Row=;
        b=Vhfzv8hCjZGdMLfJpF1gHyYVorPhyAn1ailCZiEKjs+nKJ0bThReHko4o6O46XWDgU
         VAkArpBtXEp9FJAUT3sqGQ4Id6FTGzzooEVfWtbUXkTlbur0iDDQRfMIn5zxPfj9mewZ
         rIAia8s66hOTre43OheKAZdFwsVcPF1XxAtcDQ9CnI0DZbYMZEbCpQVwwQ9orWhYHXDe
         3JIS+4KN70QQcYWSNyfPIhUUV+XzCm2lw6FxS+WlEF3FCKhLGya4y1FOLVSg5Un3kV/g
         MeYqI/bMlxHhXbupwFwnTgjP7BTlua0oF136OmJW5DSjV0e95fIiITh/9nheAGuxJzzu
         06Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BhPMIMKm3oqRgguHsuNtSYGSlsO/9zDolBwP/Ko+Row=;
        b=I7aH7WEJkv5Xp8wRhm5Ear7V3GTbJEc6eEaJYbcju/sPloluSaeeLwsG02qJvA05Tj
         be9XJ8nIEq/AGlRCSBMztA3HYgTEZwY/cmZ/5QFeu/YQAQigF/rcl9Xy2Ol50lUQKCti
         BJT0Hy/dRPDzJ8ktpqFz2WACaYBZODio2SO19/tzeNQR4snlxNvowEdBEEbqnoCL0jjh
         NIM8rlpff/W6lZMQbu6KqX39znRhwnY5ZVzYugCbHFStu1CERTpOs5rj1p7WLdbOXHZq
         hfFnYk1+4gGP/jZ9PKXhpCAubl98UrnHJRxRRxjQ1r9k4rFdyc8tnD+W2zFfnOPNgl9R
         5e4g==
X-Gm-Message-State: AOAM532O/Tf7bp4qG3I6EqWubApcK/3iRtD7jRqiE+RZevcL5U7S3QNE
        qbZ775pyhVqRM/P9anQ6IwjKLOWvFhLnIyv0A2/iRg==
X-Google-Smtp-Source: ABdhPJwTTqTx91ImC6D7Hp6mLcAdC2O5p8fHQuP1KGpeBu1WaJjeuMNNvAIZPIp/ycdtE0jQFIxnw5xleyY2Qq1Ginw=
X-Received: by 2002:a37:6883:0:b0:6a3:42ae:e17b with SMTP id
 d125-20020a376883000000b006a342aee17bmr15565086qkc.59.1653409073112; Tue, 24
 May 2022 09:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220523181836.2019180-1-dmitry.baryshkov@linaro.org> <20220524145258.GA242731@bhelgaas>
In-Reply-To: <20220524145258.GA242731@bhelgaas>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 May 2022 19:17:42 +0300
Message-ID: <CAA8EJpomokT1whO+6UMSoqSxWdexDc7yWF3ZVK=CJveBGZntXQ@mail.gmail.com>
Subject: Re: [PATCH v12 0/8] PCI: qcom: Fix higher MSI vectors handling
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 24 May 2022 at 17:53, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Mon, May 23, 2022 at 09:18:28PM +0300, Dmitry Baryshkov wrote:
> > I have replied with my Tested-by to the patch at [2], which has landed
> > in the linux-next as the commit 20f1bfb8dd62 ("PCI: qcom:
> > Add support for handling MSIs from 8 endpoints"). However lately I
> > noticed that during the tests I still had 'pcie_pme=nomsi', so the
> > device was not forced to use higher MSI vectors.
> >
> > After removing this option I noticed that hight MSI vectors are not
> > delivered on tested platforms. After additional research I stumbled upon
> > a patch in msm-4.14 ([1]), which describes that each group of MSI
> > vectors is mapped to the separate interrupt. Implement corresponding
> > mapping.
> >
> > The first patch in the series is a revert of  [2] (landed in pci-next).
> > Either both patches should be applied or both should be dropped.
>
> 20f1bfb8dd62 is currently on Lorenzo's pci/qcom branch:
>
>   $ git log --oneline remotes/lorenzo/pci/qcom
>   bddedfeb1315 dt-bindings: PCI: qcom: Add schema for sc7280 chipset
>   a6f2d6b1b349 dt-bindings: PCI: qcom: Specify reg-names explicitly
>   81dab110d351 dt-bindings: PCI: qcom: Do not require resets on msm8996 platforms
>   5383d16f0607 dt-bindings: PCI: qcom: Convert to YAML
>   3ae93c5a9718 PCI: qcom: Fix unbalanced PHY init on probe errors
>   b986db29edbb PCI: qcom: Fix runtime PM imbalance on probe errors
>   dcd9011f591a PCI: qcom: Fix pipe clock imbalance
>   3007ba831ccd PCI: qcom: Add SM8150 SoC support
>   f52d2a0f0d32 dt-bindings: pci: qcom: Document PCIe bindings for SM8150 SoC
>   20f1bfb8dd62 PCI: qcom: Add support for handling MSIs from 8 endpoints
>   312310928417 Linux 5.18-rc1
>
> Is it safe for me to just drop that single patch before sending the
> pull request for v5.19?  Then target the rest of this series for
> v5.20?

Yes and yes.

-- 
With best wishes
Dmitry
