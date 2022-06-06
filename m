Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD9B553F157
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jun 2022 23:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbiFFVEM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jun 2022 17:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234351AbiFFVEG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jun 2022 17:04:06 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E536109D
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jun 2022 13:54:13 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-e93bbb54f9so20604029fac.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jun 2022 13:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KZR4S4tS0zB38NFydiChxkC66+hB8f39WxVtHRzvgFU=;
        b=rH1LfLU1pouy+FGVOvz1daFsN0Q3d9uK80+SC3LnT4b9FdBUuuMwO36myTgh8Wbcye
         eh+LzYZA0zxTM9RnaxMnYirlm6QcPU6c+76LIP1E1vwcC5JzugEeGmVrYf8Ks/JTwDa3
         rt4Pu34ZxYNoZYb8kZd6DlDZ2xweSJvR5K9JZl1a8at2FHMiK2X+AILZaGn/jOBm/cXX
         IvVQjztMNLlZSwNzTV4dLBA/3dBasx8jv6bgBJ3JaG7jqVGmOIch98qQOAO7fFgdIpSt
         Koh8nZXEoMmLPffhfXNCMXpDSXGOYpNBEbh8RtvPKYC49QLnt0A9qYIEQ6QdP/Fvro1d
         +Agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KZR4S4tS0zB38NFydiChxkC66+hB8f39WxVtHRzvgFU=;
        b=v2wDyyNfYlQ/wrbHCfsNwMBZM2FTuBHUWGB3XDHefGDEocD5KpF067zEdpstvzwUCf
         NXJcHVfCnjj25kvDjP/p8ktjxPfhnRW6coRJ/WmeOGHESb2gl4pJzIv+MkMsJYB105Wx
         xEwiMqNZwsgKCDJWLsmHB+EBsQNvOUktPnjvotHWNoR5daKlFNQyodo6R3/sw4z2VyyF
         3hgkJjxV+iaE40Zdeoqjvnk5BN2f6C2l6o1LUeXpkJJXUoURYFIZW/puQGCeMA4utho9
         Vfm/nTEWLu8Onwkd/GW7Bg1idvKkcn6mYCCsgRUnpfqCYuTPHXHBZ9cDvSTUAIpj389e
         ToyA==
X-Gm-Message-State: AOAM531tL+qxayITOM+uboxrDX8wYp1/we7EsDlv77WB/wsN3wMDwmFi
        0ZvwUa+LvCWe5cDAWlMa+5hMKA==
X-Google-Smtp-Source: ABdhPJx4V+4+mgi3g71iq5hEroP90EmOGF2DT9TGEv3LwcnWMgt6lB9Xsg7jkhKkUaIME4M99jEgXw==
X-Received: by 2002:a05:6870:8181:b0:f3:2682:ea6b with SMTP id k1-20020a056870818100b000f32682ea6bmr14652136oae.215.1654548852134;
        Mon, 06 Jun 2022 13:54:12 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id bg10-20020a056820080a00b0040e6e53f6bfsm8928165oob.15.2022.06.06.13.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 13:54:11 -0700 (PDT)
Date:   Mon, 6 Jun 2022 13:56:36 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH v3 00/30] phy: qcom-qmp: split the QMP PHY driver
Message-ID: <Yp5qBJUh3T/qTne0@ripper>
References: <20220602070909.1666068-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602070909.1666068-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 02 Jun 00:08 PDT 2022, Dmitry Baryshkov wrote:

> While adding support for the PCIe EP mode support to the QMP driver I
> couldn't help but notice that the QMP PHY driver has slowly become the a
> beast with tons of conditions and corner cases being inserted here and
> there.r
> 
> This an RFC for an attempt to to cleanup the QMP driver by splitting the
> QMP PHY driver into five smaller drivers, each targeting a particular
> family of PHY backends (DP/combo, PCIe, UFS, USB and a separate driver
> for the MSM8996 PCIe PHY). Yes, this results in some code duplication,
> but I hope that the end result is still better than the current
> situation.
> 

With the MODULE_DEVICE_TABLE of the combo PHY corrected, this looks good
to me.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org> # UFS, PCIe and USB on SC8180X

Regards,
Bjorn

> Changes since RFC v2:
>  - After dicussion with Vinod, revert back to the approach from RFC v1:
>    copy the source and clean it up rather than creating new drivers from
>    the blank space. This lowers the risc of breaking any of the platforms.
>  - Drop common phy-qcom-qmp-lib.c for now. The goal of this patchseries
>    is to be merged early during the development cycle to unblock further
>    QMP driver development. Additional cleanups and code unification can
>    come up later.
> 
> Changes since RFC v1:
>  - Split the patchset to be able to get through the email size
>    limitations
>  - Minor correcions to the split drivers
> 
> Dmitry Baryshkov (30):
>   phy: qcom-qmp: create copies of QMP PHY driver
>   phy: qcom-qmp-combo: drop all non-combo compatibles support
>   phy: qcom-qmp-pcie: drop all non-PCIe compatibles support
>   phy: qcom-qmp-pcie-msm8996: drop all compatibles except
>     msm8996-pcie-phy
>   phy: qcom-qmp-ufs: drop all non-UFS compatibles support
>   phy: qcom-qmp-usb: drop all non-USB compatibles support
>   phy: qcom-qmp-combo: change symbol prefix to qcom_qmp_phy_combo
>   phy: qcom-qmp-pcie: change symbol prefix to qcom_qmp_phy_pcie
>   phy: qcom-qmp-pcie: change symbol prefix to qcom_qmp_phy_pcie_msm8996
>   phy: qcom-qmp-ufs: change symbol prefix to qcom_qmp_phy_ufs
>   phy: qcom-qmp-usb: change symbol prefix to qcom_qmp_phy_usb
>   phy: qcom-qmp: switch to new split QMP PHY driver
>   phy: qcom-qmp: drop old QMP PHY driver source
>   phy: qcom-qmp-combo: drop support for PCIe,UFS PHY types
>   phy: qcom-qmp-pcie: drop support for non-PCIe PHY types
>   phy: qcom-qmp-pcie-msm8996: drop support for non-PCIe PHY types
>   phy: qcom-qmp-ufs: drop support for non-UFS PHY types
>   phy: qcom-qmp-usb: drop support for non-USB PHY types
>   phy: qcom-qmp-combo: cleanup the driver
>   phy: qcom-qmp-pcie: cleanup the driver
>   phy: qcom-qmp-pcie-msm8996: cleanup the driver
>   phy: qcom-qmp-ufs: cleanup the driver
>   phy: qcom-qmp-usb: cleanup the driver
>   phy: qcom-qmp-pcie: drop multi-PHY support
>   phy: qcom-qmp-ufs: drop multi-PHY support
>   phy: qcom-qmp-usb: drop multi-PHY support
>   phy: qcom-qmp-combo: use bulk reset_control API
>   phy: qcom-qmp-pcie: use bulk reset_control API
>   phy: qcom-qmp-pcie-msm8996: use bulk reset_control API
>   phy: qcom-qmp-usb: use bulk reset_control API
> 
>  drivers/phy/qualcomm/Makefile                 |    8 +-
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 2579 +++++++
>  .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  | 1081 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 2404 +++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 1390 ++++
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 2751 +++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.c           | 6350 -----------------
>  7 files changed, 10212 insertions(+), 6351 deletions(-)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb.c
>  delete mode 100644 drivers/phy/qualcomm/phy-qcom-qmp.c
> 
> -- 
> 2.35.1
> 
