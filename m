Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 304D121D684
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 15:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729613AbgGMNL4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 09:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729578AbgGMNLz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 09:11:55 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D5AC061755;
        Mon, 13 Jul 2020 06:11:55 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id w6so17082807ejq.6;
        Mon, 13 Jul 2020 06:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=/LcskTFE0ftRjKPkrUkg9e4RKK6cWyQd9LPAwkcR1i0=;
        b=hZKV+SG/j73cRLtgscm/TJyIzdnydZ66AbZXwMbTphprnLoRp7PIavE3QkrS1SfgEG
         hK90ffaMF3j67xJJfmR4kpuHeBuurRipPAWo1bcckI+J8H00pMlcOFh/ubztIUM/CcGH
         rX+tt0V3v1BYqWVuTrZN6fgyfYAs4vSUfuJdRLuHZHSPcT2rRbIhQ4FyjtVkxZ1ClIiZ
         LRH8OeiJnyQW4+2je7p4ZWWXCshRaU+qWhMTOGFd4ZFekv32iwJK5x0iKO0+1ENLvwYy
         ghlRSlLxGT3l0T9Tge53/iQ5QV+vjd8QJSO7YdN9mIz/lEfsT2K4HpcX+08Q6mAwod+E
         WcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=/LcskTFE0ftRjKPkrUkg9e4RKK6cWyQd9LPAwkcR1i0=;
        b=HINuQT9/eN1KQjYGmMcFEuso9QFJ9z+Sn9ygL9kkigFyj3dgQqS7dAPSEyuT7yhMB1
         XpN8hXGJqdKQf5WQEIzp/2WcfVrBN8KbuJoVDS1kWDX8ijTKhWXHojSwEsLp4jI8sJa2
         8BHoEDrrNacCO1Y10oMWxuTcmv5cEwPeJCYqz9gc+T76A/hW9jOHta1VlSOSTL4sde9s
         ZakGHKaaU+Sh6/zR+BJseTK8/s/VVSGJsAaiDgNBp5NfaMrkGt5PK1PtXGcz8cafn8NU
         DZxqiICVXQOUoGoqx2e29E9q24kxl/CT4/9yMuexpRXk4SfC7cptSlcUrHAWqVy3+A57
         a/VQ==
X-Gm-Message-State: AOAM5327C3b6OgBe2AnTDl4Kds346E87X59DstGDprxqq6pEdSenNw+c
        yXPAKtrcoPITtesbH86t9VQ=
X-Google-Smtp-Source: ABdhPJzqKrgmo4lKRir8KbulNZTXvb76s7hasIFMZVuNbjy0t50dr1lBBC95p7fNtwPq1t+mPzKpzw==
X-Received: by 2002:a17:906:3acd:: with SMTP id z13mr56514418ejd.69.1594645914066;
        Mon, 13 Jul 2020 06:11:54 -0700 (PDT)
Received: from AnsuelXPS (host-87-16-250-131.retail.telecomitalia.it. [87.16.250.131])
        by smtp.gmail.com with ESMTPSA id u18sm11430586edx.34.2020.07.13.06.11.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jul 2020 06:11:53 -0700 (PDT)
From:   <ansuelsmth@gmail.com>
To:     "'Vinod Koul'" <vkoul@kernel.org>
Cc:     "'Andy Gross'" <agross@codeaurora.org>,
        "'Jonathan McDowell'" <noodles@earth.li>,
        "'Andy Gross'" <agross@kernel.org>,
        "'Bjorn Andersson'" <bjorn.andersson@linaro.org>,
        "'Kishon Vijay Abraham I'" <kishon@ti.com>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Mark Rutland'" <mark.rutland@arm.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20200615205333.20747-1-ansuelsmth@gmail.com> <20200713053255.GY34333@vkoul-mobl>
In-Reply-To: <20200713053255.GY34333@vkoul-mobl>
Subject: R: [RESEND PATCH v7 1/2] phy: qualcomm: add qcom ipq806x dwc usb phy driver
Date:   Mon, 13 Jul 2020 15:11:48 +0200
Message-ID: <019d01d65917$2bff9ba0$83fed2e0$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: it
Thread-Index: AQJO0Cndc+Pketd50VjNHRY/HVB9ygG/2AhjqAaOrYA=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Messaggio originale-----
> Da: Vinod Koul <vkoul@kernel.org>
> Inviato: luned=EC 13 luglio 2020 07:33
> A: Ansuel Smith <ansuelsmth@gmail.com>
> Cc: Andy Gross <agross@codeaurora.org>; Jonathan McDowell
> <noodles@earth.li>; Andy Gross <agross@kernel.org>; Bjorn Andersson
> <bjorn.andersson@linaro.org>; Kishon Vijay Abraham I <kishon@ti.com>;
> Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; linux-arm-msm@vger.kernel.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org
> Oggetto: Re: [RESEND PATCH v7 1/2] phy: qualcomm: add qcom ipq806x
> dwc usb phy driver
>=20
> On 15-06-20, 22:53, Ansuel Smith wrote:
>=20
> > @@ -0,0 +1,593 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* Copyright (c) 2014-2015, Code Aurora Forum. All rights reserved.
> > + *
> > + * This program is free software; you can redistribute it and/or =
modify
> > + * it under the terms of the GNU General Public License version 2 =
and
> > + * only version 2 as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
>=20
> You have SPDX tag, so we dont need the license text, please remove =
this.
> Also we are in 2020 now so Copyright looks incorrect
>=20
> > +static int qcom_ipq806x_usb_ss_phy_init(struct phy *phy)
> > +{
> > +	struct usb_phy *phy_dwc3 =3D phy_get_drvdata(phy);
> > +	int ret;
> > +	u32 data =3D 0;
>=20
> Superfluous init
>=20
> > +static int qcom_ipq806x_usb_phy_probe(struct platform_device *pdev)
> > +{
> > +	struct usb_phy	*phy_dwc3;
> > +	struct phy_provider		*phy_provider;
> > +	struct phy			*generic_phy;
> > +	const struct of_device_id *match;
> > +	const struct phy_drvdata *data;
> > +	struct resource			*res;
> > +	resource_size_t			size;
>=20
> Pls pick one, tabs or single spaces, not both. and reverse christmas
> looks better :)
>=20
> > +	struct device_node *np;
> > +
> > +	phy_dwc3 =3D devm_kzalloc(&pdev->dev, sizeof(*phy_dwc3),
> GFP_KERNEL);
> > +	if (!phy_dwc3)
> > +		return -ENOMEM;
> > +
> > +	match =3D of_match_node(qcom_ipq806x_usb_phy_table, pdev-
> >dev.of_node);
> > +	data =3D match->data;
>=20
> How about using of_device_get_match_data() instead?
> --
> ~Vinod

match is also used in the function to compare compatible.=20

