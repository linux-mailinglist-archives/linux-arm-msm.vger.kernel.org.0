Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0A072DD33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 11:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238464AbjFMJCj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 05:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240670AbjFMJCf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 05:02:35 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F08710E6
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 02:02:29 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-4640f75d784so3901882e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 02:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686646948; x=1689238948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwBARohfXJIkEwsEMMo8aAWiqSvLtM3z2mjs8+NCfXY=;
        b=jT1sJaKn2m880uxpJ5L5ArF3lDcj7fgCTwwBWF6RsaYqX7FePADgzH9Dm/QqjhTK+P
         DkQPUPzU0LxNoxMzS7NHCF9LCuhzZVIoDE2wJgz/RxHAjB3FwuKMnKsaB222ZRFhLIUu
         Ciykd3mFBTL1P7WKtcBDpCQWvECEdUtdaRqHsmBNHOaGKKf7ckFx8fnKMuWlHPX1DAFg
         l3FrMgVgKr1RRtnR5aQwYXQut1mIFSubWfpgQHY41fB/fjLHyTaHIBqSPhElGMgX2CHS
         MbpMz3ivQQDAA3XTNm+c5m5Vn8oEylxUVqdnXb74u+FwpQL9ps8VOpJtL3Q4VSJOGT4a
         U12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686646948; x=1689238948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IwBARohfXJIkEwsEMMo8aAWiqSvLtM3z2mjs8+NCfXY=;
        b=WTZJeAjsQgKFPAnbn18gnmFb0peCnf5sm99G/1jhxH7foFvo0J9a/QrhZObnRnFngE
         d6I21icBRM/RFbK9TXFUi8FmjpHcMLPVtQzqtZReOvFiZST6PnJ2biYsPiF31V6NuNX3
         3KDaLYArKmfFrm8t2yosgv9P9iqzFA/t+CfMsI+kmBO1EMQ+FoSDSewxLx9gJs6FSVi7
         iU0NvbaenqucRVGGH90P5ZMwmk4a+vGjSdTTmjGXbxSUreaSkYrkEhS6YoShE7QcojA0
         N9wPZVz3atXrqk2jNKSC5juqxnAziDag4v6qVZ47l2HVafZ/b5glZMpVT8NrcKhjdYcw
         r+yw==
X-Gm-Message-State: AC+VfDyYj9HoomUm5TTHfrvvwgp5h0XZqZtttuiN8B4P9D+6ZIP0N3ig
        RG2551XuKp/hjbc5rS8PXaac2aKqiOED3ekrstJjbQ==
X-Google-Smtp-Source: ACHHUZ6FvJtsXqFfHNPsLThg02wzd2x38KBvekdtX3wtsD/RmYrGV5BDkoIlbcyJuuaGSsJlgYZLslwU2yK0B/59L/I=
X-Received: by 2002:a05:6122:d94:b0:458:8ee3:cad9 with SMTP id
 bc20-20020a0561220d9400b004588ee3cad9mr5032322vkb.8.1686646948353; Tue, 13
 Jun 2023 02:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230612092355.87937-1-brgl@bgdev.pl> <20230612092355.87937-16-brgl@bgdev.pl>
 <20230612210632.agp4ybeseujblao2@halaney-x13s>
In-Reply-To: <20230612210632.agp4ybeseujblao2@halaney-x13s>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Jun 2023 11:02:17 +0200
Message-ID: <CAMRc=Mc0hJXSazCX-5DQL7LEZ7WkhmZURxK9Kiyf_bR2d+_S3g@mail.gmail.com>
Subject: Re: [PATCH 15/26] net: stmmac: dwmac-qcom-ethqos: add support for the
 optional phy-supply
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 12, 2023 at 11:06=E2=80=AFPM Andrew Halaney <ahalaney@redhat.co=
m> wrote:
>
> On Mon, Jun 12, 2023 at 11:23:44AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > On sa8775p-ride we need to enable the power supply for the external PHY=
.
>
> Is this for the external phy? It doesn't seem like it from the board
> schematic I have... the regulator never makes it out of the black box tha=
t
> is the SIP/SOM if I'm reading right.
>
> My (poor) understanding was this was for the serdes phy that's doing the
> conversion to SGMII before hitting the board... good chance I'm wrong
> though.
>

No, you're right. In which case I think the regulator calls should be
moved into the serdes driver instead as phy-supply is defined as the
supply of the external PHY in stmmac bindings.

Bart

> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/=
drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index 2f6b9b419601..21f329d2f7eb 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/phy.h>
> >  #include <linux/phy/phy.h>
> >  #include <linux/property.h>
> > +#include <linux/regulator/consumer.h>
> >
> >  #include "stmmac.h"
> >  #include "stmmac_platform.h"
> > @@ -692,6 +693,10 @@ static int qcom_ethqos_probe(struct platform_devic=
e *pdev)
> >       if (ret)
> >               goto out_config_dt;
> >
> > +     ret =3D devm_regulator_get_enable_optional(dev, "phy");
> > +     if (ret < 0 && ret !=3D -ENODEV)
> > +             goto out_config_dt;
> > +
> >       ethqos->serdes_phy =3D devm_phy_optional_get(dev, "serdes");
> >       if (IS_ERR(ethqos->serdes_phy)) {
> >               ret =3D PTR_ERR(ethqos->serdes_phy);
> > --
> > 2.39.2
> >
>
