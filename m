Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4AD73434E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 21:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232373AbjFQTYa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jun 2023 15:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231984AbjFQTY3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jun 2023 15:24:29 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C554A1BD6
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 12:24:26 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-786e637f06dso669438241.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 12:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687029866; x=1689621866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAVqTNFm1Ko/hSDeJVRLXQ4E4KG1rIEAdrc8bWfuH9M=;
        b=lVG2S5Xx6tFg0dg4z6KHuNJpv5zw9bfbJORZYuLnU4hzhlKRIQMYa9+jW4VwKMjoaO
         qVXcYgejWNww7bCA45NVLUicUCOag7vOWx4axAvC3r0pbruDxES/YNnjXI+QwZwW1mTv
         SyH7G8xa0wD/g0OuGWAkTmKwifbZPSjh5IRffYshgeUS6lM7tjjCo3SAYf8O+aYKxVvL
         VWyQ4j75TLZdCGdAUClkkdPqJkoHzx5InuSk/W/qrJa5VCwGhmGMI9uxpmnqryyjnbMr
         +v2lv4iKCLbN3Y/76bFeU+uf6QlEzv4E0yMkRS1fPH3BRxvk/4aWxSrJrRQQHYBoHFmX
         cQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687029866; x=1689621866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAVqTNFm1Ko/hSDeJVRLXQ4E4KG1rIEAdrc8bWfuH9M=;
        b=RIOSfIX+6pUxezZXKFQ7e5qRxd3PW7i1bT9383HpVYT+XOvp7+0y7G/2d+Z/bvFM8S
         n10BqRbt5dof3shZivymDDcQda1YJhw8i1BTQbyb3pbiv9He65aZ/Ao2SYA2HYtJjcXm
         hzsAOBTF/n+RfQK7owVZtrMBB8P9lpQM8fdFZCVufzf4JFsFavxaVSOTO+2Z5IeeXteO
         x3EPq+XT3QXl2ngRlCTyxV9yg/uO0dBp20+oW50kgEAgw67OjrNlGOmu18eSA9oxFjFK
         NaWkLadoMzKdkQw4ZWQUeozC5i09SaIXeQLm0IWLbHTOHea28QsUfgGu0MFk1+mAVK9q
         ltKA==
X-Gm-Message-State: AC+VfDwBtfk6PYCz1SrC8GV/MN5G5IxPxQFkZFj2ZjjEHr9gP0P+bv5l
        pdZgu83ybnLVw0GqKmEqYwe91ecnQOcddYRUTcaDfw==
X-Google-Smtp-Source: ACHHUZ6T2y5qSbWChreVWtXuHv0D3Y2Yra3f3svS/wTGHSpGOvnjNQZNnXYhK2mtJC9tcD4ulS5TUIribjNZnkuC8nQ=
X-Received: by 2002:a67:fbd8:0:b0:43f:57c5:3eca with SMTP id
 o24-20020a67fbd8000000b0043f57c53ecamr824940vsr.35.1687029865896; Sat, 17 Jun
 2023 12:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230615121419.175862-1-brgl@bgdev.pl> <20230617001644.4e093326@kernel.org>
In-Reply-To: <20230617001644.4e093326@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 17 Jun 2023 21:24:15 +0200
Message-ID: <CAMRc=Mcr=40aoXVcu2NDzz9C+GTPF-3WkyS=GEd-sQJTA9RftA@mail.gmail.com>
Subject: Re: [PATCH v2 00/23] arm64: qcom: sa8775p-ride: enable the first
 ethernet port
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
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

On Sat, Jun 17, 2023 at 9:16=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 15 Jun 2023 14:13:56 +0200 Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > There are three ethernet ports on sa8775p-ride. This series contains ch=
anges
> > required to enable one of the two 1Gb ports (the third one is 10Gb). We=
 need
> > to add a new driver for the internal SerDes PHY, introduce several exte=
nsions
> > to the MAC driver (while at it: tweak coding style a bit etc.) and fina=
lly
> > add the relevant DT nodes.
>
> Did I already ask you how do you envision this getting merged?
> You have patches here for at least 3 different trees it seems.
> Can you post the stmmac driver changes + bindings as a separate series?
>

Sure, now that bindings got reviewed, I will resend the patches
separately. Them going through different trees won't break the build.

> >  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c     | 451 ++++++++++++++++++
>
> Noob question - what's the distinction between drivers/phy and
> drivers/net/phy (or actually perhaps drivers/net/pcs in this case)?

Not sure, but it seems that most drivers in the latter are MDIO while
those in drivers/phy are all kinds of PHYs (USB, UFS, etc.).

Bart
