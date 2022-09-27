Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40BE85EBE1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 11:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231473AbiI0JPy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 05:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231447AbiI0JPx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 05:15:53 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C9168C030
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 02:15:52 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-351cee25568so12419537b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 02:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=O/q5FovWG8zdekeO1QxfHZC6Z0cfY4f81aN83ssI774=;
        b=MDkdqOjCmkTkQsz2f2sl2M/5t1vRP0xmHX0mGMBZbUR/vdi/lMl7sCufBQHuFq1SwH
         p40LjYuKocB2Anf9W4YwYPVWALkEM4GFgua92OrrY8sK0PjNcsLA7wBiZv3LXCgL8SZk
         QA0TcIdOs4r/MdqKf2OwM4+p9NTnYy3H9In5JclN4bHpc0KCX6Z0q01aAhTLPrrMxQc9
         UFmk1C6hMZ9i33brGAlbhxoWOBcw40OZ+TZPfibksO11T+FDoMUaWRkol2UMikc1CZP0
         qUK592Qx0id31yT+h81dX3vYp34o3FEyx7NPj/nAek5HFv4L5R66QoPFUg8HH7G85z3H
         Ab3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=O/q5FovWG8zdekeO1QxfHZC6Z0cfY4f81aN83ssI774=;
        b=WHbe3b6vWwb1VRqB3oFjE7gFB7zBsRO+qo/MAOfO0czNOXLi3A2FKZu8yyGb9QXHmG
         d/0fBGyTpxN40aVOfLSEMKLsd508PGxuc/zj3lg9u6W5tu7R4tGHSJ0E+V18iHYeRqUu
         adPN6BVm1n6/Y7NeOk8YcUxLKeHCFl3prb0ewlVgWhCb1c5Kd2+I1WPEndh8YYsBIQ9g
         X5oKMt7rXAZN8P5SEA7zQwCVdEKEF1arwKAlozty+Ie7hDn899/xFt5ElqxAbhzJC2DS
         J5bpZ1QAEiJhzY1Ni/qbzQV1AvaF1mW4GUA3FPQNVszZPH1lg7yuGy+7eptq+qCggkbN
         rWJw==
X-Gm-Message-State: ACrzQf0NlKIMBckdBugCJYZBGaKFHQUGslaBF7SIKmxzGQJMh7yEWHl+
        V09cGMqWj+k6ftoomxcU3PJFwMEbVsiawVmIdf3BKA==
X-Google-Smtp-Source: AMsMyM7SCb8ur4Q2xNYBcfZ4Vxp5JbVRg7g8b8AUPos4EFghOIHtwp5IxX7rxWxejanl9tVB9OM29LnhBfQryFFzbz0=
X-Received: by 2002:a0d:d68a:0:b0:350:a7f0:7b69 with SMTP id
 y132-20020a0dd68a000000b00350a7f07b69mr12855402ywd.132.1664270151366; Tue, 27
 Sep 2022 02:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220926173435.881688-1-dmitry.baryshkov@linaro.org> <YzK6c2g0bgwyvZ+O@lpieralisi>
In-Reply-To: <YzK6c2g0bgwyvZ+O@lpieralisi>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 27 Sep 2022 12:15:40 +0300
Message-ID: <CAA8EJppuyZ0KFk+M3Jw3_JEmsjhfv3tmDd-N3r98A838+xcAQA@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] PCI: qcom: Support using the same PHY for both RC
 and EP
To:     Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 27 Sept 2022 at 11:55, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
>
> On Mon, Sep 26, 2022 at 08:34:30PM +0300, Dmitry Baryshkov wrote:
> > Programming of QMP PCIe PHYs slightly differs between RC and EP modes.
> >
> > Currently both qcom and qcom-ep PCIe controllers setup the PHY in the
> > default mode, making it impossible to select at runtime whether the PHY
> > should be running in RC or in EP modes. Usually this is not an issue,
> > since for most devices only the RC mode is used. Some devices (SDX55)
> > currently support only the EP mode without supporting the RC mode (at
> > this moment).
> >
> > Nevertheless some of the Qualcomm platforms (e.g. the aforementioned
> > SDX55) would still benefit from being able to switch between RC and EP
> > depending on the driver being used. While it is possible to use
> > different compat strings for the PHY depending on the mode, it seems
> > like an incorrect approach, since the PHY doesn't differ between
> > usecases. It's the PCIe controller, who should decide how to configure
> > the PHY.
> >
> > This patch series implements the ability to select between RC and EP
> > modes, by allowing the PCIe QMP PHY driver to switch between
> > programming tables.
> >
> > This patchseries depends on the header from the pre-6.1 phy/next. Thus
> > after the 6.1 the PCIe patches can be applied independently of the PHY
> > part.
>
> I assume then it is better for me to ACK the PCI patches so
> that they can be pulled into the PHY tree, right ?

This way can work too.

>
> Lorenzo
>
> > Changes since v4:
> > - Fixed the possible oops in probe (Johan)
> > - Renamed the tables struct and individual table fields (Johan)
> > - Squashed the 'separate funtions' patch to lower the possible
> >   confusion.
> >
> > Changes since v3:
> > - Rebased on top of phy/next to pick in newly defined
> >   PHY_MODE_PCIE_RC/EP.
> > - Renamed 'main' to 'common' and 'secondary' to 'extra' to reflect the
> >   intention of the split (the 'common' tables and the 'extra for the ...
> >   mode' tables).
> > - Merged the 'pointer' patch into first and second patches to make them
> >   more obvious.
> >
> > Changes since v2:
> > - Added PHY_SUBMODE_PCIE_RC/EP defines (Vinod),
> > - Changed `primary' table name to `main', added extra comments
> >   describing that `secondary' are the additional tables, not required in
> >   most of the cases (following the suggestion by Johan to rename
> >   `primary' table),
> > - Changed secondary tables into the pointers to stop wasting extra
> >   memory (Vinod),
> > - Split several functions for programming the PHY using these tables.
> >
> > Changes since v1:
> > - Split the if(table) removal to the separate patch
> > - Expanded commit messages and comments to provide additional details
> > - Fixed build error on pcie-qcom.c
> > - Added support for EP mode on sm8450 to demonstrate the usage of this
> >   patchset
> >
> > Changes since RFC:
> > - Fixed the compilation of PCIe EP driver,
> > - Changed pri/sec names to primary and secondary,
> > - Added comments regarding usage of secondary_rc/_ep fields.
> >
> > Dmitry Baryshkov (5):
> >   phy: qcom-qmp-pcie: split register tables into common and extra parts
> >   phy: qcom-qmp-pcie: support separate tables for EP mode
> >   phy: qcom-qmp-pcie: Support SM8450 PCIe1 PHY in EP mode
> >   PCI: qcom: Setup PHY to work in RC mode
> >   PCI: qcom-ep: Setup PHY to work in EP mode
> >
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c     |   5 +
> >  drivers/pci/controller/dwc/pcie-qcom.c        |   5 +
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 523 +++++++++++-------
> >  .../qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h    |   1 +
> >  4 files changed, 335 insertions(+), 199 deletions(-)
> >
> > --
> > 2.35.1
> >



-- 
With best wishes
Dmitry
