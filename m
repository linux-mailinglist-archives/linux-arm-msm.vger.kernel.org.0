Return-Path: <linux-arm-msm+bounces-3237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47405803208
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 780981C20A22
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 12:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAFC23748;
	Mon,  4 Dec 2023 12:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="brI0cGXI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529FD10C2
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 04:00:34 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-db539ab8e02so2750500276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 04:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701691218; x=1702296018; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AxQa10ALTFJrtePQUNooIdnJ7/2/V51IMg2dt+kkdtw=;
        b=brI0cGXIL63tH86anAjLts3RtkeNWs23+psHbkch+iAUeoPRN1bkKeugZU4nZTvA+i
         6KNyziCuukcJnB+yIAyYmzdgEEVTcZYvO5fL5XxkXgOgK+5vPB+8DlmPE/BxiQRGo6js
         7f5/6oxEXbz7SlKWX6z9XgylrQk5DLjUqkz/qhDoCPe03n9fNo8FmASKlWEHpOiY32V9
         37PZFxK1SThouTOdcYC8c5nvVAMhflN0IaVyCut9m8qI+oBRsrOGPDZwAweljv7O4bvB
         mlvHNn4H5ZWa20tPHObkF5ngSLIAxkP2DfnQvDEExDB/ixQnzVeEe0cucuM0YubKroYQ
         urKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701691218; x=1702296018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxQa10ALTFJrtePQUNooIdnJ7/2/V51IMg2dt+kkdtw=;
        b=Yhki4jiftt132wYeEj+mlgJJrXIcfg8pMdgUjCs43OuyShoNTNGqv99onC0mL7ybgf
         ck+/QUVTaqwi0fI3NhbJwKc/p05TDZJmrHbCtmSG7NusiJ5gJdG/EYV62lQsqpc8iB+N
         2aU8Vs5sZKa2lDCAQV944324RTI42ecVqx2u8fA+5VgP9yceW8XN6dSi9Pjue4okK4cV
         jppfL1ZNFoF2719SklyJ329Wf3SdBoz8rZby4My1Cqdjr7X1RResbmDilpaHHFZze21B
         FhBoTdgXnG9X28kD0DXmlMx4V381xueytMDjdHJ4WV9VP/JPyU8f23tmVVMYSb69juCu
         3OVQ==
X-Gm-Message-State: AOJu0Yzf9ZKjIs9BOB3FrBBWC4CDfowqqSz1Ai46U/wPMUMIQGKIZICi
	gIREQ23t+jxprG0alhqgMzQh36xiRQdbqbd7SSvTDw==
X-Google-Smtp-Source: AGHT+IGtx7FZUsk81dL3/t2g6cd3rE+aZFVev88VqUsqsQ+gPdRNsR1xz4Vo1+2JrRUIQSocaOyRYdJiyBQUguClOwM=
X-Received: by 2002:a05:690c:dd0:b0:5d7:1941:aa1 with SMTP id
 db16-20020a05690c0dd000b005d719410aa1mr2935063ywb.60.1701691218139; Mon, 04
 Dec 2023 04:00:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
 <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-2-d9340d362664@linaro.org>
 <CAA8EJpr2HhiXEbp0QsN-qB+L4WQWiV3o2yCc-f5oqdhdKZGL9A@mail.gmail.com> <ZW23/jPxofGw9GnY@linaro.org>
In-Reply-To: <ZW23/jPxofGw9GnY@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 14:00:07 +0200
Message-ID: <CAA8EJponcVngT5X3+C1nuCd+fX4xMUFYdGoxT+Mdit+BpjEG=w@mail.gmail.com>
Subject: Re: [PATCH 2/7] phy: qcom-qmp: qserdes-txrx: Add some more v6.20
 register offsets
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Dec 2023 at 13:29, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 23-11-22 12:12:00, Dmitry Baryshkov wrote:
> > On Wed, 22 Nov 2023 at 12:04, Abel Vesa <abel.vesa@linaro.org> wrote:
> > >
> > > Add some missing v6.20 registers offsets that are needed by the new
> > > Snapdragon X Elite (X1E80100) platform.
> > >
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h
> > > index 5385a8b60970..7402a94d1be8 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h
> > > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h
> > > @@ -14,11 +14,14 @@
> > >  #define QSERDES_V6_20_TX_LANE_MODE_3                           0x80
> > >
> > >  #define QSERDES_V6_20_RX_UCDR_FO_GAIN_RATE_2                   0x08
> > > +#define QSERDES_V6_20_RX_UCDR_SO_GAIN_RATE_2                   0x18
> > >  #define QSERDES_V6_20_RX_UCDR_FO_GAIN_RATE_3                   0x0c
> >
> > As a side note, this should be probably 0x1c. Could you please verify
> > it and send a fix?
> >
>
> Double checked. The values are correct. So I'll just put the
> SO_GAIN_RATE_2 below FO_GAIN_RATE_3.

SGTM

>
> > >  #define QSERDES_V6_20_RX_UCDR_PI_CONTROLS                      0x20
> > >  #define QSERDES_V6_20_RX_UCDR_SO_ACC_DEFAULT_VAL_RATE3         0x34
> > >  #define QSERDES_V6_20_RX_IVCM_CAL_CTRL2                                0x9c
> > >  #define QSERDES_V6_20_RX_IVCM_POSTCAL_OFFSET                   0xa0
> > > +#define QSERDES_V6_20_RX_DFE_1                                 0xac
> > > +#define QSERDES_V6_20_RX_DFE_2                                 0xb0
> > >  #define QSERDES_V6_20_RX_DFE_3                                 0xb4
> > >  #define QSERDES_V6_20_RX_VGA_CAL_MAN_VAL                       0xe8
> > >  #define QSERDES_V6_20_RX_GM_CAL                                        0x10c
> > > @@ -41,5 +44,6 @@
> > >  #define QSERDES_V6_20_RX_MODE_RATE3_B4                         0x220
> > >  #define QSERDES_V6_20_RX_MODE_RATE3_B5                         0x224
> > >  #define QSERDES_V6_20_RX_MODE_RATE3_B6                         0x228
> > > +#define QSERDES_V6_20_RX_BKUP_CTRL1                            0x22c
> > >
> > >  #endif
> > >
> > > --
> > > 2.34.1
> > >
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

