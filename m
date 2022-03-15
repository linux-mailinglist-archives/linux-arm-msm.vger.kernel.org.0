Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7C244D9BC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Mar 2022 14:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348542AbiCONG0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Mar 2022 09:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348543AbiCONGX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Mar 2022 09:06:23 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C46AA51327
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Mar 2022 06:05:02 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id h21so5311812ila.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Mar 2022 06:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kJctDznwgrmoIyAuf9bUVGsb0D7V175hvwVVt9jW9gw=;
        b=d4mR+kDbmTiAUcXc1886xV8kIQFzaMsTtL61b7IYflmu+Ku0mBap2UE7WQ0c+R9B4y
         VKGgMRMRMdT0vmCb6a8Y9ou2iFXvTAvcDQwUpRKcIzLXUVUrRSFPr4U+09U6tQVDIsp8
         mW9kRcmtHwZm2chttAOYegWNOglE96/u74Y4lbOxLutYe5vByCWEsnBmNrd98g6yg5mf
         8Imx8Ep1Vgw7JS7mKCmRyvEwVqlPS8yBTTsA/UFv1gSGu1z+KI3kIrTRZcdscKSPtXt2
         mV+i5dNl1E5GmIKvzailpWsZuMjlmPuAotYPWSZcX94lOxZIF2kV/LWjOxtqZsjYjKw3
         fHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kJctDznwgrmoIyAuf9bUVGsb0D7V175hvwVVt9jW9gw=;
        b=Gqb+21Nu5jyU0bTl9kCCCY3xftGbZhw19irBEnBMPqx7IDUvZC5kAzaf/4W9CFqFGG
         WGfdez8k8oVB0goF1/fe+kVSudszzeLEQX7lJIcfOvBOoZP3Dyz+yWfaHjwCkNAwk++o
         Xlt3WQ+Us3lPnK67Uu+4rm5EGH64pApKvyZDpHCvObvdxJZKukble5Nrh9jRP9tnJDuF
         kr/jZPgA93UOc6zkf9hyce9qrRInpe/GA1qE8CLISege5zBAmP9pKtW8Ql0sw10LFuRk
         0eCDCPYk7jhAZ8xrDlPOKD83krd1J41sjNRT5uAcMCiTKv+uMVkzAj4PMfHi/L0lydTL
         mtGg==
X-Gm-Message-State: AOAM531iYjF4SCGEev7a6O+XOIET7odW1b87bvq7b5jyBrmPQF5hAh7N
        L5jRp+JaQ6AoSmw+/DKdIKFKcnY3XSLx/WBHUBlxug==
X-Google-Smtp-Source: ABdhPJyrkaCXQOljy5xtaGdh0dwlkFZe7LnuxQg+YrF/pDCR18e8YPQy0VIlL1m27PyYcQCgEKEv1B8FmVzqvSf7344=
X-Received: by 2002:a92:ca45:0:b0:2c7:c473:6785 with SMTP id
 q5-20020a92ca45000000b002c7c4736785mr363815ilo.40.1647349501920; Tue, 15 Mar
 2022 06:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1644234441.git.baruch@tkos.co.il> <20220211160645.GA448@lpieralisi>
In-Reply-To: <20220211160645.GA448@lpieralisi>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 15 Mar 2022 14:04:51 +0100
Message-ID: <CA+HBbNEham1bukiEv5Px2=fCnqnbBKWBy3xOKe89fioQWttoGg@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] PCI: IPQ6018 platform support
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Baruch Siach <baruch@tkos.co.il>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        "Bryan O'Donoghue" <pure.logic@nexus-software.ie>,
        linux-pci@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 11, 2022 at 5:06 PM Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
>
> On Mon, Feb 07, 2022 at 04:51:23PM +0200, Baruch Siach wrote:
> > This series adds support for the single PCIe lane on IPQ6018 SoCs. The code is
> > ported from downstream Codeaurora v5.4 kernel. The main difference from
> > downstream code is the split of PCIe registers configuration from .init to
> > .post_init, since it requires phy_power_on().
> >
> > Tested on IPQ6010 based hardware.
> >
> > Changes in v6:
> >
> >   * Drop DT patch applied to the qcom tree
> >
> >   * Normalize driver changes subject line
> >
> >   * Add a preparatory patch to rename PCIE_CAP_LINK1_VAL to PCIE_CAP_SLOT_VAL,
> >     and define it using PCI_EXP_SLTCAP_* macros
> >
> >   * Drop a vague comment about ASPM configuration
> >
> >   * Add a comment about the source of delay periods
> >
> > Changes in v5:
> >
> >   * Remove comments from qcom_pcie_init_2_9_0() (Bjorn Andersson)
> >
> > Changes in v4:
> >
> >   * Drop applied DT bits
> >
> >   * Add max-link-speed that was missing from the applied v2 patch
> >
> >   * Rebase the driver on v5.16-rc3
> >
> > Changes in v3:
> >
> >   * Drop applied patches
> >
> >   * Rely on generic code for speed setup
> >
> >   * Drop unused macros
> >
> >   * Formatting fixes
> >
> > Changes in v2:
> >
> >   * Add patch moving GEN3_RELATED macros to a common header
> >
> >   * Drop ATU configuration from pcie-qcom
> >
> >   * Remove local definition of common registers
> >
> >   * Use bulk clk and reset APIs
> >
> >   * Remove msi-parent from device-tree
> >
> > Baruch Siach (2):
> >   PCI: dwc: tegra: move GEN3_RELATED DBI register to common header
> >   PCI: qcom: Define slot capabilities using PCI_EXP_SLTCAP_*
> >
> > Selvam Sathappan Periakaruppan (1):
> >   PCI: qcom: Add IPQ60xx support
> >
> >  drivers/pci/controller/dwc/pcie-designware.h |   7 +
> >  drivers/pci/controller/dwc/pcie-qcom.c       | 155 ++++++++++++++++++-
> >  drivers/pci/controller/dwc/pcie-tegra194.c   |   6 -
> >  3 files changed, 160 insertions(+), 8 deletions(-)
>
> Bjorn, Andy,
>
> Can you ACK please if this series is ready to be merged ?

Hi,
This would also help the IPQ8074 which has the same controller for the
Gen3 port.

I have been using this for OpenWrt for a while and it works.

Regards,
Robert
>
> Thanks,
> Lorenzo



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
