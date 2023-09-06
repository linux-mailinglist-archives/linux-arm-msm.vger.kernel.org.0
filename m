Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC31679371A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 10:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235200AbjIFIYq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 04:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235101AbjIFIYq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 04:24:46 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32338BF
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 01:24:40 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5921a962adfso33607917b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 01:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693988679; x=1694593479; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8FgxJYQb5sLipJEPTb1HHkrkVVLFLdqlnrCZ9IiecQk=;
        b=MmM4ZCAgZx94pWC1CAvsO5FauPVtAFvh4gfbQBlYRM/b5ffbs57TxE+9Ipb3FjhaJg
         hC72qAlYdFSeY3JK6vICWvWoI8ApUL4VAuc79qErsw6LnB/8G4eklPvZpYfDxaEYW/3r
         UfkoWv8YKMqnsSHP231mkmOw8AWiwIf5v71WoBj9I2lGgbK+nEaKOt6VWvSNrR03o0JB
         I6EkrxUEwK9sbVzr1u6hLrVu8FXX01gzCqKQ8Z6sfTydtd9pttGVT96xDl/Il2D2XTkI
         Lyf5BxNWzChTeZwyqgxbN5poPyiFjDUyZLI1C1D89I6zkcMkgfjCPmagRGoq9pngBWEj
         3R4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693988679; x=1694593479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8FgxJYQb5sLipJEPTb1HHkrkVVLFLdqlnrCZ9IiecQk=;
        b=kiHdGPw8Rp3jOBKJsMaOxNFGkfCxtc4UgTL/ekNby9iJYWZmEwmvyeX0QRbHETO7TN
         UjwM6oLMPgqwWuQib7UenI5716BnRVKQHKS+vi5hKzy4L4VpZwl4KFvN8P3Qj9py51DQ
         iPdvXNp3nMJVGr3Japtsttbu2go4SVW5ePrHY7A8GvGCT8fPrxsnJYWMjdaMZz48I8vJ
         ftMC9J2sZwGZcIZWkp0Ygk74194EriScCfksCuFsTBzwpZLfpPowrUh4gpK1fSWcObIU
         iomU+Vgu862KH3Bl98h2LGGSh3FerTEv8PQAvldDML8KOcpsJ6D1vBUDK9dttbyOymXG
         8iSQ==
X-Gm-Message-State: AOJu0YyvVbBmBXVmXDm7+ZaH4we3nlGhhRBDIzgfqZGVMDgR5tHllgss
        itdHGuHUaZ5nC7Plw3NHL5ycVbgoaM2if28oCh33JA==
X-Google-Smtp-Source: AGHT+IH6dwGRkIdDTuRt/pJIYHdJLKEfCH3A3hLT0H8bBotdEyhTza76gcd+4blN/xWaXY/M85goEM/KfWPQg7cULj0=
X-Received: by 2002:a25:26cd:0:b0:d0c:3be2:b626 with SMTP id
 m196-20020a2526cd000000b00d0c3be2b626mr17084269ybm.30.1693988679382; Wed, 06
 Sep 2023 01:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230906075823.7957-1-dmitry.baryshkov@linaro.org>
 <20230906075823.7957-2-dmitry.baryshkov@linaro.org> <4f6ec540-9cf7-4505-ada8-2e203eaafca6@linaro.org>
In-Reply-To: <4f6ec540-9cf7-4505-ada8-2e203eaafca6@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 6 Sep 2023 11:24:28 +0300
Message-ID: <CAA8EJprxvPSvmkz_RU6yc-VxwDubZWe54-OjWQGgA0qvFrAiCg@mail.gmail.com>
Subject: Re: [PATCH 1/4] phy: qcom-qmp-combo: correct sm8550 PHY programming
To:     neil.armstrong@linaro.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Abel Vesa <abel.vesa@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 6 Sept 2023 at 11:02, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 06/09/2023 09:58, Dmitry Baryshkov wrote:
> > Move PCS_USB3_POWER_STATE_CONFIG1 register programming from pcs_tbl to
> > the pcs_usb_tbl, where it belongs. Also, while we are at it, correct the
> > offset of this register to point to 0x00, as expected.
>
> Konrad already sent this https://lore.kernel.org/all/20230829-topic-8550_usbphy-v1-1-599ddbfa094a@linaro.org/

Not quite. Or we'd need to land a separate fix for the register address.

>
> >
> > Fixes: 49742e9edab3 ("phy: qcom-qmp-combo: Add support for SM8550")
> > Fixes: 39bbf82d8c2b ("phy: qcom-qmp: pcs-usb: Add v6 register offsets")
> > Cc: Abel Vesa <abel.vesa@linaro.org>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/phy/qualcomm/phy-qcom-qmp-combo.c      | 2 +-
> >   drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > index cbb28afce135..41b9be56eead 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > @@ -859,7 +859,6 @@ static const struct qmp_phy_init_tbl sm8550_usb3_pcs_tbl[] = {
> >       QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_PCS_TX_RX_CONFIG, 0x0c),
> >       QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_EQ_CONFIG1, 0x4b),
> >       QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_EQ_CONFIG5, 0x10),
> > -     QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1, 0x68),
> >   };
> >
> >   static const struct qmp_phy_init_tbl sm8550_usb3_pcs_usb_tbl[] = {
> > @@ -867,6 +866,7 @@ static const struct qmp_phy_init_tbl sm8550_usb3_pcs_usb_tbl[] = {
> >       QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
> >       QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
> >       QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
> > +     QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1, 0x68),
> >   };
> >
> >   static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl[] = {
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> > index 9510e63ba9d8..5409ddcd3eb5 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
> > @@ -12,7 +12,6 @@
> >   #define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG3         0xcc
> >   #define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG6         0xd8
> >   #define QPHY_USB_V6_PCS_REFGEN_REQ_CONFIG1          0xdc
> > -#define QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1     0x90
> >   #define QPHY_USB_V6_PCS_RX_SIGDET_LVL                       0x188
> >   #define QPHY_USB_V6_PCS_RCVR_DTCT_DLY_P1U2_L                0x190
> >   #define QPHY_USB_V6_PCS_RCVR_DTCT_DLY_P1U2_H                0x194
> > @@ -23,6 +22,7 @@
> >   #define QPHY_USB_V6_PCS_EQ_CONFIG1                  0x1dc
> >   #define QPHY_USB_V6_PCS_EQ_CONFIG5                  0x1ec
> >
> > +#define QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1     0x00
> >   #define QPHY_USB_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL        0x18
> >   #define QPHY_USB_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2       0x3c
> >   #define QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L             0x40
>


-- 
With best wishes
Dmitry
