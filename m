Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9221F225E7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 14:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbgGTMZY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 08:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728460AbgGTMZX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 08:25:23 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8723FC061794;
        Mon, 20 Jul 2020 05:25:23 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z2so17680898wrp.2;
        Mon, 20 Jul 2020 05:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=ELSjM6rlMt2XdyL11rGbFkrQrMLysUTdi5Cru78vLr4=;
        b=t3cWRbwP0CDJpWVls5HKPGw+65RlzeuddYZvYTsdtOuPBT089BluvpfF76NEBnmwJ5
         d1gDaUAsjN/f1OcorOwBEy7McQXlzgQl/6hvemrxWg2lmEA8jJvmbxTsGRydI+mPe2oY
         Yh88X0dkpjrtZhimdmN+DVAcB0mkDuRohcn7jm3nQ5+jKw61TFMNUFSZ3h9LfX7Osc3V
         vvVewww/82r6ERvGdP5o/l6pK99ZmPMocgPDWNJaPbVsHoTRzYrENFQsVkpC3Jz2BB8p
         zBX5XlIdoZIRDji34XK1cRmJKZZmLIRCoDco87iOIbAOrGDVo26yP23Pud3LkQ5SJJoA
         js3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=ELSjM6rlMt2XdyL11rGbFkrQrMLysUTdi5Cru78vLr4=;
        b=XHx/8C+b1X6IlvjY0DYGM56j1E4g/0/pdj3DBrlX27SxCPRA8dN5RvZ8H2DnopfrF8
         UBZmenWy8fK1zDaOqaYF8rvRuYWOP3Vj2rXNCikbPEJoXzHB2idoA51B6KmAK3EUa1tG
         JYeuBAKLLAZ2PFbyW9tV/8tZwbTY2DrHtPAjyL3pqTnV3F0QtP9TIOLHQn9152c2zUhN
         nO/VAY6Asv7HKhisuS2zj6zoqEvDhgXKE/1JH+W06Rdhp3iUe5HoZJiFWObLuorz8Htn
         4tFoL/UTj/ANJRoSav4sg4dTZv3KnCrS8bI0LfLdKrYrD3LJ+YMuKtah1HcuWMhpjv4e
         ovTA==
X-Gm-Message-State: AOAM5308OQHpuo9lypqKMvRGhKH4c5oXF2nFbsEf+zZoXEpH18hhok7w
        bOivKopvDFYxstjsvYT3s2A=
X-Google-Smtp-Source: ABdhPJymyDug8FuVmigPY+dchNAS0DbDRtwqJ3R0ox3vu55uMZvHGBFGlKF2KLgDWpgAUTwT1hjrnA==
X-Received: by 2002:a5d:62d1:: with SMTP id o17mr21333896wrv.162.1595247922208;
        Mon, 20 Jul 2020 05:25:22 -0700 (PDT)
Received: from AnsuelXPS (host-87-7-31-173.retail.telecomitalia.it. [87.7.31.173])
        by smtp.gmail.com with ESMTPSA id 5sm30567674wmk.9.2020.07.20.05.25.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 05:25:21 -0700 (PDT)
From:   <ansuelsmth@gmail.com>
To:     "'Vinod Koul'" <vkoul@kernel.org>
Cc:     "'Andy Gross'" <agross@codeaurora.org>,
        "'Jonathan McDowell'" <noodles@earth.li>,
        "'Andy Gross'" <agross@kernel.org>,
        "'Bjorn Andersson'" <bjorn.andersson@linaro.org>,
        "'Kishon Vijay Abraham I'" <kishon@ti.com>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Mark Rutland'" <mark.rutland@arm.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20200717131635.11076-1-ansuelsmth@gmail.com> <20200720062545.GC12965@vkoul-mobl>
In-Reply-To: <20200720062545.GC12965@vkoul-mobl>
Subject: R: [PATCH v10 1/2] phy: qualcomm: add qcom ipq806x dwc usb phy driver
Date:   Mon, 20 Jul 2020 14:25:18 +0200
Message-ID: <010801d65e90$d57d2b60$80778220$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: it
Thread-Index: AQKLq5LK6XpGPjFtHIkX7iDhCC2HpAHU9eHTp5cie8A=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Messaggio originale-----
> Da: Vinod Koul <vkoul@kernel.org>
> Inviato: luned=EC 20 luglio 2020 08:26
> A: Ansuel Smith <ansuelsmth@gmail.com>
> Cc: Andy Gross <agross@codeaurora.org>; Jonathan McDowell
> <noodles@earth.li>; Andy Gross <agross@kernel.org>; Bjorn Andersson
> <bjorn.andersson@linaro.org>; Kishon Vijay Abraham I <kishon@ti.com>;
> Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; linux-arm-msm@vger.kernel.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org
> Oggetto: Re: [PATCH v10 1/2] phy: qualcomm: add qcom ipq806x dwc usb
> phy driver
>=20
> On 17-07-20, 15:16, Ansuel Smith wrote:
> > This has lost in the original push for the dwc3 qcom driver.
> > This is needed for ipq806x SoC as without this the usb ports
> > doesn't work at all.
>=20
> Applied both, thanks
>=20
> My script found below errors with W=3D1, can you please send fixes for
> these
>=20

Since you applied them should I send a new patch or a v11 of=20
this patchset?

> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:140: warning: Function
> parameter or member 'phy_dwc3' not described in
> 'usb_phy_write_readback'
> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:140: warning: Function
> parameter or member 'offset' not described in 'usb_phy_write_readback'
> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:140: warning: Function
> parameter or member 'mask' not described in 'usb_phy_write_readback'
> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:140: warning: Function
> parameter or member 'val' not described in 'usb_phy_write_readback'
> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:182: warning: Function
> parameter or member 'phy_dwc3' not described in 'usb_ss_write_phycreg'
> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:182: warning: Function
> parameter or member 'addr' not described in 'usb_ss_write_phycreg'
> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:182: warning: Function
> parameter or member 'val' not described in 'usb_ss_write_phycreg'
> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:219: warning: Function
> parameter or member 'phy_dwc3' not described in 'usb_ss_read_phycreg'
> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:219: warning: Function
> parameter or member 'addr' not described in 'usb_ss_read_phycreg'
> drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c:219: warning: Function
> parameter or member 'val' not described in 'usb_ss_read_phycreg'
>=20
> --
> ~Vinod

