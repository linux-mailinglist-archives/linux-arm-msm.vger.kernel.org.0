Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF0AA74AD65
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 10:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232308AbjGGIyg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 04:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232052AbjGGIyf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 04:54:35 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C843A129
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 01:54:33 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51de9c2bc77so1975574a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 01:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1688720072; x=1691312072;
        h=in-reply-to:references:message-id:from:subject:cc:to:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNP67nB8w4qAe9aasBZpn4WM7fGgxJQjgNj1BNpGYpk=;
        b=hm5jlRhf90It3b7MxYzK9CxhkXtifZWEuoSDJil5qOn8bvfVKI+Zn+ozr6ggX1sn3C
         2Ex8oq6zDb1bJduGSgQzfa3kbTcpyBHORIUodPQE5fWioLUyuExfrKC/9JTI4gWjQA7h
         PJgDdtgaF44JSQ9s8OlG5DcTq3y8k6niUCW48jL7xWRQZKiCgfzQ7L7a633mdynmeZ9G
         BYmsl7zMi8p0qv93Gixrg0IxflBQklDc0QvV82vgz59xMk1Od6g5X2E4+U9jWYIp8F2O
         r/iYsYXv8Xc5WZi9IfmAXoJ6X8PjUljRLOEkrJZZHMz8IkwuZZVm08k0SYaBQzIqKqUd
         zEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688720072; x=1691312072;
        h=in-reply-to:references:message-id:from:subject:cc:to:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FNP67nB8w4qAe9aasBZpn4WM7fGgxJQjgNj1BNpGYpk=;
        b=cUeXceakFU7a1px9VwzqO/NteVDkWZVwnNr2N+lzw+CiMjA7kgwJxyc+nLQfFBDnTj
         m6Gp3W2xlBWL2uJKP7+BQZ+nPmTZBNGmhjg64dFF9j1q10GriEJQr2ZEvIWA5pWJ427U
         taM+oWTRTCJZNxhrvmDeN88W6Nm+73IW1xlrJvw1/HNdgq/vO6gN7MaKJJtThNa8cjAW
         ygzQFPnFWu0a+6GAD6Ypk3d0wNFZh4R6mrtoyA2xYplPwIOuCICuFlN8UZg8f6wOiiet
         T4Br/JSxDueHUmBtVZX1fe1qSwhOuzUln0V02xIPOIvgQosv1Pyll2nhSOUvC3SsuQXZ
         s2hA==
X-Gm-Message-State: ABy/qLbwmKnMTTvyVqTQfYOgdPo70qLfT54ogMVxZX1TVPKqyt4ijgSj
        xITYDXfSMN6+1sWF8IsJ3StOrg==
X-Google-Smtp-Source: APBJJlH2Il6moenVUvYLNNLTyQ7wfbK7qH483vc4iXpIumSLrG8TYsoHy5nczH3bWWUgBs7L8H0e8Q==
X-Received: by 2002:a17:906:7c93:b0:992:5135:4106 with SMTP id w19-20020a1709067c9300b0099251354106mr3291168ejo.29.1688720072293;
        Fri, 07 Jul 2023 01:54:32 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id n7-20020a1709065e0700b009937dbabbdasm1884181eju.217.2023.07.07.01.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 01:54:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 07 Jul 2023 10:54:31 +0200
To:     "Luca Weiss" <luca.weiss@fairphone.com>,
        "Satya Priya" <quic_c_skakit@quicinc.com>,
        "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>
Cc:     "Lee Jones" <lee.jones@linaro.org>,
        "Liam Girdwood" <lgirdwood@gmail.com>,
        "Mark Brown" <broonie@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <swboyd@chromium.org>, <quic_collinsd@quicinc.com>,
        <quic_subbaram@quicinc.com>, <quic_jprakash@quicinc.com>
Subject: Re: [PATCH V15 0/9] Add Qualcomm Technologies, Inc. PM8008
 regulator driver
From:   "Luca Weiss" <luca.weiss@fairphone.com>
Message-Id: <CTVTA3OZJKG4.2ZSJ5I59AVRHO@otso>
X-Mailer: aerc 0.15.1
References: <1655200111-18357-1-git-send-email-quic_c_skakit@quicinc.com>
 <CR8I57ZATTO2.232WHNST3N2YG@otso>
In-Reply-To: <CR8I57ZATTO2.232WHNST3N2YG@otso>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri Mar 17, 2023 at 9:06 AM CET, Luca Weiss wrote:
> Hi Satya,
>
> On Tue Jun 14, 2022 at 11:48 AM CEST, Satya Priya wrote:
> > Satya Priya (9):
> >   dt-bindings: mfd: pm8008: Add reset-gpios
> >   dt-bindings: mfd: pm8008: Change the address cells
> >   dt-bindings: mfd: pm8008: Add regulators for pm8008
> >   mfd: pm8008: Add reset-gpios
> >   mfd: pm8008: Remove the regmap member from pm8008_data struct
> >   mfd: pm8008: Use i2c_new_dummy_device() API
> >   regulator: Add a regulator driver for the PM8008 PMIC
> >   arm64: dts: qcom: pm8008: Add base dts file
> >   arm64: dts: qcom: sc7280: Add pm8008 support for sc7280-idp
>
> Is there any activity on this patch series? It's been a few months since
> this revision. Would be interested in this for the pm8008 found on
> sm7225-fairphone-fp4.

Hi all,

Quick ping again, I'd really like to see this PM8008 series land.

Regards
Luca

>
> Regards
> Luca
>
> >
> >  .../devicetree/bindings/mfd/qcom,pm8008.yaml       |  69 +++++-
> >  arch/arm64/boot/dts/qcom/pm8008.dtsi               |  54 +++++
> >  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |  66 ++++++
> >  drivers/mfd/qcom-pm8008.c                          |  60 ++++-
> >  drivers/regulator/Kconfig                          |   9 +
> >  drivers/regulator/Makefile                         |   1 +
> >  drivers/regulator/qcom-pm8008-regulator.c          | 242 +++++++++++++=
++++++++
> >  include/linux/mfd/qcom_pm8008.h                    |   9 +
> >  8 files changed, 492 insertions(+), 18 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/qcom/pm8008.dtsi
> >  create mode 100644 drivers/regulator/qcom-pm8008-regulator.c
> >  create mode 100644 include/linux/mfd/qcom_pm8008.h
> >
> > --=20
> > 2.7.4

