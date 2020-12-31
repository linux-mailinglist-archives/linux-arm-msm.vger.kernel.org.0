Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E98842E8287
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 23:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbgLaWxM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 17:53:12 -0500
Received: from mail-il1-f179.google.com ([209.85.166.179]:46947 "EHLO
        mail-il1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbgLaWxM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 17:53:12 -0500
Received: by mail-il1-f179.google.com with SMTP id 75so18312359ilv.13;
        Thu, 31 Dec 2020 14:52:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L4txl6LRDbqOrOyEdipPParuXeNvW/63+6eovKarF9E=;
        b=jzMCe9nMe6AdP2vmP9FPR4mZBokNqQYJwB1Z1ziNfwj1ZThBTy/nzaUoaVyr57nZva
         vCrnbDKD61aq3SJJJN27c6Q/3D1Iq+JXblikeRxHCsV4z8jGRUx2I2u+f1tM3QyIQTYM
         p/b/LsFSfzOMrx5vtarFw2CQpDZ085riEExbr2GhPrz608Ye8E4pNLRUz6QxNPaBhaqH
         Dxrhatb4BOmw1HFdjCMJP2VQZBtZdlZgk7xNrC1xHrkHbnMQHVH6A0GlinSeucQzxTaB
         rKfjQYkh1UtAZ6MlQPSIrZLWJ4U81RZfMKZHRvOuG2U3dZYm57OClCzIRexFQ125ad7K
         GISA==
X-Gm-Message-State: AOAM532U0D2tZaByZHAlK/E0VW4QkVYsV+BayMjchV4qF+S3nI0bivg5
        a7gA9BkU+HpeFcq7FPBpKQ==
X-Google-Smtp-Source: ABdhPJyHEen9pZnXKWB7GlbIjG+UYI1AH7B4Ety3xrmuVFh9HKqSuIwzsEvmrxOBUvW1RvP5S5AO3Q==
X-Received: by 2002:a05:6e02:1a8e:: with SMTP id k14mr59027590ilv.275.1609455151554;
        Thu, 31 Dec 2020 14:52:31 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id h2sm31686399ili.56.2020.12.31.14.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 14:52:30 -0800 (PST)
Received: (nullmailer pid 2526430 invoked by uid 1000);
        Thu, 31 Dec 2020 22:52:28 -0000
Date:   Thu, 31 Dec 2020 15:52:28 -0700
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] mfd: qca639x: add support for QCA639x powerup
 sequence
Message-ID: <20201231225228.GA2522971@robh.at.kernel.org>
References: <20201220165845.3712599-1-dmitry.baryshkov@linaro.org>
 <20201220165845.3712599-3-dmitry.baryshkov@linaro.org>
 <20201221090244.GA53991@dell>
 <CAA8EJpo7oHVdDWjhnoknt0vAPYHL0LsZsT8q6MpQs20a+OiCAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpo7oHVdDWjhnoknt0vAPYHL0LsZsT8q6MpQs20a+OiCAQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 21, 2020 at 05:08:44PM +0300, Dmitry Baryshkov wrote:
> Hello,
> 
> On Mon, 21 Dec 2020 at 12:02, Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Sun, 20 Dec 2020, Dmitry Baryshkov wrote:
> >
> > > Qualcomm QCA639x is a family of WiFi + Bluetooth SoCs, with BT part
> > > being controlled through the UART and WiFi being present on PCIe
> > > bus. Both blocks share common power sources. So add mfd device driver
> > > handling power sequencing of QCA6390/1.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/mfd/Kconfig        |  12 +++
> > >  drivers/mfd/Makefile       |   1 +
> > >  drivers/mfd/qcom-qca639x.c | 168 +++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 181 insertions(+)
> > >  create mode 100644 drivers/mfd/qcom-qca639x.c
> >
> > This is not an MFD, since it utilised neither the MFD API nor
> > of_platform_populate() to register child devices.
> 
> It would use them if the WiFi part was not on a discoverable bus.

PCI nodes have been supported in DT for forever. If you have 
non-discoverable additions to a PCI device, then the PCI device should 
be in DT.

Rob
