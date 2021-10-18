Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6AE043296B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 23:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbhJRWAX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 18:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232605AbhJRWAX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 18:00:23 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E96C06161C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 14:58:11 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id a13so7008041qkg.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 14:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VNpqRRdnPDIUGCc3uEFG9REMCz+uQZwgGwBrpVs1X7k=;
        b=PzH1/3QFJDCAo6+yfE9yZp3FhN5bdJblxdwmrYJXz4W0YDV5QgMDwXPS+9oDzaYsmR
         1hy1VBsrs0g+cboLAmAYffm5C4OKJ9PZknz0zqdbSlWGpa8IqJfWmggmKLf9VGSQPSoq
         bF2fHToJMjgOwuWZ6BDY28QPn+sUaZRuPFe0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VNpqRRdnPDIUGCc3uEFG9REMCz+uQZwgGwBrpVs1X7k=;
        b=1TB5L3Wkpbc6SqNrRDay0wKMexGfDVksikoSv+vp1zt7cfrl55qCY8YGOEj/i8qmOR
         9r57Z3Slt8EFMHBaJ+sYZmu3363ysFj92O+eFPtMi1vVqVCCeGQ7gm2Lr/oN3UqwHD9n
         cWjq9j/1koruMJ9nfuBi5EiHZs6wuRTcMcMDWW2x0HI4Z0xPGlQUguJQSVhFSDQ59ILI
         M1QGS22VIS4pFtvi+qrXysx8gZGqipNeJjvW/TgEpeRNCS7hhXbCJsGh1fFY3Gqj4JdQ
         1TUknrIco5bipRTUY0FbBYN27el6SD048KzgDmHm38u/KY4QngtiAtzhV9Ek56s0l6g8
         13KQ==
X-Gm-Message-State: AOAM530SU09K3tprgXuTebXAIcZzrnNj9z/etwulwTCxShSCi2UfgBH0
        NS+PL6Hyj6rJNNJ8DGlSqnj/JnaxR73pRQ==
X-Google-Smtp-Source: ABdhPJxu74uHPxEwxfTRk+CB4oIEWyx4E16/esSuor13kAhcUyeOVeMj1GhtLxh5D8cdyeDGDeo/BQ==
X-Received: by 2002:a37:6706:: with SMTP id b6mr24519369qkc.339.1634594290410;
        Mon, 18 Oct 2021 14:58:10 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id m6sm6753341qti.38.2021.10.18.14.58.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 14:58:09 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id q189so394869ybq.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 14:58:08 -0700 (PDT)
X-Received: by 2002:a5b:102:: with SMTP id 2mr31008124ybx.101.1634594288583;
 Mon, 18 Oct 2021 14:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <1633628923-25047-1-git-send-email-pmaliset@codeaurora.org>
 <20211013100005.GB9901@lpieralisi> <CAE-0n52fZZkWt5KxF8gq0D55f_joq0v2sBBp81Gts8cBt6fJgg@mail.gmail.com>
In-Reply-To: <CAE-0n52fZZkWt5KxF8gq0D55f_joq0v2sBBp81Gts8cBt6fJgg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 18 Oct 2021 14:57:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WYvV+=uyEOYq7LjtBgpSGV6KovvoS1e88fgc1kpt_c7Q@mail.gmail.com>
Message-ID: <CAD=FV=WYvV+=uyEOYq7LjtBgpSGV6KovvoS1e88fgc1kpt_c7Q@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] Add DT bindings and DT nodes for PCIe and PHY in SC7280
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Prasad Malisetty <pmaliset@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>, svarbanov@mm-sol.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        sallenki@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Oct 15, 2021 at 12:43 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Lorenzo Pieralisi (2021-10-13 03:00:05)
> > On Thu, Oct 07, 2021 at 11:18:38PM +0530, Prasad Malisetty wrote:
> > > Prasad Malisetty (5):
> > >   dt-bindings: pci: qcom: Document PCIe bindings for SC7280
> > >   arm64: dts: qcom: sc7280: Add PCIe and PHY related nodes
> > >   arm64: dts: qcom: sc7280: Add PCIe nodes for IDP board
> > >   PCI: qcom: Add a flag in match data along with ops
> > >   PCI: qcom: Switch pcie_1_pipe_clk_src after PHY init in SC7280
> > >
> > >  .../devicetree/bindings/pci/qcom,pcie.txt          |  17 +++
> > >  arch/arm64/boot/dts/qcom/sc7280-idp.dts            |   8 ++
> > >  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |  50 +++++++++
> > >  arch/arm64/boot/dts/qcom/sc7280-idp2.dts           |   8 ++
> > >  arch/arm64/boot/dts/qcom/sc7280.dtsi               | 118 +++++++++++++++++++++
> > >  drivers/pci/controller/dwc/pcie-qcom.c             |  95 +++++++++++++++--
> > >  6 files changed, 285 insertions(+), 11 deletions(-)
> >
> > I applied patches [4-5] to pci/qcom for v5.16, thanks I expect other
> > patches to go via the relevant trees.
> >
>
> Lorenzo, can you pick up patch 1 too? It's the binding update for the
> compatible string used in patch 4-5.

I think that means that patches 2-3 are ready to land in the Qualcomm
tree assuming Bjorn Andersson is still accepting patches there for
5.16, right?

-Doug
