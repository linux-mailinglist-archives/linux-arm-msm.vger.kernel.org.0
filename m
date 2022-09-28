Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB0DA5EE33D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 19:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234420AbiI1Rgt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 13:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234346AbiI1Rgt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 13:36:49 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08772D576D
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:36:48 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id a2so21431040lfb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date;
        bh=w+MFvmRFQw8K94SsImKDP38Aj2nWJgY5XIWG9ozikEw=;
        b=Dwkprnz8wFxJLVMDPF//mbzEHe74Ic/GADCjZdO1ADy1CIGntvxDOdncWqpCJvKAV+
         qNyvAf0NMQ16vsKR7f3E0TA3SfB7BQBv6847ltA6IGRjwc0R7RedTK09rAytQ/IlOp0g
         5+x7/vuYY1aHCLqwW3QqIGpMp2dCZZVWjekkNyGvdTSzaAzjTGsbhUeJ7yZSEloTGcby
         Arz1mb51fW1VaERgu/NssIT5/txVM2chZudhawS+2mMgfzu5ougHqyoxRLQi1OC2Ib84
         /VEIHAqnVicdswHJemmV+0MuVjzc6fBCh99/XB7bNuvaR8HMzy6we3VZxv50B6jQhrLe
         yeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=w+MFvmRFQw8K94SsImKDP38Aj2nWJgY5XIWG9ozikEw=;
        b=XS7bqsn/tcN6hrqU9c+lT/eVfFnwXt8nRSi7AyW7TrccRdkJ2IR10C4M9KkaQuvoJS
         oYY1UOZUhiRMHUMLXBjJjJ7vClSV/pGIMu9CESTgZ9OcKa65bLJFkKZMnBE8R5owm59F
         ubD3aIctEFk0j5xTj/uN+HkLaEosnDq9PjOgIwG1QcFM9W+1BE/49ih6En/KFeNFVLo8
         6ouW7kMlp3/S9KPQ4JHJanFX0jejnuWmZCj7vHt1oqANFMc12U1PDlGTd+ox6Zoxr/7L
         O7PnwMPPj7ynND4Cb2jWGRE4r3uSh+NBiRy2Rq7chC041x4qnNjrNFA8M+kGNICIljcN
         cOYw==
X-Gm-Message-State: ACrzQf18xgWnZTXRDkE/5Dv7elJ/Z1E6GZEJH1mf53CLfAG8Kb+6OEAy
        TSV3H50IgMx8FxrbpynQamnt9SAhhsIoHw==
X-Google-Smtp-Source: AMsMyM69qcnLaoGodQcX/ivuUVEVAxn4HKJwBR3GkIzuZ2dJCAOzzbaj4OPtuBRd9ESjriBGCjhFHg==
X-Received: by 2002:a05:6512:10d6:b0:49a:1fc0:cc62 with SMTP id k22-20020a05651210d600b0049a1fc0cc62mr14733885lfg.138.1664386606380;
        Wed, 28 Sep 2022 10:36:46 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.4])
        by smtp.gmail.com with ESMTPSA id o27-20020ac25e3b000000b0049464d89e40sm529972lfg.72.2022.09.28.10.36.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:36:46 -0700 (PDT)
Date:   Wed, 28 Sep 2022 20:34:37 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/13] phy: qcom-qmp-pcie: unify ipq registers
User-Agent: K-9 Mail for Android
In-Reply-To: <20220928152822.30687-5-johan+linaro@kernel.org>
References: <20220928152822.30687-1-johan+linaro@kernel.org> <20220928152822.30687-5-johan+linaro@kernel.org>
Message-ID: <CD3050AE-693F-4AD7-9F1E-016E2AB1DF99@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 28 September 2022 18:28:13 GMT+03:00, Johan Hovold <johan+linaro@kernel=
=2Eorg> wrote:
>The IPQ register array is identical to sm8250_pcie_regs_layout so drop
>the former=2E

I'd not do such merge=2E They belong to different generations=2E I'd sugge=
st changing these arrays to use symbolic names defined in corresponding qmp=
 headers=2E

>
>Signed-off-by: Johan Hovold <johan+linaro@kernel=2Eorg>
>---
> drivers/phy/qualcomm/phy-qcom-qmp-pcie=2Ec | 11 ++---------
> 1 file changed, 2 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie=2Ec b/drivers/phy/qua=
lcomm/phy-qcom-qmp-pcie=2Ec
>index ec453f908f1d=2E=2E7b3f7e42edd5 100644
>--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie=2Ec
>+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie=2Ec
>@@ -86,13 +86,6 @@ enum qphy_reg_layout {
> 	QPHY_LAYOUT_SIZE
> };
>=20
>-static const unsigned int ipq_pciephy_gen3_regs_layout[QPHY_LAYOUT_SIZE]=
 =3D {
>-	[QPHY_SW_RESET]				=3D 0x00,
>-	[QPHY_START_CTRL]			=3D 0x44,
>-	[QPHY_PCS_STATUS]			=3D 0x14,
>-	[QPHY_PCS_POWER_DOWN_CONTROL]		=3D 0x40,
>-};
>-
> static const unsigned int pciephy_regs_layout[QPHY_LAYOUT_SIZE] =3D {
> 	[QPHY_SW_RESET]			=3D 0x00,
> 	[QPHY_START_CTRL]		=3D 0x08,
>@@ -1492,7 +1485,7 @@ static const struct qmp_phy_cfg ipq8074_pciephy_gen=
3_cfg =3D {
> 	=2Enum_resets		=3D ARRAY_SIZE(ipq8074_pciephy_reset_l),
> 	=2Evreg_list		=3D NULL,
> 	=2Enum_vregs		=3D 0,
>-	=2Eregs			=3D ipq_pciephy_gen3_regs_layout,
>+	=2Eregs			=3D sm8250_pcie_regs_layout,
>=20
> 	=2Estart_ctrl		=3D SERDES_START | PCS_START,
> 	=2Epwrdn_ctrl		=3D SW_PWRDN | REFCLK_DRV_DSBL,
>@@ -1523,7 +1516,7 @@ static const struct qmp_phy_cfg ipq6018_pciephy_cfg=
 =3D {
> 	=2Enum_resets		=3D ARRAY_SIZE(ipq8074_pciephy_reset_l),
> 	=2Evreg_list		=3D NULL,
> 	=2Enum_vregs		=3D 0,
>-	=2Eregs			=3D ipq_pciephy_gen3_regs_layout,
>+	=2Eregs			=3D sm8250_pcie_regs_layout,
>=20
> 	=2Estart_ctrl		=3D SERDES_START | PCS_START,
> 	=2Epwrdn_ctrl		=3D SW_PWRDN | REFCLK_DRV_DSBL,

--=20
With best wishes
Dmitry
