Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC052A1354
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Oct 2020 04:29:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725841AbgJaD3w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 23:29:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgJaD3v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 23:29:51 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61B1C0613D7
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 20:29:51 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a3so312404pjh.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 20:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=76DThdNWebcvO0jIjCg/uL/CgMF8urxPrOK03ud7nT0=;
        b=AHXLBo9DAH9XH3EOJrRvufMD00GFaxVB2stykDP4uZK+x7U4PauNsAAcO7R7TW/OfB
         FBVvYo09QULuGN2SjJY4qJlu+pA4H5V0ZTEcCgf1K5OfMJsCxh6NrnQhsVyOMAtwB7Ri
         BlD+zWJXmestHYeh2VSx9bJczYhgo/39097ktj5um+tOLvg80y6DmFSFwghwgJ99fiHN
         3n8Ncc5jTv5oCLMbYayERwaMLKlWclq4QXFiGFCaB+fTjXOLTd5QbOoPwcEN2SRKE+M4
         0wrIL2qT6MTrnZ0S+rVYkYkZubVI7D+yAbNgDtcuDrxJHt9BTEYxMdKyQHGbDw+fJ3J1
         gZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=76DThdNWebcvO0jIjCg/uL/CgMF8urxPrOK03ud7nT0=;
        b=AAFzVYgIOCjIA9Ve63UmZ3DX0O0gu8IK5ce97UqGuZd1M2wR5H+8kTuFrrYBydHT+/
         11gNaMKqLSnX0M1gce9FiVkKBvfTp5Iwu4x4q7bhQGIj1jSHeYIioqWxBzurIiVBtqfA
         hcBmsb7FlTEqWM6lI1c3Fo1Yo089hMpvwD5odSx6dfSQmIPL3Spp9HzGQQxOLbqhoJP4
         adW79rXWf/cXETaN4mv7kAuUABAi1ISzi+Qfn0I0hztEfOXu1uNKrmPbLXnh+BzJpZ+A
         l0fQ1RKxQJBAoYMpzKp3a4WtYdeciYkHuS3Hvs62iuLarHPlIJR3O9M+naVEEHRzRcrm
         Vj4Q==
X-Gm-Message-State: AOAM531R8qjudAxA4g0AcfWkewNWmeqaDUzAVjZwddyx/qiJO1reSkq1
        Kr3ud7rw9oECT0ZT6gabR2uSUsidec7h
X-Google-Smtp-Source: ABdhPJyRXsMwGdWZIMPqbxTxOkTtp+X7q4C/t7/xgSwooZvdz7F2X7P3tAZygMvvgATznDMimfBipg==
X-Received: by 2002:a17:90b:297:: with SMTP id az23mr6671619pjb.71.1604114990963;
        Fri, 30 Oct 2020 20:29:50 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6097:a88a:8051:aa6b:aaa2:8d63])
        by smtp.gmail.com with ESMTPSA id w31sm4716090pjj.32.2020.10.30.20.29.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 20:29:50 -0700 (PDT)
Date:   Sat, 31 Oct 2020 08:59:44 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     sboyd@kernel.org, mturquette@baylibre.com,
        bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add SDX55 GCC clock bindings
Message-ID: <20201031032944.GA5635@Mani-XPS-13-9360>
References: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org>
 <20201028074232.22922-2-manivannan.sadhasivam@linaro.org>
 <20201030192225.GA4174677@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030192225.GA4174677@bogus>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On Fri, Oct 30, 2020 at 02:22:25PM -0500, Rob Herring wrote:
> On Wed, Oct 28, 2020 at 01:12:29PM +0530, Manivannan Sadhasivam wrote:
> > From: Vinod Koul <vkoul@kernel.org>
> > 
> > Add device tree bindings for global clock controller on SDX55 SoCs.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> This should carry your S-o-b too.
> 

Ah yes!

> > ---
> >  .../bindings/clock/qcom,gcc-sdx55.yaml        |  71 +++++++++++
> >  include/dt-bindings/clock/qcom,gcc-sdx55.h    | 112 ++++++++++++++++++
> >  2 files changed, 183 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
> >  create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx55.h
> > 

[...]

> > diff --git a/include/dt-bindings/clock/qcom,gcc-sdx55.h b/include/dt-bindings/clock/qcom,gcc-sdx55.h
> > new file mode 100644
> > index 000000000000..09ca45c6de73
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/qcom,gcc-sdx55.h
> > @@ -0,0 +1,112 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> 
> Dual license? 
> 

The downstream code just lists the GPL2.0 and I'm not sure if I can make
it as dual license. Whereas the binding we made it dual license since we
authored it.

Thanks,
Mani

> > +/*
> > + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2020, Linaro Ltd.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SDX55_H
> > +#define _DT_BINDINGS_CLK_QCOM_GCC_SDX55_H
> > +
> > +#define GPLL0							3
> > +#define GPLL0_OUT_EVEN						4
> > +#define GPLL4							5
> > +#define GPLL4_OUT_EVEN						6
> > +#define GPLL5							7
> > +#define GCC_AHB_PCIE_LINK_CLK					8
> > +#define GCC_BLSP1_AHB_CLK					9
> > +#define GCC_BLSP1_QUP1_I2C_APPS_CLK				10
> > +#define GCC_BLSP1_QUP1_I2C_APPS_CLK_SRC				11
> > +#define GCC_BLSP1_QUP1_SPI_APPS_CLK				12
> > +#define GCC_BLSP1_QUP1_SPI_APPS_CLK_SRC				13
> > +#define GCC_BLSP1_QUP2_I2C_APPS_CLK				14
> > +#define GCC_BLSP1_QUP2_I2C_APPS_CLK_SRC				15
> > +#define GCC_BLSP1_QUP2_SPI_APPS_CLK				16
> > +#define GCC_BLSP1_QUP2_SPI_APPS_CLK_SRC				17
> > +#define GCC_BLSP1_QUP3_I2C_APPS_CLK				18
> > +#define GCC_BLSP1_QUP3_I2C_APPS_CLK_SRC				19
> > +#define GCC_BLSP1_QUP3_SPI_APPS_CLK				20
> > +#define GCC_BLSP1_QUP3_SPI_APPS_CLK_SRC				21
> > +#define GCC_BLSP1_QUP4_I2C_APPS_CLK				22
> > +#define GCC_BLSP1_QUP4_I2C_APPS_CLK_SRC				23
> > +#define GCC_BLSP1_QUP4_SPI_APPS_CLK				24
> > +#define GCC_BLSP1_QUP4_SPI_APPS_CLK_SRC				25
> > +#define GCC_BLSP1_UART1_APPS_CLK				26
> > +#define GCC_BLSP1_UART1_APPS_CLK_SRC				27
> > +#define GCC_BLSP1_UART2_APPS_CLK				28
> > +#define GCC_BLSP1_UART2_APPS_CLK_SRC				29
> > +#define GCC_BLSP1_UART3_APPS_CLK				30
> > +#define GCC_BLSP1_UART3_APPS_CLK_SRC				31
> > +#define GCC_BLSP1_UART4_APPS_CLK				32
> > +#define GCC_BLSP1_UART4_APPS_CLK_SRC				33
> > +#define GCC_BOOT_ROM_AHB_CLK					34
> > +#define GCC_CE1_AHB_CLK						35
> > +#define GCC_CE1_AXI_CLK						36
> > +#define GCC_CE1_CLK						37
> > +#define GCC_CPUSS_AHB_CLK					38
> > +#define GCC_CPUSS_AHB_CLK_SRC					39
> > +#define GCC_CPUSS_GNOC_CLK					40
> > +#define GCC_CPUSS_RBCPR_CLK					41
> > +#define GCC_CPUSS_RBCPR_CLK_SRC					42
> > +#define GCC_EMAC_CLK_SRC					43
> > +#define GCC_EMAC_PTP_CLK_SRC					44
> > +#define GCC_ETH_AXI_CLK						45
> > +#define GCC_ETH_PTP_CLK						46
> > +#define GCC_ETH_RGMII_CLK					47
> > +#define GCC_ETH_SLAVE_AHB_CLK					48
> > +#define GCC_GP1_CLK						49
> > +#define GCC_GP1_CLK_SRC						50
> > +#define GCC_GP2_CLK						51
> > +#define GCC_GP2_CLK_SRC						52
> > +#define GCC_GP3_CLK						53
> > +#define GCC_GP3_CLK_SRC						54
> > +#define GCC_PCIE_0_CLKREF_CLK					55
> > +#define GCC_PCIE_AUX_CLK					56
> > +#define GCC_PCIE_AUX_PHY_CLK_SRC				57
> > +#define GCC_PCIE_CFG_AHB_CLK					58
> > +#define GCC_PCIE_MSTR_AXI_CLK					59
> > +#define GCC_PCIE_PIPE_CLK					60
> > +#define GCC_PCIE_RCHNG_PHY_CLK					61
> > +#define GCC_PCIE_RCHNG_PHY_CLK_SRC				62
> > +#define GCC_PCIE_SLEEP_CLK					63
> > +#define GCC_PCIE_SLV_AXI_CLK					64
> > +#define GCC_PCIE_SLV_Q2A_AXI_CLK				65
> > +#define GCC_PDM2_CLK						66
> > +#define GCC_PDM2_CLK_SRC					67
> > +#define GCC_PDM_AHB_CLK						68
> > +#define GCC_PDM_XO4_CLK						69
> > +#define GCC_SDCC1_AHB_CLK					70
> > +#define GCC_SDCC1_APPS_CLK					71
> > +#define GCC_SDCC1_APPS_CLK_SRC					72
> > +#define GCC_SYS_NOC_CPUSS_AHB_CLK				73
> > +#define GCC_USB30_MASTER_CLK					74
> > +#define GCC_USB30_MASTER_CLK_SRC				75
> > +#define GCC_USB30_MOCK_UTMI_CLK					76
> > +#define GCC_USB30_MOCK_UTMI_CLK_SRC				77
> > +#define GCC_USB30_MSTR_AXI_CLK					78
> > +#define GCC_USB30_SLEEP_CLK					79
> > +#define GCC_USB30_SLV_AHB_CLK					80
> > +#define GCC_USB3_PHY_AUX_CLK					81
> > +#define GCC_USB3_PHY_AUX_CLK_SRC				82
> > +#define GCC_USB3_PHY_PIPE_CLK					83
> > +#define GCC_USB3_PRIM_CLKREF_CLK				84
> > +#define GCC_USB_PHY_CFG_AHB2PHY_CLK				85
> > +#define GCC_XO_DIV4_CLK						86
> > +#define GCC_XO_PCIE_LINK_CLK					87
> > +
> > +#define GCC_EMAC_BCR						0
> > +#define GCC_PCIE_BCR						1
> > +#define GCC_PCIE_LINK_DOWN_BCR					2
> > +#define GCC_PCIE_NOCSR_COM_PHY_BCR				3
> > +#define GCC_PCIE_PHY_BCR					4
> > +#define GCC_PCIE_PHY_CFG_AHB_BCR				5
> > +#define GCC_PCIE_PHY_COM_BCR					6
> > +#define GCC_PCIE_PHY_NOCSR_COM_PHY_BCR				7
> > +#define GCC_PDM_BCR						8
> > +#define GCC_QUSB2PHY_BCR					9
> > +#define GCC_TCSR_PCIE_BCR					10
> > +#define GCC_USB30_BCR						11
> > +#define GCC_USB3_PHY_BCR					12
> > +#define GCC_USB3PHY_PHY_BCR					13
> > +#define GCC_USB_PHY_CFG_AHB2PHY_BCR				14
> > +
> > +#endif
> > -- 
> > 2.17.1
> > 
