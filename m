Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7421FA970E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 01:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730456AbfIDXXH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 19:23:07 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37349 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730032AbfIDXXH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 19:23:07 -0400
Received: by mail-pg1-f196.google.com with SMTP id d1so288458pgp.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 16:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=lphsBie2JSPrEUQ5VneXuMojjEkJzSMY/OrsBG/BydQ=;
        b=a8j7VVK8er6IJw91u+NvdDPk2ijqJGtLrIv1MkWa0sCQf5kqLdJYUZ/SWNW12ydLao
         zCvU8l9hw5aKSe1mvG/BPwT1yuVIEVuPnun0X7NC9b5mWL5//gVpFBPtlVOmytZo91px
         ETFMKqh9wU1Ttq/T1Yx+3KL8kytlWVgUJQbfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=lphsBie2JSPrEUQ5VneXuMojjEkJzSMY/OrsBG/BydQ=;
        b=LW9kAsnnHHg80a3YJeMxoiMroh3bYIX33Kk4u1w+OeOaTDMMicLSLLVk65ClPoixBp
         Vn5eHkZvUKJIb2UX9jqE9rso4+Mx87RqpBw2hE2VX4WFk8ka6PZXMCNGEfOHu0oZEx80
         FdP4VzS1/MeEvVEONw22doTWT5NwRCpAIVqDCtn4r/+6mT6L7eiIsyai+d4GpK//WAjd
         YNFWGFRuzdaX+5UAA90m9LcxDdpOLW+TKpUcjeRDgfhi5gTzeEyh86JwLGmZVYTdAXR4
         MqYR+wQIZS5OE7dRSXePVQk3ipgJ3M+wYFQYQzKcKVucwP+2t2bBJWQ6QjAuVxJlztA6
         Bp4Q==
X-Gm-Message-State: APjAAAUHxAdAXSM7HYhH8Kl8N7un80/HylDSDMhQU9c5JiPL/SG1BwPy
        7VyD7AWWe9C520yfiyfrjvLlrKrD4/7iKg==
X-Google-Smtp-Source: APXvYqxu+d8OGsxHVrHtrfwnaDEw2e+JR8t1WqEtXjbxB5d/zhpcvmj7dPTA26D0ItyguUMbrdtT2Q==
X-Received: by 2002:a62:168e:: with SMTP id 136mr255170pfw.144.1567639386396;
        Wed, 04 Sep 2019 16:23:06 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id y13sm144265pfm.164.2019.09.04.16.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 16:23:06 -0700 (PDT)
Message-ID: <5d70475a.1c69fb81.650ed.0ad0@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190904100835.6099-4-vkoul@kernel.org>
References: <20190904100835.6099-1-vkoul@kernel.org> <20190904100835.6099-4-vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] phy: qcom-qmp: Add SM8150 QMP UFS PHY support
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Wed, 04 Sep 2019 16:23:05 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-09-04 03:08:35)
> @@ -878,6 +883,93 @@ static const struct qmp_phy_init_tbl msm8998_usb3_pc=
s_tbl[] =3D {
>         QMP_PHY_INIT_CFG(QPHY_V3_PCS_RXEQTRAINING_RUN_TIME, 0x13),
>  };
> =20
> +static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] =3D {
> +       QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_SYSCLK_EN_SEL, 0xD9),

Can you use lowercase hex?

> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_HSCLK_SEL, 0x11),
> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_HSCLK_HS_SWITCH_SEL, 0x00),
> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_LOCK_CMP_EN, 0x01),
> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_VCO_TUNE_MAP, 0x02),
> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_PLL_IVCO, 0x0F),
> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_VCO_TUNE_INITVAL2, 0x00),
> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_BIN_VCOCAL_HSCLK_SEL, 0x11),
> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_DEC_START_MODE0, 0x82),
> +       QMP_PHY_INIT_CFG(QSERDES_COM_V4_CP_CTRL_MODE0, 0x06),

Gotta love the pile of numbers and register writes...

