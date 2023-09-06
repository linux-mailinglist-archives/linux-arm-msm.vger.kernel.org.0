Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1125379371F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 10:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjIFI0B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 04:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235284AbjIFI0A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 04:26:00 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1726FE64
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 01:25:48 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d7bb34576b9so2877792276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 01:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693988747; x=1694593547; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=79DbEjRFw7HmkEQ+IO681YlD9GfFsatbnb+58bE4v0Y=;
        b=dY0L2Uk3TGRcM926dzFRLMIThKqmonosyeWu2haEQwV0oR3LnIw8GDPBawiFr/seP9
         zBV9G9DrATP5BP8OwFv9dotvUflSszwCDLRs2br23jIexYrnKqgxLnynp0uVGXf4TbR7
         mpIJKmcg/rzHPpBv6ahgID8pKlxQyXa/uAnvIc/6IxDjZ/3CWdrl52HdDwZ6NNtD8QQk
         4KtGvxCIX4u9s893sumajS/vTWyHpiTJ0oEH13bQq4R1GKM4nUdBYsBfAzcmx4pw4aFa
         ubAJPU+fr3Gu1Gfa+31oM2AFAPSvng3KCAJ2oa05aOTGMeRPuTaXIgyADOgxfzPieUnT
         UeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693988747; x=1694593547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79DbEjRFw7HmkEQ+IO681YlD9GfFsatbnb+58bE4v0Y=;
        b=jwbM4fhHLLJDlp1vOtr+hodj0zEju3HMViPWugRZpr6QYbzrRXk8F1XNysPK76RjGL
         CbbM2Dz/Ddwxy5PUhaLSfBjAt4p5ASN/DjNmeEGoqVuwoIgnt1XuaL2NLMeKh6UagKu2
         ocRbjvd19Iieyda44u2dKNGyU+2q2joTSEi2jELlAaJ980Aeq2F300IfPojXu+RKhRcy
         GOQMB1HQzYxWw8aSyamvJKV+C8xhxzrZS7SYvADsl8W/OFZ7ulDctvHxu1b/eohcGYzr
         tUYO12CcOSlWpXEt1u0EWcxM85fatRjEAwuSNncYB4tjfb5VZOYR0u/SJ0RqcQUj1fgu
         YaQQ==
X-Gm-Message-State: AOJu0YwuhTxLjdtZA/tfEiNwrBMNbAbDei2kxu917L03WxQArE0LLahQ
        XP0d7fdTzbDnnM05KrwohYSe+K6ztOzY9GiA+ESM0EfJAgBJ3Zli
X-Google-Smtp-Source: AGHT+IFINZ7UlmXL2B6gp+9jj6vtDYLtWHJivbIQoiQkMmgQ0gGTbeXcsk7w3X4qyFvjhf/wfMFcf2LjDUKEv7sTqnk=
X-Received: by 2002:a25:502:0:b0:d12:ab1:d88a with SMTP id 2-20020a250502000000b00d120ab1d88amr14968451ybf.40.1693988747287;
 Wed, 06 Sep 2023 01:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230906075823.7957-1-dmitry.baryshkov@linaro.org>
 <20230906075823.7957-5-dmitry.baryshkov@linaro.org> <df1323b5-29c0-4daf-8ca0-cb6a85171d9b@linaro.org>
In-Reply-To: <df1323b5-29c0-4daf-8ca0-cb6a85171d9b@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 6 Sep 2023 11:25:36 +0300
Message-ID: <CAA8EJppNTn2v2kDL7oEb3Topx=kJ8McOGEXEe8x=SMSigBjQ3A@mail.gmail.com>
Subject: Re: [PATCH 4/4] phy: qcom-qmp-combo: use v6 registers in v6 regs layout
To:     neil.armstrong@linaro.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 6 Sept 2023 at 11:01, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 06/09/2023 09:58, Dmitry Baryshkov wrote:
> > Make sure that we use only v6 registers in qmp_v6_usb3phy_regs_layout.
>
> Why that if the registers are the same as v5 ?

Because otherwise it is too easy to use the incorrect register when
adding a new register to the regs layout. Been there.

>
> Neil
>
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/phy/qualcomm/phy-qcom-qmp-combo.c      | 12 ++++++------
> >   drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h |  2 ++
> >   drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h     |  4 ++++
> >   3 files changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > index bff6231d7de3..9c71a132afea 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > @@ -194,14 +194,14 @@ static const unsigned int qmp_v5_5nm_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
> >   };
> >
> >   static const unsigned int qmp_v6_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
> > -     [QPHY_SW_RESET]                 = QPHY_V5_PCS_SW_RESET,
> > -     [QPHY_START_CTRL]               = QPHY_V5_PCS_START_CONTROL,
> > -     [QPHY_PCS_STATUS]               = QPHY_V5_PCS_PCS_STATUS1,
> > -     [QPHY_PCS_POWER_DOWN_CONTROL]   = QPHY_V5_PCS_POWER_DOWN_CONTROL,
> > +     [QPHY_SW_RESET]                 = QPHY_V6_PCS_SW_RESET,
> > +     [QPHY_START_CTRL]               = QPHY_V6_PCS_START_CONTROL,
> > +     [QPHY_PCS_STATUS]               = QPHY_V6_PCS_PCS_STATUS1,
> > +     [QPHY_PCS_POWER_DOWN_CONTROL]   = QPHY_V6_PCS_POWER_DOWN_CONTROL,
> >
> >       /* In PCS_USB */
> > -     [QPHY_PCS_AUTONOMOUS_MODE_CTRL] = QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL,
> > -     [QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
> > +     [QPHY_PCS_AUTONOMOUS_MODE_CTRL] = QPHY_V6_PCS_USB3_AUTONOMOUS_MODE_CTRL,
> > +     [QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
> >
> >       [QPHY_COM_RESETSM_CNTRL]        = QSERDES_V6_COM_RESETSM_CNTRL,
> >       [QPHY_COM_C_READY_STATUS]       = QSERDES_V6_COM_C_READY_STATUS,
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> > index 7c16af0b1cc3..0d0089898240 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> > @@ -8,6 +8,8 @@
> >
> >   /* Only for QMP V6 PHY - USB3 have different offsets than V5 */
> >   #define QPHY_V6_PCS_USB3_POWER_STATE_CONFIG1                0x00
> > +#define QPHY_V6_PCS_USB3_AUTONOMOUS_MODE_CTRL                0x08
> > +#define QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR               0x14
> >   #define QPHY_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL    0x18
> >   #define QPHY_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2   0x3c
> >   #define QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L         0x40
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
> > index c95d3fabd108..496c36522e55 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
> > @@ -7,6 +7,10 @@
> >   #define QCOM_PHY_QMP_PCS_V6_H_
> >
> >   /* Only for QMP V6 PHY - USB/PCIe PCS registers */
> > +#define QPHY_V6_PCS_SW_RESET                 0x000
> > +#define QPHY_V6_PCS_PCS_STATUS1                      0x014
> > +#define QPHY_V6_PCS_POWER_DOWN_CONTROL               0x040
> > +#define QPHY_V6_PCS_START_CONTROL            0x044
> >   #define QPHY_V6_PCS_LOCK_DETECT_CONFIG1             0x0c4
> >   #define QPHY_V6_PCS_LOCK_DETECT_CONFIG2             0x0c8
> >   #define QPHY_V6_PCS_LOCK_DETECT_CONFIG3             0x0cc
>


-- 
With best wishes
Dmitry
