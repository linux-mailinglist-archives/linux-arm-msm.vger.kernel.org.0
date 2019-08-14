Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1FC8D912
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 19:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729421AbfHNRFX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 13:05:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:54232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729409AbfHNRFT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 13:05:19 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D0EB2084D;
        Wed, 14 Aug 2019 17:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565802318;
        bh=p2S5wxtRdlEoyTTI5d4Kr1BQjkHIIs2t54IZ3SRvnZ4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TFGKIjo6bCqSThrxmIMbuYC4Ps+IyPRDXCdOfQTEdUXA6nb7EmVE5+bKhKc7TKS3U
         TRFbyUfkDIyRQZF0+qzflnsnJM/SQtjPqvnh1iS2v3pSnN/kBM+kS5hfhkxfarz50Y
         1dp/A2FjLNbt51y+ZAh/JPA0v+zLSBPw48GjTScI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190814125012.8700-9-vkoul@kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-9-vkoul@kernel.org>
Subject: Re: [PATCH 08/22] arm64: dts: qcom: pm8150: Add vadc node
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 10:05:17 -0700
Message-Id: <20190814170518.9D0EB2084D@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:49:58)
> @@ -25,6 +26,33 @@
>                         };
>                 };
> =20
> +               pm8150_adc: adc@3100 {
> +                       compatible =3D "qcom,spmi-adc5";
> +                       reg =3D <0x3100>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       #io-channel-cells =3D <1>;
> +                       interrupts =3D <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING=
>;

status =3D "disabled"? I imagine there are cases where some board doesn't
want to use the ADC for anything.

> +
> +                       ref-gnd@0 {
> +                               reg =3D <ADC5_REF_GND>;
> +                               qcom,pre-scaling =3D <1 1>;
> +                               label =3D "ref_gnd";
> +                       };
> +
> +                       vref-1p25@1 {
> +                               reg =3D <ADC5_1P25VREF>;
> +                               qcom,pre-scaling =3D <1 1>;
> +                               label =3D "vref_1p25";
> +                       };
> +
> +                       die-temp@6 {
> +                               reg =3D <ADC5_DIE_TEMP>;
> +                               qcom,pre-scaling =3D <1 1>;
> +                               label =3D "die_temp";
> +                       };

Are these board level details?

> +               };
> +
>                 rtc@6000 {
>                         compatible =3D "qcom,pm8941-rtc";
>                         reg =3D <0x6000>;
> --=20
> 2.20.1
>=20
