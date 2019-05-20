Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC627239BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 16:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732355AbfETOVu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 10:21:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:48434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730819AbfETOVu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 10:21:50 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D56DA214AE;
        Mon, 20 May 2019 14:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558362110;
        bh=aa4t8FWIBI8LerwyEIQ1gJt/Otl3c5xKW6xKXA8unDU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CNpCwcHHQSE/1yTz1KVZBIAfIDw89RrtDsBeDiqtDOUYPRU/vWkx4gbky98w2yZxm
         8uqkrxHivi6k56m7g/Ftk2J8z1DVJdWjFTUV8zzmx54nilMdNdLSPYYEolpovsom59
         RWOjF5yFjXq1FhjGfY0VR0TD4bCX3NyTpup4PGDM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190516085018.2207-1-masneyb@onstation.org>
References: <20190516085018.2207-1-masneyb@onstation.org>
Subject: Re: [PATCH RESEND] ARM: dts: qcom: msm8974-hammerhead: add device tree bindings for vibrator
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Brian Masney <masneyb@onstation.org>, agross@kernel.org,
        david.brown@linaro.org
User-Agent: alot/0.8.1
Date:   Mon, 20 May 2019 07:21:49 -0700
Message-Id: <20190520142149.D56DA214AE@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Brian Masney (2019-05-16 01:50:18)
> @@ -306,6 +307,36 @@
>                                 input-enable;
>                         };
>                 };
> +
> +               vibrator_pin: vibrator {
> +                       pwm {
> +                               pins =3D "gpio27";
> +                               function =3D "gp1_clk";
> +
> +                               drive-strength =3D <6>;
> +                               bias-disable;
> +                       };
> +
> +                       enable {
> +                               pins =3D "gpio60";
> +                               function =3D "gpio";
> +                       };
> +               };
> +       };
> +
> +       vibrator@fd8c3450 {
> +               compatible =3D "qcom,msm8974-vibrator";
> +               reg =3D <0xfd8c3450 0x400>;

This is inside the multimedia clk controller. The resource reservation
mechanism should be complaining loudly here. Is the driver writing
directly into clk controller registers to adjust a duty cycle of the
camera's general purpose clk?

Can you add support for duty cycle to the qcom clk driver's RCGs and
then write a generic clk duty cycle vibrator driver that adjusts the
duty cycle of the clk? That would be better than reaching into the clk
controller registers to do this.

